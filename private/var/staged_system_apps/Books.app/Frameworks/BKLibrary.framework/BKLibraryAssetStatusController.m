@interface BKLibraryAssetStatusController
+ (id)sharedController;
- (BKLibraryAssetStatusController)init;
- (BKLibraryAssetStatusController)initWithLibrary:(id)a3;
- (BKLibraryAssetStatusControllerStoreDelegate)storeDelegate;
- (BOOL)_filterDownloadForAsset:(id)a3;
- (BOOL)_filterUpdateForAsset:(id)a3;
- (BOOL)_filterUploadsForAsset:(id)a3;
- (BOOL)_hasActiveDownloadForAssetID:(id)a3;
- (BOOL)_includeInDownloadsForAssetID:(id)a3;
- (BOOL)_includeInUploadsForAssetID:(id)a3;
- (BOOL)_includedInUpdatesForAssetID:(id)a3;
- (BOOL)_isSignedInForAssetID:(id)a3;
- (BOOL)_passesExplicitContentFilter:(id)a3;
- (BOOL)checkingForUpdates;
- (BOOL)explicitContentRestricted;
- (BOOL)hasDownloads;
- (BOOL)hasUpdates;
- (BOOL)hasUpdatesOrDownloadsOrUploads;
- (BOOL)hasUploads;
- (BUCoalescingCallBlock)downloadRelatedNotificationCoalescingBlock;
- (IMArrayController)downloadAssets;
- (IMArrayController)updateAssets;
- (IMArrayController)uploadAssets;
- (NSMutableArray)downloadRelatedNotificationsToProcess;
- (double)downloadAssetsTotalPercentComplete;
- (id)_addArrayControllerWithFilter:(id)a3;
- (id)_persistedInfoURL;
- (id)_updateInfoForAssetID:(id)a3;
- (id)addStatusObserverWithFilter:(id)a3 notify:(id)a4;
- (id)ephemeralStatusForAssetID:(id)a3;
- (id)statusForAssetID:(id)a3;
- (unint64_t)canPauseCount;
- (unint64_t)canResumeCount;
- (unint64_t)downloadAssetsCount;
- (unint64_t)unacknowledgedDownloadsCount;
- (unint64_t)unacknowledgedUpdatesCount;
- (unint64_t)updateAssetsCount;
- (unint64_t)uploadAssetsCount;
- (unint64_t)uploadStatus;
- (void)_addAssetID:(id)a3;
- (void)_downloadStatusNotification:(id)a3;
- (void)_libraryOwnershipNotification:(id)a3;
- (void)_libraryUpdateNotification:(id)a3;
- (void)_processDownloadRelatedNotificationsCompletion:(id)a3;
- (void)_processDownloadStatuses:(id)a3 completion:(id)a4;
- (void)_processLibraryAssetChanges:(id)a3;
- (void)_processLibraryOwnershipNotification:(id)a3 completion:(id)a4;
- (void)_readPersistedInfoFromDisk;
- (void)_removeArrayController:(id)a3;
- (void)_removeAssetID:(id)a3;
- (void)_removeAssetIDs:(id)a3;
- (void)_removeTrackingOfAssetID:(id)a3;
- (void)_showUpdateFailureForAssetID:(id)a3;
- (void)_startUpdateForAssetIDs:(id)a3;
- (void)_trimUpdateDictionary;
- (void)_updateAcknowledgeCountsWithAssetIDs:(id)a3;
- (void)_updateAssetsWithBlock:(id)a3;
- (void)_updateCountsForAssetIDs:(id)a3;
- (void)_updateSeriesContainerDownloadStatusForAssetIDs:(id)a3;
- (void)_updateTotalPercentCompleteForAssetIDs:(id)a3;
- (void)_updateUploadStatusForAssetIDs:(id)a3;
- (void)_updatedAssets;
- (void)_writePersistedInfoToDisk;
- (void)_writePersistentInfoIfNeeded;
- (void)acknowledgeCurrentUpdatesAndDownloads;
- (void)cancelDownloadOfAsset:(id)a3;
- (void)checkForUpdates:(id)a3;
- (void)dealloc;
- (void)makeAccountPrimaryAndCheckForUpdateAndUpdateAssetUnacknowledged:(id)a3;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)managedObjectBackgroundMonitor:(id)a3 fetchNotify:(id)a4;
- (void)pauseDownloadOfAsset:(id)a3;
- (void)primaryAccountChanged;
- (void)removeCompletedDownloads;
- (void)removeCompletedUploads;
- (void)restartDownloadOfAsset:(id)a3;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)resumeDownloadOfAsset:(id)a3;
- (void)setCanPauseCount:(unint64_t)a3;
- (void)setCanResumeCount:(unint64_t)a3;
- (void)setCheckingForUpdates:(BOOL)a3;
- (void)setDownloadAssetsTotalPercentComplete:(double)a3;
- (void)setDownloadRelatedNotificationCoalescingBlock:(id)a3;
- (void)setDownloadRelatedNotificationsToProcess:(id)a3;
- (void)setExplicitContentRestricted:(BOOL)a3;
- (void)setHasDownloads:(BOOL)a3;
- (void)setHasUpdates:(BOOL)a3;
- (void)setHasUpdatesOrDownloadsOrUploads:(BOOL)a3;
- (void)setHasUploads:(BOOL)a3;
- (void)setStoreDelegate:(id)a3;
- (void)setUnacknowledgedDownloadsCount:(unint64_t)a3;
- (void)setUnacknowledgedUpdatesCount:(unint64_t)a3;
- (void)setUploadStatus:(unint64_t)a3;
- (void)setupStateObservation;
@end

