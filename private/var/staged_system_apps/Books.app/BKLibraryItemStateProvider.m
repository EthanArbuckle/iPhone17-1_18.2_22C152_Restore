@interface BKLibraryItemStateProvider
+ (id)_propertiesToMonitor;
- (BKLibraryItemStateProvider)initWithLibraryManager:(id)a3;
- (BKLibraryManager)libraryManager;
- (BOOL)_updateItemStateFieldsFromMediaLibrary:(id)a3;
- (BSUILibraryItemStateCenter)stateCenter;
- (NSMutableSet)storeIDsPurchasing;
- (id)_simulateAssetIDFromItemIdentifier:(id)a3;
- (id)_stateForItemIdentifier:(id)a3 libraryAsset:(id)a4;
- (id)itemStateWithIdentifier:(id)a3;
- (id)itemsOfInterest;
- (id)purchaseObserver;
- (void)_handleDownloadError:(id)a3 downloadStatus:(id)a4;
- (void)_mediaLibraryDidChange:(id)a3;
- (void)_minifiedAssetPresentersChangedNotification:(id)a3;
- (void)_simulatedUpdateItems:(id)a3;
- (void)_storeAvailableUpdatesChangedNotification:(id)a3;
- (void)_updateItemStatesForAssetIDs:(id)a3;
- (void)dealloc;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPurchaseObserver:(id)a3;
- (void)setStoreIDsPurchasing:(id)a3;
- (void)simulateClear:(id)a3;
- (void)simulateClearAll;
- (void)simulateDownload:(id)a3 :(id)a4;
- (void)simulateLibrary:(id)a3 :(id)a4;
- (void)updateInterest:(id)a3;
- (void)updateStateToDownloadFailedForIdentifier:(id)a3;
- (void)updateStateToPurchaseFailedForIdentifier:(id)a3;
- (void)updateStateToPurchasingForIdentifier:(id)a3;
@end

@implementation BKLibraryItemStateProvider

