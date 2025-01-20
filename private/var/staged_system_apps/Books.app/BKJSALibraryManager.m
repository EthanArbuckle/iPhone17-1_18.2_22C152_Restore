@interface BKJSALibraryManager
- (BKJSALibraryManager)initWithLibraryAssetProvider:(id)a3 presentersProvider:(id)a4 storeController:(id)a5;
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKLibraryItemStateProvider)libraryItemStateProvider;
- (BKPresentersProvider)presentersProvider;
- (BKStoreController)storeController;
- (OS_dispatch_queue)queue;
- (id)_contentDataForContentID:(id)a3 tracker:(id)a4;
- (id)_contentDataForLibraryAsset:(id)a3 contentID:(id)a4 tracker:(id)a5;
- (id)_libraryAssetWithContentID:(id)a3;
- (id)_transactionFromOptions:(id)a3;
- (id)_transactionFromOptionsForShowAsset:(id)a3;
- (id)mostRecentPurchaseDate;
- (int64_t)_contentTypeForContentID:(id)a3 withLibraryAsset:(id)a4;
- (void)_displayStoreConnectionErrorAlert:(BOOL)a3;
- (void)_downloadAssetID:(id)a3 redownloadParameters:(id)a4 isAudiobook:(BOOL)a5 hasRacSupport:(BOOL)a6 tracker:(id)a7 callback:(id)a8;
- (void)_downloadAssetIDs:(id)a3 callback:(id)a4;
- (void)_fetchFinishedLibraryAssetWithAssetID:(id)a3 waitForNewAssetIfNeeded:(BOOL)a4 callback:(id)a5;
- (void)_markAsset:(id)a3 asFinished:(BOOL)a4 completion:(id)a5;
- (void)_openAssetID:(id)a3 options:(id)a4 sampleURL:(id)a5 isSample:(BOOL)a6 tracker:(id)a7 callback:(id)a8;
- (void)_openSample:(id)a3 options:(id)a4 sampleURL:(id)a5 contentData:(id)a6 tracker:(id)a7 callback:(id)a8;
- (void)_previewAssetID:(id)a3 asset:(id)a4 fullScreen:(BOOL)a5 tracker:(id)a6 callback:(id)a7;
- (void)_processAssets:(id)a3 processor:(id)a4 callback:(id)a5;
- (void)_updateAssetIDs:(id)a3 callback:(id)a4;
- (void)addAssetID:(id)a3 toCollectionID:(id)a4 tracker:(id)a5 completionHandler:(id)a6;
- (void)addBookToWantToReadCollection:(id)a3 :(id)a4 :(id)a5;
- (void)cancelDownloadForAssetID:(id)a3 completionHandler:(id)a4;
- (void)cancelDownloadForBook:(id)a3 :(id)a4 :(id)a5;
- (void)downloadAssetIDs:(id)a3 completionHandler:(id)a4;
- (void)downloadBookWithRedownloadParameters:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6 :(BOOL)a7;
- (void)downloadBooks:(id)a3 :(id)a4;
- (void)filterPurchasedBooks:(id)a3 callback:(id)a4;
- (void)getCollectionNameForCollectionID:(id)a3 :(id)a4;
- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3;
- (void)getVersion:(id)a3;
- (void)markBookAsFinished:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6;
- (void)openAssetID:(id)a3 options:(id)a4 tracker:(id)a5 completionHandler:(id)a6;
- (void)openBook:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)openBook:(id)a3 options:(id)a4;
- (void)openSampleBook:(id)a3 downloadSampleURL:(id)a4 options:(id)a5 callback:(id)a6 tracker:(id)a7;
- (void)performAddRequest:(id)a3 completionHandler:(id)a4;
- (void)performRemoveRequest:(id)a3 completionHandler:(id)a4;
- (void)previewAssetID:(id)a3 asset:(id)a4 tracker:(id)a5 completionHandler:(id)a6;
- (void)previewAudiobook:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 tracker:(id)a5 completionHandler:(id)a6;
- (void)removeBookFromWantToReadCollection:(id)a3 :(id)a4 :(id)a5;
- (void)sampleAssetID:(id)a3 url:(id)a4 options:(id)a5 tracker:(id)a6 completionHandler:(id)a7;
- (void)setFinishedDateForAssetID:(id)a3 toDate:(id)a4 tracker:(id)a5 callback:(id)a6;
- (void)setFinishedYearForAssetID:(id)a3 toYearOfDate:(id)a4 tracker:(id)a5 callback:(id)a6;
- (void)setLibraryItemStateProvider:(id)a3;
- (void)setPresentersProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStoreController:(id)a3;
- (void)showCollection:(id)a3 :(id)a4;
- (void)unsetFinishedDateForAssetID:(id)a3 callback:(id)a4;
- (void)updateAssetIDs:(id)a3 completionHandler:(id)a4;
- (void)updateBooks:(id)a3 :(id)a4;
@end

