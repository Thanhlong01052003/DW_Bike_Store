# Bike Store Data Warehouse

## 1. Lý do chọn đề tài
Dự án xây dựng kho dữ liệu cho cửa hàng bán xe đạp nhằm:
- Quản lý thông tin sản phẩm, khách hàng, doanh số.
- Hỗ trợ phân tích dữ liệu, xác định xu hướng, dự đoán nhu cầu và tối ưu chiến lược kinh doanh.
- Thúc đẩy phát triển bền vững trong ngành xe đạp.

## 2. Tổng quan về tập dữ liệu
### 2.1. Nguồn dữ liệu
- Cơ sở dữ liệu: **BikeStores Sample Database**.
- Nguồn: [SQL Server Tutorial](https://sqlservertutorial.net/)

### 2.2. Mô tả tập dữ liệu
Cơ sở dữ liệu gồm 9 bảng:

| Tên bảng              | Mô tả                                  | Số dòng |
|-----------------------|----------------------------------------|---------|
| production.categories | Danh mục sản phẩm                    | 7       |
| production.brands     | Thương hiệu sản phẩm                 | 9       |
| production.products   | Thông tin sản phẩm                   | 321     |
| sales.customers       | Thông tin khách hàng                 | 1445    |
| sales.stores          | Thông tin cửa hàng                   | 3       |
| sales.staffs          | Thông tin nhân viên                  | 10      |
| sales.orders          | Thông tin đơn hàng                   | 1615    |
| sales.order_items     | Chi tiết đơn hàng                    | 4722    |
| production.stocks     | Tồn kho sản phẩm tại cửa hàng        | 939     |

### 2.3. Cấu trúc bảng chính
- **production.categories**: Lưu thông tin danh mục.
- **production.brands**: Lưu thông tin thương hiệu.
- **production.products**: Quản lý sản phẩm (brand, category, model_year, list_price).
- **sales.customers**: Thông tin khách hàng (tên, email, địa chỉ, số điện thoại).
- **sales.stores**: Thông tin cửa hàng (tên, địa chỉ, email).
- **sales.staffs**: Nhân viên (tên, email, trạng thái, cửa hàng, quản lý).
- **sales.orders**: Đơn hàng (trạng thái, ngày đặt, giao hàng, cửa hàng, nhân viên).
- **sales.order_items**: Chi tiết đơn hàng (sản phẩm, số lượng, giá, giảm giá).
- **production.stocks**: Tồn kho tại cửa hàng.

## 3. Công cụ sử dụng
- **Visual Studio 2022**: Tích hợp SSIS, SSAS.
- **SQL Server Management Studio 20**.
- **Microsoft Excel**.
- **Microsoft Power BI**.