- (void)updateInterest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000410F8;
  v5[3] = &unk_100A43DD8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock_with_options();
  sub_1000410F8((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (id)itemStateWithIdentifier:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100006F84;
  v17 = sub_1000071AC;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052A58;
  v10[3] = &unk_100A45660;
  v12 = &v13;
  v10[4] = self;
  id v4 = a3;
  id v11 = v4;
  v5 = objc_retainBlock(v10);
  unsigned int v6 = +[NSThread isMainThread];
  libraryManager = self->_libraryManager;
  if (v6) {
    [(BKLibraryManager *)libraryManager performBlockInUIContext:v5];
  }
  else {
    [(BKLibraryManager *)libraryManager performBackgroundReadOnlyBlockAndWait:v5];
  }
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_stateForItemIdentifier:(id)a3 libraryAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setItemIdentifier:v6];
  if ([(NSMutableSet *)self->_storeIDsPurchasing containsObject:v6]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [v8 setLibrary:v9];
  [v8 setDownload:0];
  [v8 setIsInSamples:0];
  [v8 setIsSample:0];
  [v8 setWantToRead:0];
  [v8 setStreamable:0];
  [v8 setUpdateAvailable:0];
  [v8 setPlay:0];
  [v8 setSeriesType:0];
  [v8 setFinished:[v7 isFinished]];
  [v8 setHasSpecifiedFinishedDate:[v7 hasSpecifiedFinishedDate]];
  [v8 setTrackedAsRecent:[v7 isTrackedAsRecent]];
  [v8 setIsPurchased:0];
  [v8 setAssetIsPreorderable:[v7 isPreorderBook]];
  v10 = &off_10085C000;
  if (!v7) {
    goto LABEL_61;
  }
  if ([v7 isCloud])
  {
    uint64_t v11 = 0;
  }
  else if ([v7 isLocal])
  {
    uint64_t v11 = 2;
  }
  else
  {
    if (![v7 isDownloading]) {
      goto LABEL_12;
    }
    uint64_t v11 = 1;
  }
  [v8 setDownload:v11];
LABEL_12:
  if ([v7 isPreorderBook])
  {
    v12 = v8;
    uint64_t v13 = 3;
LABEL_14:
    [v12 setLibrary:v13];
    [v8 setIsPurchased:1];
    goto LABEL_23;
  }
  if ([v7 isStoreItem])
  {
    v14 = v8;
    uint64_t v15 = 1;
LABEL_22:
    [v14 setLibrary:v15];
    goto LABEL_23;
  }
  if ([v7 isStore]
    && ([v7 isSeriesItem] & 1) == 0
    && ([v7 isSample] & 1) == 0)
  {
    v12 = v8;
    uint64_t v13 = 4;
    goto LABEL_14;
  }
  if (([v7 isStore] & 1) == 0)
  {
    v14 = v8;
    uint64_t v15 = 5;
    goto LABEL_22;
  }
LABEL_23:
  unsigned int v16 = [v7 seriesType];
  if (v16 <= 3) {
    [v8 setSeriesType:v16];
  }
  [v8 setIsInSamples:[v7 isInSamples]];
  [v8 setIsSample:[v7 isSample]];
  if (![v7 streamable])
  {
    if ((([v7 isAudiobook] & 1) != 0 || objc_msgSend(v8, "library") != (id)4)
      && [v8 library] != (id)3)
    {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  v17 = [(BKLibraryItemStateProvider *)self storeIDsPurchasing];
  unsigned int v18 = [v17 containsObject:v6];

  if (!v18)
  {
    [v8 setStreamable:1];
    goto LABEL_43;
  }
  if (![(BKLibraryItemStateProvider *)self _updateItemStateFieldsFromMediaLibrary:v8])
  {
    v19 = BKLibraryItemStateProviderLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v6;
      v22 = "Set item (%@) to purchasing state as it had not landed in media library";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
    }
LABEL_42:

    [v8 setLibrary:2];
    goto LABEL_43;
  }
  if ([v8 download] != (id)2)
  {
    if ([v8 isFamilyPurchase])
    {
      v21 = BKLibraryItemStateProviderLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v62 = v6;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Item (%@) belongs to a family member, allow download progress and no streaming", buf, 0xCu);
      }
      goto LABEL_37;
    }
    unsigned int v45 = [v8 isStreamable];
    v19 = BKLibraryItemStateProviderLog();
    BOOL v46 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v45)
    {
      if (!v46) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      id v62 = v6;
      v20 = "Removing item (%@) from purchasing store IDs as it is streamable in the media library";
      goto LABEL_31;
    }
    if (v46)
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v6;
      v22 = "Set item (%@) to purchasing state as it is not yet playable and is not a family purchase";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  v19 = BKLibraryItemStateProviderLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v6;
    v20 = "Removing item (%@) from purchasing store IDs as it is local in the media library";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
  }
LABEL_32:

LABEL_36:
  v21 = [(BKLibraryItemStateProvider *)self storeIDsPurchasing];
  [v21 removeObject:v6];
LABEL_37:

LABEL_43:
  v48 = v6;
  if (objc_msgSend(v7, "isDownloadingSupplementalContent", self)) {
    [v8 setDownload:1];
  }
  v23 = [v7 readingProgress];
  v24 = +[NSString bc_formattedReadingProgress:isFinished:](NSString, "bc_formattedReadingProgress:isFinished:", v23, [v7 isFinished]);
  [v8 setReadingProgress:v24];

  v25 = [v7 readingProgress];
  [v25 doubleValue];
  [v8 setReadingProgressValue:];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v26 = [v7 collectionMembers];
  id v27 = [v26 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v57;
    uint64_t v30 = kBKCollectionDefaultIDWantToRead;
    while (2)
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v57 != v29) {
          objc_enumerationMutation(v26);
        }
        v32 = [*(id *)(*((void *)&v56 + 1) + 8 * i) collection];
        v33 = [v32 collectionID];
        unsigned int v34 = [v33 isEqualToString:v30];

        if (v34)
        {
          [v8 setWantToRead:1];
          goto LABEL_55;
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }
LABEL_55:

  self = v47;
  audiobookStatusMap = v47->_audiobookStatusMap;
  v36 = [v7 assetID];
  v37 = [(NSMutableDictionary *)audiobookStatusMap objectForKeyedSubscript:v36];

  if (v37)
  {
    if ([v37 assetAudiobookStatusIsPlaying]) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = 2;
    }
    [v8 setPlay:v38];
  }
  v52[0] = _NSConcreteStackBlock;
  v10 = &off_10085C000;
  v52[1] = 3221225472;
  v52[2] = sub_1000C168C;
  v52[3] = &unk_100A443C8;
  id v53 = v8;
  v54 = v47;
  id v6 = v48;
  id v55 = v48;
  os_unfair_lock_lock_with_options();
  sub_1000C168C(v52);
  os_unfair_lock_unlock(&v47->_accessLock);

