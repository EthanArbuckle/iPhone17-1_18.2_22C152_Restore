@interface BCAnnotationSyncManager
+ (BOOL)managedBooksAllowedToSync;
+ (id)_cloudSyncVersionsForDataType:(id)a3 inContext:(id)a4;
+ (id)sharedInstance;
- (AEAnnotationProvider)annotationProvider;
- (BCAnnotationSyncManager)initWithAnnotationProvider:(id)a3;
- (BCAnnotationSyncManagerDelegate)delegate;
- (NSMutableSet)assetIDsOfAssetsToSync;
- (OS_dispatch_queue)assetIDsOfAssetsToSyncQueue;
- (void)_BCCloudAssetAnnotationManagerChanged:(id)a3;
- (void)_acknowledgeMergingCloudAnnotations:(id)a3 forAssetID:(id)a4;
- (void)_mocDidSave:(id)a3;
- (void)_syncAssetsWithCompletionSyncVersion:(int64_t)a3;
- (void)assetAnnotationsUpdatedWithCurrentCloudSyncVersions:(id)a3 updated:(id)a4 removed:(id)a5 fetchAgain:(BOOL)a6;
- (void)dealloc;
- (void)setAnnotationProvider:(id)a3;
- (void)setAssetIDsOfAssetsToSync:(id)a3;
- (void)setAssetIDsOfAssetsToSyncQueue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BCAnnotationSyncManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_147A34;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_349398 != -1) {
    dispatch_once(&qword_349398, block);
  }
  v2 = (void *)qword_3493A0;

  return v2;
}

- (BCAnnotationSyncManager)initWithAnnotationProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BCAnnotationSyncManager;
  v5 = [(BCAnnotationSyncManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_annotationProvider, v4);
    uint64_t v7 = objc_opt_new();
    assetIDsOfAssetsToSync = v6->_assetIDsOfAssetsToSync;
    v6->_assetIDsOfAssetsToSync = (NSMutableSet *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iBooks.BCAnnotationSyncManager", v9);
    assetIDsOfAssetsToSyncQueue = v6->_assetIDsOfAssetsToSyncQueue;
    v6->_assetIDsOfAssetsToSyncQueue = (OS_dispatch_queue *)v10;

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"_mocDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    v13 = +[NSDistributedNotificationCenter defaultCenter];
    [v13 addObserver:v6 selector:"_BCCloudAssetAnnotationManagerChanged:" name:BCCloudAssetAnnotationManagerChanged object:0];

    id v14 = +[BCCloudAssetManager sharedManager];
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BCCloudAssetAnnotationManagerChanged object:0];

  v5.receiver = self;
  v5.super_class = (Class)BCAnnotationSyncManager;
  [(BCAnnotationSyncManager *)&v5 dealloc];
}

- (void)_acknowledgeMergingCloudAnnotations:(id)a3 forAssetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v13) assetVersion];
        if (v14) {
          [v8 addObject:v14];
        }

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v8;
  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v19);
        v21 = [(BCAnnotationSyncManager *)self annotationProvider];
        [v21 acknowledgeMergingAnnotationsWithAssetVersionMismatch:v20 assetID:v7];

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
}

- (void)assetAnnotationsUpdatedWithCurrentCloudSyncVersions:(id)a3 updated:(id)a4 removed:(id)a5 fetchAgain:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = BCCloudKitLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "assetAnnotationsUpdated", buf, 2u);
  }

  uint64_t v12 = [(BCAnnotationSyncManager *)self annotationProvider];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_147FAC;
  v15[3] = &unk_2C9E68;
  id v16 = v10;
  id v17 = v9;
  uint64_t v18 = self;
  BOOL v19 = a6;
  id v13 = v9;
  id v14 = v10;
  [v12 cloudSyncVersionsForDataType:@"BCAssetAnnotations" performBlock:v15];
}

+ (BOOL)managedBooksAllowedToSync
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isEnterpriseBookMetadataSyncAllowed];

  return v3;
}

