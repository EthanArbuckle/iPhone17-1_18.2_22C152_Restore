@interface RideBookingDataCoordinator
+ (void)openRideBookingApplication:(id)a3 withUserActivity:(id)a4;
- (BOOL)waitingAppSuggestionsToLoad;
- (CLPlacemark)requestRideDropoffLocation;
- (CLPlacemark)requestRidePickupLocation;
- (GEOMapItemStorage)destination;
- (GEOMapItemStorage)origin;
- (NSHashTable)requestRideObservers;
- (NSHashTable)rideOptionStateObservers;
- (NSHashTable)rideStatusObservers;
- (NSMutableArray)appStoreSuggestions;
- (NSMutableArray)installedSuggestions;
- (NSMutableDictionary)applications;
- (NSMutableDictionary)completedRideIdentifiersAndDatesMap;
- (NSMutableDictionary)rideOptionStatusMap;
- (NSMutableDictionary)rideStatusMap;
- (NSUUID)requestRideEtaUpdateIdentifier;
- (OS_dispatch_queue)processQueue;
- (OS_dispatch_source)refreshRideOptionsTimer;
- (OS_dispatch_source)requestRideExpireTimer;
- (RideBookingApplication)requestRideApplication;
- (RideBookingApplicationFinder)applicationFinder;
- (RideBookingDataCoordinator)init;
- (RideBookingDataCoordinator)initWithRideBookingApplicationFinder:(id)a3;
- (RideBookingPassengersChoice)requestRidePassengersChoice;
- (RideBookingPaymentMethod)requestRidePaymentMethod;
- (RideBookingRequestRideStatus)requestRideStatus;
- (RideBookingRideOption)requestRideOption;
- (void)_broadcastRequestRideStatusDidChange;
- (void)_broadcastRideOptionStateDidChange;
- (void)_broadcastRideStatusDidChange;
- (void)_cleanRequestLocationNames;
- (void)_expireRequestRideStatus;
- (void)_flushCompletedRideIdentifiersAndDatesMap;
- (void)_refreshRideOptions;
- (void)_resetRequestRide;
- (void)_startRefreshRideOptionsTimer;
- (void)_startRequestRideExpireTimerWithExpirationDate:(id)a3;
- (void)_startTimer:(id *)a3 withInterval:(double)a4 repeats:(BOOL)a5 block:(id)a6;
- (void)_stopRefreshRideOptionsTimer;
- (void)_stopRequestRideExpireTimer;
- (void)_stopTimer:(id *)a3;
- (void)_updateRequestRidePickupAndDropoffLocations;
- (void)_updateRequestRideStatus:(id)a3;
- (void)_updateRideOptionStatusMapForOrigin:(id)a3 destination:(id)a4 application:(id)a5;
- (void)_updateRideOptionStatusMapWithApplication:(id)a3 status:(id)a4;
- (void)_updateRideStatusMapForApplication:(id)a3;
- (void)_updateRideStatusMapWithApplication:(id)a3 status:(id)a4;
- (void)addRideBookingDataCoordinatorRequestRideObserver:(id)a3;
- (void)addRideBookingDataCoordinatorRideOptionStateObserver:(id)a3;
- (void)addRideBookingDataCoordinatorRideStatusObserver:(id)a3;
- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4;
- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4;
- (void)cleanMapItemName:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)enableRideBookingApplications:(id)a3;
- (void)removeRideBookingDataCoordinatorRequestRideObserver:(id)a3;
- (void)removeRideBookingDataCoordinatorRideOptionStateObserver:(id)a3;
- (void)removeRideBookingDataCoordinatorRideStatusObserver:(id)a3;
- (void)requestRideWithCompletion:(id)a3;
- (void)rideBookingApplicationsDidChange:(id)a3;
- (void)rideStatusDidChange:(id)a3;
- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6;
- (void)setAppStoreSuggestions:(id)a3;
- (void)setApplicationFinder:(id)a3;
- (void)setApplications:(id)a3;
- (void)setCompletedRideIdentifiersAndDatesMap:(id)a3;
- (void)setDestination:(id)a3;
- (void)setInstalledSuggestions:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setProcessQueue:(id)a3;
- (void)setRefreshRideOptionsTimer:(id)a3;
- (void)setRequestRideApplication:(id)a3;
- (void)setRequestRideDropoffLocation:(id)a3;
- (void)setRequestRideEtaUpdateIdentifier:(id)a3;
- (void)setRequestRideExpireTimer:(id)a3;
- (void)setRequestRideObservers:(id)a3;
- (void)setRequestRideOption:(id)a3;
- (void)setRequestRidePassengersChoice:(id)a3;
- (void)setRequestRidePaymentMethod:(id)a3;
- (void)setRequestRidePickupLocation:(id)a3;
- (void)setRequestRideStatus:(id)a3;
- (void)setRideOptionStateObservers:(id)a3;
- (void)setRideOptionStatusMap:(id)a3;
- (void)setRideStatusMap:(id)a3;
- (void)setRideStatusObservers:(id)a3;
- (void)setWaitingAppSuggestionsToLoad:(BOOL)a3;
- (void)startRequestRideForRideOption:(id)a3;
- (void)updateRequestRidePassengers:(id)a3;
- (void)updateRequestRidePaymentMethod:(id)a3;
- (void)updateRequestRideStartingWaypointCoordinate:(CLLocationCoordinate2D)a3;
- (void)updateRideOptionStateForOrigin:(id)a3 destination:(id)a4;
- (void)updateRideStatusMap;
@end