@implementation BKJSALibraryManager

- (BKJSALibraryManager)initWithLibraryAssetProvider:(id)a3 presentersProvider:(id)a4 storeController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BKJSALibraryManager;
  v11 = [(BKJSALibraryManager *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_libraryAssetProvider, v8);
    objc_storeWeak((id *)&v12->_presentersProvider, v9);
    objc_storeStrong((id *)&v12->_storeController, a5);
    if (!v12->_storeController)
    {
      v13 = JSALog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_1007EE144(v13);
      }
    }
    v14 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("BKJSALibraryManager.queue", v14);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;
  }
  return v12;
}

- (void)openAssetID:(id)a3 options:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
}

- (void)sampleAssetID:(id)a3 url:(id)a4 options:(id)a5 tracker:(id)a6 completionHandler:(id)a7
{
}

- (void)previewAssetID:(id)a3 asset:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
}

- (void)downloadAssetIDs:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019501C;
  v7[3] = &unk_100A48430;
  id v8 = a4;
  id v6 = v8;
  [(BKJSALibraryManager *)self _downloadAssetIDs:a3 callback:v7];
}

- (void)cancelDownloadForAssetID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKJSALibraryManager *)self libraryAssetProvider];
  id v16 = v6;
  id v9 = +[NSArray arrayWithObjects:&v16 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001951A0;
  v12[3] = &unk_100A495D0;
  v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v8 fetchLibraryAssetsFromAssetIDs:v9 handler:v12];
}

- (void)updateAssetIDs:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100195350;
  v7[3] = &unk_100A48430;
  id v8 = a4;
  id v6 = v8;
  [(BKJSALibraryManager *)self _updateAssetIDs:a3 callback:v7];
}

- (void)addAssetID:(id)a3 toCollectionID:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)BSUIAssetActionModifyRequest) initWithStoreID:v13 collectionID:v12 tracker:v11];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001954A0;
  v16[3] = &unk_100A495F8;
  id v17 = v10;
  id v15 = v10;
  [(BKJSALibraryManager *)self performAddRequest:v14 completionHandler:v16];
}

- (void)performAddRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 storeID];
  id v9 = [v7 collectionID];
  id v10 = [v7 tracker];

  id v11 = [objc_alloc((Class)BKCollectionControllerMemberManagingAddRequest) initWithStoreID:v8 collectionID:v9 forceToTop:0];
  id v12 = [(BKJSALibraryManager *)self libraryAssetProvider];
  id v13 = [v12 collectionController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100195664;
  v15[3] = &unk_100A49620;
  v15[4] = self;
  v15[5] = v8;
  v15[6] = v10;
  v15[7] = v9;
  id v16 = v6;
  id v14 = v6;
  [v13 performAddRequest:v11 completion:v15];
}

- (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)BSUIAssetActionModifyRequest) initWithStoreID:v13 collectionID:v12 tracker:v11];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10019599C;
  v16[3] = &unk_100A495F8;
  id v17 = v10;
  id v15 = v10;
  [(BKJSALibraryManager *)self performRemoveRequest:v14 completionHandler:v16];
}

