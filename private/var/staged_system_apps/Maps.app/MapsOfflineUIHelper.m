@interface MapsOfflineUIHelper
+ (MapsOfflineUIHelper)sharedHelper;
+ (int64_t)idealDisplayAspectRatio:(id)a3;
- (BOOL)_isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5 forSubscriptionInfos:(id)a6;
- (BOOL)hasExpiredSubscriptions;
- (BOOL)hasFullyLoadedSubscriptions;
- (BOOL)hasSubscriptionsBeingUpdated;
- (BOOL)hasSubscriptionsNeedingUpdate;
- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4;
- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5;
- (BOOL)isUsingForcedOfflineMaps;
- (BOOL)isUsingOfflineMaps;
- (GEOMapDataSubscriptionManager)subscriptionManager;
- (MapsOfflineUIHelper)init;
- (NSArray)subscriptionInfos;
- (NSArray)subscriptions;
- (NSDate)lastUpdatedDate;
- (NSDate)lastUpdatedDateForPairedDevice;
- (NSMutableSet)updatingSubscriptions;
- (NSNumber)availableDiskSpaceForPairedDevice;
- (id)_osUpdateRequiredAlert;
- (id)_subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4 fromSubscriptionInfos:(id)a5;
- (id)alertControllerForAttemptedAddCollection;
- (id)alertControllerForAttemptedAddNote;
- (id)alertControllerForAttemptedAddShortcut;
- (id)alertControllerForAttemptedDataManagementDisplay;
- (id)alertControllerForAttemptedRegionDownload;
- (id)alertControllerForAttemptedShowMyShortcut;
- (id)alertControllerForAttemptedUpdateAll;
- (id)alertControllerForCellularDownloadConfirmationForRegionName:(id)a3 size:(int64_t)a4 actionHandler:(id)a5;
- (id)alertControllerForCellularUpdateConfirmationForSize:(int64_t)a3 actionHandler:(id)a4;
- (id)alertControllerForDisableSyncToWatchWithActionHandler:(id)a3;
- (id)alertControllerForInsufficientDiskSpaceForDownloadSize:(int64_t)a3;
- (id)alertControllerForInsufficientDiskSpaceOnPairedDeviceForDownloadSize:(int64_t)a3;
- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 completionHandler:(id)a4;
- (id)subscriptionInfoForRegion:(id)a3;
- (id)subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4;
- (int64_t)cellularBehaviorForDownloadOfSize:(int64_t)a3 forForcedDownload:(BOOL)a4;
- (int64_t)pairedDeviceSubscriptionStatesMonitorCount;
- (unint64_t)expiredSubscriptionsCount;
- (unint64_t)fullyLoadedSubscriptionsCount;
- (unint64_t)outOfDateSubscriptionsCount;
- (unint64_t)totalOfflineDataSize;
- (void)_captureDisplayDownloadMapsAlertWithType:(int64_t)a3;
- (void)_commonInit;
- (void)_offlineServiceStateChanged;
- (void)_postSubscriptionsDidChangeNotification;
- (void)_reloadLastUpdatedDates;
- (void)_reloadPairedDeviceSubscriptionInfos;
- (void)_reloadSubscriptionInfosWithCompletion:(id)a3;
- (void)_reloadSubscriptions;
- (void)_startedUpdatingSubscription:(id)a3;
- (void)_stoppedUpdatingSubscription:(id)a3;
- (void)_subscriptionsDidChange;
- (void)_updateExpiredSubscriptionsCount;
- (void)_updateTotalDataSize;
- (void)_updateUsingOfflineMaps;
- (void)addKVOForSubscriptionInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSubscriptionWithRegion:(id)a3 name:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)forceUpdateAllSubscriptionsWithMode:(unint64_t)a3;
- (void)getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseDownloadForSubscriptionInfo:(id)a3;
- (void)removeKVOForSubscriptionInfo:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restoreExpiredSubscription:(id)a3 completionHandler:(id)a4;
- (void)resumeDownloadForSubscriptionInfo:(id)a3 mode:(unint64_t)a4;
- (void)resumeDownloadForSubscriptionWithIdentifier:(id)a3 mode:(unint64_t)a4;
- (void)setAvailableDiskSpaceForPairedDevice:(id)a3;
- (void)setExpiredSubscriptionsCount:(unint64_t)a3;
- (void)setFullyLoadedSubscriptionsCount:(unint64_t)a3;
- (void)setOutOfDateSubscriptionsCount:(unint64_t)a3;
- (void)setPairedDeviceSubscriptionStatesMonitorCount:(int64_t)a3;
- (void)setSubscriptionInfo:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 completionHandler:(id)a5;
- (void)setSubscriptionInfos:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setTotalOfflineDataSize:(unint64_t)a3;
- (void)setUpdatingSubscriptions:(id)a3;
- (void)setUsingOfflineMaps:(BOOL)a3;
- (void)startMonitoringPairedDeviceSubscriptionStates;
- (void)stopMonitoringPairedDeviceSubscriptionStates;
- (void)updateName:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5;
- (void)updateRegion:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5;
@end

@implementation MapsOfflineUIHelper

- (void)_subscriptionsDidChange
{
  observers = self->_observers;
  v4 = [(MapsOfflineUIHelper *)self subscriptionInfos];
  [(GEOObserverHashTable *)observers subscriptionInfosDidChange:v4];

  [(MapsOfflineUIHelper *)self _postSubscriptionsDidChangeNotification];
}

- (void)setUpdatingSubscriptions:(id)a3
{
  v7 = (NSMutableSet *)a3;
  if (self->_updatingSubscriptions != v7 && (-[NSMutableSet isEqual:](v7, "isEqual:") & 1) == 0)
  {
    unsigned int v5 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    objc_storeStrong((id *)&self->_updatingSubscriptions, a3);
    BOOL v6 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    if (v5 != v6) {
      [(GEOObserverHashTable *)self->_observers subscriptionsBeingUpdatedDidChange:v6];
    }
  }
}

- (BOOL)hasSubscriptionsBeingUpdated
{
  return [(NSMutableSet *)self->_updatingSubscriptions count] != 0;
}

- (NSArray)subscriptionInfos
{
  return self->_subscriptionInfos;
}

