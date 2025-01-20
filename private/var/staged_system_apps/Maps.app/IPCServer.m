@interface IPCServer
+ (id)sharedServer;
- (BOOL)_guidanceAffectsDimming;
- (BOOL)_isAnySceneForegroundAndNotOccludedForRole:(id)a3;
- (BOOL)_isInBackground;
- (BOOL)_isMapsForegroundOnCarPlay;
- (BOOL)_isMapsForegroundOnMainWindow;
- (BOOL)_isMapsForegroundOnlyOnHybridIC;
- (BOOL)_isSceneForeground:(id)a3;
- (BOOL)_isSceneOccluded:(id)a3;
- (BOOL)etaOnlyNavMode;
- (BOOL)needsGuidanceUpdate;
- (BOOL)routePreviewGuidanceNavMode;
- (BackgroundNavigationDelegate)backgroundNavigationDelegate;
- (ExternalGuidanceSource)externalGuidanceSource;
- (GEOTransitArtworkDataSource)artworkOverride;
- (GuidanceETA)_latestETA;
- (IPCServer)init;
- (MKJunction)junction;
- (MKServerFormattedString)distanceText;
- (NSArray)maneuverInstructions;
- (NSArray)secondaryManeuverInstructions;
- (NSDate)lastSceneDeactivationTime;
- (NSUUID)_maneuverID;
- (NSXPCListenerEndpoint)companionDaemonListenerEndpoint;
- (NSXPCListenerEndpoint)pushDaemonListenerEndpoint;
- (NSXPCListenerEndpoint)siriPluginListenerEndpoint;
- (NavSignLaneGuidanceInfo)laneGuidanceInfo;
- (NavSignShieldInfo)shieldInfo;
- (UNNotificationSettings)notificationSettings;
- (VirtualGarageSource)virtualGarageSource;
- (double)_distanceToManeuver;
- (double)_distanceToRoute;
- (double)_timeToManeuver;
- (id)_currentGuidanceStateMessageWithGuidanceCausedVibration:(BOOL)a3;
- (id)activeBannerViewController;
- (id)activeCarPlayBannerViewController;
- (id)loadDirectionsDelayedReply;
- (id)startNavigationDelayedReply;
- (int)_drivingSide;
- (int)_maneuver;
- (int)_transportType;
- (unint64_t)_maximumScenePollCount;
- (unint64_t)state;
- (void)_checkKeyOrApplicationScene;
- (void)_checkKeySceneInternal;
- (void)_invalidatedTrafficIncidentAlert:(id)a3;
- (void)_noteGuidanceStateChanged;
- (void)_postWeakLocationNotification;
- (void)_pushGuidanceState;
- (void)_pushGuidanceStateIfChangedWithVibration:(BOOL)a3;
- (void)_receivedTrafficIncidentAlert:(id)a3;
- (void)_removeTrafficIncidentAlertFromTimer:(id)a3;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillConnect;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_sendWeakLocationNotificationIfNeededWithGuidanceState:(id)a3;
- (void)_setTimeToManeuver:(double)a3 distanceToManeuver:(double)a4 forStep:(id)a5;
- (void)_showNoGuidance;
- (void)_startWaitingToHandleMessage:(id)a3;
- (void)_startWaitingToSendResponse;
- (void)_timedOutWaitingToSendResponse;
- (void)_updatedTrafficIncidentAlert:(id)a3;
- (void)_vibrateForRerouteWithService:(id)a3;
- (void)checkNotificationSettingsAndPerformBlock:(id)a3;
- (void)dealloc;
- (void)dismissNavigationSafetyAlertWithReply:(id)a3;
- (void)dismissTrafficIncidentAlert:(id)a3;
- (void)endNavigationWithReply:(id)a3;
- (void)getGuidanceState:(id)a3 reply:(id)a4;
- (void)handleTrafficeReroute:(id)a3 reply:(id)a4;
- (void)loadDirections:(id)a3 reply:(id)a4;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeGuidanceState:(id)a4;
- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationService:(id)a3 didFailWithError:(id)a4;
- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didProcessSpeechEvent:(id)a4;
- (void)navigationService:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4;
- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationService:(id)a3 didReceiveTransitAlert:(id)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didUpdateVehicleParkingInfo:(id)a4;
- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 willProcessSpeechEvent:(id)a4;
- (void)navigationServiceDidCancelReroute:(id)a3;
- (void)navigationServiceWillReroute:(id)a3;
- (void)navigationStateDidChangeTo:(unint64_t)a3 reason:(id)a4;
- (void)navigationStateDidChangeTo:(unint64_t)a3 reason:(id)a4 error:(id)a5;
- (void)repeatLastGuidanceInstructionWithReply:(id)a3;
- (void)repeatLastReroutePromptWithReply:(id)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setBackgroundNavigationDelegate:(id)a3;
- (void)setCompanionDaemonListenerEndpoint:(id)a3;
- (void)setDistanceText:(id)a3;
- (void)setETA:(id)a3;
- (void)setEtaOnlyNavMode:(BOOL)a3;
- (void)setExternalGuidanceSource:(id)a3;
- (void)setJunction:(id)a3;
- (void)setLaneGuidanceInfo:(id)a3;
- (void)setLastSceneDeactivationTime:(id)a3;
- (void)setLoadDirectionsDelayedReply:(id)a3;
- (void)setManeuverInstructions:(id)a3;
- (void)setNavigationMuted:(id)a3;
- (void)setNavigationVoiceVolume:(id)a3;
- (void)setNeedsGuidanceUpdate:(BOOL)a3;
- (void)setNeedsToDisplaySafetyWarning;
- (void)setNotificationSettings:(id)a3;
- (void)setPushDaemonListenerEndpoint:(id)a3;
- (void)setRoutePreviewGuidanceNavMode:(BOOL)a3;
- (void)setSecondaryManeuverInstructions:(id)a3;
- (void)setShieldInfo:(id)a3;
- (void)setSiriPluginListenerEndpoint:(id)a3;
- (void)setStartNavigationDelayedReply:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 withReason:(unint64_t)a4;
- (void)setVirtualGarageSource:(id)a3;
- (void)set_distanceToManeuver:(double)a3;
- (void)set_distanceToRoute:(double)a3;
- (void)set_drivingSide:(int)a3;
- (void)set_latestETA:(id)a3;
- (void)set_maneuver:(int)a3;
- (void)set_maneuverID:(id)a3;
- (void)set_timeToManeuver:(double)a3;
- (void)set_transportType:(int)a3;
- (void)showRecalculating;
- (void)startPreparedNavigation:(id)a3 reply:(id)a4;
@end

@implementation IPCServer

