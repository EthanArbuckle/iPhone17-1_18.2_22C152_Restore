@interface AEAnnotationProvider
+ (AEAnnotationProvider)sharedInstance;
+ (id)cacheKeyForService:(id)a3;
+ (id)managedObjectModelBundle;
+ (id)managedObjectModelName;
+ (id)storeName;
+ (id)ubiquityPeerIDOverride;
- (AEAnnotationManagedObjectContext)privateCloudSyncMOC;
- (AEAnnotationManagedObjectContext)privateUserEditMOC;
- (AEAnnotationManagedObjectContext)uiManagedObjectContext;
- (AEAnnotationProvider)init;
- (AEAnnotationProvider)initWithPersistentStoreURL:(id)a3;
- (AEAnnotationProviderDelegate)delegate;
- (BOOL)acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a3 assetID:(id)a4;
- (BOOL)exportAnnotationsMatchingPredicate:(id)a3 toURL:(id)a4 withType:(int)a5 error:(id *)a6;
- (BOOL)iCloudEnabledInUserDefaults;
- (NSMutableSet)acknowledgedMismatchingAssetIDs;
- (NSObject)mocSaveObserver;
- (void)_commonInit;
- (void)_mocDidSave:(id)a3;
- (void)cloudSyncVersionsForDataType:(id)a3 performBlock:(id)a4;
- (void)dealloc;
- (void)deleteAnnotation:(id)a3;
- (void)migrateFromPersistentStoreCoordinator:(id)a3 toPersistentStoreCoordinator:(id)a4;
- (void)migrateFromPersistentStoreCoordinator:(id)a3 toPersistentStoreCoordinator:(id)a4 withPredicate:(id)a5;
- (void)modifyAnnotationsWithUUIDs:(id)a3 type:(int)a4 performBlock:(id)a5;
- (void)modifyGlobalAnnotationsWithAssetIDs:(id)a3 type:(int)a4 performBlock:(id)a5;
- (void)onAnnotationsMatchingPredicate:(id)a3 performBlock:(id)a4;
- (void)onAnnotationsMatchingPredicate:(id)a3 performBlockAndWait:(id)a4;
- (void)onGlobalAnnotationsForAssetIDs:(id)a3 performBlockAndWait:(id)a4;
- (void)performBlockOnUserSideQueue:(id)a3;
- (void)performBlockOnUserSideQueueAndWait:(id)a3;
- (void)setAcknowledgedMismatchingAssetIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMocSaveObserver:(id)a3;
- (void)setPrivateCloudSyncMOC:(id)a3;
- (void)setPrivateUserEditMOC:(id)a3;
- (void)upgradeAnnotationsIfNeeded;
@end

@implementation AEAnnotationProvider

+ (AEAnnotationProvider)sharedInstance
{
  v2 = (void *)qword_345CD8;
  if (!qword_345CD8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E26A0;
    block[3] = &unk_2C3BB8;
    block[4] = a1;
    if (qword_345CE0 != -1) {
      dispatch_once(&qword_345CE0, block);
    }
    v2 = (void *)qword_345CD8;
  }

  return (AEAnnotationProvider *)v2;
}

- (AEAnnotationManagedObjectContext)uiManagedObjectContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uiManagedObjectContext = self->_uiManagedObjectContext;

  return uiManagedObjectContext;
}

- (BOOL)iCloudEnabledInUserDefaults
{
  return 1;
}

- (AEAnnotationProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)AEAnnotationProvider;
  v2 = [(IMUbiquitousDataProvider *)&v7 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() storeName];
    v4 = [(IMUbiquitousDataProvider *)v2 localPersistentStoreLoader];
    [v4 setStoreName:v3];

    v5 = [(IMUbiquitousDataProvider *)v2 localPersistentStoreLoader];
    [v5 setManagedObjectModelName:@"AEAnnotation"];

    [(AEAnnotationProvider *)v2 _commonInit];
  }
  return v2;
}