@implementation RideBookingDataCoordinator

- (RideBookingDataCoordinator)init
{
  v3 = [[RideBookingDataCoordinator alloc] initWithRideBookingApplicationFinder:0];

  return v3;
}

- (void)_flushCompletedRideIdentifiersAndDatesMap
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021CB4;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)addRideBookingDataCoordinatorRideStatusObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@, adding observer: %@", v9, v5];
      *(_DWORD *)buf = 136315394;
      v17 = v7;
      __int16 v18 = 2112;
      *(void *)v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004FA98;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)v19 = 805;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator addRideBookingDataCoordinatorRideStatusObserver:]";
      __int16 v20 = 2082;
      v21 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRideStatusObserver to be added", buf, 0x26u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedRideIdentifiersAndDatesMap, 0);
  objc_storeStrong((id *)&self->_rideStatusMap, 0);
  objc_storeStrong((id *)&self->_rideStatusObservers, 0);
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_storeStrong((id *)&self->_requestRidePassengersChoice, 0);
  objc_storeStrong((id *)&self->_requestRidePaymentMethod, 0);
  objc_storeStrong((id *)&self->_requestRideEtaUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_requestRideExpireTimer, 0);
  objc_storeStrong((id *)&self->_requestRideDropoffLocation, 0);
  objc_storeStrong((id *)&self->_requestRidePickupLocation, 0);
  objc_storeStrong((id *)&self->_requestRideApplication, 0);
  objc_storeStrong((id *)&self->_requestRideOption, 0);
  objc_storeStrong((id *)&self->_requestRideObservers, 0);
  objc_storeStrong((id *)&self->_rideOptionStatusMap, 0);
  objc_storeStrong((id *)&self->_installedSuggestions, 0);
  objc_storeStrong((id *)&self->_appStoreSuggestions, 0);
  objc_storeStrong((id *)&self->_rideOptionStateObservers, 0);
  objc_storeStrong((id *)&self->_refreshRideOptionsTimer, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_applicationFinder, 0);

  objc_storeStrong((id *)&self->_processQueue, 0);
}

- (RideBookingDataCoordinator)initWithRideBookingApplicationFinder:(id)a3
{
  v4 = (RideBookingApplicationFinder *)a3;
  v31.receiver = self;
  v31.super_class = (Class)RideBookingDataCoordinator;
  id v5 = [(RideBookingDataCoordinator *)&v31 init];
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Initializing RideBookingDataCoordinator with RideBookingApplicationFinder: %@", v4];
      *(_DWORD *)buf = 136315394;
      v33 = v7;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.maps.RideBookingDataCoordinator", v9);
    processQueue = v5->_processQueue;
    v5->_processQueue = (OS_dispatch_queue *)v10;

    refreshRideOptionsTimer = v5->_refreshRideOptionsTimer;
    v5->_refreshRideOptionsTimer = 0;

    requestRideExpireTimer = v5->_requestRideExpireTimer;
    v5->_requestRideExpireTimer = 0;

    if (!v4) {
      v4 = objc_alloc_init(RideBookingApplicationFinder);
    }
    objc_storeStrong((id *)&v5->_applicationFinder, v4);
    [(RideBookingApplicationFinder *)v5->_applicationFinder setDelegate:v5];
    uint64_t v14 = objc_opt_new();
    applications = v5->_applications;
    v5->_applications = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    rideOptionStatusMap = v5->_rideOptionStatusMap;
    v5->_rideOptionStatusMap = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    rideStatusMap = v5->_rideStatusMap;
    v5->_rideStatusMap = (NSMutableDictionary *)v18;

    __int16 v20 = +[NSUserDefaults standardUserDefaults];
    v21 = [v20 dictionaryForKey:@"RideBookingCompletedRideIdentifiersAndDates"];

    if (v21) {
      v22 = (NSMutableDictionary *)[v21 mutableCopy];
    }
    else {
      v22 = (NSMutableDictionary *)objc_opt_new();
    }
    completedRideIdentifiersAndDatesMap = v5->_completedRideIdentifiersAndDatesMap;
    v5->_completedRideIdentifiersAndDatesMap = v22;

    [(RideBookingDataCoordinator *)v5 _flushCompletedRideIdentifiersAndDatesMap];
    v24 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
    rideOptionStateObservers = v5->_rideOptionStateObservers;
    v5->_rideOptionStateObservers = v24;

    v26 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
    requestRideObservers = v5->_requestRideObservers;
    v5->_requestRideObservers = v26;

    v28 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
    rideStatusObservers = v5->_rideStatusObservers;
    v5->_rideStatusObservers = v28;

    v5->_waitingAppSuggestionsToLoad = 1;
  }

  return v5;
}

