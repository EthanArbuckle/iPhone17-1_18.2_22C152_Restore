@interface PDCardFileManager
- (BOOL)_dc_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4;
- (BOOL)_dc_writeCard:(id)a3 writtenCard:(id *)a4 diff:(id *)a5 daemonData:(id *)a6 undecryptableAssets:(id *)a7 error:(id *)a8;
- (BOOL)writeCard:(id)a3 source:(int64_t)a4 error:(id *)a5;
- (PDCardFileManager)init;
- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4;
- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 maximumDownloadRetries:(unint64_t)a5 atURL:(id)a6;
- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate;
- (PKSecureElement)secureElement;
- (id)_cacheURLForUniqueID:(id)a3;
- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6;
- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 cardDirectoryCoordinator:(id)a7;
- (id)_cardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 error:(id *)a5;
- (id)_contentForCardWithUniqueID:(id)a3;
- (id)_dataAccessorForCardDirectoryCoordinator:(id)a3 error:(id *)a4;
- (id)_dc_cardDirectoryCoordinatorForUniqueID:(id)a3;
- (id)_dc_cardWithUniqueID:(id)a3 error:(id *)a4;
- (id)_imageSetContainerForUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 ofType:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7;
- (id)_imageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6;
- (id)_objectURLForUniqueID:(id)a3;
- (id)_ubiquityManager;
- (id)catalogOfRecord;
- (id)dataAccessorForObjectWithUniqueID:(id)a3;
- (id)localNonUbiquitousCatalogURL;
- (id)objectWithUniqueID:(id)a3;
- (id)passDaemonDataForUniqueID:(id)a3;
- (id)passTilesForUniqueID:(id)a3 withDescriptorStatePairs:(id)a4;
- (id)passUniqueIDs;
- (id)passes;
- (id)passesOfType:(unint64_t)a3;
- (void)_checkRevocationStatusForPass:(id)a3 withCompletion:(id)a4;
- (void)_createImageSetsForCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 displayProfile:(id)a5;
- (void)_dc_invalidateCardDirectoryCoordinatorForUniqueID:(id)a3;
- (void)_dc_performCacheMaintenanceActivity;
- (void)_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 forReason:(unint64_t)a5 withDiagnosticReason:(id)a6;
- (void)_deletePossibleInvalidCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4;
- (void)_downloadRemoteAssetsForCardWithUniqueID:(id)a3 completion:(id)a4;
- (void)_evaluateDownloadMissingAssetsActivityWithForcedReschedule:(BOOL)a3;
- (void)_performMissingAssetDownloadActivity;
- (void)_performRevocationCheckActivity;
- (void)_recursivelyCheckRevocationStatusForPassUniqueIdentifiers:(id)a3 osTransaction:(id)a4;
- (void)decryptPassAssets:(id)a3 undecryptableAssets:(id *)a4;
- (void)deleteAllWithDiagnosticReason:(id)a3;
- (void)deleteCardWithUniqueID:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5;
- (void)fetchCachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 completion:(id)a7;
- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4;
- (void)fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6 completion:(id)a7;
- (void)performImageMigrationWithStartTime:(double)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)registerDatabaseObject:(id)a3;
- (void)restartUbiquity;
- (void)scheduleImmediateRevocationCheck;
- (void)setCloudStoreCoordinatorDelegate:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)startObservingUbiquityEvents;
- (void)startUbiquity;
- (void)ubiquitousCardDidChange:(id)a3;
- (void)ubiquitousCardWithUniqueIDRemoved:(id)a3;
- (void)ubiquitousCatalogDidChange:(id)a3;
- (void)writeCatalogOfRecord:(id)a3 source:(int64_t)a4;
@end

@implementation PDCardFileManager

- (id)_cacheURLForUniqueID:(id)a3
{
  if (a3)
  {
    cardsURL = self->_cardsURL;
    v4 = [a3 stringByAppendingPathExtension:@"cache"];
    v5 = [(NSURL *)cardsURL URLByAppendingPathComponent:v4 isDirectory:1];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_dc_cardDirectoryCoordinatorForUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMapTable *)self->_cardDirectoryCoordinators objectForKey:v4];
    if (!v5)
    {
LABEL_5:
      v7 = [(PDCardFileManager *)self _objectURLForUniqueID:v4];
      v8 = +[NSFileManager defaultManager];
      v9 = [v7 path];
      unsigned int v10 = [v8 fileExistsAtPath:v9];

      if (v10)
      {
        id v6 = [objc_alloc((Class)PKDirectoryCoordinator) initWithURL:v7];
        [(NSMapTable *)self->_cardDirectoryCoordinators setObject:v6 forKey:v4];
      }
      else
      {
        id v6 = 0;
      }

      goto LABEL_10;
    }
    id v6 = v5;
    if ([v5 isInvalidated])
    {
      [(NSMapTable *)self->_cardDirectoryCoordinators removeObjectForKey:v4];

      goto LABEL_5;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_10:

  return v6;
}

- (id)_objectURLForUniqueID:(id)a3
{
  if (a3)
  {
    cardsURL = self->_cardsURL;
    id v4 = [a3 stringByAppendingPathExtension:PKRawPassExtension];
    v5 = [(NSURL *)cardsURL URLByAppendingPathComponent:v4 isDirectory:1];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)registerDatabaseObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueID];
  id v6 = v5;
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_1000208DC;
    v17 = sub_100020F60;
    id v18 = 0;
    directoryCoordinator = self->_directoryCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100011028;
    v10[3] = &unk_100739310;
    v12 = &v13;
    v10[4] = self;
    id v11 = v5;
    [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v10];
    uint64_t v8 = v14[5];
    if (v8)
    {
      v9 = [(PDCardFileManager *)self _dataAccessorForCardDirectoryCoordinator:v8 error:0];
    }
    else
    {
      v9 = 0;
    }
    [v4 setDataAccessor:v9];

    _Block_object_dispose(&v13, 8);
  }
}

