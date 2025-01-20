@interface CARDNDManager
+ (id)sharedManager;
+ (void)setupSharedManagerWithVehicleStore:(id)a3 sessionStatus:(id)a4;
- (BMStream)drivingStream;
- (BOOL)_hasDrivingActivityMode;
- (BOOL)activatedByUserAction;
- (BOOL)isCurrentlyInGeofencedRegion;
- (BOOL)isDNDValid;
- (BOOL)showsInternalAlerts;
- (BPSSink)biomeDrivingSink;
- (CARAutomaticDNDStatus)preferences;
- (CARDNDAssertionTrap)assertionTrap;
- (CARDNDGeofencingObserver)geofencingObserver;
- (CARDNDManager)initWithVehicleState:(id)a3 alertManager:(id)a4 preferences:(id)a5 carSessionStatus:(id)a6 geoFencingObserver:(id)a7 assertionTrap:(id)a8 vehicleStore:(id)a9 stateService:(id)a10 modeConfigurationService:(id)a11 drivingStream:(id)a12;
- (CARDNDStateObserver)stateMachine;
- (CARSessionStatus)sessionStatus;
- (CARUserAlerts)alertManager;
- (CRVehicleStore)vehicleStore;
- (DNDModeConfigurationService)dndModeService;
- (DNDStateService)dndStateService;
- (NSTimer)userDisableTimer;
- (OS_dispatch_queue)CARDNDQueue;
- (OS_os_transaction)idleExitTransaction;
- (double)lastKnownReportTime;
- (id)_internalText;
- (unint64_t)lastKnownVehicularHints;
- (unint64_t)lastKnownVehicularState;
- (void)_beginIdleExitTransaction;
- (void)_cancelUserDisabledTimer;
- (void)_checkVehicleState;
- (void)_createDrivingActivityModeIfNeeded:(BOOL)a3;
- (void)_disableDNDUntilEndOfDrive;
- (void)_drivingModeChanged:(id)a3;
- (void)_drivingModeEnded;
- (void)_drivingModeStartedWithStartingGeofence:(BOOL)a3;
- (void)_endIdleExitTransaction;
- (void)_migrateToDrivingActivityModeIfNeeded;
- (void)_processVehicleState:(id)a3;
- (void)_scheduleUserDisabledTimerWithInterval:(double)a3;
- (void)_scheduleVehicleQuery;
- (void)_setDNDActive:(BOOL)a3 trigger:(int)a4 completion:(id)a5;
- (void)_setDNDActive:(BOOL)a3 trigger:(int)a4 withStartingGeofence:(BOOL)a5 completion:(id)a6;
- (void)_transitionToState:(unint64_t)a3 vehicularHints:(unint64_t)a4 operatorState:(unint64_t)a5;
- (void)_userDisabledTimerFired:(id)a3;
- (void)assertionTrap:(id)a3 didBecomeActive:(BOOL)a4;
- (void)dealloc;
- (void)geofencingObserver:(id)a3 didUpdateRegionState:(int64_t)a4;
- (void)modeAssertionService:(id)a3 didReceiveModeAssertionInvalidation:(id)a4;
- (void)sendDrivingModeEventWithReason:(int)a3 isStart:(BOOL)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setActivatedByUserAction:(BOOL)a3;
- (void)setAlertManager:(id)a3;
- (void)setAssertionTrap:(id)a3;
- (void)setBiomeDrivingSink:(id)a3;
- (void)setCARDNDQueue:(id)a3;
- (void)setDndModeService:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setDrivingStream:(id)a3;
- (void)setGeofencingObserver:(id)a3;
- (void)setIdleExitTransaction:(id)a3;
- (void)setLastKnownReportTime:(double)a3;
- (void)setLastKnownVehicularHints:(unint64_t)a3;
- (void)setLastKnownVehicularState:(unint64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setUserDisableTimer:(id)a3;
- (void)stateMachine:(id)a3 receivedAirplaneMode:(BOOL)a4;
- (void)stateMachine:(id)a3 receivedFMDMode:(BOOL)a4;
- (void)stateMachine:(id)a3 receivedVehicleState:(id)a4;
@end

@implementation CARDNDManager

+ (void)setupSharedManagerWithVehicleStore:(id)a3 sessionStatus:(id)a4
{
  id v22 = a4;
  id v21 = a3;
  id v23 = objc_alloc_init((Class)CARAutomaticDNDStatus);
  v6 = [CARDNDStateObserver alloc];
  id v7 = objc_alloc_init((Class)RadiosPreferences);
  v8 = [(CARDNDStateObserver *)v6 initWithRadiosPreferences:v7 vehicleStateClass:objc_opt_class()];

  id v9 = objc_alloc((Class)a1);
  v20 = objc_alloc_init(CARUserAlerts);
  v10 = [[CARDNDAssertionTrap alloc] initWithPreferences:v23];
  v11 = +[DNDStateService serviceForClientIdentifier:@"com.apple.carkitd.assertion-service"];
  v12 = +[DNDModeConfigurationService serviceForClientIdentifier:@"com.apple.carkitd.assertion-service"];
  v13 = BiomeLibrary();
  v14 = [v13 UserFocus];
  v15 = [v14 DoNotDisturbWhileDriving];
  v16 = v9;
  v17 = v10;
  id v18 = [v16 initWithVehicleState:v8 alertManager:v20 preferences:v23 carSessionStatus:v22 geoFencingObserver:0 assertionTrap:v10 vehicleStore:v21 stateService:v11 modeConfigurationService:v12 drivingStream:v15];

  v19 = (void *)qword_1000E38F8;
  qword_1000E38F8 = (uint64_t)v18;
}

+ (id)sharedManager
{
  return (id)qword_1000E38F8;
}

- (CARDNDManager)initWithVehicleState:(id)a3 alertManager:(id)a4 preferences:(id)a5 carSessionStatus:(id)a6 geoFencingObserver:(id)a7 assertionTrap:(id)a8 vehicleStore:(id)a9 stateService:(id)a10 modeConfigurationService:(id)a11 drivingStream:(id)a12
{
  id obj = a3;
  id v54 = a3;
  id v53 = a4;
  id v55 = a5;
  id v52 = a6;
  id v51 = a7;
  id v50 = a8;
  id v49 = a9;
  id v48 = a10;
  id v47 = a11;
  id v46 = a12;
  v58.receiver = self;
  v58.super_class = (Class)CARDNDManager;
  id v18 = [(CARDNDManager *)&v58 init];
  if (v18)
  {
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.carkit.driving", 0);
    CARDNDQueue = v18->_CARDNDQueue;
    v18->_CARDNDQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_dndStateService, a10);
    objc_storeStrong((id *)&v18->_dndModeService, a11);
    objc_storeStrong((id *)&v18->_drivingStream, a12);
    p_stateMachine = (id *)&v18->_stateMachine;
    objc_storeStrong((id *)&v18->_stateMachine, obj);
    [(CARDNDStateObserver *)v18->_stateMachine setDelegate:v18];
    objc_storeStrong((id *)&v18->_preferences, a5);
    objc_storeStrong((id *)&v18->_alertManager, a4);
    v18->_lastKnownVehicularState = 0;
    v18->_lastKnownVehicularHints = 0;
    objc_storeStrong((id *)&v18->_sessionStatus, a6);
    [(CARSessionStatus *)v18->_sessionStatus addSessionObserver:v18];
    objc_storeStrong((id *)&v18->_geofencingObserver, a7);
    [(CARDNDGeofencingObserver *)v18->_geofencingObserver setDelegate:v18];
    objc_storeStrong((id *)&v18->_assertionTrap, a8);
    [(CARDNDAssertionTrap *)v18->_assertionTrap setDelegate:v18];
    objc_storeStrong((id *)&v18->_vehicleStore, a9);
    v18->_expectedDNDTermination = 0;
    v18->_vehicleQueryInitiatedTimestamp = 0.0;
    [v55 _detachObservers];
    id v22 = [objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.focus.driving" targetQueue:v18->_CARDNDQueue];
    id v23 = BiomeLibrary();
    v24 = [v23 UserFocus];
    v25 = [v24 ComputedMode];

    v26 = [v25 DSLPublisher];
    v27 = [v26 filterWithKeyPath:@"eventBody.semanticType" value:&off_1000C66D0];

    v28 = [v27 subscribeOn:v22];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100057EEC;
    v56[3] = &unk_1000BF3D8;
    v29 = v18;
    v57 = v29;
    uint64_t v30 = [v28 sinkWithCompletion:&stru_1000BF3B0 receiveInput:v56];
    biomeDrivingSink = v29->_biomeDrivingSink;
    v29->_biomeDrivingSink = (BPSSink *)v30;

    v32 = [(CARDNDManager *)v29 assertionTrap];
    LODWORD(v24) = [v32 isActive];

    if (!v24) {
      goto LABEL_15;
    }
    v33 = [(CARDNDManager *)v29 assertionTrap];
    if ([v33 hasAssertion:4])
    {
      unsigned __int8 v34 = [*p_stateMachine isInAirplaneMode];

      if (v34)
      {
LABEL_7:
        v35 = [(CARDNDManager *)v29 assertionTrap];
        unsigned int v36 = [v35 hasAssertion:1];

        if (v36)
        {
          v37 = [(CARDNDManager *)v29 assertionTrap];
          [v37 releaseAssertion:1];
        }
        v38 = [(CARDNDManager *)v29 assertionTrap];
        unsigned int v39 = [v38 hasAssertion:16];

        if (v39)
        {
          v40 = [(CARDNDManager *)v29 assertionTrap];
          [v40 releaseAssertion:16];
        }
        v41 = [(CARDNDManager *)v29 assertionTrap];
        if (![v41 hasAssertion:32]) {
          goto LABEL_14;
        }
        unsigned __int8 v42 = [*p_stateMachine isInLostMode];

        if ((v42 & 1) == 0)
        {
          v41 = [(CARDNDManager *)v29 assertionTrap];
          [v41 releaseAssertion:32];
LABEL_14:
        }
LABEL_15:
        [(CARDNDManager *)v29 _migrateToDrivingActivityModeIfNeeded];
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDExitConfirmationDisabledNotification, 0, 0, 1u);

        goto LABEL_16;
      }
      v33 = [(CARDNDManager *)v29 assertionTrap];
      [v33 releaseAssertion:4];
    }

    goto LABEL_7;
  }
LABEL_16:

  return v18;
}