- (void)setPairedDeviceSubscriptionStatesMonitorCount:(int64_t)a3
{
  if (a3 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: count >= 0", buf, 2u);
    }
  }
  else
  {
    int64_t pairedDeviceSubscriptionStatesMonitorCount = self->_pairedDeviceSubscriptionStatesMonitorCount;
    if (pairedDeviceSubscriptionStatesMonitorCount != a3)
    {
      self->_int64_t pairedDeviceSubscriptionStatesMonitorCount = a3;
      if ((a3 != 0) == pairedDeviceSubscriptionStatesMonitorCount < 1)
      {
        BOOL v6 = sub_1000493C0();
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
        if (a3)
        {
          if (v7)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[MapsOfflineUIHelper] start monitoring paired device subscription states", buf, 2u);
          }

          [(MapsOfflineUIHelper *)self _reloadPairedDeviceSubscriptionInfos];
        }
        else
        {
          if (v7)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[MapsOfflineUIHelper] stop monitoring paired device subscription states", buf, 2u);
          }

          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          v8 = self->_subscriptionInfos;
          id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v14;
            do
            {
              v12 = 0;
              do
              {
                if (*(void *)v14 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setPairedDeviceState:0 v13];
                v12 = (char *)v12 + 1;
              }
              while (v10 != v12);
              id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
            }
            while (v10);
          }
        }
      }
    }
  }
}