LABEL_61:
  p_accessLock = &self->_accessLock;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = *((void *)v10 + 217);
  v49[2] = sub_10005387C;
  v49[3] = &unk_100A443C8;
  v49[4] = self;
  id v50 = v6;
  id v40 = v8;
  id v51 = v40;
  id v41 = v6;
  os_unfair_lock_lock_with_options();
  sub_10005387C((uint64_t)v49);
  os_unfair_lock_unlock(p_accessLock);
  v42 = v51;
  id v43 = v40;

  return v43;
}

- (BKLibraryItemStateProvider)initWithLibraryManager:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BKLibraryItemStateProvider;
  id v6 = [(BKLibraryItemStateProvider *)&v29 init];
  id v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_libraryManager, a3);
    id v8 = (BSUILibraryItemStateCenter *)[objc_alloc((Class)BSUILibraryItemStateCenter) initWithProvider:v7];
    stateCenter = v7->_stateCenter;
    v7->_stateCenter = v8;

    uint64_t v10 = +[NSSet set];
    storeIDsWithAvailableUpdates = v7->_storeIDsWithAvailableUpdates;
    v7->_storeIDsWithAvailableUpdates = (NSSet *)v10;

    uint64_t v12 = +[NSMutableSet set];
    storeIDsPurchasing = v7->_storeIDsPurchasing;
    v7->_storeIDsPurchasing = (NSMutableSet *)v12;

    id v14 = objc_alloc((Class)BCManagedObjectIDMonitor);
    uint64_t v15 = [v5 persistentStoreCoordinator];
    unsigned int v16 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
    v17 = +[BKLibraryItemStateProvider _propertiesToMonitor];
    unsigned int v18 = (BCManagedObjectIDMonitor *)[v14 initWithContext:0 coordinator:v15 entityName:@"BKLibraryAsset" predicate:v16 mapProperty:@"assetID" propertiesOfInterest:v17 observer:v7];
    monitor = v7->_monitor;
    v7->_monitor = v18;

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v7 selector:"_minifiedAssetPresentersChangedNotification:" name:@"BKMnifiedPresentersUpdatedNotification" object:0];
    [v20 addObserver:v7 selector:"_storeAvailableUpdatesChangedNotification:" name:kAEStoreNumberOfUpdatesAvailableChangedNotification object:0];
    [v20 addObserver:v7 selector:"_mediaLibraryDidChange:" name:MPMediaLibraryDidChangeNotification object:0];
    v21 = +[BLDownloadQueue sharedInstance];
    [v21 addObserver:v7];

    v22 = +[NSOperationQueue mainQueue];
    objc_initWeak(&location, v7);
    uint64_t v23 = BLDownloadQueuePurchaseFailedNotification;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000C08F0;
    v26[3] = &unk_100A45610;
    objc_copyWeak(&v27, &location);
    v24 = [v20 addObserverForName:v23 object:0 queue:v22 usingBlock:v26];
    [(BKLibraryItemStateProvider *)v7 setPurchaseObserver:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (NSMutableSet)storeIDsPurchasing
{
  return self->_storeIDsPurchasing;
}

- (BSUILibraryItemStateCenter)stateCenter
{
  return self->_stateCenter;
}

- (void)setPurchaseObserver:(id)a3
{
}

- (void)_mediaLibraryDidChange:(id)a3
{
  id v4 = [(BKLibraryItemStateProvider *)self storeIDsPurchasing];
  id v5 = [v4 allObjects];

  if ([v5 count]) {
    [(BKLibraryItemStateProvider *)self _updateItemStatesForAssetIDs:v5];
  }
}

+ (id)_propertiesToMonitor
{
  v5[0] = @"combinedState";
  v5[1] = @"collectionMembers";
  v5[2] = @"dateFinished";
  v5[3] = @"expectedDate";
  v5[4] = @"isFinished";
  void v5[5] = @"isSample";
  v5[6] = @"isTrackedAsRecent";
  v5[7] = @"readingProgress";
  v5[8] = @"storeID";
  v2 = +[NSArray arrayWithObjects:v5 count:9];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  id v5 = [(BKLibraryItemStateProvider *)self purchaseObserver];
  [v4 removeObserver:v5];

  id v6 = +[BLDownloadQueue sharedInstance];
  [v6 removeObserver:self];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(NSMutableDictionary *)self->_audiobookStatusMap allValues];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1DBB8];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryItemStateProvider;
  [(BKLibraryItemStateProvider *)&v12 dealloc];
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_new();
  id v7 = [v5 addedObjects];
  [v6 addObjectsFromArray:v7];

  id v8 = [v5 deletedObjects];
  [v6 addObjectsFromArray:v8];

  id v9 = [v5 updatedObjects];
  [v6 addObjectsFromArray:v9];

  long long v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = sub_1000C0CE0;
  long long v16 = &unk_100A43DD8;
  id v10 = v6;
  id v17 = v10;
  unsigned int v18 = self;
  os_unfair_lock_lock_with_options();
  sub_1000C0CE0((uint64_t)&v13);
  os_unfair_lock_unlock(&self->_accessLock);
  uint64_t v11 = BKLibraryItemStateProviderLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1007E93C0(v5, (uint64_t)v10, v11);
  }

  if (objc_msgSend(v10, "count", v13, v14))
  {
    objc_super v12 = [v10 allObjects];
    [(BKLibraryItemStateProvider *)self _updateItemStatesForAssetIDs:v12];
  }
}

