@interface BKUbiquitousDocumentsController
- (BKUbiquitousBooksHosting)ubiquitousBooksPlistHost;
- (BKUbiquitousDocumentsController)initWithUbiquityStatusMonitor:(id)a3 ubiquitousBooksPlistHost:(id)a4 ubiquityEligibleBooksProvider:(id)a5;
- (BKUbiquityEligibleBooksProviding)ubiquityEligibleBooksProvider;
- (BOOL)hasEverReceivedUbiquityQuota;
- (BOOL)initialMetadataQueryWasHandled;
- (BOOL)pendingQuotaFetch;
- (BUCoalescingCallBlock)ongoingMigrationAttemptTimer;
- (IMUbiquityQuotaFetcher)quotaFetcher;
- (IMUbiquityStatusMonitor)ubiquityStatusMonitor;
- (NSMutableArray)ongoingMigrationAttemptObservers;
- (NSMutableArray)pendingQuotaFetchMigrationBlocks;
- (NSMutableDictionary)assetIDToFileSizeMapPendingUpload;
- (NSMutableDictionary)assetIDToFileSizeMapUploadedSinceLastQuotaReceived;
- (NSMutableSet)booksThatEncounteredUploadError;
- (NSMutableSet)ongoingMigrationAttemptAssetIDs;
- (NSOperationQueue)bookOperationsQueue;
- (OS_dispatch_queue)migrationQueue;
- (id)_permanentOrTemporaryAssetIDsWithAssetID:(id)a3 temporaryAssetID:(id)a4;
- (id)_sortedAssetsFromEligibleAssets:(id)a3 moc:(id)a4;
- (id)p_generateNotAllBooksEligibleToMoveToUbiquityError;
- (id)p_generateUbiquityNotEnabledError;
- (int64_t)boq_spaceOccupiedByBooksMigratedSinceLastQuotaCheck;
- (int64_t)ongoingMigrationAttemptOutstandingMigrateAllAttempts;
- (int64_t)ubiquityAvailableSpace;
- (void)_checkTimeoutForOngoingMigrationAttempt;
- (void)_decrementOrDoneOngoingMigrateAllAttempt;
- (void)_enterOngoingMigrateAllAttempt;
- (void)_leaveOngoingMigrateAllAttempt;
- (void)_makeAllEligibleLocalBooksUbiquitousWithCompletion:(id)a3;
- (void)_migrateBookToUbiquity:(id)a3 completion:(id)a4;
- (void)_migrateBooksToUbiquityIfNeededWithCompletion:(id)a3;
- (void)_notifyOngoingMigrationAttemptCompletion:(id)a3 hasPendingChange:(BOOL)a4;
- (void)_removeAssetIDsForOngoingMigrationAttempt:(id)a3;
- (void)al_addAssetIDsForOngoingMigrationAttempt:(id)a3;
- (void)boq_addPendingUploadQuotaCompensationForAssets:(id)a3;
- (void)boq_addUploadedQuotaCompensationForAssetIDs:(id)a3;
- (void)boq_handleSpaceAvailableReceivedWithFreeBytes:(int64_t)a3 serverError:(id)a4;
- (void)boq_migrateBooksThatWillFitToUbiquity:(id)a3 completion:(id)a4;
- (void)boq_migrateBooksThatWillFitToUbiquityAfterQuotaFetch:(id)a3 completion:(id)a4;
- (void)boq_removeQuotaCompensationForAssets:(id)a3;
- (void)boq_removeUploadedQuotaCompensation;
- (void)didHandleInitialQuery;
- (void)makeAllEligibleLocalBooksUbiquitousWithCompletion:(id)a3;
- (void)makeAllUbiquitousBooksLocalWithCompletion:(id)a3;
- (void)migrateBookToUbiquity:(id)a3 completion:(id)a4;
- (void)migrateBooksToUbiquityIfNeededWithCompletion:(id)a3;
- (void)p_postStatusNotificationForAssets:(id)a3 withState:(int64_t)a4;
- (void)p_updateCachedURLsFrom:(id)a3 to:(id)a4;
- (void)reportUploadCompleteForBooks:(id)a3;
- (void)reportUploadErrorForBooks:(id)a3;
- (void)setAssetIDToFileSizeMapPendingUpload:(id)a3;
- (void)setAssetIDToFileSizeMapUploadedSinceLastQuotaReceived:(id)a3;
- (void)setBookOperationsQueue:(id)a3;
- (void)setBooksThatEncounteredUploadError:(id)a3;
- (void)setHasEverReceivedUbiquityQuota:(BOOL)a3;
- (void)setInitialMetadataQueryWasHandled:(BOOL)a3;
- (void)setMigrationQueue:(id)a3;
- (void)setOngoingMigrationAttemptAssetIDs:(id)a3;
- (void)setOngoingMigrationAttemptObservers:(id)a3;
- (void)setOngoingMigrationAttemptOutstandingMigrateAllAttempts:(int64_t)a3;
- (void)setOngoingMigrationAttemptTimer:(id)a3;
- (void)setPendingQuotaFetch:(BOOL)a3;
- (void)setPendingQuotaFetchMigrationBlocks:(id)a3;
- (void)setQuotaFetcher:(id)a3;
- (void)setUbiquitousBooksPlistHost:(id)a3;
- (void)setUbiquityAvailableSpace:(int64_t)a3;
- (void)setUbiquityEligibleBooksProvider:(id)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)waitForOngoingMigrationAttemptToFinishWithAssetID:(id)a3 temporaryAssetID:(id)a4 completion:(id)a5;
@end

