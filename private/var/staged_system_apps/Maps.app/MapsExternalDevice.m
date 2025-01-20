@interface MapsExternalDevice
+ (id)_destinationHandoffErrorWithReason:(int64_t)a3;
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)_localizedReasonForHandoffError:(int64_t)a3;
+ (id)_stringRepresentationOfDictionary:(id)a3;
+ (id)sharedInstance;
+ (void)_presentActivityControllerForDestination:(id)a3 completion:(id)a4;
+ (void)_presentActivityControllerForDestination:(id)a3 searchResult:(id)a4 dictionary:(id)a5 completion:(id)a6;
+ (void)initialize;
- (ACCNavigationProvider)navigationProvider;
- (AVExternalDevice)externalDevice;
- (BOOL)_checkScreenOwnershipIfNeeded:(id)a3;
- (BOOL)_destinationHandoffTestingEnabled;
- (BOOL)_isCarPlaySessionActive;
- (BOOL)_isCurrentStateEqualLastPostedState;
- (BOOL)carPlayIsNavigating;
- (BOOL)destinationHandoffEnabled;
- (BOOL)externalAccessoryIsNavigating;
- (BOOL)isConnected;
- (BOOL)monitoringIOHID;
- (CARNavigationOwnershipManager)navigationOwnershipManager;
- (CarMetadataConnectionManager)metadataManager;
- (MapsExternalDevice)init;
- (MapsExternalDeviceState)currentState;
- (MapsExternalDeviceState)lastPostedState;
- (NSMapTable)navigationAccessories;
- (NSString)externalDeviceDescription;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)screenBorrowToken;
- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3;
- (void)_postNotificationIfNeeded;
- (void)_registerForAVNotifications;
- (void)_setupCarCluster;
- (void)_unregisterForAVNotifications;
- (void)_updateStateForRecievedNotification:(id)a3;
- (void)borrowScreenIfNeededForReason:(id)a3;
- (void)checkForActiveCarPlayConnection;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)handoffDestination:(id)a3 completion:(id)a4;
- (void)navigation:(id)a3 accessoryAttached:(id)a4;
- (void)navigation:(id)a3 accessoryDetached:(id)a4;
- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5;
- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5;
- (void)navigationOwnershipChangedToOwner:(unint64_t)a3;
- (void)relinquishScreenIfNeeded;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCarPlayIsNavigating:(BOOL)a3;
- (void)setCurrentState:(id)a3;
- (void)setExternalDevice:(id)a3;
- (void)setLastPostedState:(id)a3;
- (void)setMetadataManager:(id)a3;
- (void)setMonitoringIOHID:(BOOL)a3;
- (void)setNavigationAccessories:(id)a3;
- (void)setNavigationOwnershipManager:(id)a3;
- (void)setNavigationProvider:(id)a3;
- (void)setRouteGuidanceBeingShownInApp:(BOOL)a3;
- (void)setScreenBorrowToken:(id)a3;
- (void)startMonitoringIOHIDRepeatCurrentGuidance;
- (void)stopMonitoringIOHIDRepeatCurrentGuidance;
@end

@implementation MapsExternalDevice

- (BOOL)_isCarPlaySessionActive
{
  v2 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setupCarCluster
{
  if (GEOConfigGetBOOL())
  {
    BOOL v3 = objc_alloc_init(CarMetadataConnectionManager);
    metadataManager = self->_metadataManager;
    self->_metadataManager = v3;
  }
  else
  {
    id v5 = [objc_alloc((Class)ACCNavigationProvider) initWithDelegate:self];
    [(MapsExternalDevice *)self setNavigationProvider:v5];

    v6 = +[NSMapTable strongToStrongObjectsMapTable];
    [(MapsExternalDevice *)self setNavigationAccessories:v6];

    id v7 = +[NSNumber numberWithBool:0];
    v8 = +[NSUserDefaults standardUserDefaults];
    v9 = [v8 objectForKey:@"CarInstrumentClusterDebugNavigationAccessory"];

    if (v9) {
      v10 = v9;
    }
    else {
      v10 = v7;
    }
    id v11 = v10;

    unsigned int v12 = [v11 BOOLValue];
    if (v12)
    {
      id v13 = objc_alloc((Class)ACCNavigationAccessory);
      v14 = [(MapsExternalDevice *)self navigationProvider];
      id v15 = [v13 initWithAccessoryUID:@"1124" provider:v14];

      v16 = objc_opt_new();
      [v16 setMaxCapacity_GuidanceManeuver:4];
      [v16 setIdentifier:713];
      v17 = [(MapsExternalDevice *)self navigationProvider];
      v19 = v16;
      v18 = +[NSArray arrayWithObjects:&v19 count:1];
      [(MapsExternalDevice *)self navigation:v17 startRouteGuidance:v15 componentList:v18];
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:&off_1013AEC90];
  }
}

- (MapsExternalDevice)init
{
  v20.receiver = self;
  v20.super_class = (Class)MapsExternalDevice;
  id v2 = [(MapsExternalDevice *)&v20 init];
  unsigned int v3 = +[CarDisplayController isCarPlayAvailable];
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v2->_initialising = 1;
    id screenBorrowToken = v2->_screenBorrowToken;
    v2->_id screenBorrowToken = 0;

    id v7 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v7;

    char BOOL = GEOConfigGetBOOL();
    if ((BOOL & 1) == 0)
    {
      id v10 = objc_alloc((Class)CARNavigationOwnershipManager);
      id v11 = +[NSBundle mainBundle];
      unsigned int v12 = [v11 bundleIdentifier];
      id v13 = (CARNavigationOwnershipManager *)[v10 initWithIdentifier:v12 delegate:v2];
      navigationOwnershipManager = v2->_navigationOwnershipManager;
      v2->_navigationOwnershipManager = v13;
    }
    if ([(MapsExternalDevice *)v2 _isCarPlaySessionActive])
    {
      id v15 = sub_1006734AC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "external accessory already connected, fetch current AVExternalDevice", v19, 2u);
      }

      v16 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
      v17 = [v16 carPlayExternalDevice];
      [(MapsExternalDevice *)v2 setExternalDevice:v17];
    }
    [(CARSessionStatus *)v2->_carSessionStatus addSessionObserver:v2];
    [(MapsExternalDevice *)v2 _setupCarCluster];
    v2->_initialising = 0;
    id v5 = v2;
  }

  return v5;
}