- (id)_dataAccessorForCardDirectoryCoordinator:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_1000208DC;
    v23 = sub_100020F60;
    id v24 = 0;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_1000208DC;
    v17 = sub_100020F60;
    id v18 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000107BC;
    v9[3] = &unk_100739400;
    id v11 = &v19;
    v12 = &v13;
    id v10 = v5;
    [v10 performCoordinatedAction:v9];
    if (a4) {
      *a4 = (id) v14[5];
    }
    id v7 = (id)v20[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_imageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000208DC;
  id v24 = sub_100020F60;
  id v25 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100010FD8;
  v17[3] = &unk_100739310;
  uint64_t v19 = &v20;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v17];
  uint64_t v15 = [(PDCardFileManager *)self _imageSetContainerForUniqueID:v14 cardDirectoryCoordinator:v21[5] ofType:a4 withDisplayProfile:v11 suffix:v12];

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)_imageSetContainerForUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 ofType:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1000208DC;
  v33 = sub_100020F60;
  id v34 = 0;
  v17 = [(PDCardFileManager *)self _cacheURLForUniqueID:v12];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100010498;
  v23[3] = &unk_100739540;
  v27 = &v29;
  int64_t v28 = a5;
  id v18 = v14;
  id v24 = v18;
  id v19 = v15;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  [v13 performCoordinatedAction:v23];

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_contentForCardWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1000208DC;
  v30 = sub_100020F60;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000208DC;
  id v24 = sub_100020F60;
  id v25 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000FA64;
  v17[3] = &unk_100739310;
  id v19 = &v20;
  v17[4] = self;
  id v7 = v4;
  id v18 = v7;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v17];
  uint64_t v8 = (void *)v21[5];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100020674;
  v16[3] = &unk_1007393B0;
  v16[4] = &v26;
  [v8 performCoordinatedAction:v16];
  if (!v27[5] && v21[5])
  {
    v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100131A94;
    block[3] = &unk_100739568;
    id v13 = v7;
    id v14 = self;
    id v15 = &v20;
    dispatch_async(v9, block);
  }
  _Block_object_dispose(&v20, 8);

  id v10 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (void)startUbiquity
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012CFB4;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  if (qword_100808C10 != -1) {
    dispatch_once(&qword_100808C10, block);
  }
}

- (PDCardFileManager)init
{
  return 0;
}

- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4
{
  uint64_t v6 = qword_100808C20;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_100808C20, &stru_100739628);
  }
  v9 = [(PDCardFileManager *)self initWithDelegate:v8 cloudStoreCoordinatorDelegate:v7 maximumDownloadRetries:3 atURL:qword_100808C18];

  return v9;
}

- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 maximumDownloadRetries:(unint64_t)a5 atURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)PDCardFileManager;
  id v13 = [(PDCardFileManager *)&v34 init];
  if (v13)
  {
    id v14 = (NSURL *)[v12 copy];
    cardsURL = v13->_cardsURL;
    v13->_cardsURL = v14;

    v16 = +[NSFileManager defaultManager];
    [v16 createDirectoryAtURL:v13->_cardsURL withIntermediateDirectories:1 attributes:0 error:0];

    v17 = (PKDirectoryCoordinator *)[objc_alloc((Class)PKDirectoryCoordinator) initWithURL:v13->_cardsURL];
    directoryCoordinator = v13->_directoryCoordinator;
    v13->_directoryCoordinator = v17;

    uint64_t v19 = +[NSMapTable pk_copiedToWeakObjectsMapTable];
    cardDirectoryCoordinators = v13->_cardDirectoryCoordinators;
    v13->_cardDirectoryCoordinators = (NSMapTable *)v19;

    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_UNSPECIFIED, 0);

    v23 = PDHeavyUtilityQueue();
    dispatch_queue_t v24 = dispatch_queue_create_with_target_V2("com.apple.passd.PDCardFileManager.missingAsset", v22, v23);
    missingAssetQueue = v13->_missingAssetQueue;
    v13->_missingAssetQueue = (OS_dispatch_queue *)v24;

    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_cloudStoreCoordinatorDelegate, a4);
    v13->_maximumDownloadRetries = a5;
    uint64_t v26 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    v27 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    uint64_t v28 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
    [v28 setRepeating:1];
    [v28 setRequireNetworkConnectivity:1];
    [v28 setRepeatInterval:86400.0];
    PDScheduledActivityRegister();
    uint64_t v29 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
    [v29 setRepeating:1];
    [v29 setRequireScreenSleep:1];
    [v29 setRequireMainsPower:1];
    [v29 setRepeatInterval:1209600.0];
    PDScheduledActivityRegister();
    v30 = PDUtilityQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012CF70;
    block[3] = &unk_10072E1E8;
    v33 = v13;
    dispatch_async(v30, block);
  }
  return v13;
}

- (id)_ubiquityManager
{
  [(PDCardFileManager *)self startUbiquity];
  ubiquityManager = self->_ubiquityManager;
  return ubiquityManager;
}

- (void)restartUbiquity
{
  id v2 = [(PDCardFileManager *)self _ubiquityManager];
  [v2 restart];
}

- (void)startObservingUbiquityEvents
{
  if (PKPassbookIsSupported())
  {
    v3 = PDLastFSEventsURL();
    if (v3)
    {
      id v5 = v3;
      PDWatchFSEventsAtURL(v3);
      id v4 = PDDefaultQueue();
      PDXPCEventStreamRegisterObserver(self, @"com.apple.fsevents.matching", v4);

      v3 = v5;
    }
  }
}

