@interface BCBookReadingTimeTracker
+ (BCBookReadingTimeTracker)sharedInstance;
- (BCBookReadingTimeTracker)initWithPersistenStoreDirectory:(id)a3;
- (BCBookReadingTimeTrackerLibraryDelegate)libraryDelegate;
- (BOOL)_createPersistentDirectoryIfNeeded;
- (BOOL)_mocq_trackSessionBegin:(id)a3 assetID:(id)a4 error:(id *)a5;
- (BOOL)_mocq_trackSessionEnd:(id)a3 assetID:(id)a4 error:(id *)a5;
- (BOOL)_mocq_trackSessionUpdate:(id)a3 assetID:(id)a4 error:(id *)a5;
- (BOOL)_mocq_updateLaunchTrackingForAssets:(id)a3 error:(id *)a4;
- (BOOL)_readyToCheck;
- (BOOL)globalMetadataFetched;
- (BOOL)readyToSeedRecentBooksList;
- (NSHashTable)promotionObservers;
- (NSHashTable)sessionObservers;
- (NSManagedObjectContext)moc;
- (NSManagedObjectModel)model;
- (NSPersistentStoreCoordinator)psc;
- (NSString)overridePersistentDirectory;
- (NSTimer)bookPromotionTimer;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)seedRecentQueue;
- (id)_fetchRequestForReadingSession:(id)a3;
- (id)_getAssetsToPurge:(unint64_t)a3 request:(id *)a4 error:(id *)a5;
- (id)_mocq_assetToPurgeForAssetID:(id)a3;
- (id)_mocq_promoteAssetImmediatelyAndSave:(id)a3;
- (id)_mocq_readingSessionWithAssetID:(id)a3 sessionID:(id)a4;
- (id)_persistentStoreDirectory;
- (id)_persistentStoreURL;
- (id)mq_trackedAssetForAssetID:(id)a3;
- (int64_t)_mocq_deleteSessionsForAsset:(id)a3 beforeTime:(id)a4;
- (unint64_t)limit;
- (void)_BDSCloudGlobalMetadataManagerFetchedRecordsChanged:(id)a3;
- (void)_cleanupBooksMarkedAsFinished:(id)a3;
- (void)_cleanupFinishedBooksFromLibraryExcluding:(id)a3;
- (void)_fetchBookStatusWithAssetID:(id)a3 completion:(id)a4;
- (void)_fetchRecentBooksList:(id)a3;
- (void)_handleReadingWithAssetID:(id)a3 sessionID:(id)a4 sessionEvent:(int64_t)a5 trackerEventType:(unint64_t)a6 readingFeatureFlags:(int64_t)a7 successCompletion:(id)a8 failureCompletion:(id)a9;
- (void)_handledUpdateReadingSessionTimer:(id)a3;
- (void)_mocqSessionID:(id)a3 sessionEvent:(int64_t)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 assetID:(id)a7 isTrackedAsRecent:(BOOL)a8 canBePromoted:(BOOL)a9 isSample:(BOOL)a10 readingFeatureFlags:(int64_t)a11 successCompletion:(id)a12 failureCompletion:(id)a13;
- (void)_mocq_deleteAssetToPurgeForAssetID:(id)a3;
- (void)_mocq_promoteAssetID:(id)a3;
- (void)_mocq_runBookPromotionAlgorithmForAssetID:(id)a3 libraryAsset:(id)a4 isSample:(BOOL)a5 successCompletion:(id)a6 failureCompletion:(id)a7;
- (void)_mq_clearBookPromotionTimer;
- (void)_mq_startBookPromotionTimerForSession:(id)a3 assetID:(id)a4 isSample:(BOOL)a5 trackerEventType:(unint64_t)a6 readingFeatureFlags:(int64_t)a7;
- (void)_purgeRecentBooksList:(BOOL)a3 completion:(id)a4;
- (void)_readingTimeTrackerGetAssetDetailsForAssetID:(id)a3 completion:(id)a4;
- (void)_seedRecentBooksList;
- (void)_sessionExistsForSessionID:(id)a3 assetID:(id)a4 completion:(id)a5;
- (void)_stopTrackingAssetsToPurge:(id)a3;
- (void)addPromotionObserver:(id)a3;
- (void)addSessionObserver:(id)a3;
- (void)dealloc;
- (void)promoteTrackedAsset:(id)a3 promoteIfNotTracked:(BOOL)a4;
- (void)purgeRecentBooks;
- (void)removePromotionObserver:(id)a3;
- (void)removeSessionObserver:(id)a3;
- (void)scrubRecents;
- (void)seedRecentBooksList:(unint64_t)a3;
- (void)setAccessQueue:(id)a3;
- (void)setBookPromotionTimer:(id)a3;
- (void)setGlobalMetadataFetched:(BOOL)a3;
- (void)setLibraryDelegate:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setMoc:(id)a3;
- (void)setModel:(id)a3;
- (void)setOverridePersistentDirectory:(id)a3;
- (void)setPromotionObservers:(id)a3;
- (void)setPsc:(id)a3;
- (void)setReadyToSeedRecentBooksList:(BOOL)a3;
- (void)setSeedRecentQueue:(id)a3;
- (void)setSessionObservers:(id)a3;
- (void)trackReadingSessionBeganWithAssetID:(id)a3 sessionID:(id)a4 trackerEventType:(unint64_t)a5 readingFeatureFlags:(int64_t)a6 completion:(id)a7;
- (void)trackReadingSessionEndedWithAssetID:(id)a3 sessionID:(id)a4 trackerEventType:(unint64_t)a5 readingFeatureFlags:(int64_t)a6 completion:(id)a7;
@end

