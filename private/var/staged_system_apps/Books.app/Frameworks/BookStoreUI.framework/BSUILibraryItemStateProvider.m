@interface BSUILibraryItemStateProvider
+ (id)sharedInstance;
- (BOOL)_hasRemainingDownloadsForIdentifier:(id)a3;
- (BOOL)_itemIsBeingDownloaded:(id)a3;
- (BOOL)_itemIsPurchasedThisSession:(id)a3;
- (BOOL)_updateItemStateFieldsFromBookLibrary:(id)a3;
- (BOOL)_updateItemStateFieldsFromCache:(id)a3;
- (BOOL)_updateItemStateFieldsFromJalisco:(id)a3;
- (BOOL)_updateItemStateFieldsFromMediaLibrary:(id)a3;
- (BSUILibraryItemStateCenter)stateCenter;
- (BSUILibraryItemStateProvider)init;
- (id)_stateForItemIdentifier:(id)a3;
- (id)itemsOfInterest;
- (id)purchaseFailedObserver;
- (id)purchaseSucceededObserver;
- (void)_cacheNewPurchaseWithIdentifier:(id)a3 isPreorder:(id)a4;
- (void)_mediaLibraryDidChanged:(id)a3;
- (void)_trackChildIdentifier:(id)a3 forParentIdentifier:(id)a4;
- (void)_untrackChildIdentifier:(id)a3 forParentIdentifier:(id)a4;
- (void)_updateStateToDownloadFinishedForIdentifier:(id)a3;
- (void)_updateStateToDownloadingForIdentifier:(id)a3;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)dealloc;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4;
- (void)setPurchaseFailedObserver:(id)a3;
- (void)setPurchaseSucceededObserver:(id)a3;
- (void)updateAllItemsOfInterest;
- (void)updateFinishedState:(BOOL)a3 identifier:(id)a4;
- (void)updateInterest:(id)a3;
- (void)updateItemOfInterestForItemIdentifier:(id)a3;
- (void)updateStateToDeletedForIdentifier:(id)a3;
- (void)updateStateToPurchaseFailedForIdentifier:(id)a3;
- (void)updateStateToPurchasingForIdentifier:(id)a3;
- (void)updateWantToReadState:(BOOL)a3 identifier:(id)a4;
@end

@implementation BSUILibraryItemStateProvider

+ (id)sharedInstance
{
  if (qword_3D4070 != -1) {
    dispatch_once(&qword_3D4070, &stru_38E2C0);
  }
  v2 = (void *)qword_3D4068;

  return v2;
}

