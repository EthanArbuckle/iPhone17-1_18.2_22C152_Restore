@interface BKSeriesCoverManager
+ (id)sharedInstance;
- (BKSeriesCoverManager)init;
- (id)seriesIDContainingBook:(id)a3;
- (void)_notifyWithChanges:(id)a3;
- (void)_rebuild;
- (void)addSeriesCoverObserver:(id)a3;
- (void)assetIDsAndOptionsForBooksInSeries:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidateCacheForSeriesId:(id)a3;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeSeriesCoverObserver:(id)a3;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)withBooksInSeries:(id)a3 performBlockAsync:(id)a4;
@end

@implementation BKSeriesCoverManager

+ (id)sharedInstance
{
  if (qword_100B4A348 != -1) {
    dispatch_once(&qword_100B4A348, &stru_100A46F78);
  }
  v2 = (void *)qword_100B4A340;

  return v2;
}

- (BKSeriesCoverManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)BKSeriesCoverManager;
  v2 = [(BKSeriesCoverManager *)&v25 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    assetIDsAndOptionsForBooksInSeriesCache = v3->_assetIDsAndOptionsForBooksInSeriesCache;
    v3->_assetIDsAndOptionsForBooksInSeriesCache = (NSMutableDictionary *)v4;

    map = v3->_map;
    v3->_map = 0;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("BCCoverCache.seriesCoverBooksSync", v7);
    sync = v3->_sync;
    v3->_sync = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("BCCoverCache.seriesCoverBooksNotify", v7);
    notify = v3->_notify;
    v3->_notify = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    changedSeriesIDs = v3->_changedSeriesIDs;
    v3->_changedSeriesIDs = (NSMutableSet *)v12;

    uint64_t v14 = +[NSMapTable weakToStrongObjectsMapTable];
    observers = v3->_observers;
    v3->_observers = (NSMapTable *)v14;

    id v16 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v17 = +[BKLibraryManager defaultManager];
    v18 = [v17 persistentStoreCoordinator];
    v19 = +[BKLibraryManager predicateForContainerLibraryAssets];
    v20 = (BCManagedObjectIDMonitor *)[v16 initWithContext:0 coordinator:v18 entityName:@"BKLibraryAsset" predicate:v19 mapProperty:@"assetID" propertiesOfInterest:0 observer:v3];
    seriesMonitor = v3->_seriesMonitor;
    v3->_seriesMonitor = v20;

    v22 = +[BURestrictionsProvider sharedInstance];
    [v22 addObserver:v3];

    v23 = +[NSUserDefaults standardUserDefaults];
    [v23 addObserver:v3 forKeyPath:@"BKShowAllPurchases" options:1 context:off_100B1E978];
  }
  return v3;
}

- (void)addSeriesCoverObserver:(id)a3
{
  id v4 = a3;
  notify = self->_notify;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078A40;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notify, v7);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100B1E978 == a6)
  {
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FDB88;
    block[3] = &unk_100A43D60;
    block[4] = self;
    dispatch_async(sync, block);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKSeriesCoverManager;
    -[BKSeriesCoverManager observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"BKShowAllPurchases" context:off_100B1E978];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  dispatch_sync((dispatch_queue_t)self->_sync, &stru_100A46F98);
  map = self->_map;
  self->_map = 0;

  changedSeriesIDs = self->_changedSeriesIDs;
  self->_changedSeriesIDs = 0;

  observers = self->_observers;
  self->_observers = 0;

  v8.receiver = self;
  v8.super_class = (Class)BKSeriesCoverManager;
  [(BKSeriesCoverManager *)&v8 dealloc];
}

- (void)invalidateCacheForSeriesId:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sync = self->_sync;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000FDD70;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(sync, v7);
  }
}

- (void)_notifyWithChanges:(id)a3
{
  id v4 = a3;
  sync = self->_sync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FDE48;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(sync, v7);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
}

- (void)_rebuild
{
  map = self->_map;
  if (map) {
    id v4 = [(NSDictionary *)map mutableCopy];
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;
  id v6 = [(NSMutableSet *)self->_changedSeriesIDs copy];
  [(NSMutableSet *)self->_changedSeriesIDs removeAllObjects];
  if ([v6 count])
  {
    objc_super v7 = +[BKLibraryManager defaultManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000FE07C;
    v8[3] = &unk_100A46FC0;
    id v9 = v6;
    id v10 = v5;
    v11 = self;
    [v7 performBackgroundReadOnlyBlock:v8];
  }
}

- (void)assetIDsAndOptionsForBooksInSeries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100006FB4;
  v27 = sub_1000071C4;
  id v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_1000FE75C;
  v19 = &unk_100A464B0;
  v20 = self;
  v22 = &v23;
  id v8 = v6;
  id v21 = v8;
  id v9 = v17;
  os_unfair_lock_lock(&self->_accessLock);
  v18(v9);
  os_unfair_lock_unlock(&self->_accessLock);

  if ([(id)v24[5] count])
  {
    id v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10) {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v24[5]);
    }
  }
  else
  {
    uint64_t v12 = +[BKLibraryManager defaultManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FE7E0;
    v13[3] = &unk_100A455C0;
    id v14 = v8;
    v15 = self;
    id v16 = v7;
    [v12 performBlockOnWorkerQueue:v13];

    v11 = v14;
  }

  _Block_object_dispose(&v23, 8);
}

- (id)seriesIDContainingBook:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100006FB4;
  v15 = sub_1000071C4;
  id v16 = 0;
  id v4 = +[BKLibraryManager defaultManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FEE64;
  v8[3] = &unk_100A46FE8;
  id v5 = v3;
  id v9 = v5;
  id v10 = &v11;
  [v4 performNamed:@"seriesIDContainingBook" workerQueueBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)withBooksInSeries:(id)a3 performBlockAsync:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FF0C0;
  block[3] = &unk_100A45338;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sync, block);
}

- (void)removeSeriesCoverObserver:(id)a3
{
  id v4 = a3;
  notify = self->_notify;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FF3EC;
  v7[3] = &unk_100A43DD8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notify, v7);
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  p_accessLock = &self->_accessLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FF484;
  v4[3] = &unk_100A43D60;
  v4[4] = self;
  os_unfair_lock_lock(&self->_accessLock);
  sub_1000FF484((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_changedSeriesIDs, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_notify, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_map, 0);

  objc_storeStrong((id *)&self->_assetIDsAndOptionsForBooksInSeriesCache, 0);
}

@end