@implementation BCBookReadingTimeTracker

+ (BCBookReadingTimeTracker)sharedInstance
{
  if (qword_349450 != -1) {
    dispatch_once(&qword_349450, &stru_2CA568);
  }
  v2 = (void *)qword_349448;

  return (BCBookReadingTimeTracker *)v2;
}

- (BCBookReadingTimeTracker)initWithPersistenStoreDirectory:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BCBookReadingTimeTracker;
  v5 = [(BCBookReadingTimeTracker *)&v47 init];
  if (v5)
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 URLForResource:@"RecentlyOpenedBooksDB" withExtension:@"momd"];

    if (!v7)
    {
      v12 = BCBookPromotionLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1EF430();
      }
      v7 = v5;
      v5 = 0;
      goto LABEL_27;
    }
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iBooks.BCBookReadingTimeTracker.seedRecentQueue", v8);
    seedRecentQueue = v5->_seedRecentQueue;
    v5->_seedRecentQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.iBooks.BCBookReadingTimeTracker.accessQueue", v12);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[NSHashTable weakObjectsHashTable];
    promotionObservers = v5->_promotionObservers;
    v5->_promotionObservers = (NSHashTable *)v15;

    uint64_t v17 = +[NSHashTable weakObjectsHashTable];
    sessionObservers = v5->_sessionObservers;
    v5->_sessionObservers = (NSHashTable *)v17;

    v19 = +[NSDistributedNotificationCenter defaultCenter];
    [v19 addObserver:v5 selector:"_BDSCloudGlobalMetadataManagerFetchedRecordsChanged:" name:BDSCloudGlobalMetadataManagerFetchedRecordsChanged object:0];

    v20 = (NSString *)[v4 copy];
    overridePersistentDirectory = v5->_overridePersistentDirectory;
    v5->_overridePersistentDirectory = v20;

    v22 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v7];
    model = v5->_model;
    v5->_model = v22;

    if (!v5->_model) {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/BookPromotionEngine/BCBookReadingTimeTracker.m", 148, (uint64_t)"-[BCBookReadingTimeTracker initWithPersistenStoreDirectory:]", (uint64_t)"_model", @"Failed to load the managed object model from url: %@", v24, v25, v26, (uint64_t)v7);
    }
    [(BCBookReadingTimeTracker *)v5 _createPersistentDirectoryIfNeeded];
    v48[0] = NSMigratePersistentStoresAutomaticallyOption;
    v48[1] = NSInferMappingModelAutomaticallyOption;
    v49[0] = &__kCFBooleanTrue;
    v49[1] = &__kCFBooleanTrue;
    v48[2] = NSPersistentStoreFileProtectionKey;
    v49[2] = NSFileProtectionNone;
    v27 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
    v28 = (NSPersistentStoreCoordinator *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v5->_model];
    psc = v5->_psc;
    v5->_psc = v28;

    v30 = [(BCBookReadingTimeTracker *)v5 _persistentStoreURL];
    v31 = v5->_psc;
    id v46 = 0;
    v32 = [(NSPersistentStoreCoordinator *)v31 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v30 options:v27 error:&v46];
    id v33 = v46;
    v34 = v33;
    if (v32)
    {
      id v35 = v33;
LABEL_7:
      v36 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
      moc = v5->_moc;
      v5->_moc = v36;

      [(NSManagedObjectContext *)v5->_moc setPersistentStoreCoordinator:v5->_psc];
      [(NSManagedObjectContext *)v5->_moc setUndoManager:0];
      [(NSManagedObjectContext *)v5->_moc setMergePolicy:NSMergeByPropertyStoreTrumpMergePolicy];
      if (v5->_moc)
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      v38 = BCBookPromotionLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1EF500();
      }
LABEL_25:

      v5 = 0;
      goto LABEL_26;
    }
    v39 = BCBookPromotionLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1EF59C();
    }

    v40 = +[NSFileManager defaultManager];
    v41 = [(BCBookReadingTimeTracker *)v5 _persistentStoreDirectory];
    [v40 removeItemAtURL:v41 error:0];

    if ([(BCBookReadingTimeTracker *)v5 _createPersistentDirectoryIfNeeded])
    {
      v42 = v5->_psc;
      id v45 = v34;
      v32 = [(NSPersistentStoreCoordinator *)v42 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v30 options:v27 error:&v45];
      id v35 = v45;

      if (v32) {
        goto LABEL_7;
      }
      v43 = BCBookPromotionLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1EF498();
      }
    }
    else
    {
      v43 = BCBookPromotionLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1EF568();
      }
      id v35 = v34;
    }

    v38 = BCBookPromotionLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1EF464();
    }
    v32 = 0;
    goto LABEL_25;
  }
LABEL_28:

  return v5;
}