- (BSUILibraryItemStateProvider)init
{
  v46.receiver = self;
  v46.super_class = (Class)BSUILibraryItemStateProvider;
  v2 = [(BSUILibraryItemStateProvider *)&v46 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("BSUILibraryItemStateProvider.access", 0);
    accessQ = v2->_accessQ;
    v2->_accessQ = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("BSUILibraryItemStateProvider.fileWrites.monitoring", 0);
    fileChangesQ = v2->_fileChangesQ;
    v2->_fileChangesQ = (OS_dispatch_queue *)v5;

    v7 = [[BSUILibraryItemStateCenter alloc] initWithProvider:v2];
    stateCenter = v2->_stateCenter;
    v2->_stateCenter = v7;

    v9 = +[BLDownloadQueue sharedInstance];
    [v9 addObserver:v2];

    uint64_t v10 = +[NSMutableDictionary dictionary];
    itemStateCache = v2->_itemStateCache;
    v2->_itemStateCache = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    itemWantToReadStateCache = v2->_itemWantToReadStateCache;
    v2->_itemWantToReadStateCache = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    itemFinishedStateCache = v2->_itemFinishedStateCache;
    v2->_itemFinishedStateCache = (NSMutableDictionary *)v14;

    uint64_t v16 = +[NSMutableSet set];
    downloadingItems = v2->_downloadingItems;
    v2->_downloadingItems = (NSMutableSet *)v16;

    uint64_t v18 = +[NSMutableDictionary dictionary];
    purchasesMadeThisSession = v2->_purchasesMadeThisSession;
    v2->_purchasesMadeThisSession = (NSMutableDictionary *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    parentIdentifierForStoreIdentifierMap = v2->_parentIdentifierForStoreIdentifierMap;
    v2->_parentIdentifierForStoreIdentifierMap = (NSMutableDictionary *)v20;

    uint64_t v22 = +[NSMutableDictionary dictionary];
    childIdentifiersForParentIdentifierMap = v2->_childIdentifiersForParentIdentifierMap;
    v2->_childIdentifiersForParentIdentifierMap = (NSMutableDictionary *)v22;

    v24 = +[BUAccountsProvider sharedProvider];
    [v24 addObserver:v2 accountTypes:1];

    v25 = +[MPMediaLibrary defaultMediaLibrary];
    v26 = +[MPMediaPropertyPredicate predicateWithValue:&off_3A0A28 forProperty:MPMediaItemPropertyMediaType];
    [v25 addLibraryFilterPredicate:v26];

    v27 = +[NSRunLoop mainRunLoop];
    +[MPMediaLibrary setRunLoopForNotifications:v27];

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v2 selector:"_mediaLibraryDidChanged:" name:MPMediaLibraryDidChangeNotification object:0];

    v29 = +[MPMediaLibrary defaultMediaLibrary];
    [v29 beginGeneratingLibraryChangeNotifications];

    v30 = +[NSNotificationCenter defaultCenter];
    v31 = +[NSOperationQueue mainQueue];
    uint64_t v32 = BLDownloadQueuePurchaseSucceededNotification;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_C604;
    v44[3] = &unk_38E310;
    v33 = v2;
    v45 = v33;
    v34 = [v30 addObserverForName:v32 object:0 queue:v31 usingBlock:v44];
    [(BSUILibraryItemStateProvider *)v33 setPurchaseSucceededObserver:v34];

    uint64_t v35 = BLDownloadQueuePurchaseFailedNotification;
    v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472;
    v41 = sub_C8FC;
    v42 = &unk_38E310;
    v36 = v33;
    v43 = v36;
    v37 = [v30 addObserverForName:v35 object:0 queue:v31 usingBlock:&v39];
    -[BSUILibraryItemStateProvider setPurchaseFailedObserver:](v36, "setPurchaseFailedObserver:", v37, v39, v40, v41, v42);
  }
  return v2;
}

- (void)dealloc
{
  accessQ = self->_accessQ;
  self->_accessQ = 0;

  fileChangesQ = self->_fileChangesQ;
  self->_fileChangesQ = 0;

  itemStateCache = self->_itemStateCache;
  self->_itemStateCache = 0;

  itemWantToReadStateCache = self->_itemWantToReadStateCache;
  self->_itemWantToReadStateCache = 0;

  itemFinishedStateCache = self->_itemFinishedStateCache;
  self->_itemFinishedStateCache = 0;

  itemIdentifiers = self->_itemIdentifiers;
  self->_itemIdentifiers = 0;

  v9 = +[BUAccountsProvider sharedProvider];
  [v9 removeObserver:self accountTypes:1];

  uint64_t v10 = +[BLDownloadQueue sharedInstance];
  [v10 removeObserver:self];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self->_purchaseSucceededObserver name:BLDownloadQueuePurchaseSucceededNotification object:0];
  [v11 removeObserver:self->_purchaseFailedObserver name:BLDownloadQueuePurchaseFailedNotification object:0];

  v12.receiver = self;
  v12.super_class = (Class)BSUILibraryItemStateProvider;
  [(BSUILibraryItemStateProvider *)&v12 dealloc];
}

- (void)updateStateToPurchasingForIdentifier:(id)a3
{
  id v4 = a3;
  accessQ = self->_accessQ;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_CC2C;
  v11 = &unk_38E1F8;
  objc_super v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(accessQ, &v8);
  v7 = -[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v6, v8, v9, v10, v11, v12);
  [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v6 state:v7];
}

- (void)updateStateToPurchaseFailedForIdentifier:(id)a3
{
  id v4 = a3;
  accessQ = self->_accessQ;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_CD08;
  v11 = &unk_38E1F8;
  objc_super v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(accessQ, &v8);
  v7 = -[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v6, v8, v9, v10, v11, v12);
  [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v6 state:v7];
}