- (void)performImageMigrationWithStartTime:(double)a3
{
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = sub_1000208DC;
  v62 = sub_100020F60;
  id v63 = 0;
  uint64_t v6 = [(PDCardFileManager *)self passUniqueIDs];
  double v7 = COERCE_DOUBLE([v6 count]);
  if (v7 != 0.0)
  {
    directoryCoordinator = self->_directoryCoordinator;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10012D6D4;
    v54[3] = &unk_100739310;
    v57 = &v58;
    v55 = v6;
    v56 = self;
    [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v54];
  }
  if (v7 != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v10 = fmax(fmin(50.0 - fmax(Current - a3, 0.0), 30.0), 0.0);
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: beginning image migration for %lu passes.", (uint8_t *)&buf, 0xCu);
    }

    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2810000000;
    v52[3] = &unk_10060E2DA;
    int v53 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v73 = 0x3032000000;
    v74 = sub_1000208DC;
    v75 = sub_100020F60;
    id v76 = 0;
    uint64_t v48 = 0;
    v49 = (double *)&v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    uint64_t v44 = 0;
    v45 = (double *)&v44;
    uint64_t v46 = 0x2020000000;
    double v47 = Current;
    uint64_t v12 = *(void *)&v7 >> 1;
    if (*(void *)&v7 <= 1uLL) {
      uint64_t v12 = 1;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012D7D0;
    block[3] = &unk_100739338;
    uint64_t v39 = v12;
    double v40 = v7;
    BOOL v43 = v10 < 2.0;
    uint64_t v6 = v6;
    v32 = v6;
    v33 = self;
    double v41 = Current;
    double v42 = v10;
    objc_super v34 = &v58;
    v35 = v52;
    v36 = &v44;
    p_long long buf = &buf;
    v38 = &v48;
    dispatch_apply(2uLL, 0, block);
    id v13 = *(void **)(*((void *)&buf + 1) + 40);
    if (v13 && (id v14 = [v13 count]) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = v49[3];
        CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
        double v17 = v45[3] - Current;
        *(_DWORD *)v64 = 134218752;
        double v65 = v15;
        __int16 v66 = 2048;
        double v67 = v7;
        __int16 v68 = 2048;
        double v69 = v16 - Current;
        __int16 v70 = 2048;
        double v71 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: finished image migration for %lu of %lu passes in %0.3fs (timed out in %0.3fs).", v64, 0x2Au);
      }

      uint64_t v19 = [v6 objectsAtIndexes:*(void *)(*((void *)&buf + 1) + 40)];

      uint64_t v20 = [(id)v59[5] objectsAtIndexes:*(void *)(*((void *)&buf + 1) + 40)];
      id v21 = (void *)v59[5];
      v59[5] = v20;

      uint64_t v22 = PDHeavyUtilityQueue();
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10012DC3C;
      v25[3] = &unk_100739360;
      id v29 = v14;
      uint64_t v6 = v19;
      v27 = self;
      uint64_t v28 = &v58;
      uint64_t v26 = v6;
      double v30 = Current;
      dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v25);
      dispatch_async(v22, v23);

      id v11 = v26;
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v24 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)v64 = 134218240;
      double v65 = v7;
      __int16 v66 = 2048;
      double v67 = v24 - Current;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: finished image migration for %lu passes in %0.3fs.", v64, 0x16u);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(v52, 8);
  }
  _Block_object_dispose(&v58, 8);
}

- (id)passUniqueIDs
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  directoryCoordinator = self->_directoryCoordinator;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012DF7C;
  v8[3] = &unk_100739388;
  v8[4] = self;
  id v6 = v3;
  id v9 = v6;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v8];

  return v6;
}

- (id)objectWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  CFAbsoluteTime v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1000208DC;
  v27 = sub_100020F60;
  id v28 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10012E47C;
  v20[3] = &unk_100739310;
  uint64_t v22 = &v23;
  v20[4] = self;
  id v7 = v4;
  id v21 = v7;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v20];
  uint64_t v8 = v24[5];
  id v19 = 0;
  id v9 = [(PDCardFileManager *)self _cardWithUniqueID:v7 cardDirectoryCoordinator:v8 error:&v19];
  id v10 = v19;
  if (!v9 && v24[5])
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Card file manager unable to instantiate object with unique ID %@", buf, 0xCu);
    }

    uint64_t v12 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10012E4CC;
    v14[3] = &unk_100733ED8;
    id v15 = v10;
    id v16 = v7;
    double v17 = self;
    id v18 = &v23;
    dispatch_async(v12, v14);
  }
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)dataAccessorForObjectWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000208DC;
  double v17 = sub_100020F60;
  id v18 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012E764;
  v10[3] = &unk_100739310;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v10];
  uint64_t v8 = [(PDCardFileManager *)self _dataAccessorForCardDirectoryCoordinator:v14[5] error:0];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)passes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PDCardFileManager *)self passUniqueIDs];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PDCardFileManager *)self objectWithUniqueID:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];
  return v10;
}

- (id)passesOfType:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(PDCardFileManager *)self passUniqueIDs];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(PDCardFileManager *)self objectWithUniqueID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        long long v12 = v11;
        if (v11 && [v11 passType] == (id)a3) {
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];
  return v13;
}

- (id)catalogOfRecord
{
  id v3 = sub_10012EAF0();
  id v4 = -[PDCardFileManager localNonUbiquitousCatalogURL]_0();
  id v5 = +[PKCatalog catalogWithContentsOfURL:v3 nonUbiquitousCatalogURL:v4 directoryCoordinator:self->_directoryCoordinator];

  return v5;
}

- (id)localNonUbiquitousCatalogURL
{
  if (qword_100808C40 != -1) {
    dispatch_once(&qword_100808C40, &stru_100739668);
  }
  v0 = (void *)qword_100808C38;
  return v0;
}

- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDHeavyQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012EC6C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (id)passDaemonDataForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CFAbsoluteTime v24 = sub_1000208DC;
  uint64_t v25 = sub_100020F60;
  id v26 = 0;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_1000208DC;
  id v19 = sub_100020F60;
  id v20 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012EEFC;
  v12[3] = &unk_100739310;
  long long v14 = &v15;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v12];
  id v8 = (void *)v16[5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012EF4C;
  v11[3] = &unk_1007393B0;
  v11[4] = &v21;
  [v8 performCoordinatedAction:v11];

  _Block_object_dispose(&v15, 8);
  id v9 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)passTilesForUniqueID:(id)a3 withDescriptorStatePairs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1000208DC;
  id v31 = sub_100020F60;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CFAbsoluteTime v24 = sub_1000208DC;
  uint64_t v25 = sub_100020F60;
  id v26 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10012F21C;
  v18[3] = &unk_100739310;
  id v20 = &v21;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v18];
  id v11 = (void *)v22[5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10012F26C;
  v15[3] = &unk_1007393D8;
  id v12 = v7;
  id v16 = v12;
  uint64_t v17 = &v27;
  [v11 performCoordinatedAction:v15];

  _Block_object_dispose(&v21, 8);
  if ([(id)v28[5] count]) {
    id v13 = [(id)v28[5] copy];
  }
  else {
    id v13 = 0;
  }
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)_deletePossibleInvalidCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10012F7CC;
  uint64_t v17 = &unk_100739428;
  id v9 = v7;
  id v18 = v9;
  id v20 = &v22;
  uint64_t v21 = &v26;
  id v10 = v6;
  id v19 = v10;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:&v14];
  if (*((unsigned char *)v23 + 24))
  {
    int v11 = *((unsigned __int8 *)v27 + 24);
    id v12 = PKLogFacilityTypeGetObject();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CardFileManager is removing invalid pass with uniqueID %@", buf, 0xCu);
      }

      [(PDCardFileManager *)self _deleteCardWithUniqueID:v10, v9, 0, @"Card File Manager - Invalid Pass", v14, v15, v16, v17, v18 cardDirectoryCoordinator forReason withDiagnosticReason];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100515184((uint64_t)v10, v13);
      }
    }
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)fetchCachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = PDDefaultQueue();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10012FB78;
    v17[3] = &unk_100739450;
    id v21 = v15;
    v17[4] = self;
    id v18 = v12;
    int64_t v22 = a4;
    id v19 = v13;
    id v20 = v14;
    dispatch_async(v16, v17);
  }
}

