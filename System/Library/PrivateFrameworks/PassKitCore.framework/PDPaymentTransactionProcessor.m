@interface PDPaymentTransactionProcessor
- (BOOL)_canUpdateMapsDataForTransaction:(id)a3;
- (BOOL)isActive;
- (PDPaymentTransactionProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 paymentWebServiceCoordinator:(id)a4;
- (PDPaymentTransactionProcessor)initWithQueue:(id)a3 mapsBrandAndMerchantUpdater:(id)a4 paymentWebServiceCoordinator:(id)a5;
- (PDPaymentTransactionProcessorDataSource)dataSource;
- (PKUsageNotificationServer)usageNotificationServer;
- (id)_pendingLocationUpdateItemForTransaction:(id)a3;
- (id)_pendingMerchantCleanupItemForTransaction:(id)a3;
- (id)_pendingReverseGeocodeUpdateItemForTransaction:(id)a3;
- (id)_pendingStationsUpdateItemForTransaction:(id)a3;
- (void)_abortUpdatingLocationForAllBackgroundLocationUpdateItems;
- (void)_abortUpdatingLocationForAllLocationUpdateItems;
- (void)_abortUpdatingLocationForLocationUpdateItem:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_beginMerchantCleanupIfPossible;
- (void)_beginProcessingPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 skipLocation:(BOOL)a5;
- (void)_beginReverseGeocodingIfPossible;
- (void)_continueUpdatingLocationForTransactionUpdateItem:(id)a3;
- (void)_markTransactionAsFullyProcessedAndNotifyDelegate:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processForLocalMCCLookup:(id)a3;
- (void)_processItemForMerchantCleanup:(id)a3 clearingAttempt:(BOOL)a4;
- (void)_processItemForStationsCleanup:(id)a3;
- (void)_processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForDemoMode:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForLocationUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForMapsData:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForMerchantCleanup:(id)a3 forTransactionSourceIdentifier:(id)a4 clearingAttempt:(BOOL)a5;
- (void)_processPaymentTransactionForStationsUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_reportTransactionWithFinalLocation:(id)a3;
- (void)_startUpdatingBackgroundLocationIfPossible;
- (void)_startUpdatingLocationIfPossible;
- (void)_stopUpdatingLocationIfPossible;
- (void)_updateActiveState;
- (void)_updateLocation:(id)a3 forLocationUpdateItem:(id)a4 andMarkAsProcessed:(BOOL)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)processPaymentTransactionConfigurations:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setUsageNotificationServer:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDPaymentTransactionProcessor

- (PDPaymentTransactionProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 paymentWebServiceCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = PDDefaultQueue();
  v9 = [(PDPaymentTransactionProcessor *)self initWithQueue:v8 mapsBrandAndMerchantUpdater:v7 paymentWebServiceCoordinator:v6];

  return v9;
}

- (PDPaymentTransactionProcessor)initWithQueue:(id)a3 mapsBrandAndMerchantUpdater:(id)a4 paymentWebServiceCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)PDPaymentTransactionProcessor;
  v11 = [(PDPaymentTransactionProcessor *)&v40 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_paymentWebServiceCoordinator, a5);
    v12->_itemsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_mapsBrandAndMerchantUpdater, a4);
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    locationUpdateItems = v12->_locationUpdateItems;
    v12->_locationUpdateItems = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    backgroundLocationUpdateItems = v12->_backgroundLocationUpdateItems;
    v12->_backgroundLocationUpdateItems = v15;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    reverseGeocodeItems = v12->_reverseGeocodeItems;
    v12->_reverseGeocodeItems = v17;

    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    stationsUpdateItems = v12->_stationsUpdateItems;
    v12->_stationsUpdateItems = v19;

    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    merchantCleanupItems = v12->_merchantCleanupItems;
    v12->_merchantCleanupItems = v21;

    v23 = (CLGeocoder *)objc_alloc_init((Class)CLGeocoder);
    geocoder = v12->_geocoder;
    v12->_geocoder = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passd.PDPaymentTransactionProcessor.reply", 0);
    replyQueue = v12->_replyQueue;
    v12->_replyQueue = (OS_dispatch_queue *)v25;

    id v27 = objc_alloc((Class)CLLocationManager);
    v28 = PKPassKitCoreBundle();
    v29 = [v28 bundlePath];
    v30 = (CLLocationManager *)[v27 initWithEffectiveBundlePath:v29 delegate:v12 onQueue:v8];
    locationManager = v12->_locationManager;
    v12->_locationManager = v30;

    [(CLLocationManager *)v12->_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    id v32 = objc_alloc((Class)CLLocationManager);
    v33 = PKMerchantLookupBundle();
    v34 = [v33 bundlePath];
    v35 = (CLLocationManager *)[v32 initWithEffectiveBundlePath:v34 delegate:v12 onQueue:v8];
    backgroundMerchantLocationManager = v12->_backgroundMerchantLocationManager;
    v12->_backgroundMerchantLocationManager = v35;

    [(CLLocationManager *)v12->_backgroundMerchantLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    v12->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v37 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v37;
  }
  return v12;
}

- (void)processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7 && ([v7 updateReasonIsInitialDownload] & 1) == 0)
  {
    if (PKHandsOnDemoModeEnabled()) {
      [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForDemoMode:v7 forTransactionSourceIdentifier:v6];
    }
    else {
      [(PDPaymentTransactionProcessor *)self _processPaymentTransaction:v7 forTransactionSourceIdentifier:v6];
    }
  }
}

- (void)processPaymentTransactionConfigurations:(id)a3
{
  id v3 = a3;
  if ([v3 count] && (PKHandsOnDemoModeEnabled() & 1) == 0)
  {
    [(PDMapsBrandAndMerchantUpdater *)self->_mapsBrandAndMerchantUpdater beginCoalesingMapsDataRequests];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v15 = v3;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v11 = [v9 transactionIdentifier];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
          v13 = [WeakRetained paymentTransactionForIdentifier:v11];

          if (v13)
          {
            objc_msgSend(v13, "addUpdateReasons:", objc_msgSend(v9, "updateReasons"));
            v14 = [v13 transactionSourceIdentifier];
            [(PDPaymentTransactionProcessor *)self _processPaymentTransaction:v13 forTransactionSourceIdentifier:v14];
          }
          else
          {
            v14 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v11;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error: Cannot process transaction %@ since there is no transaction in the local database", buf, 0xCu);
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v6);
    }

    [(PDMapsBrandAndMerchantUpdater *)self->_mapsBrandAndMerchantUpdater endCoalesingMapsDataRequests];
    id v3 = v15;
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observersLock);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1004C1020;
    v8[3] = &unk_10072FDC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = (CLLocationManager *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_itemsLock);
  if (self->_locationManager == v6)
  {
    uint64_t v9 = 16;
  }
  else
  {
    if (self->_backgroundMerchantLocationManager != v6)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = 24;
  }
  id v8 = [*(id *)((char *)&self->super.isa + v9) copy];