- (void)_storeAvailableUpdatesChangedNotification:(id)a3
{
  id v4 = +[NSMutableSet set];
  id v5 = +[BKAppDelegate delegate];
  id v6 = [v5 storeController];
  id v7 = [v6 storeIDsWithAvailableUpdates];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C0E28;
  v11[3] = &unk_100A443C8;
  id v12 = v4;
  long long v13 = self;
  id v14 = v7;
  id v8 = v7;
  id v9 = v4;
  os_unfair_lock_lock_with_options();
  sub_1000C0E28((uint64_t)v11);
  os_unfair_lock_unlock(&self->_accessLock);
  id v10 = [v9 allObjects];
  [(BKLibraryItemStateProvider *)self _updateItemStatesForAssetIDs:v10];
}

- (void)_minifiedAssetPresentersChangedNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v35 = v4;
  id v5 = [v4 object];
  id v6 = BUDynamicCast();

  unsigned int v34 = v6;
  id v7 = [v6 minifiedAssetPresenters];
  audiobookStatusMap = self->_audiobookStatusMap;
  if (!audiobookStatusMap)
  {
    id v9 = (NSMutableDictionary *)objc_opt_new();
    id v10 = self->_audiobookStatusMap;
    self->_audiobookStatusMap = v9;

    audiobookStatusMap = self->_audiobookStatusMap;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v11 = [(NSMutableDictionary *)audiobookStatusMap allValues];
  id v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * i) removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1DBB8];
      }
      id v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }

  v36 = (NSMutableDictionary *)objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        v22 = [v21 minifiedAssetPresenterAssetID:v33];
        uint64_t v23 = [v21 minifiedAssetStatus];
        objc_opt_class();
        v33 = &OBJC_PROTOCOL___AEAssetAudiobookStatus;
        uint64_t v24 = BUClassAndProtocolCast();
        v25 = (void *)v24;
        if (v22) {
          BOOL v26 = v24 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v24, v22, &OBJC_PROTOCOL___AEAssetAudiobookStatus);
          [v25 addObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" options:0 context:off_100B1DBB8];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v18);
  }

  id v27 = [(NSMutableDictionary *)v36 allKeys];
  id v28 = +[NSMutableSet setWithArray:v27];

  objc_super v29 = [(NSMutableDictionary *)self->_audiobookStatusMap allKeys];
  uint64_t v30 = +[NSMutableSet setWithArray:v29];

  [v28 unionSet:v30];
  v31 = self->_audiobookStatusMap;
  self->_audiobookStatusMap = v36;

  v32 = [v28 allObjects];
  [(BKLibraryItemStateProvider *)self _updateItemStatesForAssetIDs:v32];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100B1DBB8 == a6)
  {
    id v11 = a4;
    objc_opt_class();
    BUClassAndProtocolCast();
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = v14;
    if (v14)
    {
      id v13 = -[NSMutableDictionary allKeysForObject:](self->_audiobookStatusMap, "allKeysForObject:", v14, &OBJC_PROTOCOL___AEAssetAudiobookStatus);
      [(BKLibraryItemStateProvider *)self _updateItemStatesForAssetIDs:v13];

      id v12 = v14;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKLibraryItemStateProvider;
    id v10 = a4;
    [(BKLibraryItemStateProvider *)&v15 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)_updateItemStatesForAssetIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 mutableCopy];
    libraryManager = self->_libraryManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000C1400;
    v8[3] = &unk_100A45638;
    id v9 = v4;
    id v10 = self;
    id v11 = v5;
    id v7 = v5;
    [(BKLibraryManager *)libraryManager fetchLibraryAssetsFromAssetIDs:v9 handler:v8];
  }
}