@implementation BKUbiquitousDocumentsController

- (BKUbiquitousDocumentsController)initWithUbiquityStatusMonitor:(id)a3 ubiquitousBooksPlistHost:(id)a4 ubiquityEligibleBooksProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v41.receiver = self;
  v41.super_class = (Class)BKUbiquitousDocumentsController;
  v11 = [(BKUbiquitousDocumentsController *)&v41 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_ubiquityStatusMonitor, v8);
    objc_storeWeak((id *)&v12->_ubiquitousBooksPlistHost, v9);
    objc_storeWeak((id *)&v12->_ubiquityEligibleBooksProvider, v10);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.ibooks.BKUbiquitousDocumentsController.migrationQueue", 0);
    migrationQueue = v12->_migrationQueue;
    v12->_migrationQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_opt_new();
    bookOperationsQueue = v12->_bookOperationsQueue;
    v12->_bookOperationsQueue = (NSOperationQueue *)v15;

    [(NSOperationQueue *)v12->_bookOperationsQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v12->_bookOperationsQueue setQualityOfService:17];
    uint64_t v17 = objc_opt_new();
    booksThatEncounteredUploadError = v12->_booksThatEncounteredUploadError;
    v12->_booksThatEncounteredUploadError = (NSMutableSet *)v17;

    uint64_t v19 = objc_opt_new();
    quotaFetcher = v12->_quotaFetcher;
    v12->_quotaFetcher = (IMUbiquityQuotaFetcher *)v19;

    uint64_t v21 = objc_opt_new();
    pendingQuotaFetchMigrationBlocks = v12->_pendingQuotaFetchMigrationBlocks;
    v12->_pendingQuotaFetchMigrationBlocks = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    assetIDToFileSizeMapPendingUpload = v12->_assetIDToFileSizeMapPendingUpload;
    v12->_assetIDToFileSizeMapPendingUpload = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    assetIDToFileSizeMapUploadedSinceLastQuotaReceived = v12->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived;
    v12->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived = (NSMutableDictionary *)v25;

    v12->_ongoingMigrationAttemptAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v27 = objc_opt_new();
    ongoingMigrationAttemptAssetIDs = v12->_ongoingMigrationAttemptAssetIDs;
    v12->_ongoingMigrationAttemptAssetIDs = (NSMutableSet *)v27;

    uint64_t v29 = objc_opt_new();
    ongoingMigrationAttemptObservers = v12->_ongoingMigrationAttemptObservers;
    v12->_ongoingMigrationAttemptObservers = (NSMutableArray *)v29;

    objc_initWeak(&location, v12);
    id v31 = objc_alloc((Class)BUCoalescingCallBlock);
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_1001C10A0;
    v38 = &unk_100A451B8;
    objc_copyWeak(&v39, &location);
    v32 = (BUCoalescingCallBlock *)[v31 initWithNotifyBlock:&v35 blockDescription:@"ongoingMigrationAttemptTimer"];
    ongoingMigrationAttemptTimer = v12->_ongoingMigrationAttemptTimer;
    v12->_ongoingMigrationAttemptTimer = v32;

    -[BUCoalescingCallBlock setCoalescingDelay:](v12->_ongoingMigrationAttemptTimer, "setCoalescingDelay:", 5.0, v35, v36, v37, v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)makeAllUbiquitousBooksLocalWithCompletion:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C1234;
  v10[3] = &unk_100A47898;
  v10[4] = self;
  id v11 = a3;
  id v4 = v11;
  v5 = objc_retainBlock(v10);
  v6 = [(BKUbiquitousDocumentsController *)self migrationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C12FC;
  v8[3] = &unk_100A44120;
  v8[4] = self;
  id v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);
}

