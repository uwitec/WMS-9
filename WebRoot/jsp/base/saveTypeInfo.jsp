<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include.top.jsp"%>
<script type="text/javascript">
	function linkPage(id) {
		$("#stId").val(id);
		$.ajax({
			type : "post",
			async : true,
			url : "save/linkPage.do",
			datatype : "json",//请求页面返回的数据类型     
			data : {
				"id" : id
			},
			async : false,
			/* error : function(request) {
				alert("编辑请求返回失败!");
			}, */
			success : function(data) {
				//对象先转字符串
				var tmp = eval('(' + data + ')');
				//后台返回数组用这个解析
				//var resJSON = eval(data);
				if (parseInt(id) > 0) {
					$("#saveType").val(tmp.saveType);
					$("#comments").val(tmp.comments);
				} else {
					$("#saveType").val("");
					$("#comments").val("");
				}
			}
		});
		openModal();
	}

	function saveInfo() {
		var type = $("#saveType").val();
		if (type == "") {
			$("#msgDiv").show();
			$("#msg").text("存储类型不能为空！");
			return;
		} else {
			$("#msgDiv").hide();
			$("#msg").text("");
		}

		$("#saveForm").submit();
	}
</script>
<div class="container-fluid">
	<div class="row">
		<%@ include file="../top.jsp"%>
	</div>
	<div class="row" style="padding-left: 0">
		<div class="col-md-2" style="padding-left: 10">
			<%@ include file="../left.jsp"%>
		</div>
		<div class="col-md-10">
			<h2>存储类型管理</h2>
			<hr>
			<form action="save/seach.do" class="form-horizontal" method="post">
				<div class="row">
					<div class="col-lg-2">
						<button type="button" class="btn btn-primary" data-toggle="modal" onclick="linkPage(0)">添加存储类型</button>
					</div>
					<div class="col-lg-2">
						<!-- <div class="input-group">
								<input type="text" class="form-control" placeholder="标题...">
							</div> -->
						<!-- /input-group -->
					</div>
					<div class="col-lg-2">
						<!-- <div class="input-group">
								<span class="input-group-btn"> <input type="text"
									class="form-control" placeholder="内容...">
							</div> -->
						<!-- /input-group -->
					</div>
					<div class="col-lg-2">
						<!--  -->
					</div>
					<div class="col-lg-2">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="存储类型..." name="seachSaveType" value="${item.saveType }">
						</div>
						<!-- /input-group -->
					</div>

					<div class="col-lg-2">
						<div class="input-group">
							<input type="submit" value="查询" class="btn">
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
			</form>


			<div class="table-responsive ">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="success">
							<td class="text-center">序号</td>
							<td class="text-center">存储类型</td>
							<td class="text-center">备注</td>
							<td class="text-center">创建时间</td>
							<td class="text-center">创建人</td>
							<td class="text-center">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item" varStatus="staturs">
							<tr>
								<td>${staturs.index+1}</td>
								<td><c:out value="${item.saveType}" /></td>
								<td><c:out value="${item.comments}" /></td>
								<td><c:out value="${item.creatDate}" /></td>
								<td><c:out value="${item.owner}" /></td>
								<td><a onClick="linkPage('${item.id}')">编辑</a> || <a onClick="openMassageModal('${item.id}')">删除</a>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<ul class="pagination">
				<li><a href="#">上一页</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">下一页</a></li>
			</ul>
		</div>
	</div>
</div>
<form action="save/save.do" class="form-horizontal" role="form" method="post" id="saveForm">
	<div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" id="gridSystemModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">存储类型</h4>
				</div>
				<div class="modal-body" style="padding-bottom: 0">
					<div class="form-group">
						<label for="inputTitle" class="col-md-2 control-label">存储类型</label>
						<div class="col-md-10">
							<input type="hidden" class="form-control" id="stId" name="stId">
							<input type="text" class="form-control" id="saveType" name="saveType">
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-md-2 control-label">备注信息</label>
						<div class="col-md-10">
							<!-- 	<input type="texta" class="form-control" id="inputTitle"
									name="username"> -->
							<textarea rows="8" class="form-control" id="comments" name="comments"></textarea>
						</div>
					</div>
					<div class="alert alert-danger sm" id="msgDiv" style="display: none;padding-bottom: 0;padding-top: 0;padding-left: 40px;">
						<label id="msg"></label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="saveInfo()">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</form>

<!-- message -->
<form action="save/delete.do" method="post">
	<div class="modal fade" role="dialog" aria-labelledby="messageModalLabel" id="messageModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="messageModalLabel">消息</h3>
				</div>
				<div class="modal-body" style="padding-bottom: 0px">
					<div class="alert alert-warning" role="alert" style="padding-top: 0px">
						<h3>
							<input type="hidden" id="deleteId" name="deleteId">
							<span class="glyphicon glyphicon-question-sign" aria-hidden="true" />
							是否确定删除选择的数据？
						</h3>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">确定</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- message -->
<%@ include file="/include.foot.jsp"%>