@interface SyncEngineImportUtility
+ (id)configCreate:(id)a3 ds:(id)a4 md:(id)a5 directory:(id)a6 fileProtectionType:(id)a7 assetDownloadStagingManager:(id)a8;
+ (id)engineCreate:(id)a3;
+ (id)idsToDeleteIn:(id)a3;
+ (id)idsToSaveIn:(id)a3;
+ (void)addToEngine:(id)a3 recordIDsToSave:(id)a4 recordIDsToDelete:(id)a5;
+ (void)removeFromEngineToSave:(id)a3 recordIDs:(id)a4;
@end

@implementation SyncEngineImportUtility

+ (id)configCreate:(id)a3 ds:(id)a4 md:(id)a5 directory:(id)a6 fileProtectionType:(id)a7 assetDownloadStagingManager:(id)a8
{
  id v11 = a8;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [objc_alloc((Class)CKSyncEngineConfiguration) initWithDatabase:v14 dataSource:v13 metadata:v12];

  [v15 setAssetDownloadStagingManager:v11];

  return v15;
}

+ (id)engineCreate:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKSyncEngine) initWithConfiguration:v3];

  return v4;
}

+ (void)addToEngine:(id)a3 recordIDsToSave:(id)a4 recordIDsToDelete:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  [v8 setNeedsToSaveRecords:a4 needsToSave:1];
  [v8 setNeedsToDeleteRecords:v7 needsToDelete:1];
}

+ (void)removeFromEngineToSave:(id)a3 recordIDs:(id)a4
{
}

+ (id)idsToSaveIn:(id)a3
{
  return _[a3 recordIDsToSave];
}

+ (id)idsToDeleteIn:(id)a3
{
  return _[a3 recordIDsToDelete];
}

@end