- (void)updateStateToDeletedForIdentifier:(id)a3
{
  id v4 = a3;
  accessQ = self->_accessQ;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_CDE0;
  v11 = &unk_38E1F8;
  objc_super v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(accessQ, &v8);
  v7 = -[BSUILibraryItemStateProvider _stateForItemIdentifier:](self, "_stateForItemIdentifier:", v6, v8, v9, v10, v11, v12);
  [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v6 state:v7];
}

- (void)updateWantToReadState:(BOOL)a3 identifier:(id)a4
{
  id v6 = a4;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CE98;
  block[3] = &unk_38E338;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_sync(accessQ, block);
}

- (void)updateFinishedState:(BOOL)a3 identifier:(id)a4
{
  id v6 = a4;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CFA4;
  block[3] = &unk_38E338;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_sync(accessQ, block);
}

- (void)_cacheNewPurchaseWithIdentifier:(id)a3 isPreorder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D118;
  block[3] = &unk_38E360;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQ, block);
  BOOL v11 = [(BSUILibraryItemStateProvider *)self _stateForItemIdentifier:v10];
  [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v10 state:v11];
}

- (BOOL)_itemIsPurchasedThisSession:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D1F4;
  block[3] = &unk_38E388;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQ, block);
  LOBYTE(accessQ) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQ;
}

- (void)_mediaLibraryDidChanged:(id)a3
{
}

- (void)updateAllItemsOfInterest
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dispatch_queue_t v3 = [(BSUILibraryItemStateProvider *)self itemsOfInterest];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(BSUILibraryItemStateProvider *)self _stateForItemIdentifier:v8];
        [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v8 state:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)updateItemOfInterestForItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUILibraryItemStateProvider *)self _stateForItemIdentifier:v4];
  [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v4 state:v5];
}

- (void)updateInterest:(id)a3
{
  id v4 = a3;
  accessQ = self->_accessQ;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D46C;
  v7[3] = &unk_38E1F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQ, v7);
}

- (void)_updateStateToDownloadingForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D634;
    block[3] = &unk_38E3B0;
    block[4] = self;
    id v7 = v4;
    id v10 = v7;
    long long v11 = &v12;
    dispatch_sync(accessQ, block);
    if (*((unsigned char *)v13 + 24))
    {
      id v8 = BKLibraryItemStateProviderLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "=> DOWNLOADING: %@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_updateStateToDownloadFinishedForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D81C;
    block[3] = &unk_38E3B0;
    block[4] = self;
    id v7 = v4;
    id v10 = v7;
    long long v11 = &v12;
    dispatch_sync(accessQ, block);
    if (*((unsigned char *)v13 + 24))
    {
      id v8 = BKLibraryItemStateProviderLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "=> FINISHED DOWNLOAD: %@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v12, 8);
}

- (BOOL)_itemIsBeingDownloaded:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D950;
  block[3] = &unk_38E388;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQ, block);
  LOBYTE(accessQ) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQ;
}