@implementation BKLibraryAssetStatusController

+ (id)sharedController
{
  if (qword_EE5F0 != -1) {
    dispatch_once(&qword_EE5F0, &stru_D2828);
  }
  v2 = (void *)qword_EE5F8;

  return v2;
}

- (BKLibraryAssetStatusController)init
{
  v3 = +[BKLibraryManager defaultManager];
  v4 = [(BKLibraryAssetStatusController *)self initWithLibrary:v3];

  return v4;
}

- (BKLibraryAssetStatusController)initWithLibrary:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BKLibraryAssetStatusController;
  v5 = [(BKLibraryAssetStatusController *)&v59 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetStatusController.statuses", v6);
    v8 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetStatusController.monitors", v10);
    v12 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v11;

    uint64_t v13 = objc_opt_new();
    v14 = (void *)*((void *)v5 + 27);
    *((void *)v5 + 27) = v13;

    uint64_t v15 = objc_opt_new();
    v16 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v15;

    v17 = [[BKAssetArrayController alloc] initWithContent:*((void *)v5 + 4)];
    v18 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v17;

    v19 = [[BKAssetArrayController alloc] initWithContent:*((void *)v5 + 4)];
    v20 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v19;

    v21 = [[BKAssetArrayController alloc] initWithContent:*((void *)v5 + 4)];
    v22 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v21;

    uint64_t v23 = objc_opt_new();
    v24 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v23;

    *((void *)v5 + 22) = 0x3FF0000000000000;
    v5[162] = 0;
    *((void *)v5 + 25) = 0;
    *((_WORD *)v5 + 80) = 0;
    uint64_t v25 = objc_opt_new();
    v26 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v25;

    [v5 _readPersistedInfoFromDisk];
    v27 = +[BURestrictionsProvider sharedInstance];
    [v27 addObserver:v5];

    objc_initWeak(&location, v5);
    v28 = (void *)*((void *)v5 + 2);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_41400;
    v56[3] = &unk_D2850;
    objc_copyWeak(&v57, &location);
    [v28 setFilter:v56];
    v29 = (void *)*((void *)v5 + 1);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_41454;
    v54[3] = &unk_D2850;
    objc_copyWeak(&v55, &location);
    [v29 setFilter:v54];
    v30 = (void *)*((void *)v5 + 3);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_414A8;
    v52[3] = &unk_D2850;
    objc_copyWeak(&v53, &location);
    [v30 setFilter:v52];
    [v5 setupStateObservation];
    uint64_t v31 = [v4 dataSourcesConformingToProtocol:&OBJC_PROTOCOL___BKBookDownloadController];
    v32 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v31;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v33 = *((id *)v5 + 7);
    id v34 = [v33 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v49;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          [v37 setExplicitContentRestricted:v5[136]];
          [v37 updateDownloadStatus];
        }
        id v34 = [v33 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v34);
    }

    uint64_t v38 = [v4 dataSourceConformingToProtocol:&OBJC_PROTOCOL___BKBookUpdateController];
    v39 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v38;

    v40 = *((void *)v5 + 19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_414FC;
    block[3] = &unk_D1418;
    v41 = v5;
    v46 = v41;
    id v47 = v4;
    dispatch_async(v40, block);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_4163C;
    v43[3] = &unk_D1520;
    v44 = v41;
    [v44 _updateAssetsWithBlock:v43];

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);
  }

  return (BKLibraryAssetStatusController *)v5;
}

- (void)_updatedAssets
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_41A4C;
  v20[3] = &unk_D1520;
  v20[4] = self;
  v3 = objc_retainBlock(v20);
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_41A9C;
      block[3] = &unk_D2878;
      v19 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_additionalArrayControllers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_41AAC;
        v13[3] = &unk_D1520;
        v13[4] = v9;
        v10 = objc_retainBlock(v13);
        if (v10)
        {
          if (+[NSThread isMainThread])
          {
            ((void (*)(void *))v10[2])(v10);
          }
          else
          {
            v11[0] = _NSConcreteStackBlock;
            v11[1] = 3221225472;
            v11[2] = sub_41AB4;
            v11[3] = &unk_D2878;
            v12 = v10;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_addAssetID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(NSMutableArray *)self->_assetsArray containsObject:v4];
    id v5 = v6;
    if ((v4 & 1) == 0)
    {
      id v4 = [(NSMutableArray *)self->_assetsArray addObject:v6];
      id v5 = v6;
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)_removeAssetID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(NSMutableArray *)self->_assetsArray containsObject:v4];
    id v5 = v6;
    if (v4)
    {
      id v4 = [(NSMutableArray *)self->_assetsArray removeObject:v6];
      id v5 = v6;
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)_removeAssetIDs:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_assetsArray removeObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(BKLibraryAssetStatusController *)self _updatedAssets];
}