- (void)_sceneDidActivate:(id)a3
{
  v4 = [a3 object];
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC _sceneDidActivate: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)setSiriPluginListenerEndpoint:(id)a3
{
  uint64_t v5 = (NSXPCListenerEndpoint *)a3;
  if (+[NSThread isMainThread])
  {
    if (self->_siriPluginListenerEndpoint != v5)
    {
      sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Changing siriPluginListenerEndpoint from %@ to %@", v6, v7, v8, v9, v10, v11, (uint64_t)self->_siriPluginListenerEndpoint);
      objc_storeStrong((id *)&self->_siriPluginListenerEndpoint, a3);
      [(NSXPCConnection *)self->_siriPluginConnection setInvalidationHandler:0];
      [(NSXPCConnection *)self->_siriPluginConnection invalidate];
      siriPluginConnection = self->_siriPluginConnection;
      self->_siriPluginConnection = 0;

      if (v5)
      {
        v13 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
        v14 = self->_siriPluginConnection;
        self->_siriPluginConnection = v13;

        [(NSXPCConnection *)self->_siriPluginConnection setExportedObject:self];
        v15 = +[NSXPCInterface _maps_mapsSiriXPCInterface];
        [(NSXPCConnection *)self->_siriPluginConnection setExportedInterface:v15];

        v16 = +[NSXPCInterface _maps_mapsSiriXPCClientInterface];
        [(NSXPCConnection *)self->_siriPluginConnection setRemoteObjectInterface:v16];

        [(NSXPCConnection *)self->_siriPluginConnection _setQueue:&_dispatch_main_q];
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100460060;
        v18[3] = &unk_1012E6708;
        objc_copyWeak(&v19, &location);
        [(NSXPCConnection *)self->_siriPluginConnection setInvalidationHandler:v18];
        [(NSXPCConnection *)self->_siriPluginConnection setInterruptionHandler:&stru_1012EAF08];
        [(NSXPCConnection *)self->_siriPluginConnection resume];
        v17 = [(NSXPCConnection *)self->_siriPluginConnection remoteObjectProxy];
        [v17 establishConnection];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)setPushDaemonListenerEndpoint:(id)a3
{
  uint64_t v5 = (NSXPCListenerEndpoint *)a3;
  if (+[NSThread isMainThread])
  {
    if (self->_pushDaemonListenerEndpoint != v5)
    {
      sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Changing pushDaemonListenerEndpoint from %@ to %@", v6, v7, v8, v9, v10, v11, (uint64_t)self->_pushDaemonListenerEndpoint);
      objc_storeStrong((id *)&self->_pushDaemonListenerEndpoint, a3);
      [(NSXPCConnection *)self->_pushDaemonConnection setInvalidationHandler:0];
      [(NSXPCConnection *)self->_pushDaemonConnection invalidate];
      pushDaemonConnection = self->_pushDaemonConnection;
      self->_pushDaemonConnection = 0;

      if (v5)
      {
        v13 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
        v14 = self->_pushDaemonConnection;
        self->_pushDaemonConnection = v13;

        [(NSXPCConnection *)self->_pushDaemonConnection setExportedObject:self];
        v15 = +[NSXPCInterface _maps_mapsPushDaemonXPCInterface];
        [(NSXPCConnection *)self->_pushDaemonConnection setExportedInterface:v15];

        v16 = +[NSXPCInterface _maps_mapsPushDaemonXPCClientInterface];
        [(NSXPCConnection *)self->_pushDaemonConnection setRemoteObjectInterface:v16];

        [(NSXPCConnection *)self->_pushDaemonConnection _setQueue:&_dispatch_main_q];
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100460150;
        v18[3] = &unk_1012E6708;
        objc_copyWeak(&v19, &location);
        [(NSXPCConnection *)self->_pushDaemonConnection setInvalidationHandler:v18];
        [(NSXPCConnection *)self->_pushDaemonConnection setInterruptionHandler:&stru_1012EAF48];
        [(NSXPCConnection *)self->_pushDaemonConnection resume];
        v17 = [(NSXPCConnection *)self->_pushDaemonConnection remoteObjectProxy];
        [v17 establishConnection];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)setCompanionDaemonListenerEndpoint:(id)a3
{
  uint64_t v5 = (NSXPCListenerEndpoint *)a3;
  if (+[NSThread isMainThread])
  {
    if (self->_companionDaemonListenerEndpoint != v5)
    {
      sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Changing companionDaemonListenerEndpoint from %@ to %@", v6, v7, v8, v9, v10, v11, (uint64_t)self->_companionDaemonListenerEndpoint);
      objc_storeStrong((id *)&self->_companionDaemonListenerEndpoint, a3);
      [(NSXPCConnection *)self->_companionDaemonConnection setInvalidationHandler:0];
      [(NSXPCConnection *)self->_companionDaemonConnection invalidate];
      companionDaemonConnection = self->_companionDaemonConnection;
      self->_companionDaemonConnection = 0;

      if (v5)
      {
        v13 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
        v14 = self->_companionDaemonConnection;
        self->_companionDaemonConnection = v13;

        [(NSXPCConnection *)self->_companionDaemonConnection setExportedObject:self];
        v15 = +[NSXPCInterface _maps_mapsCompanionDaemonXPCInterface];
        [(NSXPCConnection *)self->_companionDaemonConnection setExportedInterface:v15];

        v16 = +[NSXPCInterface _maps_mapsCompanionDaemonXPCClientInterface];
        [(NSXPCConnection *)self->_companionDaemonConnection setRemoteObjectInterface:v16];

        [(NSXPCConnection *)self->_companionDaemonConnection _setQueue:&_dispatch_main_q];
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1004600D8;
        v18[3] = &unk_1012E6708;
        objc_copyWeak(&v19, &location);
        [(NSXPCConnection *)self->_companionDaemonConnection setInvalidationHandler:v18];
        [(NSXPCConnection *)self->_companionDaemonConnection setInterruptionHandler:&stru_1012EAF28];
        [(NSXPCConnection *)self->_companionDaemonConnection resume];
        v17 = [(NSXPCConnection *)self->_companionDaemonConnection remoteObjectProxy];
        [v17 establishConnection];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_pushGuidanceStateIfChangedWithVibration:(BOOL)a3
{
  if (!self->_waitingForDistanceAndTimeToManeuver)
  {
    if ([(IPCServer *)self needsGuidanceUpdate])
    {
      [(IPCServer *)self setNeedsGuidanceUpdate:0];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000AA3B8;
      v5[3] = &unk_1012E6300;
      v5[4] = self;
      BOOL v6 = a3;
      [(IPCServer *)self checkNotificationSettingsAndPerformBlock:v5];
    }
  }
}

- (void)setNeedsGuidanceUpdate:(BOOL)a3
{
  self->_needsGuidanceUpdate = a3;
}

- (BOOL)needsGuidanceUpdate
{
  return self->_needsGuidanceUpdate;
}

- (void)checkNotificationSettingsAndPerformBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_hasCheckedNotificationSettingsForManeuver)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    BOOL v6 = +[UNUserNotificationCenter currentNotificationCenter];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100024088;
    v7[3] = &unk_1012EAF98;
    v7[4] = self;
    id v8 = v5;
    [v6 getNotificationSettingsWithCompletionHandler:v7];
  }
}

- (IPCServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)IPCServer;
  v2 = [(IPCServer *)&v9 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_sceneWillConnect" name:UISceneWillConnectNotification object:0];
    [v3 addObserver:v2 selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:0];
    [v3 addObserver:v2 selector:"_sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:0];
    [v3 addObserver:v2 selector:"_sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];
    [v3 addObserver:v2 selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];
    id v4 = +[MNNavigationService sharedService];
    [v4 registerObserver:v2];

    uint64_t v5 = objc_opt_new();
    bannerSource = v2->_bannerSource;
    v2->_bannerSource = (BannerSource *)v5;

    id v7 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
  }
  return v2;
}

- (BackgroundNavigationDelegate)backgroundNavigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundNavigationDelegate);

  return (BackgroundNavigationDelegate *)WeakRetained;
}

- (void)_sendWeakLocationNotificationIfNeededWithGuidanceState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_shownWeakLocationAlert && self->_hasPendingWeakLocationAlert)
  {
    id v7 = v4;
    unsigned int v6 = [v4 showInMainScreen];
    uint64_t v5 = v7;
    if (v6)
    {
      self->_shownWeakLocationAlert = 1;
      [(IPCServer *)self _postWeakLocationNotification];
      uint64_t v5 = v7;
    }
  }
}

- (id)_currentGuidanceStateMessageWithGuidanceCausedVibration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_alloc_init(IPCGuidanceStateReply);
  [(IPCGuidanceStateReply *)v5 setGuidanceState:[(IPCServer *)self state]];
  [(IPCGuidanceStateReply *)v5 setAffectsDimming:[(IPCServer *)self _guidanceAffectsDimming] | v3];
  [(IPCGuidanceStateReply *)v5 setTransportType:self->_transportType];
  int transportType = self->_transportType;
  if (qword_10160ED28 != -1) {
    dispatch_once(&qword_10160ED28, &stru_1012EB108);
  }
  id v7 = [(id)qword_10160ED20 path];
  int AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

  objc_super v9 = @"Off Volume";
  if (AppBooleanValueWithContainer != 1)
  {
    if (qword_10160ED28 != -1) {
      dispatch_once(&qword_10160ED28, &stru_1012EB108);
    }
    id v10 = (id)qword_10160ED20;
    if (transportType == 2)
    {
      int v11 = MNHeadphonesAreInUse();
      v12 = @"VoiceVolumeForWalkingWithoutHeadphonesContext";
      if (v11) {
        v12 = @"VoiceVolumeForWalkingWithHeadphonesContext";
      }
      v13 = v12;
    }
    else
    {
      v13 = @"VoiceVolumeForDrivingContext";
    }
    v14 = [v10 path];
    uint64_t v15 = _CFPreferencesCopyAppValueWithContainer();

    if (v15) {
      CFStringRef v16 = (const __CFString *)v15;
    }
    else {
      CFStringRef v16 = @"Normal Volume";
    }
    if (!v15 && transportType == 2)
    {
      if (MNHeadphonesAreInUse()) {
        v17 = @"Normal Volume";
      }
      else {
        v17 = @"Off Volume";
      }
      CFStringRef v16 = v17;
    }

    objc_super v9 = (__CFString *)v16;
  }
  [(IPCGuidanceStateReply *)v5 setNavVolumeSetting:v9];

  v18 = [(IPCServer *)self lastSceneDeactivationTime];
  [(IPCGuidanceStateReply *)v5 setLastSceneDeactivationTime:v18];

  id v19 = +[MNNavigationService sharedService];
  v20 = [v19 currentResponse];
  if ([v20 hasSessionState])
  {
    v21 = [v20 sessionState];
    [(IPCGuidanceStateReply *)v5 setNavSessionData:v21];
  }
  v105 = v20;
  v22 = [v19 route];
  -[v5 setCurrentLegIndex:[v22 legIndexForStepIndex:[v19 stepIndex]]];
  v104 = v22;
  v23 = [v22 legs];
  -[IPCGuidanceStateReply setNumberOfLegs:](v5, "setNumberOfLegs:", [v23 count]);

  v24 = [v19 arrivalInfo];
  [(IPCGuidanceStateReply *)v5 setArrivalInfo:v24];

  if (self->_hasPendingAlight)
  {
    v25 = objc_opt_new();
    v26 = objc_opt_new();
    v27 = [v26 UUIDString];
    [v25 setIdentifier:v27];

    [v25 setStopIndex:[self->_alightAlert stopIndex]];
    [v25 setStepIndex:[self->_alightAlert stepIndex]];
    v28 = [(MNTransitAlert *)self->_alightAlert artwork];
    [v25 setArtwork:v28];

    v29 = [(MNTransitAlert *)self->_alightAlert primaryString];
    [v25 setTitle:v29];

    v30 = [(MNTransitAlert *)self->_alightAlert secondaryString];
    [v25 setDetail:v30];

    [(IPCGuidanceStateReply *)v5 setAlightMessage:v25];
    [(IPCGuidanceStateReply *)v5 setAffectsDimming:1];
    self->_hasPendingAlight = 0;
  }
  if (self->_trafficIncidentAlert)
  {
    v31 = objc_alloc_init(IPCTrafficIncidentAlertMessage);
    [(IPCTrafficIncidentAlertMessage *)v31 setType:[(MNTrafficIncidentAlert *)self->_trafficIncidentAlert alertType]];
    v32 = [(MNTrafficIncidentAlert *)self->_trafficIncidentAlert alertTitles];
    v33 = [v32 firstObject];
    [(IPCTrafficIncidentAlertMessage *)v31 setTitle:v33];

    v34 = [(MNTrafficIncidentAlert *)self->_trafficIncidentAlert alertDescriptions];
    v35 = [v34 firstObject];
    [(IPCTrafficIncidentAlertMessage *)v31 setSubtitle:v35];

    id v36 = objc_alloc((Class)NSUUID);
    id v37 = [(MNTrafficIncidentAlert *)self->_trafficIncidentAlert alertID];
    id v38 = [v36 initWithUUIDBytes:[v37 bytes]];
    v39 = [v38 UUIDString];
    [(IPCTrafficIncidentAlertMessage *)v31 setIdentifier:v39];

    v40 = [(MNTrafficIncidentAlert *)self->_trafficIncidentAlert incident];
    [(IPCTrafficIncidentAlertMessage *)v31 setIncident:v40];

    [(IPCGuidanceStateReply *)v5 setTrafficIncidentAlert:v31];
  }
  [(IPCGuidanceStateReply *)v5 setIsRerouting:self->_isRerouting];
  switch([(IPCServer *)self state])
  {
    case 1uLL:
      [(IPCGuidanceStateReply *)v5 setManeuver:[(IPCServer *)self _maneuver]];
      v41 = [(IPCServer *)self _maneuverID];
      [(IPCGuidanceStateReply *)v5 setManeuverID:v41];

      v42 = +[NSBundle mainBundle];
      v43 = [v42 localizedStringForKey:@"Arrived [Driving/Walking Navigation]" value:@"localized string not found" table:0];
      v44 = [v43 mkServerFormattedString];
      v110 = v44;
      v45 = +[NSArray arrayWithObjects:&v110 count:1];
      [(IPCGuidanceStateReply *)v5 setPrimaryInstructions:v45];

      break;
    case 2uLL:
      v46 = NSCollectionLayoutEdgeSpacing_ptr;
      goto LABEL_32;
    case 3uLL:
      v46 = NSCollectionLayoutEdgeSpacing_ptr;
      [(IPCServer *)self _distanceToRoute];
      v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(IPCGuidanceStateReply *)v5 setDistance:v47];

      v48 = [(IPCServer *)self distanceText];

      if (v48)
      {
        v49 = [(IPCServer *)self distanceText];
        v111 = v49;
        v50 = +[NSArray arrayWithObjects:&v111 count:1];

        [(IPCGuidanceStateReply *)v5 setPrimaryInstructions:v50];
      }
LABEL_32:
      v51 = v46[55];
      v52 = [(IPCServer *)self _latestETA];
      [v52 remainingDistance];
      v53 = [v51 numberWithDouble:];
      [(IPCGuidanceStateReply *)v5 setRemainingDistanceOnRoute:v53];

      v54 = v46[55];
      v55 = [(IPCServer *)self _latestETA];
      v56 = [v54 numberWithUnsignedInteger:[v55 remainingMinutes]];
      [(IPCGuidanceStateReply *)v5 setRemainingMinutesOnRoute:v56];

      [(IPCGuidanceStateReply *)v5 setIsAlerting:1];
      break;
    case 4uLL:
      [(IPCGuidanceStateReply *)v5 setManeuver:[(IPCServer *)self _maneuver]];
      [(IPCGuidanceStateReply *)v5 setDrivingSide:[(IPCServer *)self _drivingSide]];
      v57 = [(IPCServer *)self junction];
      [(IPCGuidanceStateReply *)v5 setJunction:v57];

      v58 = [(IPCServer *)self artworkOverride];
      [(IPCGuidanceStateReply *)v5 setArtworkOverride:v58];

      v59 = [(IPCServer *)self maneuverInstructions];
      [(IPCGuidanceStateReply *)v5 setPrimaryInstructions:v59];

      v60 = [(IPCServer *)self secondaryManeuverInstructions];
      [(IPCGuidanceStateReply *)v5 setSecondaryInstructions:v60];

      v61 = [(IPCServer *)self _maneuverID];
      [(IPCGuidanceStateReply *)v5 setManeuverID:v61];

      [(IPCServer *)self _distanceToManeuver];
      v62 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(IPCGuidanceStateReply *)v5 setDistance:v62];

      [(IPCServer *)self _timeToManeuver];
      v63 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(IPCGuidanceStateReply *)v5 setTimeToNextManeuver:v63];

      BOOL v64 = self->_spokenEventProcessing || self->_isStickySignal;
      [(IPCGuidanceStateReply *)v5 setIsAlerting:v64];
      [(IPCGuidanceStateReply *)v5 setCurrentSpokenEventID:self->_currentSpokenEventID];
      *(_WORD *)&self->_isStickySignal = 0;
      v65 = [(IPCServer *)self _latestETA];
      [v65 remainingDistance];
      v66 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(IPCGuidanceStateReply *)v5 setRemainingDistanceOnRoute:v66];

      v67 = [(IPCServer *)self _latestETA];
      v68 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 remainingMinutes]);
      [(IPCGuidanceStateReply *)v5 setRemainingMinutesOnRoute:v68];

      v69 = [(IPCServer *)self shieldInfo];
      v70 = +[IPCShieldInfoMessage ipcMessageForShieldInfo:v69];
      [(IPCGuidanceStateReply *)v5 setShieldInfo:v70];

      v71 = [(IPCServer *)self laneGuidanceInfo];
      v72 = +[IPCLaneGuidanceInfoReply ipcReplyForLaneGuidanceInfo:v71];
      [(IPCGuidanceStateReply *)v5 setLaneGuidanceInfo:v72];

      break;
    default:
      break;
  }
  v73 = [(IPCServer *)self notificationSettings];
  id v74 = [v73 authorizationStatus];
  id v75 = [v73 alertSetting];
  id v76 = [v73 carPlaySetting];
  v77 = [(IPCServer *)self state];
  unint64_t v109 = [(IPCServer *)self state];
  unsigned int v78 = [v19 isInNavigatingState];
  if ([(IPCServer *)self etaOnlyNavMode]) {
    uint64_t v79 = 0;
  }
  else {
    uint64_t v79 = v78 & ~[(IPCServer *)self routePreviewGuidanceNavMode];
  }
  unsigned int v103 = v78;
  if (!v109 && [(IPCServer *)self _transportType] != 1) {
    uint64_t v79 = 0;
  }
  BOOL v80 = v74 == (id)2;
  BOOL v81 = v75 != (id)1 && v74 == (id)2;
  BOOL v95 = v76 == (id)1;
  uint64_t v82 = v81 & v79;
  if (v95) {
    BOOL v80 = 0;
  }
  int v108 = v80 & v79;
  v83 = [(IPCGuidanceStateReply *)v5 alightMessage];

  BOOL v84 = [(IPCServer *)self _isMapsForegroundOnMainWindow];
  unsigned int v107 = [(IPCServer *)self _isMapsForegroundOnCarPlay];
  char v85 = !v84;
  if (v83) {
    char v85 = 1;
  }
  v106 = v19;
  if v82 == 1 && (v85)
  {
    v86 = +[CarDisplayController sharedInstance];
    -[IPCGuidanceStateReply setShowInMainScreen:](v5, "setShowInMainScreen:", [v86 isCurrentlyConnectedToCarAppScene] ^ 1);
  }
  else
  {
    [(IPCGuidanceStateReply *)v5 setShowInMainScreen:0];
  }
  if (SBUIIsSystemApertureEnabled()) {
    [(IPCGuidanceStateReply *)v5 setShowInMainScreen:v79];
  }
  [(IPCGuidanceStateReply *)v5 setIsMapsForegroundOnMainScreen:v84];
  unsigned int v87 = [(IPCServer *)self _isMapsForegroundOnlyOnHybridIC];
  if (!v108) {
    goto LABEL_62;
  }
  if (!v107) {
    goto LABEL_60;
  }
  if (!v87)
  {
LABEL_62:
    [(IPCGuidanceStateReply *)v5 setShowInCarPlay:0];
    goto LABEL_65;
  }
  v77 = [(IPCGuidanceStateReply *)v5 trafficIncidentAlert];
  if (!v77)
  {
    [(IPCGuidanceStateReply *)v5 setShowInCarPlay:0];
    goto LABEL_64;
  }