- (BOOL)isConnected
{
  id v2 = [(MapsExternalDevice *)self externalDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (AVExternalDevice)externalDevice
{
  return self->_externalDevice;
}

+ (id)sharedInstance
{
  if (qword_10160F428 != -1) {
    dispatch_once(&qword_10160F428, &stru_1012F3B40);
  }
  id v2 = (void *)qword_10160F420;

  return v2;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MapsExternalDevice;
  [(MapsExternalDevice *)&v4 dealloc];
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = &_dispatch_main_q;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  id v13 = sub_100673714;
  v14 = &unk_1012E5D08;
  id v15 = self;
  id v6 = &_dispatch_main_q;
  id v7 = v12;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (BOOL v10 = v9 == 0) : (BOOL v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v13((uint64_t)v7);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = &_dispatch_main_q;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  id v13 = sub_1006738E8;
  v14 = &unk_1012E5D08;
  id v15 = self;
  id v6 = &_dispatch_main_q;
  id v7 = v12;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (BOOL v10 = v9 == 0) : (BOOL v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v13((uint64_t)v7);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)_registerForAVNotifications
{
  if (!self->_notificationObservers)
  {
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100673D48;
    v24[3] = &unk_1012F3B68;
    objc_copyWeak(&v25, &location);
    v24[4] = self;
    BOOL v3 = objc_retainBlock(v24);
    id v4 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = +[NSOperationQueue mainQueue];
    id v6 = [v4 addObserverForName:AVExternalDeviceNightModeChangedNotification object:0 queue:v5 usingBlock:v3];
    v27[0] = v6;
    v21 = +[NSOperationQueue mainQueue];
    objc_super v20 = [v4 addObserverForName:AVExternalDeviceScreenBecameAvailableNotification object:0 queue:v21 usingBlock:v3];
    v27[1] = v20;
    v19 = +[NSOperationQueue mainQueue];
    v18 = [v4 addObserverForName:AVExternalDeviceScreenBecameUnavailableNotification object:0 queue:v19 usingBlock:v3];
    v27[2] = v18;
    v17 = +[NSOperationQueue mainQueue];
    v16 = [v4 addObserverForName:AVExternalDeviceLimitedUIChangedNotification object:0 queue:v17 usingBlock:v3];
    v27[3] = v16;
    id v7 = +[NSOperationQueue mainQueue];
    v8 = [v4 addObserverForName:AVExternalDeviceNavigationAidedDrivingStateChangedNotification object:0 queue:v7 usingBlock:v3];
    v27[4] = v8;
    v9 = +[NSOperationQueue mainQueue];
    BOOL v10 = [v4 addObserverForName:AVExternalDevicePerformanceReportPostedNotification object:0 queue:v9 usingBlock:v3];
    v27[5] = v10;
    id v11 = +[NSOperationQueue mainQueue];
    id v15 = (void *)v5;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1006741DC;
    v22[3] = &unk_1012E6730;
    objc_copyWeak(&v23, &location);
    unsigned int v12 = [v4 addObserverForName:UISceneWillEnterForegroundNotification object:0 queue:v11 usingBlock:v22];
    v27[6] = v12;
    id v13 = +[NSArray arrayWithObjects:v27 count:7];
    notificationObservers = self->_notificationObservers;
    self->_notificationObservers = v13;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (void)_unregisterForAVNotifications
{
  if (self->_notificationObservers)
  {
    BOOL v3 = sub_1006734AC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop observing AV device notifications", buf, 2u);
    }

    id v4 = self->_notificationObservers;
    notificationObservers = self->_notificationObservers;
    self->_notificationObservers = 0;

    id v6 = +[NSNotificationCenter defaultCenter];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
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
          [v6 removeObserver:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) forKeyPath:(void)v12];
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)borrowScreenIfNeededForReason:(id)a3
{
  id v8 = a3;
  if ([(MapsExternalDevice *)self ownsScreen] && !self->_screenBorrowToken)
  {
    id v4 = [(MapsExternalDevice *)self externalDevice];
    uint64_t v5 = +[NSBundle mainBundle];
    id v6 = [v5 bundleIdentifier];
    id v7 = [v4 borrowScreenForClient:v6 reason:v8];
    [(MapsExternalDevice *)self setScreenBorrowToken:v7];
  }
}

- (void)relinquishScreenIfNeeded
{
  BOOL v3 = [(MapsExternalDevice *)self screenBorrowToken];

  if (v3)
  {
    [(MapsExternalDevice *)self setScreenBorrowToken:0];
  }
}

- (void)checkForActiveCarPlayConnection
{
  BOOL v3 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
  id v4 = [v3 carPlayExternalDevice];

  if (![(MapsExternalDevice *)self isConnected]) {
    goto LABEL_17;
  }
  uint64_t v5 = sub_1006734AC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "asked to check for active CarPlay connection, already have one (but will check it's ok)", buf, 2u);
  }

  id v6 = [(MapsExternalDevice *)self externalDevice];
  id v7 = [v6 transportType];

  if (!v4 || !v7)
  {
    id v8 = sub_1006734AC();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

LABEL_17:
      long long v15 = sub_1006734AC();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "asked to check for active CarPlay connection, found one", buf, 2u);
        }

        v17 = self;
        v18 = v4;
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "asked to check for active CarPlay connection, found none", buf, 2u);
        }

        if ([(MapsExternalDevice *)self isConnected])
        {
          v19 = +[MapsExternalAccessory sharedInstance];
          unsigned int v20 = [v19 isConnected];

          if (v20)
          {
            v21 = sub_1006734AC();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = +[MapsExternalAccessory sharedInstance];
              *(_DWORD *)buf = 138412290;
              v26 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "no current CarPlay AV device, but we still have our reference and ExternalAccessory is apparently connected: %@", buf, 0xCu);
            }
          }
        }
        if ([(MapsExternalDevice *)self isConnected]
          && [(MapsExternalDevice *)self _isCarPlaySessionActive])
        {
          id v23 = sub_1006734AC();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
            *(_DWORD *)buf = 138412290;
            v26 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "no current CarPlay AV device, but we still have our reference and a CarPlay session is apparently active: %@", buf, 0xCu);
          }
        }
        v17 = self;
        v18 = 0;
      }
      [(MapsExternalDevice *)v17 setExternalDevice:v18];
      goto LABEL_35;
    }
    id v9 = v4;
    if (!v4)
    {
      long long v14 = @"<nil>";
      goto LABEL_15;
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      long long v12 = [v9 performSelector:"accessibilityIdentifier"];
      long long v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        long long v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_13;
      }
    }
    long long v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_13:

LABEL_15:
    *(_DWORD *)buf = 138412546;
    v26 = v14;
    __int16 v27 = 2048;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "something has gone wrong with our externalDevice reference! treating as nil... (device: %@, transportType: %ld)", buf, 0x16u);

    goto LABEL_16;
  }
LABEL_35:
}

- (void)setExternalDevice:(id)a3
{
  id v4 = a3;
  externalDevice = self->_externalDevice;
  id v6 = [[MapsExternalDeviceState alloc] initWithExternalDevice:v4];
  BOOL v7 = v4 != 0;
  v41 = v6;
  if (!v4 || v6)
  {
    if ((v4 != 0) == (externalDevice != 0)) {
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  id v8 = sub_1006734AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_opt_class();
      id v11 = [v9 ID];
      long long v12 = [v9 name];
      long long v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p> (ID: %@, name: %@, transportType: %ld)", v10, v9, v11, v12, [v9 transportType]);
    }
    else
    {
      long long v13 = [v9 description];
    }

    *(_DWORD *)buf = 138543362;
    unint64_t v45 = (unint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "no state created for device, treating as nil: %{public}@", buf, 0xCu);
  }
  BOOL v7 = 0;
  id v4 = 0;
  if (externalDevice)
  {
LABEL_11:
    long long v14 = sub_1006734AC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = @"NO";
      if (externalDevice) {
        BOOL v16 = @"YES";
      }
      else {
        BOOL v16 = @"NO";
      }
      if (v7) {
        long long v15 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      unint64_t v45 = (unint64_t)v16;
      __int16 v46 = 2114;
      uint64_t v47 = (uint64_t)v15;
      v17 = v15;
      v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "connection state changed from: %{public}@ to: %{public}@", buf, 0x16u);
    }
  }