LABEL_7:
  os_unfair_lock_unlock(&self->_itemsLock);
  id v10 = [v7 lastObject];

  v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New Location Update: %@", buf, 0xCu);
  }

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1004C12C0;
  v16 = &unk_100756628;
  long long v17 = self;
  id v18 = v10;
  id v12 = v10;
  [v8 enumerateObjectsUsingBlock:&v13];
  [(PDPaymentTransactionProcessor *)self _stopUpdatingLocationIfPossible];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = (CLLocationManager *)a3;
  id v7 = a4;
  if ([v7 code])
  {
    if (self->_locationManager == v6)
    {
      [(PDPaymentTransactionProcessor *)self _abortUpdatingLocationForAllLocationUpdateItems];
    }
    else if (self->_backgroundMerchantLocationManager == v6)
    {
      [(PDPaymentTransactionProcessor *)self _abortUpdatingLocationForAllBackgroundLocationUpdateItems];
    }
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Location Manager Failed With Error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Location Manager %@ unable to retreve location, will retry.", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_processPaymentTransactionForDemoMode:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasTransactionSource])
  {
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    uint64_t v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004C1720;
    block[3] = &unk_10072E238;
    id v11 = v6;
    id v12 = self;
    id v13 = v7;
    dispatch_after(v8, v9, block);
  }
}

- (void)_markTransactionAsFullyProcessedAndNotifyDelegate:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 processedForLocation]
    && ([v8 processedForStations] & 1) != 0)
  {
    unsigned __int8 v9 = [v8 processedForMerchantCleanup];

    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  [v8 setProcessedForLocation:1];
  [v8 setProcessedForStations:1];
  [v8 setProcessedForMerchantCleanup:1];
  [v8 addUpdateReasons:128];
LABEL_7:
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004C1AD0;
  v12[3] = &unk_100756650;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  [(PDPaymentTransactionProcessor *)self _accessObserversWithHandler:v12];
}

- (void)_beginProcessingPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 skipLocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [(PDPaymentTransactionProcessor *)self _canUpdateMapsDataForTransaction:v8];
  if (v5 && ([v8 processedForLocation] & 1) == 0)
  {
    int v11 = 1;
    [v8 setProcessedForLocation:1];
    [v8 addUpdateReasons:128];
  }
  else
  {
    int v11 = 0;
  }
  if (([v8 processedForLocation] & 1) == 0)
  {
    [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForLocationUpdate:v8 forTransactionSourceIdentifier:v9];
    goto LABEL_9;
  }
  id v12 = [(PDPaymentTransactionProcessor *)self _pendingReverseGeocodeUpdateItemForTransaction:v8];

  if (v12)
  {
    id v13 = [(PDPaymentTransactionProcessor *)self _pendingReverseGeocodeUpdateItemForTransaction:v8];
    [v13 setPaymentTransaction:v8];

    goto LABEL_9;
  }
  if (([v8 processedForStations] & 1) == 0)
  {
    [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForStationsUpdate:v8 forTransactionSourceIdentifier:v9];
    goto LABEL_9;
  }
  if (([v8 processedForMerchantCleanup] & 1) == 0)
  {
    v16 = self;
    id v17 = v8;
    id v18 = v9;
    uint64_t v19 = 0;
LABEL_20:
    [(PDPaymentTransactionProcessor *)v16 _processPaymentTransactionForMerchantCleanup:v17 forTransactionSourceIdentifier:v18 clearingAttempt:v19];
    goto LABEL_9;
  }
  if ([v8 requiresMerchantReprocessing])
  {
    unint64_t v14 = (unint64_t)[v8 transactionStatus];
    if (([v8 updateReasons] & 8) != 0)
    {
      v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not reprocessing for merchant cleanup since transaction came from device data changes", buf, 2u);
      }
    }
    else if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Reprocessing merchant cleanup for cleared transaction with no Maps match", buf, 2u);
      }

      v16 = self;
      id v17 = v8;
      id v18 = v9;
      uint64_t v19 = 1;
      goto LABEL_20;
    }
    if (v10)
    {
      v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Processing maps merchant and brand data.", buf, 2u);
      }

      [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForMapsData:v8 forTransactionSourceIdentifier:v9];
    }
    if (v11)
    {
      v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v25 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Cannot reprocess transaction %@", buf, 0xCu);
      }
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1004C1F2C;
      v32[3] = &unk_100756650;
      id v33 = v8;
      id v34 = v9;
      [(PDPaymentTransactionProcessor *)self _accessObserversWithHandler:v32];

      v21 = v33;
      goto LABEL_38;
    }
  }
  else
  {
    if (v10)
    {
      long long v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Processing maps merchant and brand data.", buf, 2u);
      }

      [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForMapsData:v8 forTransactionSourceIdentifier:v9];
    }
    if (v11)
    {
      v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472;
      v28 = sub_1004C1F38;
      v29 = &unk_100756650;
      id v30 = v8;
      id v31 = v9;
      [(PDPaymentTransactionProcessor *)self _accessObserversWithHandler:&v26];

      v21 = v30;
LABEL_38:
    }
  }
LABEL_9:
  [(PDPaymentTransactionProcessor *)self _updateActiveState];
}

- (void)_processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = [WeakRetained paymentApplicationForTransactionSource:v7];

  if (!v9)
  {
    unsigned int v13 = [(PDPaymentTransactionProcessor *)self _canUpdateMapsDataForTransaction:v6];
    unint64_t v14 = PKLogFacilityTypeGetObject();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        int v47 = 138412290;
        CFStringRef v48 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Processing transaction for maps brand and merchant data since the transaction doesn't have a Payment Application: %@", (uint8_t *)&v47, 0xCu);
      }

LABEL_12:
      [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForMapsData:v6 forTransactionSourceIdentifier:v7];
      goto LABEL_61;
    }
    if (v15)
    {
      int v47 = 138412290;
      CFStringRef v48 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Processing Not Permitted For Transaction without Payment Application: %@", (uint8_t *)&v47, 0xCu);
    }

LABEL_19:
    id v17 = self;
    id v18 = v6;
    id v19 = v7;