- (void)setSubscriptionInfos:(id)a3
{
  v4 = (NSArray *)a3;
  subscriptionInfos = self->_subscriptionInfos;
  if (subscriptionInfos != v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v6 = subscriptionInfos;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          [(MapsOfflineUIHelper *)self removeKVOForSubscriptionInfo:*(void *)(*((void *)&v22 + 1) + 8 * (void)v10)];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    uint64_t v11 = (NSArray *)[(NSArray *)v4 copy];
    v12 = self->_subscriptionInfos;
    self->_subscriptionInfos = v11;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v13 = self->_subscriptionInfos;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[MapsOfflineUIHelper addKVOForSubscriptionInfo:](self, "addKVOForSubscriptionInfo:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v17), (void)v18);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

- (void)_updateExpiredSubscriptionsCount
{
  objc_initWeak(&location, self);
  v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D62C;
  v5[3] = &unk_1012E6E78;
  objc_copyWeak(&v6, &location);
  [v3 fetchAllExpiredSubscriptionsWithCallbackQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_reloadPairedDeviceSubscriptionInfos
{
  objc_initWeak(&location, self);
  v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003EB18;
  v5[3] = &unk_1012E7418;
  objc_copyWeak(&v6, &location);
  void v5[4] = self;
  [v3 fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateTotalDataSize
{
  objc_initWeak(&location, self);
  v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100108DF4;
  v5[3] = &unk_101302840;
  objc_copyWeak(&v6, &location);
  [v3 _calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_reloadLastUpdatedDates
{
  objc_initWeak(&location, self);
  v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025058;
  v8[3] = &unk_1013027B0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [v3 fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v8];

  unsigned int v5 = [(MapsOfflineUIHelper *)self subscriptionManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100023E34;
  v6[3] = &unk_1013027B0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)_reloadSubscriptionInfosWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = +[NSString stringWithFormat:@"%@*", @"com.apple.Maps.offline."];
  id v6 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v14 = v5;
  id v7 = +[NSArray arrayWithObjects:&v14 count:1];
  id v8 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100050660;
  v10[3] = &unk_1012FA0D0;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  v10[4] = self;
  id v11 = v9;
  [v6 fetchSubscriptionsWithIdentifiers:v7 callbackQueue:&_dispatch_main_q completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)_commonInit
{
  v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsOfflineUIObserver queue:&_dispatch_main_q];
  observers = self->_observers;
  self->_observers = v3;

  unsigned int v5 = +[GEOOfflineService shared];
  self->_usingOfflineMaps = [v5 isUsingOffline];

  id v6 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  [(MapsOfflineUIHelper *)self setSubscriptionManager:v6];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_offlineServiceStateChanged" name:GEOOfflineStateChangedNotification object:0];

  objc_initWeak(&location, self);
  id v8 = (const char *)GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100931164;
  handler[3] = &unk_1012F6090;
  objc_copyWeak(&v19, &location);
  notify_register_dispatch(v8, &self->_subscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  [(MapsOfflineUIHelper *)self _reloadSubscriptions];
  id v9 = (const char *)GEOOfflineDataActiveVersionsDidChangeDarwinNotification;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1009311A8;
  v16[3] = &unk_1012F6090;
  objc_copyWeak(&v17, &location);
  notify_register_dispatch(v9, &self->_activeVersionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v16);

  id v10 = (const char *)GEOMapDataSubscriptionManagerPairedDeviceOfflineLastUpdatedDateDidChangeDarwinNotification;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009311EC;
  v14[3] = &unk_1012F6090;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch(v10, &self->_pairedDeviceLastUpdatedChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v14);

  [(MapsOfflineUIHelper *)self _reloadLastUpdatedDates];
  id v11 = (const char *)GEOMapDataSubscriptionManagerPairedDeviceSubscriptionsDidChangeDarwinNotification;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100931230;
  v12[3] = &unk_1012F6090;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v11, &self->_pairedDeviceSubscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (BOOL)isUsingOfflineMaps
{
  return self->_usingOfflineMaps;
}

+ (MapsOfflineUIHelper)sharedHelper
{
  if (qword_101610040 != -1) {
    dispatch_once(&qword_101610040, &stru_101302760);
  }
  v2 = (void *)qword_101610038;

  return (MapsOfflineUIHelper *)v2;
}

- (BOOL)isUsingForcedOfflineMaps
{
  v2 = +[GEOOfflineService shared];
  unsigned __int16 v3 = (unsigned __int16)[v2 state];
  int v4 = v3;
  if (v3 < 2u) {
    goto LABEL_9;
  }
  if (v3 != 2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    int v10 = 67109120;
    int v11 = v4;
    id v8 = "Unreachable reached: invalid offline mode value %x";
    goto LABEL_12;
  }
  int v5 = HIBYTE(v3);
  if (HIBYTE(v3) >= 3u)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
LABEL_9:
      BOOL v6 = 0;
      goto LABEL_10;
    }
    int v10 = 67109120;
    int v11 = v5;
    id v8 = "Unreachable reached: invalid offline reason value %x";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 8u);
    goto LABEL_9;
  }
  BOOL v6 = (v3 & 0x700) == 512;
LABEL_10:

  return v6;
}

- (void)startMonitoringPairedDeviceSubscriptionStates
{
  unsigned __int16 v3 = (char *)[(MapsOfflineUIHelper *)self pairedDeviceSubscriptionStatesMonitorCount]+ 1;

  [(MapsOfflineUIHelper *)self setPairedDeviceSubscriptionStatesMonitorCount:v3];
}

- (void)setTotalOfflineDataSize:(unint64_t)a3
{
  self->_totalOfflineDataSize = a3;
}

- (void)setSubscriptions:(id)a3
{
}

- (void)setSubscriptionManager:(id)a3
{
}

- (void)setOutOfDateSubscriptionsCount:(unint64_t)a3
{
  unint64_t outOfDateSubscriptionsCount = self->_outOfDateSubscriptionsCount;
  if (outOfDateSubscriptionsCount != a3)
  {
    self->_unint64_t outOfDateSubscriptionsCount = a3;
    if ((a3 != 0) == (outOfDateSubscriptionsCount == 0)) {
      [(GEOObserverHashTable *)self->_observers subscriptionsNeedUpdatingDidChange:a3 != 0];
    }
  }
}

- (void)setFullyLoadedSubscriptionsCount:(unint64_t)a3
{
  unint64_t fullyLoadedSubscriptionsCount = self->_fullyLoadedSubscriptionsCount;
  if (fullyLoadedSubscriptionsCount != a3)
  {
    self->_unint64_t fullyLoadedSubscriptionsCount = a3;
    if ((a3 != 0) == (fullyLoadedSubscriptionsCount == 0)) {
      [(GEOObserverHashTable *)self->_observers hasFullyLoadedSubscriptionsDidChange:a3 != 0];
    }
  }
}

- (void)setExpiredSubscriptionsCount:(unint64_t)a3
{
  self->_expiredSubscriptionsCount = a3;
}

- (int64_t)pairedDeviceSubscriptionStatesMonitorCount
{
  return self->_pairedDeviceSubscriptionStatesMonitorCount;
}

- (MapsOfflineUIHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)MapsOfflineUIHelper;
  v2 = [(MapsOfflineUIHelper *)&v5 init];
  unsigned __int16 v3 = v2;
  if (v2) {
    [(MapsOfflineUIHelper *)v2 _commonInit];
  }
  return v3;
}

- (void)addObserver:(id)a3
{
}

- (void)_reloadSubscriptions
{
  [(MapsOfflineUIHelper *)self _reloadSubscriptionInfosWithCompletion:0];
  [(MapsOfflineUIHelper *)self _updateExpiredSubscriptionsCount];

  [(MapsOfflineUIHelper *)self _updateTotalDataSize];
}

- (void)_postSubscriptionsDidChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"OfflineMapsSubscriptionsDidChangeNotification" object:self];
}

+ (int64_t)idealDisplayAspectRatio:(id)a3
{
  GEOMapRectForMapRegion();
  double v5 = v3 / v4;
  GEOConfigGetDouble();
  if (v5 > v6) {
    return 2;
  }
  GEOConfigGetDouble();
  return v5 < v8;
}

- (void)dealloc
{
  notify_cancel(self->_subscriptionsChangedNotifyToken);
  self->_subscriptionsChangedNotifyToken = -1;
  notify_cancel(self->_activeVersionsChangedNotifyToken);
  self->_activeVersionsChangedNotifyToken = -1;
  notify_cancel(self->_pairedDeviceLastUpdatedChangedNotifyToken);
  self->_pairedDeviceLastUpdatedChangedNotifyToken = -1;
  notify_cancel(self->_pairedDeviceSubscriptionsChangedNotifyToken);
  self->_pairedDeviceSubscriptionsChangedNotifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)MapsOfflineUIHelper;
  [(MapsOfflineUIHelper *)&v3 dealloc];
}

- (void)setUsingOfflineMaps:(BOOL)a3
{
  BOOL usingOfflineMaps = self->_usingOfflineMaps;
  if (usingOfflineMaps != a3)
  {
    self->_BOOL usingOfflineMaps = a3;
    double v5 = sub_1000493C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (usingOfflineMaps) {
        double v6 = @"YES";
      }
      else {
        double v6 = @"NO";
      }
      id v7 = v6;
      if (self->_usingOfflineMaps) {
        double v8 = @"YES";
      }
      else {
        double v8 = @"NO";
      }
      id v9 = v8;
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[MapsOfflineUIHelper] posting UsingOfflineMapsStateChangedNotification, wasUsingOfflineMaps: %{public}@, isUsingOfflineMaps: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    int v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"UsingOfflineMapsStateChangedNotification" object:self];
  }
}

- (void)_updateUsingOfflineMaps
{
  objc_super v3 = +[GEOOfflineService shared];
  id v4 = [v3 isUsingOffline];

  [(MapsOfflineUIHelper *)self setUsingOfflineMaps:v4];
}

- (void)_offlineServiceStateChanged
{
}

- (void)removeObserver:(id)a3
{
}

- (void)addSubscriptionWithRegion:(id)a3 name:(id)a4 completion:(id)a5
{
  id v31 = a3;
  id v8 = a4;
  id v30 = a5;
  id v32 = v8;
  unint64_t v9 = 1;
LABEL_2:
  if (v9 <= 1)
  {
    id v12 = v32;
  }
  else
  {
    int v10 = +[NSBundle mainBundle];
    int v11 = [v10 localizedStringForKey:@"OFFLINE_REGION_NAME_DUPLICATE_FORMAT" value:@"localized string not found" table:@"Offline"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v32, v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  __int16 v13 = [(MapsOfflineUIHelper *)self subscriptions];
  id v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v19 = [v18 displayName];
        if (v19)
        {
          long long v20 = (void *)v19;
          long long v21 = [v18 displayName];
          unsigned __int8 v22 = [v21 isEqualToString:v12];

          if (v22)
          {

            ++v9;
            goto LABEL_2;
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (([v12 isEqualToString:v32] & 1) == 0)
  {
    long long v23 = sub_1000493C0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      id v41 = v32;
      __int16 v42 = 2113;
      id v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "A region already exists with the name '%{private}@'. Using '%{private}@' instead", buf, 0x16u);
    }
  }
  long long v24 = +[NSUUID UUID];
  long long v25 = [v24 UUIDString];
  v26 = +[NSString stringWithFormat:@"%@%@", @"com.apple.Maps.offline.", v25];

  v27 = [(MapsOfflineUIHelper *)self subscriptionManager];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100931828;
  v33[3] = &unk_1012F8640;
  id v34 = v26;
  id v35 = v30;
  id v28 = v26;
  id v29 = v30;
  [v27 addSubscriptionWithIdentifier:v28 dataTypes:1024 policy:1 region:v31 displayName:v12 expirationDate:0 callbackQueue:&_dispatch_main_q completionHandler:v33];
}

- (void)pauseDownloadForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v7 = [(MapsOfflineUIHelper *)self subscriptionManager];
  double v5 = [v4 subscription];

  double v6 = [v5 identifier];
  [v7 cancelDownloadForSubscriptionIdentifier:v6];
}

- (void)resumeDownloadForSubscriptionInfo:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  id v9 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v7 = [v6 subscription];

  id v8 = [v7 identifier];
  [v9 startDownloadForSubscriptionIdentifier:v8 mode:a4];
}

- (void)resumeDownloadForSubscriptionWithIdentifier:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MapsOfflineUIHelper *)self subscriptionManager];
  [v7 startDownloadForSubscriptionIdentifier:v6 mode:a4];
}