- (id)_getAssetsToPurge:(unint64_t)a3 request:(id *)a4 error:(id *)a5
{
  id v9 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCAssetToPurge"];
  v10 = +[NSPredicate predicateWithFormat:@"%K >= %lu", @"launches", a3];
  [v9 setPredicate:v10];

  CFStringRef v19 = @"assetID";
  v11 = +[NSArray arrayWithObjects:&v19 count:1];
  [v9 setPropertiesToFetch:v11];

  v12 = [(BCBookReadingTimeTracker *)self moc];
  id v18 = 0;
  dispatch_queue_t v13 = [v12 executeFetchRequest:v9 error:&v18];
  id v14 = v18;

  if (v14)
  {
    uint64_t v15 = BCBookPromotionLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1EF604((uint64_t)v14, a3, v15);
    }
    v16 = 0;
  }
  else
  {
    uint64_t v15 = [v13 valueForKey:@"assetID"];
    v16 = [v15 bu_arrayByRemovingNSNulls];
  }

  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = v14;
  }

  return v16;
}

- (void)_stopTrackingAssetsToPurge:(id)a3
{
  id v4 = a3;
  v5 = [(BCBookReadingTimeTracker *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_15F404;
  v7[3] = &unk_2C3AF8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)scrubRecents
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_15F930;
  uint64_t v26 = sub_15F940;
  id v27 = +[NSUserDefaults standardUserDefaults];
  v3 = [(id)v23[5] objectForKey:@"BCLastScrubRecentsDate"];
  if (v3)
  {
    id v4 = +[NSCalendar currentCalendar];
    v5 = +[NSDate now];
    unsigned __int8 v6 = [v4 isDate:v3 inSameDayAsDate:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  v7 = [(BCBookReadingTimeTracker *)self libraryDelegate];
  if (v7) {
    char v8 = v6;
  }
  else {
    char v8 = 1;
  }

  if ((v8 & 1) == 0)
  {
    id v9 = BCBookPromotionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_DEFAULT, "Purge Tracking: scrubRecents", buf, 2u);
    }

    v10 = +[BCJSConfiguration sharedInstance];
    v11 = [v10 oldestDateToKeepFinished];

    v12 = [(BCBookReadingTimeTracker *)self libraryDelegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_15F948;
    v20[3] = &unk_2CA590;
    v20[4] = self;
    [v12 readingTimeTracker:self cleanupBooksFinishedBefore:v11 completion:v20];

    dispatch_queue_t v13 = +[BCJSConfiguration sharedInstance];
    id v14 = [v13 oldestDateToAvoidPurgeOfSamples];

    uint64_t v15 = +[BCJSConfiguration sharedInstance];
    v16 = [v15 oldestDateToAvoidPurgeOfBooks];

    if (v14 && v16)
    {
      uint64_t v17 = [(BCBookReadingTimeTracker *)self libraryDelegate];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_15F9D8;
      v19[3] = &unk_2CA5B8;
      v19[4] = self;
      v19[5] = &v22;
      [v17 recentsNotEngagedSinceDateForSamples:v14 dateForNonSamples:v16 completion:v19];
    }
    else
    {
      id v18 = BCBookPromotionLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1EF74C();
      }
    }
  }

  _Block_object_dispose(&v22, 8);
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BCBookReadingTimeTracker;
  [(BCBookReadingTimeTracker *)&v4 dealloc];
}

- (id)_mocq_promoteAssetImmediatelyAndSave:(id)a3
{
  [(BCBookReadingTimeTracker *)self _mocq_promoteAssetID:a3];
  objc_super v4 = [(BCBookReadingTimeTracker *)self moc];
  if ([v4 hasChanges])
  {
    id v9 = 0;
    unsigned __int8 v5 = [v4 save:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      v7 = BCBookPromotionLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1EF81C();
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_handleReadingWithAssetID:(id)a3 sessionID:(id)a4 sessionEvent:(int64_t)a5 trackerEventType:(unint64_t)a6 readingFeatureFlags:(int64_t)a7 successCompletion:(id)a8 failureCompletion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  CFStringRef v19 = [(BCBookReadingTimeTracker *)self libraryDelegate];

  if (v19)
  {
    if ([v15 length])
    {
      if (v16)
      {
        objc_initWeak(&location, self);
        v20 = [(BCBookReadingTimeTracker *)self libraryDelegate];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_160234;
        v30[3] = &unk_2CA608;
        objc_copyWeak(v35, &location);
        v35[1] = (id)a5;
        id v33 = v18;
        id v31 = v16;
        v35[2] = (id)a6;
        id v32 = v15;
        v35[3] = (id)a7;
        id v34 = v17;
        [v20 readingTimeTracker:self isAssetTrackedAsRecent:v32 completion:v30];

        objc_destroyWeak(v35);
        objc_destroyWeak(&location);
      }
      else
      {
        id v27 = (void (**)(id, void, void *))objc_retainBlock(v18);
        if (v27)
        {
          NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
          CFStringRef v38 = @"No session identifier.";
          v28 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          v29 = +[NSError errorWithDomain:@"BCBookReadingTimeTracker" code:-3000 userInfo:v28];
          v27[2](v27, 0, v29);
        }
      }
    }
    else
    {
      uint64_t v24 = (void (**)(id, void, void *))objc_retainBlock(v18);
      if (v24)
      {
        NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
        CFStringRef v40 = @"No asset identifier.";
        uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        uint64_t v26 = +[NSError errorWithDomain:@"BCBookReadingTimeTracker" code:-2000 userInfo:v25];
        v24[2](v24, 0, v26);
      }
    }
  }
  else
  {
    v21 = (void (**)(id, void, void *))objc_retainBlock(v18);
    if (v21)
    {
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      CFStringRef v42 = @"No library delegate.";
      uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v23 = +[NSError errorWithDomain:@"BCBookReadingTimeTracker" code:-1000 userInfo:v22];
      v21[2](v21, 0, v23);
    }
  }
}

- (void)_mocqSessionID:(id)a3 sessionEvent:(int64_t)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 assetID:(id)a7 isTrackedAsRecent:(BOOL)a8 canBePromoted:(BOOL)a9 isSample:(BOOL)a10 readingFeatureFlags:(int64_t)a11 successCompletion:(id)a12 failureCompletion:(id)a13
{
  BOOL v56 = a8;
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a12;
  id v22 = a13;
  v23 = v22;
  if (a4 != 2)
  {
    if (a4 != 1)
    {
      uint64_t v24 = v20;
      if (!a4)
      {
        id v53 = v22;
        id v54 = v21;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        uint64_t v25 = [(BCBookReadingTimeTracker *)self sessionObservers];
        uint64_t v26 = [v25 allObjects];

        id v27 = [v26 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v68;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v68 != v29) {
                objc_enumerationMutation(v26);
              }
              [*(id *)(*((void *)&v67 + 1) + 8 * i) timeTracker:self didBeginTrackingSession:v18 trackerEventType:a5 asset:v19 readingFeatureFlags:a11];
            }
            id v28 = [v26 countByEnumeratingWithState:&v67 objects:v75 count:16];
          }
          while (v28);
        }

        id v31 = BCBookPromotionLog();
        uint64_t v24 = v20;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v72 = v18;
          __int16 v73 = 2112;
          id v74 = v20;
          _os_log_impl(&def_7D91C, v31, OS_LOG_TYPE_DEFAULT, "Beginning tracking session %{public}@ for asset %@.", buf, 0x16u);
        }

        id v66 = 0;
        [(BCBookReadingTimeTracker *)self _mocq_trackSessionBegin:v18 assetID:v20 error:&v66];
        id v52 = v66;
        if (v56)
        {
          v23 = v53;
          if (a5 != 4)
          {
            id v32 = BCBookPromotionLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v72 = v20;
              _os_log_impl(&def_7D91C, v32, OS_LOG_TYPE_INFO, "Updating asset %@ right away since it's already promoted", buf, 0xCu);
            }

            [(BCBookReadingTimeTracker *)self promoteTrackedAsset:v20 promoteIfNotTracked:1];
          }
          id v33 = v54;
          id v34 = objc_retainBlock(v54);
          id v35 = v34;
          if (v34) {
            (*((void (**)(id, uint64_t, id))v34 + 2))(v34, 1, v19);
          }
        }
        else
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_160B98;
          v59[3] = &unk_2C7E10;
          id v60 = v20;
          v61 = self;
          BOOL v65 = a10;
          id v62 = v18;
          unint64_t v63 = a5;
          int64_t v64 = a11;
          id v45 = objc_retainBlock(v59);
          ((void (*)(void))v45[2])();
          id v33 = v54;
          id v46 = objc_retainBlock(v54);
          objc_super v47 = v46;
          v23 = v53;
          if (v46) {
            (*((void (**)(id, void, id))v46 + 2))(v46, 0, v19);
          }

          id v35 = v60;
        }

        id v21 = v33;
      }
      goto LABEL_50;
    }
    id v55 = v21;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_160C94;
    block[3] = &unk_2C3C50;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    CFStringRef v38 = BCBookPromotionLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v72 = v18;
      __int16 v73 = 2112;
      id v74 = v20;
      _os_log_impl(&def_7D91C, v38, OS_LOG_TYPE_DEFAULT, "Ending tracking session %{public}@ for asset %@.", buf, 0x16u);
    }

    id v57 = 0;
    [(BCBookReadingTimeTracker *)self _mocq_trackSessionEnd:v18 assetID:v20 error:&v57];
    id v39 = v57;
    CFStringRef v40 = v39;
    if (v56)
    {
      if (a5 - 4 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        NSErrorUserInfoKey v41 = BCBookPromotionLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v72 = v20;
          _os_log_impl(&def_7D91C, v41, OS_LOG_TYPE_INFO, "Updating asset %@ right away since it's already promoted", buf, 0xCu);
        }

        [(BCBookReadingTimeTracker *)self promoteTrackedAsset:v20 promoteIfNotTracked:1];
      }
      id v42 = objc_retainBlock(v55);
      v43 = v42;
      if (v42) {
        (*((void (**)(id, BOOL, id))v42 + 2))(v42, a9, v19);
      }

      uint64_t v24 = v20;
      goto LABEL_48;
    }
    if (a9)
    {
      v44 = BCBookPromotionLog();
      uint64_t v24 = v20;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_1EF948();
      }

      id v21 = v55;
      [(BCBookReadingTimeTracker *)self _mocq_runBookPromotionAlgorithmForAssetID:v20 libraryAsset:v19 isSample:a10 successCompletion:v55 failureCompletion:v23];
      goto LABEL_49;
    }
    uint64_t v24 = v20;
    if (v39)
    {
      v48 = objc_retainBlock(v23);
      v49 = v48;
      if (v48)
      {
        v50 = v48[2];
LABEL_46:
        v50();
      }
    }
    else
    {
      v51 = (void (**)(void))objc_retainBlock(v55);
      v49 = v51;
      if (v51)
      {
        v50 = v51[2];
        goto LABEL_46;
      }
    }

