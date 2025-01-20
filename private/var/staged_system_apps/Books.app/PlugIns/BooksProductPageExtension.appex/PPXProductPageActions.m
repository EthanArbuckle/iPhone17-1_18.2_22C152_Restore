@interface PPXProductPageActions
+ (id)sharedInstance;
- (BUNetworkMonitor)networkMonitor;
- (PPXProductPageActions)init;
- (void)cancelDownloadForBook:(id)a3;
- (void)dealloc;
- (void)downloadBookWithRedownloadParameters:(id)a3 isAudiobook:(BOOL)a4 hasRacSupport:(BOOL)a5 uiManager:(id)a6 tracker:(id)a7;
- (void)downloadBooks:(id)a3;
- (void)openBook:(id)a3 options:(id)a4;
- (void)openSampleBook:(id)a3 withSampleURL:(id)a4;
- (void)previewAudiobook:(id)a3;
- (void)removeDownload:(id)a3 isAudiobook:(BOOL)a4;
- (void)setNetworkMonitor:(id)a3;
@end

@implementation PPXProductPageActions

+ (id)sharedInstance
{
  if (qword_100039698 != -1) {
    dispatch_once(&qword_100039698, &stru_1000316A0);
  }
  v2 = (void *)qword_100039690;

  return v2;
}

- (PPXProductPageActions)init
{
  v9.receiver = self;
  v9.super_class = (Class)PPXProductPageActions;
  v2 = [(PPXProductPageActions *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)BUNetworkMonitor);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("PPXProductPageActions.networkMonitorQueue", v4);
    id v6 = [v3 initWithQueue:v5];
    [(PPXProductPageActions *)v2 setNetworkMonitor:v6];

    v7 = [(PPXProductPageActions *)v2 networkMonitor];
    [v7 start];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [(PPXProductPageActions *)self networkMonitor];
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)PPXProductPageActions;
  [(PPXProductPageActions *)&v4 dealloc];
}

- (void)removeDownload:(id)a3 isAudiobook:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5) {
    goto LABEL_14;
  }
  if (!v4)
  {
    v14 = +[BLLibrary defaultBookLibrary];
    id v17 = 0;
    [v14 removeBookFromLibraryWithIdentifier:v5 error:&v17];
    id v15 = v17;

    if (v15)
    {
      v16 = BCProductPageExtensionLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100022894((uint64_t)v15, v16);
      }

      goto LABEL_13;
    }
LABEL_12:
    BSUIGetLibraryItemStateUpdater();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 updateStateToDeletedForIdentifier:v5];
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v6 = +[BLMediaQuery audiobooksQuery];
  if (v6)
  {
    v7 = (void *)v6;
    id v18 = v5;
    v8 = +[NSArray arrayWithObjects:&v18 count:1];
    objc_super v9 = +[MPMediaPropertyPredicate predicateWithValue:v8 forProperty:MPMediaItemPropertyStorePlaylistID comparisonType:108];
    [v7 addFilterPredicate:v9];
    v10 = +[MPMediaLibrary defaultMediaLibrary];
    v11 = [v7 items];
    char v12 = [v10 removeItems:v11];

    v13 = BCProductPageExtensionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100022804(v12, v13);
    }

    if (v12) {
      goto LABEL_12;
    }
  }
LABEL_14:
}

- (void)downloadBooks:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[BUAccountsProvider sharedProvider];
  id v5 = [v4 activeStoreAccount];
  uint64_t v6 = [v5 ams_DSID];

  if (v6)
  {
    id v26 = v3;
    uint64_t v7 = +[NSSet setWithArray:v3];
    v8 = +[BLJaliscoReadOnlyDAAPClient sharedClient];
    v32 = v6;
    objc_super v9 = +[NSArray arrayWithObjects:&v32 count:1];
    v25 = (void *)v7;
    v10 = [v8 fetchServerItemsForStoreIDs:v7 andDSIDS:v9];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v17 = [v16 storeID];
          if (v17)
          {
            id v18 = BSUIGetLibraryItemStateUpdater();
            [v18 updateStateToPurchasingForIdentifier:v17];

            v19 = [v16 storeDownloadParameters];
            v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 longLongValue]);
            v21 = +[BLPurchaseRequest requestWithBuyParameters:v19 storeIdentifier:v20];

            v22 = +[JSABridge sharedInstance];
            v23 = [v22 windowManager];

            v24 = +[BLDownloadQueue sharedInstance];
            [v24 purchaseWithRequest:v21 uiManager:v23 completion:&stru_1000316E0];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    id v3 = v26;
  }
}

- (void)downloadBookWithRedownloadParameters:(id)a3 isAudiobook:(BOOL)a4 hasRacSupport:(BOOL)a5 uiManager:(id)a6 tracker:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  id v12 = +[BLUtilities storeIDFromBuyParameters:v10];
  id v13 = [v12 stringValue];

  uint64_t v14 = BSUIGetLibraryItemStateUpdater();
  [v14 updateStateToPurchasingForIdentifier:v13];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005E58;
  v22[3] = &unk_100031730;
  id v23 = v10;
  id v24 = v13;
  BOOL v26 = a4;
  id v25 = v11;
  BOOL v27 = a5;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  id v18 = objc_retainBlock(v22);
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v18[2])(v18, v19, v20, v21);
}

- (void)cancelDownloadForBook:(id)a3
{
  id v3 = a3;
  id v4 = +[PPXBLDownloadController sharedController];
  [v4 cancelDownloadForAssetID:v3];
}

- (void)openBook:(id)a3 options:(id)a4
{
  id v4 = +[NSString stringWithFormat:@"ibooks://storeid/%@", a4, a3];
  id v5 = +[NSURL URLWithString:v4];
  uint64_t v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v11 = 0;
  unsigned int v7 = [v6 openSensitiveURL:v5 withOptions:0 error:&v11];
  id v8 = v11;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = BCProductPageExtensionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100022950();
    }
  }
}

- (void)openSampleBook:(id)a3 withSampleURL:(id)a4
{
  id v4 = +[NSString stringWithFormat:@"itms-bookss://?action=read-sample-book&contentId=%@", a4, a3];
  id v5 = +[NSURL URLWithString:v4];
  uint64_t v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v11 = 0;
  unsigned int v7 = [v6 openSensitiveURL:v5 withOptions:0 error:&v11];
  id v8 = v11;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = BCProductPageExtensionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000229B8();
    }
  }
}

- (void)previewAudiobook:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"itms-bookss://?action=preview-audiobook&contentId=%@", a3];
  id v4 = +[NSURL URLWithString:v3];
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v10 = 0;
  unsigned int v6 = [v5 openSensitiveURL:v4 withOptions:0 error:&v10];
  id v7 = v10;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    BOOL v9 = BCProductPageExtensionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100022A20();
    }
  }
}

- (BUNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end