- (void)restoreExpiredSubscription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v9 = [v6 identifier];
  id v10 = [v6 dataTypes];
  id v11 = [v6 policy];
  id v12 = [v6 region];
  __int16 v13 = [v6 displayName];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100931B4C;
  v16[3] = &unk_1012F2E28;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v8 addSubscriptionWithIdentifier:v9 dataTypes:v10 policy:v11 region:v12 displayName:v13 expirationDate:0 callbackQueue:&_dispatch_main_q completionHandler:v16];
}

- (void)updateRegion:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v16 = [a4 subscription];
  id v10 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v11 = [v16 identifier];
  id v12 = [v16 dataTypes];
  id v13 = [v16 policy];
  id v14 = [v16 displayName];
  id v15 = [v16 expirationDate];
  [v10 addSubscriptionWithIdentifier:v11 dataTypes:v12 policy:v13 region:v9 displayName:v14 expirationDate:v15 callbackQueue:&_dispatch_main_q completionHandler:v8];
}

- (void)updateName:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v16 = [a4 subscription];
  id v10 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v11 = [v16 identifier];
  id v12 = [v16 dataTypes];
  id v13 = [v16 policy];
  id v14 = [v16 region];
  id v15 = [v16 expirationDate];
  [v10 addSubscriptionWithIdentifier:v11 dataTypes:v12 policy:v13 region:v14 displayName:v9 expirationDate:v15 callbackQueue:&_dispatch_main_q completionHandler:v8];
}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v9 = [v8 determineEstimatedSizeForSubscriptionWithRegion:v7 dataTypes:1024 queue:&_dispatch_main_q completionHandler:v6];

  return v9;
}

- (void)getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  double v5 = [(MapsOfflineUIHelper *)self availableDiskSpaceForPairedDevice];

  if (v5)
  {
    id v6 = [(MapsOfflineUIHelper *)self availableDiskSpaceForPairedDevice];
    v4[2](v4, [v6 longLongValue], 0);
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [(MapsOfflineUIHelper *)self subscriptionManager];
    id v8 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10093206C;
    v9[3] = &unk_101302788;
    id v10 = v4;
    objc_copyWeak(&v11, &location);
    [v7 fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)hasFullyLoadedSubscriptions
{
  return self->_fullyLoadedSubscriptionsCount != 0;
}

- (BOOL)hasSubscriptionsNeedingUpdate
{
  return self->_outOfDateSubscriptionsCount != 0;
}

- (void)_startedUpdatingSubscription:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    if (!self->_updatingSubscriptions)
    {
      id v4 = +[NSMutableSet set];
      updatingSubscriptions = self->_updatingSubscriptions;
      self->_updatingSubscriptions = v4;
    }
    unsigned int v6 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    [(NSMutableSet *)self->_updatingSubscriptions addObject:v8];
    BOOL v7 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    if (v6 != v7) {
      [(GEOObserverHashTable *)self->_observers subscriptionsBeingUpdatedDidChange:v7];
    }
  }
}

- (void)_stoppedUpdatingSubscription:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    unsigned int v4 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    [(NSMutableSet *)self->_updatingSubscriptions removeObject:v6];
    BOOL v5 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    if (v4 != v5)
    {
      [(GEOObserverHashTable *)self->_observers subscriptionsBeingUpdatedDidChange:v5];
      [(MapsOfflineUIHelper *)self _updateTotalDataSize];
    }
  }
}

- (void)forceUpdateAllSubscriptionsWithMode:(unint64_t)a3
{
  id v4 = [(MapsOfflineUIHelper *)self subscriptionManager];
  [v4 forceUpdateForUserInitiatedSubscriptionsForDataType:1024 mode:a3];
}

- (BOOL)hasExpiredSubscriptions
{
  return [(MapsOfflineUIHelper *)self expiredSubscriptionsCount] != 0;
}

- (void)stopMonitoringPairedDeviceSubscriptionStates
{
  objc_super v3 = (char *)[(MapsOfflineUIHelper *)self pairedDeviceSubscriptionStatesMonitorCount]- 1;

  [(MapsOfflineUIHelper *)self setPairedDeviceSubscriptionStatesMonitorCount:v3];
}

- (void)setSubscriptionInfo:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v12 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v10 = [v9 subscription];

  id v11 = [v10 identifier];
  [v12 setSubscriptionWithIdentifier:v11 shouldSyncToPairedDevice:v5 callbackQueue:&_dispatch_main_q completionHandler:v8];
}

- (void)addKVOForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (qword_101610048 != -1) {
    dispatch_once(&qword_101610048, &stru_101302888);
  }
  id v5 = (id)qword_101610050;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [v4 state:v12];
        [v11 addObserver:self forKeyPath:v10 options:3 context:off_1015EDFC8];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)removeKVOForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (qword_101610048 != -1) {
    dispatch_once(&qword_101610048, &stru_101302888);
  }
  id v5 = (id)qword_101610050;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [v4 state:v12];
        [v11 removeObserver:self forKeyPath:v10 context:off_1015EDFC8];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1015EDFC8 != a6) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  if (qword_101610048 != -1) {
    dispatch_once(&qword_101610048, &stru_101302888);
  }
  if ([(id)qword_101610050 containsObject:v10])
  {
    id v13 = [v12 copy];
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100932C28;
    block[3] = &unk_101302868;
    objc_copyWeak(&v22, &location);
    id v17 = v11;
    id v18 = v10;
    id v19 = v12;
    id v20 = v13;
    long long v21 = self;
    id v14 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_7:
    v15.receiver = self;
    v15.super_class = (Class)MapsOfflineUIHelper;
    [(MapsOfflineUIHelper *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  GEOConfigGetDouble();
  LOBYTE(v4) = -[MapsOfflineUIHelper isRegionDownloaded:requireFullyDownloaded:coverageRequirement:](self, "isRegionDownloaded:requireFullyDownloaded:coverageRequirement:", v6, v4);

  return v4;
}

- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(MapsOfflineUIHelper *)self subscriptionInfos];
  LOBYTE(v6) = [(MapsOfflineUIHelper *)self _isRegionDownloaded:v8 requireFullyDownloaded:v6 coverageRequirement:v9 forSubscriptionInfos:a5];

  return v6;
}