- (void)_mocDidSave:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 object];
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 persistentStoreCoordinator];
  id v8 = [(BCAnnotationSyncManager *)self annotationProvider];
  id v9 = [v8 persistentStoreCoordinator];
  if (v7 != v9)
  {

LABEL_19:
    goto LABEL_20;
  }
  objc_opt_class();
  id v10 = BUDynamicCast();
  unsigned int v11 = [v10 sessionContextType];

  if (v11 != 2)
  {
    id v7 = [v4 userInfo];
    uint64_t v12 = objc_opt_new();
    id v13 = [v7 objectForKey:NSInsertedObjectsKey];
    if (v13)
    {
      [v12 unionSet:v13];
    }
    else
    {
      id v14 = +[NSSet set];
      [v12 unionSet:v14];
    }
    id v15 = [v7 objectForKey:NSUpdatedObjectsKey];
    if (v15)
    {
      [v12 unionSet:v15];
    }
    else
    {
      id v16 = +[NSSet set];
      [v12 unionSet:v16];
    }
    id v17 = [v7 objectForKey:NSDeletedObjectsKey];
    if (v17)
    {
      [v12 unionSet:v17];
    }
    else
    {
      uint64_t v18 = +[NSSet set];
      [v12 unionSet:v18];
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_148C7C;
    v27[3] = &unk_2C9EB8;
    id v8 = v12;
    id v28 = v8;
    long long v29 = self;
    uint64_t v30 = v6;
    BOOL v19 = objc_retainBlock(v27);
    if ([(id)objc_opt_class() managedBooksAllowedToSync])
    {
      ((void (*)(void *, void))v19[2])(v19, 0);
    }
    else
    {
      id v20 = [v8 mutableCopy];
      v21 = +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@ AND annotationDeleted == 0", objc_opt_class()];
      [v20 filterUsingPredicate:v21];

      if ([v20 count])
      {
        long long v22 = [v20 valueForKey:@"annotationAssetID"];
        long long v23 = [(BCAnnotationSyncManager *)self delegate];
        long long v24 = [v22 allObjects];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1493E8;
        v25[3] = &unk_2C9EE0;
        long long v26 = v19;
        [v23 managedBooksMapWithAssetIDs:v24 completion:v25];
      }
    }

    goto LABEL_19;
  }
LABEL_20:
}

- (void)_BCCloudAssetAnnotationManagerChanged:(id)a3
{
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(BCAnnotationSyncManager *)self annotationProvider];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1495E0;
  v6[3] = &unk_2C9F30;
  v6[4] = self;
  v6[5] = v4;
  [v5 performBlockOnUserSideQueue:v6];
}

+ (id)_cloudSyncVersionsForDataType:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCCloudSyncVersions"];
  [v7 setReturnsObjectsAsFaults:0];
  [v7 setFetchLimit:1];
  id v8 = +[NSPredicate predicateWithFormat:@"dataType == %@", v5];
  [v7 setPredicate:v8];

  id v14 = 0;
  id v9 = [v6 executeFetchRequest:v7 error:&v14];
  id v10 = v14;
  if (v10)
  {
    unsigned int v11 = BCCloudKitLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1EECA8((uint64_t)v10, v11);
    }
  }
  uint64_t v12 = [v9 firstObject];
  if (!v12)
  {
    uint64_t v12 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCCloudSyncVersions" inManagedObjectContext:v6];
    [v12 setDataType:v5];
  }

  return v12;
}

- (void)_syncAssetsWithCompletionSyncVersion:(int64_t)a3
{
  unsigned __int8 v3 = [(BCAnnotationSyncManager *)self assetIDsOfAssetsToSyncQueue];
  dispatch_assert_queue_V2(v3);

  id v16 = objc_opt_class();
  objc_initWeak(&location, self);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [(BCAnnotationSyncManager *)self assetIDsOfAssetsToSync];
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    id v14 = v20;
    uint64_t v15 = *(void *)v23;
    id obj = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v8 = +[AEAnnotation predicateForAnnotationsWithAssetID:includingDeleted:](AEAnnotation, "predicateForAnnotationsWithAssetID:includingDeleted:", v7, 1, obj, v14);
        id v9 = +[AEAnnotation predicateForNonGlobalAnnotationsIncludingDeleted];
        v27[0] = v8;
        v27[1] = v9;
        id v10 = +[NSArray arrayWithObjects:v27 count:2];
        unsigned int v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

        uint64_t v12 = [(BCAnnotationSyncManager *)self annotationProvider];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v20[0] = sub_149AE0;
        v20[1] = &unk_2C9FC8;
        objc_copyWeak(v21, &location);
        v20[2] = v7;
        v21[1] = v16;
        v21[2] = (id)a3;
        [v12 onAnnotationsMatchingPredicate:v11 performBlock:v19];

        objc_destroyWeak(v21);
      }
      uint64_t v4 = obj;
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

- (BCAnnotationSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCAnnotationSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AEAnnotationProvider)annotationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationProvider);

  return (AEAnnotationProvider *)WeakRetained;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (NSMutableSet)assetIDsOfAssetsToSync
{
  return self->_assetIDsOfAssetsToSync;
}

- (void)setAssetIDsOfAssetsToSync:(id)a3
{
}

- (OS_dispatch_queue)assetIDsOfAssetsToSyncQueue
{
  return self->_assetIDsOfAssetsToSyncQueue;
}

- (void)setAssetIDsOfAssetsToSyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIDsOfAssetsToSyncQueue, 0);
  objc_storeStrong((id *)&self->_assetIDsOfAssetsToSync, 0);
  objc_destroyWeak((id *)&self->_annotationProvider);

  objc_destroyWeak((id *)&self->_delegate);
}

@end