- (void)dealloc
{
  [(BPSSink *)self->_biomeDrivingSink cancel];
  v3.receiver = self;
  v3.super_class = (Class)CARDNDManager;
  [(CARDNDManager *)&v3 dealloc];
}

- (BOOL)showsInternalAlerts
{
  int v3 = CRIsInternalInstall();
  if (v3)
  {
    v4 = [(CARDNDManager *)self preferences];
    unsigned __int8 v5 = [v4 isAutomaticDNDInternalShowUserAlertsEnabledPreference];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CARDNDGeofencingObserver)geofencingObserver
{
  geofencingObserver = self->_geofencingObserver;
  if (!geofencingObserver)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100058158;
    block[3] = &unk_1000BD1B0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    geofencingObserver = self->_geofencingObserver;
  }

  return geofencingObserver;
}

- (void)sessionDidConnect:(id)a3
{
  v4 = [(CARDNDManager *)self CARDNDQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058234;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  v4 = [(CARDNDManager *)self preferences];
  unsigned int v5 = [v4 shouldActivateWithCarPlay];

  v6 = [(CARDNDManager *)self preferences];
  id v7 = [v6 automaticDNDTriggeringMethod];

  v8 = [(CARDNDManager *)self assertionTrap];
  [v8 releaseAssertion:1];

  if (!v5 || v7 != (id)2)
  {
    v15 = CarDNDWDLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CarPlay session ended; disabling Driving",
        buf,
        2u);
    }

    v16 = +[CARAnalytics sharedInstance];
    [v16 DNDEndedWithTrigger:3 vehicleHints:-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints") context:0];

    v12 = [(CARDNDManager *)self CARDNDQueue];
    v13 = v12;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000586AC;
    v18[3] = &unk_1000BD1B0;
    v18[4] = self;
    v14 = v18;
    goto LABEL_10;
  }
  unint64_t v9 = [(CARDNDManager *)self lastKnownVehicularState];
  if (v9 < 2)
  {
    v10 = CarDNDWDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CarPlay session ended; disabling Driving due to non-vehicular state",
        buf,
        2u);
    }

    v11 = +[CARAnalytics sharedInstance];
    [v11 DNDEndedWithTrigger:3 vehicleHints:-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints") context:0];

    v12 = [(CARDNDManager *)self CARDNDQueue];
    v13 = v12;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100058698;
    v19[3] = &unk_1000BD1B0;
    v19[4] = self;
    v14 = v19;
LABEL_10:
    dispatch_async(v12, v14);

    return;
  }
  if (v9 == 2)
  {
    v17 = CarDNDWDLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CarPlay session ended; leaving Driving active for auto-termination.",
        buf,
        2u);
    }
  }
}