- (BOOL)_isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5 forSubscriptionInfos:(id)a6
{
  BOOL v7 = a4;
  id v8 = a6;
  GEOMapRectForMapRegion();
  id v9 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v14);
        if (!v7
          || (objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)v14), "state", (void)v31),
              id v16 = objc_claimAutoreleasedReturnValue(),
              id v17 = [v16 loadState],
              v16,
              v17))
        {
          id v18 = [v15 subscription:v31];
          id v19 = [v18 region];
          [v9 addObject:v19];
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  id v20 = malloc_type_malloc(32 * (void)[v9 count], 0x1000040E0EAB150uLL);
  if ([v9 count])
  {
    unint64_t v21 = 0;
    id v22 = v20 + 2;
    do
    {
      long long v23 = [v9 objectAtIndexedSubscript:v21];
      GEOMapRectForMapRegion();
      *(v22 - 2) = v24;
      *(v22 - 1) = v25;
      *id v22 = v26;
      v22[1] = v27;
      v22 += 4;

      ++v21;
    }
    while (v21 < (unint64_t)[v9 count]);
  }
  [v9 count];
  GEOMapRectFractionCoveredByMapRects();
  double v29 = v28;
  free(v20);

  return v29 >= a5;
}

- (id)subscriptionInfoForRegion:(id)a3
{
  return [(MapsOfflineUIHelper *)self subscriptionInfoForRegion:a3 requireContainment:0];
}

- (id)subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(MapsOfflineUIHelper *)self isRegionDownloaded:v6 requireFullyDownloaded:0])
  {
    BOOL v7 = [(MapsOfflineUIHelper *)self subscriptionInfos];
    id v8 = [(MapsOfflineUIHelper *)self _subscriptionInfoForRegion:v6 requireContainment:v4 fromSubscriptionInfos:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4 fromSubscriptionInfos:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  GEOMapRectForMapRegion();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v26;
    double v24 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_super v15 = [v14 subscription];
        id v16 = [v15 region];
        GEOMapRectForMapRegion();

        GEOMapRectIntersection();
        double v18 = v17;
        double v20 = v19;
        if ((GEOMapRectIsNull() & 1) == 0)
        {
          double v21 = GEOMapRectIsEmpty() ? 1.0 : v18 * v20;
          if (v21 > v24)
          {
            id v22 = v14;

            id v11 = v22;
            double v24 = v21;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (int64_t)cellularBehaviorForDownloadOfSize:(int64_t)a3 forForcedDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned int v8 = [v7 isCellConnection];

  if (!v8) {
    return 0;
  }
  if ((GEOConfigGetBOOL() & 1) == 0) {
    return v4;
  }
  unsigned __int8 v9 = [(MapsOfflineUIHelper *)self hasSubscriptionsNeedingUpdate];
  int64_t result = 1;
  if ((a3 & 0x8000000000000000) == 0 && (v9 & 1) == 0)
  {
    if (GEOConfigGetUInteger() <= (unint64_t)a3) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSDate)lastUpdatedDateForPairedDevice
{
  return self->_lastUpdatedDateForPairedDevice;
}

- (unint64_t)totalOfflineDataSize
{
  return self->_totalOfflineDataSize;
}

- (unint64_t)outOfDateSubscriptionsCount
{
  return self->_outOfDateSubscriptionsCount;
}

- (unint64_t)fullyLoadedSubscriptionsCount
{
  return self->_fullyLoadedSubscriptionsCount;
}

- (NSMutableSet)updatingSubscriptions
{
  return self->_updatingSubscriptions;
}

- (unint64_t)expiredSubscriptionsCount
{
  return self->_expiredSubscriptionsCount;
}

- (NSNumber)availableDiskSpaceForPairedDevice
{
  return self->_availableDiskSpaceForPairedDevice;
}

- (void)setAvailableDiskSpaceForPairedDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDiskSpaceForPairedDevice, 0);
  objc_storeStrong((id *)&self->_updatingSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDateForPairedDevice, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)_osUpdateRequiredAlert
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 localizedStringForKey:@"OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

  BOOL v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];

  id v6 = +[UIAlertController alertControllerWithTitle:v3 message:v5 preferredStyle:1];
  id v7 = +[NSBundle mainBundle];
  unsigned int v8 = [v7 localizedStringForKey:@"OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_NOT_NOW_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
  unsigned __int8 v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_UPDATE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
  uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:&stru_10131B6F0];

  [v6 addAction:v12];
  [v6 setPreferredAction:v12];

  return v6;
}

- (id)alertControllerForAttemptedDataManagementDisplay
{
  if ((GEOSupportsOfflineMaps() & 1) != 0
    || [(MapsOfflineUIHelper *)self hasExpiredSubscriptions])
  {
    objc_super v3 = 0;
  }
  else if (GEOConfigGetBOOL())
  {
    objc_super v3 = [(MapsOfflineUIHelper *)self _osUpdateRequiredAlert];
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"OFFLINE_MAPS_NOT_AVAILABLE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    id v7 = +[NSBundle mainBundle];
    unsigned int v8 = [v7 localizedStringForKey:@"OFFLINE_MAPS_NOT_AVAILABLE_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];

    objc_super v3 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];
    unsigned __int8 v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"OFFLINE_MAPS_NOT_AVAILABLE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
    id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
    [v3 addAction:v11];
  }

  return v3;
}

- (id)alertControllerForAttemptedRegionDownload
{
  if (GEOConfigGetBOOL())
  {
    objc_super v3 = [(MapsOfflineUIHelper *)self _osUpdateRequiredAlert];
    goto LABEL_9;
  }
  if ([(MapsOfflineUIHelper *)self isUsingForcedOfflineMaps])
  {
    BOOL v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"DOWNLOAD_MAP_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"DOWNLOAD_MAP_FORCED_OFFLINE_ALERT_MESSAGE";
  }
  else
  {
    unsigned __int8 v9 = +[GEONetworkObserver sharedNetworkObserver];
    unsigned __int8 v10 = [v9 isNetworkReachable];

    if (v10)
    {
      objc_super v3 = 0;
      goto LABEL_9;
    }
    id v11 = +[NSBundle mainBundle];
    id v5 = [v11 localizedStringForKey:@"DOWNLOAD_MAP_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"DOWNLOAD_MAP_OFFLINE_ALERT_MESSAGE";
  }
  uint64_t v12 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:@"Offline"];

  objc_super v3 = +[UIAlertController alertControllerWithTitle:v5 message:v12 preferredStyle:1];
  uint64_t v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"DOWNLOAD_MAP_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
  objc_super v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];
  [v3 addAction:v15];

  [(MapsOfflineUIHelper *)self _captureDisplayDownloadMapsAlertWithType:1];
LABEL_9:

  return v3;
}

