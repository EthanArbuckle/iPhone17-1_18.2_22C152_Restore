@interface BCReadingStatisticsSync
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromReadingStatistics:(id)a3 withMergers:(id)a4;
- (void)_mergeInAssetID:(id)a3 assetVersion:(id)a4 serializedData:(id)a5;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCReadingStatisticsSync

- (id)mutableCopy
{
  v3 = [BCMutableReadingStatisticsSync alloc];

  return [(BCMutableReadingStatisticsSync *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCReadingStatisticsSync *)self _configureFromReadingStatistics:v6 withMergers:v5];
  }
  else
  {
    v7 = BCCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1EC7F4();
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = BUProtocolCast();
  v17.receiver = self;
  v17.super_class = (Class)BCReadingStatisticsSync;
  LOBYTE(v4) = [(BCReadingStatisticsSync *)&v17 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  v8 = [(BCReadingStatisticsSync *)self assetID];
  v9 = [v7 assetID];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  v11 = [(BCReadingStatisticsSync *)self assetVersion];
  uint64_t v12 = [v7 assetVersion];
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  v14 = [(BCReadingStatisticsSync *)self readingStatisticsBook];
  v15 = [v7 readingStatisticsBook];
  LOBYTE(v12) = [v14 isEqual:v15];

  return v4 & v10 & v13 & v12;
}

- (void)_configureFromReadingStatistics:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BCReadingStatisticsSync;
  [(BCReadingStatisticsSync *)&v11 configureFromCloudData:v6 withMergers:a4];
  v7 = [v6 assetID];
  v8 = [v6 assetVersion];
  v9 = [v6 readingStatisticsBook];
  [(BCReadingStatisticsSync *)self _mergeInAssetID:v7 assetVersion:v8 serializedData:v9];

  unsigned __int8 v10 = BCCloudKitLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1EC828(self, v6, v10);
  }
}

- (void)_mergeInAssetID:(id)a3 assetVersion:(id)a4 serializedData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = objc_alloc_init(BCReadingStatisticsProtoBook);
  v84 = v10;
  id v12 = [objc_alloc((Class)PBDataReader) initWithData:v10];
  if (!BCReadingStatisticsProtoBookReadFrom((char *)v11, (uint64_t)v12))
  {
    v50 = BCCloudKitLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_1ECA40(self);
    }
    goto LABEL_60;
  }
  unsigned __int8 v13 = [(BCReadingStatisticsSync *)self assetID];
  unsigned __int8 v14 = [v13 isEqualToString:v8];

  if ((v14 & 1) == 0)
  {
    v15 = BCCloudKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1EC994(self, (uint64_t)v8, v15);
    }

    [(BCReadingStatisticsSync *)self setAssetID:v8];
  }
  v16 = objc_alloc_init(BCReadingStatisticsProtoBook);
  [(BCReadingStatisticsProtoBook *)v16 setAssetID:v8];
  objc_super v17 = +[BCReadingStatisticsSyncManager sharedInstance];
  v18 = [v17 _appVersion];
  [(BCReadingStatisticsProtoBook *)v16 setAppVersion:v18];

  v19 = [(BCReadingStatisticsSync *)self readingStatisticsBook];
  id v20 = [v19 length];

  if (!v20)
  {
LABEL_59:
    [(BCReadingStatisticsSync *)self setAssetVersion:v9];
    id v74 = objc_alloc_init((Class)PBDataWriter);
    [(BCReadingStatisticsProtoBook *)v16 writeTo:v74];
    v75 = [v74 immutableData];
    [(BCReadingStatisticsSync *)self setReadingStatisticsBook:v75];

    v50 = v16;
    goto LABEL_60;
  }
  id v21 = objc_alloc((Class)PBDataReader);
  v22 = [(BCReadingStatisticsSync *)self readingStatisticsBook];
  id v23 = [v21 initWithData:v22];

  if (!BCReadingStatisticsProtoBookReadFrom((char *)v16, (uint64_t)v23))
  {
    v51 = BCCloudKitLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1EC910(self);
    }

    goto LABEL_59;
  }
  id v78 = v12;
  id v81 = v9;
  id v82 = v8;

  v77 = v16;
  v24 = v16;
  v83 = v11;
  v25 = +[NSMutableDictionary dictionary];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v85 = v24;
  v26 = [(BCReadingStatisticsProtoBook *)v24 tocEntrys];
  id v27 = [v26 countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v96;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v96 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        v32 = [v31 href];
        [v25 setObject:v31 forKeyedSubscript:v32];
      }
      id v28 = [v26 countByEnumeratingWithState:&v95 objects:v106 count:16];
    }
    while (v28);
  }
  v79 = self;
  v80 = v11;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v33 = [(BCReadingStatisticsProtoBook *)v83 tocEntrys];
  id v34 = [v33 countByEnumeratingWithState:&v91 objects:v105 count:16];
  if (!v34)
  {
    char v36 = 0;
    goto LABEL_38;
  }
  id v35 = v34;
  char v36 = 0;
  uint64_t v37 = *(void *)v92;
  do
  {
    for (j = 0; j != v35; j = (char *)j + 1)
    {
      if (*(void *)v92 != v37) {
        objc_enumerationMutation(v33);
      }
      v39 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
      v40 = [v39 href];
      uint64_t v41 = [v25 objectForKeyedSubscript:v40];
      if (v41)
      {
        v42 = (BCReadingStatisticsProtoTOCEntry *)v41;
        [v39 readProportion];
        double v44 = v43;
        [(BCReadingStatisticsProtoTOCEntry *)v42 readProportion];
        if (v44 <= v45) {
          goto LABEL_29;
        }
        v46 = BCReadingStatisticsLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          [v39 readProportion];
          *(_DWORD *)buf = 138412546;
          v102 = v40;
          __int16 v103 = 2048;
          double v104 = v47 * 100.0;
          _os_log_impl(&def_7D91C, v46, OS_LOG_TYPE_INFO, "Reading statistics updated: %@ now %.0lf%% read", buf, 0x16u);
        }

        [v39 readProportion];
        -[BCReadingStatisticsProtoTOCEntry setReadProportion:](v42, "setReadProportion:");
        [v39 timestamp];
        -[BCReadingStatisticsProtoTOCEntry setTimestamp:](v42, "setTimestamp:");
      }
      else
      {
        v42 = objc_alloc_init(BCReadingStatisticsProtoTOCEntry);
        [v39 copyTo:v42];
        [v85 addTocEntry:v42];
        v48 = BCReadingStatisticsLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          [v39 readProportion];
          *(_DWORD *)buf = 138412546;
          v102 = v40;
          __int16 v103 = 2048;
          double v104 = v49 * 100.0;
          _os_log_impl(&def_7D91C, v48, OS_LOG_TYPE_INFO, "Reading statistics updated: %@ now %.0lf%% read", buf, 0x16u);
        }
      }
      char v36 = 1;
