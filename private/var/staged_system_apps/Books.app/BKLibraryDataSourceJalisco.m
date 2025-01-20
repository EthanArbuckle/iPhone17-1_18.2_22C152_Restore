@interface BKLibraryDataSourceJalisco
+ (BOOL)isShowPurchasesEnabled;
+ (void)initialize;
+ (void)setShowPurchasesEnabled:(BOOL)a3;
- (BCRemoteManagedObjectIDMonitor)bookletAssetMonitor;
- (BCRemoteManagedObjectIDMonitor)libraryAssetMonitor;
- (BKLibraryDataSourceJalisco)initWithIdentifier:(id)a3;
- (BKLibraryDataSourcePlistWriting)plistWriter;
- (BKLibraryManager)libraryManager;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)processingAuthentication;
- (BOOL)requestedAuthentication;
- (BOOL)shouldReloadAfterAssetAdded;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSMutableArray)monitoredStoreIDs;
- (NSPredicate)bookletItemsPredicate;
- (NSString)description;
- (NSString)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (id)_bookletItemForStoreID:(id)a3 moc:(id)a4;
- (id)_bookletItemsForStoreIDSet:(id)a3 moc:(id)a4 dedupe:(BOOL)a5;
- (id)_jaliscoAssetsForStoreIDs:(id)a3 moc:(id)a4 dedupe:(BOOL)a5;
- (id)_serverItemForStoreID:(id)a3 moc:(id)a4;
- (id)_serverItemsForStoreIDSet:(id)a3 moc:(id)a4 dedupe:(BOOL)a5;
- (id)_supplementalAssetForStoreID:(id)a3;
- (id)_supplementalAssetFromServerBookletItem:(id)a3;
- (id)_supplementalAssetsForBookletStoreIDs:(id)a3 moc:(id)a4 dedupe:(BOOL)a5;
- (id)fetchCompletion;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (unint64_t)propagateDataProperties;
- (void)_processLibraryAssetChanges:(id)a3 bookletItems:(BOOL)a4;
- (void)_updateProcessingAuthenticationState;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)beginAuthentication:(id)a3;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)clientDetectedPredicateChange:(id)a3;
- (void)clientDetectedStoreChange:(id)a3;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetIDsWithPredicate:(id)a3 bookletPredicate:(id)a4 completion:(id)a5;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)fetchReadyPurchaseItemStoreIDs:(id)a3 completion:(id)a4;
- (void)finalizeAuthentication:(id)a3;
- (void)hiddenAssetStoreIDsWithCompletion:(id)a3;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)managedObjectBackgroundMonitor:(id)a3 fetchNotify:(id)a4;
- (void)mostRecentPurchaseDate:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadPurchaseItemStoreIDs:(id)a3 completion:(id)a4;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setBookletAssetMonitor:(id)a3;
- (void)setBookletItemsPredicate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFetchCompletion:(id)a3;
- (void)setLibraryAssetMonitor:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setMonitoredStoreIDs:(id)a3;
- (void)setPlistWriter:(id)a3;
- (void)setProcessingAuthentication:(BOOL)a3;
- (void)setRank:(int64_t)a3;
- (void)setRequestedAuthentication:(BOOL)a3;
- (void)setShouldReloadAfterAssetAdded:(BOOL)a3;
- (void)updatePurchaseItemsWithCompletion:(id)a3;
@end

@implementation BKLibraryDataSourceJalisco

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    v2 = +[NSNumber numberWithBool:1];
    [v5 setObject:v2 forKey:@"BKShowAllPurchases"];

    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 registerDefaults:v5];

    v4 = dispatch_get_global_queue(-2, 0);
    dispatch_async(v4, &stru_100A4C000);
  }
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setLibraryManager:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BKLibraryDataSourceJalisco)initWithIdentifier:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  v6 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[JaliscoDS] initWithIdentifier: %@", buf, 0xCu);
  }

  v18.receiver = self;
  v18.super_class = (Class)BKLibraryDataSourceJalisco;
  v7 = [(BKLibraryDataSourceJalisco *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_identifier, a3);
    id v9 = [v5 stringByAppendingString:@".dispatchQueue"];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    monitoredStoreIDs = v8->_monitoredStoreIDs;
    v8->_monitoredStoreIDs = v12;

    v14 = +[BKLibraryDataSourceJaliscoDAAPClientProxy sharedproxy];
    [v14 registerDataSource:v8];

    v15 = +[BLJaliscoDAAPClient sharedClient];
    [v15 addObserver:v8 forKeyPath:@"initiallyLoadingJalisco" options:0 context:off_100B22340];

    v16 = +[BLDownloadQueue sharedInstance];
    [v16 addObserver:v8];
  }
  kdebug_trace();

  return v8;
}