- (BOOL)isDNDValid
{
  dndStateService = self->_dndStateService;
  id v9 = 0;
  int v3 = [(DNDStateService *)dndStateService queryCurrentStateWithError:&v9];
  id v4 = v9;
  if (v4)
  {
    unsigned int v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100075834();
    }
  }
  if ([v3 isActive])
  {
    v6 = [v3 activeModeIdentifier];
    unsigned __int8 v7 = [v6 isEqualToString:@"com.apple.donotdisturb.mode.driving"];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isCurrentlyInGeofencedRegion
{
  v2 = [(CARDNDManager *)self geofencingObserver];
  unsigned __int8 v3 = [v2 currentlyInRegion];

  return v3;
}

- (void)stateMachine:(id)a3 receivedVehicleState:(id)a4
{
  id v5 = a4;
  v6 = [(CARDNDManager *)self CARDNDQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058870;
  v8[3] = &unk_1000BD3A8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)stateMachine:(id)a3 receivedAirplaneMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(CARDNDManager *)self assertionTrap];
  id v6 = v5;
  if (v4) {
    [v5 takeAssertion:4];
  }
  else {
    [v5 releaseAssertion:4];
  }
}

- (void)stateMachine:(id)a3 receivedFMDMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(CARDNDManager *)self assertionTrap];
  id v6 = v5;
  if (v4) {
    [v5 takeAssertion:32];
  }
  else {
    [v5 releaseAssertion:32];
  }
}

- (void)geofencingObserver:(id)a3 didUpdateRegionState:(int64_t)a4
{
  if ([(CARDNDManager *)self showsInternalAlerts])
  {
    id v6 = [(CARDNDManager *)self preferences];
    unsigned int v7 = [v6 isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference];

    if (v7)
    {
      if (a4 == 2)
      {
        id v8 = [(CARDNDManager *)self alertManager];
        [v8 showDNDExitGeofenceWithCompletion:0];
      }
      else
      {
        if (a4 != 1) {
          return;
        }
        id v8 = [(CARDNDManager *)self alertManager];
        [v8 showDNDEnterGeofenceWithCompletion:0];
      }
    }
  }
}

- (void)assertionTrap:(id)a3 didBecomeActive:(BOOL)a4
{
  id v6 = a3;
  unsigned int v7 = [(CARDNDManager *)self CARDNDQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058AB8;
  block[3] = &unk_1000BF400;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_setDNDActive:(BOOL)a3 trigger:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v8 = a5;
  unint64_t v9 = ([(CARDNDManager *)self lastKnownVehicularHints] >> 4) & 1;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100058D5C;
  v11[3] = &unk_1000BF428;
  BOOL v15 = v6;
  objc_copyWeak(&v13, &location);
  int v14 = v5;
  id v10 = v8;
  id v12 = v10;
  [(CARDNDManager *)self _setDNDActive:v6 trigger:v5 withStartingGeofence:v9 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_setDNDActive:(BOOL)a3 trigger:(int)a4 withStartingGeofence:(BOOL)a5 completion:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  unint64_t v9 = (void (**)(id, uint64_t))a6;
  unsigned int v10 = [(CARDNDManager *)self isDNDValid];
  unsigned int v11 = v10;
  if (v7)
  {
    id v12 = CarDNDWDLogging();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requested to enable Driving, but it's already active.", buf, 2u);
      }

      if (v9) {
        v9[2](v9, 1);
      }
      goto LABEL_18;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Engaging Driving.", buf, 2u);
    }

    self->_expectedDNDTermination = 0;
    self->_lastKnownVehicularState = 2;
    v17 = [(CARDNDManager *)self assertionTrap];
    [v17 releaseAllTemporaryAssertions];

    [(CARDNDManager *)self setLastKnownReportTime:0.0];
    id v18 = +[CARAnalytics sharedInstance];
    [v18 DNDStartedWithTrigger:v6 vehicleHints:-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints")];

    [(CARDNDManager *)self sendDrivingModeEventWithReason:v6 isStart:1];
    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000590E8;
      block[3] = &unk_1000BD640;
      id v22 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v16 = v22;
      goto LABEL_17;
    }
  }
  else
  {
    if ((v10 & 1) == 0)
    {
      int v14 = CarDNDWDLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Requested to disable Driving, but it wasn't active.", buf, 2u);
      }
    }
    self->_expectedDNDTermination = 1;
    self->_activatedByUserAction = 0;
    BOOL v15 = +[CARAnalytics sharedInstance];
    [v15 DNDEndedWithTrigger:v6 vehicleHints:-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints") context:0];

    [(CARDNDManager *)self sendDrivingModeEventWithReason:v6 isStart:0];
    if (v9)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000590FC;
      v19[3] = &unk_1000BD640;
      v20 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);
      v16 = v20;
LABEL_17:
    }
  }