- (void)dealloc
{
  [(RideBookingDataCoordinator *)self _stopTimer:&self->_refreshRideOptionsTimer];
  [(RideBookingDataCoordinator *)self _stopTimer:&self->_requestRideExpireTimer];
  v3.receiver = self;
  v3.super_class = (Class)RideBookingDataCoordinator;
  [(RideBookingDataCoordinator *)&v3 dealloc];
}

- (void)_stopTimer:(id *)a3
{
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v7 = objc_alloc((Class)NSString);
    id v8 = NSStringFromSelector(a2);
    id v9 = [v7 initWithFormat:@"%@", v8];
    *(_DWORD *)buf = 136315394;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (!a3)
  {
    dispatch_queue_t v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    id v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Returning because timer==nil"];
    *(_DWORD *)buf = 136315394;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v12;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    goto LABEL_11;
  }
  if (!*a3)
  {
    dispatch_queue_t v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Returning because *timer==nil (pointer)"];
    *(_DWORD *)buf = 136315394;
    id v15 = v13;
    __int16 v16 = 2112;
    id v17 = v12;
    goto LABEL_10;
  }
  dispatch_source_set_timer((dispatch_source_t)*a3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_cancel((dispatch_source_t)*a3);
  dispatch_queue_t v10 = *a3;
  *a3 = 0;
LABEL_11:
}

- (void)updateRideStatusMap
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092BC8;
  block[3] = &unk_1012F0708;
  objc_copyWeak(v11, (id *)buf);
  v11[1] = (id)a2;
  dispatch_async(processQueue, block);
  objc_destroyWeak(v11);
  objc_destroyWeak((id *)buf);
}

- (void)rideBookingApplicationsDidChange:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060C10;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v5;
  id v12 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_broadcastRideOptionStateDidChange
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    v43 = v5;
    __int16 v44 = 2112;
    id v45 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = [(RideBookingDataCoordinator *)self rideOptionStateObservers];
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    uint64_t v34 = *(void *)v38;
    do
    {
      v13 = 0;
      id v35 = v11;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [(RideBookingDataCoordinator *)self rideOptionStatusMap];
          id v16 = [v15 copy];

          if ([(RideBookingDataCoordinator *)self waitingAppSuggestionsToLoad])
          {
            id v17 = 0;
          }
          else
          {
            __int16 v18 = [(RideBookingDataCoordinator *)self appStoreSuggestions];
            id v17 = [v18 copy];
          }
          if ([(RideBookingDataCoordinator *)self waitingAppSuggestionsToLoad])
          {
            id v19 = 0;
          }
          else
          {
            __int16 v20 = [(RideBookingDataCoordinator *)self installedSuggestions];
            id v19 = [v20 copy];
          }
          v36 = v16;
          v21 = +[RideBookingRideOptionState stateWithRideOptionStatusMap:v16 appStoreSuggestions:v17 installedSuggestions:v19];
          v22 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = self;
            v24 = v9;
            v25 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
            id v26 = [objc_alloc((Class)NSString) initWithFormat:@"rideOptionState: %@, appStoreSuggestions:%@ installedSuggestions:%@", v21, v17, v19];
            *(_DWORD *)buf = 136315394;
            v43 = v25;
            id v9 = v24;
            self = v23;
            uint64_t v12 = v34;
            __int16 v44 = 2112;
            id v45 = v26;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
          }
          [v14 rideOptionStateDidChange:v21];

          id v11 = v35;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
  }

  v27 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v29 = objc_alloc((Class)NSString);
    v30 = [(RideBookingDataCoordinator *)self rideOptionStateObservers];
    id v31 = [v30 count];
    v32 = [(RideBookingDataCoordinator *)self rideOptionStateObservers];
    id v33 = [v29 initWithFormat:@"Broadcasted to %lu RideBookingDataCoordinatorRideOptionStateObservers: %@", v31, v32];
    *(_DWORD *)buf = 136315394;
    v43 = v28;
    __int16 v44 = 2112;
    id v45 = v33;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
}