LABEL_19:
  v19 = sub_1006734AC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    externalDeviceDescription = self->_externalDeviceDescription;
    id v20 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = objc_opt_class();
      v22 = [v20 ID];
      id v23 = [v20 name];
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p> (ID: %@, name: %@, transportType: %ld)", v21, v20, v22, v23, [v20 transportType]);
    }
    else
    {
      v24 = [v20 description];
    }

    *(_DWORD *)buf = 138543618;
    unint64_t v45 = (unint64_t)externalDeviceDescription;
    __int16 v46 = 2114;
    uint64_t v47 = (uint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "updating external device from %{public}@ to %{public}@", buf, 0x16u);
  }
  if (v7)
  {
    objc_storeStrong((id *)&self->_externalDevice, v4);
    id v25 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v26 = objc_opt_class();
      __int16 v27 = [v25 ID];
      id v28 = [v25 name];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p> (ID: %@, name: %@, transportType: %ld)", v26, v25, v27, v28, [v25 transportType]);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = [v25 description];
    }

    v31 = self->_externalDeviceDescription;
    self->_externalDeviceDescription = v29;

    [(MapsExternalDevice *)self _registerForAVNotifications];
    if ([v25 ownsScreen])
    {
      unint64_t UInteger = GEOConfigGetUInteger();
      self->_maxScreenOwnershipChecks = UInteger;
      self->_unint64_t screenOwnershipChecksRemaining = UInteger;
      v33 = sub_1006734AC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        unint64_t screenOwnershipChecksRemaining = self->_screenOwnershipChecksRemaining;
        *(_DWORD *)buf = 134218240;
        unint64_t v45 = screenOwnershipChecksRemaining;
        __int16 v46 = 2048;
        uint64_t v47 = 0x3FC999999999999ALL;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "scheduling %lu deferred screen ownership checks (every %#.1lfs)...", buf, 0x16u);
      }

      if (self->_maxScreenOwnershipChecks)
      {
        objc_initWeak((id *)buf, self);
        id v35 = &_dispatch_main_q;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100674F58;
        v42[3] = &unk_1012E7638;
        objc_copyWeak(&v43, (id *)buf);
        v36 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:1 repeating:v42 block:0.2];
        screenOwnershipCheckTimer = self->_screenOwnershipCheckTimer;
        self->_screenOwnershipCheckTimer = v36;

        objc_destroyWeak(&v43);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    [(MapsExternalDevice *)self _unregisterForAVNotifications];
    objc_storeStrong((id *)&self->_externalDevice, v4);
    v30 = self->_externalDeviceDescription;
    self->_externalDeviceDescription = 0;
  }
  [(MapsExternalDevice *)self setCurrentState:v41];
  if (self->_carPlayIsNavigating)
  {
    v38 = [(MapsExternalDevice *)self navigationOwnershipManager];
    [v38 requestNavigationOwnership];

    v39 = [(MapsExternalDevice *)self metadataManager];
    [v39 requestNavigationOwnership];
  }
}

- (void)setCurrentState:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentState, a3);
  id v6 = sub_1006734AC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [(MapsExternalDevice *)self externalDeviceDescription];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "state updated for device: %@\n currentState=%@", (uint8_t *)&v8, 0x16u);
  }
  [(MapsExternalDevice *)self _postNotificationIfNeeded];
}

- (void)_updateStateForRecievedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1006734AC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 name];
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handling notification: %@", (uint8_t *)&v10, 0xCu);
  }
  BOOL v7 = [MapsExternalDeviceState alloc];
  int v8 = [(MapsExternalDevice *)self externalDevice];
  id v9 = [(MapsExternalDeviceState *)v7 initWithExternalDevice:v8];
  [(MapsExternalDevice *)self setCurrentState:v9];
}