LABEL_18:
}

- (void)_checkVehicleState
{
  id v2 = [(CARDNDManager *)self stateMachine];
  [v2 _checkVehicleState];
}

- (void)_transitionToState:(unint64_t)a3 vehicularHints:(unint64_t)a4 operatorState:(unint64_t)a5
{
  unint64_t v9 = [(CARDNDManager *)self preferences];
  id v10 = [v9 automaticDNDTriggeringMethod];
  if (a3 == 2)
  {
    unsigned int v11 = CarDNDWDLogging();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v12 = "Evaluating transition to Vehicular state.";
  }
  else if (a3 == 1)
  {
    unsigned int v11 = CarDNDWDLogging();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v12 = "Evaluating transition to Non-vehicular state.";
  }
  else
  {
    unsigned int v11 = CarDNDWDLogging();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v12 = "Evaluating transition to Unknown state.";
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_10:

  if (v10 == (id)2)
  {
    BOOL v13 = CarDNDWDLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v14 = "Automatic trigger mode.";
      goto LABEL_19;
    }
  }
  else if (v10 == (id)1)
  {
    BOOL v13 = CarDNDWDLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v14 = "BT trigger mode.";
      goto LABEL_19;
    }
  }
  else
  {
    if (v10) {
      goto LABEL_21;
    }
    BOOL v13 = CarDNDWDLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v14 = "Manual trigger mode.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }

LABEL_21:
  if (CRIsInternalInstall())
  {
    BOOL v15 = [(CARDNDManager *)self preferences];
    unsigned int v16 = [v15 isAutomaticDNDInternalForceOverrideEnabledPreference];
  }
  else
  {
    unsigned int v16 = 0;
  }
  v17 = [(CARDNDManager *)self preferences];
  if ([v17 shouldActivateWithCarPlay])
  {
    id v18 = [(CARDNDManager *)self sessionStatus];
    dispatch_queue_t v19 = [v18 currentSession];
    BOOL v20 = v19 != 0;
  }
  else
  {
    BOOL v20 = 0;
  }

  if (a5 == 1)
  {
    id v21 = CarDNDWDLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "User is not operating.", buf, 2u);
    }
    int v22 = 1;
  }
  else
  {
    if (a3 == 1)
    {
      int v22 = 1;
      goto LABEL_44;
    }
    id v21 = [(CARDNDManager *)self preferences];
    id v24 = [v21 automaticDNDTriggeringMethod];
    int v22 = 0;
    if ((a4 & 0x10) == 0 && v24 == (id)1) {
      int v22 = (LOBYTE(self->_lastKnownVehicularHints) >> 4) & 1;
    }
  }

  if (v16)
  {
    unsigned int v16 = 1;
  }
  else if (a3 == 2)
  {
    id v23 = [(CARDNDManager *)self preferences];
    if ([v23 automaticDNDTriggeringMethod] == (id)1) {
      unsigned int v16 = (a4 >> 4) & 1;
    }
    else {
      unsigned int v16 = 1;
    }
  }
  else
  {
    unsigned int v16 = 0;
  }
LABEL_44:
  v25 = [(CARDNDManager *)self assertionTrap];
  unsigned int v26 = [v25 isActive];

  self->_lastKnownVehicularState = a3;
  self->_lastKnownVehicularHints = a4;
  self->_vehicleQueryInitiatedTimestamp = 0.0;
  if (v22)
  {
    if (v20)
    {
      v27 = CarDNDWDLogging();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Ignoring non-vehicular report in CarPlay mode.", buf, 2u);
      }
LABEL_48:

      return;
    }
    objc_initWeak((id *)buf, self);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000596F8;
    v34[3] = &unk_1000BF450;
    objc_copyWeak(&v35, (id *)buf);
    [(CARDNDManager *)self _setDNDActive:0 trigger:2 completion:v34];
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  else if (v16)
  {
    if (v26)
    {
      v28 = CarDNDWDLogging();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(CARDNDManager *)self assertionTrap];
        uint64_t v30 = [v29 activeAssertionsDebugString];
        *(_DWORD *)buf = 138543362;
        v37 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not engaging Driving due to active assertions: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v31 = [(CARDNDManager *)self preferences];
      if ([v31 automaticDNDTriggeringMethod])
      {
      }
      else
      {
        unsigned int v32 = [(CARDNDManager *)self _hasDrivingActivityMode];

        if (v32)
        {
          v27 = CarDNDWDLogging();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Driving Focus is available, but trigger is manual. Ignoring.", buf, 2u);
          }
          goto LABEL_48;
        }
      }
      v33 = +[CARAnalytics sharedInstance];
      [v33 DNDStartedWithTrigger:2 vehicleHints:-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints")];

      [(CARDNDManager *)self _setDNDActive:1 trigger:2 completion:0];
    }
  }
}