- (NSHashTable)rideOptionStateObservers
{
  return self->_rideOptionStateObservers;
}

- (void)_broadcastRideStatusDidChange
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    v30 = v5;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  id v9 = [(RideBookingDataCoordinator *)self rideStatusMap];
  id v10 = [v9 copy];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [(RideBookingDataCoordinator *)self rideStatusObservers];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v15);
        if (objc_opt_respondsToSelector()) {
          [v16 rideStatusMapDidChange:v10];
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  id v17 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v19 = objc_alloc((Class)NSString);
    __int16 v20 = [(RideBookingDataCoordinator *)self rideStatusObservers];
    id v21 = [v20 count];
    v22 = [(RideBookingDataCoordinator *)self rideStatusObservers];
    id v23 = [v19 initWithFormat:@"Broadcasted to %lu RideBookingDataCoordinatorRideStatusObservers: %@", v21, v22];
    *(_DWORD *)buf = 136315394;
    v30 = v18;
    __int16 v31 = 2112;
    id v32 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
}

- (NSHashTable)rideStatusObservers
{
  return self->_rideStatusObservers;
}

- (NSMutableDictionary)rideStatusMap
{
  return self->_rideStatusMap;
}

- (void)addRideBookingDataCoordinatorRideOptionStateObserver:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062D304;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v5;
  id v12 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)removeRideBookingDataCoordinatorRideOptionStateObserver:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062D880;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v5;
  id v12 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)updateRideOptionStateForOrigin:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v11 = objc_alloc((Class)NSString);
    id v12 = NSStringFromSelector(a2);
    id v13 = [v11 initWithFormat:@"%@", v12];
    *(_DWORD *)buf = 136315394;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062DE10;
  block[3] = &unk_1012E9340;
  objc_copyWeak(&v31, (id *)buf);
  id v15 = v7;
  id v29 = v15;
  id v16 = v8;
  id v30 = v16;
  dispatch_async(processQueue, block);
  [v15 coordinate];
  CLLocationDegrees v18 = v17;
  [v15 coordinate];
  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v18, v19);
  [v16 coordinate];
  CLLocationDegrees v22 = v21;
  [v16 coordinate];
  CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v22, v23);
  long long v25 = +[RidesharingAppSuggestionsProvider sharedProvider];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10062E1D4;
  v26[3] = &unk_1012F26B8;
  v26[4] = self;
  objc_copyWeak(&v27, (id *)buf);
  [v25 fetchSuggestedAppsForSource:v26 destination:v20.latitude, v20.longitude, v24.latitude, v24.longitude];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)_updateRideOptionStatusMapForOrigin:(id)a3 destination:(id)a4 application:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v14 = objc_alloc((Class)NSString);
    id v15 = NSStringFromSelector(a2);
    id v16 = [v14 initWithFormat:@"%@", v15];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  double v17 = +[CLPlacemark placemarkWithGEOMapItem:v9];
  CLLocationDegrees v18 = +[CLPlacemark placemarkWithGEOMapItem:v10];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v42 = sub_100103E1C;
  v43 = sub_100104798;
  id v44 = 0;
  if ([v11 enabled]
    && ([v11 identifier],
        CLLocationDegrees v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = isExtensionHidden(),
        v19,
        !v20))
  {
    long long v26 = +[RideBookingRideOptionStatus statusWithApplication:v11 loadingRideOptions:1];
    [(RideBookingDataCoordinator *)self _updateRideOptionStatusMapWithApplication:v11 status:v26];

    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@"Sending a getRideStatus request with application %@", v11];
      *(_DWORD *)long long v37 = 136315394;
      long long v38 = v28;
      __int16 v39 = 2112;
      id v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v37, 0x16u);
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10062EAD4;
    v30[3] = &unk_1012F2708;
    objc_copyWeak(&v35, &location);
    __int16 v34 = buf;
    id v31 = v11;
    id v32 = v17;
    id v33 = v18;
    [v31 getRideStatusWithCompletion:v30];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    double v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      CLLocationDegrees v22 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v23 = [objc_alloc((Class)NSString) initWithFormat:@"Application is disabled. Returning the rideOptionStatus request."];
      *(_DWORD *)long long v37 = 136315394;
      long long v38 = v22;
      __int16 v39 = 2112;
      id v40 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v37, 0x16u);
    }
    uint64_t v24 = +[RideBookingRideOptionStatus statusWithApplication:v11];
    long long v25 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v24;

    [(RideBookingDataCoordinator *)self _updateRideOptionStatusMapWithApplication:v11 status:*(void *)(*(void *)&buf[8] + 40)];
  }
  _Block_object_dispose(buf, 8);
}