LABEL_60:
  v88 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
  v89 = [v88 carPlayExternalDevice];
  [(IPCGuidanceStateReply *)v5 setShowInCarPlay:v89 != 0];

  if (v107) {
LABEL_64:
  }

LABEL_65:
  id v90 = [v73 alertStyle];
  BOOL isPersistentDisplay = self->_isPersistentDisplay;
  v92 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v93 = [v92 BOOLForKey:@"__internal_MapsDebugForceStickyBanners"];

  if (v93)
  {
    uint64_t v94 = 1;
  }
  else
  {
    BOOL v95 = v90 != (id)2 || !isPersistentDisplay;
    uint64_t v94 = !v95;
  }
  [(IPCGuidanceStateReply *)v5 setIsSticky:v94];
  [(IPCGuidanceStateReply *)v5 setIsNavigating:v103];
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC allowBannersOnPhone: %d, allowBannersOnCarplay: %d due to notificationsAllowed: %d, bannerNotificationsAllowed: %d, hasIPCState:%d, isDriving: %d, isFullGuidanceNavigation: %d; stickyBannersAllowed: %d, bannerShouldStick: %d isMapsForegroundOnMainWindow: %d isMapsForegroundOnCarPlay: %d hasAlightMessage: %d",
    v96,
    v97,
    v98,
    v99,
    v100,
    v101,
    v82);

  return v5;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)routePreviewGuidanceNavMode
{
  return self->_routePreviewGuidanceNavMode;
}