- (id)_persistedInfoURL
{
  v2 = +[NSFileManager defaultManager];
  v3 = [v2 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];

  id v4 = [v3 URLByAppendingPathComponent:@"BKLibraryAssetStatusController" isDirectory:0];

  return v4;
}

- (void)_writePersistedInfoToDisk
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  acknowledgedDownloads = self->_acknowledgedDownloads;
  if (acknowledgedDownloads) {
    [v3 setObject:acknowledgedDownloads forKeyedSubscript:@"AckedDownloads"];
  }
  acknowledgedUpdates = self->_acknowledgedUpdates;
  if (acknowledgedUpdates) {
    [v4 setObject:acknowledgedUpdates forKeyedSubscript:@"AckedUpdates"];
  }
  updateDictionary = self->_updateDictionary;
  if (updateDictionary) {
    [v4 setObject:updateDictionary forKeyedSubscript:@"Updates"];
  }
  backgroundQueue = self->_backgroundQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_41E14;
  v10[3] = &unk_D1418;
  id v11 = v4;
  long long v12 = self;
  id v9 = v4;
  dispatch_async(backgroundQueue, v10);
}

- (void)_readPersistedInfoFromDisk
{
  v3 = [(BKLibraryAssetStatusController *)self _persistedInfoURL];
  id v4 = +[NSData dataWithContentsOfURL:v3];

  persistentInfo = self->_persistentInfo;
  self->_persistentInfo = 0;

  acknowledgedDownloads = self->_acknowledgedDownloads;
  self->_acknowledgedDownloads = 0;

  acknowledgedUpdates = self->_acknowledgedUpdates;
  self->_acknowledgedUpdates = 0;

  updateDictionary = self->_updateDictionary;
  self->_updateDictionary = 0;

  if (v4)
  {
    id v35 = 0;
    id v9 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v35];
    id v10 = v35;
    if (v10)
    {
      id v11 = BKLibraryLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_91CF4((uint64_t)v10, v11);
      }
    }
    else
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
      objc_opt_class();
      long long v15 = [v9 decodeObjectOfClasses:v11 forKey:@"Root"];
      long long v16 = BUDynamicCast();

      objc_storeStrong((id *)&self->_persistentInfo, v16);
      objc_opt_class();
      long long v17 = [v16 objectForKeyedSubscript:@"AckedDownloads"];
      v18 = BUDynamicCast();
      v19 = (NSMutableSet *)[v18 mutableCopy];
      v20 = self->_acknowledgedDownloads;
      self->_acknowledgedDownloads = v19;

      objc_opt_class();
      v21 = [v16 objectForKeyedSubscript:@"AckedUpdates"];
      v22 = BUDynamicCast();
      uint64_t v23 = (NSMutableSet *)[v22 mutableCopy];
      v24 = self->_acknowledgedUpdates;
      self->_acknowledgedUpdates = v23;

      objc_opt_class();
      uint64_t v25 = [v16 objectForKeyedSubscript:@"Updates"];
      v26 = BUDynamicCast();
      v27 = (NSMutableDictionary *)[v26 mutableCopy];
      v28 = self->_updateDictionary;
      self->_updateDictionary = v27;
    }
  }
  if (!self->_acknowledgedDownloads)
  {
    v29 = (NSMutableSet *)objc_opt_new();
    v30 = self->_acknowledgedDownloads;
    self->_acknowledgedDownloads = v29;
  }
  if (!self->_acknowledgedUpdates)
  {
    uint64_t v31 = (NSMutableSet *)objc_opt_new();
    v32 = self->_acknowledgedUpdates;
    self->_acknowledgedUpdates = v31;
  }
  if (!self->_updateDictionary)
  {
    id v33 = (NSMutableDictionary *)objc_opt_new();
    id v34 = self->_updateDictionary;
    self->_updateDictionary = v33;
  }
}

- (void)_writePersistentInfoIfNeeded
{
  acknowledgedDownloads = self->_acknowledgedDownloads;
  id v4 = [(NSDictionary *)self->_persistentInfo objectForKeyedSubscript:@"AckedDownloads"];
  unsigned __int8 v5 = [(NSMutableSet *)acknowledgedDownloads isEqual:v4];

  acknowledgedUpdates = self->_acknowledgedUpdates;
  uint64_t v7 = [(NSDictionary *)self->_persistentInfo objectForKeyedSubscript:@"AckedUpdates"];
  unsigned int v8 = [(NSMutableSet *)acknowledgedUpdates isEqual:v7];

  updateDictionary = self->_updateDictionary;
  id v10 = [(NSDictionary *)self->_persistentInfo objectForKeyedSubscript:@"Updates"];
  LODWORD(updateDictionary) = [(NSMutableDictionary *)updateDictionary isEqual:v10];

  if (!updateDictionary || !v8 || (v5 & 1) == 0)
  {
    [(BKLibraryAssetStatusController *)self _writePersistedInfoToDisk];
  }
}