- (void)makeAllEligibleLocalBooksUbiquitousWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKUbiquitousDocumentsController *)self _enterOngoingMigrateAllAttempt];
  v5 = +[BKLibraryManager defaultManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C178C;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addCustomOperationBlock:v7];
}

- (void)_makeAllEligibleLocalBooksUbiquitousWithCompletion:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C19B0;
  v10[3] = &unk_100A47898;
  v10[4] = self;
  id v11 = a3;
  id v4 = v11;
  v5 = objc_retainBlock(v10);
  id v6 = [(BKUbiquitousDocumentsController *)self migrationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C1A78;
  v8[3] = &unk_100A44120;
  v8[4] = self;
  id v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);
}

- (void)migrateBooksToUbiquityIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKUbiquitousDocumentsController *)self _enterOngoingMigrateAllAttempt];
  v5 = +[BKLibraryManager defaultManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C1F98;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addCustomOperationBlock:v7];
}

- (void)_migrateBooksToUbiquityIfNeededWithCompletion:(id)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C21E0;
  v11[3] = &unk_100A4A370;
  v11[4] = self;
  id v12 = a3;
  id v4 = v12;
  v5 = objc_retainBlock(v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[BKUbiquitousDocumentsController] Attempting to migrateBooksToUbiquityIfNeededWithCompletion:", buf, 2u);
  }
  id v6 = [(BKUbiquitousDocumentsController *)self migrationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C24EC;
  v8[3] = &unk_100A44120;
  v8[4] = self;
  id v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);
}

- (void)migrateBookToUbiquity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100007100;
  v24[4] = sub_10000725C;
  id v8 = [v6 assetID];
  id v9 = [v6 temporaryAssetID];
  id v25 = [(BKUbiquitousDocumentsController *)self _permanentOrTemporaryAssetIDsWithAssetID:v8 temporaryAssetID:v9];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v20 = sub_1001C2CB0;
  uint64_t v21 = &unk_100A44170;
  v22 = self;
  uint64_t v23 = v24;
  id v10 = v19;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  v20((uint64_t)v10);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

  id v11 = [(BKUbiquitousDocumentsController *)self ongoingMigrationAttemptTimer];
  [v11 signalWithCompletion:&stru_100A4A390];

  id v12 = +[BKLibraryManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001C2CC8;
  v15[3] = &unk_100A4A3E0;
  v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  v18 = v24;
  id v14 = v7;
  id v17 = v14;
  [v12 addCustomOperationBlock:v15];

  _Block_object_dispose(v24, 8);
}