- (id)_internalText
{
  if (![(CARDNDManager *)self showsInternalAlerts])
  {
    uint64_t v6 = 0;
    goto LABEL_24;
  }
  if (qword_1000E3908 != -1) {
    dispatch_once(&qword_1000E3908, &stru_1000BF4B0);
  }
  unsigned __int8 v3 = (void *)qword_1000E3900;
  BOOL v4 = +[NSDate date];
  uint64_t v5 = [v3 stringFromDate:v4];

  uint64_t v6 = +[NSString stringWithFormat:@"[Internal] %@", v5];

  if ([(CARDNDManager *)self isDNDValid])
  {
    unint64_t v7 = [(CARDNDManager *)self lastKnownVehicularHints];
    if (!v7)
    {
      unsigned int v11 = @"None";
LABEL_23:
      uint64_t v12 = [v6 stringByAppendingFormat:@" Reason: %@", v11];

      uint64_t v6 = (void *)v12;
      goto LABEL_24;
    }
    char v8 = v7;
    unint64_t v9 = +[NSMutableArray array];
    id v10 = v9;
    if (v8)
    {
      [v9 addObject:@"Motion"];
      if ((v8 & 2) == 0)
      {
LABEL_8:
        if ((v8 & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_18;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_8;
    }
    [v10 addObject:@"GPS"];
    if ((v8 & 4) == 0)
    {
LABEL_9:
      if ((v8 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
LABEL_18:
    [v10 addObject:@"Baseband"];
    if ((v8 & 8) == 0)
    {
LABEL_10:
      if ((v8 & 0x10) == 0)
      {
LABEL_12:
        if ([v10 count])
        {
          unsigned int v11 = [v10 componentsJoinedByString:@";"];
        }
        else
        {
          unsigned int v11 = @"None";
        }

        goto LABEL_23;
      }
LABEL_11:
      [v10 addObject:@"Bluetooth"];
      goto LABEL_12;
    }
LABEL_19:
    [v10 addObject:@"Wi-Fi"];
    if ((v8 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_24:

  return v6;
}

- (void)_scheduleVehicleQuery
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_vehicleQueryInitiatedTimestamp = v3;
  id v4 = [(CARDNDManager *)self stateMachine];
  [v4 scheduleVehicleStateCheckWithDelay:30.0];
}

- (void)_drivingModeStartedWithStartingGeofence:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Driving mode started.", v10, 2u);
  }

  [(CARDNDManager *)self _beginIdleExitTransaction];
  uint64_t v6 = [(CARDNDManager *)self geofencingObserver];
  [v6 setDNDActive:1];

  unint64_t v7 = [(CARDNDManager *)self geofencingObserver];
  [v7 beginMonitoringLOIsWithStartingLocationGeofence:v3];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDStatusChangedNotification, 0, 0, 1u);
  unint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v9, CARAutomaticDNDEnabledNotification, 0, 0, 1u);
}

- (void)_drivingModeEnded
{
  BOOL v3 = CarDNDWDLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up Driving state.", v8, 2u);
  }

  [(CARDNDManager *)self _endIdleExitTransaction];
  id v4 = [(CARDNDManager *)self geofencingObserver];
  [v4 setDNDActive:0];

  uint64_t v5 = [(CARDNDManager *)self geofencingObserver];
  [v5 stopMonitoringLOIs];

  [(CARDNDManager *)self setLastKnownVehicularState:1];
  [(CARDNDManager *)self setLastKnownVehicularHints:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDStatusChangedNotification, 0, 0, 1u);
  unint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v7, CARAutomaticDNDDisabledNotification, 0, 0, 1u);
}

- (void)_drivingModeChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 eventBody];
  unsigned int v6 = [v5 starting];

  unint64_t v7 = [v4 eventBody];
  unsigned int v8 = [v7 updateSource];

  unint64_t v9 = [v4 eventBody];
  unsigned int v10 = [v9 updateReason];

  unsigned int v11 = +[NSMutableString stringWithString:@"Driving "];
  CFStringRef v12 = @"ended";
  if (v6) {
    CFStringRef v12 = @"started";
  }
  BOOL v13 = +[NSString stringWithFormat:@"%@ externally", v12];
  [v11 appendString:v13];

  int v14 = [v4 eventBody];

  unsigned int v15 = [v14 updateSource];
  if (v15 - 1 > 2) {
    CFStringRef v16 = @" from an unknown source";
  }
  else {
    CFStringRef v16 = *(&off_1000BF4D0 + (int)(v15 - 1));
  }
  [v11 appendString:v16];
  v17 = CarDNDWDLogging();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v6)
  {
    id v18 = +[CARAnalytics sharedInstance];
    [v18 DNDStartedWithTrigger:1 vehicleHints:-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints")];

    dispatch_queue_t v19 = [(CARDNDManager *)self assertionTrap];
    [v19 releaseAllTemporaryAssertions];

    unint64_t v20 = ([(CARDNDManager *)self lastKnownVehicularHints] >> 4) & 1;
    self->_activatedByUserAction = v10 == 1;
    if (v8 == 2) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
    [(CARDNDManager *)self _drivingModeStartedWithStartingGeofence:v21];
  }
  else
  {
    if ([(CARDNDManager *)self showsInternalAlerts])
    {
      int v22 = [(CARDNDManager *)self assertionTrap];
      unsigned __int8 v23 = [v22 hasAssertion:2];

      if ((v23 & 1) == 0)
      {
        id v24 = [(CARDNDManager *)self alertManager];
        v25 = [(CARDNDManager *)self _internalText];
        [v24 showDNDEndNotificationWithText:v25 completion:0];
      }
    }
    if (v10 == 1)
    {
      if (v8 == 2)
      {
        unsigned int v26 = [(CARDNDManager *)self assertionTrap];
        [v26 takeAssertion:2];
      }
      else
      {
        [(CARDNDManager *)self _disableDNDUntilEndOfDrive];
      }
      v28 = +[CARAnalytics sharedInstance];
      unint64_t v29 = [(CARDNDManager *)self lastKnownVehicularHints];
      uint64_t v30 = v28;
      uint64_t v31 = 5;
    }
    else if (self->_expectedDNDTermination)
    {
      v27 = CarDNDWDLogging();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Expected Driving termination.", buf, 2u);
      }

      v28 = +[CARAnalytics sharedInstance];
      unint64_t v29 = [(CARDNDManager *)self lastKnownVehicularHints];
      uint64_t v30 = v28;
      uint64_t v31 = 4;
    }
    else
    {
      v28 = +[CARAnalytics sharedInstance];
      unint64_t v29 = [(CARDNDManager *)self lastKnownVehicularHints];
      uint64_t v30 = v28;
      uint64_t v31 = 6;
    }
    [v30 DNDEndedWithTrigger:v31 vehicleHints:v29 context:0];

    [(CARDNDManager *)self _drivingModeEnded];
  }
}