- (id)alertControllerForAttemptedShowMyShortcut
{
  objc_super v3 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned __int8 v4 = [v3 isNetworkReachable];

  if (v4)
  {
    id v5 = 0;
    id v6 = 0;
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    id v5 = [v7 localizedStringForKey:@"EDIT_SHORTCUT_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    LODWORD(v7) = +[LibraryUIUtilities isMyPlacesEnabled];
    CFStringRef v8 = +[NSBundle mainBundle];
    unsigned __int8 v9 = v8;
    if (v7) {
      CFStringRef v10 = @"EDIT_PIN_OFFLINE_ALERT_MESSAGE";
    }
    else {
      CFStringRef v10 = @"EDIT_SHORTCUT_OFFLINE_ALERT_MESSAGE";
    }
    id v6 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:@"Offline"];
  }
  if ([(MapsOfflineUIHelper *)self isUsingForcedOfflineMaps])
  {
    id v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"EDIT_SHORTCUT_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    unsigned int v13 = +[LibraryUIUtilities isMyPlacesEnabled];
    id v14 = +[NSBundle mainBundle];
    objc_super v15 = v14;
    if (v13) {
      CFStringRef v16 = @"EDIT_PIN_FORCED_OFFLINE_ALERT_MESSAGE";
    }
    else {
      CFStringRef v16 = @"EDIT_SHORTCUT_FORCED_OFFLINE_ALERT_MESSAGE";
    }
    uint64_t v17 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:@"Offline"];

    id v5 = (void *)v12;
    id v6 = (void *)v17;
  }
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    double v18 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    double v19 = +[NSBundle mainBundle];
    double v20 = [v19 localizedStringForKey:@"EDIT_SHORTCUT_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
    double v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:0];
    [v18 addAction:v21];
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

- (id)alertControllerForAttemptedAddShortcut
{
  objc_super v3 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned __int8 v4 = [v3 isNetworkReachable];

  if (v4)
  {
    id v5 = 0;
    id v6 = 0;
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    id v5 = [v7 localizedStringForKey:@"ADD_SHORTCUT_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    LODWORD(v7) = +[LibraryUIUtilities isMyPlacesEnabled];
    CFStringRef v8 = +[NSBundle mainBundle];
    unsigned __int8 v9 = v8;
    if (v7) {
      CFStringRef v10 = @"ADD_PIN_OFFLINE_ALERT_MESSAGE";
    }
    else {
      CFStringRef v10 = @"ADD_SHORTCUT_OFFLINE_ALERT_MESSAGE";
    }
    id v6 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:@"Offline"];
  }
  if ([(MapsOfflineUIHelper *)self isUsingForcedOfflineMaps])
  {
    id v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"ADD_SHORTCUT_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    unsigned int v13 = +[LibraryUIUtilities isMyPlacesEnabled];
    id v14 = +[NSBundle mainBundle];
    objc_super v15 = v14;
    if (v13) {
      CFStringRef v16 = @"ADD_PIN_FORCED_OFFLINE_ALERT_MESSAGE";
    }
    else {
      CFStringRef v16 = @"ADD_SHORTCUT_FORCED_OFFLINE_ALERT_MESSAGE";
    }
    uint64_t v17 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:@"Offline"];

    id v5 = (void *)v12;
    id v6 = (void *)v17;
  }
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    double v18 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    double v19 = +[NSBundle mainBundle];
    double v20 = [v19 localizedStringForKey:@"ADD_SHORTCUT_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
    double v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:0];
    [v18 addAction:v21];
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