LABEL_48:
    id v21 = v55;
LABEL_49:

    goto LABEL_50;
  }
  id v36 = v21;
  NSErrorUserInfoKey v37 = BCBookPromotionLog();
  uint64_t v24 = v20;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v72 = v18;
    __int16 v73 = 2112;
    id v74 = v20;
    _os_log_impl(&def_7D91C, v37, OS_LOG_TYPE_INFO, "Updating session %{public}@ for untracked asset %@.", buf, 0x16u);
  }

  [(BCBookReadingTimeTracker *)self _mocq_trackSessionUpdate:v18 assetID:v20 error:0];
  id v21 = v36;
  [(BCBookReadingTimeTracker *)self _mocq_runBookPromotionAlgorithmForAssetID:v20 libraryAsset:v19 isSample:a10 successCompletion:v36 failureCompletion:v23];
LABEL_50:
}

- (void)trackReadingSessionBeganWithAssetID:(id)a3 sessionID:(id)a4 trackerEventType:(unint64_t)a5 readingFeatureFlags:(int64_t)a6 completion:(id)a7
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_160DC4;
  v15[3] = &unk_2CA630;
  id v16 = a7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_160E28;
  v13[3] = &unk_2C8818;
  id v14 = v16;
  id v12 = v16;
  [(BCBookReadingTimeTracker *)self _handleReadingWithAssetID:a3 sessionID:a4 sessionEvent:0 trackerEventType:a5 readingFeatureFlags:a6 successCompletion:v15 failureCompletion:v13];
}