- (void)fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = PDHeavyQueue();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10012FD38;
    v17[3] = &unk_100739450;
    id v21 = v15;
    v17[4] = self;
    id v18 = v12;
    int64_t v22 = a4;
    id v19 = v13;
    id v20 = v14;
    dispatch_async(v16, v17);
  }
}

- (BOOL)writeCard:(id)a3 source:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 uniqueID];
  id obj = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v11 = [WeakRetained shouldWritePass:v8 source:a4 error:&obj];

  if (v11)
  {

    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 uniqueID];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: writing card %{public}@", buf, 0xCu);
    }
    uint64_t v67 = 0;
    __int16 v68 = &v67;
    uint64_t v69 = 0x2020000000;
    char v70 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v74 = sub_1000208DC;
    v75 = sub_100020F60;
    id v76 = 0;
    int64_t v32 = a4;
    id obj = 0;
    p_id obj = &obj;
    uint64_t v63 = 0x3032000000;
    v64 = sub_1000208DC;
    double v65 = sub_100020F60;
    id v66 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    uint64_t v58 = sub_1000208DC;
    v59 = sub_100020F60;
    id v60 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = sub_1000208DC;
    int v53 = sub_100020F60;
    id v54 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x3032000000;
    uint64_t v46 = sub_1000208DC;
    double v47 = sub_100020F60;
    id v48 = 0;
    id v14 = v9;
    directoryCoordinator = self->_directoryCoordinator;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100130424;
    v35[3] = &unk_100739478;
    v37 = &v67;
    v35[4] = self;
    id v30 = v8;
    id v36 = v30;
    v38 = &obj;
    uint64_t v39 = &v55;
    id v16 = a5;
    double v40 = &v49;
    double v41 = &v43;
    double v42 = buf;
    uint64_t v17 = directoryCoordinator;
    id v9 = v14;
    [(PKDirectoryCoordinator *)v17 performCoordinatedAction:v35];
    id v18 = p_obj[5];
    BOOL v19 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v19)
      {
        *(_DWORD *)double v71 = 138412290;
        v72 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: wrote card with unique ID %@.", v71, 0xCu);
      }

      int64_t v20 = v32;
      if (v32 != 3)
      {
        int64_t v20 = v32;
        if ([p_obj[5] supportsSyncing])
        {
          id v21 = [(PDCardFileManager *)self _ubiquityManager];
          [v21 updateUbiquitousPass:v30];

          int64_t v20 = v32;
        }
      }
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 passWritten:p_obj[5] withDaemonData:v50[5] diff:v56[5] fromSource:v20];

      if (![(id)v44[5] count]) {
        goto LABEL_20;
      }
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 cardFileManager:self didFailToDecryptRemoteAssets:v44[5] forPass:p_obj[5]];
    }
    else if (v19)
    {
      *(_DWORD *)double v71 = 138412290;
      v72 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: skipped writing card with unique ID %@.", v71, 0xCu);
    }

LABEL_20:
    uint64_t v26 = (void *)PDOSTransactionCreate("PDCardFileManager.revocation_check.write_card");
    id v27 = p_obj[5];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = nullsub_39;
    v33[3] = &unk_10072E1E8;
    id v28 = v26;
    id v34 = v28;
    [(PDCardFileManager *)self _checkRevocationStatusForPass:v27 withCompletion:v33];

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&obj, 8);

    if (v16) {
      objc_storeStrong(v16, *(id *)(*(void *)&buf[8] + 40));
    }
    BOOL v25 = *((unsigned char *)v68 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v67, 8);
    goto LABEL_23;
  }
  uint64_t v23 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v8 uniqueID];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = obj;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: not allowed to write card %{public}@ %{public}@", buf, 0x16u);
  }
  if (a5) {
    objc_storeStrong(a5, obj);
  }

  BOOL v25 = 0;
LABEL_23:

  return v25;
}

- (void)writeCatalogOfRecord:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  directoryCoordinator = self->_directoryCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001305AC;
  v12[3] = &unk_1007394A0;
  id v9 = v6;
  id v13 = v9;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogOfRecordWritten:v9 source:a4];

  if (a4 != 3)
  {
    unsigned __int8 v11 = [(PDCardFileManager *)self _ubiquityManager];
    [v11 updateUbiquitousCatalog:v9];
  }
}

- (void)deleteCardWithUniqueID:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = sub_1000208DC;
  int64_t v20 = sub_100020F60;
  id v21 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013077C;
  v13[3] = &unk_100739310;
  id v15 = &v16;
  v13[4] = self;
  id v12 = v8;
  id v14 = v12;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v13];

  [(PDCardFileManager *)self _deleteCardWithUniqueID:v12 cardDirectoryCoordinator:v17[5] forReason:a4 withDiagnosticReason:v9];
  _Block_object_dispose(&v16, 8);
}

- (void)_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 forReason:(unint64_t)a5 withDiagnosticReason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = +[NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: card %{public}@ will be removed: %{public}@ %{public}@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passWithUniqueIdentifierWillDisappear:v10 forReason:a5 withDiagnosticReason:v12];

  int v17 = 0;
  if (a5 <= 8 && ((1 << a5) & 0x11C) != 0)
  {
    uint64_t v18 = [(PDCardFileManager *)self _ubiquityManager];
    [v18 prepareToRemoveUbiquitousPassWithUniqueID:v10];

    int v17 = 1;
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v33) = 0;
  directoryCoordinator = self->_directoryCoordinator;
  uint64_t v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_100130A84;
  id v27 = &unk_1007394C8;
  id v31 = buf;
  id v28 = self;
  id v20 = v10;
  id v29 = v20;
  id v21 = v11;
  id v30 = v21;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:&v24];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "passWithUniqueIdentifierDidDisappear:forReason:withDiagnosticReason:", v20, a5, v12, v24, v25, v26, v27, v28, v29);
  }
  if (v17)
  {
    uint64_t v23 = [(PDCardFileManager *)self _ubiquityManager];
    [v23 removeUbiquitousPassWithUniqueID:v20 completed:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
  }
  _Block_object_dispose(buf, 8);
}