- (BOOL)_updateItemStateFieldsFromCache:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v5 = [v4 itemIdentifier];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_DBE0;
  v26 = sub_DBF0;
  id v27 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DBF8;
  block[3] = &unk_38E388;
  v21 = &v22;
  block[4] = self;
  id v7 = v5;
  id v20 = v7;
  dispatch_sync(accessQ, block);
  id v8 = v23;
  *((unsigned char *)v29 + 24) = v23[5] != 0;
  [v4 setLibrary:[v8[5] longLongValue]];
  [v4 setDownload:0];
  if (*((unsigned char *)v29 + 24))
  {
    char v9 = 1;
  }
  else
  {
    id v10 = self->_accessQ;
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    char v14 = sub_DC48;
    char v15 = &unk_38E388;
    uint64_t v18 = &v28;
    uint64_t v16 = self;
    id v17 = v7;
    dispatch_sync(v10, &v12);
    if (*((unsigned char *)v29 + 24))
    {
      [v4 setLibrary:4 v12, v13, v14, v15, v16];
      [v4 setIsPurchased:1];
      [v4 setDownload:1];
    }

    char v9 = *((unsigned char *)v29 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v9;
}

- (BOOL)_updateItemStateFieldsFromBookLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 itemIdentifier];
  id v5 = +[BLLibrary defaultBookLibrary];
  id v6 = [v5 allBookItems];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 storeIdentifier:v18];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          if ([v12 isSample]) {
            uint64_t v16 = 1;
          }
          else {
            uint64_t v16 = 4;
          }
          [v3 setLibrary:v16];
          [v3 setIsPurchased:[v12 isSample] ^ 1];
          [v3 setDownload:2];
          [v3 setIsInSamples:[v12 isSample]];
          [v3 setIsSample:[v12 isSample]];
          BOOL v15 = 1;
          goto LABEL_14;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)_updateItemStateFieldsFromMediaLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 itemIdentifier];
  id v6 = +[MPMediaQuery bk_audiobooksQuery];
  if (v6 && [v5 length])
  {
    id v7 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:MPMediaItemPropertyStorePlaylistID];
    id v8 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:MPMediaItemPropertyStoreID];
    v34[0] = v7;
    v34[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v34 count:2];
    uint64_t v10 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v9];
    [v6 addFilterPredicate:v10];

    [v6 setGroupingType:1];
    [v6 collections];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      v23 = self;
      uint64_t v24 = v8;
      v25 = v7;
      v26 = v6;
      uint64_t v28 = v5;
      uint64_t v12 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(obj);
          }
          unsigned int v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) bk_representativeItem];
          objc_opt_class();
          BOOL v15 = [v14 valueForProperty:MPMediaItemPropertyAlbumPersistentID];
          uint64_t v16 = BUDynamicCast();

          if (v16)
          {
            id v17 = [v14 bk_storeID];
            long long v18 = [v17 stringValue];
            unsigned int v19 = [v28 isEqualToString:v18];

            if (v19)
            {
              objc_opt_class();
              long long v20 = [v14 valueForProperty:MPMediaItemPropertyIsCloudItem];
              BUDynamicCast();
              id v11 = (id)objc_claimAutoreleasedReturnValue();

              [v4 setLibrary:4];
              [v4 setIsPurchased:1];
              if ([v11 BOOLValue])
              {
                uint64_t v21 = BLAudiobookStreamingEnabled();
                id v5 = v28;
              }
              else
              {
                id v5 = v28;
                [(BSUILibraryItemStateProvider *)v23 _updateStateToDownloadFinishedForIdentifier:v28];
                [v4 setDownload:2];
                uint64_t v21 = 0;
              }
              id v7 = v25;
              id v6 = v26;
              id v8 = v24;
              [v4 setStreamable:v21];

              LOBYTE(v11) = 1;
              goto LABEL_18;
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v6 = v26;
      id v5 = v28;
      id v8 = v24;
      id v7 = v25;
    }
LABEL_18:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (BOOL)_updateItemStateFieldsFromJalisco:(id)a3
{
  id v4 = a3;
  id v5 = +[BUAccountsProvider sharedProvider];
  id v6 = [v5 activeStoreAccount];
  id v7 = [v6 ams_DSID];

  uint64_t v8 = [v4 itemIdentifier];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v11 = +[BLJaliscoReadOnlyDAAPClient sharedClient];
  uint64_t v12 = +[NSSet setWithObject:v9];
  v25 = v7;
  uint64_t v13 = +[NSArray arrayWithObjects:&v25 count:1];
  unsigned int v14 = [v11 fetchServerItemsForStoreIDs:v12 andDSIDS:v13];

  BOOL v15 = [v14 firstObject];
  if (!v15)
  {

LABEL_14:
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E3E4;
    block[3] = &unk_38E360;
    block[4] = self;
    id v23 = v9;
    id v24 = v4;
    dispatch_sync(accessQ, block);

LABEL_15:
    BOOL v19 = 0;
    goto LABEL_16;
  }
  uint64_t v16 = v15;
  id v17 = [v15 expectedDate];

  if (v17) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 4;
  }
  [v4 setLibrary:v18];
  BOOL v19 = 1;
  [v4 setIsPurchased:1];
LABEL_16:

  return v19;
}