- (void)_disableDNDUntilEndOfDrive
{
  if ([(CARDNDManager *)self showsInternalAlerts])
  {
    BOOL v3 = [(CARDNDManager *)self alertManager];
    [v3 showDNDNotDrivingAlertWithCompletion:&stru_1000BF490];
  }
  unint64_t v4 = [(CARDNDManager *)self lastKnownVehicularState];
  uint64_t v5 = [(CARDNDManager *)self assertionTrap];
  id v7 = v5;
  if (v4 >= 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 8;
  }
  [v5 takeAssertion:v6];
}

- (BOOL)_hasDrivingActivityMode
{
  dndModeService = self->_dndModeService;
  id v11 = 0;
  BOOL v3 = [(DNDModeConfigurationService *)dndModeService modeConfigurationForModeIdentifier:@"com.apple.donotdisturb.mode.driving" error:&v11];
  id v4 = v11;
  if (v4)
  {
    uint64_t v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100075974();
    }
LABEL_4:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = CarDNDWDLogging();
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v7)
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No available driving mode.", v9, 2u);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User has configured a driving mode.", buf, 2u);
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)_migrateToDrivingActivityModeIfNeeded
{
  BOOL v3 = [(CARDNDManager *)self preferences];
  id v4 = [v3 automaticDNDTriggeringMethod];

  if (v4)
  {
    uint64_t v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      BOOL v6 = "Performing migration for DNDWD based on trigger mode.";
      BOOL v7 = (uint8_t *)&v15;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  unsigned int v8 = [(CARDNDManager *)self preferences];
  unsigned int v9 = [v8 hasAdjustedTriggerMethod];

  uint64_t v5 = CarDNDWDLogging();
  BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      BOOL v6 = "Performing migration for DNDWD based on previous trigger adjustment.";
      BOOL v7 = buf;
      goto LABEL_7;
    }
LABEL_8:

    id v11 = CarDNDWDLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Migrating to Driving activity mode.", v12, 2u);
    }

    [(CARDNDManager *)self _createDrivingActivityModeIfNeeded:0];
    return;
  }
  if (v10)
  {
    *(_WORD *)BOOL v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not performing Driving migration.", v13, 2u);
  }
}

- (void)_createDrivingActivityModeIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CARDNDManager *)self preferences];
  unsigned int v6 = [v5 hasMigratedToDriving];

  if (!v6 || v3)
  {
    if (v3)
    {
      unsigned int v9 = CarDNDWDLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating a Driving configuration from override.", buf, 2u);
      }
    }
    if (![(CARDNDManager *)self _hasDrivingActivityMode])
    {
      dndModeService = self->_dndModeService;
      id v21 = 0;
      BOOL v7 = [(DNDModeConfigurationService *)dndModeService createDefaultDrivingModeConfigurationWithError:&v21];
      id v11 = v21;
      if (v11)
      {
        CFStringRef v12 = v11;
        BOOL v13 = CarDNDWDLogging();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100075A44();
        }
      }
      else
      {
        int v14 = self->_dndModeService;
        id v20 = 0;
        unsigned int v15 = [(DNDModeConfigurationService *)v14 setModeConfiguration:v7 error:&v20];
        id v16 = v20;
        v17 = CarDNDWDLogging();
        id v18 = v17;
        if (!v15 || v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            sub_1000759DC();
          }

          goto LABEL_23;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Created driving activity mode.", buf, 2u);
        }

        CFStringRef v12 = [(CARDNDManager *)self preferences];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10005A74C;
        v19[3] = &unk_1000BD1B0;
        void v19[4] = self;
        [v12 _performCARPreferencesBlock:v19 forReading:0];
      }

      goto LABEL_23;
    }
    BOOL v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v8 = "Skipping driving migration; one already exists.";
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v8 = "Skipping driving migration; already migrated.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
LABEL_23:
}

- (void)sendDrivingModeEventWithReason:(int)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = +[NSNumber numberWithBool:v4];
    unsigned int v9 = +[NSNumber numberWithInt:v5];
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending Driving event with start %@ reason %@", (uint8_t *)&v15, 0x16u);
  }
  BOOL v10 = [(CARDNDManager *)self drivingStream];
  id v11 = [v10 source];
  id v12 = objc_alloc((Class)BMUserFocusDoNotDisturbWhileDriving);
  BOOL v13 = +[NSNumber numberWithBool:v4];
  id v14 = [v12 initWithStarting:v13 reason:v5];

  [v11 sendEvent:v14];
}