LABEL_20:
    [(PDPaymentTransactionProcessor *)v17 _markTransactionAsFullyProcessedAndNotifyDelegate:v18 forTransactionSourceIdentifier:v19];
    goto LABEL_61;
  }
  if (!v7)
  {
    v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = 138412290;
      CFStringRef v48 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Processing Not Permitted For Transaction without a Transaction Source Identifier: %@", (uint8_t *)&v47, 0xCu);
    }

    id v17 = self;
    id v18 = v6;
    id v19 = 0;
    goto LABEL_20;
  }
  unint64_t v10 = (unint64_t)[(__CFString *)v6 effectiveTransactionSource];
  switch(v10)
  {
    case 0uLL:
    case 4uLL:
      unsigned int v20 = [(__CFString *)v6 requiresMerchantReprocessing];
      v21 = (char *)[(__CFString *)v6 transactionType];
      if ((unint64_t)(v21 - 4) < 0xB) {
        goto LABEL_22;
      }
      if ((unint64_t)(v21 - 1) < 2) {
        goto LABEL_46;
      }
      if (v21 == (char *)3)
      {
        if ([(__CFString *)v6 peerPaymentPaymentMode] == (id)2)
        {
          unsigned int v46 = [(__CFString *)v6 originatedByDevice];
          uint64_t v22 = v46 ^ 1;
          if ((v20 | v46)) {
            goto LABEL_47;
          }
        }
        else
        {
LABEL_22:
          if (v20)
          {
LABEL_46:
            uint64_t v22 = 1;
LABEL_47:
            v35 = self;
            v36 = v6;
            id v37 = v7;
            uint64_t v38 = v22;
            goto LABEL_60;
          }
          if ([(__CFString *)v6 hasNotificationServiceData]) {
            goto LABEL_19;
          }
          uint64_t v22 = 1;
        }
      }
      else
      {
        uint64_t v22 = 1;
        if (v20) {
          goto LABEL_47;
        }
      }
      if ((unint64_t)[(__CFString *)v6 transactionType] <= 1)
      {
        uint64_t v23 = [(__CFString *)v6 dpanIdentifier];
        if (!v23
          || (v24 = (void *)v23,
              id v25 = objc_loadWeakRetained((id *)&self->_dataSource),
              [v25 paymentApplicationForDPANIdentifier:v24],
              v26 = objc_claimAutoreleasedReturnValue(),
              v25,
              v26,
              v24,
              v26))
        {
LABEL_52:
          [(__CFString *)v6 setRequiresMerchantReprocessing:1];
          id v43 = objc_loadWeakRetained((id *)&self->_dataSource);
          v44 = [(__CFString *)v6 identifier];
          [v43 updateRequiresMerchantReprocessing:1 forTransactionWithIdentifier:v44];

          [(PDPaymentTransactionProcessor *)self _beginProcessingPaymentTransaction:v6 forTransactionSourceIdentifier:v7 skipLocation:v22];
        }
      }
      goto LABEL_53;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      if ([(__CFString *)v6 originatedByDevice]) {
        goto LABEL_5;
      }
      goto LABEL_40;
    case 5uLL:
      if (PKIsPhone()) {
        goto LABEL_5;
      }
LABEL_40:
      if (![(PDPaymentTransactionProcessor *)self _canUpdateMapsDataForTransaction:v6])goto LABEL_53; {
      goto LABEL_12;
      }
    case 6uLL:
    case 8uLL:
LABEL_5:
      char HasAuthenticationRequest = PKPaymentTransactionHasAuthenticationRequest();
      unsigned int v12 = [(PDPaymentTransactionProcessor *)self _canUpdateMapsDataForTransaction:v6];
      if ((HasAuthenticationRequest & 1) == 0)
      {
        uint64_t v27 = PKLogFacilityTypeGetObject();
        v28 = &qword_1005B3000;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v47 = 138412290;
          CFStringRef v48 = v6;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Beginning processing for transaction: %@", (uint8_t *)&v47, 0xCu);
        }

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v29 = [(__CFString *)v6 requiresLocation];
          CFStringRef v30 = @"NO";
          if (v29) {
            CFStringRef v30 = @"YES";
          }
          int v47 = 138412290;
          CFStringRef v48 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "requiresLocation: %@", (uint8_t *)&v47, 0xCu);
        }

        unsigned __int8 v31 = [(__CFString *)v6 requiresLocation];
        if ((v31 & 1) != 0 || (v10 | 4) == 5)
        {
          v28 = [(__CFString *)v6 questions];
          BOOL v32 = [v28 count] != 0;
          if (v31) {
            goto LABEL_58;
          }
        }
        else
        {
          BOOL v32 = 1;
        }
        if ((v10 | 4) != 5)
        {
LABEL_59:
          v35 = self;
          v36 = v6;
          id v37 = v7;
          uint64_t v38 = v32;
          goto LABEL_60;
        }
LABEL_58:

        goto LABEL_59;
      }
      if (v12) {
        goto LABEL_12;
      }
LABEL_53:
      v45 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        int v47 = 138412546;
        CFStringRef v48 = v6;
        __int16 v49 = 2112;
        v50 = v9;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Processing Not Permitted For Transaction: %@, Payment Application: %@", (uint8_t *)&v47, 0x16u);
      }

LABEL_61:
      return;
    case 7uLL:
      unsigned int v33 = [(__CFString *)v6 requiresMerchantReprocessing];
      id v34 = [(__CFString *)v6 transactionType];
      if (v33)
      {
        if ((unint64_t)v34 > 1) {
          goto LABEL_53;
        }
        v35 = self;
        v36 = v6;
        id v37 = v7;
        uint64_t v38 = 1;
LABEL_60:
        [(PDPaymentTransactionProcessor *)v35 _beginProcessingPaymentTransaction:v36 forTransactionSourceIdentifier:v37 skipLocation:v38];
        goto LABEL_61;
      }
      if ((unint64_t)v34 <= 1)
      {
        uint64_t v39 = [(__CFString *)v6 dpanIdentifier];
        if (!v39
          || (objc_super v40 = (void *)v39,
              id v41 = objc_loadWeakRetained((id *)&self->_dataSource),
              [v41 paymentApplicationForDPANIdentifier:v40],
              v42 = objc_claimAutoreleasedReturnValue(),
              v41,
              v42,
              v40,
              v42))
        {
          uint64_t v22 = 1;
          goto LABEL_52;
        }
      }
      goto LABEL_53;
    default:
      goto LABEL_53;
  }
}