- (id)_updateInfoForAssetID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    unsigned __int8 v5 = [(NSMutableDictionary *)self->_updateDictionary objectForKey:v4];
    id v6 = BUDynamicCast();

    objc_opt_class();
    uint64_t v7 = BUDynamicCast();
    if (!v7)
    {
      if (v6) {
        id v8 = [v6 mutableCopy];
      }
      else {
        id v8 = (id)objc_opt_new();
      }
      uint64_t v7 = v8;
      updateDictionary = self->_updateDictionary;
      if (!updateDictionary)
      {
        id v10 = (NSMutableDictionary *)objc_opt_new();
        id v11 = self->_updateDictionary;
        self->_updateDictionary = v10;

        updateDictionary = self->_updateDictionary;
      }
      [(NSMutableDictionary *)updateDictionary setObject:v7 forKey:v4];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_isSignedInForAssetID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[BKLibraryManager defaultManager];
  id v6 = [v5 libraryAssetOnMainQueueWithAssetID:v4];

  if (v6)
  {
    uint64_t v7 = [v6 storeID];
    if (v7)
    {
      id v8 = [(BKLibraryAssetStatusController *)self storeDelegate];
      id v9 = [v6 accountID];
      unsigned __int8 v10 = [v8 libraryAssetStatusController:self isAccountPrimaryAndSignedIn:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)_hasActiveDownloadForAssetID:(id)a3
{
  v3 = [(BKLibraryAssetStatusController *)self statusForAssetID:a3];
  BOOL v4 = (char *)[v3 state] - 2 < (unsigned char *)&dword_4 + 3;

  return v4;
}

- (BOOL)_passesExplicitContentFilter:(id)a3
{
  if (self->_explicitContentRestricted)
  {
    v3 = [a3 isExplicit];
    BOOL v4 = v3;
    if (v3) {
      unsigned int v5 = [v3 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_includedInUpdatesForAssetID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_statusDictionary objectForKey:v4];
    if ([v5 state] == (char *)&dword_0 + 1)
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      uint64_t v7 = [(BKAssetArrayController *)self->_updateAssets arrangedObjects];
      unsigned __int8 v6 = [v7 containsObject:v4];
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)_includeInDownloadsForAssetID:(id)a3
{
  id v4 = a3;
  if (v4 && ![(BKLibraryAssetStatusController *)self _includedInUpdatesForAssetID:v4]) {
    BOOL v5 = [(BKLibraryAssetStatusController *)self _hasActiveDownloadForAssetID:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_includeInUploadsForAssetID:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = -[NSMutableDictionary objectForKey:](self->_statusDictionary, "objectForKey:");
  BOOL v4 = (char *)[v3 state] - 9 < (unsigned char *)&dword_0 + 3;

  return v4;
}

- (BOOL)_filterUpdateForAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 assetID];
  if ([(BKLibraryAssetStatusController *)self _includedInUpdatesForAssetID:v5]
    && ([(BKLibraryAssetStatusController *)self _isSignedInForAssetID:v5]
     || [(BKLibraryAssetStatusController *)self _hasActiveDownloadForAssetID:v5]))
  {
    BOOL v6 = [(BKLibraryAssetStatusController *)self _passesExplicitContentFilter:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_filterDownloadForAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 assetID];
  if ([(BKLibraryAssetStatusController *)self _includeInDownloadsForAssetID:v5]) {
    BOOL v6 = [(BKLibraryAssetStatusController *)self _passesExplicitContentFilter:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_filterUploadsForAsset:(id)a3
{
  id v4 = [a3 assetID];
  LOBYTE(self) = [(BKLibraryAssetStatusController *)self _includeInUploadsForAssetID:v4];

  return (char)self;
}

- (unint64_t)updateAssetsCount
{
  v2 = [(BKAssetArrayController *)self->_updateAssets arrangedObjects];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)downloadAssetsCount
{
  v2 = [(BKAssetArrayController *)self->_downloadAssets arrangedObjects];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)uploadAssetsCount
{
  v2 = [(BKAssetArrayController *)self->_uploadAssets arrangedObjects];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)setupStateObservation
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_downloadStatusNotification:" name:@"BKLibraryDownloadStatusNotification" object:0];
  [v4 addObserver:self selector:"_libraryUpdateNotification:" name:@"BKLibraryUpdateNotification" object:0];
  id v3 = +[BKLibraryManager defaultManager];
  [v4 addObserver:self selector:"_libraryOwnershipNotification:" name:@"BKLibraryOwnershipDidChangeNotification" object:v3];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[BURestrictionsProvider sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryAssetStatusController;
  [(BKLibraryAssetStatusController *)&v5 dealloc];
}

- (void)_updateTotalPercentCompleteForAssetIDs:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  statusDictionary = self->_statusDictionary;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_42BA4;
  v9[3] = &unk_D28A0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v13;
  uint64_t v12 = &v17;
  [(NSMutableDictionary *)statusDictionary enumerateKeysAndObjectsUsingBlock:v9];
  unint64_t v7 = v14[3];
  if (v7) {
    double v8 = v18[3] / (float)v7;
  }
  else {
    double v8 = 1.0;
  }
  [(BKLibraryAssetStatusController *)self setDownloadAssetsTotalPercentComplete:v8];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

- (void)_updateSeriesContainerDownloadStatusForAssetIDs:(id)a3
{
  statusDictionary = self->_statusDictionary;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)statusDictionary copy];
  unint64_t v7 = [v6 allKeys];
  double v8 = +[NSMutableSet setWithArray:v7];

  [v8 intersectSet:v5];
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = +[NSMutableDictionary dictionary];
  id v11 = +[NSMutableSet set];
  uint64_t v12 = +[BKLibraryManager defaultManager];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_42E48;
  v20[3] = &unk_D28F0;
  id v13 = v8;
  id v21 = v13;
  id v14 = v6;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  id v18 = v9;
  id v26 = v18;
  v27 = self;
  uint64_t v19 = objc_retainBlock(v20);
  if (+[NSThread isMainThread]) {
    [v15 performNamed:@"updateSeriesContainerDownloadStatus" workerQueueBlock:v19];
  }
  else {
    [v15 performNamed:@"updateSeriesContainerDownloadStatus" workerQueueBlockAndWait:v19];
  }
}

- (void)_updateCountsForAssetIDs:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  statusDictionary = self->_statusDictionary;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4369C;
  v7[3] = &unk_D28A0;
  id v6 = v4;
  id v8 = v6;
  id v9 = &v15;
  id v10 = &v11;
  [(NSMutableDictionary *)statusDictionary enumerateKeysAndObjectsUsingBlock:v7];
  if (self->_canResumeCount != v12[3]) {
    -[BKLibraryAssetStatusController setCanResumeCount:](self, "setCanResumeCount:");
  }
  if (self->_canPauseCount != v16[3]) {
    -[BKLibraryAssetStatusController setCanPauseCount:](self, "setCanPauseCount:");
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

- (void)_updateAcknowledgeCountsWithAssetIDs:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  statusDictionary = self->_statusDictionary;
  unint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_4387C;
  id v10 = &unk_D2918;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = self;
  uint64_t v13 = &v19;
  uint64_t v14 = &v15;
  [(NSMutableDictionary *)statusDictionary enumerateKeysAndObjectsUsingBlock:&v7];
  if (self->_unacknowledgedDownloadsCount != v20[3]) {
    -[BKLibraryAssetStatusController setUnacknowledgedDownloadsCount:](self, "setUnacknowledgedDownloadsCount:", v7, v8, v9, v10);
  }
  if (self->_unacknowledgedUpdatesCount != v16[3]) {
    -[BKLibraryAssetStatusController setUnacknowledgedUpdatesCount:](self, "setUnacknowledgedUpdatesCount:");
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)_updateUploadStatusForAssetIDs:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_43ABC;
  v6[3] = &unk_D2940;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v15;
  v6[7] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];
  if (v12[3])
  {
    uint64_t v5 = 1;
  }
  else if (v16[3])
  {
    uint64_t v5 = 2;
  }
  else if (v8[3])
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (v5 != self->_uploadStatus) {
    -[BKLibraryAssetStatusController setUploadStatus:](self, "setUploadStatus:");
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

- (void)_trimUpdateDictionary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_43C64;
  uint64_t v9 = sub_43C74;
  id v10 = 0;
  updateDictionary = self->_updateDictionary;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_43C7C;
  v4[3] = &unk_D2968;
  v4[4] = &v5;
  [(NSMutableDictionary *)updateDictionary enumerateKeysAndObjectsUsingBlock:v4];
  if (v6[5]) {
    -[NSMutableDictionary removeObjectsForKeys:](self->_updateDictionary, "removeObjectsForKeys:");
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_updateAssetsWithBlock:(id)a3
{
  uint64_t v22 = (void (**)(void))a3;
  id v4 = [(BKAssetArrayController *)self->_updateAssets arrangedObjects];
  unint64_t v5 = (unint64_t)[v4 count];

  id v6 = [(BKAssetArrayController *)self->_downloadAssets arrangedObjects];
  unint64_t v7 = (unint64_t)[v6 count];

  uint64_t v8 = [(BKAssetArrayController *)self->_uploadAssets arrangedObjects];
  unint64_t v9 = (unint64_t)[v8 count];

  BOOL v21 = (v5 | v7 | v9) != 0;
  if (v22) {
    v22[2](v22);
  }
  BOOL v10 = v5 != 0;
  uint64_t v11 = [(BKAssetArrayController *)self->_updateAssets arrangedObjects];
  unint64_t v12 = (unint64_t)[v11 count];

  uint64_t v13 = [(BKAssetArrayController *)self->_downloadAssets arrangedObjects];
  unint64_t v14 = (unint64_t)[v13 count];

  uint64_t v15 = [(BKAssetArrayController *)self->_uploadAssets arrangedObjects];
  unint64_t v16 = (unint64_t)[v15 count];

  if (v10 != (v12 != 0)) {
    [(BKLibraryAssetStatusController *)self setHasUpdates:v12 != 0];
  }
  if ((v7 != 0) != (v14 != 0)) {
    [(BKLibraryAssetStatusController *)self setHasDownloads:v14 != 0];
  }
  if ((v9 != 0) != (v16 != 0)) {
    [(BKLibraryAssetStatusController *)self setHasUploads:v16 != 0];
  }
  if (v21 != ((v12 | v14 | v16) != 0)) {
    [(BKLibraryAssetStatusController *)self setHasUpdatesOrDownloadsOrUploads:(v12 | v14 | v16) != 0];
  }
  id v17 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v18 = [(BKAssetArrayController *)self->_updateAssets arrangedObjects];
  [v17 addObjectsFromArray:v18];

  uint64_t v19 = [(BKAssetArrayController *)self->_downloadAssets arrangedObjects];
  [v17 addObjectsFromArray:v19];

  uint64_t v20 = [(BKAssetArrayController *)self->_uploadAssets arrangedObjects];
  [(BKLibraryAssetStatusController *)self _updateUploadStatusForAssetIDs:v20];

  [(BKLibraryAssetStatusController *)self _updateTotalPercentCompleteForAssetIDs:v17];
  [(BKLibraryAssetStatusController *)self _updateCountsForAssetIDs:v17];
  [(BKLibraryAssetStatusController *)self _updateSeriesContainerDownloadStatusForAssetIDs:v17];
  [(BKLibraryAssetStatusController *)self _updateAcknowledgeCountsWithAssetIDs:v17];
  [(BKLibraryAssetStatusController *)self _trimUpdateDictionary];
  [(BKLibraryAssetStatusController *)self _writePersistentInfoIfNeeded];
}

- (BUCoalescingCallBlock)downloadRelatedNotificationCoalescingBlock
{
  downloadRelatedNotificationCoalescingBlock = self->_downloadRelatedNotificationCoalescingBlock;
  if (!downloadRelatedNotificationCoalescingBlock)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_44070;
    v7[3] = &unk_D2990;
    void v7[4] = self;
    id v4 = (BUCoalescingCallBlock *)[objc_alloc((Class)BUCoalescingCallBlock) initWithNotifyBlock:v7 blockDescription:@"BKLibraryAssetStatusController"];
    unint64_t v5 = self->_downloadRelatedNotificationCoalescingBlock;
    self->_downloadRelatedNotificationCoalescingBlock = v4;

    [(BUCoalescingCallBlock *)self->_downloadRelatedNotificationCoalescingBlock setCoalescingDelay:0.1];
    [(BUCoalescingCallBlock *)self->_downloadRelatedNotificationCoalescingBlock setMaximumDelay:0.5];
    downloadRelatedNotificationCoalescingBlock = self->_downloadRelatedNotificationCoalescingBlock;
  }

  return downloadRelatedNotificationCoalescingBlock;
}

- (void)_downloadStatusNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"BKLibraryDownloadStatusKey"];
  unint64_t v7 = BUDynamicCast();

  if ([v7 count])
  {
    downloadStatusesQueue = self->_downloadStatusesQueue;
    BOOL v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    unint64_t v12 = sub_441AC;
    uint64_t v13 = &unk_D1418;
    unint64_t v14 = self;
    id v15 = v4;
    dispatch_sync(downloadStatusesQueue, &v10);
    unint64_t v9 = [(BKLibraryAssetStatusController *)self downloadRelatedNotificationCoalescingBlock];
    [v9 signalWithCompletion:&stru_D29B0];
  }
}

- (void)_processDownloadRelatedNotificationsCompletion:(id)a3
{
  id v4 = a3;
  downloadStatusesQueue = self->_downloadStatusesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_44254;
  v7[3] = &unk_D1548;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(downloadStatusesQueue, v7);
}

- (void)_processDownloadStatuses:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_44878;
    block[3] = &unk_D22F0;
    void block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_libraryUpdateNotification:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_44BC0;
  v4[3] = &unk_D1418;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_removeTrackingOfAssetID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_44F88;
    v6[3] = &unk_D1418;
    v6[4] = self;
    id v7 = v4;
    [(BKLibraryAssetStatusController *)self _updateAssetsWithBlock:v6];
  }
}

- (void)_libraryOwnershipNotification:(id)a3
{
  id v4 = a3;
  downloadStatusesQueue = self->_downloadStatusesQueue;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_450B4;
  uint64_t v11 = &unk_D1418;
  unint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(downloadStatusesQueue, &v8);
  id v7 = [(BKLibraryAssetStatusController *)self downloadRelatedNotificationCoalescingBlock];
  [v7 signalWithCompletion:&stru_D29D0];
}

- (void)_processLibraryOwnershipNotification:(id)a3 completion:(id)a4
{
  id v21 = a4;
  id v5 = [a3 userInfo];
  id v6 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v22 = v5;
  id obj = [v5 objectForKeyedSubscript:@"BKLibraryOwnershipAssetsKey"];
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"BKLibraryOwnershipNewState"];
        int v12 = (unsigned __int16)[v11 integerValue];

        id v13 = [v10 objectForKeyedSubscript:@"BKLibraryOwnershipOldState"];
        unsigned __int16 v14 = (unsigned __int16)[v13 integerValue];

        uint64_t v15 = [v10 objectForKeyedSubscript:@"BKLibraryOwnershipAssetIDKey"];
        unint64_t v16 = (void *)v15;
        if (v15) {
          BOOL v17 = v12 == 3;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          dispatch_group_enter(v6);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_454B0;
          block[3] = &unk_D29F8;
          void block[4] = self;
          id v32 = v16;
          unsigned __int16 v34 = v14;
          id v33 = v6;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        else if (v12 == 2)
        {
          if (!v15) {
            goto LABEL_17;
          }
          dispatch_group_enter(v6);
          uint64_t v18 = (id *)v30;
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_45598;
          v30[3] = &unk_D1A38;
          v30[4] = self;
          v30[5] = v16;
          goto LABEL_16;
        }
        if (v14 != 2) {
          goto LABEL_17;
        }
        dispatch_group_enter(v6);
        uint64_t v18 = (id *)v28;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_456D0;
        v28[3] = &unk_D29F8;
        v28[4] = self;
        v28[5] = v16;
        __int16 v29 = v12;
LABEL_16:
        v18[6] = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

LABEL_17:
      }
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  downloadStatusesQueue = self->_downloadStatusesQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_459A4;
  v26[3] = &unk_D2878;
  id v27 = v21;
  id v20 = v21;
  dispatch_group_notify(v6, downloadStatusesQueue, v26);
}

- (void)_showUpdateFailureForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_45A8C;
    v6[3] = &unk_D1418;
    v6[4] = self;
    id v7 = v4;
    [(BKLibraryAssetStatusController *)self _updateAssetsWithBlock:v6];
  }
}

- (void)makeAccountPrimaryAndCheckForUpdateAndUpdateAssetUnacknowledged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetID];
  id v6 = [v4 accountID];

  if (v5 && v6)
  {
    id v7 = [(BKLibraryAssetStatusController *)self storeDelegate];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_45C08;
    v8[3] = &unk_D2A98;
    v8[4] = self;
    id v9 = v5;
    [v7 libraryAssetStatusController:self makeAccountPrimaryAndSignedIn:v6 completion:v8];
  }
}