- (id)itemsOfInterest
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100006F84;
  objc_super v15 = sub_1000071AC;
  id v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_1000C1800;
  id v8 = &unk_100A44058;
  id v9 = self;
  id v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)updateStateToPurchasingForIdentifier:(id)a3
{
  id v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C18EC;
  v7[3] = &unk_100A44E38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKLibraryManager *)libraryManager performBlockOnWorkerQueue:v7];
}

- (void)updateStateToPurchaseFailedForIdentifier:(id)a3
{
  id v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C1A2C;
  v7[3] = &unk_100A44E38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKLibraryManager *)libraryManager performBlockOnWorkerQueue:v7];
}

- (void)updateStateToDownloadFailedForIdentifier:(id)a3
{
  id v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C1B6C;
  v7[3] = &unk_100A44E38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKLibraryManager *)libraryManager performBlockOnWorkerQueue:v7];
}

- (BOOL)_updateItemStateFieldsFromMediaLibrary:(id)a3
{
  id v56 = a3;
  v3 = [v56 itemIdentifier];
  id v4 = +[MPMediaQuery bk_audiobooksQuery];
  if (v4 && [v3 length])
  {
    uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:MPMediaItemPropertyStorePlaylistID];
    long long v41 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:MPMediaItemPropertyStoreID];
    long long v42 = (void *)v5;
    v74[0] = v5;
    v74[1] = v41;
    id v6 = +[NSArray arrayWithObjects:v74 count:2];
    id v7 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v6];
    [v4 addFilterPredicate:v7];

    [v4 setGroupingType:1];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v43 = v4;
    id obj = [v4 collections];
    id v46 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
    char v8 = 0;
    if (v46)
    {
      uint64_t v45 = *(void *)v65;
      uint64_t v54 = MPMediaItemPropertyStoreFamilyAccountID;
      uint64_t v53 = MPMediaItemPropertyStoreDownloaderAccountID;
      uint64_t v52 = MPMediaItemPropertyStoreAccountID;
      uint64_t v49 = MPMediaItemPropertyIsLocal;
      uint64_t v48 = MPMediaItemPropertyHLSPlaylistURL;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v65 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = v9;
          id v10 = *(void **)(*((void *)&v64 + 1) + 8 * v9);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v59 = [v10 items];
          id v11 = [v59 countByEnumeratingWithState:&v60 objects:v72 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v51 = 0;
            char v50 = 0;
            uint64_t v13 = *(void *)v61;
            uint64_t v57 = *(void *)v61;
            do
            {
              id v14 = 0;
              id v58 = v12;
              do
              {
                if (*(void *)v61 != v13) {
                  objc_enumerationMutation(v59);
                }
                objc_super v15 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v14);
                id v16 = [v15 bk_storeID];
                id v17 = [v16 stringValue];
                unsigned int v18 = [v3 isEqualToString:v17];

                if (v18)
                {
                  uint64_t v19 = v3;
                  objc_opt_class();
                  v20 = [v15 valueForProperty:MPMediaItemPropertyIsCloudItem];
                  v21 = BUDynamicCast();

                  objc_opt_class();
                  v22 = [v15 valueForProperty:v54];
                  uint64_t v23 = BUDynamicCast();

                  objc_opt_class();
                  uint64_t v24 = [v15 valueForProperty:v53];
                  v25 = BUDynamicCast();

                  objc_opt_class();
                  BOOL v26 = [v15 valueForProperty:v52];
                  id v27 = BUDynamicCast();

                  id v28 = [(BKLibraryItemStateProvider *)self libraryManager];
                  id v29 = [v28 isFamilyPurchaseWithFamilyID:v23 purchaserDSID:v27 downloaderDSID:v25];

                  if ([v21 BOOLValue])
                  {
                    objc_opt_class();
                    uint64_t v30 = [v15 valueForProperty:v48];
                    v31 = BUDynamicCast();

                    id v32 = [v31 length];
                    char v33 = BLAudiobookStreamingEnabled();
                    if (v32) {
                      char v34 = v33;
                    }
                    else {
                      char v34 = 0;
                    }
                    LOBYTE(v51) = v34;
                    v35 = BKLibraryItemStateProviderLog();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109376;
                      BOOL v69 = v32 != 0;
                      __int16 v70 = 1024;
                      int v71 = (int)v29;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found a cloud audiobook media item with a valid playlist? %d, is family? %d.", buf, 0xEu);
                    }
                  }
                  else
                  {
                    v31 = [v15 valueForProperty:v49];
                    HIDWORD(v51) = [v31 BOOLValue] ^ 1;
                    v35 = BKLibraryItemStateProviderLog();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v36 = [v31 BOOLValue];
                      *(_DWORD *)buf = 67109376;
                      BOOL v69 = v36;
                      __int16 v70 = 1024;
                      int v71 = (int)v29;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found a non-cloud audiobook media item that is local? %d, is family? %d.", buf, 0xEu);
                    }
                    char v50 = 1;
                  }
                  v3 = v19;

                  [v56 setFamilyPurchase:v29];
                  char v8 = 1;
                  uint64_t v13 = v57;
                  id v12 = v58;
                }
                id v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v59 countByEnumeratingWithState:&v60 objects:v72 count:16];
            }
            while (v12);
          }
          else
          {
            uint64_t v51 = 0;
            char v50 = 0;
          }

          if (v8)
          {
            [v56 setStreamable:v51 & 1];
            uint64_t v38 = 1;
            if ((v51 & 0x100000000) == 0) {
              uint64_t v38 = 2;
            }
            if (v50) {
              uint64_t v39 = v38;
            }
            else {
              uint64_t v39 = 0;
            }
            [v56 setDownload:v39];
            goto LABEL_39;
          }
          uint64_t v9 = v47 + 1;
        }
        while ((id)(v47 + 1) != v46);
        id v46 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }
LABEL_39:

    BOOL v37 = v8 & 1;
    id v4 = v43;
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (id)_simulateAssetIDFromItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100006F84;
  v21 = sub_1000071AC;
  objc_opt_class();
  BUDynamicCast();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = [v4 stringValue];
    id v6 = (void *)v18[5];
    v18[5] = v5;
  }
  id v7 = (void *)v18[5];
  if (!v7)
  {
    p_accessLock = &self->_accessLock;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    uint64_t v13 = sub_1000C240C;
    id v14 = &unk_100A44170;
    objc_super v15 = self;
    id v16 = &v17;
    uint64_t v9 = v12;
    os_unfair_lock_lock_with_options();
    v13((uint64_t)v9);
    os_unfair_lock_unlock(p_accessLock);

    id v7 = (void *)v18[5];
  }
  id v10 = v7;
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)_simulatedUpdateItems:(id)a3
{
  id v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C2514;
  v7[3] = &unk_100A44E38;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(BKLibraryManager *)libraryManager performBlockOnWorkerQueue:v7];
}

- (void)simulateLibrary:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = [(BKLibraryItemStateProvider *)self _simulateAssetIDFromItemIdentifier:a3];
  id v8 = [&off_100A83360 objectForKeyedSubscript:v6];

  id v9 = [v8 unsignedIntegerValue];
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_1000C27D8;
    v12[3] = &unk_100A45688;
    v12[4] = self;
    id v14 = v9;
    id v10 = v7;
    id v13 = v10;
    os_unfair_lock_lock_with_options();
    sub_1000C27D8(v12);
    os_unfair_lock_unlock(&self->_accessLock);
    id v15 = v10;
    id v11 = +[NSArray arrayWithObjects:&v15 count:1];
    [(BKLibraryItemStateProvider *)self _simulatedUpdateItems:v11];
  }
}