- (void)_commonInit
{
  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  acknowledgedMismatchingAssetIDs = self->_acknowledgedMismatchingAssetIDs;
  self->_acknowledgedMismatchingAssetIDs = v3;

  v5 = [(IMUbiquitousDataProvider *)self newManagedObjectContextWithClass:objc_opt_class() concurrencyType:1];
  privateUserEditMOC = self->_privateUserEditMOC;
  self->_privateUserEditMOC = v5;

  [(AEAnnotationManagedObjectContext *)self->_privateUserEditMOC setAnnotationProvider:self];
  [(AEAnnotationManagedObjectContext *)self->_privateUserEditMOC setSessionContextType:0];
  objc_super v7 = [(IMUbiquitousDataProvider *)self newManagedObjectContextWithClass:objc_opt_class() concurrencyType:1];
  privateCloudSyncMOC = self->_privateCloudSyncMOC;
  self->_privateCloudSyncMOC = v7;

  [(AEAnnotationManagedObjectContext *)self->_privateCloudSyncMOC setAnnotationProvider:self];
  [(AEAnnotationManagedObjectContext *)self->_privateCloudSyncMOC setSessionContextType:2];
  v9 = [(IMUbiquitousDataProvider *)self newManagedObjectContextWithClass:objc_opt_class() concurrencyType:2];
  uiManagedObjectContext = self->_uiManagedObjectContext;
  self->_uiManagedObjectContext = v9;

  [(AEAnnotationManagedObjectContext *)self->_uiManagedObjectContext setAnnotationProvider:self];
  [(AEAnnotationManagedObjectContext *)self->_uiManagedObjectContext setSessionContextType:1];
  objc_initWeak(&location, self);
  v11 = +[NSNotificationCenter defaultCenter];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_E29E4;
  v14[3] = &unk_2C8E80;
  objc_copyWeak(&v15, &location);
  v12 = [v11 addObserverForName:NSManagedObjectContextDidSaveNotification object:0 queue:0 usingBlock:v14];
  mocSaveObserver = self->_mocSaveObserver;
  self->_mocSaveObserver = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (AEAnnotationProvider)initWithPersistentStoreURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AEAnnotationProvider;
  v3 = [(IMUbiquitousDataProvider *)&v6 initWithPersistentStoreURL:a3];
  v4 = v3;
  if (v3) {
    [(AEAnnotationProvider *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_mocSaveObserver];

  mocSaveObserver = self->_mocSaveObserver;
  self->_mocSaveObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AEAnnotationProvider;
  [(AEAnnotationProvider *)&v5 dealloc];
}

- (void)deleteAnnotation:(id)a3
{
}

- (BOOL)exportAnnotationsMatchingPredicate:(id)a3 toURL:(id)a4 withType:(int)a5 error:(id *)a6
{
  if (!a5)
  {
    id v9 = a4;
    id v10 = a3;
    v11 = [[AEAnnotationProvider alloc] initWithPersistentStoreURL:v9];

    [(IMUbiquitousDataProvider *)v11 loadCoreData];
    v12 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
    v13 = [(IMUbiquitousDataProvider *)v11 persistentStoreCoordinator];
    [(AEAnnotationProvider *)self migrateFromPersistentStoreCoordinator:v12 toPersistentStoreCoordinator:v13 withPredicate:v10];
  }
  return a5 == 0;
}

- (BOOL)acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(AEAnnotationProvider *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      if (v6)
      {
        id v10 = [v7 stringByAppendingFormat:@":%@", v6];
      }
      else
      {
        id v10 = v7;
      }
      v12 = v10;
      v13 = [(AEAnnotationProvider *)self acknowledgedMismatchingAssetIDs];
      objc_sync_enter(v13);
      v14 = [(AEAnnotationProvider *)self acknowledgedMismatchingAssetIDs];
      unsigned __int8 v15 = [v14 containsObject:v12];

      objc_sync_exit(v13);
      if ((v15 & 1) == 0)
      {
        v16 = [(AEAnnotationProvider *)self delegate];
        unsigned int v17 = [v16 annotationProvider:self acknowledgeMergingAnnotationsWithAssetVersionMismatch:v6 assetID:v7];

        if (!v17)
        {
          BOOL v11 = 0;
          goto LABEL_12;
        }
        v18 = [(AEAnnotationProvider *)self acknowledgedMismatchingAssetIDs];
        objc_sync_enter(v18);
        v19 = [(AEAnnotationProvider *)self acknowledgedMismatchingAssetIDs];
        [v19 addObject:v12];

        objc_sync_exit(v18);
      }
      BOOL v11 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

+ (id)cacheKeyForService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DatabaseBackupFileService"])
  {
    v4 = @"BKBookmark-Generation";
  }
  else
  {
    if ([v3 length])
    {
      objc_super v5 = +[NSString stringWithFormat:@"%@-%@", v3, kMaxModificationTimeIntervalSince1970];
    }
    else
    {
      objc_super v5 = kMaxModificationTimeIntervalSince1970;
    }
    v4 = v5;
  }

  return v4;
}

- (void)onAnnotationsMatchingPredicate:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AEAnnotationProvider *)self privateUserEditMOC];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E2EFC;
  v11[3] = &unk_2C3A40;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlock:v11];
}