- (void)_startUpdateForAssetIDs:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_46404;
  v5[3] = &unk_D1418;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  _os_activity_initiate(&dword_0, "Start update for assets", OS_ACTIVITY_FLAG_DEFAULT, v5);
}

- (void)pauseDownloadOfAsset:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4689C;
  v4[3] = &unk_D1418;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_0, "Pause download for asset", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (void)resumeDownloadOfAsset:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_46A38;
  v4[3] = &unk_D1418;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_0, "Resume download for asset", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (void)cancelDownloadOfAsset:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_downloadControllers;
  id v6 = [(BKBookDownloadController *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) cancelDownloadForAssetID:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(BKBookDownloadController *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)restartDownloadOfAsset:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_downloadControllers;
  id v6 = [(BKBookDownloadController *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) restartDownloadForAssetID:v4 v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(BKBookDownloadController *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeCompletedDownloads
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_46D9C;
  v2[3] = &unk_D1520;
  v2[4] = self;
  [(BKLibraryAssetStatusController *)self _updateAssetsWithBlock:v2];
}

- (void)removeCompletedUploads
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_46FA8;
  v2[3] = &unk_D1520;
  v2[4] = self;
  [(BKLibraryAssetStatusController *)self _updateAssetsWithBlock:v2];
}

- (void)checkForUpdates:(id)a3
{
  id v4 = a3;
  [(BKLibraryAssetStatusController *)self setCheckingForUpdates:1];
  updateController = self->_updateController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_471C8;
  v7[3] = &unk_D2AE8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKBookUpdateController *)updateController checkForUpdates:v7];
}