- (void)setShouldReloadAfterAssetAdded:(BOOL)a3
{
  self->_shouldReloadAfterAssetAdded = a3;
}

- (void)setPlistWriter:(id)a3
{
}

- (void)dealloc
{
  v3 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceJalisco identifier: %@ dealloc", buf, 0xCu);
  }
  id v5 = +[BKLibraryDataSourceJaliscoDAAPClientProxy sharedproxy];
  [v5 unregisterDataSource:self];

  v6 = +[BLJaliscoDAAPClient sharedClient];
  [v6 removeObserver:self forKeyPath:@"initiallyLoadingJalisco" context:off_100B22340];

  v7 = +[BLDownloadQueue sharedInstance];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryDataSourceJalisco;
  [(BKLibraryDataSourceJalisco *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100B22340 == a6)
  {
    v13 = self;
    objc_sync_enter(v13);
    [(BKLibraryDataSourceJalisco *)v13 _updateProcessingAuthenticationState];
    objc_sync_exit(v13);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKLibraryDataSourceJalisco;
    [(BKLibraryDataSourceJalisco *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)isEnabled
{
  return 1;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(BKLibraryDataSourceJalisco *)self identifier];
  v6 = +[NSString stringWithFormat:@"<%@=%p id=%@ rank=%ld>", v4, self, v5, [(BKLibraryDataSourceJalisco *)self rank]];

  return (NSString *)v6;
}

- (unint64_t)propagateDataProperties
{
  return 268370174;
}

- (void)fetchAssetIDsWithPredicate:(id)a3 bookletPredicate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100209B20;
  v15[3] = &unk_100A4C028;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = +[BLJaliscoDAAPClient sharedClient];
  v6 = [v5 predicateForItems:0];

  v7 = +[BLJaliscoDAAPClient sharedClient];
  id v8 = [v7 predicateForBookletItems:0];

  id v9 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412802;
    v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ [JaliscoDS] fetchAssetIDsWithCompletion: predicate %@. bookletPredicate %@", buf, 0x20u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10020A2A0;
  v12[3] = &unk_100A46800;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(BKLibraryDataSourceJalisco *)self fetchAssetIDsWithPredicate:v6 bookletPredicate:v8 completion:v12];
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020A4BC;
  block[3] = &unk_100A45338;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (int64_t)coverSourceRank
{
  return 3;
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
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
    id v5 = v6;
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
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 storeID];
  id v12 = [v10 assetID];
  id v13 = [v10 title];
  id v14 = [v10 storePlaylistID];
  unsigned __int8 v15 = [v10 isSupplementalContent];

  dispatchQueue = self->_dispatchQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10020ADE8;
  v23[3] = &unk_100A459F8;
  v23[4] = self;
  id v24 = v12;
  unsigned __int8 v30 = v15;
  id v25 = v13;
  id v26 = v11;
  id v27 = v14;
  id v28 = v8;
  id v29 = v9;
  id v17 = v9;
  id v18 = v8;
  id v19 = v14;
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(dispatchQueue, v23);
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 storeID];
  id v9 = [v7 assetID];
  id v10 = [v7 title];
  unsigned __int8 v11 = [v7 isSupplementalContent];

  id v12 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412802;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ assetForLibraryAsset: (assetID:%@, title:%@)", buf, 0x20u);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020BAC0;
  block[3] = &unk_100A4ACC0;
  unsigned __int8 v23 = v11;
  id v19 = v8;
  id v20 = self;
  id v21 = v10;
  id v22 = v6;
  id v15 = v10;
  id v16 = v6;
  id v17 = v8;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 1;
}

- (BOOL)canMakeAssetsLocal
{
  return 1;
}

- (void)mostRecentPurchaseDate:(id)a3
{
  id v4 = a3;
  +[BCStopWatch stopwatch];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020BF34;
  v7[3] = &unk_100A467D8;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [(BKLibraryDataSourceJalisco *)self fetchAssetIDsWithCompletion:v7];
}

- (void)hiddenAssetStoreIDsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BLJaliscoDAAPClient sharedClient];
  [v4 fetchAllHiddenItemStoreIDsWithCompletion:v3];
}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v5 = a4;
  id v6 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412546;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceJalisco %@ purchasedDidCompleteWithResponse: %@", buf, 0x16u);
  }
  id v8 = +[BLJaliscoDAAPClient sharedClient];
  id v9 = [v8 newManagedObjectContext];

  id v10 = [v5 storeID];
  unsigned __int8 v11 = [v10 stringValue];

  id v12 = [v5 purchaseParameters];
  if ([v11 length])
  {
    id v13 = +[BLJaliscoDAAPClient sharedClient];
    uint64_t v14 = [v13 fetchRequestForStoreID:v11];
  }
  else
  {
    if (![v12 length])
    {
      id v15 = 0;
      goto LABEL_14;
    }
    id v13 = +[BLJaliscoDAAPClient sharedClient];
    uint64_t v14 = [v13 fetchRequestForBuyParameters:v12];
  }
  id v15 = (void *)v14;

  if (!v15)
  {
LABEL_14:
    id v16 = 0;
    id v17 = 0;
    goto LABEL_15;
  }
  id v20 = 0;
  id v16 = [v9 executeFetchRequest:v15 error:&v20];
  id v17 = v20;
  if (![v16 count])
  {
    id v18 = +[BDSJaliscoDAAPClient sharedClient];
    [v18 updatePolitely:0 reason:13 completion:&stru_100A4C048];

    if (v17)
    {
      id v19 = BKLibraryDataSourceJaliscoLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1007F19D0();
      }
    }
  }
LABEL_15:
}

- (id)_serverItemForStoreID:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BLJaliscoDAAPClient sharedClient];
  id v8 = [v7 fetchRequestForStoreID:v6];

  uint64_t v12 = 0;
  id v9 = [v5 executeFetchRequest:v8 error:&v12];

  id v10 = [v9 firstObject];

  return v10;
}

- (id)_bookletItemForStoreID:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BLJaliscoDAAPClient sharedClient];
  id v8 = +[NSSet setWithObject:v6];

  id v9 = [v7 fetchRequestForBookletItems:v8];

  uint64_t v13 = 0;
  id v10 = [v5 executeFetchRequest:v9 error:&v13];

  unsigned __int8 v11 = [v10 firstObject];

  return v11;
}

- (id)_serverItemsForStoreIDSet:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[BLJaliscoDAAPClient sharedClient];
  id v10 = [v9 fetchRequestForStoreIDs:v8];

  uint64_t v14 = 0;
  unsigned __int8 v11 = [v7 executeFetchRequest:v10 error:&v14];

  if (v5)
  {
    uint64_t v12 = [v11 bu_arrayByRemovingItemsWithDuplicateValuesForKey:@"storeID"];

    unsigned __int8 v11 = (void *)v12;
  }

  return v11;
}

- (id)_bookletItemsForStoreIDSet:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[BLJaliscoDAAPClient sharedClient];
  id v10 = [v9 fetchRequestForBookletItems:v8];

  uint64_t v14 = 0;
  unsigned __int8 v11 = [v7 executeFetchRequest:v10 error:&v14];

  if (v5)
  {
    uint64_t v12 = [v11 bu_arrayByRemovingItemsWithDuplicateValuesForKey:@"storeID"];

    unsigned __int8 v11 = (void *)v12;
  }

  return v11;
}