- (void)trackReadingSessionEndedWithAssetID:(id)a3 sessionID:(id)a4 trackerEventType:(unint64_t)a5 readingFeatureFlags:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_161020;
  v21[3] = &unk_2CA658;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  unint64_t v25 = a5;
  int64_t v26 = a6;
  id v24 = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_161320;
  v18[3] = &unk_2CA680;
  id v19 = v23;
  id v20 = v24;
  id v15 = v24;
  id v16 = v23;
  id v17 = v12;
  [(BCBookReadingTimeTracker *)self _handleReadingWithAssetID:v17 sessionID:v16 sessionEvent:1 trackerEventType:a5 readingFeatureFlags:a6 successCompletion:v21 failureCompletion:v18];
}

- (void)_readingTimeTrackerGetAssetDetailsForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(BCBookReadingTimeTracker *)self libraryDelegate];

  if (!v8) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/BookPromotionEngine/BCBookReadingTimeTracker.m", 585, (uint64_t)"-[BCBookReadingTimeTracker _readingTimeTrackerGetAssetDetailsForAssetID:completion:]", (uint64_t)"self.libraryDelegate", 0, v9, v10, v11, v16);
  }
  id v12 = [(BCBookReadingTimeTracker *)self libraryDelegate];

  if (v12)
  {
    id v13 = [(BCBookReadingTimeTracker *)self libraryDelegate];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_161520;
    v17[3] = &unk_2CA6A8;
    id v19 = v7;
    v17[4] = self;
    id v18 = v6;
    [v13 readingTimeTracker:self isAssetTrackedAsRecent:v18 completion:v17];
  }
  else
  {
    id v14 = objc_retainBlock(v7);
    id v15 = v14;
    if (v14) {
      (*((void (**)(id, void, void, double))v14 + 2))(v14, 0, 0, 0.0);
    }
  }
}

- (void)purgeRecentBooks
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_161A64;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_349458 != -1) {
    dispatch_once(&qword_349458, block);
  }
}

- (void)_purgeRecentBooksList:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(BCBookReadingTimeTracker *)self moc];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_161C50;
  v9[3] = &unk_2CA710;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9];
}

- (BOOL)_readyToCheck
{
  BOOL v3 = [(BCBookReadingTimeTracker *)self readyToSeedRecentBooksList];
  if (v3)
  {
    LOBYTE(v3) = [(BCBookReadingTimeTracker *)self globalMetadataFetched];
  }
  return v3;
}