- (UNNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (NSDate)lastSceneDeactivationTime
{
  return self->_lastSceneDeactivationTime;
}

- (BOOL)etaOnlyNavMode
{
  return self->_etaOnlyNavMode;
}

- (BOOL)_isMapsForegroundOnlyOnHybridIC
{
  BOOL v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];
  uint64_t v5 = sub_1000AC254(v4, &stru_1012EAEC0);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10045FE80;
  v11[3] = &unk_1012EAEE8;
  v11[4] = self;
  unsigned int v6 = sub_1000990A8(v5, v11);
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10045FEEC;
    v10[3] = &unk_1012EAEE8;
    v10[4] = self;
    id v7 = sub_1000990A8(v5, v10);
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isMapsForegroundOnMainWindow
{
  if (+[UIApplication _maps_isAnySceneForegroundForRole:UIWindowSceneSessionRoleApplication])
  {
    return 1;
  }
  uint64_t v3 = _UIWindowSceneSessionTypeCoverSheet;

  return +[UIApplication _maps_isAnySceneForegroundForRole:v3];
}

- (BOOL)_isMapsForegroundOnCarPlay
{
  return [(IPCServer *)self _isAnySceneForegroundAndNotOccludedForRole:_UIWindowSceneSessionRoleCarPlay];
}

- (BOOL)_isAnySceneForegroundAndNotOccludedForRole:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 connectedScenes];

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 session];
        v13 = [v12 role];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14
          && !+[UIApplication _maps_shouldIgnoreActivationStateForScene:v11]&& ![(IPCServer *)self _isSceneOccluded:v11]&& [(IPCServer *)self _isSceneForeground:v11])
        {
          BOOL v15 = 1;
          goto LABEL_14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)_guidanceAffectsDimming
{
  return [(IPCServer *)self _transportType] != 2
      && [(IPCServer *)self _transportType] != 1;
}

- (int)_transportType
{
  return self->_transportType;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010EA8;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160ED18 != -1) {
    dispatch_once(&qword_10160ED18, block);
  }
  v2 = (void *)qword_10160ED10;

  return v2;
}

- (void)setNotificationSettings:(id)a3
{
}