- (BOOL)_checkScreenOwnershipIfNeeded:(id)a3
{
  id v4 = a3;
  if (!self->_screenOwnershipCheckTimer) {
    goto LABEL_26;
  }
  id v5 = sub_1006734AC();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      unint64_t maxScreenOwnershipChecks = self->_maxScreenOwnershipChecks;
      unint64_t v8 = maxScreenOwnershipChecks - self->_screenOwnershipChecksRemaining + 1;
      int v26 = 134218240;
      unint64_t v27 = v8;
      __int16 v28 = 2048;
      v29 = (__CFString *)maxScreenOwnershipChecks;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "screen ownership check %lu/%lu...", (uint8_t *)&v26, 0x16u);
    }

    --self->_screenOwnershipChecksRemaining;
  }
  else
  {
    if (v6)
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "screen ownership check (not scheduled)...", (uint8_t *)&v26, 2u);
    }
  }
  id v9 = [(MapsExternalDevice *)self externalDevice];
  if (v9)
  {
    int v10 = [(MapsExternalDevice *)self externalDevice];
    unsigned int v11 = [v10 ownsScreen] ^ 1;
  }
  else
  {
    unsigned int v11 = 0;
  }

  long long v12 = [(MapsExternalDevice *)self externalDevice];
  unsigned int v13 = v12 ? v11 : 1;

  if (self->_screenOwnershipChecksRemaining)
  {
    if (!v13) {
      goto LABEL_26;
    }
  }
  v19 = sub_1006734AC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    unint64_t screenOwnershipChecksRemaining = self->_screenOwnershipChecksRemaining;
    uint64_t v21 = @"NO";
    if (v11) {
      uint64_t v21 = @"YES";
    }
    v22 = v21;
    id v23 = [(MapsExternalDevice *)self externalDeviceDescription];
    int v26 = 134218498;
    unint64_t v27 = screenOwnershipChecksRemaining;
    __int16 v28 = 2112;
    v29 = v22;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "cancelling screen ownership checks (remaining: %lu, we own screen: %@, device: %@)", (uint8_t *)&v26, 0x20u);
  }
  [(GCDTimer *)self->_screenOwnershipCheckTimer invalidate];
  screenOwnershipCheckTimer = self->_screenOwnershipCheckTimer;
  self->_screenOwnershipCheckTimer = 0;

  if (v13)
  {
    long long v14 = sub_1006734AC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "screen ownership changed to us (or device disappeared), update state and schedule notification", (uint8_t *)&v26, 2u);
    }

    long long v15 = [MapsExternalDeviceState alloc];
    BOOL v16 = [(MapsExternalDevice *)self externalDevice];
    v17 = [(MapsExternalDeviceState *)v15 initWithExternalDevice:v16];
    [(MapsExternalDevice *)self setCurrentState:v17];

    BOOL v18 = 1;
  }
  else
  {
LABEL_26:
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_isCurrentStateEqualLastPostedState
{
  uint64_t v3 = [(MapsExternalDevice *)self lastPostedState];
  uint64_t v4 = [(MapsExternalDevice *)self currentState];
  if (v3 | v4) {
    unsigned __int8 v5 = [(id)v3 isEqual:v4];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)_postNotificationIfNeeded
{
  if (self->_initialising)
  {
    uint64_t v3 = sub_1006734AC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "suppressing notification while initialising MapsExternalDevice", buf, 2u);
    }

    uint64_t v4 = [(MapsExternalDevice *)self currentState];
    id v5 = [v4 copy];
    [(MapsExternalDevice *)self setLastPostedState:v5];
  }
  else
  {
    id v6 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    unsigned int v13 = sub_100675688;
    long long v14 = &unk_1012E5D08;
    long long v15 = self;
    id v7 = &_dispatch_main_q;
    unint64_t v8 = v12;
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    int v10 = dispatch_queue_get_label(0);
    if (label == v10 || label && v10 && !strcmp(label, v10))
    {
      v13((uint64_t)v8);
    }
    else
    {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }
}

- (BOOL)externalAccessoryIsNavigating
{
  if (GEOConfigGetBOOL())
  {
    metadataManager = self->_metadataManager;
    return [(CarMetadataConnectionManager *)metadataManager externalAccessoryIsNavigating];
  }
  else
  {
    id v5 = [(MapsExternalDevice *)self navigationOwnershipManager];
    BOOL v6 = [v5 owner] == (id)2;

    return v6;
  }
}

- (void)setCarPlayIsNavigating:(BOOL)a3
{
  if (self->_carPlayIsNavigating != a3)
  {
    BOOL v3 = a3;
    self->_BOOL carPlayIsNavigating = a3;
    id v5 = sub_1006734AC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL carPlayIsNavigating = self->_carPlayIsNavigating;
      v10[0] = 67109120;
      v10[1] = carPlayIsNavigating;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "iOS navigation state became %d", (uint8_t *)v10, 8u);
    }

    id v7 = [(MapsExternalDevice *)self navigationOwnershipManager];
    unint64_t v8 = v7;
    if (v3)
    {
      [v7 requestNavigationOwnership];

      id v9 = [(MapsExternalDevice *)self metadataManager];
      [v9 requestNavigationOwnership];
    }
    else
    {
      [v7 releaseNavigationOwnership];

      id v9 = [(MapsExternalDevice *)self metadataManager];
      [v9 releaseNavigationOwnership];
    }
  }
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  uint64_t v4 = sub_1006734AC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"none";
    if (a3 == 2) {
      CFStringRef v5 = @"car";
    }
    if (a3 == 1) {
      CFStringRef v5 = @"iOS";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Navigation owner changed to %{public}@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100675BA4;
  block[3] = &unk_1012E63F0;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)destinationHandoffEnabled
{
  id v2 = +[MapsExternalAccessory sharedInstance];
  if (([v2 isConnected] & 1) == 0)
  {
    BOOL v3 = sub_1006734AC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Checking if destination handoff is enabled, but accessory not connected", v8, 2u);
    }
  }
  if ([v2 destinationHandoffEnabled])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    CFStringRef v5 = +[GEOPlatform sharedPlatform];
    if ([v5 isInternalInstall])
    {
      BOOL v6 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v4 = [v6 BOOLForKey:@"StarkDestinationSharingEnableKey"];
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_destinationHandoffTestingEnabled
{
  id v2 = +[GEOPlatform sharedPlatform];
  if ([v2 isInternalInstall])
  {
    BOOL v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"StarkDestinationSharingTestKey"];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)handoffDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100676358;
  v52[3] = &unk_1012F3B90;
  id v7 = a4;
  id v53 = v7;
  CFStringRef v8 = objc_retainBlock(v52);
  if ([(MapsExternalDevice *)self destinationHandoffEnabled])
  {
    id v9 = +[SearchResult carSearchResultFromDestination:v6];
    int v10 = v9;
    if (v9)
    {
      unsigned int v11 = [v9 _maps_externalDeviceDictionaryRepresentation];
      if ([(MapsExternalDevice *)self _destinationHandoffTestingEnabled])
      {
        long long v12 = sub_100015DB4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Destination hand-off testing enabled, will present activity controller instead.", buf, 2u);
        }

        [(id)objc_opt_class() _presentActivityControllerForDestination:v6 searchResult:v10 dictionary:v11 completion:v7];
      }
      else
      {
        BOOL v16 = +[NSUUID UUID];
        v17 = [v16 UUIDString];

        BOOL v18 = +[NSUserDefaults standardUserDefaults];
        [v18 doubleForKey:@"__internal__CarDestinationHandoffTimeoutInterval"];
        double v20 = v19;

        if (v7)
        {
          v33 = v17;
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v55 = sub_100103E6C;
          v56 = sub_1001047C0;
          id v57 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = &v46;
          uint64_t v48 = 0x3032000000;
          v49 = sub_100103E6C;
          v50 = sub_1001047C0;
          id v51 = 0;
          uint64_t v21 = +[NSNotificationCenter defaultCenter];
          v22 = +[NSOperationQueue mainQueue];
          uint64_t v23 = EAAccessoryDestinationStatusNotification;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100676430;
          v40[3] = &unk_1012F3BB8;
          id v24 = v33;
          v44 = &v46;
          unint64_t v45 = buf;
          id v41 = v24;
          v42 = self;
          id v43 = v7;
          uint64_t v25 = [v21 addObserverForName:v23 object:0 queue:v22 usingBlock:v40];
          int v26 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v25;

          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100676654;
          v34[3] = &unk_1012F3BE0;
          double v39 = v20;
          id v35 = v24;
          v38 = buf;
          v36 = self;
          v37 = v8;
          uint64_t v27 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v34 block:v20];
          __int16 v28 = (void *)v47[5];
          v47[5] = v27;

          v17 = v33;
          _Block_object_dispose(&v46, 8);

          _Block_object_dispose(buf, 8);
        }
        v29 = sub_100015DB4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          __int16 v30 = +[NSNumber numberWithDouble:v20];
          v31 = [(id)objc_opt_class() _stringRepresentationOfDictionary:v11];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2112;
          v55 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Sending destination to the car (identifier:%@, timeout:%@s, destination:{%@})", buf, 0x20u);
        }
        v32 = +[MapsExternalAccessory sharedInstance];
        [v32 sendDestinationInformation:v11 identifier:v17];
      }
    }
    else
    {
      unsigned int v13 = sub_100015DB4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to convert destination to a SearchResult (destination:%@)", buf, 0xCu);
      }
      unsigned int v11 = [(id)objc_opt_class() _destinationHandoffErrorWithReason:2];
      ((void (*)(void *, void, void *))v8[2])(v8, 0, v11);
    }
  }
  else
  {
    int v10 = [(id)objc_opt_class() _destinationHandoffErrorWithReason:1];
    ((void (*)(void *, void, void *))v8[2])(v8, 0, v10);
  }
}