- (void)_updateRideOptionStatusMapWithApplication:(id)a3 status:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v11 = objc_alloc((Class)NSString);
    id v12 = NSStringFromSelector(a2);
    id v13 = [v11 initWithFormat:@"%@", v12];
    *(_DWORD *)buf = 136315394;
    id v23 = v10;
    __int16 v24 = 2112;
    *(void *)long long v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  id v14 = [v7 identifier];

  if (v14)
  {
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10062F384;
    block[3] = &unk_1012E9340;
    objc_copyWeak(&v21, (id *)buf);
    id v19 = v8;
    id v20 = v7;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      double v17 = [v7 name];
      *(_DWORD *)buf = 136447234;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v24 = 1024;
      *(_DWORD *)long long v25 = 397;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[RideBookingDataCoordinator _updateRideOptionStatusMapWithApplication:status:]";
      __int16 v26 = 2082;
      id v27 = "nil == (application.identifier)";
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. application %@ identifier cannot be nil", buf, 0x30u);
    }
  }
}

- (void)_startRefreshRideOptionsTimer
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062F668;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_refreshRideOptions
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062FAD0;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_stopRefreshRideOptionsTimer
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062FFA8;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)addRideBookingDataCoordinatorRequestRideObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@", v9];
      *(_DWORD *)buf = 136315394;
      double v17 = v7;
      __int16 v18 = 2112;
      *(void *)id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100630320;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      double v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 462;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator addRideBookingDataCoordinatorRequestRideObserver:]";
      __int16 v20 = 2082;
      id v21 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRequestRideObserver to be added", buf, 0x26u);
    }
  }
}

- (void)removeRideBookingDataCoordinatorRequestRideObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@", v9];
      *(_DWORD *)buf = 136315394;
      double v17 = v7;
      __int16 v18 = 2112;
      *(void *)id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10063081C;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      double v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 480;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator removeRideBookingDataCoordinatorRequestRideObserver:]";
      __int16 v20 = 2082;
      id v21 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRequestRideObserver to be removed", buf, 0x26u);
    }
  }
}

- (void)_resetRequestRide
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    double v17 = v5;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  requestRideApplication = self->_requestRideApplication;
  self->_requestRideApplication = 0;

  requestRidePickupLocation = self->_requestRidePickupLocation;
  self->_requestRidePickupLocation = 0;

  requestRideDropoffLocation = self->_requestRideDropoffLocation;
  self->_requestRideDropoffLocation = 0;

  requestRideEtaUpdateIdentifier = self->_requestRideEtaUpdateIdentifier;
  self->_requestRideEtaUpdateIdentifier = 0;

  requestRidePaymentMethod = self->_requestRidePaymentMethod;
  self->_requestRidePaymentMethod = 0;

  [(RideBookingDataCoordinator *)self _stopRequestRideExpireTimer];
  requestRideExpireTimer = self->_requestRideExpireTimer;
  self->_requestRideExpireTimer = 0;

  requestRideStatus = self->_requestRideStatus;
  self->_requestRideStatus = 0;
}

- (void)_broadcastRequestRideStatusDidChange
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [(RideBookingDataCoordinator *)self requestRideObservers];
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [(RideBookingDataCoordinator *)self requestRideStatus];
          [v14 requestRideStatusDidChange:v15];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v17 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v18 = objc_alloc((Class)NSString);
    id v19 = [(RideBookingDataCoordinator *)self requestRideObservers];
    id v20 = [v19 count];
    id v21 = [(RideBookingDataCoordinator *)self requestRideObservers];
    id v22 = [v18 initWithFormat:@"Broadcasted to %lu RideBookingDataSourceRequestRideObservers: %@", v20, v21];
    *(_DWORD *)buf = 136315394;
    id v29 = v17;
    __int16 v30 = 2112;
    id v31 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
}

- (void)startRequestRideForRideOption:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@", v9];
      *(_DWORD *)buf = 136315394;
      double v17 = v7;
      __int16 v18 = 2112;
      *(void *)id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006310A4;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      double v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 523;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator startRequestRideForRideOption:]";
      __int16 v20 = 2082;
      id v21 = "nil == (rideOption)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingRideOption", buf, 0x26u);
    }
  }
}