- (id)_jaliscoAssetsForStoreIDs:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = +[NSSet setWithArray:v8];
    unsigned __int8 v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    uint64_t v12 = [(BKLibraryDataSourceJalisco *)self _serverItemsForStoreIDSet:v10 moc:v9 dedupe:v5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10020CADC;
    v15[3] = &unk_100A4C070;
    id v13 = v11;
    id v16 = v13;
    id v17 = self;
    [v12 enumerateObjectsUsingBlock:v15];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_supplementalAssetsForBookletStoreIDs:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = +[NSSet setWithArray:v8];
    unsigned __int8 v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    uint64_t v12 = [(BKLibraryDataSourceJalisco *)self _bookletItemsForStoreIDSet:v10 moc:v9 dedupe:v5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10020CCB0;
    v15[3] = &unk_100A4C098;
    id v13 = v11;
    id v16 = v13;
    id v17 = self;
    [v12 enumerateObjectsUsingBlock:v15];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_supplementalAssetFromServerBookletItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [v4 parentItem];
    id v6 = [(BKLibraryDataSourceJalisco *)self identifier];
    id v7 = +[BKJaliscoAsset newAssetFromServerItem:v5 dataSourceIdentifier:v6];

    id v8 = +[BLJaliscoBookletItem itemWithServerBookletItem:v4];

    id v9 = [(BKLibraryDataSourceJalisco *)self identifier];
    id v10 = +[BKLibrarySupplementalAsset newAssetFromJaliscoBookletItem:v8 parentAsset:v7 dataSourceIdentifier:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_supplementalAssetForStoreID:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BLJaliscoDAAPClient sharedClient];
  id v6 = [v5 newManagedObjectContext];

  id v7 = [(BKLibraryDataSourceJalisco *)self _bookletItemForStoreID:v4 moc:v6];

  id v8 = [(BKLibraryDataSourceJalisco *)self _supplementalAssetFromServerBookletItem:v7];

  return v8;
}

- (void)beginAuthentication:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:BKLibraryAuthenticationServiceStore])
  {
    id v4 = self;
    objc_sync_enter(v4);
    v4->_requestedAuthentication = 1;
    [(BKLibraryDataSourceJalisco *)v4 _updateProcessingAuthenticationState];
    objc_sync_exit(v4);
  }
}

- (void)finalizeAuthentication:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:BKLibraryAuthenticationServiceStore])
  {
    id v4 = self;
    objc_sync_enter(v4);
    v4->_requestedAuthentication = 0;
    [(BKLibraryDataSourceJalisco *)v4 _updateProcessingAuthenticationState];
    objc_sync_exit(v4);
  }
}