- (id)_stateForItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PPLibraryItemState);
  [(PPLibraryItemState *)v5 setItemIdentifier:v4];
  [(PPLibraryItemState *)v5 setLibrary:0];
  [(PPLibraryItemState *)v5 setDownload:0];
  [(PPLibraryItemState *)v5 setIsInSamples:0];
  [(PPLibraryItemState *)v5 setIsSample:0];
  [(PPLibraryItemState *)v5 setUpdateAvailable:0];
  [(PPLibraryItemState *)v5 setAssetIsPreorderable:0];
  [(PPLibraryItemState *)v5 setIsPurchased:0];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_DBE0;
  v48 = sub_DBF0;
  id v49 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E938;
  block[3] = &unk_38E388;
  v43 = &v44;
  block[4] = self;
  id v7 = v4;
  id v42 = v7;
  dispatch_sync(accessQ, block);
  if (!v45[5])
  {
    uint64_t v8 = kBKCollectionDefaultIDWantToRead;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_E988;
    v39[3] = &unk_38E3D8;
    v39[4] = self;
    id v40 = v7;
    +[BDSServiceCenter fetchIsAssetID:v40 inCollectionID:v8 completion:v39];
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_DBE0;
  v37 = sub_DBF0;
  id v38 = 0;
  id v9 = self->_accessQ;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_EAB8;
  v30[3] = &unk_38E388;
  long long v32 = &v33;
  v30[4] = self;
  id v10 = v7;
  id v31 = v10;
  dispatch_sync(v9, v30);
  if (!v34[5])
  {
    id v11 = +[BCCloudAssetManager sharedManager];
    uint64_t v12 = [v11 assetDetailManager];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_EB08;
    v28[3] = &unk_38E400;
    v28[4] = self;
    id v29 = v10;
    [v12 assetDetailForAssetID:v29 completion:v28];
  }
  if (![(BSUILibraryItemStateProvider *)self _updateItemStateFieldsFromMediaLibrary:v5]&& ![(BSUILibraryItemStateProvider *)self _updateItemStateFieldsFromCache:v5]&& ![(BSUILibraryItemStateProvider *)self _updateItemStateFieldsFromBookLibrary:v5])
  {
    [(BSUILibraryItemStateProvider *)self _updateItemStateFieldsFromJalisco:v5];
  }
  uint64_t v13 = self->_accessQ;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_ECC0;
  v25[3] = &unk_38E388;
  id v27 = &v44;
  v25[4] = self;
  id v14 = v10;
  id v26 = v14;
  dispatch_sync(v13, v25);
  -[PPLibraryItemState setWantToRead:](v5, "setWantToRead:", [(id)v45[5] BOOLValue]);
  BOOL v15 = self->_accessQ;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  long long v20 = sub_ED10;
  uint64_t v21 = &unk_38E388;
  id v24 = &v33;
  uint64_t v22 = self;
  id v16 = v14;
  id v23 = v16;
  dispatch_sync(v15, &v18);
  [v5 setFinished:[v34[5] isFinished:v18, v19, v20, v21, v22]];
  -[PPLibraryItemState setHasSpecifiedFinishedDate:](v5, "setHasSpecifiedFinishedDate:", [(id)v34[5] hasSpecifiedFinishedDate]);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v44, 8);

  return v5;
}

- (id)itemsOfInterest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_DBE0;
  id v10 = sub_DBF0;
  id v11 = 0;
  accessQ = self->_accessQ;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_EE50;
  v5[3] = &unk_38E428;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_trackChildIdentifier:(id)a3 forParentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EF6C;
    block[3] = &unk_38E360;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_sync(accessQ, block);
  }
}

- (void)_untrackChildIdentifier:(id)a3 forParentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F0E0;
    block[3] = &unk_38E360;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_sync(accessQ, block);
  }
}