- (id)alertControllerForAttemptedAddCollection
{
  objc_super v3 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned __int8 v4 = [v3 isNetworkReachable];

  if (v4)
  {
    id v5 = 0;
    id v6 = 0;
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    id v5 = [v7 localizedStringForKey:@"ADD_COLLECTION_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    CFStringRef v8 = +[NSBundle mainBundle];
    id v6 = [v8 localizedStringForKey:@"ADD_COLLECTION_OFFLINE_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];
  }
  if ([(MapsOfflineUIHelper *)self isUsingForcedOfflineMaps])
  {
    unsigned __int8 v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"ADD_COLLECTION_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    id v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"ADD_COLLECTION_FORCED_OFFLINE_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];

    id v5 = (void *)v10;
    id v6 = (void *)v12;
  }
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    unsigned int v13 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    id v14 = +[NSBundle mainBundle];
    objc_super v15 = [v14 localizedStringForKey:@"ADD_COLLECTION_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
    CFStringRef v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
    [v13 addAction:v16];
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)alertControllerForAttemptedAddNote
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    objc_super v3 = +[GEONetworkObserver sharedNetworkObserver];
    unsigned __int8 v4 = [v3 isNetworkReachable];

    if (v4)
    {
      id v5 = 0;
      id v6 = 0;
    }
    else
    {
      CFStringRef v8 = +[NSBundle mainBundle];
      id v5 = [v8 localizedStringForKey:@"ADD_NOTE_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

      unsigned __int8 v9 = +[NSBundle mainBundle];
      id v6 = [v9 localizedStringForKey:@"ADD_NOTE_OFFLINE_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];
    }
    if ([(MapsOfflineUIHelper *)self isUsingForcedOfflineMaps])
    {
      uint64_t v10 = +[NSBundle mainBundle];
      uint64_t v11 = [v10 localizedStringForKey:@"ADD_NOTE_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

      uint64_t v12 = +[NSBundle mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"ADD_NOTE_FORCED_OFFLINE_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];

      id v5 = (void *)v11;
      id v6 = (void *)v13;
    }
    if ([v5 length] && objc_msgSend(v6, "length"))
    {
      id v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
      id v14 = +[NSBundle mainBundle];
      objc_super v15 = [v14 localizedStringForKey:@"ADD_NOTE_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
      CFStringRef v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
      [v7 addAction:v16];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)alertControllerForCellularDownloadConfirmationForRegionName:(id)a3 size:(int64_t)a4 actionHandler:(id)a5
{
  id v8 = a3;
  id v49 = a5;
  v50 = self;
  unsigned int v52 = [(MapsOfflineUIHelper *)self hasSubscriptionsNeedingUpdate];
  int64_t v9 = a4;
  v51 = v8;
  if (a4 < 0) {
    goto LABEL_19;
  }
  int64_t v9 = a4;
  if (!v52) {
    goto LABEL_19;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v10 = [(MapsOfflineUIHelper *)self subscriptionInfos];
  id v11 = [v10 countByEnumeratingWithState:&v57 objects:v61 count:16];
  int64_t v48 = a4;
  int64_t v9 = a4;
  if (!v11) {
    goto LABEL_18;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v58;
  int64_t v9 = a4;
  do
  {
    id v14 = 0;
    do
    {
      if (*(void *)v58 != v13) {
        objc_enumerationMutation(v10);
      }
      objc_super v15 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v14);
      CFStringRef v16 = [v15 state];
      if ([v16 loadState] == (id)1) {
        goto LABEL_11;
      }
      uint64_t v17 = [v15 state];
      if ([v17 loadState] == (id)2)
      {

LABEL_11:
LABEL_12:
        double v18 = [v15 state];
        v9 += (int64_t)[v18 downloadedDataSize];

        goto LABEL_13;
      }
      double v19 = [v15 state];
      id v20 = [v19 loadState];

      if (v20 == (id)3) {
        goto LABEL_12;
      }
LABEL_13:
      id v14 = (char *)v14 + 1;
    }
    while (v12 != v14);
    id v21 = [v10 countByEnumeratingWithState:&v57 objects:v61 count:16];
    id v12 = v21;
  }
  while (v21);
LABEL_18:

  id v8 = v51;
  a4 = v48;
LABEL_19:
  if (a4 < 1)
  {
    id v22 = 0;
  }
  else
  {
    id v22 = +[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:v9];
  }
  long long v23 = +[NSBundle mainBundle];
  double v24 = v23;
  if (v52)
  {
    long long v25 = [v23 localizedStringForKey:@"DOWNLOAD_AND_UPDATE_MAP_CELLULAR_CONFIRMATION_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];
    long long v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v8);

    if (a4 >= 1)
    {
      long long v27 = +[NSBundle mainBundle];
      long long v28 = v27;
      CFStringRef v29 = @"DOWNLOAD_AND_UPDATE_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE";
      goto LABEL_27;
    }
    long long v33 = +[NSBundle mainBundle];
    long long v28 = v33;
    CFStringRef v34 = @"DOWNLOAD_AND_UPDATE_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE_NO_SIZE";
LABEL_30:
    long long v32 = [v33 localizedStringForKey:v34 value:@"localized string not found" table:@"Offline"];
  }
  else
  {
    id v30 = [v23 localizedStringForKey:@"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];
    long long v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v8);

    if (a4 < 1)
    {
      long long v33 = +[NSBundle mainBundle];
      long long v28 = v33;
      CFStringRef v34 = @"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE_NO_SIZE";
      goto LABEL_30;
    }
    long long v27 = +[NSBundle mainBundle];
    long long v28 = v27;
    CFStringRef v29 = @"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE";
LABEL_27:
    long long v31 = [v27 localizedStringForKey:v29 value:@"localized string not found" table:@"Offline"];
    long long v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v22);
  }
  int v35 = MGGetBoolAnswer();
  long long v36 = +[NSBundle mainBundle];
  long long v37 = v36;
  if (v35) {
    CFStringRef v38 = @"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER_WLAN";
  }
  else {
    CFStringRef v38 = @"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER";
  }
  long long v39 = [v36 localizedStringForKey:v38 value:@"localized string not found" table:@"Offline"];

  v40 = +[NSBundle mainBundle];
  id v41 = [v40 localizedStringForKey:@"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_DOWNLOAD" value:@"localized string not found" table:@"Offline"];

  __int16 v42 = +[UIAlertController alertControllerWithTitle:v26 message:v32 preferredStyle:1];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100C089B8;
  v55[3] = &unk_1012E6E08;
  id v43 = v49;
  id v56 = v43;
  v44 = +[UIAlertAction actionWithTitle:v39 style:1 handler:v55];
  [v42 addAction:v44];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100C089CC;
  v53[3] = &unk_1012E6E08;
  id v54 = v43;
  id v45 = v43;
  v46 = +[UIAlertAction actionWithTitle:v41 style:0 handler:v53];
  [v42 addAction:v46];
  [v42 setPreferredAction:v46];
  [(MapsOfflineUIHelper *)v50 _captureDisplayDownloadMapsAlertWithType:2];

  return v42;
}

- (id)alertControllerForCellularUpdateConfirmationForSize:(int64_t)a3 actionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:a3];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"UPDATE_OFFLINE_MAPS_CELLULAR_CONFIRMATION_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

  int64_t v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"UPDATE_OFFLINE_MAPS_CELLULAR_CONFIRMATION_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];
  id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v6);

  LODWORD(v9) = MGGetBoolAnswer();
  id v12 = +[NSBundle mainBundle];
  uint64_t v13 = v12;
  if (v9) {
    CFStringRef v14 = @"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER_WLAN";
  }
  else {
    CFStringRef v14 = @"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER";
  }
  objc_super v15 = [v12 localizedStringForKey:v14 value:@"localized string not found" table:@"Offline"];

  CFStringRef v16 = +[NSBundle mainBundle];
  uint64_t v17 = [v16 localizedStringForKey:@"DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_DOWNLOAD" value:@"localized string not found" table:@"Offline"];

  double v18 = +[UIAlertController alertControllerWithTitle:v8 message:v11 preferredStyle:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100C08CD4;
  v27[3] = &unk_1012E6E08;
  id v19 = v5;
  id v28 = v19;
  id v20 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v27];
  [v18 addAction:v20];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100C08CE8;
  v25[3] = &unk_1012E6E08;
  id v26 = v19;
  id v21 = v19;
  id v22 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v25];
  [v18 addAction:v22];
  [v18 setPreferredAction:v22];
  [(MapsOfflineUIHelper *)self _captureDisplayDownloadMapsAlertWithType:2];

  return v18;
}

- (id)alertControllerForInsufficientDiskSpaceForDownloadSize:(int64_t)a3
{
  unsigned __int8 v4 = +[MSPMapsPaths mapsApplicationContainerPaths];
  uint64_t v5 = [v4 homeDirectory];
  id v6 = +[NSURL fileURLWithPath:v5];

  id v35 = 0;
  LOBYTE(v5) = [v6 getResourceValue:&v35 forKey:NSURLVolumeURLKey error:0];
  id v7 = v35;
  if (v5)
  {
    NSURLResourceKey v36 = NSURLVolumeAvailableCapacityForImportantUsageKey;
    id v8 = +[NSArray arrayWithObjects:&v36 count:1];
    uint64_t v33 = 0;
    int64_t v9 = [v7 resourceValuesForKeys:v8 error:&v33];

    uint64_t v10 = [v9 objectForKeyedSubscript:NSURLVolumeAvailableCapacityForImportantUsageKey];
    id v11 = v10;
    if (!v10) {
      goto LABEL_12;
    }
    id v12 = [v10 longLongValue];
    double v13 = (double)a3;
    GEOConfigGetDouble();
    if (a3 + 1000000 * GEOConfigGetUInteger() >= (uint64_t)((v14 + 1.0) * (double)a3))
    {
      int64_t v16 = a3 + 1000000 * GEOConfigGetUInteger();
    }
    else
    {
      GEOConfigGetDouble();
      int64_t v16 = (uint64_t)((v15 + 1.0) * v13);
    }
    if (v16 > a3)
    {
      GEOConfigGetDouble();
      if (a3 + 1000000 * GEOConfigGetUInteger() >= (uint64_t)((v17 + 1.0) * v13))
      {
        a3 += 1000000 * GEOConfigGetUInteger();
      }
      else
      {
        GEOConfigGetDouble();
        a3 = (uint64_t)((v18 + 1.0) * v13);
      }
    }
    if (a3 > (uint64_t)v12)
    {
      long long v32 = +[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo10MB:a3 - (void)v12];
      id v19 = +[NSBundle mainBundle];
      id v20 = [v19 localizedStringForKey:@"OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];
      long long v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v32);

      id v21 = +[NSBundle mainBundle];
      id v22 = [v21 localizedStringForKey:@"OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];

      long long v23 = +[UIAlertController alertControllerWithTitle:v31 message:v22 preferredStyle:1];
      double v24 = +[NSBundle mainBundle];
      long long v25 = [v24 localizedStringForKey:@"OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_NOT_NOW_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
      id v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:0];
      [v23 addAction:v26];

      long long v27 = +[NSBundle mainBundle];
      id v28 = [v27 localizedStringForKey:@"OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_MANAGE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
      CFStringRef v29 = +[UIAlertAction actionWithTitle:v28 style:0 handler:&stru_10131B710];

      [v23 addAction:v29];
      [v23 setPreferredAction:v29];
    }
    else
    {
LABEL_12:
      long long v23 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [homeDirectoryURL getResourceValue:&volumeURL forKey:NSURLVolumeURLKey error:((void *)0)]", buf, 2u);
    }
    long long v23 = 0;
  }

  return v23;
}

- (id)alertControllerForAttemptedUpdateAll
{
  if (!GEOConfigGetBOOL())
  {
    if ([(MapsOfflineUIHelper *)self isUsingForcedOfflineMaps])
    {
      id v6 = +[NSBundle mainBundle];
      unsigned __int8 v4 = [v6 localizedStringForKey:@"UPDATE_ALL_MAP_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"UPDATE_ALL_MAP_FORCED_OFFLINE_ALERT_MESSAGE";
    }
    else
    {
      uint64_t v10 = +[GEONetworkObserver sharedNetworkObserver];
      unsigned __int8 v11 = [v10 isNetworkReachable];

      if (v11)
      {
        unsigned __int8 v4 = 0;
        uint64_t v5 = 0;
LABEL_9:
        if ([v4 length] && objc_msgSend(v5, "length"))
        {
          objc_super v3 = +[UIAlertController alertControllerWithTitle:v4 message:v5 preferredStyle:1];
          double v13 = +[NSBundle mainBundle];
          double v14 = [v13 localizedStringForKey:@"UPDATE_ALL_MAP_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
          double v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];
          [v3 addAction:v15];
        }
        else
        {
          objc_super v3 = 0;
        }
        goto LABEL_13;
      }
      id v12 = +[NSBundle mainBundle];
      unsigned __int8 v4 = [v12 localizedStringForKey:@"UPDATE_ALL_MAP_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"UPDATE_ALL_MAP_OFFLINE_ALERT_MESSAGE";
    }
    uint64_t v5 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:@"Offline"];

    goto LABEL_9;
  }
  objc_super v3 = [(MapsOfflineUIHelper *)self _osUpdateRequiredAlert];
  unsigned __int8 v4 = 0;
  uint64_t v5 = 0;
LABEL_13:

  return v3;
}

- (id)alertControllerForDisableSyncToWatchWithActionHandler:(id)a3
{
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [(MapsOfflineUIHelper *)self subscriptionInfos];
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v33;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v32 + 1) + 8 * i) pairedDeviceState];

      if (v10) {
        ++v7;
      }
    }
    id v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v6);

  if (v7)
  {
    unsigned __int8 v11 = +[NSBundle mainBundle];
    uint64_t v5 = [v11 localizedStringForKey:@"DISABLE_SYNC_TO_WATCH_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

    id v12 = +[NSBundle mainBundle];
    long long v25 = [v12 localizedStringForKey:@"DISABLE_SYNC_TO_WATCH_ALERT_MESSAGE" value:@"localized string not found" table:@"Offline"];

    id v6 = +[UIAlertController alertControllerWithTitle:v5 message:v25 preferredStyle:0];
    double v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"DISABLE_SYNC_TO_WATCH_ALERT_ACTION_KEEP" value:@"localized string not found" table:@"Offline"];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100C0986C;
    v30[3] = &unk_1012E6E08;
    id v15 = v4;
    id v31 = v15;
    int64_t v16 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v30];
    [v6 addAction:v16];

    double v17 = +[NSBundle mainBundle];
    double v18 = [v17 localizedStringForKey:@"DISABLE_SYNC_TO_WATCH_ALERT_ACTION_REMOVE" value:@"localized string not found" table:@"Offline"];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100C09884;
    v28[3] = &unk_1012E6E08;
    id v19 = v15;
    id v29 = v19;
    id v20 = +[UIAlertAction actionWithTitle:v18 style:2 handler:v28];
    [v6 addAction:v20];

    id v21 = +[NSBundle mainBundle];
    id v22 = [v21 localizedStringForKey:@"DISABLE_SYNC_TO_WATCH_ALERT_ACTION_CANCEL" value:@"localized string not found" table:@"Offline"];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100C0989C;
    v26[3] = &unk_1012E6E08;
    id v27 = v19;
    long long v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v26];
    [v6 addAction:v23];

LABEL_12:
    goto LABEL_14;
  }
  id v6 = 0;