+ (void)_presentActivityControllerForDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (+[NSThread isMainThread])
  {
    CFStringRef v8 = +[SearchResult carSearchResultFromDestination:v6];
    if (v8)
    {
      id v9 = v8;
      int v10 = [v8 _maps_externalDeviceDictionaryRepresentation];
      [a1 _presentActivityControllerForDestination:v6 searchResult:v9 dictionary:v10 completion:v7];
    }
    else
    {
      unsigned int v11 = sub_100015DB4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v12 = (objc_class *)objc_opt_class();
        unsigned int v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138412290;
        double v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to convert destination to a SearchResult (destination:%@)", buf, 0xCu);
      }
      if (v7)
      {
        long long v14 = [(id)objc_opt_class() _destinationHandoffErrorWithReason:2];
        v7[2](v7, 0, v14);
      }
      id v9 = 0;
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100676980;
    block[3] = &unk_1012EB5B8;
    id v18 = a1;
    id v16 = v6;
    v17 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v9 = v16;
  }
}

+ (void)_presentActivityControllerForDestination:(id)a3 searchResult:(id)a4 dictionary:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v12 = (__CFString *)a5;
  id v13 = a6;
  if (+[NSThread isMainThread])
  {
    long long v14 = +[NSMutableDictionary dictionary];
    long long v15 = +[NSDate date];
    id v16 = [v15 description];
    [v14 setObject:v16 forKeyedSubscript:@"timestamp"];

    if (v12) {
      CFStringRef v17 = v12;
    }
    else {
      CFStringRef v17 = @"n/a";
    }
    [v14 setObject:v17 forKeyedSubscript:@"serialized"];
    id v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    double v20 = (void *)v19;
    if (v19) {
      CFStringRef v21 = (const __CFString *)v19;
    }
    else {
      CFStringRef v21 = @"n/a";
    }
    [v14 setObject:v21 forKeyedSubscript:@"type"];

    uint64_t v22 = [v11 name];
    uint64_t v23 = (void *)v22;
    if (v22) {
      CFStringRef v24 = (const __CFString *)v22;
    }
    else {
      CFStringRef v24 = @"n/a";
    }
    [v14 setObject:v24 forKeyedSubscript:@"name"];

    id v49 = 0;
    uint64_t v25 = +[NSJSONSerialization dataWithJSONObject:v14 options:1 error:&v49];
    id v26 = v49;
    id v27 = v26;
    id v43 = v10;
    if (v25)
    {
      id v28 = objc_alloc((Class)UIActivityViewController);
      id v57 = v25;
      v29 = +[NSArray arrayWithObjects:&v57 count:1];
      id v30 = [v28 initWithActivityItems:v29 applicationActivities:0];

      v56[0] = UIActivityTypePostToVimeo;
      v56[1] = UIActivityTypePostToWeibo;
      v56[2] = UIActivityTypePostToFacebook;
      v56[3] = UIActivityTypePostToVimeo;
      v56[4] = UIActivityTypePostToTencentWeibo;
      v56[5] = UIActivityTypeAddToReadingList;
      v56[6] = UIActivityTypePostToFlickr;
      v31 = +[NSArray arrayWithObjects:v56 count:7];
      [v30 setExcludedActivityTypes:v31];

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100676F34;
      v44[3] = &unk_1012F3C30;
      v32 = &v45;
      id v45 = v13;
      [v30 setCompletionWithItemsHandler:v44];
      +[UIApplication sharedMapsDelegate];
      v34 = v33 = v27;
      id v35 = [v34 chromeViewController];

      [v35 presentViewController:v30 animated:1 completion:0];
    }
    else
    {
      v42 = v26;
      v36 = sub_100015DB4();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = [v42 localizedDescription];
        v38 = [v42 localizedFailureReason];
        *(_DWORD *)buf = 138412546;
        v59 = v37;
        __int16 v60 = 2112;
        v61 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Error serializing debug JSON (%@, %@)", buf, 0x16u);
      }
      id v30 = +[UIAlertController alertControllerWithTitle:@"Error serializing destination" message:@"There was an error serializing the destination." preferredStyle:1];
      double v39 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
      [v30 addAction:v39];

      v40 = +[UIApplication sharedMapsDelegate];
      id v41 = [v40 chromeViewController];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100676F10;
      v46[3] = &unk_1012E5F78;
      v32 = &v48;
      id v48 = v13;
      v33 = v42;
      id v47 = v42;
      [v41 presentViewController:v30 animated:1 completion:v46];

      id v35 = v47;
      uint64_t v25 = 0;
    }

    id v10 = v43;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100676EFC;
    block[3] = &unk_1012F3C08;
    id v55 = a1;
    id v51 = v10;
    id v52 = v11;
    id v53 = v12;
    id v54 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    long long v14 = v51;
  }
}

