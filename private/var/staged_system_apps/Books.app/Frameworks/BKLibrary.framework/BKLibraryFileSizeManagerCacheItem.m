@interface BKLibraryFileSizeManagerCacheItem
+ (BOOL)supportsSecureCoding;
- (BKLibraryFileSizeManagerCacheItem)initWithCoder:(id)a3;
- (NSDate)fileOnDiskLastTouchDate;
- (NSNumber)fileSizeNumber;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFileOnDiskLastTouchDate:(id)a3;
- (void)setFileSizeNumber:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation BKLibraryFileSizeManagerCacheItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKLibraryFileSizeManagerCacheItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKLibraryFileSizeManagerCacheItem;
  v5 = [(BKLibraryFileSizeManagerCacheItem *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    [(BKLibraryFileSizeManagerCacheItem *)v5 setFileURL:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileOnDiskLastTouchDate"];
    [(BKLibraryFileSizeManagerCacheItem *)v5 setFileOnDiskLastTouchDate:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileSize"];
    [(BKLibraryFileSizeManagerCacheItem *)v5 setFileSizeNumber:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryFileSizeManagerCacheItem *)self fileURL];
  [v4 encodeObject:v5 forKey:@"fileURL"];

  v6 = [(BKLibraryFileSizeManagerCacheItem *)self fileOnDiskLastTouchDate];
  [v4 encodeObject:v6 forKey:@"fileOnDiskLastTouchDate"];

  id v7 = [(BKLibraryFileSizeManagerCacheItem *)self fileSizeNumber];
  [v4 encodeObject:v7 forKey:@"fileSize"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  if (v4)
  {
    v5 = [(BKLibraryFileSizeManagerCacheItem *)self fileURL];
    [v4 setFileURL:v5];

    v6 = [(BKLibraryFileSizeManagerCacheItem *)self fileOnDiskLastTouchDate];
    [v4 setFileOnDiskLastTouchDate:v6];

    id v7 = [(BKLibraryFileSizeManagerCacheItem *)self fileSizeNumber];
    [v4 setFileSizeNumber:v7];
  }
  return v4;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSDate)fileOnDiskLastTouchDate
{
  return self->_fileOnDiskLastTouchDate;
}

- (void)setFileOnDiskLastTouchDate:(id)a3
{
}

- (NSNumber)fileSizeNumber
{
  return self->_fileSizeNumber;
}

- (void)setFileSizeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSizeNumber, 0);
  objc_storeStrong((id *)&self->_fileOnDiskLastTouchDate, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end