- (void)_processVehicleState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 vehicleState];
  id v6 = [v4 vehicularHints];
  id v7 = [v4 vehicleOperatorState];
  id v52 = [v4 deviceID];
  if (CRIsInternalInstall())
  {
    unsigned int v8 = [(CARDNDManager *)self preferences];
    unsigned int v9 = [v8 isAutomaticDNDInternalForceOverrideEnabledPreference];
  }
  else
  {
    unsigned int v9 = 0;
  }
  BOOL v10 = [(CARDNDManager *)self preferences];
  unsigned int v11 = [v10 shouldActivateWithCarPlay];

  if (v9)
  {
    id v12 = CarDNDWDLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Override is set; forcing vehicle state ON.",
        buf,
        2u);
    }

    uint64_t v5 = 2;
  }
  if (CRIsInternalInstall())
  {
    BOOL v13 = [(CARDNDManager *)self preferences];
    id v14 = [v13 isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference];
    int v15 = [(CARDNDManager *)self geofencingObserver];
    [v15 setExitConfirmationOverride:v14];
  }
  id v16 = [(CARDNDManager *)self preferences];
  if (![v16 automaticDNDTriggeringMethod]
    && self->_lastKnownVehicularState == 2
    && v5 == 2
    && (self->_lastKnownVehicularHints & 0x10) != 0)
  {

    if ((v6 & 0x10) == 0)
    {
      id v24 = CarDNDWDLogging();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping non-BT in-vehicle report received after BT in-vehicle report.", buf, 2u);
      }

      goto LABEL_90;
    }
  }
  else
  {
  }
  __int16 v17 = [(CARDNDManager *)self preferences];
  if ([v17 automaticDNDTriggeringMethod] == (id)1
    && (self->_lastKnownVehicularHints & 0x10) != 0
    && ([v4 vehicularHints] & 0x10) == 0)
  {
    BOOL v18 = self->_lastKnownVehicularState == 2;

    if (!v18) {
      goto LABEL_20;
    }
    __int16 v17 = CarDNDWDLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Interpreted as BT disconnect.", buf, 2u);
    }
    uint64_t v5 = 1;
  }

LABEL_20:
  if (v9)
  {
LABEL_21:
    [(CARDNDManager *)self _transitionToState:v5 vehicularHints:v6 operatorState:v7];
    goto LABEL_90;
  }
  if (self->_lastKnownVehicularState == v5 && self->_lastKnownVehicularHints == v6 && v5 != 1 && v7 != (id)1)
  {
    dispatch_queue_t v19 = CarDNDWDLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = +[NSNumber numberWithUnsignedInteger:self->_lastKnownVehicularState];
      if (v6)
      {
        id v21 = +[NSMutableArray array];
        int v22 = v21;
        if (v6) {
          [v21 addObject:@"Motion"];
        }
        if ((v6 & 2) != 0) {
          [v22 addObject:@"GPS"];
        }
        if ((v6 & 4) != 0) {
          [v22 addObject:@"Baseband"];
        }
        if ((v6 & 8) != 0) {
          [v22 addObject:@"Wi-Fi"];
        }
        if ((v6 & 0x10) != 0) {
          [v22 addObject:@"Bluetooth"];
        }
        if ([v22 count])
        {
          unsigned __int8 v23 = [v22 componentsJoinedByString:@";"];
        }
        else
        {
          unsigned __int8 v23 = @"None";
        }
      }
      else
      {
        unsigned __int8 v23 = @"None";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No change from vehicle state %@ with hints %@.", buf, 0x16u);
    }
    goto LABEL_90;
  }
  v25 = [(CARDNDManager *)self sessionStatus];
  unsigned int v26 = [v25 currentSession];
  if (v26) {
    char v27 = v11;
  }
  else {
    char v27 = 1;
  }

  if (v27)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v63 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005B2D0;
    block[3] = &unk_1000BD768;
    void block[4] = self;
    void block[5] = buf;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v28 = CarDNDWDLogging();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Ignoring vehicle state change because AirPlane mode is active.", v57, 2u);
      }

      self->_vehicleQueryInitiatedTimestamp = 0.0;
LABEL_55:
      _Block_object_dispose(buf, 8);
      goto LABEL_90;
    }
    if (self->_vehicleQueryInitiatedTimestamp <= 0.0)
    {
      BOOL v33 = 0;
    }
    else
    {
      uint64_t v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      uint64_t v31 = +[NSDate date];
      int64_t v32 = +[CARAnalytics calendarUnitsOfType:128 fromDate:v30 toDate:v31];

      BOOL v33 = v32 > 29;
    }
    BOOL v35 = v5 != 2 || v52 == 0;
    if ((v6 & 0x10) == 0) {
      BOOL v35 = 1;
    }
    if (((v35 | v33 | v11) & 1) == 0)
    {
      if ([v52 hasPrefix:@"CarKit"])
      {
        unsigned int v36 = CarDNDWDLogging();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Likely a CarPlay connection.", v57, 2u);
        }

        [(CARDNDManager *)self _scheduleVehicleQuery];
        goto LABEL_55;
      }
      *(void *)v57 = 0;
      objc_super v58 = v57;
      uint64_t v59 = 0x2020000000;
      char v60 = 0;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10005B32C;
      v54[3] = &unk_1000BD768;
      v56 = v57;
      id v37 = v52;
      id v55 = v37;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v54);

      if (v58[24])
      {
        v38 = [(CARDNDManager *)self vehicleStore];
        unsigned int v39 = [v38 vehicleForBluetoothAddress:v37];

        if (!v39 || [v39 pairingStatus] != (id)1)
        {
          id v50 = CarDNDWDLogging();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v53 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "CarPlay vehicle that isn't disabled.", v53, 2u);
          }

          [(CARDNDManager *)self _scheduleVehicleQuery];
          _Block_object_dispose(v57, 8);
          goto LABEL_55;
        }
      }
      _Block_object_dispose(v57, 8);
    }
    if ([(CARDNDManager *)self _hasDrivingActivityMode])
    {
      v40 = [(CARDNDManager *)self assertionTrap];
      unsigned int v41 = [v40 hasAssertion:2];

      if (v41)
      {
        unsigned __int8 v42 = CarDNDWDLogging();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Marking report while user disabled.", v57, 2u);
        }

        +[NSDate timeIntervalSinceReferenceDate];
        self->_lastKnownReportTime = v43;
        [(CARDNDManager *)self _scheduleUserDisabledTimerWithInterval:480.0];
        goto LABEL_55;
      }
      if (v5 == 2)
      {
        [(CARDNDManager *)self lastKnownReportTime];
        if (v44 > 0.0)
        {
          [(CARDNDManager *)self lastKnownReportTime];
          v45 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          id v46 = +[NSDate date];
          uint64_t v47 = +[CARAnalytics calendarUnitsOfType:64 fromDate:v45 toDate:v46];

          if (v47 <= 7)
          {
            id v51 = CarDNDWDLogging();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v57 = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Ignoring vehicular report - user disabled and still within delay window.", v57, 2u);
            }

            goto LABEL_55;
          }
          id v48 = CarDNDWDLogging();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v57 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Vehicular report occurred after jitter interval.", v57, 2u);
          }

          [(CARDNDManager *)self _cancelUserDisabledTimer];
          id v49 = [(CARDNDManager *)self assertionTrap];
          [v49 releaseAssertion:2];
        }
      }
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  unint64_t v29 = CarDNDWDLogging();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Ignoring vehicle state change because CarPlay session is active.", buf, 2u);
  }

  self->_vehicleQueryInitiatedTimestamp = 0.0;