- (void)_updateActiveState
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  if ([(NSMutableSet *)self->_locationUpdateItems count]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSMutableSet *)self->_backgroundLocationUpdateItems count] == 0;
  }
  id v5 = [(NSMutableArray *)self->_reverseGeocodeItems count];
  unint64_t v6 = (unint64_t)[(NSMutableSet *)self->_stationsUpdateItems count];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_merchantCleanupItems count];
  os_unfair_lock_unlock(p_itemsLock);
  BOOL v8 = (v6 | v7) != 0;
  if (v5) {
    BOOL v8 = 1;
  }
  int v9 = !v4 || v8;
  if (!self->_active && v9)
  {
    self->_active = 1;
    unint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activating transaction processor...", buf, 2u);
    }

    int v11 = (void ***)v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    unsigned int v12 = sub_1004C270C;
LABEL_20:
    v11[2] = (void **)v12;
    v11[3] = (void **)&unk_100756678;
    v11[4] = (void **)&self->super.isa;
    -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v14, v15);
    return;
  }
  if (!self->_active) {
    LOBYTE(v9) = 1;
  }
  if ((v9 & 1) == 0)
  {
    self->_active = 0;
    unsigned int v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deactivating transaction processor...", buf, 2u);
    }

    int v11 = &v14;
    unint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    unsigned int v12 = sub_1004C276C;
    goto LABEL_20;
  }
}

- (void)_processPaymentTransactionForLocationUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 processedForLocation] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    int v9 = [WeakRetained paymentApplicationForTransactionSource:v7];

    unint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      unsigned int v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Processing Transaction For Location: %@, Payment Application: %@", (uint8_t *)&v26, 0x16u);
    }

    int v11 = [(PDPaymentTransactionProcessor *)self _pendingLocationUpdateItemForTransaction:v6];
    if (v11)
    {
      unsigned int v12 = v11;
      [(PDPaymentTransactionProcessorItem *)v11 setPaymentTransaction:v6];
LABEL_26:

      goto LABEL_27;
    }
    unsigned int v12 = objc_alloc_init(PDPaymentTransactionProcessorItem);
    id v13 = [v6 effectiveTransactionSource];
    [(PDPaymentTransactionProcessorItem *)v12 setPaymentTransaction:v6];
    [(PDPaymentTransactionProcessorItem *)v12 setTransactionSourceIdentifier:v7];
    [(PDPaymentTransactionProcessorItem *)v12 setUseBackgroundLocation:v13 == (id)5];
    BOOL v14 = [v9 paymentNetworkIdentifier] == (id)117
       && [v6 transactionType] == (id)2
       && [v6 transitType] != (id)3;
    if (v13 == (id)5) {
      int v15 = PKMerchantLookupLocationServicesEnabled();
    }
    else {
      int v15 = PKLocationServicesEnabled();
    }
    if ((v14 | v15 ^ 1))
    {
      if (!v14) {
        PKAnalyticsSendEvent();
      }
      [(PDPaymentTransactionProcessor *)self _updateLocation:0 forLocationUpdateItem:v12 andMarkAsProcessed:1];
      goto LABEL_26;
    }
    PKAnalyticsSendEvent();
    uint64_t v16 = 56;
    if (v13 == (id)5) {
      uint64_t v16 = 64;
    }
    id v17 = *(id *)((char *)&self->super.isa + v16);
    id v18 = [v17 location];
    if (sub_1004C13C0(v18, v17, v6))
    {
      [(PDPaymentTransactionProcessorItem *)v12 setFoundOptimalLocation:1];
      id v19 = self;
      unsigned int v20 = v18;
    }
    else
    {
      v21 = [v6 transactionDate];
      [v21 timeIntervalSinceNow];
      double v23 = fabs(v22);

      if (v23 <= 300.0)
      {
        [(PDPaymentTransactionProcessor *)self _continueUpdatingLocationForTransactionUpdateItem:v12];
        if (!sub_1004C2ACC(v18, v17, v6)) {
          goto LABEL_25;
        }
        id v19 = self;
        unsigned int v20 = v18;
        v24 = v12;
        uint64_t v25 = 0;
LABEL_24:
        [(PDPaymentTransactionProcessor *)v19 _updateLocation:v20 forLocationUpdateItem:v24 andMarkAsProcessed:v25];
LABEL_25:

        goto LABEL_26;
      }
      id v19 = self;
      unsigned int v20 = 0;
    }
    v24 = v12;
    uint64_t v25 = 1;
    goto LABEL_24;
  }
LABEL_27:
}

- (void)_continueUpdatingLocationForTransactionUpdateItem:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_itemsLock);
  unsigned int v4 = [v6 useBackgroundLocation];
  uint64_t v5 = 16;
  if (v4) {
    uint64_t v5 = 24;
  }
  [*(id *)((char *)&self->super.isa + v5) addObject:v6];
  os_unfair_lock_unlock(&self->_itemsLock);
  if ([v6 useBackgroundLocation]) {
    [(PDPaymentTransactionProcessor *)self _startUpdatingBackgroundLocationIfPossible];
  }
  else {
    [(PDPaymentTransactionProcessor *)self _startUpdatingLocationIfPossible];
  }
}

- (void)_updateLocation:(id)a3 forLocationUpdateItem:(id)a4 andMarkAsProcessed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [v9 transactionSourceIdentifier];
  int v11 = [v9 paymentTransaction];
  if ([v11 processedForLocation])
  {
    unsigned int v12 = v8;
    goto LABEL_35;
  }
  [v11 setProcessedForLocation:v5];
  [v11 addUpdateReasons:128];
  if (v8)
  {
    unsigned int v13 = [v9 useBackgroundLocation];
    uint64_t v14 = 56;
    if (v13) {
      uint64_t v14 = 64;
    }
    id v15 = [*(id *)((char *)&self->super.isa + v14) _limitsPrecision];
    [v11 setLocation:v8];
    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Transaction Location saved", buf, 2u);
    }

    [v11 setCoarseLocation:v15];
    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v16 = PKLogFacilityTypeGetObject();