LABEL_14:

  return v6;
}

- (id)alertControllerForInsufficientDiskSpaceOnPairedDeviceForDownloadSize:(int64_t)a3
{
  objc_super v3 = +[NSByteCountFormatter stringFromByteCount:(unint64_t)((double)(uint64_t)llround((double)a3 / 1000000.0) * 1000000.0) countStyle:2];
  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"OFFLINE_MANAGEMENT_PAIRED_DEVICE_DISK_SPACE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];
  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"OFFLINE_MANAGEMENT_PAIRED_DEVICE_DISK_SPACE_ALERT_BODY" value:@"localized string not found" table:@"Offline"];
  uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v3);
  CFStringRef v9 = +[UIAlertController alertControllerWithTitle:v5 message:v8 preferredStyle:1];

  uint64_t v10 = +[NSBundle mainBundle];
  unsigned __int8 v11 = [v10 localizedStringForKey:@"MANAGE_WATCH_STORAGE" value:@"localized string not found" table:@"Offline"];
  id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:&stru_10131B730];
  [v9 addAction:v12];

  double v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"NOT_NOW" value:@"localized string not found" table:@"Offline"];
  id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:&stru_10131B750];
  [v9 addAction:v15];

  return v9;
}

- (void)_captureDisplayDownloadMapsAlertWithType:(int64_t)a3
{
  if (a3 == 1) {
    CFStringRef v3 = @"maps is offline";
  }
  else {
    CFStringRef v3 = @"use cellular data";
  }
  +[GEOAPPortal captureUserAction:369 target:0 value:v3];
}

@end