- (void)setBackgroundNavigationDelegate:(id)a3
{
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4 = [a3 object];
  if (!+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:"))
  {
    [(IPCServer *)self _noteGuidanceStateChanged];
    [(IPCServer *)self _pushGuidanceState];
  }
}

- (void)_sceneWillConnect
{
  if (self->_pendingLoadDirectionsMessage)
  {
    sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Scene connected while waiting for scene, check now", v2, v3, v4, v5, v6, v7, v9);
    [(IPCServer *)self _checkKeySceneInternal];
  }
}

- (void)_pushGuidanceState
{
}

- (void)_noteGuidanceStateChanged
{
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = +[MNNavigationService sharedService];
  [v4 unregisterObserver:self];

  [(CLInUseAssertion *)self->_coreLocationInUseAssertion invalidate];
  [(NSTimer *)self->_waitingToRespondToMessageTimer invalidate];
  [(NSTimer *)self->_waitingForKeyScenePollTimer invalidate];
  [(NSXPCConnection *)self->_siriPluginConnection invalidate];
  v5.receiver = self;
  v5.super_class = (Class)IPCServer;
  [(IPCServer *)&v5 dealloc];
}

- (void)setState:(unint64_t)a3 withReason:(unint64_t)a4
{
  unint64_t state = self->_state;
  if (state != a3)
  {
    sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC IPCServer state is changing from %lu to %lu for reason %@", a3, a4, v4, v5, v6, v7, state);
    self->_unint64_t state = a3;
  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v11 = [a3 object];
  if (!+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:"))
  {
    sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC _sceneWillDeactivate: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v11);
    id v10 = +[NSDate date];
    [(IPCServer *)self setLastSceneDeactivationTime:v10];

    [(IPCServer *)self _noteGuidanceStateChanged];
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v4 = [a3 object];
  if (!+[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:"))
  {
    [(IPCServer *)self _noteGuidanceStateChanged];
    [(IPCServer *)self _pushGuidanceState];
  }
}

- (BOOL)_isSceneOccluded:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _FBSScene];
  uint64_t v5 = [v4 uiSettings];
  unsigned __int8 v6 = [v5 deactivationReasons];

  id v7 = [v3 activationState];
  BOOL v8 = v7 == (id)1 && (v6 & 0x80) != 0;

  return v8;
}

- (BOOL)_isSceneForeground:(id)a3
{
  return (unint64_t)[a3 activationState] < 2;
}

- (BOOL)_isInBackground
{
  if ([(IPCServer *)self _isMapsForegroundOnMainWindow]) {
    return 0;
  }
  else {
    return ![(IPCServer *)self _isMapsForegroundOnCarPlay];
  }
}

- (id)activeCarPlayBannerViewController
{
  return [(BannerSource *)self->_bannerSource activeCarPlayBannerViewController];
}

- (id)activeBannerViewController
{
  return [(BannerSource *)self->_bannerSource activeBannerViewController];
}

- (void)handleTrafficeReroute:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer handleTrafficeReroute:reply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004602AC;
  block[3] = &unk_1012E80F0;
  block[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dismissNavigationSafetyAlertWithReply:(id)a3
{
  id v3 = a3;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s", v4, v5, v6, v7, v8, v9, (uint64_t)"-[IPCServer dismissNavigationSafetyAlertWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004604C0;
  block[3] = &unk_1012E6EA8;
  id v12 = v3;
  id v10 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)endNavigationWithReply:(id)a3
{
  id v4 = a3;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s", v5, v6, v7, v8, v9, v10, (uint64_t)"-[IPCServer endNavigationWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004605F8;
  block[3] = &unk_1012E76E8;
  void block[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)getGuidanceState:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer getGuidanceState:reply:]");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004607D4;
  v16[3] = &unk_1012E80F0;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [(IPCServer *)self checkNotificationSettingsAndPerformBlock:v16];
}

- (void)repeatLastReroutePromptWithReply:(id)a3
{
  id v4 = a3;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s", v5, v6, v7, v8, v9, v10, (uint64_t)"-[IPCServer repeatLastReroutePromptWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100460B60;
  block[3] = &unk_1012E76E8;
  void block[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)repeatLastGuidanceInstructionWithReply:(id)a3
{
  id v4 = a3;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s", v5, v6, v7, v8, v9, v10, (uint64_t)"-[IPCServer repeatLastGuidanceInstructionWithReply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100460D9C;
  block[3] = &unk_1012E76E8;
  void block[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadDirections:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer loadDirections:reply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046101C;
  block[3] = &unk_1012EAFE8;
  id v17 = v6;
  id v18 = v7;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startPreparedNavigation:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[IPCServer startPreparedNavigation:reply:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046123C;
  block[3] = &unk_1012EAFE8;
  id v17 = v6;
  id v18 = v7;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setNavigationMuted:(id)a3
{
  id v11 = a3;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s %@", v4, v5, v6, v7, v8, v9, (uint64_t)"-[IPCServer setNavigationMuted:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046135C;
  block[3] = &unk_1012E5D58;
  void block[4] = self;
  id v13 = v11;
  id v10 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setNavigationVoiceVolume:(id)a3
{
  id v11 = a3;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC %s %@", v4, v5, v6, v7, v8, v9, (uint64_t)"-[IPCServer setNavigationVoiceVolume:]");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100461474;
  block[3] = &unk_1012E5D58;
  void block[4] = self;
  id v13 = v11;
  id v10 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_receivedTrafficIncidentAlert:(id)a3
{
  id v4 = a3;
  if (self->_trafficAlertTimer) {
    -[IPCServer _removeTrafficIncidentAlertFromTimer:](self, "_removeTrafficIncidentAlertFromTimer:");
  }
  [v4 alertDisplayDuration];
  if (v5 > 0.0)
  {
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_removeTrafficIncidentAlertFromTimer:", v4, 0);
    uint64_t v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    trafficAlertTimer = self->_trafficAlertTimer;
    self->_trafficAlertTimer = v6;
  }
  trafficIncidentAlert = self->_trafficIncidentAlert;
  self->_trafficIncidentAlert = (MNTrafficIncidentAlert *)v4;
}

- (void)_updatedTrafficIncidentAlert:(id)a3
{
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)_invalidatedTrafficIncidentAlert:(id)a3
{
  if (self->_trafficIncidentAlert == a3)
  {
    trafficAlertTimer = self->_trafficAlertTimer;
    id v5 = a3;
    id v6 = [(NSTimer *)trafficAlertTimer userInfo];

    if (v6 == v5)
    {
      uint64_t v7 = self->_trafficAlertTimer;
      [(IPCServer *)self _removeTrafficIncidentAlertFromTimer:v7];
    }
  }
}

- (void)_removeTrafficIncidentAlertFromTimer:(id)a3
{
  id v4 = (NSTimer *)a3;
  trafficIncidentAlert = self->_trafficIncidentAlert;
  uint64_t v9 = v4;
  id v6 = [(NSTimer *)v4 userInfo];

  if (trafficIncidentAlert == v6)
  {
    uint64_t v7 = self->_trafficIncidentAlert;
    self->_trafficIncidentAlert = 0;
  }
  uint64_t v8 = v9;
  if (self->_trafficAlertTimer == v9)
  {
    self->_trafficAlertTimer = 0;

    uint64_t v8 = v9;
  }
  [(NSTimer *)v8 invalidate];
}

- (void)dismissTrafficIncidentAlert:(id)a3
{
  if (self->_trafficIncidentAlert == a3) {
    [(IPCServer *)self _removeTrafficIncidentAlertFromTimer:self->_trafficAlertTimer];
  }
}

- (void)_showNoGuidance
{
  [(IPCServer *)self setState:0 withReason:0];
  self->_lastSeenManeuverAlert = 0;
  self->_waitingForDistanceAndTimeToManeuver = 0;
  [(IPCServer *)self setLaneGuidanceInfo:0];
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)showRecalculating
{
  self->_lastSeenManeuverAlert = 0;
  [(IPCServer *)self setState:2 withReason:1];
  self->_waitingForDistanceAndTimeToManeuver = 0;
  [(IPCServer *)self setLaneGuidanceInfo:0];
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)setETA:(id)a3
{
  [(IPCServer *)self set_latestETA:a3];

  [(IPCServer *)self _noteGuidanceStateChanged];
}

- (void)_setTimeToManeuver:(double)a3 distanceToManeuver:(double)a4 forStep:(id)a5
{
  id v8 = a5;
  [(IPCServer *)self set_timeToManeuver:a3];
  [(IPCServer *)self set_distanceToManeuver:a4];
  id v11 = [v8 contentsForContext:1];

  uint64_t v9 = [v11 stringForDistance:a4];
  id v10 = [v9 mkServerFormattedString];
  [(IPCServer *)self setDistanceText:v10];

  self->_waitingForDistanceAndTimeToManeuver = 0;
}

- (void)_postWeakLocationNotification
{
  uint64_t v2 = +[UNUserNotificationCenter currentNotificationCenter];
  CFStringRef v21 = @"MapsWeakLocation";
  id v3 = +[NSArray arrayWithObjects:&v21 count:1];
  [v2 removePendingNotificationRequestsWithIdentifiers:v3];

  CFStringRef v20 = @"MapsWeakLocation";
  id v4 = +[NSArray arrayWithObjects:&v20 count:1];
  [v2 removeDeliveredNotificationsWithIdentifiers:v4];

  id v5 = objc_opt_new();
  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"[Weak Location] Title" value:@"localized string not found" table:0];
  [v5 setTitle:v7];

  id v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"[Weak Location] Body" value:@"localized string not found" table:0];
  [v5 setBody:v9];

  id v10 = +[UNNotificationRequest requestWithIdentifier:@"MapsWeakLocation" content:v5 trigger:0];
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Sending request: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100461CD8;
  v18[3] = &unk_1012EB010;
  id v19 = v10;
  id v17 = v10;
  [v2 addNotificationRequest:v17 withCompletionHandler:v18];
}

- (void)set_maneuverID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->__maneuverID;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v10 = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)v10;
    if ((v7 & 1) == 0)
    {
      id v8 = (NSUUID *)[v10 copy];
      maneuverID = self->__maneuverID;
      self->__maneuverID = v8;

      unint64_t v6 = (unint64_t)v10;
      self->_hasCheckedNotificationSettingsForManeuver = 0;
    }
  }
}

- (void)_startWaitingToSendResponse
{
  [(NSTimer *)self->_waitingToRespondToMessageTimer invalidate];
  id v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_timedOutWaitingToSendResponse" selector:0 userInfo:0 repeats:60.0];
  waitingToRespondToMessageTimer = self->_waitingToRespondToMessageTimer;
  self->_waitingToRespondToMessageTimer = v3;
}

- (void)_timedOutWaitingToSendResponse
{
  [(NSTimer *)self->_waitingToRespondToMessageTimer invalidate];
  waitingToRespondToMessageTimer = self->_waitingToRespondToMessageTimer;
  self->_waitingToRespondToMessageTimer = 0;

  id v4 = [(IPCServer *)self loadDirectionsDelayedReply];

  if (v4)
  {
    [(CLInUseAssertion *)self->_coreLocationInUseAssertion invalidate];
    coreLocationInUseAssertion = self->_coreLocationInUseAssertion;
    self->_coreLocationInUseAssertion = 0;

    id v10 = objc_alloc_init(IPCLoadDirectionsReply);
    [(IPCLoadDirectionsReply *)v10 setNavigationState:3];
    unint64_t v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4610 userInfo:0];
    [(IPCLoadDirectionsReply *)v10 setError:v6];

    unsigned __int8 v7 = [(IPCServer *)self loadDirectionsDelayedReply];
    ((void (**)(void, IPCLoadDirectionsReply *))v7)[2](v7, v10);

    [(IPCServer *)self setLoadDirectionsDelayedReply:0];
  }
  else
  {
    id v8 = [(IPCServer *)self startNavigationDelayedReply];

    if (!v8) {
      return;
    }
    id v10 = objc_alloc_init(IPCNavigationActionReply);
    [(IPCLoadDirectionsReply *)v10 setSuccess:0];
    [(IPCLoadDirectionsReply *)v10 setNavigationActionError:3];
    uint64_t v9 = [(IPCServer *)self startNavigationDelayedReply];
    ((void (**)(void, IPCLoadDirectionsReply *))v9)[2](v9, v10);

    [(IPCServer *)self setStartNavigationDelayedReply:0];
  }
}

- (unint64_t)_maximumScenePollCount
{
  [(IPCLoadDirectionsMessage *)self->_pendingLoadDirectionsMessage originIsWatch];

  return GEOConfigGetUInteger();
}

- (void)_startWaitingToHandleMessage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLoadDirectionsMessage, a3);
  id v13 = a3;
  self->_keyScenePollCount = 0;
  [(NSTimer *)self->_waitingForKeyScenePollTimer invalidate];
  [(IPCServer *)self _maximumScenePollCount];
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Start waiting for a scene to service message, will poll every %#.1lfs up to %lu times", v5, v6, v7, v8, v9, v10, 0x3FB999999999999ALL);
  uint64_t v11 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_checkKeyOrApplicationScene" selector:0 userInfo:1 repeats:0.1];
  waitingForKeyScenePollTimer = self->_waitingForKeyScenePollTimer;
  self->_waitingForKeyScenePollTimer = v11;
}

- (void)_checkKeyOrApplicationScene
{
}

- (void)_checkKeySceneInternal
{
  id v29 = +[UIApplication _maps_keyMapsSceneDelegate];
  id v3 = +[UIApplication _maps_applicationScenes];
  if (v29)
  {
    id v4 = v29;
  }
  else
  {
    if (![v3 count])
    {
      unint64_t keyScenePollCount = self->_keyScenePollCount;
      if (keyScenePollCount <= [(IPCServer *)self _maximumScenePollCount])
      {
        sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Waiting for key scene to connect... %lu", v12, v13, v14, v15, v16, v17, self->_keyScenePollCount);
        goto LABEL_12;
      }
    }
    id v4 = [v3 firstObject];
  }
  id v18 = v4;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Ready-or-not sending pending directions message to %@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  self->_unint64_t keyScenePollCount = 0;
  [(NSTimer *)self->_waitingForKeyScenePollTimer invalidate];
  waitingForKeyScenePollTimer = self->_waitingForKeyScenePollTimer;
  self->_waitingForKeyScenePollTimer = 0;

  if (self->_pendingLoadDirectionsMessage)
  {
    if (v18)
    {
      v26 = [(IPCServer *)self backgroundNavigationDelegate];
      [v26 prepareBackgroundNavigationWithMessage:self->_pendingLoadDirectionsMessage];
    }
    else
    {
      sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Cancelling prepareBackgroundNavigation, no scene available", v20, v21, v22, v23, v24, v25, v28);
      [(IPCServer *)self navigationStateDidChangeTo:2 reason:@"Couldn't service request to start navigation."];
    }
    pendingLoadDirectionsMessage = self->_pendingLoadDirectionsMessage;
    self->_pendingLoadDirectionsMessage = 0;
  }
LABEL_12:
}

- (void)setNeedsToDisplaySafetyWarning
{
  self->_pendingSafetyWarning = 1;
}

- (void)navigationStateDidChangeTo:(unint64_t)a3 reason:(id)a4
{
}

- (void)navigationStateDidChangeTo:(unint64_t)a3 reason:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[NSThread isMainThread])
  {
    if (a3 >= 5)
    {
      uint64_t v16 = +[NSString stringWithFormat:@"?? - %lu", a3];
    }
    else
    {
      uint64_t v16 = off_1012EB158[a3];
    }
    sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Received a navigation state change to %@ for reason %@.", v10, v11, v12, v13, v14, v15, (uint64_t)v16);

    [(NSTimer *)self->_waitingToRespondToMessageTimer invalidate];
    waitingToRespondToMessageTimer = self->_waitingToRespondToMessageTimer;
    self->_waitingToRespondToMessageTimer = 0;

    if (a3)
    {
      [(CLInUseAssertion *)self->_coreLocationInUseAssertion invalidate];
      coreLocationInUseAssertion = self->_coreLocationInUseAssertion;
      self->_coreLocationInUseAssertion = 0;
    }
    id v19 = [(IPCServer *)self loadDirectionsDelayedReply];
    if (v19)
    {
    }
    else
    {
      v26 = [(IPCServer *)self startNavigationDelayedReply];

      if (!v26)
      {
        sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Siri/Watch is NOT waiting for us.", v20, v21, v22, v23, v24, v25, v41);
        goto LABEL_25;
      }
    }
    sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Siri/Watch was waiting for us.", v20, v21, v22, v23, v24, v25, v41);
    sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Sending reply so Siri/Watch can handle the change.", v27, v28, v29, v30, v31, v32, v42);
    v33 = [(IPCServer *)self loadDirectionsDelayedReply];

    if (v33)
    {
      v34 = objc_alloc_init(IPCLoadDirectionsReply);
      [(IPCLoadDirectionsReply *)v34 setNavigationState:a3];
      [(IPCLoadDirectionsReply *)v34 setError:v9];
      if (a3)
      {
        [(CLInUseAssertion *)self->_coreLocationInUseAssertion invalidate];
        v35 = self->_coreLocationInUseAssertion;
        self->_coreLocationInUseAssertion = 0;
      }
      else if (self->_pendingSafetyWarning)
      {
        [(IPCLoadDirectionsReply *)v34 setSafetyWarningType:1];
        self->_pendingSafetyWarning = 0;
      }
      id v38 = [(IPCServer *)self loadDirectionsDelayedReply];
      ((void (**)(void, IPCLoadDirectionsReply *))v38)[2](v38, v34);

      [(IPCServer *)self setLoadDirectionsDelayedReply:0];
      goto LABEL_24;
    }
    id v36 = [(IPCServer *)self startNavigationDelayedReply];

    if (a3 && v36)
    {
      id v37 = objc_alloc_init(IPCNavigationActionReply);
      v34 = (IPCLoadDirectionsReply *)v37;
      if (a3 == 1)
      {
        [(IPCNavigationActionReply *)v37 setSuccess:1];
      }
      else
      {
        [(IPCNavigationActionReply *)v37 setSuccess:0];
        [(IPCLoadDirectionsReply *)v34 setNavigationActionError:3];
      }
      v39 = [(IPCServer *)self startNavigationDelayedReply];
      ((void (**)(void, IPCLoadDirectionsReply *))v39)[2](v39, v34);

      [(IPCServer *)self setStartNavigationDelayedReply:0];
      [(CLInUseAssertion *)self->_coreLocationInUseAssertion invalidate];
      v40 = self->_coreLocationInUseAssertion;
      self->_coreLocationInUseAssertion = 0;

LABEL_24:
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100462544;
    block[3] = &unk_1012EB038;
    void block[4] = self;
    unint64_t v46 = a3;
    id v44 = v8;
    id v45 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_25:
}

- (void)_vibrateForRerouteWithService:(id)a3
{
  id v4 = a3;
  [(IPCServer *)self setState:3 withReason:2];
  self->_waitingForDistanceAndTimeToManeuver = 0;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100462638;
  v5[3] = &unk_1012E6998;
  objc_copyWeak(&v6, &location);
  [v4 vibrateForPrompt:3 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7 = a3;
  id v8 = [GuidanceETA alloc];
  id v16 = [v7 displayEtaInfo];
  id v9 = [v7 remainingDistanceInfo];
  uint64_t v10 = [v7 batteryChargeInfo];
  uint64_t v11 = [v7 upcomingStop];
  uint64_t v12 = [v11 timezone];
  id v13 = [v7 navigationTransportType];

  uint64_t v14 = [(GuidanceETA *)v8 initWithDisplayETA:v16 remainingDistance:v9 batteryChargeInfo:v10 destinationTimeZone:v12 transportType:v13];
  latestETA = self->_latestETA;
  self->_latestETA = v14;
}

- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  id v8 = +[MNNavigationService sharedService];
  unsigned int v9 = [v8 navigationState];

  if (v9 != 5)
  {
    self->_lastSeenManeuverAlert = 0;
    [(IPCServer *)self setState:3 withReason:3];
    [(IPCServer *)self set_distanceToRoute:a4];
    self->_waitingForDistanceAndTimeToManeuver = 0;
    [(IPCServer *)self _noteGuidanceStateChanged];
  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  id v16 = a3;
  uint64_t v10 = [v16 route];
  uint64_t v11 = [v10 steps];
  id v12 = [v11 count];

  if ((unint64_t)v12 > a6)
  {
    id v13 = [v16 route];
    uint64_t v14 = [v13 steps];
    uint64_t v15 = [v14 objectAtIndexedSubscript:a6];

    [(IPCServer *)self _setTimeToManeuver:v15 distanceToManeuver:a5 forStep:a4];
    [(IPCServer *)self _noteGuidanceStateChanged];
  }
}

- (void)navigationService:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v12 = *(void *)&a6;
  id v24 = a4;
  id v15 = a7;
  id v16 = sub_100099700(a5, &stru_1012EB078);
  if ((id)[(IPCServer *)self state] != (id)4
    || (unsigned int v17 = [v24 maneuverType], v17 != -[IPCServer _maneuver](self, "_maneuver"))
    || ([(IPCServer *)self secondaryManeuverInstructions],
        id v18 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v19 = [v18 isEqualToArray:v16],
        v18,
        (v19 & 1) == 0))
  {
    [(IPCServer *)self setState:4 withReason:4];
    -[IPCServer set_maneuver:](self, "set_maneuver:", [v24 maneuverType]);
    if ([v24 hasJunctionType])
    {
      id v20 = [objc_alloc((Class)MKJunction) initWithType:[v24 junctionType] maneuver:[v24 maneuverType] drivingSide:v10 elements:[v24 junctionElements] count:[v24 junctionElementsCount]];
      [(IPCServer *)self setJunction:v20];
    }
    else
    {
      [(IPCServer *)self setJunction:0];
    }
    uint64_t v21 = [v24 artworkOverride];
    [(IPCServer *)self setArtworkOverride:v21];

    [(IPCServer *)self set_drivingSide:v10];
    [(IPCServer *)self setManeuverInstructions:0];
    [(IPCServer *)self setSecondaryManeuverInstructions:v16];
    uint64_t v22 = +[NSUUID UUID];
    [(IPCServer *)self set_maneuverID:v22];

    self->_lastSeenManeuverAlert = 0;
    if (v12)
    {
      uint64_t v23 = +[NavSignShieldInfo shieldWithID:v12 stringID:0 text:v15];
      [(IPCServer *)self setShieldInfo:v23];
    }
    else
    {
      [(IPCServer *)self setShieldInfo:0];
    }
    [(IPCServer *)self set_timeToManeuver:0.0];
    [(IPCServer *)self set_distanceToManeuver:0.0];
    self->_waitingForDistanceAndTimeToManeuver = 1;
    [(IPCServer *)self _noteGuidanceStateChanged];
  }
}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  uint64_t v7 = 3;
  uint64_t v8 = 2;
  if ((unsigned __int16)v4 != 4) {
    uint64_t v8 = 0;
  }
  if ((unsigned __int16)v4 != 5) {
    uint64_t v7 = v8;
  }
  BOOL v9 = (unsigned __int16)v4 != 3 && (unsigned __int16)v4 == 5;
  if ((unsigned __int16)v4 == 3) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v7;
  }
  uint64_t v11 = (void *)(v10 | *(void *)&v4 & 0x10000);
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100462E28;
  v13[3] = &unk_1012EB0A0;
  objc_copyWeak(v14, &location);
  v14[1] = v11;
  uint64_t v12 = objc_retainBlock(v13);
  if (v9
    && LOWORD(self->_lastSeenManeuverAlert) != 3
    && [(IPCServer *)self _transportType] == 2
    && [(IPCServer *)self _isInBackground])
  {
    [(IPCServer *)self _maneuver];
    [(IPCServer *)self _drivingSide];
    [v6 vibrateForPrompt:MNInstructionsShortPromptTypeForManeuver() completion:v12];
  }
  else
  {
    ((void (*)(void *, void))v12[2])(v12, 0);
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100463018;
  v12[3] = &unk_1012E6998;
  objc_copyWeak(&v13, &location);
  BOOL v9 = objc_retainBlock(v12);
  if ([(IPCServer *)self _transportType] == 2 && [(IPCServer *)self _isInBackground])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100463090;
    v10[3] = &unk_1012EAFC0;
    uint64_t v11 = v9;
    [v7 vibrateForPrompt:4 completion:v10];
  }
  else
  {
    ((void (*)(void *, void))v9[2])(v9, 0);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  if (!a4)
  {
    [(IPCServer *)self setState:0 withReason:5];
    self->_lastSeenManeuverAlert = 0;
  }
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  unsigned int v8 = [(IPCServer *)self _transportType];
  if (v6 == 2 && !v8 && [(IPCServer *)self _isInBackground]) {
    [v9 vibrateForPrompt:5 completion:&stru_1012EB0C0];
  }
  [(IPCServer *)self set_transportType:v6];
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    -[IPCServer set_transportType:](self, "set_transportType:", [v7 desiredTransportType]);
  }
  else if (!a5)
  {
    if (self->_trafficAlertTimer) {
      -[IPCServer _removeTrafficIncidentAlertFromTimer:](self, "_removeTrafficIncidentAlertFromTimer:");
    }
    [(IPCServer *)self _showNoGuidance];
  }
}

- (void)navigationServiceWillReroute:(id)a3
{
  self->_isRerouting = 1;
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  self->_isRerouting = 0;
  [(BannerSource *)self->_bannerSource resetExcludingJindo];
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  self->_isRerouting = 0;
  [(IPCServer *)self _showNoGuidance];
}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  self->_isRerouting = 0;
  [(IPCServer *)self _showNoGuidance];
}

- (void)navigationService:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  [(IPCServer *)self _showNoGuidance];
  if ([(IPCServer *)self _transportType] == 2 && (id)[(IPCServer *)self state] == (id)2) {
    [(IPCServer *)self _vibrateForRerouteWithService:v5];
  }
}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  id v6 = a3;
  if ([(IPCServer *)self _transportType] == 2)
  {
    if (a4 == 5)
    {
      [(IPCServer *)self showRecalculating];
      goto LABEL_8;
    }
    if ((id)[(IPCServer *)self state] == (id)2) {
      [(IPCServer *)self _vibrateForRerouteWithService:v6];
    }
  }
  if (!a4)
  {
    [(BannerSource *)self->_bannerSource reset];
    self->_isRerouting = 0;
    *(_WORD *)&self->_shownWeakLocationAlert = 0;
  }
LABEL_8:
}

- (void)navigationService:(id)a3 didChangeGuidanceState:(id)a4
{
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5 = a4;
  id v6 = [v5 primarySign];
  if (v6)
  {

    goto LABEL_4;
  }
  id v7 = [v5 secondarySign];

  if (v7)
  {
LABEL_4:
    id v8 = objc_alloc((Class)MKServerFormattedStringParameters);
    id v9 = [v5 primarySign];
    id v10 = [v9 distanceDetailLevel];
    uint64_t v11 = [v5 primarySign];
    uint64_t v12 = [v11 variableOverrides];
    id v13 = [v8 initWithInstructionsDistanceDetailLevel:v10 variableOverrides:v12];

    uint64_t v14 = [v5 primarySign];
    id v15 = [v14 titles];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100463A00;
    v53[3] = &unk_1012EB0E8;
    id v16 = v13;
    id v54 = v16;
    unsigned int v17 = sub_100099700(v15, v53);

    id v18 = [v5 primarySign];
    unsigned __int8 v19 = [v18 details];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100463A68;
    v51[3] = &unk_1012EB0E8;
    id v20 = v16;
    id v52 = v20;
    uint64_t v21 = sub_100099700(v19, v51);

    if ((id)[(IPCServer *)self state] != (id)4) {
      goto LABEL_13;
    }
    uint64_t v22 = [v5 primarySign];
    uint64_t v23 = [v22 junction];
    unsigned int v24 = [v23 maneuverType];
    if (v24 == [(IPCServer *)self _maneuver])
    {
      uint64_t v25 = [(IPCServer *)self maneuverInstructions];
      if ([v25 isEqualToArray:v17])
      {
        v26 = [(IPCServer *)self secondaryManeuverInstructions];
        if ([v26 isEqualToArray:v21])
        {
          [(IPCServer *)self _maneuverID];
          uint64_t v27 = v49 = v26;
          v48 = [v5 primarySign];
          uint64_t v28 = [v48 uniqueID];
          unsigned __int8 v50 = [v27 isEqual:v28];

          if (v50)
          {
LABEL_17:
            [v5 timeUntilPrimarySign_SIRI_USE_ONLY];
            -[IPCServer set_timeToManeuver:](self, "set_timeToManeuver:");
            [v5 primaryDistance_SIRI_USE_ONLY];
            -[IPCServer set_distanceToManeuver:](self, "set_distanceToManeuver:");
            self->_waitingForDistanceAndTimeToManeuver = 0;
            [(IPCServer *)self _noteGuidanceStateChanged];

            goto LABEL_18;
          }
LABEL_13:
          [(IPCServer *)self setState:4 withReason:4];
          uint64_t v29 = [v5 primarySign];
          uint64_t v30 = [v29 junction];
          -[IPCServer set_maneuver:](self, "set_maneuver:", [v30 maneuverType]);

          uint64_t v31 = [v5 primarySign];
          uint64_t v32 = [v31 junction];
          if (v32)
          {
            id v33 = objc_alloc((Class)MKJunction);
            v34 = [v5 primarySign];
            v35 = [v34 junction];
            id v36 = [v33 initWithJunction:v35];
            [(IPCServer *)self setJunction:v36];
          }
          else
          {
            [(IPCServer *)self setJunction:0];
          }

          id v37 = [v5 primarySign];
          id v38 = [v37 artworkOverride];
          [(IPCServer *)self setArtworkOverride:v38];

          v39 = [v5 primarySign];
          v40 = [v39 uniqueID];
          [(IPCServer *)self set_maneuverID:v40];

          uint64_t v41 = [v5 primarySign];
          uint64_t v42 = [v41 junction];
          -[IPCServer set_drivingSide:](self, "set_drivingSide:", [v42 drivingSide]);

          [(IPCServer *)self setManeuverInstructions:v17];
          [(IPCServer *)self setSecondaryManeuverInstructions:v21];
          v43 = [v5 primarySign];
          id v44 = [v43 shieldID];
          id v45 = [v43 shieldStringID];
          unint64_t v46 = [v43 shieldText];
          v47 = +[NavSignShieldInfo shieldWithID:v44 stringID:v45 text:v46];
          [(IPCServer *)self setShieldInfo:v47];

          goto LABEL_17;
        }
      }
    }

    goto LABEL_13;
  }
LABEL_18:
}

- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4
{
  id v6 = +[NSNumber numberWithBool:a4];
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Updated usePersistentDisplay : %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  self->_BOOL isPersistentDisplay = a4;
  self->_isStickySignal = a4;
  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v5 = a4;
  id v6 = [[NavSignLaneGuidanceInfo alloc] initWithGuidanceLaneInfo:v5];

  [(IPCServer *)self setLaneGuidanceInfo:v6];
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
}

- (void)navigationService:(id)a3 willProcessSpeechEvent:(id)a4
{
  self->_spokenEventProcessing = 1;
  [a4 uniqueID:a3];
  id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  currentSpokenEventID = self->_currentSpokenEventID;
  self->_currentSpokenEventID = v5;

  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 didProcessSpeechEvent:(id)a4
{
  self->_spokenEventProcessing = 0;
  currentSpokenEventID = self->_currentSpokenEventID;
  self->_currentSpokenEventID = 0;

  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 didReceiveTransitAlert:(id)a4
{
  objc_storeStrong((id *)&self->_alightAlert, a4);
  id v6 = a4;
  self->_hasPendingAlight = 1;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MAPS IPC Enqueued alight alert: %@", v7, v8, v9, v10, v11, v12, (uint64_t)self->_alightAlert);

  [(IPCServer *)self _noteGuidanceStateChanged];

  [(IPCServer *)self _pushGuidanceState];
}

- (void)navigationService:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"NavigationEnableWeakLocationNotification"];

  if (v7)
  {
    self->_hasPendingWeakLocationAlert = a4 == 2;
    [(IPCServer *)self _noteGuidanceStateChanged];
    [(IPCServer *)self _pushGuidanceState];
  }
}

- (int)_drivingSide
{
  return self->_drivingSide;
}

- (void)set_drivingSide:(int)a3
{
  self->_drivingSide = a3;
}

- (int)_maneuver
{
  return self->_maneuver;
}

- (void)set_maneuver:(int)a3
{
  self->_maneuver = a3;
}

- (double)_distanceToManeuver
{
  return self->_distanceToManeuver;
}

- (void)set_distanceToManeuver:(double)a3
{
  self->_distanceToManeuver = a3;
}

- (double)_timeToManeuver
{
  return self->_timeToManeuver;
}

- (void)set_timeToManeuver:(double)a3
{
  self->_timeToManeuver = a3;
}

- (GuidanceETA)_latestETA
{
  return self->_latestETA;
}

- (void)set_latestETA:(id)a3
{
}

- (double)_distanceToRoute
{
  return self->_distanceToRoute;
}

- (void)set_distanceToRoute:(double)a3
{
  self->_distanceToRoute = a3;
}

- (void)set_transportType:(int)a3
{
  self->_int transportType = a3;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (ExternalGuidanceSource)externalGuidanceSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalGuidanceSource);

  return (ExternalGuidanceSource *)WeakRetained;
}