- (void)_updateProcessingAuthenticationState
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020D030;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020D16C;
  block[3] = &unk_100A443C8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 fetchNotify:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412546;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ managedObjectBackgroundMonitor called with monitor: %@", buf, 0x16u);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020D4F8;
  block[3] = &unk_100A443C8;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_processLibraryAssetChanges:(id)a3 bookletItems:(BOOL)a4
{
  BOOL v66 = a4;
  id v5 = a3;
  id v6 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412546;
    v77 = v7;
    __int16 v78 = 2112;
    id v79 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ _processLibraryAssetChanges %@", buf, 0x16u);
  }
  id v8 = [v5 deletedObjects];
  if ([v8 count])
  {
    id v9 = [v5 deletedObjects];
  }
  else
  {
    id v9 = 0;
  }

  id v10 = [v5 addedObjects];
  if ([v10 count])
  {
    id v11 = [v5 addedObjects];
  }
  else
  {
    id v11 = 0;
  }

  v64 = +[BLJaliscoDAAPClient sharedClient];
  id v12 = [v64 newManagedObjectContext];
  id v13 = +[NSMutableSet setWithArray:v9];
  [v13 addObjectsFromArray:v11];
  v63 = v13;
  if (v66) {
    [(BKLibraryDataSourceJalisco *)self _bookletItemsForStoreIDSet:v13 moc:v12 dedupe:0];
  }
  else {
  id v14 = [(BKLibraryDataSourceJalisco *)self _serverItemsForStoreIDSet:v13 moc:v12 dedupe:0];
  }
  id v15 = [v14 valueForKey:@"storeID"];
  id v16 = +[NSCountedSet setWithArray:v15];

  id v65 = v12;
  if ([v9 count])
  {
    id v17 = objc_opt_new();
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10020E3BC;
    v71[3] = &unk_100A4C0C0;
    id v72 = v16;
    BOOL v75 = v66;
    id v18 = v17;
    id v73 = v18;
    v74 = self;
    [v9 enumerateObjectsUsingBlock:v71];
    __int16 v19 = [v18 valueForKey:@"storeID"];
    id v20 = BKLibraryDataSourceJaliscoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [(BKLibraryDataSourceJalisco *)self identifier];
      id v61 = v5;
      v22 = id v21 = v16;
      __int16 v23 = v11;
      id v24 = v9;
      id v25 = [v18 count];
      __int16 v26 = [v19 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412802;
      v77 = v22;
      __int16 v78 = 2048;
      id v79 = v25;
      id v9 = v24;
      id v11 = v23;
      id v12 = v65;
      __int16 v80 = 2112;
      v81 = v26;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ Telling library to remove %ld assets:[%@]", buf, 0x20u);

      id v16 = v21;
      id v5 = v61;
    }
    id v27 = [(BKLibraryDataSourceJalisco *)self libraryManager];
    [v27 libraryDataSource:self removedAssets:v18];
  }
  if ([v11 count])
  {
    __int16 v28 = +[NSCountedSet setWithArray:v11];
    id v29 = objc_opt_new();
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10020E4AC;
    v67[3] = &unk_100A4C0E8;
    v62 = v16;
    id v68 = v16;
    id v30 = v28;
    id v69 = v30;
    id v31 = v29;
    id v70 = v31;
    [v30 enumerateObjectsUsingBlock:v67];
    if (v66)
    {
      v32 = [(BKLibraryDataSourceJalisco *)self _supplementalAssetsForBookletStoreIDs:v31 moc:v12 dedupe:1];
      v33 = BKLibraryDataSourceJaliscoLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [(BKLibraryDataSourceJalisco *)self identifier];
        v35 = v9;
        id v36 = [v32 count];
        [v31 componentsJoinedByString:@", "];
        v37 = v59 = v11;
        *(_DWORD *)buf = 138412802;
        v77 = v34;
        __int16 v78 = 2048;
        id v79 = v36;
        id v9 = v35;
        id v12 = v65;
        __int16 v80 = 2112;
        v81 = v37;
        v38 = "%@ Telling library we added %ld booklet assets, storeIDs=[%@]";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v38, buf, 0x20u);

        id v11 = v59;
      }
    }
    else
    {
      v32 = [(BKLibraryDataSourceJalisco *)self _jaliscoAssetsForStoreIDs:v31 moc:v12 dedupe:1];
      v33 = BKLibraryDataSourceJaliscoLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [(BKLibraryDataSourceJalisco *)self identifier];
        v39 = v9;
        id v40 = [v32 count];
        [v31 componentsJoinedByString:@", "];
        v37 = v59 = v11;
        *(_DWORD *)buf = 138412802;
        v77 = v34;
        __int16 v78 = 2048;
        id v79 = v40;
        id v9 = v39;
        id v12 = v65;
        __int16 v80 = 2112;
        v81 = v37;
        v38 = "%@ Telling library we added %ld assets, storeIDs=[%@]";
        goto LABEL_22;
      }
    }

    v41 = +[BCCacheManager defaultCacheManager];
    [v41 addProductProfileIDs:v31 priority:3];

    v42 = [(BKLibraryDataSourceJalisco *)self libraryManager];
    [v42 libraryDataSource:self addedAssets:v32];

    if ([(BKLibraryDataSourceJalisco *)self shouldReloadAfterAssetAdded])
    {
      v43 = [(BKLibraryDataSourceJalisco *)self libraryManager];
      [v43 reloadDataSource:self completion:0];
    }
    id v16 = v62;
  }
  v44 = [v5 updatedObjects:v59];
  if ([v44 count])
  {
    v45 = [v5 updatedObjects];
  }
  else
  {
    v45 = 0;
  }

  if ([v45 count])
  {
    v60 = v9;
    if (v66)
    {
      v46 = [(BKLibraryDataSourceJalisco *)self _supplementalAssetsForBookletStoreIDs:v45 moc:v65 dedupe:1];
      v47 = BKLibraryDataSourceJaliscoLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = [(BKLibraryDataSourceJalisco *)self identifier];
        id v49 = [v46 count];
        [v45 componentsJoinedByString:@", "];
        id v50 = v5;
        v51 = v16;
        v53 = v52 = v11;
        *(_DWORD *)buf = 138412802;
        v77 = v48;
        __int16 v78 = 2048;
        id v79 = v49;
        __int16 v80 = 2112;
        v81 = v53;
        v54 = "%@ Telling library we updated %ld booklet assets, storeIDs=[%@]";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v54, buf, 0x20u);

        id v11 = v52;
        id v16 = v51;
        id v5 = v50;
      }
    }
    else
    {
      v46 = [(BKLibraryDataSourceJalisco *)self _jaliscoAssetsForStoreIDs:v45 moc:v65 dedupe:1];
      v47 = BKLibraryDataSourceJaliscoLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = [(BKLibraryDataSourceJalisco *)self identifier];
        id v55 = [v46 count];
        [v45 componentsJoinedByString:@", "];
        id v50 = v5;
        v51 = v16;
        v53 = v52 = v11;
        *(_DWORD *)buf = 138412802;
        v77 = v48;
        __int16 v78 = 2048;
        id v79 = v55;
        __int16 v80 = 2112;
        v81 = v53;
        v54 = "%@ Telling library we updated %ld assets, storeIDs=[%@]";
        goto LABEL_35;
      }
    }

    v56 = +[BCCacheManager defaultCacheManager];
    v57 = +[NSSet setWithArray:v45];
    [v56 incrementVersionForIdentifiers:v57];

    v58 = [(BKLibraryDataSourceJalisco *)self libraryManager];
    [v58 libraryDataSource:self updatedAssets:v46];

    id v9 = v60;
    id v12 = v65;
  }
}

