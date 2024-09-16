-- Tạo cơ sở dữ liệu
CREATE DATABASE quanlythuvien;

-- Sử dụng cơ sở dữ liệu
USE quanlythuvien;
-- Tạo bảng BookType
CREATE TABLE BookType (
    TypeId INT PRIMARY KEY AUTO_INCREMENT,  -- Mã loại sách
    TypeName VARCHAR(50) NOT NULL UNIQUE,    -- Tên loại sách
    Description TEXT,                        -- Mô tả loại sách
    IsDeleted BIT DEFAULT 0                  -- Trạng thái xóa (0: chưa xóa, 1: đã xóa)
);

-- Tạo bảng Book
CREATE TABLE Book (
    BookId INT PRIMARY KEY AUTO_INCREMENT,    -- Mã sách
    BookName VARCHAR(100) NOT NULL UNIQUE,    -- Tên sách
    Title VARCHAR(200) NOT NULL,              -- Tiêu đề sách
    Author VARCHAR(200) NOT NULL,             -- Tác giả
    TotalPages INT NOT NULL CHECK (TotalPages > 0),  -- Số trang sách
    Content TEXT NOT NULL,                    -- Nội dung sách
    Publisher VARCHAR(100) NOT NULL,          -- Nhà xuất bản
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0), -- Giá sách
    TypeId INT NOT NULL,                      -- Mã loại sách (FK)
    IsDeleted BIT DEFAULT 0,                  -- Trạng thái xóa (0: chưa xóa, 1: đã xóa)
    FOREIGN KEY (TypeId) REFERENCES BookType(TypeId)  -- Khóa ngoại tham chiếu đến bảng BookType
);
INSERT INTO BookType (TypeName, Description, IsDeleted) VALUES
('Văn học', 'Các tác phẩm văn học', 0),
('Khoa học', 'Sách về khoa học và công nghệ', 0),
('Lịch sử', 'Sách về lịch sử thế giới và Việt Nam', 0);
INSERT INTO Book (BookName, Title, Author, TotalPages, Content, Publisher, Price, TypeId, IsDeleted) VALUES
('Đắc Nhân Tâm', 'Đắc Nhân Tâm', 'Dale Carnegie', 300, 'Cuốn sách hướng dẫn các nguyên tắc trong giao tiếp', 'NXB Trẻ', 150000.00, 1, 0),
('Giải thích vũ trụ', 'Giải thích vũ trụ', 'Stephen Hawking', 200, 'Cuốn sách giới thiệu về các hiện tượng vật lý', 'NXB Khoa học', 220000.00, 2, 0),
('Sử Việt qua các triều đại', 'Sử Việt qua các triều đại', 'Nguyễn Khắc Thuần', 350, 'Tóm tắt lịch sử Việt Nam', 'NXB Sử học', 180000.00, 3, 0);