- (void)_BDSCloudGlobalMetadataManagerFetchedRecordsChanged:(id)a3
{
  objc_super v4 = [(BCBookReadingTimeTracker *)self seedRecentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1622B0;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)seedRecentBooksList:(unint64_t)a3
{
  unsigned __int8 v5 = [(BCBookReadingTimeTracker *)self seedRecentQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_162384;
  v6[3] = &unk_2C3C28;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)_seedRecentBooksList
{
  if ([(BCBookReadingTimeTracker *)self _readyToCheck])
  {
    BOOL v3 = [(BCBookReadingTimeTracker *)self libraryDelegate];
    +[BDSCloudGlobalMetadataManager sharedManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1624D8;
    v7[3] = &unk_2CA778;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v3;
    id v10 = self;
    id v4 = v3;
    id v5 = v8;
    [v5 metadataValueForKey:@"BCDeviceWasSeededWithARecentsList" completion:v7];
    if (!v5)
    {
      id v6 = BCBookPromotionLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1EFE70();
      }
    }
  }
}

- (void)addPromotionObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162800;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removePromotionObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162930;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addSessionObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162A60;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeSessionObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_162B90;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_persistentStoreURL
{
  v2 = [(BCBookReadingTimeTracker *)self _persistentStoreDirectory];
  BOOL v3 = [v2 URLByAppendingPathComponent:@"BCRecentlyOpenedBooksDB.sqlite"];

  return v3;
}

- (id)_persistentStoreDirectory
{
  BOOL v3 = [(BCBookReadingTimeTracker *)self overridePersistentDirectory];

  if (v3)
  {
    id v4 = [(BCBookReadingTimeTracker *)self overridePersistentDirectory];
  }
  else
  {
    id v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    id v4 = [v5 lastObject];
  }
  id v6 = [v4 stringByAppendingPathComponent:@"BCRecentlyOpenedBooksDB"];
  id v7 = +[NSURL fileURLWithPath:v6 isDirectory:1];

  return v7;
}

- (BOOL)_createPersistentDirectoryIfNeeded
{
  v2 = [(BCBookReadingTimeTracker *)self _persistentStoreDirectory];
  BOOL v3 = +[NSFileManager defaultManager];
  id v8 = 0;
  unsigned __int8 v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    id v6 = BCBookPromotionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1EFEA4();
    }
  }
  return v4;
}

- (id)_fetchRequestForReadingSession:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCAssetReadingSession"];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = +[NSPredicate predicateWithFormat:@"%K == %@", @"assetID", v3];

  [v4 setPredicate:v5];

  return v4;
}

- (void)_cleanupFinishedBooksFromLibraryExcluding:(id)a3
{
  id v4 = a3;
  id v5 = [(BCBookReadingTimeTracker *)self libraryDelegate];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_162F18;
  v6[3] = &unk_2CA590;
  v6[4] = self;
  [v5 readingTimeTracker:self cleanupFinishedBooksExcluding:v4 completion:v6];
}

- (void)_cleanupBooksMarkedAsFinished:(id)a3
{
  id v4 = a3;
  id v5 = [(BCBookReadingTimeTracker *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_16305C;
  v7[3] = &unk_2C3AF8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)promoteTrackedAsset:(id)a3 promoteIfNotTracked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BCBookReadingTimeTracker *)self libraryDelegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_163474;
  v9[3] = &unk_2CA7A0;
  BOOL v12 = v4;
  id v10 = v6;
  BOOL v11 = self;
  id v8 = v6;
  [v7 readingTimeTracker:self updateRecentBook:v8 promoteIfNotTracked:v4 completion:v9];
}

- (id)_mocq_readingSessionWithAssetID:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCAssetReadingSession"];
  [v8 setReturnsObjectsAsFaults:0];
  id v9 = [v6 UUIDString];

  id v10 = +[NSPredicate predicateWithFormat:@"%K == %@ && %K == %@", @"assetID", v7, @"sessionID", v9];

  [v8 setPredicate:v10];
  BOOL v11 = [(BCBookReadingTimeTracker *)self moc];
  id v17 = 0;
  BOOL v12 = [v11 executeFetchRequest:v8 error:&v17];
  id v13 = v17;

  if (!v12 && v13)
  {
    id v14 = BCBookPromotionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1F004C();
    }
  }
  id v15 = [v12 firstObject];

  return v15;
}

- (void)_mocq_promoteAssetID:(id)a3
{
  id v4 = a3;
  id v5 = BCBookPromotionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "Promoting %@ to recent books list.", (uint8_t *)&v9, 0xCu);
  }

  if (BUIsRunningTests())
  {
    id v6 = [(BCBookReadingTimeTracker *)self moc];
    id v7 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCTrackedAsset" inManagedObjectContext:v6];

    [v7 setAssetID:v4];
    id v8 = +[NSDate date];
    [v7 setLastOpenedDate:v8];
  }
  [(BCBookReadingTimeTracker *)self promoteTrackedAsset:v4 promoteIfNotTracked:1];
}

- (void)_mocq_runBookPromotionAlgorithmForAssetID:(id)a3 libraryAsset:(id)a4 isSample:(BOOL)a5 successCompletion:(id)a6 failureCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = _os_activity_create(&def_7D91C, "Books/reading-promotion-readingNow", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_163D64;
  v21[3] = &unk_2CA7C8;
  BOOL v27 = a5;
  id v22 = v12;
  id v23 = self;
  id v25 = v15;
  id v26 = v14;
  id v24 = v13;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  id v20 = v12;
  os_activity_apply(v16, v21);
}

- (id)mq_trackedAssetForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCTrackedAsset"];
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchLimit:1];
  id v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"assetID", v4];

  [v5 setPredicate:v6];
  id v7 = [(BCBookReadingTimeTracker *)self moc];
  id v13 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v13];
  id v9 = v13;

  if (!v8 && v9)
  {
    id v10 = BCBookPromotionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1F0184();
    }
  }
  BOOL v11 = [v8 firstObject];

  return v11;
}

