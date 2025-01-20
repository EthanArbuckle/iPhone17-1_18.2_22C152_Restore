@interface BCMutableReadingStatisticsSync
- (BCMutableReadingStatisticsSync)initWithAssetID:(id)a3;
- (BCMutableReadingStatisticsSync)initWithCloudData:(id)a3;
- (BCMutableReadingStatisticsSync)initWithRecord:(id)a3;
- (NSData)readingStatisticsBook;
- (NSString)assetID;
- (NSString)assetVersion;
- (NSString)debugDescription;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)setAssetVersion:(id)a3;
- (void)setReadingStatisticsBook:(id)a3;
@end

@implementation BCMutableReadingStatisticsSync

- (BCMutableReadingStatisticsSync)initWithAssetID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = BCCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1ECD74();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableReadingStatisticsSync;
  id v5 = [(BCMutableReadingStatisticsSync *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableReadingStatisticsSync *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;
LABEL_7:
  }
  return (BCMutableReadingStatisticsSync *)v5;
}

- (BCMutableReadingStatisticsSync)initWithCloudData:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BCMutableReadingStatisticsSync;
  id v5 = [(BCMutableReadingStatisticsSync *)&v18 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 assetID];
      objc_super v9 = (NSString *)[v8 copy];
      assetID = v5->_assetID;
      v5->_assetID = v9;

      v11 = [v7 assetVersion];
      v12 = (NSString *)[v11 copy];
      assetVersion = v5->_assetVersion;
      v5->_assetVersion = v12;

      uint64_t v14 = [v7 readingStatisticsBook];
      readingStatisticsBook = v5->_readingStatisticsBook;
      v5->_readingStatisticsBook = (NSData *)v14;
    }
    else
    {
      v16 = BCCloudKitLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1ECDA8();
      }

      readingStatisticsBook = v5;
      id v5 = 0;
    }
  }
  return v5;
}

- (BCMutableReadingStatisticsSync)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v11 = BCCloudKitLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1ECDDC();
    }
    id v5 = 0;
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)BCMutableReadingStatisticsSync;
  id v5 = [(BCMutableReadingStatisticsSync *)&v15 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    uint64_t v8 = [v4 objectForKey:@"assetVersion"];
    objc_super v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    objc_opt_class();
    v10 = [v4 objectForKey:@"assetStatistics"];
    BUDynamicCast();
    self = (BCMutableReadingStatisticsSync *)objc_claimAutoreleasedReturnValue();

    v11 = [(BCMutableReadingStatisticsSync *)self fileURL];
    if (v11)
    {
      uint64_t v12 = +[NSData dataWithContentsOfURL:v11];
      v13 = *((void *)v5 + 3);
      *((void *)v5 + 3) = v12;
    }
    else
    {
      v13 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1ECE10((uint64_t *)v5 + 1, v13);
      }
    }

LABEL_11:
  }

  return (BCMutableReadingStatisticsSync *)v5;
}

- (NSString)debugDescription
{
  v3 = [(BCMutableReadingStatisticsSync *)self assetID];
  id v4 = [(BCMutableReadingStatisticsSync *)self assetVersion];
  id v5 = [(BCMutableReadingStatisticsSync *)self readingStatisticsBook];
  uint64_t v6 = +[NSString stringWithFormat:@"assetID: %@, assetVersion: %@, statistics: %@", v3, v4, v5];

  return (NSString *)v6;
}

- (id)recordType
{
  return @"assetReadingStatistics";
}

- (id)zoneName
{
  return kBCCloudKitZoneReadingStatistics;
}

- (id)configuredRecordFromAttributes
{
  v12.receiver = self;
  v12.super_class = (Class)BCMutableReadingStatisticsSync;
  v3 = [(BCMutableReadingStatisticsSync *)&v12 configuredRecordFromAttributes];
  id v4 = [(BCMutableReadingStatisticsSync *)self assetVersion];
  [v3 setObject:v4 forKey:@"assetVersion"];

  id v5 = +[BCReadingStatisticsSyncManager sharedInstance];
  uint64_t v6 = [(BCMutableReadingStatisticsSync *)self assetID];
  v7 = [v5 fileURLForCachingCKAssetWithAssetID:v6];

  uint64_t v8 = [(BCMutableReadingStatisticsSync *)self readingStatisticsBook];
  LODWORD(v5) = [v8 writeToURL:v7 atomically:1];

  if (v5)
  {
    id v9 = [objc_alloc((Class)CKAsset) initWithFileURL:v7];
    [v3 setObject:v9 forKey:@"assetStatistics"];
  }
  else
  {
    v10 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ECE8C();
    }

    [v3 setObject:0 forKey:@"assetStatistics"];
  }

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSData)readingStatisticsBook
{
  return self->_readingStatisticsBook;
}

- (void)setReadingStatisticsBook:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingStatisticsBook, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end