- (id)statusForAssetID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_statusDictionary objectForKey:v4];
    if (!v5)
    {
      id v5 = [[BKLibraryDownloadStatus alloc] initWithAssetID:v4 state:0 progressValue:-1 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:0.0];
      [(NSMutableDictionary *)self->_statusDictionary setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)ephemeralStatusForAssetID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_statusDictionary, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)acknowledgeCurrentUpdatesAndDownloads
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_47444;
  v2[3] = &unk_D1520;
  v2[4] = self;
  [(BKLibraryAssetStatusController *)self _updateAssetsWithBlock:v2];
}

- (void)primaryAccountChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_47660;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 fetchNotify:(id)a4
{
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
}

- (void)_processLibraryAssetChanges:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 addedObjects];
    id v7 = [v6 count];
    id v8 = [v4 deletedObjects];
    id v9 = [v8 count];
    long long v10 = [v4 updatedObjects];
    *(_DWORD *)buf = 134218496;
    id v17 = v7;
    __int16 v18 = 2048;
    id v19 = v9;
    __int16 v20 = 2048;
    id v21 = [v10 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BKLibraryAssetStatusController _processLibraryAssetChanges: added: %ld deleted: %ld updated: %ld", buf, 0x20u);
  }
  long long v11 = +[BKLibraryManager defaultManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_47894;
  v13[3] = &unk_D18D8;
  id v14 = v4;
  uint64_t v15 = self;
  id v12 = v4;
  [v11 performBackgroundReadOnlyBlock:v13];
}