- (void)_updateRequestRidePickupAndDropoffLocations
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006313E8;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_startRequestRideExpireTimerWithExpirationDate:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (v5)
  {
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100631800;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v14, (id *)buf);
    id v13 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_expireRequestRideStatus
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100631D38;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_stopRequestRideExpireTimer
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006320C8;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_cleanRequestLocationNames
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v6 = objc_alloc((Class)NSString);
    id v7 = NSStringFromSelector(a2);
    id v8 = [v6 initWithFormat:@"%@", v7];
    *(_DWORD *)buf = 136315394;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100632450;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v11, (id *)buf);
  void block[4] = self;
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_updateRequestRideStatus:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100632AD8;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v5;
  id v12 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)updateRequestRideStartingWaypointCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v9 = objc_alloc((Class)NSString);
    id v10 = NSStringFromSelector(a2);
    id v11 = [v9 initWithFormat:@"%@", v10];
    *(_DWORD *)buf = 136315394;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100632DE0;
  block[3] = &unk_1012E8268;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = *(id *)&latitude;
  v14[2] = *(id *)&longitude;
  dispatch_async(processQueue, block);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

- (void)updateRequestRidePaymentMethod:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100633B9C;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v5;
  id v12 = v5;
  dispatch_sync(processQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)updateRequestRidePassengers:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@", v9];
      *(_DWORD *)buf = 136315394;
      __int16 v17 = v7;
      __int16 v18 = 2112;
      *(void *)id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100633F30;
    block[3] = &unk_1012F27A8;
    objc_copyWeak(v15, (id *)buf);
    v15[1] = (id)a2;
    id v14 = v5;
    dispatch_sync(processQueue, block);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 757;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator updateRequestRidePassengers:]";
      __int16 v20 = 2082;
      id v21 = "nil == (passengers)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingPassengersChoice to be added", buf, 0x26u);
    }
  }
}

- (void)requestRideWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@", v9];
      *(_DWORD *)buf = 136315394;
      __int16 v17 = v7;
      __int16 v18 = 2112;
      *(void *)id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006343B0;
    block[3] = &unk_1012F27F8;
    objc_copyWeak(v15, (id *)buf);
    void block[4] = self;
    v15[1] = (id)a2;
    id v14 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 770;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator requestRideWithCompletion:]";
      __int16 v20 = 2082;
      id v21 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)removeRideBookingDataCoordinatorRideStatusObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v8 = objc_alloc((Class)NSString);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v8 initWithFormat:@"%@", v9];
      *(_DWORD *)buf = 136315394;
      __int16 v17 = v7;
      __int16 v18 = 2112;
      *(void *)id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100634C54;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 824;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[RideBookingDataCoordinator removeRideBookingDataCoordinatorRideStatusObserver:]";
      __int16 v20 = 2082;
      id v21 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRideStatusObserver to be removed", buf, 0x26u);
    }
  }
}

- (void)_updateRideStatusMapForApplication:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100634FE4;
  block[3] = &unk_1012EB590;
  id v14 = v5;
  id v12 = v5;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = (id)a2;
  dispatch_async(processQueue, block);
  objc_destroyWeak(v15);

  objc_destroyWeak((id *)buf);
}

- (void)_updateRideStatusMapWithApplication:(id)a3 status:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v11 = objc_alloc((Class)NSString);
    id v12 = NSStringFromSelector(a2);
    id v13 = [v11 initWithFormat:@"%@", v12];
    *(_DWORD *)buf = 136315394;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006354B4;
  block[3] = &unk_1012E7C40;
  objc_copyWeak(v20, (id *)buf);
  id v18 = v8;
  id v19 = v7;
  v20[1] = (id)a2;
  id v15 = v7;
  id v16 = v8;
  dispatch_async(processQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

- (void)rideStatusDidChange:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100635DD4;
  block[3] = &unk_1012F27A8;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = (id)a2;
  id v14 = v5;
  id v12 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v17 = objc_alloc((Class)NSString);
      __int16 v18 = NSStringFromSelector(a2);
      id v19 = [v17 initWithFormat:@"%@", v18];
      *(_DWORD *)buf = 136315394;
      id v29 = v16;
      __int16 v30 = 2112;
      *(void *)id v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006362AC;
    block[3] = &unk_1012F2848;
    objc_copyWeak(v27, (id *)buf);
    id v23 = v11;
    id v24 = v12;
    id v25 = v13;
    v27[1] = (id)a2;
    id v26 = v14;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v30 = 1024;
      *(_DWORD *)id v31 = 971;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[RideBookingDataCoordinator sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:]";
      __int16 v32 = 2082;
      id v33 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v11 = objc_alloc((Class)NSString);
      id v12 = NSStringFromSelector(a2);
      id v13 = [v11 initWithFormat:@"%@", v12];
      *(_DWORD *)buf = 136315394;
      id v21 = v10;
      __int16 v22 = 2112;
      *(void *)id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10063691C;
    block[3] = &unk_1012F27F8;
    objc_copyWeak(v19, (id *)buf);
    id v17 = v7;
    v19[1] = (id)a2;
    id v18 = v8;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v22 = 1024;
      *(_DWORD *)id v23 = 996;
      *(_WORD *)&v23[4] = 2082;
      *(void *)&v23[6] = "-[RideBookingDataCoordinator checkIfCanCancelRideWithRideStatus:completion:]";
      __int16 v24 = 2082;
      id v25 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v11 = objc_alloc((Class)NSString);
      id v12 = NSStringFromSelector(a2);
      id v13 = [v11 initWithFormat:@"%@", v12];
      *(_DWORD *)buf = 136315394;
      id v23 = v10;
      __int16 v24 = 2112;
      *(void *)id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100636FB0;
    block[3] = &unk_1012F28E0;
    objc_copyWeak(v21, (id *)buf);
    id v18 = v7;
    id v15 = v8;
    v21[1] = (id)a2;
    id v19 = self;
    id v20 = v15;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v24 = 1024;
      *(_DWORD *)id v25 = 1018;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[RideBookingDataCoordinator cancelRideWithRideStatus:completion:]";
      __int16 v26 = 2082;
      id v27 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)enableRideBookingApplications:(id)a3
{
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v8 = objc_alloc((Class)NSString);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v8 initWithFormat:@"%@", v9];
    *(_DWORD *)buf = 136315394;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100637688;
  block[3] = &unk_1012E7ED0;
  id v14 = v5;
  id v12 = v5;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v15);

  objc_destroyWeak((id *)buf);
}