- (BOOL)_hasRemainingDownloadsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F248;
    block[3] = &unk_38E3B0;
    block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(accessQ, block);

    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412802;
    long long v21 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 storeID];
        uint64_t v13 = [v12 stringValue];

        uint64_t v14 = [v11 storePlaylistID];
        char v15 = [v14 stringValue];

        id v16 = [v11 downloadID];
        id v17 = BKLibraryItemStateProviderLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v21;
          id v27 = v13;
          __int16 v28 = 2112;
          id v29 = v15;
          __int16 v30 = 2114;
          id v31 = v16;
          _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "Processing download state change: %@, parent:%@, downloadID:%{public}@", buf, 0x20u);
        }

        if (v15) {
          uint64_t v18 = v15;
        }
        else {
          uint64_t v18 = v13;
        }
        id v19 = v18;
        if (v19)
        {
          [(BSUILibraryItemStateProvider *)self _trackChildIdentifier:v13 forParentIdentifier:v15];
          if (![(BSUILibraryItemStateProvider *)self _itemIsBeingDownloaded:v19])
          {
            if ([(BSUILibraryItemStateProvider *)self _itemIsPurchasedThisSession:v19])
            {
              [(BSUILibraryItemStateProvider *)self _updateStateToDownloadingForIdentifier:v19];
              long long v20 = [(BSUILibraryItemStateProvider *)self _stateForItemIdentifier:v19];
              [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v19 state:v20];
            }
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v8);
  }
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v24;
    *(void *)&long long v8 = 138412802;
    long long v22 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [v12 storeID];
        uint64_t v14 = [v13 stringValue];

        char v15 = [v12 storePlaylistID];
        id v16 = [v15 stringValue];

        if (v16) {
          id v17 = v16;
        }
        else {
          id v17 = v14;
        }
        id v18 = v17;
        id v19 = [v12 downloadID];
        long long v20 = BKLibraryItemStateProviderLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v22;
          __int16 v28 = v14;
          __int16 v29 = 2112;
          __int16 v30 = v16;
          __int16 v31 = 2114;
          long long v32 = v19;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Processing download complete: %@, parent:%@, downloadID:%{public}@", buf, 0x20u);
        }

        if (v18)
        {
          [(BSUILibraryItemStateProvider *)self _untrackChildIdentifier:v14 forParentIdentifier:v16];
          if (![(BSUILibraryItemStateProvider *)self _hasRemainingDownloadsForIdentifier:v16])
          {
            [(BSUILibraryItemStateProvider *)self _updateStateToDownloadFinishedForIdentifier:v18];
            long long v21 = [(BSUILibraryItemStateProvider *)self _stateForItemIdentifier:v18];
            [(BSUILibraryItemStateCenter *)self->_stateCenter updateItemWithIdentifier:v18 state:v21];
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v9);
  }
}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  id v5 = [a4 storeIdentifier:a3];
  id v7 = [v5 stringValue];

  id v6 = v7;
  if (v7)
  {
    [(BSUILibraryItemStateProvider *)self updateStateToPurchasingForIdentifier:v7];
    id v6 = v7;
  }
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
}

- (BSUILibraryItemStateCenter)stateCenter
{
  return self->_stateCenter;
}

- (id)purchaseSucceededObserver
{
  return self->_purchaseSucceededObserver;
}

- (void)setPurchaseSucceededObserver:(id)a3
{
}

- (id)purchaseFailedObserver
{
  return self->_purchaseFailedObserver;
}

- (void)setPurchaseFailedObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purchaseFailedObserver, 0);
  objc_storeStrong(&self->_purchaseSucceededObserver, 0);
  objc_storeStrong((id *)&self->_stateCenter, 0);
  objc_storeStrong((id *)&self->_childIdentifiersForParentIdentifierMap, 0);
  objc_storeStrong((id *)&self->_parentIdentifierForStoreIdentifierMap, 0);
  objc_storeStrong((id *)&self->_purchasesMadeThisSession, 0);
  objc_storeStrong((id *)&self->_downloadingItems, 0);
  objc_storeStrong((id *)&self->_itemFinishedStateCache, 0);
  objc_storeStrong((id *)&self->_itemWantToReadStateCache, 0);
  objc_storeStrong((id *)&self->_itemStateCache, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_fileChangesQ, 0);

  objc_storeStrong((id *)&self->_accessQ, 0);
}

@end