- (id)_addArrayControllerWithFilter:(id)a3
{
  id v4 = a3;
  id v5 = [[BKAssetArrayController alloc] initWithContent:self->_assetsArray];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  long long v10 = sub_47B90;
  long long v11 = &unk_D2B10;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  [(BKAssetArrayController *)v5 setFilter:&v8];
  -[NSMutableArray addObject:](self->_additionalArrayControllers, "addObject:", v5, v8, v9, v10, v11, v12);

  return v5;
}

- (void)_removeArrayController:(id)a3
{
}

- (id)addStatusObserverWithFilter:(id)a3 notify:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BKLibraryAssetStatusObserver alloc] initWithFilter:v6 notify:v5];

  return v7;
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_downloadControllers;
  id v6 = [(BKBookDownloadController *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    BOOL v9 = !v3;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setExplicitContentRestricted:v9];
        long long v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(BKBookDownloadController *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_47DDC;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (IMArrayController)downloadAssets
{
  return (IMArrayController *)objc_getProperty(self, a2, 8, 1);
}

- (IMArrayController)updateAssets
{
  return (IMArrayController *)objc_getProperty(self, a2, 16, 1);
}

- (BKLibraryAssetStatusControllerStoreDelegate)storeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storeDelegate);

  return (BKLibraryAssetStatusControllerStoreDelegate *)WeakRetained;
}