- (void)setExternalGuidanceSource:(id)a3
{
}

- (void)setEtaOnlyNavMode:(BOOL)a3
{
  self->_etaOnlyNavMode = a3;
}

- (void)setRoutePreviewGuidanceNavMode:(BOOL)a3
{
  self->_routePreviewGuidanceNavMode = a3;
}

- (VirtualGarageSource)virtualGarageSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_virtualGarageSource);

  return (VirtualGarageSource *)WeakRetained;
}

- (void)setVirtualGarageSource:(id)a3
{
}

- (NSXPCListenerEndpoint)siriPluginListenerEndpoint
{
  return self->_siriPluginListenerEndpoint;
}

- (NSXPCListenerEndpoint)companionDaemonListenerEndpoint
{
  return self->_companionDaemonListenerEndpoint;
}

- (NSXPCListenerEndpoint)pushDaemonListenerEndpoint
{
  return self->_pushDaemonListenerEndpoint;
}

- (MKJunction)junction
{
  return self->_junction;
}

- (void)setJunction:(id)a3
{
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
}

- (MKServerFormattedString)distanceText
{
  return self->_distanceText;
}

- (void)setDistanceText:(id)a3
{
}

- (NSArray)maneuverInstructions
{
  return self->_maneuverInstructions;
}

