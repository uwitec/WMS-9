/**  
 * @Title: ReceiveBean.java
 * @Package com.make.bean
 * @Description: TODO
 * @author zhengjf
 * @date 2016-4-20
 */
package com.make.bean;

/**
 * ClassName: ReceiveBean
 * 
 * @Description: 收货管理实体类
 * @author zhengjf
 * @date 2016-4-20
 */
public class ReceiveBean {
	/** 主键ID */
	private int id;
	/** 收货数量 */
	private int count;
	/** 时间 */
	private String thDate;
	/** 提货人 */
	private String thMan;
	/** 提货车辆 */
	private String thCar;
	/** 实际数量 */
	private int realCount;
	/** 状态(0:删除 1：提货 2：验货 3：分库 4：入库跟踪 5：入库完成) */
	private int status;

	/** 外键零件名称 */
	private int fk_ljID;
	/** 外键包装名称 */
	private int fk_bzID;

	/** 包装类型名称 */
	private String packName;
	/** 外键零件名称 */
	private String ljname;
	/** 客户名称 */
	private String consumerName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getThDate() {
		return thDate;
	}

	public void setThDate(String thDate) {
		this.thDate = thDate;
	}

	public String getThMan() {
		return thMan;
	}

	public void setThMan(String thMan) {
		this.thMan = thMan;
	}

	public String getThCar() {
		return thCar;
	}

	public void setThCar(String thCar) {
		this.thCar = thCar;
	}

	public int getRealCount() {
		return realCount;
	}

	public void setRealCount(int realCount) {
		this.realCount = realCount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getFk_ljID() {
		return fk_ljID;
	}

	public void setFk_ljID(int fk_ljID) {
		this.fk_ljID = fk_ljID;
	}

	public int getFk_bzID() {
		return fk_bzID;
	}

	public void setFk_bzID(int fk_bzID) {
		this.fk_bzID = fk_bzID;
	}

	public String getPackName() {
		return packName;
	}

	public void setPackName(String packName) {
		this.packName = packName;
	}

	public String getLjname() {
		return ljname;
	}

	public void setLjname(String ljname) {
		this.ljname = ljname;
	}

	public String getConsumerName() {
		return consumerName;
	}

	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}

}