- (void)_migrateBookToUbiquity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C2F58;
  v17[3] = &unk_100A4A408;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  id v19 = v7;
  id v9 = v7;
  id v10 = objc_retainBlock(v17);
  id v11 = [(BKUbiquitousDocumentsController *)self migrationQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C3070;
  v14[3] = &unk_100A45338;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)boq_migrateBooksThatWillFitToUbiquityAfterQuotaFetch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(BKUbiquitousDocumentsController *)self setPendingQuotaFetch:1];
  id v8 = [(BKUbiquitousDocumentsController *)self quotaFetcher];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C3C98;
  v11[3] = &unk_100A4A458;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchUserQuotaWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)boq_migrateBooksThatWillFitToUbiquity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v47 = a4;
  v49 = +[NSMutableSet setWithArray:v6];
  v48 = objc_opt_new();
  int64_t v45 = [(BKUbiquitousDocumentsController *)self boq_spaceOccupiedByBooksMigratedSinceLastQuotaCheck];
  id v7 = (char *)[(BKUbiquitousDocumentsController *)self ubiquityAvailableSpace] - v45;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v54;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v13 = [v12 assetID:v45];
        if (v13)
        {
          id v14 = (void *)v13;
          id v15 = [v12 url];

          if (v15)
          {
            id v16 = objc_alloc((Class)BKLibraryFileSizeManagerCacheItemRequest);
            id v17 = [v12 assetID];
            id v18 = [v12 url];
            id v19 = [v16 initWithCacheItemRequestWithAssetID:v17 assetURL:v18];

            v20 = +[BKLibraryFileSizeManager sharedInstance];
            uint64_t v21 = [v20 synchronousFileSizeForCacheItemRequest:v19];

            if (v21)
            {
              v22 = [v21 longLongValue];
              uint64_t v23 = (char *)(v7 - v22);
              if ((uint64_t)v7 >= (uint64_t)v22)
              {
                [v48 addObject:v12];
                [v49 removeObject:v12];
                id v7 = v23;
              }
            }
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v9);
  }

  v24 = v48;
  if ([v49 count])
  {
    id v25 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (char *)[v49 count];
      *(_DWORD *)buf = 134217984;
      v58 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Marking %ld books with upload error since they wouldn't fit in iCloud", buf, 0xCu);
    }

    uint64_t v27 = [(BKUbiquitousDocumentsController *)self booksThatEncounteredUploadError];
    [v27 unionSet:v49];

    v28 = [v49 allObjects];
    [(BKUbiquitousDocumentsController *)self p_postStatusNotificationForAssets:v28 withState:10];
  }
  if (objc_msgSend(v48, "count", v45))
  {
    uint64_t v29 = [(BKUbiquitousDocumentsController *)self booksThatEncounteredUploadError];
    v30 = +[NSSet setWithArray:v48];
    [v29 minusSet:v30];

    id v31 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (char *)[v48 count];
      v33 = (char *)((unsigned char *)[(BKUbiquitousDocumentsController *)self ubiquityAvailableSpace]
                   - v7);
      int64_t v34 = [(BKUbiquitousDocumentsController *)self ubiquityAvailableSpace];
      *(_DWORD *)buf = 134218752;
      v58 = v32;
      __int16 v59 = 2048;
      v60 = v33;
      __int16 v61 = 2048;
      int64_t v62 = v34 - (void)v46;
      __int16 v63 = 2048;
      v64 = v46;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Will start migrating %ld books occupying %lld/%lld bytes (compensation: %lld)", buf, 0x2Au);
    }

    [(BKUbiquitousDocumentsController *)self boq_addPendingUploadQuotaCompensationForAssets:v48];
    v35 = [(BKUbiquitousDocumentsController *)self ubiquitousBooksPlistHost];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1001C44F0;
    v51[3] = &unk_100A46800;
    v51[4] = self;
    uint64_t v36 = v47;
    id v52 = v47;
    [v35 makeBooksUbiquitous:v48 completion:v51];
  }
  else
  {
    v37 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (char *)((unsigned char *)[(BKUbiquitousDocumentsController *)self ubiquityAvailableSpace]
                   - v7);
      id v39 = (char *)((unsigned char *)[(BKUbiquitousDocumentsController *)self ubiquityAvailableSpace]
                   - (unsigned char *)v46);
      v40 = [v49 valueForKey:@"assetID"];
      *(_DWORD *)buf = 134218754;
      v58 = v38;
      __int16 v59 = 2048;
      v60 = v39;
      v24 = v48;
      __int16 v61 = 2048;
      int64_t v62 = (int64_t)v46;
      __int16 v63 = 2112;
      v64 = v40;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Nothing to migrate, probably because nothing will fit. Avail: %lld/%lld bytes (compensation: %lld). booksToBeMarkedWithAnUploadError: [%@]", buf, 0x2Au);
    }
    objc_super v41 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [obj valueForKey:@"assetID"];
      *(_DWORD *)buf = 138412290;
      v58 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "calling callback after NOT migrating assetIDs [%@]", buf, 0xCu);
    }
    uint64_t v36 = v47;
    id v43 = objc_retainBlock(v47);
    v44 = v43;
    if (v43) {
      (*((void (**)(id, void, void))v43 + 2))(v43, 0, 0);
    }
  }
}