- (void)performRemoveRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 storeID];
  id v9 = [v7 collectionID];
  id v10 = [v7 tracker];

  id v11 = [objc_alloc((Class)BKCollectionControllerMemberManagingRemoveRequest) initWithStoreID:v8 collectionID:v9];
  id v12 = [(BKJSALibraryManager *)self libraryAssetProvider];
  id v13 = [v12 collectionController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100195B5C;
  v15[3] = &unk_100A49620;
  v15[4] = self;
  v15[5] = v8;
  v15[6] = v10;
  v15[7] = v9;
  id v16 = v6;
  id v14 = v6;
  [v13 performRemoveRequest:v11 completion:v15];
}

- (void)_fetchFinishedLibraryAssetWithAssetID:(id)a3 waitForNewAssetIfNeeded:(BOOL)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  +[BKLibraryManager defaultManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100195E4C;
  v13[3] = &unk_100A49648;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  BOOL v18 = a4;
  id v16 = self;
  id v17 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  [v12 performBlockOnWorkerQueue:v13];
}

- (void)setFinishedDateForAssetID:(id)a3 toDate:(id)a4 tracker:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10019619C;
  v17[3] = &unk_100A49670;
  id v21 = v10;
  id v22 = a6;
  id v18 = v11;
  id v19 = v12;
  v20 = self;
  id v13 = v10;
  id v14 = v12;
  id v15 = v22;
  id v16 = v11;
  [(BKJSALibraryManager *)self _fetchFinishedLibraryAssetWithAssetID:v13 waitForNewAssetIfNeeded:1 callback:v17];
}

- (void)setFinishedYearForAssetID:(id)a3 toYearOfDate:(id)a4 tracker:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10019655C;
    v18[3] = &unk_100A49670;
    id v19 = v11;
    id v23 = v13;
    id v20 = v12;
    id v21 = self;
    id v22 = v10;
    [(BKJSALibraryManager *)self _fetchFinishedLibraryAssetWithAssetID:v22 waitForNewAssetIfNeeded:1 callback:v18];

    id v14 = v19;
  }
  else
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Set finished year feature is not enabled";
    id v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v14 = +[NSError errorWithDomain:@"BKJSALibraryManager" code:-1 userInfo:v15];

    id v16 = objc_retainBlock(v13);
    id v17 = v16;
    if (v16) {
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v14);
    }
  }
}

- (void)unsetFinishedDateForAssetID:(id)a3 callback:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001967DC;
  v7[3] = &unk_100A49698;
  id v8 = a4;
  id v6 = v8;
  [(BKJSALibraryManager *)self _fetchFinishedLibraryAssetWithAssetID:a3 waitForNewAssetIfNeeded:1 callback:v7];
}

- (void)getVersion:(id)a3
{
  id v3 = a3;
  v4 = +[JSABridge sharedInstance];
  id v6 = &off_100A834F0;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 enqueueValueCall:v3 arguments:v5 file:@"BKJSALibraryManager.m" line:304];
}

- (id)mostRecentPurchaseDate
{
  v2 = +[BKLibraryManager defaultManager];
  id v3 = [v2 mostRecentPurchaseDate];

  v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MRP: JS get mrp = %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)openBook:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[BKJSALibraryManager openBook:options:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", (uint8_t *)&v9, 0x16u);
  }

  [(BKJSALibraryManager *)self _openAssetID:v6 options:v7 sampleURL:0 isSample:0 tracker:0 callback:&stru_100A496B8];
}

- (void)openBook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = JSALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v21 = "-[BKJSALibraryManager openBook::::]";
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100196CB4;
  v17[3] = &unk_100A43E90;
  id v18 = v10;
  id v19 = v11;
  id v15 = v11;
  id v16 = v10;
  [(BKJSALibraryManager *)self _openAssetID:v16 options:v13 sampleURL:0 isSample:0 tracker:v12 callback:v17];
}

- (void)downloadBooks:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136446466;
    id v14 = "-[BKJSALibraryManager downloadBooks::]";
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s assetIDs=[%@]", buf, 0x16u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100196FB0;
  v11[3] = &unk_100A47F48;
  id v12 = v7;
  id v10 = v7;
  [(BKJSALibraryManager *)self _downloadAssetIDs:v6 callback:v11];
}