LABEL_11:
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v36 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Transaction Location Updated: %@", buf, 0xCu);
    }

    PKAnalyticsSendEvent();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_usageNotificationServer);
    [WeakRetained notifyPaymentPassUsedWithTransactionInfo:v11];

    unsigned int v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    unsigned __int8 v31 = sub_1004C30F0;
    BOOL v32 = &unk_100756650;
    id v33 = v11;
    id v34 = v10;
    [(PDPaymentTransactionProcessor *)self _accessObserversWithHandler:&v29];
  }
  unsigned int v12 = objc_msgSend(v11, "location", v29, v30, v31, v32);

  if (v5)
  {
    if (v9)
    {
      os_unfair_lock_lock(&self->_itemsLock);
      unsigned int v18 = [v9 useBackgroundLocation];
      uint64_t v19 = 16;
      if (v18) {
        uint64_t v19 = 24;
      }
      [*(id *)((char *)&self->super.isa + v19) removeObject:v9];
      os_unfair_lock_unlock(&self->_itemsLock);
    }
    if (v12)
    {
      [v9 foundOptimalLocation];
      PKAnalyticsSendEvent();
      unsigned int v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v11 identifier];
        *(_DWORD *)buf = 138412290;
        double v36 = *(double *)&v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Reverse geocoding final location update: %@", buf, 0xCu);
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double v22 = [v11 transactionDate];
        double v23 = [v12 timestamp];
        [v22 timeIntervalSinceDate:v23];
        *(_DWORD *)buf = 134217984;
        double v36 = fabs(v24);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Transaction/Location Delta: %.1f", buf, 0xCu);
      }
      PKGreenTeaLogger();
      uint64_t v25 = getCTGreenTeaOsLogHandle();
      int v26 = v25;
      if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Transmitting transaction location for reverse geocoding", buf, 2u);
      }

      id v27 = [(PDPaymentTransactionProcessor *)self _pendingReverseGeocodeUpdateItemForTransaction:v11];
      __int16 v28 = v27;
      if (v27)
      {
        [v27 setPaymentTransaction:v11];
      }
      else
      {
        os_unfair_lock_lock(&self->_itemsLock);
        [(NSMutableArray *)self->_reverseGeocodeItems addObject:v9];
        os_unfair_lock_unlock(&self->_itemsLock);
      }
      [(PDPaymentTransactionProcessor *)self _beginReverseGeocodingIfPossible];
    }
    else
    {
      if (PKLocationServicesEnabled()) {
        PKAnalyticsSendEvent();
      }
      [(PDPaymentTransactionProcessor *)self _processItemForStationsCleanup:v9];
      [(PDPaymentTransactionProcessor *)self _updateActiveState];
    }
    [(PDPaymentTransactionProcessor *)self _reportTransactionWithFinalLocation:v11];
  }
LABEL_35:
}

- (void)_reportTransactionWithFinalLocation:(id)a3
{
  id v19 = a3;
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:12];
  if ([v19 transactionType] == (id)2)
  {
    uint64_t v4 = (uint64_t)[v19 transitType];
    if (v4 <= 512)
    {
      CFStringRef v5 = @"bus";
      switch(v4)
      {
        case 0:
          CFStringRef v5 = @"unknownTransitType";
          break;
        case 1:
          CFStringRef v5 = @"transit";
          break;
        case 2:
          CFStringRef v5 = @"metro";
          break;
        case 3:
          break;
        case 4:
          CFStringRef v5 = @"train";
          break;
        case 5:
          CFStringRef v5 = @"other";
          break;
        case 6:
          CFStringRef v5 = @"special";
          break;
        case 7:
          CFStringRef v5 = @"lightrail";
          break;
        case 8:
          CFStringRef v5 = @"cableCar";
          break;
        default:
          switch(v4)
          {
            case 257:
              CFStringRef v5 = @"shinkansen";
              break;
            case 258:
              CFStringRef v5 = @"maglev";
              break;
            case 259:
              CFStringRef v5 = @"taxi";
              break;
            case 260:
              CFStringRef v5 = @"ferry";
              break;
            case 261:
              CFStringRef v5 = @"bike";
              break;
            default:
LABEL_18:
              CFStringRef v5 = @"unknown";
              break;
          }
          break;
      }
    }
    else
    {
      switch(v4)
      {
        case 513:
          CFStringRef v5 = @"deposit";
          break;
        case 514:
          CFStringRef v5 = @"refund";
          break;
        case 515:
          CFStringRef v5 = @"purchase";
          break;
        case 516:
          CFStringRef v5 = @"withdrawal";
          break;
        case 517:
          CFStringRef v5 = @"cardRead";
          break;
        case 518:
          CFStringRef v5 = @"renewal";
          break;
        default:
          if (v4 == 1025)
          {
            CFStringRef v5 = @"greenCar";
          }
          else
          {
            if (v4 != 1026) {
              goto LABEL_18;
            }
            CFStringRef v5 = @"metroUpgrade";
          }
          break;
      }
    }
    [v3 setObject:v5 forKeyedSubscript:@"transitType"];
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 transitModifiers]);
    [v3 setObject:v6 forKeyedSubscript:@"transitModifiers"];
  }
  [v19 transactionStatus];
  id v7 = PKPaymentTransactionStatusToString();
  [v3 setObject:v7 forKeyedSubscript:@"transactionStatus"];

  [v19 transactionType];
  id v8 = PKPaymentTransactionTypeToString();
  [v3 setObject:v8 forKeyedSubscript:@"transactionType"];

  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 technologyType]);
  [v3 setObject:v9 forKeyedSubscript:@"technologyType"];

  id v10 = [v19 transactionSource];
  if ((unint64_t)v10 > 8) {
    CFStringRef v11 = @"unknown";
  }
  else {
    CFStringRef v11 = *(&off_100756960 + (void)v10);
  }
  [v3 setObject:v11 forKeyedSubscript:@"transactionSource"];
  uint64_t v12 = PKLocationServicesEnabled();
  unsigned int v13 = +[NSNumber numberWithBool:v12];
  [v3 setObject:v13 forKeyedSubscript:@"locationServicesEnabled"];

  if (v12)
  {
    uint64_t v14 = [v19 location];
    [v14 horizontalAccuracy];
    id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"horizontalAccuracy"];

    uint64_t v16 = [v14 timestamp];
    id v17 = [v19 transactionDate];
    [v16 timeIntervalSinceDate:v17];
    unsigned int v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v18 forKeyedSubscript:@"timeAccuracy"];
  }
  [v3 setObject:PKAnalyticsReportEventTypePaymentTransactionUpdatedForLocation forKeyedSubscript:PKAnalyticsReportEventKey];
  +[PKAnalyticsReporter sendSingularEvent:v3];
}