LABEL_29:
    }
    id v35 = [v33 countByEnumeratingWithState:&v91 objects:v105 count:16];
  }
  while (v35);
LABEL_38:

  v52 = +[BCCFISet cfiSet];
  uint64_t v53 = [v85 readCFIs];
  v54 = (void *)v53;
  if (v53) {
    v55 = (void *)v53;
  }
  else {
    v55 = &__NSArray0__struct;
  }
  id v56 = v55;

  uint64_t v57 = [(BCReadingStatisticsProtoBook *)v83 readCFIs];
  v58 = (void *)v57;
  if (v57) {
    v59 = (void *)v57;
  }
  else {
    v59 = &__NSArray0__struct;
  }
  v76 = v56;
  v60 = [v56 arrayByAddingObjectsFromArray:v59];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v61 = v60;
  id v62 = [v61 countByEnumeratingWithState:&v87 objects:buf count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v88;
    do
    {
      for (k = 0; k != v63; k = (char *)k + 1)
      {
        if (*(void *)v88 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = *(void *)(*((void *)&v87 + 1) + 8 * (void)k);
        id v86 = 0;
        [v52 addCFIString:v66 error:&v86];
        id v67 = v86;
        if (v67)
        {
          v68 = BCReadingStatisticsLog();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v99 = 138543362;
            id v100 = v67;
            _os_log_error_impl(&def_7D91C, v68, OS_LOG_TYPE_ERROR, "Error merging read CFIs: %{public}@", v99, 0xCu);
          }
        }
      }
      id v63 = [v61 countByEnumeratingWithState:&v87 objects:buf count:16];
    }
    while (v63);
  }

  v69 = [v52 allCFIStrings];
  id v70 = [v69 mutableCopy];
  v50 = v85;
  [v85 setReadCFIs:v70];

  if (v36)
  {
    unsigned int v71 = 1;
    id v9 = v81;
    id v8 = v82;
    objc_super v11 = v80;
    v72 = v76;
  }
  else
  {
    v73 = [v85 readCFIs];
    v72 = v76;
    unsigned int v71 = [v76 isEqual:v73] ^ 1;

    id v9 = v81;
    id v8 = v82;
    objc_super v11 = v80;
  }

  id v12 = v78;
  self = v79;
  v16 = v77;
  if (v71) {
    goto LABEL_59;
  }
LABEL_60:
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BCReadingStatisticsSync;
  [(BCReadingStatisticsSync *)&v16 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    v7 = +[BCCloudData localIdentifierFromRecord:v6];
    objc_opt_class();
    id v8 = [v6 objectForKey:@"assetStatistics"];
    id v9 = BUDynamicCast();
    id v10 = [v9 fileURL];

    if (v10)
    {
      objc_super v11 = +[NSData dataWithContentsOfURL:v10];
    }
    else
    {
      objc_super v11 = 0;
    }
    if (-[NSObject length](v7, "length") && [v11 length])
    {
      id v12 = [v6 objectForKeyedSubscript:@"assetVersion"];
      [(BCReadingStatisticsSync *)self _mergeInAssetID:v7 assetVersion:v12 serializedData:v11];

      unsigned int v13 = [(BCReadingStatisticsSync *)self hasChanges];
      unsigned __int8 v14 = BCReadingStatisticsLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15) {
          sub_1ECBCC(self, v6);
        }
      }
      else if (v15)
      {
        sub_1ECCA0(self, v6);
      }
    }
    else
    {
      unsigned __int8 v14 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1ECB48(self);
      }
    }
  }
  else
  {
    v7 = BCCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1ECAC4(self);
    }
  }
}

- (id)recordType
{
  return @"assetReadingStatistics";
}

+ (id)propertyIDKey
{
  return @"assetID";
}

- (id)zoneName
{
  return kBCCloudKitZoneReadingStatistics;
}

- (NSString)debugDescription
{
  v3 = [(BCReadingStatisticsSync *)self assetID];
  BOOL v4 = [(BCReadingStatisticsSync *)self assetVersion];
  id v5 = [(BCReadingStatisticsSync *)self readingStatisticsBook];
  id v6 = +[NSString stringWithFormat:@"assetID: %@, assetVersion: %@, statistics: %@", v3, v4, v5];

  return (NSString *)v6;
}

@end