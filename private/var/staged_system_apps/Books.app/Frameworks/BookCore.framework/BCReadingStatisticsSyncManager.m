@interface BCReadingStatisticsSyncManager
+ (id)sharedInstance;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudChangeTokenController)changeTokenController;
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)readingStatisticsDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BCReadingStatisticsSyncManager)init;
- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager;
- (BOOL)enableCloudSync;
- (NSMapTable)controllers;
- (NSURL)ckAssetStoreDirectory;
- (id)_appVersion;
- (id)_managedObjectModel;
- (id)entityName;
- (id)fileURLForCachingCKAssetWithAssetID:(id)a3;
- (void)dealloc;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4;
- (void)registerReadingStatisticsController:(id)a3;
- (void)setChangeTokenController:(id)a3;
- (void)setCkAssetStoreDirectory:(id)a3;
- (void)setControllers:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setReadingStatisticsDataSource:(id)a3;
- (void)setSaltVersionIdentifierManager:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setupWithCompletion:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)unregisterReadingStatisticsController:(id)a3;
@end

@implementation BCReadingStatisticsSyncManager

+ (id)sharedInstance
{
  if (qword_345C90 != -1) {
    dispatch_once(&qword_345C90, &stru_2C86D8);
  }
  v2 = (void *)qword_345C88;

  return v2;
}

- (BCReadingStatisticsSyncManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)BCReadingStatisticsSyncManager;
  id v2 = [(BCReadingStatisticsSyncManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    *((unsigned char *)v2 + 16) = 0;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.BCReadingStasticsSyncManager", 0);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = +[BDSApplication applicationCacheDirectory];
    v8 = [v7 stringByAppendingPathComponent:@"BCReadingStatisticsSyncManagerAssetCache"];
    uint64_t v9 = +[NSURL fileURLWithPath:v8];
    v10 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v9;

    v11 = +[NSFileManager defaultManager];
    uint64_t v12 = *((void *)v2 + 9);
    id v16 = 0;
    [v11 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v13 = v16;

    if (v13)
    {
      v14 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1ED068((uint64_t *)v2 + 9, (uint64_t)v13, v14);
      }
    }
  }
  return (BCReadingStatisticsSyncManager *)v2;
}

- (void)dealloc
{
  uint64_t v3 = +[BCCloudKitController sharedInstance];
  v4 = [v3 privateCloudDatabaseController];
  dispatch_queue_t v5 = [(BCReadingStatisticsSyncManager *)self syncManager];
  [v4 removeObserver:v5 recordType:@"assetReadingStatistics"];

  [(BCCloudDataSyncManager *)self->_syncManager setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)BCReadingStatisticsSyncManager;
  [(BCReadingStatisticsSyncManager *)&v6 dealloc];
}