- (void)onAnnotationsMatchingPredicate:(id)a3 performBlockAndWait:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AEAnnotationProvider *)self privateUserEditMOC];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E30A4;
  v11[3] = &unk_2C3A40;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

- (void)onGlobalAnnotationsForAssetIDs:(id)a3 performBlockAndWait:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AEAnnotationProvider *)self privateUserEditMOC];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E324C;
  v11[3] = &unk_2C3A40;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

- (void)modifyAnnotationsWithUUIDs:(id)a3 type:(int)a4 performBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 2) {
    [(AEAnnotationProvider *)self privateCloudSyncMOC];
  }
  else {
    [(AEAnnotationProvider *)self privateUserEditMOC];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_E3594;
  v13[3] = &unk_2C3A40;
  id v14 = v8;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  id v10 = v9;
  id v11 = v15;
  id v12 = v8;
  [v11 performBlock:v13];
}

- (void)modifyGlobalAnnotationsWithAssetIDs:(id)a3 type:(int)a4 performBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 2) {
    [(AEAnnotationProvider *)self privateCloudSyncMOC];
  }
  else {
    [(AEAnnotationProvider *)self privateUserEditMOC];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_E3A64;
  v13[3] = &unk_2C3A40;
  id v14 = v8;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  id v10 = v9;
  id v11 = v15;
  id v12 = v8;
  [v11 performBlock:v13];
}

- (void)performBlockOnUserSideQueue:(id)a3
{
  id v7 = a3;
  if (!v7) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationProvider.m", 374, (uint64_t)"-[AEAnnotationProvider performBlockOnUserSideQueue:]", (uint64_t)"block", 0, v4, v5, v6, v10[0]);
  }
  id v8 = [(AEAnnotationProvider *)self privateUserEditMOC];
  v10[0] = (uint64_t)_NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = (uint64_t)sub_E40C8;
  v10[3] = (uint64_t)&unk_2C4678;
  v10[4] = (uint64_t)self;
  id v11 = v7;
  id v9 = v7;
  [v8 performBlock:v10];
}

- (void)performBlockOnUserSideQueueAndWait:(id)a3
{
  id v7 = a3;
  if (!v7) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationProvider.m", 393, (uint64_t)"-[AEAnnotationProvider performBlockOnUserSideQueueAndWait:]", (uint64_t)"block", 0, v4, v5, v6, v10[0]);
  }
  id v8 = [(AEAnnotationProvider *)self privateUserEditMOC];
  v10[0] = (uint64_t)_NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = (uint64_t)sub_E4280;
  v10[3] = (uint64_t)&unk_2C4678;
  v10[4] = (uint64_t)self;
  id v11 = v7;
  id v9 = v7;
  [v8 performBlockAndWait:v10];
}

- (void)cloudSyncVersionsForDataType:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AEAnnotationProvider *)self privateCloudSyncMOC];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E4440;
  v11[3] = &unk_2C3A40;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlock:v11];
}