- (BOOL)_mocq_trackSessionBegin:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(BCBookReadingTimeTracker *)self _mocq_readingSessionWithAssetID:v9 sessionID:v8];
  if (v10)
  {
    BOOL v11 = (void *)v10;
    id v12 = BCBookPromotionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1F0254();
    }

    id v13 = +[NSDate date];
    [v11 setTimeOpened:v13];

    id v14 = [v8 UUIDString];
    [v11 setSessionID:v14];
  }
  else
  {
    id v15 = [(BCBookReadingTimeTracker *)self moc];
    BOOL v11 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCAssetReadingSession" inManagedObjectContext:v15];

    uint64_t v16 = +[NSDate date];
    [v11 setTimeOpened:v16];

    id v17 = [v8 UUIDString];
    [v11 setSessionID:v17];

    [v11 setAssetID:v9];
  }
  id v18 = [(BCBookReadingTimeTracker *)self moc];
  unsigned __int8 v19 = [v18 save:a5];

  if ((v19 & 1) == 0)
  {
    id v20 = BCBookPromotionLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1F01EC();
    }
  }
  return v19;
}

- (BOOL)_mocq_trackSessionEnd:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(BCBookReadingTimeTracker *)self _mocq_readingSessionWithAssetID:v8 sessionID:a3];
  if (v9)
  {
    uint64_t v10 = +[NSDate date];
    [v9 setTimeClosed:v10];
  }
  else
  {
    uint64_t v10 = BCBookPromotionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1F0328();
    }
  }

  BOOL v11 = [(BCBookReadingTimeTracker *)self moc];
  unsigned __int8 v12 = [v11 save:a5];

  if ((v12 & 1) == 0)
  {
    id v13 = BCBookPromotionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1F02BC();
    }
  }
  return v12;
}

- (BOOL)_mocq_trackSessionUpdate:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(BCBookReadingTimeTracker *)self _mocq_readingSessionWithAssetID:v8 sessionID:a3];
  if (v9)
  {
    uint64_t v10 = +[NSDate date];
    [v9 setTimeUpdated:v10];
  }
  else
  {
    uint64_t v10 = BCBookPromotionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1F0328();
    }
  }

  BOOL v11 = [(BCBookReadingTimeTracker *)self moc];
  unsigned __int8 v12 = [v11 save:a5];

  if ((v12 & 1) == 0)
  {
    id v13 = BCBookPromotionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1F02BC();
    }
  }
  return v12;
}

- (void)_mq_startBookPromotionTimerForSession:(id)a3 assetID:(id)a4 isSample:(BOOL)a5 trackerEventType:(unint64_t)a6 readingFeatureFlags:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [(BCBookReadingTimeTracker *)self bookPromotionTimer];
  [v14 invalidate];

  id v15 = +[BCJSConfiguration sharedInstance];
  uint64_t v16 = v15;
  if (a5) {
    [v15 timeThresholdForSamplePromotion];
  }
  else {
  id v17 = [v15 timeThresholdForPromotion];
  }
  id v18 = [v17 longLongValue];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1649B8;
  v21[3] = &unk_2CA818;
  id v22 = v12;
  id v23 = v13;
  id v24 = self;
  id v25 = v18;
  int64_t v26 = a7;
  unint64_t v27 = a6;
  id v19 = v13;
  id v20 = v12;
  [(BCBookReadingTimeTracker *)self _readingTimeTrackerGetAssetDetailsForAssetID:v19 completion:v21];
}

- (void)_handledUpdateReadingSessionTimer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v12 = [v5 objectForKeyedSubscript:@"SessionID"];

  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"AssetID"];

  objc_opt_class();
  id v8 = [v4 userInfo];

  id v9 = [v8 objectForKeyedSubscript:@"ReadingFeatureFlagsKey"];
  uint64_t v10 = BUDynamicCast();
  id v11 = [v10 integerValue];

  [(BCBookReadingTimeTracker *)self _mq_clearBookPromotionTimer];
  [(BCBookReadingTimeTracker *)self _handleReadingWithAssetID:v7 sessionID:v12 sessionEvent:2 trackerEventType:8 readingFeatureFlags:v11 successCompletion:0 failureCompletion:0];
}

- (void)_mq_clearBookPromotionTimer
{
  id v3 = [(BCBookReadingTimeTracker *)self bookPromotionTimer];
  [v3 invalidate];

  [(BCBookReadingTimeTracker *)self setBookPromotionTimer:0];
}

- (int64_t)_mocq_deleteSessionsForAsset:(id)a3 beforeTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCAssetReadingSession"];
  [v8 setReturnsObjectsAsFaults:0];
  id v9 = +[NSPredicate predicateWithFormat:@"%K == %@ && %K <= %@", @"assetID", v6, @"timeOpened", v7];

  [v8 setPredicate:v9];
  id v10 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v8];
  [v10 setResultType:2];
  id v11 = [(BCBookReadingTimeTracker *)self moc];
  id v20 = 0;
  id v12 = [v11 executeRequest:v10 error:&v20];
  id v13 = v20;

  objc_opt_class();
  id v14 = [v12 result];
  id v15 = BUDynamicCast();
  id v16 = [v15 integerValue];

  id v17 = BCBookPromotionLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&def_7D91C, v17, OS_LOG_TYPE_INFO, "Deleted %{public}ld rows for asset: %@", buf, 0x16u);
  }

  if (v13)
  {
    id v18 = BCBookPromotionLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1F035C();
    }
  }
  return (int64_t)v16;
}