- (void)setManeuverInstructions:(id)a3
{
}

- (NSArray)secondaryManeuverInstructions
{
  return self->_secondaryManeuverInstructions;
}

- (void)setSecondaryManeuverInstructions:(id)a3
{
}

- (NSUUID)_maneuverID
{
  return self->__maneuverID;
}

- (NavSignShieldInfo)shieldInfo
{
  return self->_shieldInfo;
}

- (void)setShieldInfo:(id)a3
{
}

- (void)setLastSceneDeactivationTime:(id)a3
{
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
}

- (id)loadDirectionsDelayedReply
{
  return self->_loadDirectionsDelayedReply;
}

- (void)setLoadDirectionsDelayedReply:(id)a3
{
}

- (id)startNavigationDelayedReply
{
  return self->_startNavigationDelayedReply;
}

- (void)setStartNavigationDelayedReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startNavigationDelayedReply, 0);
  objc_storeStrong(&self->_loadDirectionsDelayedReply, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_lastSceneDeactivationTime, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_shieldInfo, 0);
  objc_storeStrong((id *)&self->__maneuverID, 0);
  objc_storeStrong((id *)&self->_secondaryManeuverInstructions, 0);
  objc_storeStrong((id *)&self->_maneuverInstructions, 0);
  objc_storeStrong((id *)&self->_distanceText, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_pushDaemonListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_companionDaemonListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_siriPluginListenerEndpoint, 0);
  objc_destroyWeak((id *)&self->_virtualGarageSource);
  objc_destroyWeak((id *)&self->_backgroundNavigationDelegate);
  objc_destroyWeak((id *)&self->_externalGuidanceSource);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_alightAlert, 0);
  objc_storeStrong((id *)&self->_pendingLoadDirectionsMessage, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_pushDaemonConnection, 0);
  objc_storeStrong((id *)&self->_companionDaemonConnection, 0);
  objc_storeStrong((id *)&self->_siriPluginConnection, 0);
  objc_storeStrong((id *)&self->_waitingForKeyScenePollTimer, 0);
  objc_storeStrong((id *)&self->_waitingToRespondToMessageTimer, 0);
  objc_storeStrong((id *)&self->_trafficAlertTimer, 0);
  objc_storeStrong((id *)&self->_coreLocationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_currentSpokenEventID, 0);

  objc_storeStrong((id *)&self->_trafficIncidentAlert, 0);
}

@end