- (void)waitForOngoingMigrationAttemptToFinishWithAssetID:(id)a3 temporaryAssetID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BKUbiquitousDocumentsController *)self _permanentOrTemporaryAssetIDsWithAssetID:v8 temporaryAssetID:v9];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001C49E0;
  v37[3] = &unk_100A4A480;
  id v12 = v10;
  v37[4] = self;
  id v38 = v12;
  uint64_t v13 = objc_retainBlock(v37);
  if ([v11 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v48 = sub_100007100;
    v49 = sub_10000725C;
    id v50 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    uint64_t v27 = sub_1001C4AE8;
    v28 = &unk_100A4A4A8;
    uint64_t v29 = self;
    id v20 = v11;
    id v30 = v20;
    int64_t v34 = &v43;
    id v19 = v13;
    id v33 = v19;
    v35 = &v39;
    uint64_t v36 = buf;
    id v31 = v8;
    id v32 = v9;
    id v14 = v26;
    os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
    v27((uint64_t)v14);
    os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

    if (*((unsigned char *)v40 + 24))
    {
      id v15 = [(BKUbiquitousDocumentsController *)self ongoingMigrationAttemptTimer];
      [v15 signalWithCompletion:&stru_100A4A4C8];
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      *((unsigned char *)v44 + 24) = 1;
      id v16 = [(BKUbiquitousDocumentsController *)self ubiquityEligibleBooksProvider];
      uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001C4BB4;
      v21[3] = &unk_100A4A538;
      v21[4] = self;
      id v22 = v20;
      uint64_t v23 = v19;
      id v25 = &v39;
      id v24 = v12;
      [v16 fetchLocalAssetWithID:v17 completion:v21];
    }
    _Block_object_dispose(buf, 8);
  }
  if (!*((unsigned char *)v44 + 24))
  {
    id v18 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      *(void *)&uint8_t buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - No wait needed for %{mask.hash}@", buf, 0x16u);
    }

    [(BKUbiquitousDocumentsController *)self _notifyOngoingMigrationAttemptCompletion:v12 hasPendingChange:0];
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

- (void)al_addAssetIDsForOngoingMigrationAttempt:(id)a3
{
  id v4 = a3;
  v5 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 141558274;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Add assetIDs: %{mask.hash}@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(BKUbiquitousDocumentsController *)self ongoingMigrationAttemptAssetIDs];
  [v6 unionSet:v4];
}

- (void)_removeAssetIDsForOngoingMigrationAttempt:(id)a3
{
  id v4 = a3;
  v5 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Remove assetIDs: %{mask.hash}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v32 = sub_100007100;
  id v33 = sub_10000725C;
  id v34 = (id)objc_opt_new();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  uint64_t v21 = sub_1001C5318;
  id v22 = &unk_100A440F8;
  uint64_t v23 = self;
  id v15 = v4;
  id v24 = v15;
  id v25 = buf;
  id v6 = v20;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  v21((uint64_t)v6);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(*(void *)&buf[8] + 40);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = BKLibraryBookImportLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v11 assetIDs];
          *(_DWORD *)v26 = 141558274;
          uint64_t v27 = 1752392040;
          __int16 v28 = 2112;
          uint64_t v29 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Done waiting for %{mask.hash}@", v26, 0x16u);
        }
        id v14 = [v11 notifyBlock];
        [(BKUbiquitousDocumentsController *)self _notifyOngoingMigrationAttemptCompletion:v14 hasPendingChange:1];
      }
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v30 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_enterOngoingMigrateAllAttempt
{
  v3 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Enter 'migrate all' attempt", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C5568;
  v5[3] = &unk_100A43D60;
  v5[4] = self;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  sub_1001C5568((uint64_t)v5);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);
  id v4 = [(BKUbiquitousDocumentsController *)self ongoingMigrationAttemptTimer];
  [v4 signalWithCompletion:&stru_100A4A558];
}

- (void)_leaveOngoingMigrateAllAttempt
{
  v3 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Leave 'migrate all' attempt", v4, 2u);
  }

  [(BKUbiquitousDocumentsController *)self _decrementOrDoneOngoingMigrateAllAttempt];
}

- (void)_decrementOrDoneOngoingMigrateAllAttempt
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100007100;
  id v15 = sub_10000725C;
  id v16 = (id)objc_opt_new();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_1001C5804;
  id v8 = &unk_100A44170;
  uint64_t v9 = self;
  id v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

  if ([(id)v12[5] count])
  {
    id v4 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v12[5];
      *(_DWORD *)buf = 141558274;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - No more pending 'migrate all' attempts, triggering observers for %{mask.hash}@", buf, 0x16u);
    }

    [(BKUbiquitousDocumentsController *)self _removeAssetIDsForOngoingMigrationAttempt:v12[5]];
  }
  _Block_object_dispose(&v11, 8);
}

- (void)_checkTimeoutForOngoingMigrationAttempt
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100007100;
  uint64_t v23 = sub_10000725C;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  p_ongoingMigrationAttemptAccessLock = &self->_ongoingMigrationAttemptAccessLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  uint64_t v9 = sub_1001C5AEC;
  id v10 = &unk_100A4A580;
  uint64_t v11 = self;
  id v12 = &v25;
  uint64_t v13 = &v19;
  id v14 = &v15;
  id v4 = v8;
  os_unfair_lock_lock(p_ongoingMigrationAttemptAccessLock);
  v9((uint64_t)v4);
  os_unfair_lock_unlock(p_ongoingMigrationAttemptAccessLock);

  if (*((unsigned char *)v16 + 24))
  {
    uint64_t v5 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v26[3];
      uint64_t v7 = v20[5];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v6;
      __int16 v31 = 2160;
      uint64_t v32 = 1752392040;
      __int16 v33 = 2112;
      uint64_t v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Timeout - %ld outstanding 'migrate all', assetIDs: %{mask.hash}@", buf, 0x20u);
    }

    [(BKUbiquitousDocumentsController *)self _decrementOrDoneOngoingMigrateAllAttempt];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