+ (id)_destinationHandoffErrorWithReason:(int64_t)a3
{
  CFStringRef v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Destination handoff failure alert title [CarPlay]" value:@"localized string not found" table:0];

  id v7 = +[NSMutableDictionary dictionaryWithObject:v6 forKey:NSLocalizedDescriptionKey];
  CFStringRef v8 = [a1 _localizedReasonForHandoffError:a3];
  id v9 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v9 forKeyedSubscript:@"__handoff_error_key"];

  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
  }
  id v10 = [a1 _errorWithCode:1 userInfo:v7];

  return v10;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[NSError errorWithDomain:@"com.apple.Maps.externaldevice" code:a3 userInfo:a4];
}

+ (id)_localizedReasonForHandoffError:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      BOOL v3 = +[NSBundle mainBundle];
      unsigned __int8 v4 = v3;
      CFStringRef v5 = @"Destination hand-off is not enabled [CarPlay]";
      goto LABEL_7;
    case 2:
      BOOL v3 = +[NSBundle mainBundle];
      unsigned __int8 v4 = v3;
      CFStringRef v5 = @"No usable map item provided";
      goto LABEL_7;
    case 3:
      BOOL v3 = +[NSBundle mainBundle];
      unsigned __int8 v4 = v3;
      CFStringRef v5 = @"Car did not accept destination hand-off";
      goto LABEL_7;
    case 4:
      BOOL v3 = +[NSBundle mainBundle];
      unsigned __int8 v4 = v3;
      CFStringRef v5 = @"Destination hand-off timed out [CarPlay]";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (id)_stringRepresentationOfDictionary:(id)a3
{
  id v3 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100677284;
  v7[3] = &unk_1012F3C58;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  CFStringRef v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = IOHIDEventGetType();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "event=%d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006774D8;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&buf);
}

- (void)startMonitoringIOHIDRepeatCurrentGuidance
{
  if (![(MapsExternalDevice *)self monitoringIOHID])
  {
    id v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_client = v3;
    if (v3)
    {
      *(_OWORD *)keys = *(_OWORD *)off_1012F3C78;
      int v5 = 1;
      int valuePtr = 12;
      values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      CFTypeRef cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v5);
      CFDictionaryRef v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFRelease(values);
      CFRelease(cf);
      IOHIDEventSystemClientSetMatching();
      CFRelease(v4);
      CFRunLoopGetMain();
      IOHIDEventSystemClientScheduleWithRunLoop();
      IOHIDEventSystemClientRegisterEventCallback();
      [(MapsExternalDevice *)self setMonitoringIOHID:1];
    }
  }
}

- (void)stopMonitoringIOHIDRepeatCurrentGuidance
{
  if (self->_client)
  {
    CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    IOHIDEventSystemClientUnregisterEventCallback();
    CFRelease(self->_client);
    self->_client = 0;
  }

  [(MapsExternalDevice *)self setMonitoringIOHID:0];
}

