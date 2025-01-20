@interface VUIRentalManager
+ (id)sharedInstance;
- (BOOL)_areDownloadManagersInitialized;
- (BOOL)initialRentalsFetched;
- (BOOL)initialized;
- (BOOL)needToSendPlaybackStartDatesToServer;
- (NSMutableSet)deferredRentalCheckinContexts;
- (OS_dispatch_queue)serialQueue;
- (id)_init;
- (void)_activeAccountDidChange:(id)a3;
- (void)_checkInRentalsNeedingCheckIn;
- (void)_didFetchInitialStoreDownloads:(id)a3;
- (void)_networkReachbilityDidChange:(id)a3;
- (void)_sendPlaybackStartDatesToServerIfNecessary;
- (void)checkInRentalWithID:(id)a3 dsid:(id)a4 completion:(id)a5;
- (void)checkOutRentalWithID:(id)a3 dsid:(id)a4 checkoutType:(unint64_t)a5 startPlaybackClock:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4;
- (void)downloadManagerDidBecomeInitialized:(id)a3;
- (void)initializeRentals;
- (void)setDeferredRentalCheckinContexts:(id)a3;
- (void)setInitialRentalsFetched:(BOOL)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setNeedToSendPlaybackStartDatesToServer:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation VUIRentalManager

void __34__VUIRentalManager_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIRentalManager");
  v1 = (void *)sLogObject_21;
  sLogObject_21 = (uint64_t)v0;

  id v2 = [[VUIRentalManager alloc] _init];
  v3 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v2;
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)VUIRentalManager;
  id v2 = [(VUIRentalManager *)&v19 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deferredRentalCheckinContexts = v2->_deferredRentalCheckinContexts;
    v2->_deferredRentalCheckinContexts = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.VideosUI.VUIRentalManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = v2->_serialQueue;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __25__VUIRentalManager__init__block_invoke;
    v16 = &unk_1E6DF4A30;
    objc_copyWeak(&v17, &location);
    dispatch_async(v7, &v13);
    v8 = objc_msgSend(MEMORY[0x1E4F31A50], "sharedManager", v13, v14, v15, v16);
    [v8 addObserver:v2 forDownloads:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    [v9 addObserver:v2 selector:sel__networkReachbilityDidChange_ name:*MEMORY[0x1E4FB3E08] object:v10];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel__activeAccountDidChange_ name:*MEMORY[0x1E4FA83B0] object:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)_areDownloadManagersInitialized
{
  id v2 = [MEMORY[0x1E4F31A50] sharedManager];
  if ([v2 hasFetchedInitialDownloads])
  {
    v3 = +[VUIDownloadManager sharedInstance];
    char v4 = [v3 isInitialized];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)downloadManagerDidBecomeInitialized:(id)a3
{
  if ([(VUIRentalManager *)self _areDownloadManagersInitialized])
  {
    char v4 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Initial downloads have been retrieved.  Checking in rentals as necessary", v5, 2u);
    }
    [(VUIRentalManager *)self _checkInRentalsNeedingCheckIn];
  }
}

void __25__VUIRentalManager__init__block_invoke(uint64_t a1)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  char v4 = (void *)MEMORY[0x1E4F79A60];
  dispatch_queue_t v5 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79758] equalToInteger:1];
  v22[0] = v5;
  v6 = (void *)MEMORY[0x1E4F79AA0];
  uint64_t v7 = *MEMORY[0x1E4F79818];
  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:v3];
  v9 = [v6 predicateWithProperty:v7 value:v8 comparison:6];
  v22[1] = v9;
  v10 = (void *)MEMORY[0x1E4F79AA0];
  uint64_t v11 = *MEMORY[0x1E4F79820];
  v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v3];
  uint64_t v13 = [v10 predicateWithProperty:v11 value:v12 comparison:4];
  v22[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v15 = [v4 predicateMatchingPredicates:v14];

  v16 = (void *)MEMORY[0x1E4F79B50];
  id v17 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
  v18 = [v16 queryWithLibrary:v17 predicate:v15 orderingTerms:0];

  [v18 setIgnoreSystemFilterPredicates:1];
  objc_super v19 = (void *)[objc_alloc(MEMORY[0x1E4F79B28]) initWithQuery:v18];
  [v19 updateToLibraryCurrentRevision];
  if ([v19 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__VUIRentalManager__init__block_invoke_2;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v21, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v21);
  }
}