- (void)downloadBookWithRedownloadParameters:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6 :(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = +[BLUtilities storeIDFromBuyParameters:v12];
  id v16 = [v15 stringValue];

  id v17 = JSALog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    __int16 v22 = "-[BKJSALibraryManager downloadBookWithRedownloadParameters:::::]";
    __int16 v23 = 2112;
    NSErrorUserInfoKey v24 = v16;
    __int16 v25 = 1024;
    BOOL v26 = v10;
    __int16 v27 = 1024;
    BOOL v28 = v7;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@ isAudiobook=%{BOOL}d, hasRacSupport=%{BOOL}d, params=%@", buf, 0x2Cu);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100197314;
  v19[3] = &unk_100A44268;
  id v20 = v13;
  id v18 = v13;
  [(BKJSALibraryManager *)self _downloadAssetID:v16 redownloadParameters:v12 isAudiobook:v10 hasRacSupport:v7 tracker:v14 callback:v19];
}

- (void)cancelDownloadForBook:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v9 = JSALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = "-[BKJSALibraryManager cancelDownloadForBook:::]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100197540;
  v12[3] = &unk_100A43E90;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(BKJSALibraryManager *)self cancelDownloadForAssetID:v11 completionHandler:v12];
}

- (void)updateBooks:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136446466;
    id v14 = "-[BKJSALibraryManager updateBooks::]";
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s assetIDs=[%@]", buf, 0x16u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100197874;
  v11[3] = &unk_100A47F48;
  id v12 = v7;
  id v10 = v7;
  [(BKJSALibraryManager *)self _updateAssetIDs:v6 callback:v11];
}

- (void)addBookToWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = JSALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v17 = "-[BKJSALibraryManager addBookToWantToReadCollection:::]";
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  uint64_t v12 = kBKCollectionDefaultIDWantToRead;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100197B80;
  v14[3] = &unk_100A43EB8;
  id v15 = v9;
  id v13 = v9;
  [(BKJSALibraryManager *)self addAssetID:v8 toCollectionID:v12 tracker:v10 completionHandler:v14];
}

- (void)removeBookFromWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = JSALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v17 = "-[BKJSALibraryManager removeBookFromWantToReadCollection:::]";
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  uint64_t v12 = kBKCollectionDefaultIDWantToRead;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100197E40;
  v14[3] = &unk_100A43EB8;
  id v15 = v9;
  id v13 = v9;
  [(BKJSALibraryManager *)self removeAssetID:v8 fromCollectionID:v12 tracker:v10 completionHandler:v14];
}

- (void)showCollection:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v15 = "-[BKJSALibraryManager showCollection::]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s collectionID=%@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001980B4;
  block[3] = &unk_100A443C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)openSampleBook:(id)a3 downloadSampleURL:(id)a4 options:(id)a5 callback:(id)a6 tracker:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = JSALog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v25 = "-[BKJSALibraryManager openSampleBook:downloadSampleURL:options:callback:tracker:]";
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@", buf, 0x16u);
  }

  if ([v13 length])
  {
    __int16 v18 = +[NSURL URLWithString:v13];
  }
  else
  {
    __int16 v18 = 0;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001983F4;
  v21[3] = &unk_100A43E90;
  id v22 = v12;
  id v23 = v15;
  id v19 = v15;
  id v20 = v12;
  [(BKJSALibraryManager *)self _openAssetID:v20 options:v14 sampleURL:v18 isSample:1 tracker:v16 callback:v21];
}

- (void)previewAudiobook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = JSALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[BKJSALibraryManager previewAudiobook::::]";
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  id v15 = [v13 objectForKeyedSubscript:@"storeAsset"];
  id v16 = +[BCMAssetWrapper assetWithData:v15];
  objc_opt_class();
  id v17 = [v13 objectForKeyedSubscript:@"fullScreen"];

  __int16 v18 = BUDynamicCast();
  unsigned __int8 v19 = [v18 BOOLValue];

  id v20 = [(BKJSALibraryManager *)self libraryAssetProvider];
  id v21 = [v20 collectionController];
  uint64_t v22 = kBKCollectionDefaultIDSamples;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100198808;
  v27[3] = &unk_100A49708;
  v27[4] = self;
  id v28 = v10;
  id v29 = v12;
  id v30 = v16;
  unsigned __int8 v32 = v19;
  id v31 = v11;
  id v23 = v11;
  id v24 = v16;
  id v25 = v12;
  id v26 = v10;
  [v21 addStoreID:v26 toCollectionID:v22 forceToTop:0 completion:v27];
}