- (void)setRouteGuidanceBeingShownInApp:(BOOL)a3
{
  BOOL v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFDictionaryRef v4 = [(MapsExternalDevice *)self navigationAccessories];
  int v5 = [v4 objectEnumerator];

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v9);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = [v10 objectEnumerator];
        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v17;
          do
          {
            long long v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setRouteGuidanceBeingShownInApp:v3];
              long long v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v13);
        }

        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)navigation:(id)a3 accessoryAttached:(id)a4
{
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "accessory=%@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(MapsExternalDevice *)self navigationAccessories];
  uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
  [v7 setObject:v8 forKey:v5];
}

- (void)navigation:(id)a3 accessoryDetached:(id)a4
{
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "accessory=%@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(MapsExternalDevice *)self navigationAccessories];
  [v7 removeObjectForKey:v5];
}

- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 138412546;
    id v43 = v7;
    __int16 v44 = 2112;
    id v45 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "StartRouteGuidance accessory=%@ components=%@", buf, 0x16u);
  }

  id v10 = [(MapsExternalDevice *)self navigationAccessories];
  uint64_t v11 = [v10 objectForKey:v7];

  v29 = (void *)v11;
  if (!v11)
  {
    uint64_t v12 = +[NSMapTable strongToStrongObjectsMapTable];
    id v13 = [(MapsExternalDevice *)self navigationAccessories];
    v29 = (void *)v12;
    [v13 setObject:v12 forKey:v7];
  }
  +[MNNavigationService sharedService];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100677E44;
  v38[3] = &unk_1012F3C90;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = v14;
  long long v15 = objc_retainBlock(v38);
  if (v8)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v8;
    id v16 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v16)
    {
      id v17 = v16;
      id v27 = v8;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v21 = v7;
          long long v22 = [[CarClusterNavigationController alloc] initWithAccessory:v7 component:v20];
          [v29 setObject:v22 forKey:v20];
          if ([v14 isInNavigatingState]) {
            ((void (*)(void *, CarClusterNavigationController *))v15[2])(v15, v22);
          }

          id v7 = v21;
        }
        id v17 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v17);
      id v8 = v27;
    }
LABEL_24:

    goto LABEL_25;
  }
  if ([v14 isInNavigatingState])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [v29 objectEnumerator];
    id v23 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(obj);
          }
          ((void (*)(void *, void))v15[2])(v15, *(void *)(*((void *)&v34 + 1) + 8 * (void)j));
        }
        id v24 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v24);
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "StopRouteGuidance accessory=%@ components=%@", buf, 0x16u);
  }

  id v10 = [(MapsExternalDevice *)self navigationAccessories];
  uint64_t v11 = [v10 objectForKey:v7];

  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [v11 removeObjectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) v17];
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
  else
  {
    [v11 removeAllObjects];
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    uint64_t v5 = [(MapsExternalDevice *)self currentState];
  }
  else
  {
    if (!objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
    {
      v7.receiver = self;
      v7.super_class = (Class)MapsExternalDevice;
      [(MapsExternalDevice *)&v7 forwardInvocation:v4];
      goto LABEL_7;
    }
    uint64_t v5 = +[MapsExternalAccessory sharedInstance];
  }
  id v6 = (void *)v5;
  [v4 invokeWithTarget:v5];

LABEL_7:
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsExternalDevice;
  id v4 = -[MapsExternalDevice methodSignatureForSelector:](&v6, "methodSignatureForSelector:");
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    if (!v4)
    {
      id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    }
  }

  return v4;
}

- (BOOL)carPlayIsNavigating
{
  return self->_carPlayIsNavigating;
}

- (NSString)externalDeviceDescription
{
  return self->_externalDeviceDescription;
}

- (MapsExternalDeviceState)currentState
{
  return self->_currentState;
}

- (MapsExternalDeviceState)lastPostedState
{
  return (MapsExternalDeviceState *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastPostedState:(id)a3
{
}

- (id)screenBorrowToken
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setScreenBorrowToken:(id)a3
{
}

- (BOOL)monitoringIOHID
{
  return self->_monitoringIOHID;
}

- (void)setMonitoringIOHID:(BOOL)a3
{
  self->_monitoringIOHID = a3;
}

- (ACCNavigationProvider)navigationProvider
{
  return (ACCNavigationProvider *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNavigationProvider:(id)a3
{
}

- (CarMetadataConnectionManager)metadataManager
{
  return self->_metadataManager;
}

- (void)setMetadataManager:(id)a3
{
}

- (NSMapTable)navigationAccessories
{
  return (NSMapTable *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNavigationAccessories:(id)a3
{
}

- (CARNavigationOwnershipManager)navigationOwnershipManager
{
  return self->_navigationOwnershipManager;
}

- (void)setNavigationOwnershipManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationOwnershipManager, 0);
  objc_storeStrong((id *)&self->_navigationAccessories, 0);
  objc_storeStrong((id *)&self->_metadataManager, 0);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong(&self->_screenBorrowToken, 0);
  objc_storeStrong((id *)&self->_lastPostedState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_externalDeviceDescription, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_screenOwnershipCheckTimer, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);

  objc_storeStrong((id *)&self->_notificationObservers, 0);
}

@end