- (void)initializeRentals
{
  if (![(VUIRentalManager *)self initialized])
  {
    [(VUIRentalManager *)self setInitialized:1];
    [(VUIRentalManager *)self _sendPlaybackStartDatesToServerIfNecessary];
    double v3 = +[VUIRentalExpirationMonitor sharedInstance];
    [v3 startMonitoring];

    char v4 = +[VUIDownloadManager sharedInstance];
    [v4 addDelegate:self];

    dispatch_queue_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__didFetchInitialStoreDownloads_ name:*MEMORY[0x1E4F317C0] object:0];

    if ([(VUIRentalManager *)self _areDownloadManagersInitialized])
    {
      [(VUIRentalManager *)self _checkInRentalsNeedingCheckIn];
    }
    else
    {
      v6 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for list of downloads to be populated before checking in rentals", v7, 2u);
      }
    }
  }
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)_sendPlaybackStartDatesToServerIfNecessary
{
  if ([(VUIRentalManager *)self needToSendPlaybackStartDatesToServer]
    && ([MEMORY[0x1E4FB3CF8] sharedInstance],
        double v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isNetworkReachable],
        v3,
        v4))
  {
    dispatch_queue_t v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
    uint64_t v7 = objc_msgSend(v6, "ams_DSID");

    if (v7 && [v7 unsignedLongLongValue])
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4FA82A8]) initWithAccountIdentifier:v7];
      objc_initWeak(location, self);
      v9 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Sending rental playback start dates to server", buf, 2u);
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke;
      v12[3] = &unk_1E6DFC168;
      objc_copyWeak(&v13, location);
      [v8 startWithConnectionResponseBlock:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v11 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Not sending rental playback start dates to server since no user is signed in", (uint8_t *)location, 2u);
      }
    }
  }
  else
  {
    v10 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Not sending rental playback start dates to server since we have no updates or because network is not available", (uint8_t *)location, 2u);
    }
  }
}

- (BOOL)needToSendPlaybackStartDatesToServer
{
  return self->_needToSendPlaybackStartDatesToServer;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32 != -1) {
    dispatch_once(&sharedInstance_onceToken_32, &__block_literal_global_137);
  }
  double v2 = (void *)sharedInstance_sInstance;
  return v2;
}

- (void)_checkInRentalsNeedingCheckIn
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  int v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  dispatch_queue_t v5 = sLogObject_21;
  BOOL v6 = os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Looking for rentals that should not be checked out", (uint8_t *)&buf, 2u);
    }
    v33 = [MEMORY[0x1E4F31970] movieRentalsQuery];
    [v33 setIgnoreSystemFilterPredicates:1];
    v34 = [MEMORY[0x1E4F1CA48] array];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v7 = (void *)MEMORY[0x1E4F31968];
    v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    v32 = [v7 predicateWithValue:v8 forProperty:*MEMORY[0x1E4F31470] comparisonType:101];

    [v34 addObject:v32];
    v31 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F313F0] comparisonType:0];
    [v34 addObject:v31];
    v9 = (void *)MEMORY[0x1E4F318F0];
    v10 = (void *)[v34 copy];
    v30 = [v9 predicateMatchingPredicates:v10];

    [v33 addFilterPredicate:v30];
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = [v33 items];
    id v13 = (void *)sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v12 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu unexpired rentals", (uint8_t *)&buf, 0xCu);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v12;
    uint64_t v16 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(obj);
          }
          objc_super v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v19, "vui_isDownloadedOrDownloadingOrEnqueued", v30) & 1) == 0) {
            [v11 addObject:v19];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v16);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    v20 = dispatch_group_create();
    objc_initWeak(&location, self);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = v11;
    uint64_t v21 = [v35 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v45;
      uint64_t v23 = *MEMORY[0x1E4F31518];
      uint64_t v24 = *MEMORY[0x1E4F314C8];
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v35);
          }
          v26 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          v27 = objc_msgSend(v26, "valueForProperty:", v23, v30);
          v28 = [v26 valueForProperty:v24];
          if ([v27 unsignedLongLongValue])
          {
            if ([v28 unsignedLongLongValue])
            {
              v29 = (void *)[objc_alloc(MEMORY[0x1E4FA82A0]) initWithAccountIdentifier:v28 rentalKeyIdentifier:v27];
              dispatch_group_enter(v20);
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke;
              v38[3] = &unk_1E6DFC1B8;
              objc_copyWeak(&v43, &location);
              id v39 = v27;
              p_long long buf = &buf;
              id v40 = v28;
              v41 = v20;
              [v29 startWithResponseBlock:v38];

              objc_destroyWeak(&v43);
            }
          }
        }
        uint64_t v21 = [v35 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v21);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_82;
    block[3] = &unk_1E6DF8EC0;
    void block[4] = &buf;
    dispatch_group_notify(v20, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
  else if (v6)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Not looking for rentals that should not be checked out because no user is signed in", (uint8_t *)&buf, 2u);
  }
}