- (void)deleteAllWithDiagnosticReason:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting all cards", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(PDCardFileManager *)self passUniqueIDs];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PDCardFileManager *)self deleteCardWithUniqueID:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) forReason:2 withDiagnosticReason:v4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)scheduleImmediateRevocationCheck
{
  PDScheduledActivityGetCriteria();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  PDScheduledActivityRemove();
  PDScheduledActivityRegister();
}

- (void)decryptPassAssets:(id)a3 undecryptableAssets:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 secureElementPass];
  if (v7)
  {
    id v8 = [v6 dataAccessor];
    id v9 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
    uint64_t v10 = [v8 remoteAssetManagerForSEIDs:v9];

    id v11 = objc_alloc_init(PDRemoteAssetDecryptionManager);
    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v10;
    long long v13 = [v10 deviceSpecificItems];
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([(PDRemoteAssetDecryptionManager *)v11 assetRequiresDecryption:v18]
            && ![(PDRemoteAssetDecryptionManager *)v11 decryptAsset:v18 forPass:v7])
          {
            [v12 addObject:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    if (a4)
    {
      id v19 = [v12 copy];
      id v20 = *a4;
      *a4 = v19;
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: requested to perform scheduled activity with identifier:%@", buf, 0xCu);
  }

  if ([v6 isEqualToString:@"CacheMaintenance"])
  {
    directoryCoordinator = self->_directoryCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100130FF4;
    v10[3] = &unk_1007394A0;
    v10[4] = self;
    [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v10];
  }
  else if ([v6 isEqualToString:@"RevocationCheck"])
  {
    [(PDCardFileManager *)self _performRevocationCheckActivity];
  }
  else if ([v6 isEqualToString:@"PDCardFileManagerMissingRemoteAssetsActivityIdentifier"])
  {
    [(PDCardFileManager *)self _performMissingAssetDownloadActivity];
  }
}

- (void)_performRevocationCheckActivity
{
  id v5 = (id)PDOSTransactionCreate("PDCardFileManager.revocation_check");
  id v3 = [(PDCardFileManager *)self passUniqueIDs];
  id v4 = [v3 mutableCopy];
  [(PDCardFileManager *)self _recursivelyCheckRevocationStatusForPassUniqueIdentifiers:v4 osTransaction:v5];
}

- (void)_recursivelyCheckRevocationStatusForPassUniqueIdentifiers:(id)a3 osTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 lastObject];
  if (v8)
  {
    id v9 = [(PDCardFileManager *)self objectWithUniqueID:v8];
    [v6 removeObject:v8];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100131188;
    v10[3] = &unk_10072E238;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(PDCardFileManager *)self _checkRevocationStatusForPass:v9 withCompletion:v10];
  }
}

- (void)_checkRevocationStatusForPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = sub_1000208DC;
    v13[4] = sub_100020F60;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001312EC;
    v9[3] = &unk_100739518;
    id v10 = v6;
    id v12 = v13;
    id v11 = v8;
    [v10 revocationStatusWithCompletion:v9];

    _Block_object_dispose(v13, 8);
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

- (void)_createImageSetsForCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 displayProfile:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13 && v8)
  {
    for (uint64_t i = 0; i != 9; ++i)
    {
      if (+[PKImageSet shouldCacheForDisplayProfile:v9 imageSetType:i])
      {
        id v12 = [(PDCardFileManager *)self _imageSetContainerForUniqueID:v13 cardDirectoryCoordinator:v8 ofType:i withDisplayProfile:v9 suffix:0];
        [v12 invalidate];
      }
    }
  }
}

- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000208DC;
  long long v24 = sub_100020F60;
  id v25 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100131820;
  v17[3] = &unk_100739310;
  id v19 = &v20;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v17];
  id v15 = [(PDCardFileManager *)self _cachedImageSetContainerForUniqueID:v14 type:a4 withDisplayProfile:v11 displayTraits:v12 cardDirectoryCoordinator:v21[5]];

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 cardDirectoryCoordinator:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  int64_t v32 = sub_1000208DC;
  id v33 = sub_100020F60;
  id v34 = 0;
  int v17 = [(PDCardFileManager *)self _cacheURLForUniqueID:v12];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100131A34;
  v23[3] = &unk_100739540;
  id v27 = &v29;
  int64_t v28 = a4;
  id v18 = v13;
  id v24 = v18;
  id v19 = v14;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  [v15 performCoordinatedAction:v23];

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (void)_dc_invalidateCardDirectoryCoordinatorForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    id v6 = [(NSMapTable *)self->_cardDirectoryCoordinators objectForKey:v4];
    id v7 = v6;
    if (v6)
    {
      [v6 invalidate];
      [(NSMapTable *)self->_cardDirectoryCoordinators removeObjectForKey:v8];
    }

    id v5 = v8;
  }
  _objc_release_x1(v4, v5);
}