- (void)markBookAsFinished:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = JSALog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v23 = "-[BKJSALibraryManager markBookAsFinished::::]";
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 1024;
    BOOL v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s adamID=%@, isFinished=%{BOOL}d", buf, 0x1Cu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100198DDC;
  v17[3] = &unk_100A49730;
  void v17[4] = self;
  id v18 = v10;
  BOOL v21 = v8;
  id v19 = v12;
  id v20 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  [(BKJSALibraryManager *)self _markAsset:v16 asFinished:v8 completion:v17];
}

- (void)_displayStoreConnectionErrorAlert:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[NSThread isMainThread])
  {
    v4 = +[NSBundle mainBundle];
    v5 = v4;
    if (v3) {
      CFStringRef v6 = @"Apple Books couldn’t connect to the Book Store. Check your Internet connection, then try again.";
    }
    else {
      CFStringRef v6 = @"Apple Books couldn’t connect to iCloud. Check your Internet connection, then try again.";
    }
    id v14 = [v4 localizedStringForKey:v6 value:&stru_100A70340 table:0];

    id v7 = +[NSBundle mainBundle];
    BOOL v8 = [v7 localizedStringForKey:@"Couldn’t Connect" value:&stru_100A70340 table:0];

    id v9 = +[UIAlertController alertControllerWithTitle:v8 message:v14 preferredStyle:1];
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"OK" value:&stru_100A70340 table:0];
    id v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];
    [v9 addAction:v12];

    id v13 = +[BKAppDelegate currentSceneController];
    [v13 presentViewController:v9 animated:1 completion:0];
  }
}

- (void)_openAssetID:(id)a3 options:(id)a4 sampleURL:(id)a5 isSample:(BOOL)a6 tracker:(id)a7 callback:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(BKJSALibraryManager *)self libraryAssetProvider];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100199368;
  v25[3] = &unk_100A497F0;
  v25[4] = self;
  id v26 = v15;
  BOOL v31 = a6;
  id v27 = v14;
  id v28 = v17;
  id v29 = v16;
  id v30 = v18;
  id v20 = v16;
  id v21 = v17;
  id v22 = v14;
  id v23 = v15;
  id v24 = v18;
  [v19 fetchLibraryAssetFromAssetID:v22 handler:v25];
}

- (void)_openSample:(id)a3 options:(id)a4 sampleURL:(id)a5 contentData:(id)a6 tracker:(id)a7 callback:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100199CB4;
  v31[3] = &unk_100A49818;
  v31[4] = self;
  id v20 = v17;
  id v32 = v20;
  id v21 = v18;
  id v33 = v21;
  id v22 = v19;
  id v36 = v22;
  id v23 = v15;
  id v34 = v23;
  id v24 = v14;
  id v35 = v24;
  id v25 = objc_retainBlock(v31);
  id v26 = v25;
  if (v16)
  {
    ((void (*)(void *, id))v25[2])(v25, v16);
  }
  else
  {
    id v27 = +[BSUIItemDescriptionCache sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10019A4DC;
    v28[3] = &unk_100A49840;
    id v29 = v26;
    id v30 = v22;
    [v27 sampleDownloadURLForAssetID:v24 completion:v28];
  }
}

- (void)_previewAssetID:(id)a3 asset:(id)a4 fullScreen:(BOOL)a5 tracker:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = JSALog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v30 = "-[BKJSALibraryManager _previewAssetID:asset:fullScreen:tracker:callback:]";
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v17 = [(BKJSALibraryManager *)self libraryAssetProvider];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10019A72C;
  v22[3] = &unk_100A498E0;
  objc_copyWeak(&v27, (id *)buf);
  id v18 = v12;
  id v23 = v18;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v26 = v20;
  id v21 = v13;
  id v25 = v21;
  BOOL v28 = a5;
  [v17 fetchLibraryAssetFromAssetID:v18 handler:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)_markAsset:(id)a3 asFinished:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10019AE5C;
    v11[3] = &unk_100A43E28;
    id v12 = v7;
    BOOL v14 = a4;
    id v13 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    id v9 = v12;
  }
  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Asset ID required. Cannot mark as finished";
    id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v9 = +[NSError errorWithDomain:@"BKJSALibraryManager" code:-1 userInfo:v10];

    if (v8) {
      (*((void (**)(id, void *))v8 + 2))(v8, v9);
    }
  }
}