- (void)_didFetchInitialStoreDownloads:(id)a3
{
  if ([(VUIRentalManager *)self _areDownloadManagersInitialized])
  {
    int v4 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Initial downloads have been retrieved.  Checking in rentals as necessary", v5, 2u);
    }
    [(VUIRentalManager *)self _checkInRentalsNeedingCheckIn];
  }
}

void __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_82(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v2 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Found %lu rentals needing to be checked in", (uint8_t *)&v4, 0xCu);
  }
}

void __25__VUIRentalManager__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Found at least one rental still in rental window.  Will send playback start dates to server", v3, 2u);
  }
  [WeakRetained setNeedToSendPlaybackStartDatesToServer:1];
  if ([WeakRetained initialized]) {
    [WeakRetained _sendPlaybackStartDatesToServerIfNecessary];
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIRentalManager;
  [(VUIRentalManager *)&v4 dealloc];
}

- (void)checkOutRentalWithID:(id)a3 dsid:(id)a4 checkoutType:(unint64_t)a5 startPlaybackClock:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void, void *))a7;
  if (!v13 || ![v13 unsignedLongLongValue])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
    {
      -[VUIRentalManager checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:]();
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (!v12 || ![v12 unsignedLongLongValue])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
    {
      -[VUIRentalManager checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:]();
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_17:
    if (!v14) {
      goto LABEL_19;
    }
LABEL_18:
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = (void *)[v21 initWithDomain:VUIStoreMediaItemErrorDomain code:-123008 userInfo:0];
    v14[2](v14, 0, v22);

    goto LABEL_19;
  }
  uint64_t v15 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v16 = [v15 isNetworkReachable];

  if (v16)
  {
    uint64_t v17 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      v18 = @"Download";
      if (a5 == 2) {
        v18 = @"Streaming";
      }
      objc_super v19 = @"YES";
      if (!v8) {
        objc_super v19 = @"NO";
      }
      *(_DWORD *)long long buf = 138412546;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Checking out rental with type %@; using play param: %@",
        buf,
        0x16u);
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FA8298]) initWithAccountIdentifier:v13 rentalKeyIdentifier:v12];
    [v20 setCheckoutType:a5];
    [v20 setCheckoutWithPlay:v8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke;
    v25[3] = &unk_1E6DFC118;
    v26 = v14;
    [v20 startWithConnectionResponseBlock:v25];
  }
  else
  {
    if (v8)
    {
      uint64_t v23 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "Network is not reachable.  Will send playback start date to server when network becomes reachable.", buf, 2u);
      }
      [(VUIRentalManager *)self setNeedToSendPlaybackStartDatesToServer:1];
    }
    uint64_t v24 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Not checking out rental because network is not available.  Return YES for success anyway so playback can proceed", buf, 2u);
    }
    if (v14) {
      v14[2](v14, 1, 0);
    }
  }
LABEL_19:
}