- (void)_notifyOngoingMigrationAttemptCompletion:(id)a3 hasPendingChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = +[BKLibraryManager defaultManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001C5C7C;
    v10[3] = &unk_100A442B8;
    id v11 = v6;
    [v7 addCustomOperationBlock:v10];
  }
  else
  {
    id v8 = objc_retainBlock(v5);
    uint64_t v9 = v8;
    if (v8) {
      (*((void (**)(id))v8 + 2))(v8);
    }
  }
}

- (id)_permanentOrTemporaryAssetIDsWithAssetID:(id)a3 temporaryAssetID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  if ([v5 length]) {
    [v7 addObject:v5];
  }
  if ([v6 length]) {
    [v7 addObject:v6];
  }

  return v7;
}

- (void)didHandleInitialQuery
{
  v3 = [(BKUbiquitousDocumentsController *)self migrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C5DF0;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);

  [(BKUbiquitousDocumentsController *)self migrateBooksToUbiquityIfNeededWithCompletion:0];
}

- (void)reportUploadErrorForBooks:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUbiquitousDocumentsController *)self bookOperationsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C5EB0;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)reportUploadCompleteForBooks:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUbiquitousDocumentsController *)self bookOperationsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C6048;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)p_updateCachedURLsFrom:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[AEPluginRegistry sharedInstance];
  id v9 = [v7 pluginForURL:v6];

  id v8 = [v9 helperForURL:v6 withOptions:0];

  [v8 helperUpdateCachedURLTo:v5];
}

- (id)p_generateUbiquityNotEnabledError
{
  return +[NSError errorWithDomain:@"kBKUbiquitousMoveOperationsDomain" code:qword_100B20C28 userInfo:0];
}

- (id)p_generateNotAllBooksEligibleToMoveToUbiquityError
{
  return +[NSError errorWithDomain:@"kBKUbiquitousMoveOperationsDomain" code:qword_100B20C30 userInfo:0];
}

- (void)p_postStatusNotificationForAssets:(id)a3 withState:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v12) assetID:v18];
        if (v13)
        {
          id v14 = [objc_alloc((Class)BKLibraryDownloadStatus) initWithAssetID:v13 state:a4 progressValue:0x7FFFFFFFFFFFFFFFLL timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:0.0];
          [v7 addObject:v14];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v15 = +[NSNotificationCenter defaultCenter];
  uint64_t v16 = BKLibraryDownloadStatusNotification;
  uint64_t v22 = BKLibraryDownloadStatusKey;
  uint64_t v23 = v7;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [v15 postNotificationName:v16 object:self userInfo:v17];
}

- (int64_t)boq_spaceOccupiedByBooksMigratedSinceLastQuotaCheck
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapPendingUpload];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += (int64_t)[*(id *)(*((void *)&v21 + 1) + 8 * i) longLongValue];
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapUploadedSinceLastQuotaReceived];
  uint64_t v11 = [v10 allValues];

  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v7 += (int64_t)[*(id *)(*((void *)&v17 + 1) + 8 * (void)j) longLongValue];
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  return v7;
}

- (void)boq_addPendingUploadQuotaCompensationForAssets:(id)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      int64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v7);
        id v9 = objc_alloc((Class)BKLibraryFileSizeManagerCacheItemRequest);
        id v10 = [v8 assetID];
        uint64_t v11 = [v8 url];
        id v12 = [v9 initWithCacheItemRequestWithAssetID:v10 assetURL:v11];

        id v13 = +[BKLibraryFileSizeManager sharedInstance];
        uint64_t v14 = [v13 synchronousFileSizeForCacheItemRequest:v12];
        uint64_t v15 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapPendingUpload];
        uint64_t v16 = [v8 assetID];
        [v15 setObject:v14 forKeyedSubscript:v16];

        int64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)boq_addUploadedQuotaCompensationForAssetIDs:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        id v10 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapPendingUpload];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        id v12 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapPendingUpload];
        [v12 setObject:0 forKeyedSubscript:v9];

        id v13 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapUploadedSinceLastQuotaReceived];
        [v13 setObject:v11 forKeyedSubscript:v9];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)boq_removeQuotaCompensationForAssets:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v8);
        id v10 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapPendingUpload];
        uint64_t v11 = [v9 assetID];
        [v10 setObject:0 forKeyedSubscript:v11];

        id v12 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapUploadedSinceLastQuotaReceived];
        id v13 = [v9 assetID];
        [v12 setObject:0 forKeyedSubscript:v13];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)boq_removeUploadedQuotaCompensation
{
  id v2 = [(BKUbiquitousDocumentsController *)self assetIDToFileSizeMapUploadedSinceLastQuotaReceived];
  [v2 removeAllObjects];
}