- (void)migrateFromPersistentStoreCoordinator:(id)a3 toPersistentStoreCoordinator:(id)a4 withPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[AEAnnotationManagedObjectContext alloc] initWithConcurrencyType:1];
  [(AEAnnotationManagedObjectContext *)v11 setSessionContextType:3];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_E4828;
  v16[3] = &unk_2C7840;
  unsigned int v17 = v11;
  id v18 = v8;
  id v19 = v10;
  id v20 = v9;
  v21 = self;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  id v15 = v11;
  [(AEAnnotationManagedObjectContext *)v15 performBlockAndWait:v16];
}

- (void)migrateFromPersistentStoreCoordinator:(id)a3 toPersistentStoreCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithValue:1];
  [(AEAnnotationProvider *)self migrateFromPersistentStoreCoordinator:v7 toPersistentStoreCoordinator:v6 withPredicate:v8];
}

+ (id)ubiquityPeerIDOverride
{
  return 0;
}

+ (id)managedObjectModelName
{
  return @"AEAnnotation";
}

+ (id)managedObjectModelBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

+ (id)storeName
{
  return +[NSString stringWithFormat:@"%@_%@", @"AEAnnotation", @"v10312011_1727"];
}

- (void)upgradeAnnotationsIfNeeded
{
  id v3 = [(IMUbiquitousDataProvider *)self metadataObjectForKey:@"Annotations-Update-Version"];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 unsignedIntegerValue];
  }
  else
  {
    [(AEAnnotationProvider *)self privateUserEditMOC];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_E4EDC;
    v6[3] = &unk_2C3AF8;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = self;
    id v5 = v7;
    [v5 performBlockAndWait:v6];
  }
}

- (void)_mocDidSave:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_initWeak(&location, v5);

  id v6 = objc_loadWeakRetained(&location);
  id v7 = [v6 persistentStoreCoordinator];

  id v8 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
  if (v7 == v8)
  {
    id v9 = [(AEAnnotationProvider *)self privateCloudSyncMOC];
    id v10 = [(AEAnnotationProvider *)self privateUserEditMOC];
    id v11 = self->_uiManagedObjectContext;
    id v12 = objc_loadWeakRetained(&location);

    if (v12 != v9)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_E5420;
      v21[3] = &unk_2C3AF8;
      id v22 = v9;
      id v23 = v4;
      [v22 performBlock:v21];
    }
    id v13 = objc_loadWeakRetained(&location);

    if (v13 != v10)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E542C;
      v18[3] = &unk_2C3AF8;
      id v19 = v10;
      id v20 = v4;
      [v19 performBlock:v18];
    }
    id v14 = (AEAnnotationManagedObjectContext *)objc_loadWeakRetained(&location);

    if (v14 != v11)
    {
      if (+[NSThread isMainThread])
      {
        [(AEAnnotationManagedObjectContext *)v11 mergeChangesFromContextDidSaveNotification:v4];
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_E5438;
        block[3] = &unk_2C3AF8;
        id v16 = v11;
        id v17 = v4;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  objc_destroyWeak(&location);
}

- (NSMutableSet)acknowledgedMismatchingAssetIDs
{
  return self->_acknowledgedMismatchingAssetIDs;
}

- (void)setAcknowledgedMismatchingAssetIDs:(id)a3
{
}

- (AEAnnotationProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AEAnnotationProviderDelegate *)a3;
}

- (AEAnnotationManagedObjectContext)privateUserEditMOC
{
  return self->_privateUserEditMOC;
}

- (void)setPrivateUserEditMOC:(id)a3
{
}

- (AEAnnotationManagedObjectContext)privateCloudSyncMOC
{
  return self->_privateCloudSyncMOC;
}

- (void)setPrivateCloudSyncMOC:(id)a3
{
}

- (NSObject)mocSaveObserver
{
  return self->_mocSaveObserver;
}

- (void)setMocSaveObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mocSaveObserver, 0);
  objc_storeStrong((id *)&self->_privateCloudSyncMOC, 0);
  objc_storeStrong((id *)&self->_privateUserEditMOC, 0);
  objc_storeStrong((id *)&self->_uiManagedObjectContext, 0);

  objc_storeStrong((id *)&self->_acknowledgedMismatchingAssetIDs, 0);
}

@end