void __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Rental checkout complete", buf, 2u);
  }
  if (v6)
  {
    BOOL v8 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Rental checkout failed with error: %@", buf, 0xCu);
    }
    id v9 = v6;
    v10 = [v5 bodyData];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
    }
    else
    {
      uint64_t v11 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 objectForKey:@"failureType"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 integerValue] == 5102)
      {
        uint64_t v21 = *MEMORY[0x1E4F28A50];
        id v22 = v9;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:812 userInfo:v13];

        id v9 = (id)v14;
      }
    }
  }
  else
  {
    id v9 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke_68;
  block[3] = &unk_1E6DF7A98;
  id v15 = *(id *)(a1 + 32);
  BOOL v20 = v6 == 0;
  id v18 = v9;
  id v19 = v15;
  id v16 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke_68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)checkInRentalWithID:(id)a3 dsid:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 unsignedLongLongValue])
  {
    if (v8 && [v8 unsignedLongLongValue])
    {
      uint64_t v11 = [MEMORY[0x1E4FB3CF8] sharedInstance];
      int v12 = [v11 isNetworkReachable];

      id v13 = sLogObject_21;
      BOOL v14 = os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)long long buf = 138412290;
          id v24 = v8;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Checking in rental with ID %@", buf, 0xCu);
        }
        id v15 = (VUIRentalCheckInContext *)[objc_alloc(MEMORY[0x1E4FA8290]) initWithAccountIdentifier:v9 rentalKeyIdentifier:v8];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke;
        v18[3] = &unk_1E6DFC140;
        id v19 = v8;
        id v20 = v9;
        uint64_t v21 = self;
        id v22 = v10;
        [(VUIRentalCheckInContext *)v15 startWithConnectionResponseBlock:v18];
      }
      else
      {
        if (v14)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Network is not reachable.  Will check in rental when network becomes available.", buf, 2u);
        }
        id v15 = [[VUIRentalCheckInContext alloc] initWithRentalID:v8 dsid:v9];
        uint64_t v17 = [(VUIRentalManager *)self deferredRentalCheckinContexts];
        [v17 addObject:v15];
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
    {
      -[VUIRentalManager checkInRentalWithID:dsid:completion:]();
      if (!v10) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
  {
    -[VUIRentalManager checkInRentalWithID:dsid:completion:]();
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v10)
  {
LABEL_14:
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v15 = (VUIRentalCheckInContext *)[v16 initWithDomain:VUIStoreMediaItemErrorDomain code:-123008 userInfo:0];
    (*((void (**)(id, void, VUIRentalCheckInContext *))v10 + 2))(v10, 0, v15);
LABEL_15:
  }
LABEL_16:
}

void __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Rental checkin complete for ID %@", buf, 0xCu);
  }
  if (v6)
  {
    id v9 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Rental checkin failed with error.  Will try to check in later. %@", buf, 0xCu);
    }
    id v10 = [[VUIRentalCheckInContext alloc] initWithRentalID:*(void *)(a1 + 32) dsid:*(void *)(a1 + 40)];
    uint64_t v11 = [*(id *)(a1 + 48) deferredRentalCheckinContexts];
    [v11 addObject:v10];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke_71;
  v14[3] = &unk_1E6DF41E8;
  id v12 = *(id *)(a1 + 56);
  id v15 = v6;
  id v16 = v12;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

uint64_t __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke_71(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) == 0);
  }
  return result;
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5 = a4;
  id v6 = [v5 phaseIdentifier];
  if (([v6 isEqualToString:*MEMORY[0x1E4F317C8]] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x1E4F317D8]])
  {
    uint64_t v7 = [v5 storeItemIdentifier];
    id v8 = (void *)MEMORY[0x1E4F31968];
    id v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v7];
    id v10 = [v8 predicateWithValue:v9 forProperty:*MEMORY[0x1E4F31500]];

    uint64_t v11 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3D6D0 forProperty:*MEMORY[0x1E4F31420]];
    id v12 = objc_alloc(MEMORY[0x1E4F31970]);
    id v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v10, v11, 0);
    BOOL v14 = (void *)[v12 initWithFilterPredicates:v13];

    [v14 setEntityLimit:1];
    [v14 setIgnoreSystemFilterPredicates:1];
    id v15 = [v14 items];
    id v16 = [v15 firstObject];

    if ([v16 isRental])
    {
      uint64_t v17 = [v16 valueForProperty:*MEMORY[0x1E4F31518]];
      id v18 = [v16 valueForProperty:*MEMORY[0x1E4F314C8]];
      uint64_t v19 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Checking in rental for download that was cancelled or failed", buf, 2u);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__VUIRentalManager_downloadManager_downloadDidFinish___block_invoke;
      block[3] = &unk_1E6DF45D8;
      void block[4] = self;
      id v23 = v17;
      id v24 = v18;
      id v20 = v18;
      id v21 = v17;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __54__VUIRentalManager_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkInRentalWithID:*(void *)(a1 + 40) dsid:*(void *)(a1 + 48) completion:0];
}