- (void)setStoreDelegate:(id)a3
{
}

- (BOOL)explicitContentRestricted
{
  return self->_explicitContentRestricted;
}

- (void)setExplicitContentRestricted:(BOOL)a3
{
  self->_explicitContentRestricted = a3;
}

- (double)downloadAssetsTotalPercentComplete
{
  return self->_downloadAssetsTotalPercentComplete;
}

- (void)setDownloadAssetsTotalPercentComplete:(double)a3
{
  self->_downloadAssetsTotalPercentComplete = a3;
}

- (IMArrayController)uploadAssets
{
  return (IMArrayController *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)unacknowledgedDownloadsCount
{
  return self->_unacknowledgedDownloadsCount;
}

- (void)setUnacknowledgedDownloadsCount:(unint64_t)a3
{
  self->_unacknowledgedDownloadsCount = a3;
}

- (unint64_t)unacknowledgedUpdatesCount
{
  return self->_unacknowledgedUpdatesCount;
}

- (void)setUnacknowledgedUpdatesCount:(unint64_t)a3
{
  self->_unacknowledgedUpdatesCount = a3;
}

- (BOOL)hasUpdatesOrDownloadsOrUploads
{
  return self->_hasUpdatesOrDownloadsOrUploads;
}

- (void)setHasUpdatesOrDownloadsOrUploads:(BOOL)a3
{
  self->_hasUpdatesOrDownloadsOrUploads = a3;
}

- (BOOL)hasUpdates
{
  return self->_hasUpdates;
}

- (void)setHasUpdates:(BOOL)a3
{
  self->_hasUpdates = a3;
}

- (BOOL)hasDownloads
{
  return self->_hasDownloads;
}

- (void)setHasDownloads:(BOOL)a3
{
  self->_hasDownloads = a3;
}

- (BOOL)hasUploads
{
  return self->_hasUploads;
}

- (void)setHasUploads:(BOOL)a3
{
  self->_hasUploads = a3;
}

- (unint64_t)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(unint64_t)a3
{
  self->_uploadStatus = a3;
}

- (BOOL)checkingForUpdates
{
  return self->_checkingForUpdates;
}

- (void)setCheckingForUpdates:(BOOL)a3
{
  self->_checkingForUpdates = a3;
}

- (unint64_t)canPauseCount
{
  return self->_canPauseCount;
}

- (void)setCanPauseCount:(unint64_t)a3
{
  self->_canPauseCount = a3;
}

- (unint64_t)canResumeCount
{
  return self->_canResumeCount;
}

- (void)setCanResumeCount:(unint64_t)a3
{
  self->_canResumeCount = a3;
}

- (void)setDownloadRelatedNotificationCoalescingBlock:(id)a3
{
}

- (NSMutableArray)downloadRelatedNotificationsToProcess
{
  return self->_downloadRelatedNotificationsToProcess;
}

- (void)setDownloadRelatedNotificationsToProcess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRelatedNotificationsToProcess, 0);
  objc_storeStrong((id *)&self->_downloadRelatedNotificationCoalescingBlock, 0);
  objc_destroyWeak((id *)&self->_storeDelegate);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_downloadStatusesQueue, 0);
  objc_storeStrong((id *)&self->_persistentInfo, 0);
  objc_storeStrong((id *)&self->_additionalArrayControllers, 0);
  objc_storeStrong((id *)&self->_acknowledgedUpdates, 0);
  objc_storeStrong((id *)&self->_acknowledgedDownloads, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitorAllBooks, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitorStoreBooks, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_downloadControllers, 0);
  objc_storeStrong((id *)&self->_updateDictionary, 0);
  objc_storeStrong((id *)&self->_statusDictionary, 0);
  objc_storeStrong((id *)&self->_assetsArray, 0);
  objc_storeStrong((id *)&self->_uploadAssets, 0);
  objc_storeStrong((id *)&self->_updateAssets, 0);

  objc_storeStrong((id *)&self->_downloadAssets, 0);
}

@end