- (void)_downloadAssetID:(id)a3 redownloadParameters:(id)a4 isAudiobook:(BOOL)a5 hasRacSupport:(BOOL)a6 tracker:(id)a7 callback:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(BKJSALibraryManager *)self libraryItemStateProvider];
  [v18 updateStateToPurchasingForIdentifier:v14];

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10019B2BC;
  v24[3] = &unk_100A49958;
  id v19 = v15;
  id v25 = v19;
  id v20 = v14;
  id v26 = v20;
  BOOL v30 = a5;
  id v21 = v16;
  id v27 = v21;
  BOOL v31 = a6;
  objc_copyWeak(&v29, &location);
  id v22 = v17;
  id v28 = v22;
  id v23 = objc_retainBlock(v24);
  ((void (*)(void))v23[2])();

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_downloadAssetIDs:(id)a3 callback:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10019B688;
  v9[3] = &unk_100A499A8;
  v9[4] = self;
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_retainBlock(v9);
  [(BKJSALibraryManager *)self _processAssets:v7 processor:v8 callback:v6];
}

- (void)_updateAssetIDs:(id)a3 callback:(id)a4
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10019B97C;
  id v12 = &unk_100A49A20;
  id v13 = self;
  id v14 = a3;
  id v6 = v14;
  id v7 = a4;
  id v8 = objc_retainBlock(&v9);
  -[BKJSALibraryManager _processAssets:processor:callback:](self, "_processAssets:processor:callback:", v6, v8, v7, v9, v10, v11, v12, v13);
}

- (void)_processAssets:(id)a3 processor:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BKJSALibraryManager *)self libraryAssetProvider];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10019BDB0;
  v15[3] = &unk_100A49A70;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [v11 fetchLibraryAssetsFromAssetIDs:v13 handler:v15];
}

- (void)getCollectionNameForCollectionID:(id)a3 :(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isObject])
  {
    id v7 = +[BCCollection titleForDefaultCollectionID:v5];
    if (!v7)
    {
      id v8 = +[BKLibraryManager defaultManager];
      id v9 = [v8 collectionController];
      id v10 = +[BKLibraryManager defaultManager];
      id v11 = [v10 uiChildContext];
      id v12 = [v9 mutableCollectionWithCollectionID:v5 inManagedObjectContext:v11 error:0];

      id v7 = [v12 localizedTitle];
    }
    id v13 = +[JSABridge sharedInstance];
    id v14 = v13;
    if (v7)
    {
      id v16 = v7;
      id v15 = +[NSArray arrayWithObjects:&v16 count:1];
      [v14 enqueueValueCall:v6 arguments:v15 file:@"BKJSALibraryManager.m" line:968];
    }
    else
    {
      [v13 enqueueValueCall:v6 arguments:0 file:@"BKJSALibraryManager.m" line:968];
    }
  }
}

- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKJSALibraryManager *)self storeController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019C214;
  v7[3] = &unk_100A49A98;
  id v8 = v4;
  id v6 = v4;
  [v5 getStoreIDsWithAvailableUpdatesWithCompletion:v7];
}

- (void)filterPurchasedBooks:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isArray])
  {
    id v7 = [v5 toArray];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }
  id v8 = +[NSMutableSet setWithArray:v7];
  id v9 = +[BKLibraryManager defaultManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019C420;
  v12[3] = &unk_100A44148;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 assetIDsOfPurchasedStoreAssets:v12];
}

- (id)_transactionFromOptions:(id)a3
{
  return [a3 objectForKeyedSubscript:BCTransactionOptionsTransactionKey];
}

- (id)_transactionFromOptionsForShowAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000070D0;
  id v15 = sub_100007244;
  id v16 = [(BKJSALibraryManager *)self _transactionFromOptions:v4];
  if (!v12[5])
  {
    if (+[NSThread isMainThread])
    {
      id v5 = +[BKAppDelegate currentSceneController];
      id v6 = [v5 newShowAssetTransaction];
      id v7 = (void *)v12[5];
      v12[5] = (uint64_t)v6;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10019C6E4;
      block[3] = &unk_100A44688;
      block[4] = &v11;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (int64_t)_contentTypeForContentID:(id)a3 withLibraryAsset:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v4 = (int)[a4 contentType];

  return (int64_t)+[BAUtilities contentTypeFromAssetType:v4];
}

- (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKJSALibraryManager *)self _libraryAssetWithContentID:v7];
  id v9 = [(BKJSALibraryManager *)self _contentDataForLibraryAsset:v8 contentID:v7 tracker:v6];

  return v9;
}

- (id)_contentDataForLibraryAsset:(id)a3 contentID:(id)a4 tracker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    id v12 = [v8 assetID];
    uint64_t v13 = [v11 contentPrivateIDForContentID:v12];
    uint64_t v14 = [v11 contentUserIDForContentID:v12];

    int64_t v30 = [(BKJSALibraryManager *)self _contentTypeForContentID:v12 withLibraryAsset:v8];
    if ([v8 isOwned])
    {
      id v15 = [v8 storeID];
      id v16 = [v15 length];
      uint64_t v17 = 1;
      if (!v16) {
        uint64_t v17 = 2;
      }
      uint64_t v29 = v17;
    }
    else
    {
      uint64_t v29 = 0;
    }
    BOOL v31 = (void *)v14;
    id v19 = +[BAEventReporter sharedReporter];
    id v28 = [v19 seriesTypeForContentID:v12];

    id v32 = v9;
    if ([v8 isAudiobook])
    {
      id v20 = [v8 hasRACSupport];
      if ([v20 BOOLValue]) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 2;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v22 = objc_alloc((Class)BAContentData);
    unsigned int v23 = [v8 contentType];
    if (v23 == 3)
    {
      id v24 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 pageCount]);
    }
    else
    {
      id v24 = 0;
    }
    id v25 = [v8 supplementalContentAssets];
    id v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 count]);
    id v18 = [v22 initWithContentID:v12 contentType:v30 contentPrivateID:v13 contentUserID:v31 contentAcquisitionType:v29 contentSubType:0 contentLength:v24 supplementalContentCount:v26 seriesType:v28 productionType:v21 isUnified:0 contentKind:0];

    if (v23 == 3) {
    id v9 = v32;
    }
  }
  else
  {
    id v12 = [v10 contentPrivateIDForContentID:v9];
    uint64_t v13 = [v11 contentUserIDForContentID:v9];

    id v18 = [objc_alloc((Class)BAContentData) initWithContentID:v9 contentType:0 contentPrivateID:v12 contentUserID:v13 contentAcquisitionType:0 contentSubType:0 contentLength:0 supplementalContentCount:0 seriesType:0 productionType:0 isUnified:0 contentKind:0];
  }

  return v18;
}

- (id)_libraryAssetWithContentID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[BKAppDelegate delegate];
  id v5 = [v4 libraryAssetProvider];

  id v6 = [v5 libraryAssetOnMainQueueWithAssetID:v3];

  return v6;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryAssetProvider);

  return (BKLibraryAssetProvider *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BKLibraryItemStateProvider)libraryItemStateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryItemStateProvider);

  return (BKLibraryItemStateProvider *)WeakRetained;
}

- (void)setLibraryItemStateProvider:(id)a3
{
}

- (BKPresentersProvider)presentersProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentersProvider);

  return (BKPresentersProvider *)WeakRetained;
}

- (void)setPresentersProvider:(id)a3
{
}

- (BKStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_destroyWeak((id *)&self->_presentersProvider);
  objc_destroyWeak((id *)&self->_libraryItemStateProvider);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_libraryAssetProvider);
}

@end