- (void)cleanMapItemName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v10 = objc_alloc((Class)NSString);
      id v11 = NSStringFromSelector(a2);
      id v12 = [v10 initWithFormat:@"%@", v11];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    id v13 = [v6 addressObject];
    id v14 = [v13 fullAddressWithMultiline:0];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&unsigned char buf[24] = sub_100103E1C;
    *(void *)&buf[32] = sub_100104798;
    id v15 = v6;
    id v38 = v15;
    id v16 = [v15 place];
    [v16 setName:v14];

    id v17 = objc_opt_new();
    [v17 setName:v14];
    [*(id *)(*(void *)&buf[8] + 40) setUserValues:v17];
    if ([v15 _hasMUID])
    {
      GEOFindOrCreateLog();
      __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
        id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Have a MUID, so looking up the name by issuing a Ticket"];
        *(_DWORD *)id v33 = 136315394;
        __int16 v34 = v19;
        __int16 v35 = 2112;
        id v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v33, 0x16u);
      }
      id v21 = +[GEOMapService sharedService];
      __int16 v22 = [v21 defaultTraits];

      id v23 = +[GEOMapService sharedService];
      __int16 v24 = [v15 _identifier];
      __int16 v32 = v24;
      id v25 = +[NSArray arrayWithObjects:&v32 count:1];
      __int16 v26 = [v23 ticketForIdentifiers:v25 traits:v22];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100637E48;
      v29[3] = &unk_1012F2908;
      id v31 = buf;
      id v30 = v7;
      [v26 submitWithHandler:v29 networkActivity:0];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, *(void *)(*(void *)&buf[8] + 40));
      GEOFindOrCreateLog();
      __int16 v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
        id v28 = [objc_alloc((Class)NSString) initWithFormat:@"Returning because originalMapItem.hasMUID==NO"];
        *(_DWORD *)id v33 = 136315394;
        __int16 v34 = v27;
        __int16 v35 = 2112;
        id v36 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v33, 0x16u);
      }
      __int16 v22 = v26;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1067;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[RideBookingDataCoordinator cleanMapItemName:completion:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)_startTimer:(id *)a3 withInterval:(double)a4 repeats:(BOOL)a5 block:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  if (!v11)
  {
    id v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      __int16 v30 = 1024;
      *(_DWORD *)id v31 = 1108;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[RideBookingDataCoordinator _startTimer:withInterval:repeats:block:]";
      __int16 v32 = 2082;
      id v33 = "nil == (block)";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
    goto LABEL_17;
  }
  id v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v14 = objc_alloc((Class)NSString);
    id v15 = NSStringFromSelector(a2);
    id v16 = [v14 initWithFormat:@"%@", v15];
    *(_DWORD *)buf = 136315394;
    id v29 = v13;
    __int16 v30 = 2112;
    *(void *)id v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (!a3)
  {
    id v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v27 = [objc_alloc((Class)NSString) initWithFormat:@"Returning because timer==nil"];
      *(_DWORD *)buf = 136315394;
      id v29 = v26;
      __int16 v30 = 2112;
      *(void *)id v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
LABEL_17:

    goto LABEL_18;
  }
  id v17 = *a3;
  if (!*a3)
  {
    __int16 v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Instantiating a new timer"];
      *(_DWORD *)buf = 136315394;
      id v29 = v19;
      __int16 v30 = 2112;
      *(void *)id v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    dispatch_source_t v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_processQueue);
    id v22 = *a3;
    *a3 = v21;

    dispatch_source_set_timer((dispatch_source_t)*a3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)*a3, v11);
    dispatch_resume((dispatch_object_t)*a3);
    id v17 = *a3;
  }
  if (v6) {
    uint64_t v23 = (unint64_t)(a4 * 1000000000.0);
  }
  else {
    uint64_t v23 = -1;
  }
  dispatch_time_t v24 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(v17, v24, v23, 0x3B9ACA00uLL);