- (void)_networkReachbilityDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x1E4FB3CF8];
    uint64_t v7 = v5;
    id v8 = [v6 sharedInstance];
    int v9 = [v8 isNetworkReachable];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    int v22 = 138412290;
    uint64_t v23 = (uint64_t)v10;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Network reachability did change.  Is reachable: %@", (uint8_t *)&v22, 0xCu);
  }
  [(VUIRentalManager *)self _sendPlaybackStartDatesToServerIfNecessary];
  uint64_t v11 = (void *)sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [(VUIRentalManager *)self deferredRentalCheckinContexts];
    uint64_t v14 = [v13 count];
    int v22 = 134217984;
    uint64_t v23 = v14;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "%lu rental checkins have been deferred", (uint8_t *)&v22, 0xCu);
  }
  id v15 = [(VUIRentalManager *)self deferredRentalCheckinContexts];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    int v18 = [v17 isNetworkReachable];

    uint64_t v19 = sLogObject_21;
    BOOL v20 = os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Validating that deferred checkins are still okay to check in", (uint8_t *)&v22, 2u);
      }
      id v21 = [(VUIRentalManager *)self deferredRentalCheckinContexts];
      [v21 removeAllObjects];

      [(VUIRentalManager *)self _checkInRentalsNeedingCheckIn];
    }
    else if (v20)
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Network is not available, not checking in rentals that have been deferred", (uint8_t *)&v22, 2u);
    }
  }
}

- (void)_activeAccountDidChange:(id)a3
{
  objc_initWeak(&location, self);
  uint64_t v3 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Active account did change", buf, 2u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VUIRentalManager__activeAccountDidChange___block_invoke;
  block[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__VUIRentalManager__activeAccountDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendPlaybackStartDatesToServerIfNecessary];
  [WeakRetained _checkInRentalsNeedingCheckIn];
}

void __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Finished sending rental playback start dates to server", v10, 2u);
  }
  if (v6)
  {
    id v8 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR)) {
      __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setNeedToSendPlaybackStartDatesToServer:0];
  }
}

void __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke(uint64_t a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_2;
  v5[3] = &unk_1E6DFC190;
  char v11 = a2;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  uint64_t v9 = v4;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v10);
}

void __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v3 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Found rental with id %@ that needs to be checked in", (uint8_t *)&v5, 0xCu);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [WeakRetained checkInRentalWithID:*(void *)(a1 + 32) dsid:*(void *)(a1 + 40) completion:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)setNeedToSendPlaybackStartDatesToServer:(BOOL)a3
{
  self->_needToSendPlaybackStartDatesToServer = a3;
}

- (NSMutableSet)deferredRentalCheckinContexts
{
  return self->_deferredRentalCheckinContexts;
}

- (void)setDeferredRentalCheckinContexts:(id)a3
{
}

- (BOOL)initialRentalsFetched
{
  return self->_initialRentalsFetched;
}

- (void)setInitialRentalsFetched:(BOOL)a3
{
  self->_initialRentalsFetched = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deferredRentalCheckinContexts, 0);
}

- (void)checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to check out rental since dsid is invalid", v2, v3, v4, v5, v6);
}

- (void)checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to check out rental since rental ID is invalid", v2, v3, v4, v5, v6);
}

- (void)checkInRentalWithID:dsid:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to check in rental since dsid is invalid", v2, v3, v4, v5, v6);
}

- (void)checkInRentalWithID:dsid:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to check in rental since rental ID is invalid", v2, v3, v4, v5, v6);
}

void __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Error sending rental playback start dates to server: %@", (uint8_t *)&v2, 0xCu);
}

@end