- (void)_abortUpdatingLocationForLocationUpdateItem:(id)a3
{
  id v11 = a3;
  unsigned int v4 = [v11 useBackgroundLocation];
  uint64_t v5 = 56;
  if (v4) {
    uint64_t v5 = 64;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  id v7 = [v6 location];
  id v8 = [v11 paymentTransaction];
  BOOL v9 = sub_1004C2ACC(v7, v6, v8);

  if (v9)
  {
    id v10 = v7;
  }
  else
  {
    PKAnalyticsSendEvent();
    id v10 = 0;
  }
  [(PDPaymentTransactionProcessor *)self _updateLocation:v10 forLocationUpdateItem:v11 andMarkAsProcessed:1];
}

- (void)_abortUpdatingLocationForAllLocationUpdateItems
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = [(NSMutableSet *)self->_locationUpdateItems copy];
  os_unfair_lock_unlock(p_itemsLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004C3738;
  v5[3] = &unk_1007566A0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  [(PDPaymentTransactionProcessor *)self _stopUpdatingLocationIfPossible];
}

- (void)_abortUpdatingLocationForAllBackgroundLocationUpdateItems
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = [(NSMutableSet *)self->_backgroundLocationUpdateItems copy];
  os_unfair_lock_unlock(p_itemsLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004C37F4;
  v5[3] = &unk_1007566A0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  [(PDPaymentTransactionProcessor *)self _stopUpdatingLocationIfPossible];
}

- (void)_startUpdatingLocationIfPossible
{
  if (PKLocationServicesEnabled())
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting Location Updates...", buf, 2u);
    }

    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    locationUpdateTimeoutTimer = self->_locationUpdateTimeoutTimer;
    if (locationUpdateTimeoutTimer) {
      dispatch_source_cancel(locationUpdateTimeoutTimer);
    }
    uint64_t v5 = PDDefaultQueue();
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    id v7 = self->_locationUpdateTimeoutTimer;
    self->_locationUpdateTimeoutTimer = v6;

    id v8 = self->_locationUpdateTimeoutTimer;
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(PKLocationAssertionGracePeriod * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    id v10 = self->_locationUpdateTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004C395C;
    handler[3] = &unk_10072E1E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_locationUpdateTimeoutTimer);
  }
}

- (void)_startUpdatingBackgroundLocationIfPossible
{
  if (PKMerchantLookupLocationServicesEnabled())
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting Background Location Updates...", buf, 2u);
    }

    [(CLLocationManager *)self->_backgroundMerchantLocationManager startUpdatingLocation];
    backgroundLocationUpdateTimer = self->_backgroundLocationUpdateTimer;
    if (backgroundLocationUpdateTimer) {
      dispatch_source_cancel(backgroundLocationUpdateTimer);
    }
    uint64_t v5 = PDDefaultQueue();
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    id v7 = self->_backgroundLocationUpdateTimer;
    self->_backgroundLocationUpdateTimer = v6;

    id v8 = self->_backgroundLocationUpdateTimer;
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(PKLocationAssertionGracePeriod * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    id v10 = self->_backgroundLocationUpdateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004C3B30;
    handler[3] = &unk_10072E1E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_backgroundLocationUpdateTimer);
  }
}

- (void)_stopUpdatingLocationIfPossible
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = [(NSMutableSet *)self->_locationUpdateItems count];
  id v5 = [(NSMutableSet *)self->_backgroundLocationUpdateItems count];
  os_unfair_lock_unlock(p_itemsLock);
  if (!v4)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping Location Updates...", buf, 2u);
    }

    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    locationUpdateTimeoutTimer = self->_locationUpdateTimeoutTimer;
    if (locationUpdateTimeoutTimer)
    {
      dispatch_source_cancel(locationUpdateTimeoutTimer);
      id v8 = self->_locationUpdateTimeoutTimer;
      self->_locationUpdateTimeoutTimer = 0;
    }
  }
  if (!v5)
  {
    dispatch_time_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Stopping Background Location Updates...", v12, 2u);
    }

    [(CLLocationManager *)self->_backgroundMerchantLocationManager stopUpdatingLocation];
    backgroundLocationUpdateTimer = self->_backgroundLocationUpdateTimer;
    if (backgroundLocationUpdateTimer)
    {
      dispatch_source_cancel(backgroundLocationUpdateTimer);
      id v11 = self->_backgroundLocationUpdateTimer;
      self->_backgroundLocationUpdateTimer = 0;
    }
  }
}

- (void)_beginReverseGeocodingIfPossible
{
  if (![(CLGeocoder *)self->_geocoder isGeocoding])
  {
    os_unfair_lock_lock(&self->_itemsLock);
    id v3 = [(NSMutableArray *)self->_reverseGeocodeItems firstObject];
    id v4 = [v3 paymentTransaction];
    id v5 = [v4 location];

    os_unfair_lock_unlock(&self->_itemsLock);
    geocoder = self->_geocoder;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1004C3DD4;
    v8[3] = &unk_100747570;
    void v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [(CLGeocoder *)geocoder reverseGeocodeLocation:v7 completionHandler:v8];
  }
}

- (id)_pendingReverseGeocodeUpdateItemForTransaction:(id)a3
{
  id v4 = a3;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v6 = [v4 identifier];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = self->_reverseGeocodeItems;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    id v19 = v4;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v13 = [v12 paymentTransaction];
        uint64_t v14 = [v13 identifier];
        int v15 = PKEqualObjects();

        if (v15)
        {
          id v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v6;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found pending reverse geocode update item for transaction identifier: %@", buf, 0xCu);
          }

          id v16 = v12;
          goto LABEL_13;
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    id v16 = 0;
LABEL_13:
    id v4 = v19;
  }
  else
  {
    id v16 = 0;
  }

  os_unfair_lock_unlock(p_itemsLock);
  return v16;
}

- (void)_processPaymentTransactionForStationsUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PDPaymentTransactionProcessor *)self _pendingStationsUpdateItemForTransaction:v9];
  if (v7)
  {
    id v8 = v7;
    [(PDPaymentTransactionProcessorItem *)v7 setPaymentTransaction:v9];
  }
  else
  {
    id v8 = objc_alloc_init(PDPaymentTransactionProcessorItem);
    [(PDPaymentTransactionProcessorItem *)v8 setPaymentTransaction:v9];
    [(PDPaymentTransactionProcessorItem *)v8 setTransactionSourceIdentifier:v6];
  }
  [(PDPaymentTransactionProcessor *)self _processItemForStationsCleanup:v8];
}