- (id)_dc_cardWithUniqueID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = [(PDCardFileManager *)self _dc_cardDirectoryCoordinatorForUniqueID:v6];
  if (v8)
  {
    id v9 = [(PDCardFileManager *)self _cardWithUniqueID:v6 cardDirectoryCoordinator:v8 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_cardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v18 = 0;
  id v11 = [(PDCardFileManager *)self _dataAccessorForCardDirectoryCoordinator:v9 error:&v18];
  id v12 = v18;
  if (!v11)
  {
LABEL_6:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100131E58;
    v15[3] = &unk_100739388;
    id v16 = v8;
    id v17 = v12;
    [v9 performCoordinatedAction:v15];

    id v13 = 0;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v13 = +[PKPass createWithValidatedFileDataAccessor:v11];

  if (!v13) {
    goto LABEL_6;
  }
  [v13 setUniqueID:v8];
  if (a5) {
LABEL_7:
  }
    *a5 = v12;
LABEL_8:

  return v13;
}

- (BOOL)_dc_writeCard:(id)a3 writtenCard:(id *)a4 diff:(id *)a5 daemonData:(id *)a6 undecryptableAssets:(id *)a7 error:(id *)a8
{
  id v10 = a3;
  id v11 = [v10 dataAccessor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    LOBYTE(v20) = 0;
    id v19 = 0;
    goto LABEL_49;
  }
  v56 = [v10 dataAccessor];
  id v13 = [v10 uniqueID];
  uint64_t v55 = [v56 fileURL];
  CFURLRef bundleURL = [(PDCardFileManager *)self _objectURLForUniqueID:v13];
  v61 = +[NSFileManager defaultManager];
  if (!v13)
  {
    id v14 = [v10 passTypeIdentifier];
    id v15 = [v10 serialNumber];
    id v13 = PKGeneratePassUniqueID();

    [v10 setUniqueID:v13];
  }
  id v16 = [(PDCardFileManager *)self _dc_cardWithUniqueID:v13 error:0];
  id v60 = [v16 sequenceCounter];
  uint64_t v58 = [v10 sequenceCounter];
  if (v60)
  {
    if (v58)
    {
      id v17 = [v60 integerValue];
      if ((uint64_t)v17 > (uint64_t)[v58 integerValue])
      {
        id v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218240;
          *(void *)&uint8_t buf[4] = [v60 integerValue];
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = [v58 integerValue];
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Existing pass sequence counter %lu is greater than incoming pass sequence counter %lu. Ignoring.", buf, 0x16u);
        }
        id v19 = 0;
        LOBYTE(v20) = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
  }
  if (!v16
    || ([v10 manifestHash],
        id v21 = objc_claimAutoreleasedReturnValue(),
        [v16 manifestHash],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v23 = [v21 isEqualToData:v22],
        v22,
        v21,
        (v23 & 1) == 0))
  {
    id v24 = (void *)PDOSTransactionCreate("PDCardFileManager");
    [(PDCardFileManager *)self _dc_invalidateCardDirectoryCoordinatorForUniqueID:v13];
    missingAssetQueue = self->_missingAssetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001327F8;
    block[3] = &unk_10072E238;
    id v48 = v24;
    uint64_t v73 = v48;
    v74 = self;
    id v26 = v13;
    id v75 = v26;
    id v27 = missingAssetQueue;
    dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v27, v28);

    uint64_t v29 = [(PDCardFileManager *)self _cacheURLForUniqueID:v26];
    [v61 removeItemAtURL:v29 error:0];

    if (v16)
    {
      id v30 = PKTemporaryItemURLWithExtension();
      PKTemporaryItemPrepareDirectory();
      if (v30 && [v61 moveItemAtURL:bundleURL toURL:v30 error:0])
      {
        id v31 = [objc_alloc((Class)PKFileDataAccessor) initWithFileURL:v30 error:0];
        [v16 setDataAccessor:v31];

LABEL_23:
        unsigned int v20 = [v61 copyItemAtURL:v55 toURL:bundleURL error:a8];
        if (v20)
        {
          id v33 = [(PDCardFileManager *)self _dc_cardDirectoryCoordinatorForUniqueID:v26];
          double v47 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
          id v19 = [v10 copy];
          id v34 = [(PDCardFileManager *)self _dataAccessorForCardDirectoryCoordinator:v33 error:0];
          [v19 setDataAccessor:v34];

          if ([v19 passType] == (id)1) {
            [v19 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v47];
          }
          [(PDCardFileManager *)self decryptPassAssets:v19 undecryptableAssets:a7];
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v77 = sub_1000208DC;
          v78 = sub_100020F60;
          id v79 = 0;
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_10013284C;
          v71[3] = &unk_1007393B0;
          uint8_t v71[4] = buf;
          [v33 performCoordinatedAction:v71];
          objc_storeStrong(a6, *(id *)(*(void *)&buf[8] + 40));
          uint64_t v51 = v33;
          CFBundleRef v35 = CFBundleCreate(kCFAllocatorDefault, bundleURL);
          if (v35)
          {
            _CFBundleFlushBundleCaches();
            _CFBundleRemoveResourceURL();
            CFRelease(v35);
          }
          if (a5 && v16)
          {
            id v36 = [v16 diff:v19];
            id v37 = *a5;
            *a5 = v36;
          }
          if (([v19 supportsSyncing] & 1) == 0
            && (PKStoreDemoModeEnabled() & 1) == 0
            && (PKUIOnlyDemoModeEnabled() & 1) == 0)
          {
            PKExcludeFileURLFromBackup();
          }
          if (v30) {
            [v61 removeItemAtURL:v30 error:0];
          }
          v38 = [v19 displayProfile];
          uint64_t v39 = PDHeavyUtilityQueue();
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_1001328C4;
          v67[3] = &unk_100730198;
          v67[4] = self;
          id v40 = v26;
          id v68 = v40;
          id v54 = v51;
          id v69 = v54;
          id v52 = v38;
          id v70 = v52;
          dispatch_block_t v41 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v67);
          dispatch_async(v39, v41);

          if (([v19 remoteAssetsDownloadedForSEIDs:v47] & 1) == 0)
          {
            double v42 = self->_missingAssetQueue;
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_10013291C;
            v62[3] = &unk_100730198;
            uint64_t v63 = v48;
            id v64 = v54;
            double v65 = self;
            id v66 = v40;
            uint64_t v43 = v42;
            dispatch_block_t v44 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v62);
            dispatch_async(v43, v44);
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (v30) {
            [v61 moveItemAtURL:v30 toURL:bundleURL error:0];
          }
          id v19 = 0;
        }

        id v18 = v48;
        goto LABEL_44;
      }
      int64_t v32 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: failed to move aside pass %{public}@ - falling back to deleting.", buf, 0xCu);
      }

      [v61 removeItemAtURL:bundleURL error:0];
    }
    else
    {
      [v61 removeItemAtURL:bundleURL error:0];
    }
    id v30 = 0;
    id v16 = 0;
    goto LABEL_23;
  }
  id v19 = 0;
  LOBYTE(v20) = 1;
LABEL_45:

  char v45 = v20 ^ 1;
  if (!a4) {
    char v45 = 1;
  }
  if ((v45 & 1) == 0)
  {
    objc_storeStrong(a4, v19);
    LOBYTE(v20) = 1;
  }
LABEL_49:

  return v20;
}

- (BOOL)_dc_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7 || ([v7 isInvalidated] & 1) == 0)
  {
    id v10 = +[NSFileManager defaultManager];
    [(PDCardFileManager *)self _dc_invalidateCardDirectoryCoordinatorForUniqueID:v6];
    missingAssetQueue = self->_missingAssetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100132BC4;
    block[3] = &unk_10072E198;
    void block[4] = self;
    id v12 = v6;
    id v24 = v12;
    id v13 = missingAssetQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v13, v14);

    id v15 = [(PDCardFileManager *)self _objectURLForUniqueID:v12];
    id v22 = 0;
    unsigned int v9 = [v10 removeItemAtURL:v15 error:&v22];
    id v16 = v22;
    id v17 = [(PDCardFileManager *)self _cacheURLForUniqueID:v12];
    [v10 removeItemAtURL:v17 error:0];

    id v18 = PKLogFacilityTypeGetObject();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v19)
      {
        *(_DWORD *)long long buf = 138543362;
        id v26 = v12;
        unsigned int v20 = "PDCardFileManager: card was removed %{public}@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      }
    }
    else if (v19)
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v16;
      unsigned int v20 = "PDCardFileManager: error removing card %{public}@";
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  LOBYTE(v9) = 0;
LABEL_11:

  return v9;
}