- (void)simulateDownload:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = [(BKLibraryItemStateProvider *)self _simulateAssetIDFromItemIdentifier:a3];
  id v8 = [&off_100A83388 objectForKeyedSubscript:v6];

  id v9 = [v8 unsignedIntegerValue];
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_1000C29D8;
    v12[3] = &unk_100A45688;
    v12[4] = self;
    id v14 = v9;
    id v10 = v7;
    id v13 = v10;
    os_unfair_lock_lock_with_options();
    sub_1000C29D8(v12);
    os_unfair_lock_unlock(&self->_accessLock);
    id v15 = v10;
    id v11 = +[NSArray arrayWithObjects:&v15 count:1];
    [(BKLibraryItemStateProvider *)self _simulatedUpdateItems:v11];
  }
}

- (void)simulateClear:(id)a3
{
  id v4 = [(BKLibraryItemStateProvider *)self _simulateAssetIDFromItemIdentifier:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_1000C2B94;
    id v11 = &unk_100A43DD8;
    id v12 = self;
    id v6 = v4;
    id v13 = v6;
    os_unfair_lock_lock_with_options();
    sub_1000C2B94((uint64_t)&v8);
    os_unfair_lock_unlock(&self->_accessLock);
    id v14 = v6;
    id v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v8, v9);
    [(BKLibraryItemStateProvider *)self _simulatedUpdateItems:v7];
  }
}

- (void)simulateClearAll
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100006F84;
  id v14 = sub_1000071AC;
  id v15 = (id)objc_opt_new();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = sub_1000C2D68;
  id v7 = &unk_100A44058;
  id v8 = self;
  uint64_t v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock_with_options();
  v6((uint64_t)v3);
  os_unfair_lock_unlock(&self->_accessLock);

  id v4 = [(id)v11[5] allObjects];
  [(BKLibraryItemStateProvider *)self _simulatedUpdateItems:v4];

  _Block_object_dispose(&v10, 8);
}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  uint64_t v5 = [a4 storeIdentifier];
  id v7 = [v5 stringValue];

  if (v7)
  {
    [(BKLibraryItemStateProvider *)self updateStateToPurchasingForIdentifier:v7];
    id v6 = [(BKLibraryItemStateProvider *)self storeIDsPurchasing];
    [v6 addObject:v7];
  }
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v7);
          }
          [(BKLibraryItemStateProvider *)self _handleDownloadError:v8 downloadStatus:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12)];
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)_handleDownloadError:(id)a3 downloadStatus:(id)a4
{
  id v11 = a4;
  uint64_t v5 = [v11 storePlaylistID];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v11 storeID];
  }
  id v8 = v7;

  id v9 = [v8 stringValue];
  if (v9)
  {
    [(BKLibraryItemStateProvider *)self updateStateToDownloadFailedForIdentifier:v9];
    id v10 = [(BKLibraryItemStateProvider *)self storeIDsPurchasing];
    [v10 removeObject:v9];
  }
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (void)setStoreIDsPurchasing:(id)a3
{
}

- (id)purchaseObserver
{
  return self->_purchaseObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purchaseObserver, 0);
  objc_storeStrong((id *)&self->_storeIDsPurchasing, 0);
  objc_storeStrong((id *)&self->_libraryManager, 0);
  objc_storeStrong((id *)&self->_stateCenter, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAvailableUpdates, 0);
  objc_storeStrong((id *)&self->_audiobookStatusMap, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_simulatedDownload, 0);
  objc_storeStrong((id *)&self->_simulatedLibrary, 0);

  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

@end