- (void)setupWithCompletion:(id)a3
{
  id v40 = a3;
  id v4 = objc_alloc((Class)BCCloudDataSource);
  dispatch_queue_t v5 = [(BCReadingStatisticsSyncManager *)self _managedObjectModel];
  id v6 = [v4 initWithManagedObjectModel:v5 nameOnDisk:@"BCReadingStatisticsSync"];
  [(BCReadingStatisticsSyncManager *)self setReadingStatisticsDataSource:v6];

  id v7 = objc_alloc((Class)BCCloudDataSyncManager);
  v8 = +[BCCloudKitController sharedInstance];
  id v9 = [v7 initWithCloudKitController:v8];
  [(BCReadingStatisticsSyncManager *)self setSyncManager:v9];

  v10 = [(BCReadingStatisticsSyncManager *)self syncManager];
  [v10 setDelegate:self];

  if ([(BCReadingStatisticsSyncManager *)self enableCloudSync])
  {
    v11 = +[BCCloudKitController sharedInstance];
    uint64_t v12 = [v11 privateCloudDatabaseController];
    id v13 = [(BCReadingStatisticsSyncManager *)self syncManager];
    [v12 addObserver:v13 recordType:@"assetReadingStatistics"];
  }
  id v14 = objc_alloc((Class)BCCloudDataManager);
  v15 = [(BCReadingStatisticsSyncManager *)self readingStatisticsDataSource];
  id v16 = [(BCReadingStatisticsSyncManager *)self entityName];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = [(BCReadingStatisticsSyncManager *)self syncManager];
  v20 = +[BCCloudKitController sharedInstance];
  id v21 = [v14 initWithCloudDataSource:v15 entityName:v16 notificationName:0 immutableClass:v17 mutableClass:v18 syncManager:v19 cloudKitController:v20];
  [(BCReadingStatisticsSyncManager *)self setDataManager:v21];

  id v22 = objc_alloc((Class)BCCloudChangeTokenController);
  v23 = [(BCReadingStatisticsSyncManager *)self readingStatisticsDataSource];
  v24 = [v23 managedObjectContext];
  uint64_t v25 = kBCCloudKitZoneReadingStatistics;
  v26 = +[BCCloudKitController sharedInstance];
  id v27 = [v22 initWithMOC:v24 zoneName:v25 cloudKitController:v26];
  [(BCReadingStatisticsSyncManager *)self setChangeTokenController:v27];

  if ([(BCReadingStatisticsSyncManager *)self enableCloudSync])
  {
    id v28 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v25 ownerName:CKCurrentUserDefaultName];
    v29 = +[BCCloudKitController sharedInstance];
    v30 = [v29 privateCloudDatabaseController];
    v31 = [(BCReadingStatisticsSyncManager *)self changeTokenController];
    [v30 registerServerChangeTokenStore:v31 forZoneID:v28];

    id v32 = objc_alloc((Class)BDSSaltVersionIdentifierManager);
    changeTokenController = self->_changeTokenController;
    v34 = +[BCCloudKitController sharedInstance];
    v35 = [v34 privateCloudDatabaseController];
    v36 = (BDSSaltVersionIdentifierManager *)[v32 initWithZoneDataManager:self tokenController:changeTokenController databaseController:v35];
    saltVersionIdentifierManager = self->_saltVersionIdentifierManager;
    self->_saltVersionIdentifierManager = v36;
  }
  id v38 = objc_retainBlock(v40);
  v39 = v38;
  if (v38) {
    (*((void (**)(id, void))v38 + 2))(v38, 0);
  }
}

- (void)setEnableCloudSync:(BOOL)a3
{
  if (self->_enableCloudSync == a3)
  {
    if (self->_enableCloudSync) {
      return;
    }
    uint64_t v3 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      id v4 = "Request to disable CloudSync, but already disabled";
      dispatch_queue_t v5 = (uint8_t *)&v16;
LABEL_10:
      _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else
  {
    BOOL v6 = a3;
    self->_enableCloudSync = a3;
    v8 = [(BCReadingStatisticsSyncManager *)self changeTokenController];
    [v8 setEnableCloudSync:v6];

    id v9 = +[BCCloudKitController sharedInstance];
    v10 = [v9 privateCloudDatabaseController];
    v11 = [(BCReadingStatisticsSyncManager *)self syncManager];
    if (v6)
    {
      [v10 addObserver:v11 recordType:@"assetReadingStatistics"];

      uint64_t v12 = +[BCCloudKitController sharedInstance];
      id v13 = [v12 transactionManager];
      id v14 = [(BCReadingStatisticsSyncManager *)self entityName];
      v15 = [(BCReadingStatisticsSyncManager *)self syncManager];
      [v13 signalSyncToCKTransactionForEntityName:v14 syncManager:v15];

      uint64_t v3 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        id v4 = "Enabling CloudSync";
        dispatch_queue_t v5 = (uint8_t *)&v18;
        goto LABEL_10;
      }
    }
    else
    {
      [v10 removeObserver:v11 recordType:@"assetReadingStatistics"];

      uint64_t v3 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v4 = "Disabling CloudSync";
        dispatch_queue_t v5 = buf;
        goto LABEL_10;
      }
    }
  }
}

- (id)fileURLForCachingCKAssetWithAssetID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(BCReadingStatisticsSyncManager *)self ckAssetStoreDirectory];
  BOOL v6 = [v4 dataUsingEncoding:4];

  id v7 = [v6 bu_md5];
  v8 = [v5 URLByAppendingPathComponent:v7];

  return v8;
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCReadingStatisticsSyncManager *)self dataManager];
  [v5 hasSaltChangedWithCompletion:v4];
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCReadingStatisticsSyncManager *)self dataManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];
}