- (void)_dc_performCacheMaintenanceActivity
{
  id v3 = +[NSFileManager defaultManager];
  v61 = self;
  cardsURL = self->_cardsURL;
  id v86 = 0;
  id v6 = [v3 contentsOfDirectoryAtURL:cardsURL includingPropertiesForKeys:&__NSArray0__struct options:7 error:&v86];
  id v7 = v86;
  id v8 = v7;
  if (v6)
  {

    id v9 = objc_alloc_init((Class)NSMutableSet);
    id v65 = objc_alloc_init((Class)NSMutableSet);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v57 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (!v11) {
      goto LABEL_14;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v83;
    uint64_t v14 = PKRawPassExtension;
    while (1)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v83 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        id v17 = [v16 lastPathComponent];
        id v18 = [v17 pathExtension];

        if ([v18 isEqualToString:v14])
        {
          BOOL v19 = [v16 URLByStandardizingPath];
          unsigned int v20 = v9;
        }
        else
        {
          if (![v18 isEqualToString:@"cache"]) {
            goto LABEL_12;
          }
          BOOL v19 = [v16 URLByStandardizingPath];
          unsigned int v20 = v65;
        }
        [v20 addObject:v19];

LABEL_12:
      }
      id v12 = [v10 countByEnumeratingWithState:&v82 objects:v90 count:16];
      if (!v12)
      {
LABEL_14:

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id obj = v9;
        id v21 = v65;
        id v59 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
        if (!v59) {
          goto LABEL_47;
        }
        uint64_t v60 = *(void *)v79;
LABEL_16:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v79 != v60) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v23 = *(void **)(*((void *)&v78 + 1) + 8 * v22);
          id v25 = sub_10012E18C(v23);
          id v26 = [(PDCardFileManager *)v61 _cacheURLForUniqueID:v25];
          id v27 = [v26 URLByStandardizingPath];

          if (!v27 || ![v21 containsObject:v27]) {
            goto LABEL_46;
          }
          [v21 removeObject:v27];
          id v77 = 0;
          dispatch_block_t v28 = [v3 contentsOfDirectoryAtURL:v27 includingPropertiesForKeys:&__NSArray0__struct options:7 error:&v77];
          id v29 = v77;
          id v30 = v29;
          if (!v28)
          {
            char v45 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              id v92 = v30;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Unable to enumerate cache directory: %@", buf, 0xCu);
            }

LABEL_46:
            goto LABEL_47;
          }
          uint64_t v62 = v22;
          uint64_t v63 = v27;
          id v64 = v24;

          long long v76 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v73 = 0u;
          id v31 = v28;
          id v32 = [v31 countByEnumeratingWithState:&v73 objects:v88 count:16];
          if (!v32) {
            goto LABEL_37;
          }
          id v33 = v32;
          uint64_t v34 = *(void *)v74;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v74 != v34) {
                objc_enumerationMutation(v31);
              }
              id v36 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
              id v37 = [v36 lastPathComponent];
              v38 = [v37 pathExtension];

              if ([v38 isEqualToString:@"archive"])
              {
                id v72 = 0;
                [v3 removeItemAtURL:v36 error:&v72];
                id v39 = v72;
                id v40 = PKLogFacilityTypeGetObject();
                BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
                if (v39)
                {
                  if (v41)
                  {
                    *(_DWORD *)long long buf = 138412290;
                    id v92 = v39;
                    double v42 = v40;
                    uint64_t v43 = "Unable to remove obsolte cache: %@";
                    goto LABEL_33;
                  }
                }
                else if (v41)
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v92 = v36;
                  double v42 = v40;
                  uint64_t v43 = "Removed obsolete cache: %@";
LABEL_33:
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
                }
              }
            }
            id v33 = [v31 countByEnumeratingWithState:&v73 objects:v88 count:16];
          }
          while (v33);
LABEL_37:

          uint64_t v22 = v62 + 1;
          id v21 = v65;
          if ((id)(v62 + 1) == v59)
          {
            id v59 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
            if (v59) {
              goto LABEL_16;
            }
LABEL_47:

            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            id v46 = v21;
            id v47 = [v46 countByEnumeratingWithState:&v68 objects:v87 count:16];
            if (!v47) {
              goto LABEL_60;
            }
            id v48 = v47;
            uint64_t v49 = *(void *)v69;
            while (2)
            {
              uint64_t v50 = 0;
LABEL_50:
              if (*(void *)v69 != v49) {
                objc_enumerationMutation(v46);
              }
              uint64_t v51 = *(void **)(*((void *)&v68 + 1) + 8 * v50);
              id v67 = 0;
              [v3 removeItemAtURL:v51 error:&v67];
              id v52 = v67;
              int v53 = PKLogFacilityTypeGetObject();
              BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
              if (v52)
              {
                if (v54)
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v92 = v52;
                  uint64_t v55 = v53;
                  v56 = "Unable to remove cache directory: %@";
                  goto LABEL_57;
                }
              }
              else if (v54)
              {
                *(_DWORD *)long long buf = 138412290;
                id v92 = v51;
                uint64_t v55 = v53;
                v56 = "Removed cache directory with no matching pass: %@";
LABEL_57:
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
              }

              if (v48 == (id)++v50)
              {
                id v48 = [v46 countByEnumeratingWithState:&v68 objects:v87 count:16];
                if (!v48)
                {
LABEL_60:

                  id v6 = v57;
                  goto LABEL_61;
                }
                continue;
              }
              goto LABEL_50;
            }
          }
        }
      }
    }
  }
  dispatch_block_t v44 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v92 = v8;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Unable to enumerate cards directory: %@", buf, 0xCu);
  }

LABEL_61:
}

