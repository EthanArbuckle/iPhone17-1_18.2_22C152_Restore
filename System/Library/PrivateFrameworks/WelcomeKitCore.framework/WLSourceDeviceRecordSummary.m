@interface WLSourceDeviceRecordSummary
+ (WLSourceDeviceRecordSummary)summaryWithInfo:(id)a3 account:(id)a4;
+ (id)_numberFormatter;
- (BOOL)didDownload;
- (BOOL)storeDataAsFile;
- (NSDate)modifiedDate;
- (NSDictionary)metadata;
- (NSString)bucket;
- (NSString)dataFilePath;
- (NSString)identifier;
- (NSString)relativePath;
- (WLSourceDeviceAccount)account;
- (WLSourceDeviceRecordSummary)initWithInfo:(id)a3 account:(id)a4;
- (unint64_t)downloadSegmentCount;
- (unint64_t)itemSize;
- (unint64_t)sqlID;
- (void)setAccount:(id)a3;
- (void)setBucket:(id)a3;
- (void)setDataFilePath:(id)a3;
- (void)setDidDownload:(BOOL)a3;
- (void)setDownloadSegmentCount:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemSize:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)setSqlID:(unint64_t)a3;
- (void)setStoreDataAsFile:(BOOL)a3;
@end

@implementation WLSourceDeviceRecordSummary

+ (WLSourceDeviceRecordSummary)summaryWithInfo:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[WLSourceDeviceRecordSummary alloc] initWithInfo:v6 account:v5];

  return v7;
}

+ (id)_numberFormatter
{
  if (_numberFormatter_onceToken != -1) {
    dispatch_once(&_numberFormatter_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_numberFormatter_numberFormatter;
  return v2;
}

uint64_t __47__WLSourceDeviceRecordSummary__numberFormatter__block_invoke()
{
  _numberFormatter_numberFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08A30]);
  return MEMORY[0x270F9A758]();
}

- (WLSourceDeviceRecordSummary)initWithInfo:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WLSourceDeviceRecordSummary *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    uint64_t v10 = [v6 objectForKeyedSubscript:@"itemID"];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v12 = [v6 objectForKeyedSubscript:@"itemSize"];
    if (v12)
    {
      v13 = +[WLSourceDeviceRecordSummary _numberFormatter];
      v14 = [v13 numberFromString:v12];
      v9->_itemSize = [v14 unsignedIntegerValue];
    }
    else
    {
      v9->_itemSize = 0;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"relativePath"];
    relativePath = v9->_relativePath;
    v9->_relativePath = (NSString *)v15;

    v17 = [v6 objectForKeyedSubscript:@"metaData"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 length])
    {
      v18 = [v17 dataUsingEncoding:4];
      id v31 = 0;
      uint64_t v19 = [MEMORY[0x263F08900] JSONObjectWithData:v18 options:0 error:&v31];
      id v20 = v31;
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v19;

      if (v20)
      {
        v29 = v17;
        id v30 = v20;
        v28 = v9;
        _WLLog();
      }
    }
    v22 = objc_msgSend(v6, "objectForKeyedSubscript:", @"bucket", v28, v29, v30);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v24 = [v22 stringByTrimmingCharactersInSet:v23];

      if ([v24 length])
      {
        v25 = [v24 lowercaseString];
        char v26 = [v25 isEqualToString:@"camera"];

        if ((v26 & 1) == 0) {
          [(WLSourceDeviceRecordSummary *)v9 setBucket:v22];
        }
      }
    }
  }

  return v9;
}

- (WLSourceDeviceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)storeDataAsFile
{
  return self->_storeDataAsFile;
}

- (void)setStoreDataAsFile:(BOOL)a3
{
  self->_storeDataAsFile = a3;
}

- (NSString)dataFilePath
{
  return self->_dataFilePath;
}

- (void)setDataFilePath:(id)a3
{
}

- (unint64_t)downloadSegmentCount
{
  return self->_downloadSegmentCount;
}

- (void)setDownloadSegmentCount:(unint64_t)a3
{
  self->_downloadSegmentCount = a3;
}

- (BOOL)didDownload
{
  return self->_didDownload;
}

- (void)setDidDownload:(BOOL)a3
{
  self->_didDownload = a3;
}

- (NSString)bucket
{
  return self->_bucket;
}

- (void)setBucket:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_dataFilePath, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end