LABEL_18:
}

+ (void)openRideBookingApplication:(id)a3 withUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v10 = objc_alloc((Class)NSString);
    id v11 = NSStringFromSelector(a2);
    id v12 = [v10 initWithFormat:@"%@", v11];
    *(_DWORD *)buf = 136315394;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    id v15 = objc_alloc((Class)NSString);
    id v16 = [v6 title];
    id v17 = [v15 initWithFormat:@"Opening app with activity: %@", v16];
    *(_DWORD *)buf = 136315394;
    id v19 = v14;
    __int16 v20 = 2112;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  [v7 openWithActivity:v6];
}

- (OS_dispatch_queue)processQueue
{
  return self->_processQueue;
}

- (void)setProcessQueue:(id)a3
{
}

- (RideBookingApplicationFinder)applicationFinder
{
  return self->_applicationFinder;
}

- (void)setApplicationFinder:(id)a3
{
}

- (NSMutableDictionary)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (GEOMapItemStorage)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (GEOMapItemStorage)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (OS_dispatch_source)refreshRideOptionsTimer
{
  return self->_refreshRideOptionsTimer;
}

- (void)setRefreshRideOptionsTimer:(id)a3
{
}

- (void)setRideOptionStateObservers:(id)a3
{
}

- (NSMutableArray)appStoreSuggestions
{
  return self->_appStoreSuggestions;
}

- (void)setAppStoreSuggestions:(id)a3
{
}

- (NSMutableArray)installedSuggestions
{
  return self->_installedSuggestions;
}

- (void)setInstalledSuggestions:(id)a3
{
}

- (BOOL)waitingAppSuggestionsToLoad
{
  return self->_waitingAppSuggestionsToLoad;
}

- (void)setWaitingAppSuggestionsToLoad:(BOOL)a3
{
  self->_waitingAppSuggestionsToLoad = a3;
}

- (NSMutableDictionary)rideOptionStatusMap
{
  return self->_rideOptionStatusMap;
}

- (void)setRideOptionStatusMap:(id)a3
{
}

- (NSHashTable)requestRideObservers
{
  return self->_requestRideObservers;
}

- (void)setRequestRideObservers:(id)a3
{
}

- (RideBookingRideOption)requestRideOption
{
  return self->_requestRideOption;
}

- (void)setRequestRideOption:(id)a3
{
}

- (RideBookingApplication)requestRideApplication
{
  return self->_requestRideApplication;
}

- (void)setRequestRideApplication:(id)a3
{
}

- (CLPlacemark)requestRidePickupLocation
{
  return self->_requestRidePickupLocation;
}

- (void)setRequestRidePickupLocation:(id)a3
{
}

- (CLPlacemark)requestRideDropoffLocation
{
  return self->_requestRideDropoffLocation;
}

- (void)setRequestRideDropoffLocation:(id)a3
{
}

- (OS_dispatch_source)requestRideExpireTimer
{
  return self->_requestRideExpireTimer;
}

- (void)setRequestRideExpireTimer:(id)a3
{
}

- (NSUUID)requestRideEtaUpdateIdentifier
{
  return self->_requestRideEtaUpdateIdentifier;
}

- (void)setRequestRideEtaUpdateIdentifier:(id)a3
{
}

- (RideBookingPaymentMethod)requestRidePaymentMethod
{
  return self->_requestRidePaymentMethod;
}

- (void)setRequestRidePaymentMethod:(id)a3
{
}

- (RideBookingPassengersChoice)requestRidePassengersChoice
{
  return self->_requestRidePassengersChoice;
}

- (void)setRequestRidePassengersChoice:(id)a3
{
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
}

- (void)setRideStatusObservers:(id)a3
{
}

- (void)setRideStatusMap:(id)a3
{
}

- (NSMutableDictionary)completedRideIdentifiersAndDatesMap
{
  return self->_completedRideIdentifiersAndDatesMap;
}

- (void)setCompletedRideIdentifiersAndDatesMap:(id)a3
{
}

@end