- (void)clientDetectedStoreChange:(id)a3
{
  id v4 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(BKLibraryDataSourceJalisco *)self identifier];
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ clientDetectedStoreChange triggering reload of jalisco datasource", buf, 0xCu);
  }
  id v6 = [(BKLibraryDataSourceJalisco *)self libraryManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020E698;
  v7[3] = &unk_100A43D60;
  v7[4] = self;
  [v6 reloadDataSource:self completion:v7];
}

- (void)clientDetectedPredicateChange:(id)a3
{
  id v4 = BKLibraryDataSourceJaliscoLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(BKLibraryDataSourceJalisco *)self identifier];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ clientDetectedPredicateChange triggering reload of jalisco datasource", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(BKLibraryDataSourceJalisco *)self libraryManager];
  [v6 reloadDataSource:self completion:0];
}

+ (BOOL)isShowPurchasesEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKShowAllPurchases"];

  return v3;
}

+ (void)setShowPurchasesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"BKShowAllPurchases"];
}

- (void)fetchReadyPurchaseItemStoreIDs:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[BLJaliscoDAAPClient sharedClient];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10020E9A4;
  v9[3] = &unk_100A4A688;
  id v10 = v5;
  id v8 = v5;
  [v7 storeIDsWithNonEmptyPurchasedToken:v6 completion:v9];
}

- (void)updatePurchaseItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceJalisco *)self libraryManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020EAD0;
  v7[3] = &unk_100A442B8;
  id v8 = v4;
  id v6 = v4;
  [v5 reloadDataSource:self completion:v7];
}

- (void)reloadPurchaseItemStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BDSJaliscoDAAPClient sharedClient];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10020EBF0;
  v10[3] = &unk_100A44AF8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 resetPurchasedTokenForStoreIDs:v7 completion:v10];
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (BOOL)shouldReloadAfterAssetAdded
{
  return self->_shouldReloadAfterAssetAdded;
}

- (BKLibraryDataSourcePlistWriting)plistWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plistWriter);

  return (BKLibraryDataSourcePlistWriting *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BCRemoteManagedObjectIDMonitor)libraryAssetMonitor
{
  return self->_libraryAssetMonitor;
}

- (void)setLibraryAssetMonitor:(id)a3
{
}

- (BCRemoteManagedObjectIDMonitor)bookletAssetMonitor
{
  return self->_bookletAssetMonitor;
}

- (void)setBookletAssetMonitor:(id)a3
{
}

- (NSMutableArray)monitoredStoreIDs
{
  return self->_monitoredStoreIDs;
}

- (void)setMonitoredStoreIDs:(id)a3
{
}

- (NSPredicate)bookletItemsPredicate
{
  return self->_bookletItemsPredicate;
}

- (void)setBookletItemsPredicate:(id)a3
{
}

- (id)fetchCompletion
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setFetchCompletion:(id)a3
{
}

- (BOOL)processingAuthentication
{
  return self->_processingAuthentication;
}

- (void)setProcessingAuthentication:(BOOL)a3
{
  self->_processingAuthentication = a3;
}

- (BOOL)requestedAuthentication
{
  return self->_requestedAuthentication;
}

- (void)setRequestedAuthentication:(BOOL)a3
{
  self->_requestedAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchCompletion, 0);
  objc_storeStrong((id *)&self->_bookletItemsPredicate, 0);
  objc_storeStrong((id *)&self->_monitoredStoreIDs, 0);
  objc_storeStrong((id *)&self->_bookletAssetMonitor, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_plistWriter);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end