- (void)_processItemForStationsCleanup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 paymentTransaction];
  if ([v5 processedForStations])
  {
    [(PDPaymentTransactionProcessor *)self _processItemForMerchantCleanup:v4 clearingAttempt:0];
  }
  else
  {
    id v6 = [(PDPaymentTransactionProcessor *)self _pendingStationsUpdateItemForTransaction:v5];

    if (!v6)
    {
      id v7 = [v4 transactionSourceIdentifier];
      if ([v5 transactionType] == (id)2
        || ([v5 startStationCode], (id v8 = objc_claimAutoreleasedReturnValue()) != 0)
        && ([v5 endStationCode],
            id v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        uint64_t v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v5 identifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Processing Transaction For Stations: %@", (uint8_t *)&buf, 0xCu);
        }
        os_unfair_lock_lock(&self->_itemsLock);
        [(NSMutableSet *)self->_stationsUpdateItems addObject:v4];
        os_unfair_lock_unlock(&self->_itemsLock);
        id v23 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v65 = 0x3032000000;
        v66 = sub_100020E78;
        v67 = sub_100021230;
        id v68 = [v5 stationCodeProvider];
        uint64_t v12 = [v5 cityCode];

        if (v12)
        {
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_1004C4E34;
          v58[3] = &unk_10072E610;
          p_long long buf = &buf;
          id v59 = v5;
          [v23 addOperation:v58];
        }
        v56[0] = 0;
        v56[1] = v56;
        v56[2] = 0x3032000000;
        v56[3] = sub_100020E78;
        v56[4] = sub_100021230;
        id v57 = 0;
        v54[0] = 0;
        v54[1] = v54;
        v54[2] = 0x3032000000;
        v54[3] = sub_100020E78;
        v54[4] = sub_100021230;
        id v55 = 0;
        v52[0] = 0;
        v52[1] = v52;
        v52[2] = 0x3032000000;
        v52[3] = sub_100020E78;
        v52[4] = sub_100021230;
        id v53 = 0;
        v50[0] = 0;
        v50[1] = v50;
        v50[2] = 0x3032000000;
        v50[3] = sub_100020E78;
        v50[4] = sub_100021230;
        id v51 = 0;
        unsigned int v13 = objc_msgSend(v5, "startStationCode", v7);
        uint64_t v14 = [v5 endStationCode];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1004C5338;
        v41[3] = &unk_100756808;
        v41[4] = self;
        v45 = &buf;
        id v15 = v5;
        id v42 = v15;
        id v16 = v13;
        id v43 = v16;
        unsigned int v46 = v56;
        id v17 = v14;
        id v44 = v17;
        int v47 = v52;
        CFStringRef v48 = v54;
        __int16 v49 = v50;
        [v23 addOperation:v41];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1004C5E20;
        v32[3] = &unk_100756858;
        double v36 = v56;
        id v37 = v52;
        id v33 = v15;
        id v18 = v16;
        id v34 = v18;
        id v19 = v17;
        id v35 = v19;
        uint64_t v38 = &buf;
        uint64_t v39 = v54;
        objc_super v40 = v50;
        [v23 addOperation:v32];
        long long v20 = +[NSNull null];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1004C64B4;
        v24[3] = &unk_1007568A8;
        __int16 v28 = v56;
        unsigned int v29 = v54;
        uint64_t v30 = v52;
        unsigned __int8 v31 = v50;
        id v25 = v4;
        int v26 = self;
        id v27 = v22;
        id v21 = [v23 evaluateWithInput:v20 completion:v24];

        id v7 = v22;
        _Block_object_dispose(v50, 8);

        _Block_object_dispose(v52, 8);
        _Block_object_dispose(v54, 8);

        _Block_object_dispose(v56, 8);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        if (([v5 processedForStations] & 1) == 0)
        {
          [v5 setProcessedForStations:1];
          [v5 addUpdateReasons:128];
        }
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1004C4E28;
        v61[3] = &unk_100756650;
        id v62 = v5;
        id v63 = v7;
        [(PDPaymentTransactionProcessor *)self _accessObserversWithHandler:v61];
        [(PDPaymentTransactionProcessor *)self _processItemForMerchantCleanup:v4 clearingAttempt:0];

        id v23 = v62;
      }
    }
  }
}

- (void)_processPaymentTransactionForMerchantCleanup:(id)a3 forTransactionSourceIdentifier:(id)a4 clearingAttempt:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(PDPaymentTransactionProcessor *)self _pendingMerchantCleanupItemForTransaction:v11];
  if (v9)
  {
    uint64_t v10 = v9;
    [(PDPaymentTransactionProcessorItem *)v9 setPaymentTransaction:v11];
  }
  else
  {
    uint64_t v10 = objc_alloc_init(PDPaymentTransactionProcessorItem);
    [(PDPaymentTransactionProcessorItem *)v10 setPaymentTransaction:v11];
    [(PDPaymentTransactionProcessorItem *)v10 setTransactionSourceIdentifier:v8];
  }
  [(PDPaymentTransactionProcessor *)self _processItemForMerchantCleanup:v10 clearingAttempt:v5];
}

- (void)_processPaymentTransactionForMapsData:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v11 = 0;
  id v5 = a3;
  +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForTransaction:v5 outConfiguration:&v11];
  id v6 = v11;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = v7;
  if (v6) {
    [v7 addObject:v6];
  }

  id v10 = 0;
  +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForTransaction:v5 outConfiguration:&v10];

  id v9 = v10;
  if (v9) {
    [v8 addObject:v9];
  }
  if ([v8 count]) {
    [(PDMapsBrandAndMerchantUpdater *)self->_mapsBrandAndMerchantUpdater updateMapsDataForConfigurations:v8];
  }
}

- (void)_processItemForMerchantCleanup:(id)a3 clearingAttempt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 transactionSourceIdentifier];
  id v8 = [v6 paymentTransaction];
  unsigned int v9 = [(PDPaymentTransactionProcessor *)self _canUpdateMapsDataForTransaction:v8];
  unsigned int v10 = [v8 processedForMerchantCleanup];
  unsigned int v11 = [v8 requiresMerchantReprocessing];
  if (v10 && !v11
    || ([(PDPaymentTransactionProcessor *)self _pendingMerchantCleanupItemForTransaction:v8], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (v9) {
      [(PDPaymentTransactionProcessor *)self _processPaymentTransactionForMapsData:v8 forTransactionSourceIdentifier:v7];
    }
  }
  else
  {
    unsigned int v21 = [v8 hasBackingData];
    unsigned int v13 = [v8 processedForLocation];
    uint64_t v14 = [v8 merchant];
    id v15 = v8;
    id v16 = [v15 merchant];
    unsigned __int8 v17 = [v15 hasBackingData];
    BOOL v18 = ![v16 isValid] && (v17 & 1) != 0
       || [v15 featureIdentifier] == (id)4
       && ((unint64_t)[v15 transactionType] & 0xFFFFFFFFFFFFFFFELL) == 6;

    if (([v14 isValid] & v21 & v13) == 1
      && ([v15 transactionType] == (id)15 ? (char v19 = 1) : (char v19 = v18), (v19 & 1) == 0))
    {
      PKAnalyticsSendEvent();
      [v6 setIsClearingAttempt:v4];
      long long v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Adding maps lookup request for updateItem: %@", buf, 0xCu);
      }

      os_unfair_lock_lock(&self->_itemsLock);
      [(NSMutableArray *)self->_merchantCleanupItems addObject:v6];
      os_unfair_lock_unlock(&self->_itemsLock);
      [(PDPaymentTransactionProcessor *)self _beginMerchantCleanupIfPossible];
    }
    else if (v18 || [v15 transactionType] == (id)2)
    {
      if (([v15 processedForMerchantCleanup] & 1) == 0)
      {
        [v15 setProcessedForMerchantCleanup:1];
        [v15 addUpdateReasons:128];
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1004C6B9C;
      v22[3] = &unk_100756650;
      id v23 = v15;
      id v24 = v7;
      [(PDPaymentTransactionProcessor *)self _accessObserversWithHandler:v22];
    }
  }
}