- (id)_sortedAssetsFromEligibleAssets:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
    uint64_t v7 = [v5 valueForKey:@"assetID"];
    uint64_t v8 = +[NSMutableDictionary dictionaryWithObjects:v5 forKeys:v7];
    id v9 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v9 setReturnsObjectsAsFaults:0];
    id v10 = +[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:v7];
    [v9 setPredicate:v10];

    id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastOpenDate" ascending:0];
    id v49 = v11;
    id v12 = +[NSArray arrayWithObjects:&v49 count:1];
    [v9 setSortDescriptors:v12];

    id v41 = 0;
    id v13 = [v6 executeFetchRequest:v9 error:&v41];
    id v14 = v41;
    long long v15 = v14;
    if (v13)
    {
      id v30 = v14;
      __int16 v31 = v13;
      id v32 = v9;
      __int16 v33 = v7;
      id v34 = v6;
      id v35 = v5;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v16 = v13;
      id v17 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v38;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            long long v22 = [v21 assetID:v30, v31, v32, v33, v34, v35];
            long long v23 = [v8 objectForKeyedSubscript:v22];
            long long v24 = BUProtocolCast();

            if (v24)
            {
              [v36 addObject:v24];
              uint64_t v25 = [v21 assetID];
              [v8 setObject:0 forKeyedSubscript:v25];
            }
            else
            {
              v26 = BCIMLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v43 = "-[BKUbiquitousDocumentsController _sortedAssetsFromEligibleAssets:moc:]";
                __int16 v44 = 2080;
                uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKUbiquitousDocumentsController.m";
                __int16 v46 = 1024;
                int v47 = 840;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
              }

              uint64_t v25 = BCIMLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                uint64_t v27 = [v21 assetID];
                *(_DWORD *)buf = 138412290;
                uint64_t v43 = v27;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "@\"Couldn't map BKLibraryAsset with assetID {%@} to BKAsset\"", buf, 0xCu);
              }
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
        }
        while (v18);
      }

      id v6 = v34;
      id v5 = v35;
      id v9 = v32;
      uint64_t v7 = v33;
      long long v15 = v30;
      id v13 = v31;
    }
    if (objc_msgSend(v8, "count", v30, v31, v32, v33, v34, v35))
    {
      uint64_t v28 = [v8 allValues];
      [v36 addObjectsFromArray:v28];
    }
  }

  return v36;
}

- (void)boq_handleSpaceAvailableReceivedWithFreeBytes:(int64_t)a3 serverError:(id)a4
{
  id v6 = (char *)a4;
  [(BKUbiquitousDocumentsController *)self setPendingQuotaFetch:0];
  if (!v6)
  {
    id v9 = self;
    int64_t v10 = a3;
    goto LABEL_9;
  }
  uint64_t v7 = BCIMLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "-[BKUbiquitousDocumentsController boq_handleSpaceAvailableReceivedWithFreeBytes:serverError:]";
    __int16 v14 = 2080;
    long long v15 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKUbiquitousDocumentsController.m";
    __int16 v16 = 1024;
    int v17 = 861;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v12, 0x1Cu);
  }

  uint64_t v8 = BCIMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@\"Error retrieving ubiquity quota from server. Error (%@)\"", (uint8_t *)&v12, 0xCu);
  }

  if (![(BKUbiquitousDocumentsController *)self hasEverReceivedUbiquityQuota])
  {
    id v9 = self;
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
    [(BKUbiquitousDocumentsController *)v9 setUbiquityAvailableSpace:v10];
  }
  [(BKUbiquitousDocumentsController *)self setHasEverReceivedUbiquityQuota:1];
  [(BKUbiquitousDocumentsController *)self boq_removeUploadedQuotaCompensation];
  id v11 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    id v13 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ubiquityAvailableSpace: %lld", (uint8_t *)&v12, 0xCu);
  }
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);

  return (IMUbiquityStatusMonitor *)WeakRetained;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (BKUbiquitousBooksHosting)ubiquitousBooksPlistHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquitousBooksPlistHost);

  return (BKUbiquitousBooksHosting *)WeakRetained;
}

