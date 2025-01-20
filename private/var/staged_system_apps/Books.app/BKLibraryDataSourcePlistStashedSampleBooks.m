@interface BKLibraryDataSourcePlistStashedSampleBooks
- (BKLibraryDataSourcePlistStashedSampleBooks)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7;
- (NSMutableSet)pendingDeleteAssetIDs;
- (id)_newEntryFromSummary:(id)a3;
- (id)_pathStringWithoutDirectoryPrefix:(id)a3;
- (void)_handleOwnershipChange:(id)a3;
- (void)dealloc;
- (void)ephemeralAssetsRedundant:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setPendingDeleteAssetIDs:(id)a3;
@end

@implementation BKLibraryDataSourcePlistStashedSampleBooks

- (BKLibraryDataSourcePlistStashedSampleBooks)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  v7 = [(BKLibraryDataSourcePlist *)&v14 initWithPlistKind:a3 identifier:a4 assetMetadataProvider:a5 coverImageHelper:a6 assetMetadataCache:a7];
  if (v7)
  {
    v15[0] = NSFileOwnerAccountName;
    v15[1] = NSFileGroupOwnerAccountName;
    v16[0] = @"mobile";
    v16[1] = @"mobile";
    v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    v9 = +[NSFileManager defaultManager];
    v10 = [(BKLibraryDataSourcePlist *)v7 directory];
    [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:v8 error:0];

    uint64_t v11 = objc_opt_new();
    pendingDeleteAssetIDs = v7->_pendingDeleteAssetIDs;
    v7->_pendingDeleteAssetIDs = (NSMutableSet *)v11;
  }
  return v7;
}

- (void)setLibraryManager:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  v6 = [(BKLibraryDataSourcePlist *)self libraryManager];

  if (v6)
  {
    uint64_t v7 = BKLibraryOwnershipDidChangeNotification;
    v8 = [(BKLibraryDataSourcePlist *)self libraryManager];
    [v5 removeObserver:self name:v7 object:v8];
  }
  v10.receiver = self;
  v10.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  [(BKLibraryDataSourcePlist *)&v10 setLibraryManager:v4];
  if (v4)
  {
    [v5 addObserver:self selector:"_handleOwnershipChange:" name:BKLibraryOwnershipDidChangeNotification object:v4];
  }
  else
  {
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  [(BKLibraryDataSourcePlistStashedSampleBooks *)&v4 dealloc];
}

- (void)_handleOwnershipChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v20 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = v4;
  id obj = [v4 objectForKeyedSubscript:BKLibraryOwnershipAssetsKey];
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v25 = *(void *)v27;
    uint64_t v24 = BKLibraryOwnershipOldDatasourceKey;
    uint64_t v23 = BKLibraryOwnershipNewDatasourceKey;
    uint64_t v22 = BKLibraryOwnershipAssetIDKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:v24];
        objc_super v10 = [v8 objectForKeyedSubscript:v23];
        uint64_t v11 = [v8 objectForKeyedSubscript:v22];
        v12 = [(BKLibraryDataSourcePlist *)self identifier];
        if ([v9 isEqualToString:v12])
        {

          if ([v10 isEqualToString:@"com.apple.ibooks.plist.untethered"]) {
            goto LABEL_11;
          }
          unsigned int v13 = 1;
        }
        else
        {
          objc_super v14 = [(BKLibraryDataSourcePlistStashedSampleBooks *)self pendingDeleteAssetIDs];
          unsigned int v13 = [v14 containsObject:v11];

          if ([v10 isEqualToString:@"com.apple.ibooks.plist.untethered"])
          {
            if (!v13) {
              goto LABEL_17;
            }
LABEL_11:
            v15 = [(BKLibraryDataSourcePlistStashedSampleBooks *)self pendingDeleteAssetIDs];
            [v15 removeObject:v11];

            [v20 addObject:v11];
            goto LABEL_17;
          }
        }
        v16 = [(BKLibraryDataSourcePlist *)self identifier];
        unsigned int v17 = [v10 isEqualToString:v16];

        if (v17)
        {
          v18 = [(BKLibraryDataSourcePlistStashedSampleBooks *)self pendingDeleteAssetIDs];
          [v18 removeObject:v11];
        }
        else
        {
          if (!v13) {
            goto LABEL_17;
          }
          v18 = [(BKLibraryDataSourcePlistStashedSampleBooks *)self pendingDeleteAssetIDs];
          [v18 addObject:v11];
        }

LABEL_17:
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  if ([v20 count]) {
    [(BKLibraryDataSourcePlist *)self deleteAssetIDs:v20 completion:0];
  }
}

- (id)_pathStringWithoutDirectoryPrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourcePlist *)self directory];
  id v6 = [v4 stringByReplacingOccurrencesOfString:v5 withString:&stru_100A70340];

  return v6;
}

- (id)_newEntryFromSummary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  id v3 = [(BKLibraryDataSourcePlist *)&v6 _newEntryFromSummary:a3];
  id v4 = [v3 mutableCopy];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isSample"];
  return v4;
}

- (void)ephemeralAssetsRedundant:(id)a3
{
}

- (NSMutableSet)pendingDeleteAssetIDs
{
  return self->_pendingDeleteAssetIDs;
}

- (void)setPendingDeleteAssetIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end