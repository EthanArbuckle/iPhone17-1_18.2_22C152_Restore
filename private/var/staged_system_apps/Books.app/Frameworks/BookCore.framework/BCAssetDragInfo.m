@interface BCAssetDragInfo
- (BCAssetDragInfo)initWithDragInfo:(id)a3;
- (BOOL)isSample;
- (NSDate)modificationDate;
- (NSString)assetID;
- (NSString)author;
- (NSString)storeID;
- (NSString)title;
- (NSURL)localFileURL;
- (NSURL)storeURL;
- (double)fileSizeInMegaBytes;
- (int64_t)contentType;
- (int64_t)fileSize;
- (void)setAssetID:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setContentType:(int64_t)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setFileSizeInMegaBytes:(double)a3;
- (void)setIsSample:(BOOL)a3;
- (void)setLocalFileURL:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BCAssetDragInfo

- (BCAssetDragInfo)initWithDragInfo:(id)a3
{
  id v4 = a3;
  v5 = [(BCAssetDragInfo *)self init];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"kind"];
    v7 = BUDynamicCast();
    v5->_contentType = (int64_t)[v7 integerValue];

    objc_opt_class();
    v8 = [v4 objectForKeyedSubscript:@"assetID"];
    uint64_t v9 = BUDynamicCast();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v9;

    objc_opt_class();
    v11 = [v4 objectForKeyedSubscript:@"author"];
    uint64_t v12 = BUDynamicCast();
    author = v5->_author;
    v5->_author = (NSString *)v12;

    objc_opt_class();
    v14 = [v4 objectForKeyedSubscript:@"title"];
    uint64_t v15 = BUDynamicCast();
    title = v5->_title;
    v5->_title = (NSString *)v15;

    objc_opt_class();
    v17 = [v4 objectForKeyedSubscript:@"storeURL"];
    v18 = BUDynamicCast();

    if ([v18 length])
    {
      uint64_t v19 = +[NSURL URLWithString:v18];
      storeURL = v5->_storeURL;
      v5->_storeURL = (NSURL *)v19;
    }
    objc_opt_class();
    v21 = [v4 objectForKeyedSubscript:@"fileURL"];
    v22 = BUDynamicCast();

    if ([v22 length])
    {
      uint64_t v23 = +[NSURL URLWithString:v22];
      localFileURL = v5->_localFileURL;
      v5->_localFileURL = (NSURL *)v23;
    }
    objc_opt_class();
    v25 = [v4 objectForKeyedSubscript:@"fileSize"];
    v26 = BUDynamicCast();
    v5->_fileSize = (int64_t)[v26 longLongValue];

    objc_opt_class();
    v27 = [v4 objectForKeyedSubscript:@"isSample"];
    v28 = BUDynamicCast();
    v5->_isSample = [v28 BOOLValue];
  }
  return v5;
}

- (double)fileSizeInMegaBytes
{
  return (double)[(BCAssetDragInfo *)self fileSize] / 1000000.0;
}

- (void)setFileSizeInMegaBytes:(double)a3
{
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (NSURL)localFileURL
{
  return self->_localFileURL;
}

- (void)setLocalFileURL:(id)a3
{
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (BOOL)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(BOOL)a3
{
  self->_isSample = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localFileURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end