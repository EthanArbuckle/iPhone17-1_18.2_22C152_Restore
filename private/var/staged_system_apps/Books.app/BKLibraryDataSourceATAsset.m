@interface BKLibraryDataSourceATAsset
- (ATConnection)connection;
- (BKLibraryDataSourceATAsset)init;
- (BKLibraryManager)libraryManager;
- (BOOL)_supportsDataclass:(id)a3 assetType:(id)a4;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)connectionEstablished;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)isSyncing;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSMutableDictionary)atAssetsInFlight;
- (NSMutableSet)atAssetIDs;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)dataSourceAirTrafficEndedHandler;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (void)_syncDidFinish;
- (void)_syncDidStart;
- (void)airTrafficEnded;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)connection:(id)a3 updatedAssets:(id)a4;
- (void)connection:(id)a3 updatedProgress:(id)a4;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetsWithCompletion:(id)a3;
- (void)pushCoverForAssets:(id)a3;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setAtAssetIDs:(id)a3;
- (void)setAtAssetsInFlight:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionEstablished:(BOOL)a3;
- (void)setDataSourceAirTrafficEndedHandler:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setSyncing:(BOOL)a3;
@end

@implementation BKLibraryDataSourceATAsset

- (int64_t)rank
{
  return self->_rank;
}

- (void)connection:(id)a3 updatedAssets:(id)a4
{
  id v5 = a4;
  v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  v7 = BKATAssetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1007EFC04((uint64_t)v5, v7);
  }

  v8 = +[NSMutableSet set];
  v9 = +[NSMutableSet set];
  v10 = +[NSMutableSet set];
  v11 = +[NSMutableSet set];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001EC2DC;
  v33[3] = &unk_100A4B260;
  v33[4] = self;
  id v12 = v10;
  id v34 = v12;
  id v13 = v6;
  id v35 = v13;
  id v14 = v8;
  id v36 = v14;
  id v15 = v11;
  id v37 = v15;
  id v16 = v9;
  id v38 = v16;
  [v5 enumerateObjectsUsingBlock:v33];
  if ([v14 isSubsetOfSet:v15]) {
    [v14 minusSet:v15];
  }
  v17 = +[NSMutableSet set];
  v18 = +[NSMutableSet set];
  v19 = [(BKLibraryDataSourceATAsset *)self queue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001BEF0;
  v26[3] = &unk_100A4B2D8;
  v26[4] = self;
  id v27 = v17;
  id v28 = v16;
  id v29 = v18;
  id v30 = v14;
  id v31 = v13;
  id v32 = v12;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v23 = v18;
  id v24 = v16;
  id v25 = v17;
  dispatch_sync(v19, v26);
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
}

- (void)setDataSourceAirTrafficEndedHandler:(id)a3
{
}

- (void)setConnectionEstablished:(BOOL)a3
{
  self->_connectionEstablished = a3;
}

- (void)setAtAssetIDs:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isSyncing
{
  return self->_syncing;
}

- (BKLibraryDataSourceATAsset)init
{
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryDataSourceATAsset;
  v3 = [(BKLibraryDataSourceATAsset *)&v17 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ibooks.BKLibraryDataSourceATAssetQueue", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    atAssetIDs = v3->_atAssetIDs;
    v3->_atAssetIDs = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    atAssetsInFlight = v3->_atAssetsInFlight;
    v3->_atAssetsInFlight = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    connection = v3->_connection;
    v3->_connection = (ATConnection *)v11;

    [(ATConnection *)v3->_connection setDelegate:v3];
    id v13 = v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100078E48;
    block[3] = &unk_100A43D60;
    id v16 = v3;
    dispatch_async(v13, block);
  }
  kdebug_trace();
  return v3;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ibooks.progress.airtraffic";
}

- (BOOL)connectionEstablished
{
  return self->_connectionEstablished;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"Dataclass"];
  char v7 = [(BKLibraryDataSourceATAsset *)self _supportsDataclass:v6 assetType:0];
  v8 = BKATAssetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1007EFADC(v5, v7, v8);
  }

  if ((v7 & 1) != 0 || [(BKLibraryDataSourceATAsset *)self isSyncing])
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"Enabled"];
    id v10 = [v9 BOOLValue];

    if (v10 != [(BKLibraryDataSourceATAsset *)self isSyncing])
    {
      [(BKLibraryDataSourceATAsset *)self setSyncing:v10];
      if (v10) {
        [(BKLibraryDataSourceATAsset *)self _syncDidStart];
      }
      else {
        [(BKLibraryDataSourceATAsset *)self _syncDidFinish];
      }
    }
  }
}

- (NSMutableSet)atAssetIDs
{
  return self->_atAssetIDs;
}

- (BOOL)_supportsDataclass:(id)a3 assetType:(id)a4
{
  return [a3 isEqualToString:@"Book" a4];
}

- (void)dealloc
{
  [(ATConnection *)self->_connection setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryDataSourceATAsset;
  [(BKLibraryDataSourceATAsset *)&v3 dealloc];
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceATAsset *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EBB7C;
  v7[3] = &unk_100A443F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)coverSourceRank
{
  return 4;
}

- (void)pushCoverForAssets:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 assetID:v19];
        id v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v10 temporaryAssetID];
        }
        id v14 = v13;

        id v15 = [v10 atAsset];
        id v16 = [v15 icon];
        objc_super v17 = [v16 path];

        if (v14 && [v17 length]) {
          [v4 setObject:v17 forKeyedSubscript:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    v18 = +[BCCacheManager defaultCacheManager];
    [v18 addFilePaths:v4 priority:3 quality:206];
  }
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!a4)
  {
    uint64_t v9 = BKATAssetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007EFA98(v9);
    }
  }
  id v10 = objc_retainBlock(v8);
  uint64_t v11 = v10;
  if (v10) {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 temporaryAssetID];
  if (v7)
  {
    id v8 = [(BKLibraryDataSourceATAsset *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001EC05C;
    block[3] = &unk_100A45338;
    void block[4] = self;
    id v12 = v7;
    id v13 = v6;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = objc_retainBlock(v6);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryDataSourceATAsset *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EC1E4;
  block[3] = &unk_100A45338;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  return 1;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (void)airTrafficEnded
{
  id v3 = BKATAssetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceATAsset-airTrafficEnded: scheduling a plist reload", buf, 2u);
  }

  dispatch_time_t v4 = dispatch_time(0, 1500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EC8DC;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_syncDidStart
{
  v2 = BKATAssetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1007EFD1C(v2);
  }
}

- (void)_syncDidFinish
{
  id v3 = [(BKLibraryDataSourceATAsset *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EC9FC;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (id)dataSourceAirTrafficEndedHandler
{
  return self->_dataSourceAirTrafficEndedHandler;
}

- (ATConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setSyncing:(BOOL)a3
{
  self->_syncing = a3;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)atAssetsInFlight
{
  return self->_atAssetsInFlight;
}

- (void)setAtAssetsInFlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atAssetsInFlight, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_atAssetIDs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_dataSourceAirTrafficEndedHandler, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end