- (id)_mocq_assetToPurgeForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCAssetToPurge"];
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchLimit:1];
  id v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"assetID", v4];

  [v5 setPredicate:v6];
  id v7 = [(BCBookReadingTimeTracker *)self moc];
  id v13 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v13];
  id v9 = v13;

  if (v9)
  {
    id v10 = BCBookPromotionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1F03C4();
    }
  }
  id v11 = [v8 firstObject];

  return v11;
}

- (void)_mocq_deleteAssetToPurgeForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = BCBookPromotionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "Purge Tracking: delete asset=%@", buf, 0xCu);
  }

  id v6 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCTrackedAsset"];
  id v7 = +[NSPredicate predicateWithFormat:@"%K == %@", @"assetID", v4];
  [v6 setPredicate:v7];

  id v8 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v6];
  id v9 = [(BCBookReadingTimeTracker *)self psc];
  id v10 = [(BCBookReadingTimeTracker *)self moc];
  id v14 = 0;
  id v11 = [v9 executeRequest:v8 withContext:v10 error:&v14];
  id v12 = v14;

  if (v12)
  {
    id v13 = BCBookPromotionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1F042C();
    }
  }
}

- (BOOL)_mocq_updateLaunchTrackingForAssets:(id)a3 error:(id *)a4
{
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [(BCBookReadingTimeTracker *)self _mocq_assetToPurgeForAssetID:v10];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = [v11 launches] + 1;
          id v14 = v12;
        }
        else
        {
          id v15 = [(BCBookReadingTimeTracker *)self moc];
          id v12 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCAssetToPurge" inManagedObjectContext:v15];

          [v12 setAssetID:v10];
          id v14 = v12;
          uint64_t v13 = 1;
        }
        [v14 setLaunches:v13];
        id v16 = BCBookPromotionLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v12 assetID];
          id v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 launches]);
          *(_DWORD *)buf = 138412546;
          id v31 = v17;
          __int16 v32 = 2112;
          id v33 = v18;
          _os_log_impl(&def_7D91C, v16, OS_LOG_TYPE_DEFAULT, "Purge Tracking: asset=%@ launches=%@", buf, 0x16u);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v7);
  }
  id v19 = [(BCBookReadingTimeTracker *)self moc];
  id v25 = 0;
  unsigned __int8 v20 = [v19 save:&v25];
  id v21 = v25;

  if ((v20 & 1) == 0)
  {
    id v22 = BCBookPromotionLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1F0494();
    }
  }
  if (a4) {
    *a4 = v21;
  }

  return v21 == 0;
}

- (void)_fetchBookStatusWithAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BCBookReadingTimeTracker *)self moc];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_165620;
  v11[3] = &unk_2C3A40;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)_fetchRecentBooksList:(id)a3
{
  id v4 = a3;
  id v5 = [(BCBookReadingTimeTracker *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1659F4;
  v7[3] = &unk_2C4370;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)_sessionExistsForSessionID:(id)a3 assetID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BCBookReadingTimeTracker *)self moc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_165D4C;
  v15[3] = &unk_2C4480;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [v11 performBlock:v15];
}

- (BCBookReadingTimeTrackerLibraryDelegate)libraryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryDelegate);

  return (BCBookReadingTimeTrackerLibraryDelegate *)WeakRetained;
}

- (void)setLibraryDelegate:(id)a3
{
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSPersistentStoreCoordinator)psc
{
  return self->_psc;
}

- (void)setPsc:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (NSString)overridePersistentDirectory
{
  return self->_overridePersistentDirectory;
}

- (void)setOverridePersistentDirectory:(id)a3
{
}

- (OS_dispatch_queue)seedRecentQueue
{
  return self->_seedRecentQueue;
}

- (void)setSeedRecentQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)globalMetadataFetched
{
  return self->_globalMetadataFetched;
}

- (void)setGlobalMetadataFetched:(BOOL)a3
{
  self->_globalMetadataFetched = a3;
}

- (BOOL)readyToSeedRecentBooksList
{
  return self->_readyToSeedRecentBooksList;
}

- (void)setReadyToSeedRecentBooksList:(BOOL)a3
{
  self->_readyToSeedRecentBooksList = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSTimer)bookPromotionTimer
{
  return self->_bookPromotionTimer;
}

- (void)setBookPromotionTimer:(id)a3
{
}

- (NSHashTable)promotionObservers
{
  return self->_promotionObservers;
}

- (void)setPromotionObservers:(id)a3
{
}

- (NSHashTable)sessionObservers
{
  return self->_sessionObservers;
}

- (void)setSessionObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionObservers, 0);
  objc_storeStrong((id *)&self->_promotionObservers, 0);
  objc_storeStrong((id *)&self->_bookPromotionTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_seedRecentQueue, 0);
  objc_storeStrong((id *)&self->_overridePersistentDirectory, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_psc, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_libraryDelegate);
}

@end