LABEL_90:
}

- (void)_beginIdleExitTransaction
{
  BOOL v3 = [(CARDNDManager *)self idleExitTransaction];

  if (!v3)
  {
    id v4 = CarDNDWDLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning IE transaction.", v6, 2u);
    }

    uint64_t v5 = (void *)os_transaction_create();
    [(CARDNDManager *)self setIdleExitTransaction:v5];
  }
}

- (void)_endIdleExitTransaction
{
  BOOL v3 = [(CARDNDManager *)self idleExitTransaction];

  if (v3)
  {
    id v4 = CarDNDWDLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing IE transaction.", v5, 2u);
    }

    [(CARDNDManager *)self setIdleExitTransaction:0];
  }
}

- (void)_cancelUserDisabledTimer
{
  BOOL v3 = [(CARDNDManager *)self userDisableTimer];
  [v3 invalidate];

  [(CARDNDManager *)self setUserDisableTimer:0];
}

- (void)_scheduleUserDisabledTimerWithInterval:(double)a3
{
  [(CARDNDManager *)self _cancelUserDisabledTimer];
  uint64_t v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithDouble:a3];
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling user disabled timer after %@", (uint8_t *)&v11, 0xCu);
  }
  id v7 = +[NSTimer timerWithTimeInterval:self target:"_userDisabledTimerFired:" selector:0 userInfo:0 repeats:a3];
  userDisableTimer = self->_userDisableTimer;
  self->_userDisableTimer = v7;

  unsigned int v9 = +[NSRunLoop mainRunLoop];
  BOOL v10 = [(CARDNDManager *)self userDisableTimer];
  [v9 addTimer:v10 forMode:NSDefaultRunLoopMode];
}

- (void)_userDisabledTimerFired:(id)a3
{
  id v4 = CarDNDWDLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User disabled timer fired.", v6, 2u);
  }

  uint64_t v5 = [(CARDNDManager *)self assertionTrap];
  [v5 releaseAssertion:2];
}

- (void)modeAssertionService:(id)a3 didReceiveModeAssertionInvalidation:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B72C;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSTimer)userDisableTimer
{
  return self->_userDisableTimer;
}

- (void)setUserDisableTimer:(id)a3
{
}

- (OS_os_transaction)idleExitTransaction
{
  return self->_idleExitTransaction;
}

- (void)setIdleExitTransaction:(id)a3
{
}

- (BMStream)drivingStream
{
  return self->_drivingStream;
}

- (void)setDrivingStream:(id)a3
{
}

- (BPSSink)biomeDrivingSink
{
  return self->_biomeDrivingSink;
}

- (void)setBiomeDrivingSink:(id)a3
{
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
}

- (DNDModeConfigurationService)dndModeService
{
  return self->_dndModeService;
}

- (void)setDndModeService:(id)a3
{
}

- (CARDNDStateObserver)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (CARUserAlerts)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (CARAutomaticDNDStatus)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (CARDNDAssertionTrap)assertionTrap
{
  return self->_assertionTrap;
}

- (void)setAssertionTrap:(id)a3
{
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setGeofencingObserver:(id)a3
{
}

- (OS_dispatch_queue)CARDNDQueue
{
  return self->_CARDNDQueue;
}

- (void)setCARDNDQueue:(id)a3
{
}

- (BOOL)activatedByUserAction
{
  return self->_activatedByUserAction;
}

- (void)setActivatedByUserAction:(BOOL)a3
{
  self->_activatedByUserAction = a3;
}

- (unint64_t)lastKnownVehicularState
{
  return self->_lastKnownVehicularState;
}

- (void)setLastKnownVehicularState:(unint64_t)a3
{
  self->_lastKnownVehicularState = a3;
}

- (unint64_t)lastKnownVehicularHints
{
  return self->_lastKnownVehicularHints;
}

- (void)setLastKnownVehicularHints:(unint64_t)a3
{
  self->_lastKnownVehicularHints = a3;
}

- (double)lastKnownReportTime
{
  return self->_lastKnownReportTime;
}

- (void)setLastKnownReportTime:(double)a3
{
  self->_lastKnownReportTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CARDNDQueue, 0);
  objc_storeStrong((id *)&self->_geofencingObserver, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_assertionTrap, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_dndModeService, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_biomeDrivingSink, 0);
  objc_storeStrong((id *)&self->_drivingStream, 0);
  objc_storeStrong((id *)&self->_idleExitTransaction, 0);

  objc_storeStrong((id *)&self->_userDisableTimer, 0);
}

@end