- (void)setUbiquitousBooksPlistHost:(id)a3
{
}

- (BKUbiquityEligibleBooksProviding)ubiquityEligibleBooksProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityEligibleBooksProvider);

  return (BKUbiquityEligibleBooksProviding *)WeakRetained;
}

- (void)setUbiquityEligibleBooksProvider:(id)a3
{
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
}

- (NSOperationQueue)bookOperationsQueue
{
  return self->_bookOperationsQueue;
}

- (void)setBookOperationsQueue:(id)a3
{
}

- (NSMutableSet)booksThatEncounteredUploadError
{
  return self->_booksThatEncounteredUploadError;
}

- (void)setBooksThatEncounteredUploadError:(id)a3
{
}

- (BOOL)initialMetadataQueryWasHandled
{
  return self->_initialMetadataQueryWasHandled;
}

- (void)setInitialMetadataQueryWasHandled:(BOOL)a3
{
  self->_initialMetadataQueryWasHandled = a3;
}

- (IMUbiquityQuotaFetcher)quotaFetcher
{
  return self->_quotaFetcher;
}

- (void)setQuotaFetcher:(id)a3
{
}

- (int64_t)ubiquityAvailableSpace
{
  return self->_ubiquityAvailableSpace;
}

- (void)setUbiquityAvailableSpace:(int64_t)a3
{
  self->_ubiquityAvailableSpace = a3;
}

- (BOOL)hasEverReceivedUbiquityQuota
{
  return self->_hasEverReceivedUbiquityQuota;
}

- (void)setHasEverReceivedUbiquityQuota:(BOOL)a3
{
  self->_hasEverReceivedUbiquityQuota = a3;
}

- (BOOL)pendingQuotaFetch
{
  return self->_pendingQuotaFetch;
}

- (void)setPendingQuotaFetch:(BOOL)a3
{
  self->_pendingQuotaFetch = a3;
}

- (NSMutableArray)pendingQuotaFetchMigrationBlocks
{
  return self->_pendingQuotaFetchMigrationBlocks;
}

- (void)setPendingQuotaFetchMigrationBlocks:(id)a3
{
}

- (NSMutableDictionary)assetIDToFileSizeMapPendingUpload
{
  return self->_assetIDToFileSizeMapPendingUpload;
}

- (void)setAssetIDToFileSizeMapPendingUpload:(id)a3
{
}

- (NSMutableDictionary)assetIDToFileSizeMapUploadedSinceLastQuotaReceived
{
  return self->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived;
}

- (void)setAssetIDToFileSizeMapUploadedSinceLastQuotaReceived:(id)a3
{
}

- (int64_t)ongoingMigrationAttemptOutstandingMigrateAllAttempts
{
  return self->_ongoingMigrationAttemptOutstandingMigrateAllAttempts;
}

- (void)setOngoingMigrationAttemptOutstandingMigrateAllAttempts:(int64_t)a3
{
  self->_ongoingMigrationAttemptOutstandingMigrateAllAttempts = a3;
}

- (NSMutableSet)ongoingMigrationAttemptAssetIDs
{
  return self->_ongoingMigrationAttemptAssetIDs;
}

- (void)setOngoingMigrationAttemptAssetIDs:(id)a3
{
}

- (NSMutableArray)ongoingMigrationAttemptObservers
{
  return self->_ongoingMigrationAttemptObservers;
}

- (void)setOngoingMigrationAttemptObservers:(id)a3
{
}

- (BUCoalescingCallBlock)ongoingMigrationAttemptTimer
{
  return self->_ongoingMigrationAttemptTimer;
}

- (void)setOngoingMigrationAttemptTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptTimer, 0);
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptObservers, 0);
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptAssetIDs, 0);
  objc_storeStrong((id *)&self->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived, 0);
  objc_storeStrong((id *)&self->_assetIDToFileSizeMapPendingUpload, 0);
  objc_storeStrong((id *)&self->_pendingQuotaFetchMigrationBlocks, 0);
  objc_storeStrong((id *)&self->_quotaFetcher, 0);
  objc_storeStrong((id *)&self->_booksThatEncounteredUploadError, 0);
  objc_storeStrong((id *)&self->_bookOperationsQueue, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_destroyWeak((id *)&self->_ubiquityEligibleBooksProvider);
  objc_destroyWeak((id *)&self->_ubiquitousBooksPlistHost);

  objc_destroyWeak((id *)&self->_ubiquityStatusMonitor);
}

@end