- (BOOL)_canUpdateMapsDataForTransaction:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForTransaction:v3 outConfiguration:0];
  unsigned int v5 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForTransaction:v3 outConfiguration:0];
  if (PKIsPhone()) {
    unsigned int v6 = (v4 | v5) & ~[v3 updateReasonIsInitialDownload];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_beginMerchantCleanupIfPossible
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  if (self->_processingMerchantCleanupItems)
  {
    unsigned int v4 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      os_unfair_lock_unlock(p_itemsLock);
      return;
    }
    *(_WORD *)long long buf = 0;
    unsigned int v5 = "Currently processing a map lookup request pending. The next request will process when the current one completes.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    goto LABEL_5;
  }
  uint64_t v6 = [(NSMutableArray *)self->_merchantCleanupItems firstObject];
  if (!v6)
  {
    unsigned int v4 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_WORD *)long long buf = 0;
    unsigned int v5 = "No items for a maps lookup request";
    goto LABEL_4;
  }
  id v7 = (void *)v6;
  self->_processingMerchantCleanupItems = 1;
  os_unfair_lock_unlock(p_itemsLock);
  id v8 = [v7 paymentTransaction];
  unsigned int v9 = [v7 transactionSourceIdentifier];
  id v10 = [v7 isClearingAttempt];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v12 = [WeakRetained paymentApplicationForTransactionSource:v9];

  id v13 = [objc_alloc((Class)PKTransactionMerchantLookupSource) initWithTransaction:v8 paymentApplication:v12];
  [v13 setClearingAttempt:v10];
  id v14 = [objc_alloc((Class)PKMerchantLookupRequest) initWithSource:v13];
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Processing Transaction For Merchant Cleanup: %@, Payment Application: %@", buf, 0x16u);
  }

  PKGreenTeaLogger();
  id v16 = getCTGreenTeaOsLogHandle();
  unsigned __int8 v17 = v16;
  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Transmitting transaction location for maps local search", buf, 2u);
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Starting maps lookup request: %@", buf, 0xCu);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1004C6F7C;
  v21[3] = &unk_1007568D0;
  id v22 = v14;
  id v23 = self;
  char v26 = (char)v10;
  id v24 = v7;
  id v25 = v9;
  id v18 = v9;
  id v19 = v7;
  id v20 = v14;
  [v20 startLookupWithCompletion:v21];
}

- (void)_processForLocalMCCLookup:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!self->_categoryCodeMap)
  {
    unsigned int v5 = (PKMerchantCategoryCodeMap *)objc_alloc_init((Class)PKMerchantCategoryCodeMap);
    categoryCodeMap = self->_categoryCodeMap;
    self->_categoryCodeMap = v5;

    id v4 = v10;
  }
  id v7 = [v4 paymentTransaction];
  id v8 = [v7 merchant];

  uint64_t v9 = (uint64_t)[v8 industryCode];
  if (v9 >= 1) {
    objc_msgSend(v8, "setFallbackcategory:", -[PKMerchantCategoryCodeMap categoryForIndustryCode:](self->_categoryCodeMap, "categoryForIndustryCode:", v9));
  }
}

- (id)_pendingLocationUpdateItemForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  unsigned int v21 = sub_100020E78;
  id v22 = sub_100021230;
  id v23 = 0;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  locationUpdateItems = self->_locationUpdateItems;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004C7708;
  v15[3] = &unk_1007568F8;
  id v7 = v4;
  id v16 = v7;
  unsigned __int8 v17 = &v18;
  [(NSMutableSet *)locationUpdateItems enumerateObjectsUsingBlock:v15];
  backgroundLocationUpdateItems = self->_backgroundLocationUpdateItems;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004C7840;
  v12[3] = &unk_1007568F8;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v18;
  [(NSMutableSet *)backgroundLocationUpdateItems enumerateObjectsUsingBlock:v12];
  os_unfair_lock_unlock(p_itemsLock);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)_pendingStationsUpdateItemForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100020E78;
  unsigned __int8 v17 = sub_100021230;
  id v18 = 0;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  stationsUpdateItems = self->_stationsUpdateItems;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004C7AC4;
  v10[3] = &unk_1007568F8;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  [(NSMutableSet *)stationsUpdateItems enumerateObjectsUsingBlock:v10];
  os_unfair_lock_unlock(p_itemsLock);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_pendingMerchantCleanupItemForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100020E78;
  unsigned __int8 v17 = sub_100021230;
  id v18 = 0;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  merchantCleanupItems = self->_merchantCleanupItems;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004C7D48;
  v10[3] = &unk_100756920;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  [(NSMutableArray *)merchantCleanupItems enumerateObjectsUsingBlock:v10];
  os_unfair_lock_unlock(p_itemsLock);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (PDPaymentTransactionProcessorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PDPaymentTransactionProcessorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PKUsageNotificationServer)usageNotificationServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usageNotificationServer);
  return (PKUsageNotificationServer *)WeakRetained;
}

- (void)setUsageNotificationServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_usageNotificationServer);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_mapsBrandAndMerchantUpdater, 0);
  objc_storeStrong((id *)&self->_categoryCodeMap, 0);
  objc_storeStrong((id *)&self->_backgroundLocationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_backgroundMerchantLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_merchantCleanupItems, 0);
  objc_storeStrong((id *)&self->_stationsUpdateItems, 0);
  objc_storeStrong((id *)&self->_reverseGeocodeItems, 0);
  objc_storeStrong((id *)&self->_backgroundLocationUpdateItems, 0);
  objc_storeStrong((id *)&self->_locationUpdateItems, 0);
}

@end