- (void)registerReadingStatisticsController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_BF064;
    v7[3] = &unk_2C3AF8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(accessQueue, v7);
  }
}

- (void)unregisterReadingStatisticsController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_BF170;
    v7[3] = &unk_2C3AF8;
    id v8 = v4;
    id v9 = self;
    dispatch_async(accessQueue, v7);
  }
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
}

- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(BCReadingStatisticsProtoBook);
  id v9 = [v7 assetID];
  [v7 bookVersionString];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_BF314;
  v14[3] = &unk_2C8700;
  v15 = v8;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v6;
  id v10 = v6;
  id v11 = v18;
  id v12 = v9;
  id v13 = v8;
  [v7 _setOfReadRangesWithCompletion:v14];
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(BCReadingStatisticsSyncManager *)self enableCloudSync];
  id v9 = BCReadingStatisticsLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_DEFAULT, "Attempting sync of data to CK", buf, 2u);
    }

    id v11 = [(BCReadingStatisticsSyncManager *)self dataManager];
    [v11 startSyncToCKWithSyncManager:v6 completion:v7];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_DEFAULT, "Skipping sync of data to CK - cloudSync not enabled", v12, 2u);
    }

    id v11 = (void (**)(void))objc_retainBlock(v7);
    if (v11) {
      v11[2](v11);
    }
  }
}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  if ([(BCReadingStatisticsSyncManager *)self enableCloudSync])
  {
    id v7 = +[BCCloudKitController sharedInstance];
    id v4 = [v7 transactionManager];
    id v5 = [(BCReadingStatisticsSyncManager *)self entityName];
    id v6 = [(BCReadingStatisticsSyncManager *)self syncManager];
    [v4 signalSyncToCKTransactionForEntityName:v5 syncManager:v6];
  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [v15 assetID];
        [v9 setObject:v15 forKey:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [(BCReadingStatisticsSyncManager *)self dataManager];
  id v18 = [v9 allKeys];
  id v19 = +[NSPredicate predicateWithFormat:@"assetID IN %@", v18];
  [v17 updateSyncGenerationFromCloudData:v9 predicate:v19 propertyIDKey:@"assetID" completion:v8];
}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = [(BCReadingStatisticsSyncManager *)self enableCloudSync];
  id v10 = BCReadingStatisticsLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_DEFAULT, "Resolving conflicts for records:%@", buf, 0xCu);
    }

    id v12 = [(BCReadingStatisticsSyncManager *)self dataManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_BFB9C;
    v15[3] = &unk_2C87F0;
    v15[4] = self;
    id v16 = v8;
    [v12 resolveConflictsForRecords:v7 completion:v15];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_DEFAULT, "Skipping resolution of records from CK - cloudSync not enabled", buf, 2u);
    }

    id v13 = objc_retainBlock(v8);
    id v14 = v13;
    if (v13) {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCReadingStatisticsSyncManager *)self enableCloudSync])
  {
    unsigned int v9 = [(BCReadingStatisticsSyncManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_C0818;
    v12[3] = &unk_2C8818;
    id v13 = v8;
    [v9 failedRecordIDs:v7 completion:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v8);
    BOOL v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (id)entityName
{
  return @"BCReadingStatisticsSync";
}

- (id)_managedObjectModel
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"BCReadingStatisticsSync" ofType:@"momd"];

  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  id v5 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v4];

  return v5;
}

- (id)_appVersion
{
  if (qword_345CA0 != -1) {
    dispatch_once(&qword_345CA0, &stru_2C8838);
  }
  id v2 = (void *)qword_345C98;

  return v2;
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (NSMapTable)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
}

- (BCCloudDataSource)readingStatisticsDataSource
{
  return self->_readingStatisticsDataSource;
}

- (void)setReadingStatisticsDataSource:(id)a3
{
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
}

- (NSURL)ckAssetStoreDirectory
{
  return self->_ckAssetStoreDirectory;
}

- (void)setCkAssetStoreDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAssetStoreDirectory, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_readingStatisticsDataSource, 0);
  objc_storeStrong((id *)&self->_controllers, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end