- (void)ubiquitousCardDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueID];
  id v6 = [(PDCardFileManager *)self objectWithUniqueID:v5];

  if (!v6
    || ([v4 manifestHash],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v6 manifestHash],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v7 isEqualToData:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    id v17 = 0;
    unsigned int v12 = [(PDCardFileManager *)self writeCard:v4 source:3 error:&v17];
    uint64_t v13 = PKLogFacilityTypeGetObject();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        id v15 = [v4 uniqueID];
        *(_DWORD *)long long buf = 138412290;
        BOOL v19 = v15;
        id v16 = "card updated via ubiquity: %@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      }
    }
    else if (v14)
    {
      id v15 = [v17 localizedDescription];
      *(_DWORD *)long long buf = 138412290;
      BOOL v19 = v15;
      id v16 = "card update via ubiquity FAILED: %@";
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v4 uniqueID];
    *(_DWORD *)long long buf = 138412290;
    BOOL v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "card NOT updated via ubiquity - manifest hashes are equivalent: %@", buf, 0xCu);
  }
LABEL_13:
}

- (void)ubiquitousCardWithUniqueIDRemoved:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "card removed via ubiquity: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PDCardFileManager *)self deleteCardWithUniqueID:v4 forReason:1 withDiagnosticReason:@"Ubiquity"];
}

- (void)ubiquitousCatalogDidChange:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "catalog received via ubiquity", buf, 2u);
  }

  int v6 = [(PDCardFileManager *)self catalogOfRecord];
  id v7 = v6;
  if (v6 && ([v6 isEquivalentToCatalog:v4] & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v8 = "---> catalog not updated - equivalent to existing catalog";
      unsigned __int8 v9 = (uint8_t *)&v10;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    [(PDCardFileManager *)self writeCatalogOfRecord:v4 source:3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      id v8 = "---> catalog updated";
      unsigned __int8 v9 = v11;
      goto LABEL_9;
    }
  }
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received notification of filesystem change at watched URL.", v6, 2u);
  }

  [(PDCardFileManager *)self startUbiquity];
}

- (void)_evaluateDownloadMissingAssetsActivityWithForcedReschedule:(BOOL)a3
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: evaluate download missing assets activity", (uint8_t *)&v12, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:self->_maximumDownloadRetries];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maximumDownloadRetries = self->_maximumDownloadRetries;
    int v12 = 134218240;
    id v13 = v7;
    __int16 v14 = 2048;
    unint64_t v15 = maximumDownloadRetries;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: found %lu passes with missing remote assets with maximum retries count:%lu", (uint8_t *)&v12, 0x16u);
  }

  if (v7)
  {
    if (a3 || (PDScheduledActivityExists() & 1) == 0)
    {
      __int16 v10 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
      id v11 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v10];

      [v11 setRepeating:1];
      [v11 setRepeatInterval:86400.0];
      [v11 setRequireMainsPower:1];
      [v11 setRequireNetworkConnectivity:1];
      [v11 setReason:@"Downlad missing assets"];
      PDScheduledActivityRegister();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: Missing assets maintenance activity scheduled", (uint8_t *)&v12, 2u);
      }

      id v5 = v11;
      goto LABEL_17;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      unsigned __int8 v9 = "PDCardFileManager: Missing assets maintenance exist, we don't need to schedule a new one";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    if (!PDScheduledActivityExists()) {
      return;
    }
    PDScheduledActivityRemove();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      unsigned __int8 v9 = "PDCardFileManager: Removed Missing assets maintenance activity";
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)_performMissingAssetDownloadActivity
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: requested download missing assets", buf, 2u);
  }

  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_performingMissingRemoteAssetDownloadActivity, (unsigned __int8 *)&v4, 1u);
  if (v4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: we have pending UniqueIDs to process.", buf, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v6 = [WeakRetained missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:self->_maximumDownloadRetries];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      unsigned __int8 v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: Will download remote missing assets from passes with uniqueIDs:%@", buf, 0xCu);
    }

    id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = v6;
    id v8 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v3);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100133D6C;
          v16[3] = &unk_100731CB8;
          v16[4] = self;
          void v16[5] = v12;
          [v7 addOperation:v16];
        }
        id v9 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    id v13 = +[NSNull null];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100133E88;
    v15[3] = &unk_100739590;
    void v15[4] = self;
    id v14 = [v7 evaluateWithInput:v13 completion:v15];
  }
}

- (void)_downloadRemoteAssetsForCardWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v22 = (void (**)(void))a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDCardFileManager: downloading missing assets for pass %@", (uint8_t *)&buf, 0xCu);
  }

  long long v20 = (void *)PDOSTransactionCreate("PDCardFileManager.remote_asset_download");
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  id v52 = sub_1000208DC;
  int v53 = sub_100020F60;
  id v54 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100134440;
  v46[3] = &unk_100739310;
  p_long long buf = &buf;
  v46[4] = self;
  id v19 = v6;
  id v47 = v19;
  [(PKDirectoryCoordinator *)directoryCoordinator performCoordinatedAction:v46];
  id v21 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
  id v9 = [(PDCardFileManager *)self _dataAccessorForCardDirectoryCoordinator:*(void *)(*((void *)&buf + 1) + 40) error:0];
  id v25 = [v9 remoteAssetManagerForSEIDs:v21];

  if (*(void *)(*((void *)&buf + 1) + 40) && v25)
  {
    uint64_t v10 = [v25 pendingRemoteAssetsItems];
    id v11 = [v10 count];
    if (v11)
    {
      id v24 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      id v18 = v11;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v10;
      id v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100134490;
            v35[3] = &unk_1007395B8;
            id v39 = &buf;
            id v36 = v25;
            uint64_t v37 = v15;
            v38 = self;
            id v40 = v45;
            [v24 addOperation:v35];
          }
          id v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v12);
      }

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1001345F8;
      v34[3] = &unk_10072E5C0;
      v34[4] = self;
      [v24 addOperation:v34];
      id v16 = +[NSNull null];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1001346D8;
      v26[3] = &unk_100739608;
      id v27 = v20;
      id v31 = &buf;
      id v30 = v22;
      dispatch_block_t v28 = self;
      id v32 = v45;
      id v33 = v18;
      id v29 = v19;
      id v17 = [v24 evaluateWithInput:v16 completion:v26];

      _Block_object_dispose(v45, 8);
    }
    else if (v22)
    {
      v22[2]();
    }
  }
  else if (v22)
  {
    v22[2]();
  }

  _Block_object_dispose(&buf, 8);
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate
{
  return self->_cloudStoreCoordinatorDelegate;
}

- (void)setCloudStoreCoordinatorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreCoordinatorDelegate, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardsURL, 0);
  objc_storeStrong((id *)&self->_ubiquityManager, 0);
  objc_storeStrong((id *)&self->_missingAssetQueue, 0);
  objc_storeStrong((id *)&self->_cardDirectoryCoordinators, 0);
  objc_storeStrong((id *)&self->_directoryCoordinator, 0);
}

@end