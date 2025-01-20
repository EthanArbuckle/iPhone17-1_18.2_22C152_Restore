@interface SDProxHandoffAgent
+ (id)sharedAgent;
- (BOOL)_bleActionDiscoveryShouldStart;
- (BOOL)_bleInfoDiscoveryShouldStart;
- (BOOL)_clinkShouldStart;
- (BOOL)_combinedDeviceIsSuppressed:(id)a3;
- (BOOL)_expectingContentForDeviceID:(id)a3;
- (BOOL)_motionShouldStart;
- (BOOL)_runStateVerify:(int)a3 device:(id)a4;
- (BOOL)_serviceShouldStart;
- (BOOL)_shouldMediumPromptWithInfo:(id)a3;
- (BOOL)_systemCanTrigger;
- (BOOL)_throttleEventsReachedMax;
- (BOOL)_throttleMediumAllowsTrigger;
- (BOOL)callTransferShouldPush:(id)a3;
- (BOOL)preventNotifications;
- (CGImage)appIconForCall:(id)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDProxHandoffAgent)init;
- (id)_bleUpdateMappingWithDevice:(id)a3;
- (id)_combinedDeviceForUIID:(id)a3;
- (id)_combinedDevicePending;
- (id)_routeForDevice:(id)a3;
- (id)_routes;
- (id)callTransferInfoForDevice:(id)a3;
- (id)contactForCall:(id)a3;
- (id)currentCall;
- (id)displayNameForContact:(id)a3;
- (id)mediaTransferInfoFromInfo:(id)a3;
- (id)persistImageForContact:(id)a3 withAppIcon:(CGImage *)a4;
- (int)proximityClient:(id)a3 dismissContentForDevice:(id)a4;
- (int)proximityClient:(id)a3 provideContent:(id)a4 forDevice:(id)a5 force:(BOOL)a6;
- (int)proximityClient:(id)a3 stopSuppressingDevice:(id)a4;
- (int)proximityClient:(id)a3 suppressDevice:(id)a4;
- (int)proximityClient:(id)a3 updateContent:(id)a4 forDevice:(id)a5;
- (int)proximityClientRequestScannerTimerReset:(id)a3;
- (int)proximityClientStart:(id)a3;
- (unint64_t)notificationHomePodTypeForDevice:(id)a3;
- (void)_bleActionDeviceChanged:(id)a3;
- (void)_bleActionDeviceFound:(id)a3;
- (void)_bleActionDeviceFoundCandidate:(id)a3;
- (void)_bleActionDeviceLost:(id)a3;
- (void)_bleActionDiscoveryEnsureStarted;
- (void)_bleActionDiscoveryEnsureStopped;
- (void)_bleActionScanTimerActivate;
- (void)_bleActionScanTimerFired;
- (void)_bleActionScanTimerInvalidate;
- (void)_bleDeviceNearbyEnter:(id)a3;
- (void)_bleDeviceNearbyExit:(id)a3;
- (void)_bleInfoDeviceChanged:(id)a3;
- (void)_bleInfoDeviceFound:(id)a3;
- (void)_bleInfoDeviceLost:(id)a3;
- (void)_bleInfoDiscoveryEnsureStarted;
- (void)_bleInfoDiscoveryEnsureStopped;
- (void)_bleUpdateMappingAndNearby;
- (void)_bleUpdateMappingAndNearbyCoalesced;
- (void)_bleUpdateMappingReset;
- (void)_clinkEnsureStarted;
- (void)_clinkEnsureStopped;
- (void)_clinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_clinkHomePodHandleRequest:(id)a3 responseHandler:(id)a4;
- (void)_combinedDevicePrepareForCallTransferTrigger:(id)a3;
- (void)_commonCallCountChanged;
- (void)_commonEnsureStarted;
- (void)_commonEnsureStopped;
- (void)_commonScreenStateChanged;
- (void)_commonShouldAdvertiseChanged;
- (void)_hapticsEnsurePrepared;
- (void)_hapticsEnsureStopped;
- (void)_hapticsFireNotificationSuccess;
- (void)_invalidate;
- (void)_motionEnsureStarted;
- (void)_motionEnsureStopped;
- (void)_motionUpdate:(id)a3;
- (void)_proxiedNotificationDidDismiss:(id)a3 reason:(int64_t)a4;
- (void)_proxiedNotificationWasTapped:(id)a3;
- (void)_proximityClientDeviceDidUnTrigger:(id)a3;
- (void)_proximityClientDeviceEnteredImmediate:(id)a3;
- (void)_proximityClientDeviceEnteredNearby:(id)a3;
- (void)_proximityClientDeviceExitedImmediate:(id)a3;
- (void)_proximityClientDeviceExitedNearby:(id)a3;
- (void)_proximityClientDeviceUpdated:(id)a3;
- (void)_proximityClientDeviceWasDismissed:(id)a3;
- (void)_proximityClientDeviceWasDismissed:(id)a3 reason:(int64_t)a4;
- (void)_proximityClientDeviceWasSelected:(id)a3;
- (void)_proximityClientDeviceWillTrigger:(id)a3;
- (void)_proximityClientSeedInitialDevices:(id)a3;
- (void)_proximityClientSeedWillTriggerDeviceIfNeeded:(id)a3;
- (void)_resetAllStates;
- (void)_run;
- (void)_runCallHandoffHandleDelayTimerFired;
- (void)_runCallHandoffHandleResponse:(id)a3 error:(id)a4;
- (void)_runCallHandoffStart:(id)a3;
- (void)_runCallHandoffStartDelayTimer;
- (void)_runNotificationDismissed;
- (void)_runNotificationPending;
- (void)_runNotificationPendingContent;
- (void)_runNotificationPresented;
- (void)_runNotificationReady;
- (void)_runTransferDone;
- (void)_runTransferInProgress;
- (void)_runTransferPending;
- (void)_runTransferPendingDismiss;
- (void)_runTransferReady;
- (void)_scheduleRunAfter:(double)a3;
- (void)_serviceEnsureStarted;
- (void)_serviceEnsureStopped;
- (void)_serviceTimeoutActivate;
- (void)_serviceTimeoutFired;
- (void)_serviceTimeoutInvalidate;
- (void)_throttleEventDidOccur;
- (void)_throttleEventSet:(unint64_t)a3;
- (void)_throttleEventsReset;
- (void)_throttleMediumReset;
- (void)_throttleMediumSetTicks:(unint64_t)a3;
- (void)_uiDismissWhenReady:(id)a3 reason:(int64_t)a4;
- (void)_uiStopIfNeeded:(id)a3 reason:(int64_t)a4;
- (void)_update;
- (void)_updateCandidateIsNearby;
- (void)activate;
- (void)commonSystemUIChanged;
- (void)invalidate;
- (void)notificationDidDismiss:(id)a3 reason:(int64_t)a4;
- (void)prefsChanged;
- (void)proximityClientStop:(id)a3;
- (void)proximityClientUpdate:(id)a3;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventNotifications:(BOOL)a3;
- (void)testUI:(id)a3;
- (void)userDidTapNotification:(id)a3;
@end

@implementation SDProxHandoffAgent

- (BOOL)_bleActionDiscoveryShouldStart
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (SFDeviceClassCodeGet() - 1 > 1) {
    return 0;
  }
  systemMonitor = self->_systemMonitor;

  return [(CUSystemMonitor *)systemMonitor screenOn];
}

- (void)_run
{
  v3 = [(SDProxHandoffAgent *)self _combinedDevicePending];
  uiDevice = self->_uiDevice;
  self->_uiDevice = v3;

  switch([(SFCombinedDevice *)self->_uiDevice state])
  {
    case 0xB:
      [(SDProxHandoffAgent *)self _runNotificationPending];
      break;
    case 0xC:
      [(SDProxHandoffAgent *)self _runNotificationPendingContent];
      break;
    case 0xD:
      [(SDProxHandoffAgent *)self _runNotificationReady];
      break;
    case 0xE:
      [(SDProxHandoffAgent *)self _runNotificationPresented];
      break;
    case 0xF:
      [(SDProxHandoffAgent *)self _runNotificationDismissed];
      break;
    case 0x10:
      [(SDProxHandoffAgent *)self _runTransferPending];
      break;
    case 0x11:
      [(SDProxHandoffAgent *)self _runTransferReady];
      break;
    case 0x12:
      [(SDProxHandoffAgent *)self _runTransferInProgress];
      break;
    case 0x13:
      [(SDProxHandoffAgent *)self _runTransferPendingDismiss];
      break;
    case 0x14:
      [(SDProxHandoffAgent *)self _runTransferDone];
      break;
    default:
      return;
  }
}

- (BOOL)_serviceShouldStart
{
  return SFDeviceClassCodeGet() == 4 && self->_candidateNearby || self->_prefForceShouldAdvertise;
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_prefEnabled && !self->_unansweredCall)
  {
    [(SDProxHandoffAgent *)self _commonEnsureStarted];
    if ([(SDProxHandoffAgent *)self _clinkShouldStart]) {
      [(SDProxHandoffAgent *)self _clinkEnsureStarted];
    }
    else {
      [(SDProxHandoffAgent *)self _clinkEnsureStopped];
    }
    if ([(SDProxHandoffAgent *)self _bleActionDiscoveryShouldStart]) {
      [(SDProxHandoffAgent *)self _bleActionDiscoveryEnsureStarted];
    }
    else {
      [(SDProxHandoffAgent *)self _bleActionDiscoveryEnsureStopped];
    }
    if ([(SDProxHandoffAgent *)self _bleInfoDiscoveryShouldStart]) {
      [(SDProxHandoffAgent *)self _bleInfoDiscoveryEnsureStarted];
    }
    else {
      [(SDProxHandoffAgent *)self _bleInfoDiscoveryEnsureStopped];
    }
    if ([(SDProxHandoffAgent *)self _motionShouldStart]) {
      [(SDProxHandoffAgent *)self _motionEnsureStarted];
    }
    else {
      [(SDProxHandoffAgent *)self _motionEnsureStopped];
    }
    if ([(SDProxHandoffAgent *)self _serviceShouldStart]) {
      [(SDProxHandoffAgent *)self _serviceEnsureStarted];
    }
    else {
      [(SDProxHandoffAgent *)self _serviceEnsureStopped];
    }
    [(SDProxHandoffAgent *)self _run];
  }
  else
  {
    [(SDProxHandoffAgent *)self _bleActionDiscoveryEnsureStopped];
    [(SDProxHandoffAgent *)self _bleInfoDiscoveryEnsureStopped];
    [(SDProxHandoffAgent *)self _clinkEnsureStopped];
    [(SDProxHandoffAgent *)self _motionEnsureStopped];
    [(SDProxHandoffAgent *)self _serviceEnsureStopped];
  }
}

- (BOOL)_systemCanTrigger
{
  unsigned int v3 = [(SDStatusMonitor *)self->_statusMonitor systemUIFlags];
  unsigned int v4 = [(CUSystemMonitor *)self->_systemMonitor screenOn];
  if (v4) {
    LOBYTE(v4) = !v3 && ([(CUSystemMonitor *)self->_systemMonitor screenOn] & 1) != 0
  }
              || (v3 & 0x18001) == 0;
  return v4;
}

- (id)_combinedDevicePending
{
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = sub_1000B60A8;
  v59 = sub_1000B60B8;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_1000B60A8;
  v53 = sub_1000B60B8;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_1000B60A8;
  v47 = sub_1000B60B8;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_1000B60A8;
  v41 = sub_1000B60B8;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1000B60A8;
  v35 = sub_1000B60B8;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000B60A8;
  v29 = sub_1000B60B8;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000B60A8;
  v23 = sub_1000B60B8;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1000B60A8;
  v17 = sub_1000B60B8;
  id v18 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000B60A8;
  v11 = sub_1000B60B8;
  id v12 = 0;
  mappedDevices = self->_mappedDevices;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B7CCC;
  v6[3] = &unk_1008CC3B8;
  v6[4] = self;
  v6[5] = &v49;
  v6[6] = &v37;
  v6[7] = &v43;
  v6[8] = &v25;
  v6[9] = &v19;
  v6[10] = &v31;
  v6[11] = &v13;
  v6[12] = &v55;
  v6[13] = &v7;
  [(NSMutableDictionary *)mappedDevices enumerateKeysAndObjectsUsingBlock:v6];
  unsigned int v3 = (void *)v20[5];
  if (!v3)
  {
    unsigned int v3 = (void *)v14[5];
    if (!v3)
    {
      unsigned int v3 = (void *)v26[5];
      if (!v3)
      {
        unsigned int v3 = (void *)v32[5];
        if (!v3)
        {
          unsigned int v3 = (void *)v50[5];
          if (!v3)
          {
            unsigned int v3 = (void *)v44[5];
            if (!v3)
            {
              unsigned int v3 = (void *)v38[5];
              if (!v3)
              {
                unsigned int v3 = (void *)v56[5];
                if (!v3) {
                  unsigned int v3 = (void *)v8[5];
                }
              }
            }
          }
        }
      }
    }
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v4;
}

- (void)_bleInfoDiscoveryEnsureStopped
{
  if (self->_bleInfoDiscovery)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery invalidate];
    bleInfoDiscovery = self->_bleInfoDiscovery;
    self->_bleInfoDiscovery = 0;

    [(SDProxHandoffAgent *)self _bleUpdateMappingReset];
  }
  [(NSMutableDictionary *)self->_bleInfoDevices removeAllObjects];
  bleInfoDevices = self->_bleInfoDevices;
  self->_bleInfoDevices = 0;

  [(NSMutableDictionary *)self->_bleUnmapped removeAllObjects];
  bleUnmapped = self->_bleUnmapped;
  self->_bleUnmapped = 0;
}

- (void)commonSystemUIChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AB18;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_serviceEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleActionService)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFProxHandoffService *)self->_bleActionService invalidate];
    bleActionService = self->_bleActionService;
    self->_bleActionService = 0;
  }
}

- (BOOL)_motionShouldStart
{
  return [(CUSystemMonitor *)self->_systemMonitor screenOn];
}

- (void)_motionEnsureStarted
{
  if (!self->_motionMonitorStarted)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id location = 0;
    objc_initWeak(&location, self);
    motionMonitor = self->_motionMonitor;
    id v4 = +[NSOperationQueue mainQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000B3A5C;
    v5[3] = &unk_1008CC340;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    [(CMMotionActivityManager *)motionMonitor startActivityUpdatesToQueue:v4 withHandler:v5];

    self->_motionMonitorStarted = 1;
    self->_stationary = 1;
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_commonEnsureStarted
{
  if (!self->_systemMonitor)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AEB80;
    v21[3] = &unk_1008CA4B8;
    v21[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setCallChangedHandler:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AEB88;
    v20[3] = &unk_1008CA4B8;
    v20[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AEB90;
    v19[3] = &unk_1008CA4B8;
    v19[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenLockedChangedHandler:v19];
    v5 = self->_systemMonitor;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000AEB98;
    v18[3] = &unk_1008CA4B8;
    v18[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v18];
  }
  if (!self->_bleMapCoalescer)
  {
    id v6 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    bleMapCoalescer = self->_bleMapCoalescer;
    self->_bleMapCoalescer = v6;

    [(CUCoalescer *)self->_bleMapCoalescer setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)self->_bleMapCoalescer setMaxDelay:0.05];
    [(CUCoalescer *)self->_bleMapCoalescer setMinDelay:0.05];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000AEC24;
    v17[3] = &unk_1008CA4B8;
    v17[4] = self;
    [(CUCoalescer *)self->_bleMapCoalescer setActionHandler:v17];
  }
  if (!self->_statusMonitor && SFDeviceClassCodeGet() - 1 <= 1)
  {
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"commonSystemUIChanged" name:@"com.apple.sharingd.SystemUIChanged" object:0];
    uint64_t v9 = +[SDStatusMonitor sharedMonitor];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v9;
  }
  if (!self->_motionMonitor)
  {
    v11 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionMonitor = self->_motionMonitor;
    self->_motionMonitor = v11;
  }
  if (!self->_notificationProxy)
  {
    uint64_t v13 = objc_alloc_init(SFNotificationProxy);
    notificationProxy = self->_notificationProxy;
    self->_notificationProxy = v13;

    [(SFNotificationProxy *)self->_notificationProxy setDispatchQueue:self->_dispatchQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000AEC2C;
    v16[3] = &unk_1008CC2C8;
    v16[4] = self;
    [(SFNotificationProxy *)self->_notificationProxy setDismissedHandler:v16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AEC3C;
    v15[3] = &unk_1008CC2F0;
    v15[4] = self;
    [(SFNotificationProxy *)self->_notificationProxy setTappedHandler:v15];
  }
}

- (BOOL)_clinkShouldStart
{
  return [(CUSystemMonitor *)self->_systemMonitor screenOn]
      && SFDeviceClassCodeGet() - 1 < 2
      || SFDeviceClassCodeGet() == 4;
}

- (void)_clinkEnsureStarted
{
  if (!self->_clinkClient)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    unsigned int v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    clinkClient = self->_clinkClient;
    self->_clinkClient = v3;

    [(RPCompanionLinkClient *)self->_clinkClient setControlFlags:2052];
    [(RPCompanionLinkClient *)self->_clinkClient setDispatchQueue:self->_dispatchQueue];
    if (SFDeviceClassCodeGet() - 1 <= 1) {
      [(RPCompanionLinkClient *)self->_clinkClient setFlags:[(RPCompanionLinkClient *)self->_clinkClient flags] | 2];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000B33F4;
    v12[3] = &unk_1008CA4B8;
    v12[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setInterruptionHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B33FC;
    v11[3] = &unk_1008CA850;
    v11[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setDeviceChangedHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B34B0;
    v10[3] = &unk_1008CA828;
    v10[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setDeviceFoundHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B3554;
    v9[3] = &unk_1008CA828;
    v9[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setDeviceLostHandler:v9];
    v5 = self->_clinkClient;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B35F8;
    v8[3] = &unk_1008CA5A8;
    v8[4] = self;
    [(RPCompanionLinkClient *)v5 activateWithCompletion:v8];
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = self->_clinkClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B36E8;
    v7[3] = &unk_1008CB5B8;
    v7[4] = self;
    [(RPCompanionLinkClient *)v6 registerRequestID:@"com.apple.sharing.calltransfer" options:0 handler:v7];
  }
}

- (BOOL)_bleInfoDiscoveryShouldStart
{
  return SFDeviceClassCodeGet() == 4;
}

- (void)_bleActionDiscoveryEnsureStarted
{
  if (!self->_proximityController)
  {
    unsigned int v3 = +[SDProximityController sharedController];
    proximityController = self->_proximityController;
    self->_proximityController = v3;
  }
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery) {
    goto LABEL_33;
  }
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  uint64_t v7 = self->_bleActionDiscovery;
  self->_bleActionDiscovery = v6;

  uint64_t v8 = self->_stationary ? 9 : 29;
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setChangeFlags:v8];
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setDiscoveryFlags:8388624];
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setDispatchQueue:self->_dispatchQueue];
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setPurpose:@"HandoffAction"];
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setRssiThreshold:-60];
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setFastScanMode:2];
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setScanRate:20];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B11D4;
  v15[3] = &unk_1008CADB8;
  v15[4] = self;
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setDeviceFoundHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B11E0;
  v14[3] = &unk_1008CADB8;
  v14[4] = self;
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setDeviceLostHandler:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B11EC;
  v13[3] = &unk_1008CADE0;
  v13[4] = self;
  [(SFDeviceDiscovery *)self->_bleActionDiscovery setDeviceChangedHandler:v13];
  uint64_t v9 = self->_bleActionDiscovery;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B11F8;
  v12[3] = &unk_1008CA5A8;
  v12[4] = self;
  [(SFDeviceDiscovery *)v9 activateWithCompletion:v12];
  [(SDProxHandoffAgent *)self _bleActionScanTimerActivate];
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
  {
LABEL_33:
    if (self->_prefHighNormal)
    {
      if (self->_stationary && (uint64_t)[(SFDeviceDiscovery *)bleActionDiscovery scanRate] > 10
        || self->_bleActionScanTimedOut)
      {
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(SFDeviceDiscovery *)self->_bleActionDiscovery setChangeFlags:9];
        [(SFDeviceDiscovery *)self->_bleActionDiscovery setFastScanMode:2];
        [(SFDeviceDiscovery *)self->_bleActionDiscovery setScanRate:10];
        [(SDProxHandoffAgent *)self _bleActionScanTimerInvalidate];
      }
      else if (!self->_stationary)
      {
        v10 = [(NSMutableDictionary *)self->_mappedDevices allKeys];
        if ([v10 count])
        {
          uint64_t v11 = (uint64_t)[(SFDeviceDiscovery *)self->_bleActionDiscovery scanRate];

          if (v11 <= 29)
          {
            if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            [(SFDeviceDiscovery *)self->_bleActionDiscovery setChangeFlags:29];
            [(SFDeviceDiscovery *)self->_bleActionDiscovery setFastScanMode:0];
            [(SFDeviceDiscovery *)self->_bleActionDiscovery setScanRate:30];
            [(SDProxHandoffAgent *)self _bleActionScanTimerActivate];
          }
        }
        else
        {
        }
      }
    }
  }
}

+ (id)sharedAgent
{
  if (qword_10097FD80 != -1) {
    dispatch_once(&qword_10097FD80, &stru_1008CC2A0);
  }
  v2 = (void *)qword_10097FD88;

  return v2;
}

- (SDProxHandoffAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDProxHandoffAgent;
  v2 = [(SDProxHandoffAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"-- SDProxHandoffAgent --\n"];
  if (self->_prefEnabled) {
    id v4 = "yes";
  }
  else {
    id v4 = "no";
  }
  if (self->_userOnCall) {
    v5 = "yes";
  }
  else {
    v5 = "no";
  }
  if (self->_clientShouldAdvertise) {
    objc_super v6 = "yes";
  }
  else {
    objc_super v6 = "no";
  }
  if (self->_candidateNearby) {
    uint64_t v7 = "yes";
  }
  else {
    uint64_t v7 = "no";
  }
  [v3 appendFormat:@"Enabled: %s, On call: %s, client should advertise: %s, Candidate nearby: %s\n", v4, v5, v6, v7];
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    uint64_t v9 = clinkClient;
    v10 = [(RPCompanionLinkClient *)v9 activeDevices];
    [v3 appendFormat:@"CLinkClient (%ld devices): %@\n", [v10 count], v9];
  }
  if (self->_bleActionService) {
    [v3 appendFormat:@"BLE Action Service: %@\n", self->_bleActionService];
  }
  if ([(NSMutableSet *)self->_proxClients count]) {
    [v3 appendFormat:@"ProxClients: (%ld)\n", -[NSMutableSet count](self->_proxClients, "count")];
  }
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
  {
    id v12 = [(NSMutableDictionary *)self->_bleActionDevices count];
    if (self->_bleActionScanTimedOut) {
      CFStringRef v13 = @", TIMED OUT";
    }
    else {
      CFStringRef v13 = &stru_1008E7020;
    }
    [v3 appendFormat:@"BLE NearbyAction Discovery: %@, %ld devices%@\n", bleActionDiscovery, v12, v13];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v14 = [(NSMutableDictionary *)self->_bleActionDevices allValues];
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          [v3 appendFormat:@" - %@\n", *(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v16);
    }
  }
  if (self->_bleInfoDiscovery) {
    [v3 appendFormat:@"BLE NearbyInfo Discovery: %@\n", self->_bleInfoDiscovery];
  }
  [v3 appendFormat:@"Mapped Devices (%ld), unmapped (%ld):\n", -[NSMutableDictionary count](self->_mappedDevices, "count"), -[NSMutableDictionary count](self->_bleUnmapped, "count")];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = [(NSMutableDictionary *)self->_mappedDevices allValues];
  id v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        [v3 appendFormat:@" - %@", *(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
        [v3 appendFormat:@"\n"];
      }
      id v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }

  uiDevice = self->_uiDevice;
  if (uiDevice)
  {
    uint64_t v25 = uiDevice;
    v26 = sub_1000AC00C([(SFCombinedDevice *)v25 nextState]);
    [v3 appendFormat:@"UI Device: (next state = %@)\n - %@\n", v26, v25];
  }
  uint64_t v27 = [(SDProxHandoffAgent *)self currentCall];
  v28 = v27;
  if (v27)
  {
    v29 = [v27 callUUID];
    [v3 appendFormat:@"Current Call:\n - %@\n", v29];
  }
  [(SDStatusMonitor *)self->_statusMonitor systemUIFlags];
  [(SDProxHandoffAgent *)self _systemCanTrigger];
  NSAppendPrintF();
  id v30 = v3;

  NSAppendPrintF();
  id v31 = v30;

  return (NSString *)v31;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ADF5C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE054;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDProxHandoffAgent *)self _bleActionDiscoveryEnsureStopped];
  [(SDProxHandoffAgent *)self _bleInfoDiscoveryEnsureStopped];
  [(SDProxHandoffAgent *)self _commonEnsureStopped];
  [(SDProxHandoffAgent *)self _clinkEnsureStopped];
  [(SDProxHandoffAgent *)self _serviceEnsureStopped];
  [(NSMutableSet *)self->_proxClients removeAllObjects];
  proxClients = self->_proxClients;
  self->_proxClients = 0;
}

- (void)prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefEnabled != v3)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v4 = "yes";
      if (v3) {
        v5 = "no";
      }
      else {
        v5 = "yes";
      }
      if (!v3) {
        id v4 = "no";
      }
      double v40 = *(double *)&v5;
      double v41 = *(double *)&v4;
      LogPrintF();
    }
    self->_prefEnabled = v3;
  }
  CFPrefs_GetDouble();
  double v7 = v6;
  double prefBLEActionScanSecs = self->_prefBLEActionScanSecs;
  if (v7 != prefBLEActionScanSecs)
  {
    if (dword_100966E40 <= 30)
    {
      if (dword_100966E40 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_17;
        }
        double prefBLEActionScanSecs = self->_prefBLEActionScanSecs;
      }
      double v40 = prefBLEActionScanSecs;
      double v41 = v7;
      LogPrintF();
    }
LABEL_17:
    self->_double prefBLEActionScanSecs = v7;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefForceShouldAdvertise != v9)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      v10 = "yes";
      if (v9) {
        uint64_t v11 = "no";
      }
      else {
        uint64_t v11 = "yes";
      }
      if (!v9) {
        v10 = "no";
      }
      double v40 = *(double *)&v11;
      double v41 = *(double *)&v10;
      LogPrintF();
    }
    self->_prefForceShouldAdvertise = v9;
    [(SDProxHandoffAgent *)self _commonShouldAdvertiseChanged];
  }
  BOOL v12 = CFPrefs_GetInt64() != 0;
  if (self->_prefForceStationary != v12)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v13 = "yes";
      if (v12) {
        v14 = "no";
      }
      else {
        v14 = "yes";
      }
      if (!v12) {
        CFStringRef v13 = "no";
      }
      double v40 = *(double *)&v14;
      double v41 = *(double *)&v13;
      LogPrintF();
    }
    self->_prefForceStationary = v12;
    -[SDProxHandoffAgent _motionUpdate:](self, "_motionUpdate:", 0, *(void *)&v40, *(void *)&v41);
  }
  BOOL v15 = CFPrefs_GetInt64() != 0;
  if (self->_prefHighNormal != v15)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v16 = "yes";
      if (v15) {
        uint64_t v17 = "no";
      }
      else {
        uint64_t v17 = "yes";
      }
      if (!v15) {
        id v16 = "no";
      }
      double v40 = *(double *)&v17;
      double v41 = *(double *)&v16;
      LogPrintF();
    }
    self->_prefHighNormal = v15;
    [(SDProxHandoffAgent *)self _bleActionDiscoveryEnsureStopped];
  }
  BOOL v18 = CFPrefs_GetInt64() != 0;
  if (self->_prefForceOnCall != v18)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = "yes";
      if (v18) {
        id v20 = "no";
      }
      else {
        id v20 = "yes";
      }
      if (!v18) {
        uint64_t v19 = "no";
      }
      double v40 = *(double *)&v20;
      double v41 = *(double *)&v19;
      LogPrintF();
    }
    self->_prefForceOnCall = v18;
    [(SDProxHandoffAgent *)self _commonCallCountChanged];
  }
  int v21 = CFPrefs_GetInt64() != 0;
  int prefIgnoreMediumThrottle = self->_prefIgnoreMediumThrottle;
  if (prefIgnoreMediumThrottle != v21)
  {
    if (dword_100966E40 <= 30)
    {
      if (dword_100966E40 != -1)
      {
LABEL_65:
        v23 = "yes";
        if (prefIgnoreMediumThrottle) {
          id v24 = "yes";
        }
        else {
          id v24 = "no";
        }
        if (!v21) {
          v23 = "no";
        }
        double v40 = *(double *)&v24;
        double v41 = *(double *)&v23;
        LogPrintF();
        goto LABEL_72;
      }
      if (_LogCategory_Initialize())
      {
        int prefIgnoreMediumThrottle = self->_prefIgnoreMediumThrottle;
        goto LABEL_65;
      }
    }
LABEL_72:
    self->_int prefIgnoreMediumThrottle = v21;
  }
  BOOL v25 = CFPrefs_GetInt64() != 0;
  if (self->_prefMediumBubbleEnabled != v25)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      v26 = "yes";
      if (v25) {
        uint64_t v27 = "no";
      }
      else {
        uint64_t v27 = "yes";
      }
      if (!v25) {
        v26 = "no";
      }
      double v40 = *(double *)&v27;
      double v41 = *(double *)&v26;
      LogPrintF();
    }
    self->_prefMediumBubbleEnabled = v25;
  }
  unint64_t Int64 = CFPrefs_GetInt64();
  unint64_t prefMediumBubbleLastTicks = self->_prefMediumBubbleLastTicks;
  if (Int64 != prefMediumBubbleLastTicks)
  {
    if (dword_100966E40 <= 30)
    {
      if (dword_100966E40 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_89;
        }
        unint64_t prefMediumBubbleLastTicks = self->_prefMediumBubbleLastTicks;
      }
      double v40 = *(double *)&prefMediumBubbleLastTicks;
      double v41 = *(double *)&Int64;
      LogPrintF();
    }
LABEL_89:
    self->_unint64_t prefMediumBubbleLastTicks = Int64;
  }
  CFPrefs_GetDouble();
  double v31 = v30;
  double prefRetriggerSecs = self->_prefRetriggerSecs;
  if (v31 == prefRetriggerSecs) {
    goto LABEL_96;
  }
  if (dword_100966E40 <= 30)
  {
    if (dword_100966E40 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      double prefRetriggerSecs = self->_prefRetriggerSecs;
    }
    double v40 = prefRetriggerSecs;
    double v41 = v31;
    LogPrintF();
  }
LABEL_95:
  self->_double prefRetriggerSecs = v31;
LABEL_96:
  CFPrefs_GetDouble();
  double v34 = v33;
  double prefTransferSecs = self->_prefTransferSecs;
  if (v34 == prefTransferSecs) {
    goto LABEL_102;
  }
  if (dword_100966E40 <= 30)
  {
    if (dword_100966E40 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_101;
      }
      double prefTransferSecs = self->_prefTransferSecs;
    }
    double v40 = prefTransferSecs;
    double v41 = v34;
    LogPrintF();
  }
LABEL_101:
  self->_double prefTransferSecs = v34;
LABEL_102:
  unint64_t v36 = CFPrefs_GetInt64();
  unint64_t prefThrottleEventCount = self->_prefThrottleEventCount;
  if (v36 == prefThrottleEventCount) {
    goto LABEL_108;
  }
  if (dword_100966E40 <= 30)
  {
    if (dword_100966E40 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_107;
      }
      unint64_t prefThrottleEventCount = self->_prefThrottleEventCount;
    }
    double v40 = *(double *)&prefThrottleEventCount;
    double v41 = *(double *)&v36;
    LogPrintF();
  }
LABEL_107:
  self->_unint64_t prefThrottleEventCount = v36;
LABEL_108:
  unint64_t v38 = CFPrefs_GetInt64();
  unint64_t prefThrottleEventMax = self->_prefThrottleEventMax;
  if (v38 != prefThrottleEventMax)
  {
    if (dword_100966E40 <= 30)
    {
      if (dword_100966E40 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_113;
        }
        unint64_t prefThrottleEventMax = self->_prefThrottleEventMax;
      }
      double v40 = *(double *)&prefThrottleEventMax;
      double v41 = *(double *)&v38;
      LogPrintF();
    }
LABEL_113:
    self->_unint64_t prefThrottleEventMax = v38;
  }
  [(SDProxHandoffAgent *)self _update];
}

- (void)setPreventNotifications:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AEA08;
  v4[3] = &unk_1008CB9D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_updateCandidateIsNearby
{
  BOOL v3 = [(NSMutableDictionary *)self->_mappedDevices count] != 0;
  if (self->_candidateNearby != v3)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_candidateNearby = v3;
  }
}

- (void)_commonEnsureStopped
{
  if (self->_systemMonitor)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;
  }
  bleMapCoalescer = self->_bleMapCoalescer;
  if (bleMapCoalescer)
  {
    [(CUCoalescer *)bleMapCoalescer invalidate];
    BOOL v5 = self->_bleMapCoalescer;
    self->_bleMapCoalescer = 0;
  }
  if (self->_statusMonitor)
  {
    double v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:@"com.apple.sharingd.SystemUIChanged" object:0];

    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;
  }
  motionMonitor = self->_motionMonitor;
  if (motionMonitor)
  {
    self->_motionMonitor = 0;
  }
  notificationProxy = self->_notificationProxy;
  if (notificationProxy)
  {
    [(SFNotificationProxy *)notificationProxy setDismissedHandler:0];
    [(SFNotificationProxy *)self->_notificationProxy setTappedHandler:0];
    v10 = self->_notificationProxy;
    self->_notificationProxy = 0;
  }

  [(SDProxHandoffAgent *)self _hapticsEnsureStopped];
}

- (void)_commonCallCountChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v3 = self->_systemMonitor;
  if (v3)
  {
    int v21 = v3;
    id v4 = (const char *)[(CUSystemMonitor *)v3 activeCallCount];
    BOOL v5 = (const char *)[(CUSystemMonitor *)v21 connectedCallCount];
    BOOL v6 = (int)v5 > 0 || self->_prefForceOnCall;
    BOOL userOnCall = self->_userOnCall;
    self->_BOOL userOnCall = v6;
    if (dword_100966E40 <= 30)
    {
      if (dword_100966E40 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_17;
        }
        BOOL v6 = self->_userOnCall;
      }
      uint64_t v8 = "no";
      if (userOnCall) {
        BOOL v9 = "yes";
      }
      else {
        BOOL v9 = "no";
      }
      if (v6) {
        v10 = "yes";
      }
      else {
        v10 = "no";
      }
      if (self->_prefForceOnCall) {
        uint64_t v8 = "yes";
      }
      uint64_t v19 = v10;
      id v20 = v8;
      uint64_t v17 = v5;
      BOOL v18 = v9;
      id v16 = v4;
      LogPrintF();
    }
LABEL_17:
    BOOL v12 = (int)v5 < 1 && (int)v4 > 0;
    if (self->_unansweredCall != v12)
    {
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v13 = "yes";
        if (v12) {
          v14 = "no";
        }
        else {
          v14 = "yes";
        }
        if (!v12) {
          CFStringRef v13 = "no";
        }
        id v16 = v14;
        uint64_t v17 = v13;
        LogPrintF();
      }
      self->_unansweredCall = v12;
    }
    if (!userOnCall || self->_userOnCall)
    {
      if (userOnCall || !self->_userOnCall || self->_prefForceOnCall) {
        goto LABEL_50;
      }
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (self->_prefForceOnCall)
      {
LABEL_50:
        [(SDProxHandoffAgent *)self _update];
        BOOL v3 = v21;
        goto LABEL_51;
      }
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uiDevice = self->_uiDevice;
      if (uiDevice) {
        [(SDProxHandoffAgent *)self _uiStopIfNeeded:uiDevice reason:4];
      }
    }
    [(SDProxHandoffAgent *)self _resetAllStates];
    goto LABEL_50;
  }
LABEL_51:
}

- (void)_commonShouldAdvertiseChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = self->_proxClients;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v17 + 1) + 8 * i) shouldAdvertise];
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  BOOL prefForceShouldAdvertise = self->_prefForceShouldAdvertise;
  int v10 = prefForceShouldAdvertise | v6 & 1;
  if (v10 != self->_clientShouldAdvertise)
  {
    if (dword_100966E40 <= 30)
    {
      if (dword_100966E40 != -1)
      {
LABEL_13:
        if (v10) {
          uint64_t v11 = "no";
        }
        else {
          uint64_t v11 = "yes";
        }
        if (v10) {
          BOOL v12 = "yes";
        }
        else {
          BOOL v12 = "no";
        }
        if (prefForceShouldAdvertise) {
          CFStringRef v13 = "yes";
        }
        else {
          CFStringRef v13 = "no";
        }
        BOOL v15 = v12;
        id v16 = v13;
        v14 = v11;
        LogPrintF();
        goto LABEL_24;
      }
      if (_LogCategory_Initialize())
      {
        BOOL prefForceShouldAdvertise = self->_prefForceShouldAdvertise;
        goto LABEL_13;
      }
    }
LABEL_24:
    self->_clientShouldAdvertise = v10;
  }
  [(SDProxHandoffAgent *)self _update];
}

- (void)_commonScreenStateChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned __int8 v3 = [(CUSystemMonitor *)self->_systemMonitor screenOn];
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    [(CUSystemMonitor *)self->_systemMonitor screenLocked];
    LogPrintF();
  }
  if ((v3 & 1) == 0)
  {
    [(SDProxHandoffAgent *)self _bleUpdateMappingReset];
    [(SFNotificationProxy *)self->_notificationProxy requestRemoveAll];
    id v4 = +[SDNearbyAgent sharedNearbyAgent];
    [v4 bleProximityEstimatorsResetDeviceClose];
  }

  [(SDProxHandoffAgent *)self _update];
}

- (void)_scheduleRunAfter:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF374;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_after(v4, dispatchQueue, block);
}

- (BOOL)_runStateVerify:(int)a3 device:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 state];
  if (v6 != a3 && dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = sub_1000AC00C((int)[v5 state]);
    BOOL v9 = sub_1000AC00C(a3);
    LogPrintF();
  }
  return v6 == a3;
}

- (void)_runNotificationPending
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    BOOL v12 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:11 device:v3];
    unsigned __int8 v3 = v12;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v12 nextState];
      unsigned __int8 v3 = v12;
      if (v5 == 13)
      {
        if (dword_100966E40 <= 30)
        {
          if (dword_100966E40 != -1 || (v6 = _LogCategory_Initialize(), unsigned __int8 v3 = v12, v6))
          {
            uint64_t v11 = v3;
            LogPrintF();
            unsigned __int8 v3 = v12;
          }
        }
        if (self->_userOnCall) {
          [(SDProxHandoffAgent *)self _combinedDevicePrepareForCallTransferTrigger:v3];
        }
        else {
          [(SFCombinedDevice *)v3 setNotificationType:2];
        }
        uint64_t v7 = [(SFCombinedDevice *)v12 effectiveID];
        if (v7)
        {
          unsigned int v8 = [(SFCombinedDevice *)v12 notificationType];
          if (v8 == 2)
          {
            if ([(SFCombinedDevice *)v12 canTransition:12])
            {
              [(SFCombinedDevice *)v12 setPendingContentTicks:mach_absolute_time()];
              [(SFCombinedDevice *)v12 setState:12];
              BOOL v9 = [(SFCombinedDevice *)v12 notificationInfo];
              if (v9) {
                uint64_t v10 = 13;
              }
              else {
                uint64_t v10 = 0;
              }
              [(SFCombinedDevice *)v12 setNextState:v10];

              [(SDProxHandoffAgent *)self _proximityClientDeviceWillTrigger:v7];
              goto LABEL_24;
            }
LABEL_32:

            unsigned __int8 v3 = v12;
            goto LABEL_33;
          }
          if (v8 == 3)
          {
            if ([(SFCombinedDevice *)v12 canTransition:13])
            {
              [(SFCombinedDevice *)v12 setPendingContentTicks:mach_absolute_time()];
              [(SFCombinedDevice *)v12 setState:13];
              [(SFCombinedDevice *)v12 setNextState:14];
LABEL_24:
              [(SDProxHandoffAgent *)self _run];
              goto LABEL_32;
            }
            goto LABEL_32;
          }
          if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_32;
          }
          [(SFCombinedDevice *)v12 notificationType];
        }
        else if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_32;
        }
        LogPrintF();
        goto LABEL_32;
      }
    }
  }
LABEL_33:
}

- (void)_runNotificationPendingContent
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    BOOL v12 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:12 device:v3];
    unsigned __int8 v3 = v12;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v12 nextState];
      unsigned __int8 v3 = v12;
      if (v5 == 13)
      {
        int v6 = [(SFCombinedDevice *)v12 notificationInfo];
        if (v6)
        {
          mach_absolute_time();
          [(SFCombinedDevice *)v12 pendingContentTicks];
          UpTicksToSecondsF();
          uint64_t v8 = v7;
          -[SFCombinedDevice setPendingContentDurationSecs:](v12, "setPendingContentDurationSecs:");
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v11 = v8;
            uint64_t v10 = v12;
            LogPrintF();
          }
          if (-[SFCombinedDevice canTransition:](v12, "canTransition:", 13, v10, v11))
          {
            [(SFCombinedDevice *)v12 setState:13];
            if ([(SDProxHandoffAgent *)self _shouldMediumPromptWithInfo:v6]) {
              uint64_t v9 = 14;
            }
            else {
              uint64_t v9 = 0;
            }
            [(SFCombinedDevice *)v12 setNextState:v9];
            [(SDProxHandoffAgent *)self _run];
          }
        }
        else if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        unsigned __int8 v3 = v12;
      }
    }
  }
}

- (void)_runNotificationReady
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3
    && [(SDProxHandoffAgent *)self _runStateVerify:13 device:v3]
    && ([(SFCombinedDevice *)v3 nextState] == 14 || [(SFCombinedDevice *)v3 nextState] == 16)
    && [(SFCombinedDevice *)v3 canTransition:14])
  {
    if ([(SDProxHandoffAgent *)self _systemCanTrigger])
    {
      unsigned int v4 = [(SFCombinedDevice *)v3 effectiveID];
      if (!v4)
      {
        if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_66;
      }
      unsigned int v5 = [(SFCombinedDevice *)v3 notificationInfo];
      if (!v5)
      {
        if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_65;
        }
LABEL_21:
        LogPrintF();
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      if (self->_stationary)
      {
        if (dword_100966E40 > 60 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_65;
        }
        goto LABEL_21;
      }
      unsigned int v6 = [(SFCombinedDevice *)v3 nextState];
      if (v6 == 14)
      {
        id v7 = [v5 mediumBubbleVersion];
        uint64_t v10 = [(SFCombinedDevice *)v3 bleDevice];
        uint64_t v11 = [v10 bleDevice];
        if ([v11 insideSmallBubble]) {
          uint64_t v9 = 16;
        }
        else {
          uint64_t v9 = 0;
        }

        if (v7)
        {
          uint64_t v8 = 1;
          goto LABEL_34;
        }
      }
      else if (v6 == 16)
      {
        id v7 = v5;
        uint64_t v8 = 0;
        uint64_t v9 = 16;
LABEL_34:
        mach_absolute_time();
        [(SFCombinedDevice *)v3 pendingContentTicks];
        UpTicksToSecondsF();
        if (v8 && (double v13 = 0.25 - v12, 0.25 - v12 > 0.0))
        {
          if (![(SFCombinedDevice *)v3 medBubbleDelayed])
          {
            if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
            {
              double v18 = v13;
              uint64_t v17 = 0x3FD0000000000000;
              LogPrintF();
            }
            -[SFCombinedDevice setMedBubbleDelayed:](v3, "setMedBubbleDelayed:", 1, v17, *(void *)&v18);
            [(SDProxHandoffAgent *)self _scheduleRunAfter:v13];
          }
        }
        else
        {
          [(SFCombinedDevice *)v3 setMedBubbleDelayed:0];
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v17 = (uint64_t)v3;
            LogPrintF();
          }
          [(SFCombinedDevice *)v3 setNotificationTicks:mach_absolute_time()];
          [(SFCombinedDevice *)v3 setState:14];
          [(SFCombinedDevice *)v3 setNextState:v9];
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            v14 = "no";
            if (v8) {
              v14 = "yes";
            }
            uint64_t v17 = (uint64_t)v4;
            double v18 = *(double *)&v14;
            LogPrintF();
          }
          -[SFNotificationProxy requestPostOrUpdate:info:mediumVariant:](self->_notificationProxy, "requestPostOrUpdate:info:mediumVariant:", v4, v7, v8, v17, *(void *)&v18);
          if (v8) {
            [(SDProxHandoffAgent *)self _throttleMediumSetTicks:mach_absolute_time()];
          }
          v19[0] = @"notificationType";
          BOOL v15 = +[NSNumber numberWithUnsignedInt:[(SFCombinedDevice *)v3 notificationType]];
          v19[1] = @"uiID";
          v20[0] = v15;
          v20[1] = v4;
          id v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
          SFMetricsLog();

          [(SDProxHandoffAgent *)self _run];
        }
LABEL_64:

        goto LABEL_65;
      }
      if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v7 = 0;
      goto LABEL_64;
    }
    if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_67:
}

- (void)_runNotificationPresented
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    id v16 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:14 device:v3];
    unsigned __int8 v3 = v16;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v16 nextState];
      unsigned __int8 v3 = v16;
      if (v5 == 16
        || (v6 = [(SFCombinedDevice *)v16 nextState], unsigned __int8 v3 = v16, v6 == 18)
        || (v7 = [(SFCombinedDevice *)v16 nextState], unsigned __int8 v3 = v16, v7 == 15))
      {
        if (dword_100966E40 <= 30)
        {
          if (dword_100966E40 != -1 || (v8 = _LogCategory_Initialize(), unsigned __int8 v3 = v16, v8))
          {
            BOOL v15 = v3;
            LogPrintF();
            unsigned __int8 v3 = v16;
          }
        }
        id v9 = (id)[(SFCombinedDevice *)v3 nextState];
        id v10 = v9;
        if (v9 == 18)
        {
          unsigned int v12 = [(SFCombinedDevice *)v16 canTransition:18];
          unsigned __int8 v3 = v16;
          if (!v12) {
            goto LABEL_21;
          }
          [(SFCombinedDevice *)v16 setDismissReason:3];
          [(SFCombinedDevice *)v16 setTransferPendingStartTicks:mach_absolute_time()];
          goto LABEL_17;
        }
        if (v9 == 16)
        {
          unsigned int v14 = [(SFCombinedDevice *)v16 canTransition:16];
          unsigned __int8 v3 = v16;
          if (!v14) {
            goto LABEL_21;
          }
          [(SFCombinedDevice *)v16 setTransferPendingStartTicks:mach_absolute_time()];
          uint64_t v13 = 17;
          goto LABEL_20;
        }
        unsigned __int8 v3 = v16;
        if (v9 == 15)
        {
          unsigned int v11 = [(SFCombinedDevice *)v16 canTransition:15];
          unsigned __int8 v3 = v16;
          if (v11)
          {
            [(SFCombinedDevice *)v16 setNotificationInfo:0];
            [(SFCombinedDevice *)v16 setNotificationType:0];
            [(SFCombinedDevice *)v16 setTransferDoneTicks:mach_absolute_time()];
LABEL_17:
            uint64_t v13 = 0;
LABEL_20:
            [(SFCombinedDevice *)v16 setState:v10];
            [(SFCombinedDevice *)v16 setNextState:v13];
            [(SDProxHandoffAgent *)self _run];
            unsigned __int8 v3 = v16;
          }
        }
      }
    }
  }
LABEL_21:
}

- (void)_runNotificationDismissed
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    BOOL v15 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:15 device:v3];
    unsigned __int8 v3 = v15;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v15 nextState];
      unsigned __int8 v3 = v15;
      if (v5 == 10 || (v6 = [(SFCombinedDevice *)v15 nextState], unsigned __int8 v3 = v15, v6 == 16))
      {
        if (dword_100966E40 <= 30)
        {
          if (dword_100966E40 != -1 || (v7 = _LogCategory_Initialize(), unsigned __int8 v3 = v15, v7))
          {
            unsigned int v14 = v3;
            LogPrintF();
            unsigned __int8 v3 = v15;
          }
        }
        unsigned int v8 = [(SFCombinedDevice *)v3 nextState];
        if (v8 == 16)
        {
          unsigned int v11 = [(SFCombinedDevice *)v15 canTransition:16];
          unsigned __int8 v3 = v15;
          if (!v11) {
            goto LABEL_18;
          }
          [(SFCombinedDevice *)v15 setTransferPendingStartTicks:mach_absolute_time()];
          [(SFCombinedDevice *)v15 setState:16];
          unsigned int v12 = [(SFCombinedDevice *)v15 notificationInfo];
          unsigned int v13 = [v12 interactionBehavior];

          if (v13 == 1) {
            uint64_t v10 = 17;
          }
          else {
            uint64_t v10 = 0;
          }
          goto LABEL_17;
        }
        unsigned __int8 v3 = v15;
        if (v8 == 10)
        {
          unsigned int v9 = [(SFCombinedDevice *)v15 canTransition:10];
          unsigned __int8 v3 = v15;
          if (v9)
          {
            [(SFCombinedDevice *)v15 resetTicks];
            [(SFCombinedDevice *)v15 setState:10];
            uint64_t v10 = 0;
LABEL_17:
            [(SFCombinedDevice *)v15 setNextState:v10];
            [(SDProxHandoffAgent *)self _run];
            unsigned __int8 v3 = v15;
          }
        }
      }
    }
  }
LABEL_18:
}

- (void)_runTransferInProgress
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    unsigned int v12 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:18 device:v3];
    unsigned __int8 v3 = v12;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v12 nextState];
      unsigned __int8 v3 = v12;
      if (v5 == 19 || (v6 = [(SFCombinedDevice *)v12 nextState], unsigned __int8 v3 = v12, v6 == 20))
      {
        if (dword_100966E40 <= 30)
        {
          if (dword_100966E40 != -1 || (v7 = _LogCategory_Initialize(), unsigned __int8 v3 = v12, v7))
          {
            unsigned int v11 = v3;
            LogPrintF();
            unsigned __int8 v3 = v12;
          }
        }
        unsigned int v8 = [(SFCombinedDevice *)v3 nextState];
        if (v8 == 20)
        {
          unsigned int v10 = [(SFCombinedDevice *)v12 canTransition:20];
          unsigned __int8 v3 = v12;
          if (!v10) {
            goto LABEL_16;
          }
          [(SFCombinedDevice *)v12 setState:20];
          [(SFCombinedDevice *)v12 setTransferDoneTicks:mach_absolute_time()];
          [(SFCombinedDevice *)v12 setNextState:0];
          [(SDProxHandoffAgent *)self _uiStopIfNeeded:v12 reason:[(SFCombinedDevice *)v12 dismissReason]];
          [(SFCombinedDevice *)v12 setDismissReason:0];
          goto LABEL_15;
        }
        unsigned __int8 v3 = v12;
        if (v8 == 19)
        {
          unsigned int v9 = [(SFCombinedDevice *)v12 canTransition:19];
          unsigned __int8 v3 = v12;
          if (v9)
          {
            [(SFCombinedDevice *)v12 setState:19];
            [(SFCombinedDevice *)v12 setNextState:20];
LABEL_15:
            [(SDProxHandoffAgent *)self _run];
            unsigned __int8 v3 = v12;
          }
        }
      }
    }
  }
LABEL_16:
}

- (void)_runTransferPending
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    long long v20 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:16 device:v3];
    unsigned __int8 v3 = v20;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v20 nextState];
      unsigned __int8 v3 = v20;
      if (v5 == 18 || (v6 = [(SFCombinedDevice *)v20 nextState], unsigned __int8 v3 = v20, v6 == 17))
      {
        if ([(SFCombinedDevice *)v3 transferPendingStartTicks] == -1)
        {
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            double v19 = *(double *)&v20;
            LogPrintF();
          }
          [(SFCombinedDevice *)v20 setTransferPendingStartTicks:mach_absolute_time()];
        }
        mach_absolute_time();
        [(SFCombinedDevice *)v20 transferPendingStartTicks];
        UpTicksToSecondsF();
        double v8 = v7;
        unsigned __int8 v3 = v20;
        if (v7 >= self->_prefTransferSecs)
        {
          if (dword_100966E40 <= 30)
          {
            if (dword_100966E40 != -1 || (v9 = _LogCategory_Initialize(), unsigned __int8 v3 = v20, v9))
            {
              double v19 = v8;
              LogPrintF();
              unsigned __int8 v3 = v20;
            }
          }
          -[SFCombinedDevice setTransferPendingDurationSecs:](v3, "setTransferPendingDurationSecs:", v8, *(void *)&v19);
          unsigned int v10 = [(SFCombinedDevice *)v20 nextState];
          if (v10 == 17)
          {
            unsigned int v12 = [(SFCombinedDevice *)v20 canTransition:17];
            unsigned __int8 v3 = v20;
            if (!v12) {
              goto LABEL_34;
            }
            uint64_t v13 = [(SFCombinedDevice *)v20 effectiveID];
            if (v13)
            {
              unsigned int v14 = (void *)v13;
              if (self->_userOnCall)
              {
                BOOL v15 = [(SFCombinedDevice *)v20 notificationInfo];
                unsigned int v16 = [v15 notificationType];

                if (v16 == 2) {
                  [(SDProxHandoffAgent *)self _combinedDevicePrepareForCallTransferTrigger:v20];
                }
              }
              uint64_t v17 = [(SFCombinedDevice *)v20 notificationInfo];
              if (v17)
              {
                if ([(SFCombinedDevice *)v20 notificationTicks] == -1) {
                  [(SFCombinedDevice *)v20 setNotificationTicks:mach_absolute_time()];
                }
                [(SFNotificationProxy *)self->_notificationProxy requestPostOrUpdate:v14 info:v17 mediumVariant:0];
                [(SDProxHandoffAgent *)self _hapticsFireNotificationSuccess];

                [(SFCombinedDevice *)v20 setTransferPendingStartTicks:-1];
                [(SFCombinedDevice *)v20 setState:17];
                [(SFCombinedDevice *)v20 setNextState:18];

                [(SDProxHandoffAgent *)self _run];
                [(SDProxHandoffAgent *)self _throttleEventDidOccur];
                goto LABEL_33;
              }

              [(SFCombinedDevice *)v20 setTransferPendingStartTicks:-1];
              [(SFCombinedDevice *)v20 setState:17];
              [(SFCombinedDevice *)v20 setNextState:18];

              goto LABEL_20;
            }
            unsigned __int8 v3 = v20;
            if (dword_100966E40 <= 90)
            {
              if (dword_100966E40 != -1 || (v18 = _LogCategory_Initialize(), unsigned __int8 v3 = v20, v18))
              {
                LogPrintF();
                goto LABEL_33;
              }
            }
          }
          else
          {
            unsigned __int8 v3 = v20;
            if (v10 == 18)
            {
              unsigned int v11 = [(SFCombinedDevice *)v20 canTransition:18];
              unsigned __int8 v3 = v20;
              if (v11)
              {
                [(SFCombinedDevice *)v20 setTransferPendingStartTicks:mach_absolute_time()];
                [(SFCombinedDevice *)v20 setState:18];
                [(SFCombinedDevice *)v20 setDismissReason:3];
                [(SFCombinedDevice *)v20 setNextState:0];
LABEL_20:
                [(SDProxHandoffAgent *)self _run];
LABEL_33:
                unsigned __int8 v3 = v20;
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
}

- (void)_runTransferReady
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    int v9 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:17 device:v3];
    unsigned __int8 v3 = v9;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v9 nextState];
      unsigned __int8 v3 = v9;
      if (v5 == 18)
      {
        unsigned int v6 = [(SFCombinedDevice *)v9 effectiveID];
        if (v6)
        {
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            double v8 = v9;
            LogPrintF();
          }
          unsigned int v7 = [(SFCombinedDevice *)v9 notificationType];
          if (v7 == 2)
          {
            [(SDProxHandoffAgent *)self _proximityClientDeviceEnteredImmediate:v6];
LABEL_16:
            if ([(SFCombinedDevice *)v9 canTransition:18])
            {
              [(SFCombinedDevice *)v9 setState:18];
              [(SFCombinedDevice *)v9 setNextState:0];
              [(SDProxHandoffAgent *)self _run];
            }
            goto LABEL_25;
          }
          if (v7 == 3)
          {
            [(SDProxHandoffAgent *)self _runCallHandoffStart:v9];
            goto LABEL_16;
          }
          if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize())
          {
LABEL_25:

            unsigned __int8 v3 = v9;
            goto LABEL_26;
          }
          [(SFCombinedDevice *)v9 notificationType];
        }
        else if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_25;
        }
        LogPrintF();
        goto LABEL_25;
      }
    }
  }
LABEL_26:
}

- (void)_runTransferPendingDismiss
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    unsigned int v11 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:19 device:v3];
    unsigned __int8 v3 = v11;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v11 nextState];
      unsigned __int8 v3 = v11;
      if (v5 == 20)
      {
        mach_absolute_time();
        [(SFCombinedDevice *)v11 notificationTicks];
        UpTicksToSecondsF();
        double v7 = v6;
        if (1.5 - v6 > 0.0)
        {
          -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:");
LABEL_12:
          unsigned __int8 v3 = v11;
          goto LABEL_13;
        }
        [(SFCombinedDevice *)v11 setNotificationDurationSecs:v6];
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          unsigned int v10 = v11;
          double v9 = v7;
          LogPrintF();
        }
        unsigned int v8 = -[SFCombinedDevice canTransition:](v11, "canTransition:", 20, *(void *)&v9, v10);
        unsigned __int8 v3 = v11;
        if (v8)
        {
          [(SFCombinedDevice *)v11 setNotificationTicks:-1];
          [(SFCombinedDevice *)v11 setTransferDoneTicks:mach_absolute_time()];
          [(SFCombinedDevice *)v11 setState:20];
          [(SFCombinedDevice *)v11 setNextState:0];
          [(SDProxHandoffAgent *)self _uiStopIfNeeded:v11 reason:1];
          [(SDProxHandoffAgent *)self _run];
          goto LABEL_12;
        }
      }
    }
  }
LABEL_13:
}

- (void)_runTransferDone
{
  unsigned __int8 v3 = self->_uiDevice;
  if (v3)
  {
    double v9 = v3;
    unsigned int v4 = [(SDProxHandoffAgent *)self _runStateVerify:20 device:v3];
    unsigned __int8 v3 = v9;
    if (v4)
    {
      unsigned int v5 = [(SFCombinedDevice *)v9 nextState];
      unsigned __int8 v3 = v9;
      if (v5 == 15)
      {
        if (dword_100966E40 <= 30)
        {
          if (dword_100966E40 != -1 || (v6 = _LogCategory_Initialize(), unsigned __int8 v3 = v9, v6))
          {
            LogPrintF();
            unsigned __int8 v3 = v9;
          }
        }
        [(SDProxHandoffAgent *)self _uiStopIfNeeded:v9 reason:[(SFCombinedDevice *)v3 dismissReason]];
        if ([(SFCombinedDevice *)v9 notificationType] == 2)
        {
          double v7 = [(SFCombinedDevice *)v9 effectiveID];
          if (v7) {
            [(SDProxHandoffAgent *)self _proximityClientDeviceExitedImmediate:v7];
          }
        }
        unsigned int v8 = [(SFCombinedDevice *)v9 canTransition:15];
        unsigned __int8 v3 = v9;
        if (v8)
        {
          [(SFCombinedDevice *)v9 setState:15];
          [(SFCombinedDevice *)v9 setNextState:0];
          [(SDProxHandoffAgent *)self _run];
          unsigned __int8 v3 = v9;
        }
      }
    }
  }
}

- (void)_runCallHandoffStart:(id)a3
{
  id v4 = a3;
  if (self->_clinkClient)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    unsigned int v5 = [v4 clinkDevice];
    if (v5)
    {
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v6 = [v4 route];
      double v7 = v6;
      if (v6 && ([v6 isCurrentlyPicked] & 1) != 0)
      {
        [(SDProxHandoffAgent *)self _runCallHandoffStartDelayTimer];
      }
      else
      {

        clinkClient = self->_clinkClient;
        double v9 = [v5 effectiveIdentifier];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000B0DA0;
        v10[3] = &unk_1008CC318;
        v10[4] = self;
        [(RPCompanionLinkClient *)clinkClient sendRequestID:@"com.apple.sharing.calltransfer" request:&off_1009056E0 destinationID:v9 options:0 responseHandler:v10];
      }
    }
    else if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_runCallHandoffHandleResponse:(id)a3 error:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v5)
  {
    if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDProxHandoffAgent *)self _runCallHandoffStartDelayTimer];
  }
}

- (void)_runCallHandoffStartDelayTimer
{
  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    id v4 = delayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_delayTimer;
    self->_delayTimer = 0;
  }
  int v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  double v7 = self->_delayTimer;
  self->_delayTimer = v6;

  unsigned int v8 = self->_delayTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B0F8C;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_delayTimer);
}

- (void)_runCallHandoffHandleDelayTimerFired
{
  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    id v4 = delayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_delayTimer;
    self->_delayTimer = 0;
  }
  int v6 = self->_uiDevice;
  if (v6)
  {
    uint64_t v13 = v6;
    double v7 = [(SFCombinedDevice *)v6 effectiveID];
    if (v7)
    {
      unsigned int v8 = [(SFCombinedDevice *)v13 route];
      if (v8)
      {
        double v9 = [(objc_class *)off_100966EB0() sharedInstance];
        unsigned int v10 = [v9 routeController];
        if ([v8 isCurrentlyPicked])
        {
          unsigned int v11 = [v10 receiverRoute];
          if (v11)
          {
            if (dword_100966E40 < 31 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              [v10 pickRoute:v11, v11];
            }
            else
            {
              [v10 pickRoute:v11, v12];
            }
          }
        }
        else
        {
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            unsigned int v12 = [v8 uniqueIdentifier];
            LogPrintF();
          }
          [v10 pickRoute:v8, v12];
        }
        [(SDProxHandoffAgent *)self _uiDismissWhenReady:v13 reason:3];
        [(SDProxHandoffAgent *)self _run];
      }
      else if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    int v6 = v13;
  }
}

- (void)_bleActionDiscoveryEnsureStopped
{
  if (self->_bleActionDiscovery)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleActionDiscovery invalidate];
    bleActionDiscovery = self->_bleActionDiscovery;
    self->_bleActionDiscovery = 0;

    [(SDProxHandoffAgent *)self _bleUpdateMappingReset];
  }
  [(NSMutableDictionary *)self->_bleActionDevices removeAllObjects];
  bleActionDevices = self->_bleActionDevices;
  self->_bleActionDevices = 0;

  uiDevice = self->_uiDevice;
  self->_uiDevice = 0;

  [(SDProxHandoffAgent *)self _bleActionScanTimerInvalidate];
}

- (void)_bleActionDeviceChanged:(id)a3
{
  id v32 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v32 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_bleActionDevices objectForKeyedSubscript:v4];

    if (v5) {
      goto LABEL_6;
    }
    unsigned __int16 v6 = (unsigned __int16)[v32 deviceFlags];
    if ((v6 & 0x200) != 0 && (v6 & 0x48) != 0)
    {
      [(SDProxHandoffAgent *)self _bleActionDeviceFoundCandidate:v32];
LABEL_6:
      [(NSMutableDictionary *)self->_bleActionDevices setObject:v32 forKeyedSubscript:v4];
      double v7 = [(NSMutableDictionary *)self->_mappedDevices objectForKeyedSubscript:v4];
      if (!v7)
      {
        double v7 = [(SDProxHandoffAgent *)self _bleUpdateMappingWithDevice:v32];
        if (!v7) {
          goto LABEL_71;
        }
      }
      [v7 setBleDevice:v32];
      if ([(SDProxHandoffAgent *)self _combinedDeviceIsSuppressed:v7]) {
        goto LABEL_71;
      }
      [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v32 forType:1];
      unsigned int v8 = [v32 bleDevice];
      unsigned int v9 = [v8 insideSmallBubble];

      unint64_t v10 = [(SDProximityController *)self->_proximityController checkDeviceRegion:v32];
      if (v10 == 1 && dword_100966E40 <= 50 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v11 = v10 == 1;
      if (_os_feature_enabled_impl()) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v9;
      }
      uint64_t v13 = [v32 bleDevice];
      unsigned __int8 v14 = [v13 insideMediumBubble];

      BOOL v15 = [v32 bleDevice];
      unsigned int v16 = (const char *)[v15 rssiEstimate];

      uint64_t v17 = [v7 name];
      if (v12 == 1)
      {
        if ([v7 state] == 15)
        {
          if (dword_100966E40 > 30 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_68;
          }
          uint64_t v27 = v17;
          double v28 = *(double *)&v16;
LABEL_41:
          LogPrintF();
LABEL_68:
          [v7 setState:11 v27 *(void *)&v28];
          id v24 = v7;
          uint64_t v25 = 13;
LABEL_69:
          [v24 setNextState:v25, v27, v28];
          uiDevice = self->_uiDevice;
          self->_uiDevice = 0;

          goto LABEL_70;
        }
        if ([v7 canTransition:16])
        {
          if (!self->_stationary && [(SDProxHandoffAgent *)self _systemCanTrigger])
          {
            if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v27 = v17;
              double v28 = *(double *)&v16;
              LogPrintF();
            }
            [v7 setTransferPendingStartTicks:mach_absolute_time()];
            [v7 setState:16];
            id v24 = v7;
            uint64_t v25 = 17;
            goto LABEL_69;
          }
          if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_70;
          }
          if (self->_stationary) {
            uint64_t v22 = "yes";
          }
          else {
            uint64_t v22 = "no";
          }
          uint64_t v30 = [(SDStatusMonitor *)self->_statusMonitor systemUIFlags];
          double v31 = &unk_10076DEF8;
          double v28 = *(double *)&v16;
          v29 = v22;
          uint64_t v27 = v17;
          goto LABEL_62;
        }
        if (v14) {
          goto LABEL_37;
        }
      }
      else if (v14)
      {
        if ([v7 state] == 20 && objc_msgSend(v7, "canTransition:", 15))
        {
          mach_absolute_time();
          [v7 transferDoneTicks];
          UpTicksToSecondsF();
          double v19 = v18;
          if (v18 > self->_prefRetriggerSecs && [v7 transferDoneTicks] != (id)-1)
          {
            if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
            {
              v29 = v16;
              double v28 = v19;
              uint64_t v27 = v17;
              LogPrintF();
            }
            [v7 setNextState:15 v27 v28 v29];
            [v7 setTransferDoneDurationSecs:v19];
            [v7 setTransferDoneTicks:-1];
            goto LABEL_70;
          }
          if ([v7 transferDoneTicks] != (id)-1
            && dword_100966E40 <= 30
            && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            v29 = v16;
            double v28 = v19;
            uint64_t v27 = v17;
LABEL_62:
            LogPrintF();
          }
LABEL_70:
          -[SDProxHandoffAgent _proximityClientDeviceUpdated:](self, "_proximityClientDeviceUpdated:", v7, v27, *(void *)&v28, v29, v30, v31);
          [(NSMutableDictionary *)self->_mappedDevices setObject:v7 forKeyedSubscript:v4];
          [(SDProxHandoffAgent *)self _run];

LABEL_71:
          goto LABEL_72;
        }
LABEL_37:
        if ([v7 canTransition:11])
        {
          if (dword_100966E40 > 30 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_68;
          }
          uint64_t v27 = v17;
          double v28 = *(double *)&v16;
          goto LABEL_41;
        }
        goto LABEL_70;
      }
      if ([v7 state] == 12)
      {
        mach_absolute_time();
        [v7 pendingContentTicks];
        UpTicksToSecondsF();
        if (dword_100966E40 <= 30)
        {
          int v21 = v20;
          if (dword_100966E40 != -1 || _LogCategory_Initialize())
          {
            v29 = v21;
            uint64_t v27 = v17;
            double v28 = *(double *)&v16;
            LogPrintF();
          }
        }
        [v7 setState:10 v27 *(void *)&v28 v29];
        [v7 setPendingContentTicks:-1];
        [v7 setNextState:0];
        v23 = [v7 effectiveID];
        if (v23)
        {
          [(SDProxHandoffAgent *)self _proximityClientDeviceExitedImmediate:v23];
          [(SDProxHandoffAgent *)self _proximityClientDeviceDidUnTrigger:v23];
        }
      }
      else if ([v7 canTransition:10])
      {
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v27 = v17;
          double v28 = *(double *)&v16;
          LogPrintF();
        }
        [v7 setState:10 v27 *(void *)&v28];
        [v7 setNextState:0];
      }
      goto LABEL_70;
    }
  }
LABEL_72:
}

- (void)_bleActionDeviceFound:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleActionDiscovery)
  {
    id v4 = [v5 identifier];
    if (v4
      && ([v5 deviceFlags] & 0x200) != 0
      && ([v5 deviceFlags] & 0x48) != 0)
    {
      [(SDProxHandoffAgent *)self _bleActionDeviceFoundCandidate:v5];
      [(SDProxHandoffAgent *)self _bleActionDeviceChanged:v5];
      [(SDProxHandoffAgent *)self _update];
    }
  }
}

- (void)_bleActionDeviceFoundCandidate:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  if (v4)
  {
    if (([v9 deviceFlags] & 0x200) != 0)
    {
      if (([v9 deviceFlags] & 0x48) != 0)
      {
        if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          id v8 = v9;
          LogPrintF();
        }
        bleActionDevices = self->_bleActionDevices;
        if (!bleActionDevices)
        {
          unsigned __int16 v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          double v7 = self->_bleActionDevices;
          self->_bleActionDevices = v6;

          bleActionDevices = self->_bleActionDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](bleActionDevices, "setObject:forKeyedSubscript:", v9, v4, v8);
        [(SDProxHandoffAgent *)self _bleDeviceNearbyEnter:v9];
      }
    }
    else if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_bleActionDeviceLost:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v7 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_bleActionDevices objectForKeyedSubscript:v4];

    if (v5)
    {
      if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v6 = v7;
        LogPrintF();
      }
      -[SDProxHandoffAgent _bleDeviceNearbyExit:](self, "_bleDeviceNearbyExit:", v7, v6);
      [(NSMutableDictionary *)self->_bleActionDevices removeObjectForKey:v4];
      [(SDProxHandoffAgent *)self _update];
    }
  }
}

- (void)_bleActionScanTimerActivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDProxHandoffAgent *)self _bleActionScanTimerInvalidate];
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_bleActionScanTimedOut = 0;
  unsigned __int8 v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  bleActionScanTimer = self->_bleActionScanTimer;
  self->_bleActionScanTimer = v3;

  SFDispatchTimerSet();
  id v5 = self->_bleActionScanTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B1F00;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_bleActionScanTimer);
}

- (void)_bleActionScanTimerInvalidate
{
  if (self->_bleActionScanTimer)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_bleActionScanTimedOut = 0;
    bleActionScanTimer = self->_bleActionScanTimer;
    if (bleActionScanTimer)
    {
      id v5 = bleActionScanTimer;
      dispatch_source_cancel(v5);
      id v4 = self->_bleActionScanTimer;
      self->_bleActionScanTimer = 0;
    }
  }
}

- (void)_bleActionScanTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDProxHandoffAgent *)self _bleActionScanTimerInvalidate];
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_bleActionScanTimedOut = 1;

  [(SDProxHandoffAgent *)self _update];
}

- (void)_bleInfoDiscoveryEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleInfoDiscovery)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned __int8 v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    bleInfoDiscovery = self->_bleInfoDiscovery;
    self->_bleInfoDiscovery = v3;

    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setChangeFlags:9];
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setDiscoveryFlags:1];
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setFastScanMode:1];
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setPurpose:@"HandoffInfo"];
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setRssiThreshold:-37];
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setScanRate:20];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B22A4;
    v9[3] = &unk_1008CADB8;
    v9[4] = self;
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B22B0;
    v8[3] = &unk_1008CADB8;
    v8[4] = self;
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B22BC;
    v7[3] = &unk_1008CADE0;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_bleInfoDiscovery setDeviceChangedHandler:v7];
    id v5 = self->_bleInfoDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B22C8;
    v6[3] = &unk_1008CA5A8;
    v6[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_bleInfoDeviceChanged:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = v12;
  if (self->_bleInfoDiscovery)
  {
    id v5 = [v12 identifier];
    if (v5 && ([v12 deviceFlags] & 0x48) != 0)
    {
      if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v9 = v12;
        LogPrintF();
      }
      id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleInfoDevices, "objectForKeyedSubscript:", v5, v9);
      if (!v6 && dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v7 = [v12 bleDevice];
      id v8 = [v7 rssi];

      if ((unint64_t)v8 <= 0xFFFFFFFFFFFFFFDALL
        && dword_100966E40 <= 30
        && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v10 = v8;
        id v11 = v12;
        LogPrintF();
      }
      -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v12, v10, v11);
      [(NSMutableDictionary *)self->_bleInfoDevices setObject:v12 forKeyedSubscript:v5];
      [(SDProxHandoffAgent *)self _update];
    }
    id v4 = v12;
  }
}

- (void)_bleInfoDeviceFound:(id)a3
{
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = v14;
  if (self->_bleInfoDiscovery)
  {
    id v5 = [v14 identifier];
    if (v5 && ([v14 deviceFlags] & 0x48) != 0)
    {
      if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v11 = v14;
        LogPrintF();
      }
      bleInfoDevices = self->_bleInfoDevices;
      if (!bleInfoDevices)
      {
        id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v8 = self->_bleInfoDevices;
        self->_bleInfoDevices = v7;

        bleInfoDevices = self->_bleInfoDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](bleInfoDevices, "setObject:forKeyedSubscript:", v14, v5, v11);
      id v9 = [v14 bleDevice];
      id v10 = [v9 rssi];

      if ((unint64_t)v10 <= 0xFFFFFFFFFFFFFFDALL
        && dword_100966E40 <= 30
        && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v12 = v10;
        id v13 = v14;
        LogPrintF();
      }
      -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v14, v12, v13);
      [(SDProxHandoffAgent *)self _update];
    }

    id v4 = v14;
  }
}

- (void)_bleInfoDeviceLost:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v7 identifier];
  if (v4)
  {
    if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4, v6);
    if (v5) {
      [(SDProxHandoffAgent *)self _uiStopIfNeeded:v5 reason:4];
    }

    [(NSMutableDictionary *)self->_bleInfoDevices removeObjectForKey:v4];
    [(SDProxHandoffAgent *)self _bleDeviceNearbyExit:v7];
    [(SDProxHandoffAgent *)self _update];
  }
}

- (void)_bleDeviceNearbyEnter:(id)a3
{
  id v12 = a3;
  id v4 = [v12 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_mappedDevices objectForKeyedSubscript:v4];

    id v6 = [(SDProxHandoffAgent *)self _bleUpdateMappingWithDevice:v12];
    [(SDProxHandoffAgent *)self _updateCandidateIsNearby];
    if (!v5)
    {
      id v7 = [(NSMutableDictionary *)self->_mappedDevices objectForKeyedSubscript:v4];
      id v8 = v7;
      if (v7)
      {
        id v9 = [v7 clinkDevice];
        id v10 = [v9 mediaRouteIdentifier];

        if (v10)
        {
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[SDProxHandoffAgent _proximityClientDeviceEnteredNearby:](self, "_proximityClientDeviceEnteredNearby:", v10, v10);
          }
          else
          {
            -[SDProxHandoffAgent _proximityClientDeviceEnteredNearby:](self, "_proximityClientDeviceEnteredNearby:", v10, v11);
          }
        }
      }
    }
    [(SDProxHandoffAgent *)self _update];
  }
}

- (void)_bleDeviceNearbyExit:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    id v10 = v4;
    id v5 = [(NSMutableDictionary *)self->_mappedDevices objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 clinkDevice];
      id v8 = [v7 mediaRouteIdentifier];

      if (v8)
      {
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          -[SDProxHandoffAgent _proximityClientDeviceExitedNearby:](self, "_proximityClientDeviceExitedNearby:", v8, v8);
        }
        else
        {
          -[SDProxHandoffAgent _proximityClientDeviceExitedNearby:](self, "_proximityClientDeviceExitedNearby:", v8, v9);
        }
      }
    }
    [(NSMutableDictionary *)self->_mappedDevices removeObjectForKey:v10];
    [(NSMutableDictionary *)self->_bleUnmapped removeObjectForKey:v10];
    [(SDProxHandoffAgent *)self _updateCandidateIsNearby];
    [(SDProxHandoffAgent *)self _update];
    id v4 = v10;
  }
}

- (void)_bleUpdateMappingAndNearby
{
}

- (void)_bleUpdateMappingAndNearbyCoalesced
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned __int8 v3 = [(NSMutableDictionary *)self->_bleUnmapped allValues];
  id v4 = [v3 copy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(SDProxHandoffAgent *)self _bleUpdateMappingWithDevice:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(NSMutableDictionary *)self->_bleActionDevices allValues];
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
        id v16 = [(SDProxHandoffAgent *)self _bleUpdateMappingWithDevice:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  [(SDProxHandoffAgent *)self _updateCandidateIsNearby];
  [(SDProxHandoffAgent *)self _update];
}

- (void)_bleUpdateMappingReset
{
  [(NSMutableDictionary *)self->_bleUnmapped removeAllObjects];
  bleUnmapped = self->_bleUnmapped;
  self->_bleUnmapped = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableDictionary *)self->_mappedDevices allValues];
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 effectiveID];
        if (v10)
        {
          if ([v9 stateIsClose]) {
            [(SDProxHandoffAgent *)self _proximityClientDeviceExitedImmediate:v10];
          }
          if ([v9 stateIsMedium]) {
            [(SDProxHandoffAgent *)self _proximityClientDeviceDidUnTrigger:v10];
          }
          if ([v9 stateIsNearby]) {
            [(SDProxHandoffAgent *)self _proximityClientDeviceExitedNearby:v10];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_mappedDevices removeAllObjects];
  mappedDevices = self->_mappedDevices;
  self->_mappedDevices = 0;

  [(SDProxHandoffAgent *)self _bleUpdateMappingAndNearby];
}

- (id)_bleUpdateMappingWithDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = [v4 identifier];
  if (!v5)
  {
    long long v14 = 0;
    goto LABEL_31;
  }
  id v6 = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
  uint64_t v7 = SFDeviceToRPCompanionLinkDevice();
  uint64_t v8 = v7;
  if (!v7)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      long long v39 = v4;
      LogPrintF();
    }
    goto LABEL_26;
  }
  uint64_t v9 = [v7 model];
  id v10 = [v9 lowercaseString];
  if (!v10) {
    goto LABEL_17;
  }
  int v11 = SFDeviceClassCodeGet();
  if ((v11 - 1) < 2)
  {
    CFStringRef v12 = @"audioaccessory";
    goto LABEL_6;
  }
  if (v11 != 4)
  {
LABEL_17:

LABEL_18:
    if (dword_100966E40 <= 60 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      long long v39 = [v8 model];
      double v41 = (const char *)v4;
      LogPrintF();
    }
LABEL_26:
    bleUnmapped = self->_bleUnmapped;
    if (!bleUnmapped)
    {
      long long v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v21 = self->_bleUnmapped;
      self->_bleUnmapped = v20;

      bleUnmapped = self->_bleUnmapped;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bleUnmapped, "setObject:forKeyedSubscript:", v4, v5, v39, v41);
    goto LABEL_29;
  }
  if ([v10 containsString:@"iphone"])
  {

    goto LABEL_15;
  }
  CFStringRef v12 = @"ipod";
LABEL_6:
  unsigned __int8 v13 = [v10 containsString:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  unsigned __int8 v15 = [v4 deviceFlags];
  if ((v15 & 8) != 0)
  {
    long long v17 = [v4 bleDevice];
    if ([v17 decryptedActivityLevel] == 16)
    {
      unsigned int v18 = 0;
    }
    else
    {
      long long v23 = [v4 bleDevice];
      unsigned int v18 = [v23 decryptedActivityLevel];
    }
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = [v4 name];
      uint64_t v25 = (void *)v24;
      if (v18 > 0xE) {
        v26 = "?";
      }
      else {
        v26 = off_1008CC4E0[(char)v18];
      }
      long long v39 = (void *)v24;
      double v41 = v26;
      LogPrintF();
    }
    if (v18 > 3)
    {
      unsigned int v16 = 1;
    }
    else
    {
      uint64_t v27 = [v4 model];
      unsigned int v16 = [v27 hasPrefix:@"AudioAccessory"];
    }
  }
  else
  {
    unsigned int v16 = 0;
  }
  uint64_t v28 = -[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v5, v39, v41);
  long long v14 = (SFCombinedDevice *)v28;
  if ((v15 & 8) == 0)
  {
    if (v28) {
      goto LABEL_74;
    }
    goto LABEL_61;
  }
  if (v28) {
    int v29 = 1;
  }
  else {
    int v29 = v16;
  }
  if (v29 == 1)
  {
    if (v28) {
      char v30 = v16;
    }
    else {
      char v30 = 1;
    }
    if (v30)
    {
      char v31 = v16 ^ 1;
      if (v28) {
        char v31 = 1;
      }
      if (v31)
      {
LABEL_74:
        [(SFCombinedDevice *)v14 setBleDevice:v4];
        id v32 = [(SFCombinedDevice *)v14 clinkDevice];
        id v33 = v8;
        double v34 = v33;
        if (v32 == v33)
        {
        }
        else
        {
          if (v32)
          {
            unsigned __int8 v35 = [v32 isEqual:v33];

            if (v35) {
              goto LABEL_81;
            }
          }
          else
          {
          }
          [(SFCombinedDevice *)v14 setClinkDevice:v34];
        }
LABEL_81:
        mappedDevices = self->_mappedDevices;
        if (!mappedDevices)
        {
          long long v37 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          unint64_t v38 = self->_mappedDevices;
          self->_mappedDevices = v37;

          mappedDevices = self->_mappedDevices;
        }
        [(NSMutableDictionary *)mappedDevices setObject:v14 forKeyedSubscript:v5];
        goto LABEL_30;
      }
LABEL_61:
      if (!v28)
      {
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          [v8 effectiveIdentifier];
          id v42 = v40 = v4;
          LogPrintF();
        }
        -[NSMutableDictionary removeObjectForKey:](self->_bleUnmapped, "removeObjectForKey:", v5, v40, v42);
        long long v14 = objc_alloc_init(SFCombinedDevice);
        [(SFCombinedDevice *)v14 setBleDevice:v4];
        [(SFCombinedDevice *)v14 setClinkDevice:v8];
        [(SFCombinedDevice *)v14 setState:10];
        if (self->_bleActionScanTimedOut || self->_bleActionScanTimer)
        {
          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(SDProxHandoffAgent *)self _bleActionScanTimerActivate];
        }
      }
      goto LABEL_74;
    }
    [(SDProxHandoffAgent *)self _bleDeviceNearbyExit:v4];
  }
LABEL_29:
  long long v14 = 0;
LABEL_30:

LABEL_31:

  return v14;
}

- (void)_clinkEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clinkClient)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkClient *)self->_clinkClient deregisterRequestID:@"com.apple.sharing.calltransfer"];
    [(RPCompanionLinkClient *)self->_clinkClient invalidate];
    clinkClient = self->_clinkClient;
    self->_clinkClient = 0;
  }
}

- (void)_clinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (SFDeviceClassCodeGet() == 4)
  {
    [(SDProxHandoffAgent *)self _clinkHomePodHandleRequest:v7 responseHandler:v8];
  }
  else if (v8)
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    uint64_t v9 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v10 = (void *)v9;
    CFStringRef v11 = @"?";
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    CFStringRef v15 = v11;
    CFStringRef v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    unsigned __int8 v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6700 userInfo:v12];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v13);
  }
}

- (void)_clinkHomePodHandleRequest:(id)a3 responseHandler:(id)a4
{
  if (a4)
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    id v5 = a4;
    uint64_t v6 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v7 = (void *)v6;
    CFStringRef v8 = @"?";
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    CFStringRef v12 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6735 userInfo:v9];
    (*((void (**)(id, void, void, void *))a4 + 2))(v5, 0, 0, v10);
  }
}

- (void)_motionEnsureStopped
{
  if (self->_motionMonitorStarted)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CMMotionActivityManager *)self->_motionMonitor stopActivityUpdates];
    self->_motionMonitorStarted = 0;
  }
}

- (void)_motionUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = v4;
  id v10 = v5;
  if (v4)
  {
    if ([v5 stationary]) {
      LODWORD(v4) = [v10 confidence] == (id)2;
    }
    else {
      LODWORD(v4) = 0;
    }
    id v5 = v10;
  }

  if (self->_prefForceStationary) {
    LODWORD(v4) = 1;
  }
  if (self->_stationary != v4)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = "yes";
      if (v4) {
        id v7 = "no";
      }
      else {
        id v7 = "yes";
      }
      if (!v4) {
        uint64_t v6 = "no";
      }
      CFStringRef v8 = v7;
      uint64_t v9 = v6;
      LogPrintF();
    }
    self->_stationary = (char)v4;
    if ((v4 & 1) == 0)
    {
      self->_bleActionScanTimedOut = 0;
      [(SDProxHandoffAgent *)self _bleActionScanTimerInvalidate];
    }
  }
  [(SDProxHandoffAgent *)self _update];
}

- (int)proximityClientStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v4 setDispatchQueue:self->_dispatchQueue];
  proxClients = self->_proxClients;
  if (!proxClients)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_proxClients;
    self->_proxClients = v6;

    proxClients = self->_proxClients;
  }
  [(NSMutableSet *)proxClients addObject:v4];
  [(SDProxHandoffAgent *)self _commonShouldAdvertiseChanged];
  [(SDProxHandoffAgent *)self _proximityClientSeedInitialDevices:v4];
  [(SDProxHandoffAgent *)self _proximityClientSeedWillTriggerDeviceIfNeeded:v4];
  [(SDProxHandoffAgent *)self _update];

  return 0;
}

- (void)proximityClientStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableSet *)self->_proxClients removeObject:v4];
  if (![(NSMutableSet *)self->_proxClients count])
  {
    [(SDProxHandoffAgent *)self _bleUpdateMappingReset];
    [(NSMutableSet *)self->_suppressedDeviceIDs removeAllObjects];
    [(SFNotificationProxy *)self->_notificationProxy requestRemoveAll];
    [(SDProxHandoffAgent *)self _resetAllStates];
  }
  [(SDProxHandoffAgent *)self _update];
}

- (void)proximityClientUpdate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B3F68;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (int)proximityClient:(id)a3 dismissContentForDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_proxClients containsObject:v6])
  {
    id v8 = [(SDProxHandoffAgent *)self _combinedDeviceForUIID:v7];
    if (v8)
    {
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v11 = v7;
        LogPrintF();
      }
      -[SDProxHandoffAgent _uiDismissWhenReady:reason:](self, "_uiDismissWhenReady:reason:", v8, 1, v11);
      int v9 = 0;
    }
    else
    {
      if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v9 = -6705;
    }
  }
  else
  {
    if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v9 = -6700;
  }

  return v9;
}

- (int)proximityClient:(id)a3 provideContent:(id)a4 forDevice:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = (SFCombinedDevice *)a4;
  id v12 = a5;
  if ([(NSMutableSet *)self->_proxClients containsObject:v10])
  {
    uint64_t v13 = [(SDProxHandoffAgent *)self _combinedDeviceForUIID:v12];
    NSErrorUserInfoKey v14 = (SFCombinedDevice *)v13;
    if (!v6 && !v13)
    {
      if (dword_100966E40 <= 60 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v17 = -6709;
      goto LABEL_38;
    }
    uint64_t v15 = [(SFCombinedDevice *)v11 error];
    if (!v15)
    {
      if (!v14 && v6)
      {
        NSErrorUserInfoKey v14 = objc_alloc_init(SFCombinedDevice);
        [(SFCombinedDevice *)v14 setForced:1];
        [(SFCombinedDevice *)v14 setForcedID:v12];
        [(SFCombinedDevice *)v14 setNotificationType:2];
      }
      unsigned int v16 = [(SDProxHandoffAgent *)self mediaTransferInfoFromInfo:v11];
      [v16 setHomePodType:-[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v14)];
      [(SFCombinedDevice *)v14 setNotificationInfo:v16];
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v18 = "no";
        if (v6) {
          unsigned int v18 = "yes";
        }
        uint64_t v27 = v18;
        uint64_t v28 = v16;
        v26 = v14;
        LogPrintF();
      }
      -[SFCombinedDevice setNextState:](v14, "setNextState:", 13, v26, v27, v28);
      uiDevice = self->_uiDevice;
      self->_uiDevice = 0;

      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B45CC;
      block[3] = &unk_1008CA4B8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
      goto LABEL_37;
    }
    unsigned int v16 = (void *)v15;
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      v26 = v11;
      LogPrintF();
    }
    -[SFCombinedDevice setClientProvidedError:](v14, "setClientProvidedError:", 1, v26);
    [(SFCombinedDevice *)v14 resetTicks];
    if ([(SFCombinedDevice *)v14 stateIsClose]
      || [(SFCombinedDevice *)v14 stateIsMedium]
      && ([(SFCombinedDevice *)v14 bleDevice],
          long long v20 = objc_claimAutoreleasedReturnValue(),
          [v20 bleDevice],
          long long v21 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v22 = [v21 insideSmallBubble],
          v21,
          v20,
          (v22 & 1) != 0))
    {
      uint64_t v19 = 20;
    }
    else
    {
      if (![(SFCombinedDevice *)v14 stateIsMedium])
      {
LABEL_34:
        [(SFCombinedDevice *)v14 setNextState:0];
LABEL_37:

        int v17 = 0;
        goto LABEL_38;
      }
      uint64_t v19 = 15;
    }
    [(SFCombinedDevice *)v14 setState:v19];
    goto LABEL_34;
  }
  if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v17 = -6700;
LABEL_38:

  return v17;
}

- (int)proximityClient:(id)a3 suppressDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_proxClients containsObject:v6])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v7;
      LogPrintF();
    }
    suppressedDeviceIDs = self->_suppressedDeviceIDs;
    if (!suppressedDeviceIDs)
    {
      int v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v10 = self->_suppressedDeviceIDs;
      self->_suppressedDeviceIDs = v9;

      suppressedDeviceIDs = self->_suppressedDeviceIDs;
    }
    -[NSMutableSet addObject:](suppressedDeviceIDs, "addObject:", v7, v19);
    id v11 = [(SDProxHandoffAgent *)self _combinedDeviceForUIID:v7];
    if (v11)
    {
      if (dword_100966E40 < 31 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        long long v20 = v11;
        LogPrintF();
      }
      [v11 resetTicks:v20];
      [v11 setState:10];
      [v11 setNextState:0];
    }

    id v13 = [(SFCombinedDevice *)self->_uiDevice effectiveID];
    id v14 = v7;
    uint64_t v15 = v14;
    if (v13 == v14)
    {
    }
    else
    {
      if ((v14 != 0) == (v13 == 0))
      {

LABEL_30:
        int v12 = 0;
        goto LABEL_31;
      }
      unsigned __int8 v16 = [v13 isEqual:v14];

      if ((v16 & 1) == 0) {
        goto LABEL_30;
      }
    }
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uiDevice = self->_uiDevice;
    self->_uiDevice = 0;

    goto LABEL_30;
  }
  if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v12 = -6700;
LABEL_31:

  return v12;
}

- (int)proximityClient:(id)a3 stopSuppressingDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_proxClients containsObject:v6])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v7;
      LogPrintF();
    }
    -[NSMutableSet removeObject:](self->_suppressedDeviceIDs, "removeObject:", v7, v10);
    int v8 = 0;
  }
  else
  {
    if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v8 = -6700;
  }

  return v8;
}

- (int)proximityClient:(id)a3 updateContent:(id)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NSMutableSet *)self->_proxClients containsObject:v8])
  {
    id v11 = [(SDProxHandoffAgent *)self _combinedDeviceForUIID:v10];
    int v12 = v11;
    if (!v11)
    {
      int v17 = -6709;
      goto LABEL_43;
    }
    id v13 = [v11 effectiveID];
    id v14 = v10;
    uint64_t v15 = v14;
    if (v13 == v14)
    {
    }
    else
    {
      if ((v14 != 0) == (v13 == 0))
      {

        int v17 = -6705;
        unsigned int v18 = v13;
LABEL_42:

        goto LABEL_43;
      }
      unsigned int v16 = [v13 isEqual:v14];

      if (!v16)
      {
        int v17 = -6705;
LABEL_43:

        goto LABEL_44;
      }
    }
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = v15;
      LogPrintF();
    }
    unsigned int v18 = -[SDProxHandoffAgent mediaTransferInfoFromInfo:](self, "mediaTransferInfoFromInfo:", v9, v24);
    [v18 setHomePodType:-[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v12)];
    [v12 setNotificationInfo:v18];
    uint64_t v19 = [v9 error];
    if (!v19)
    {
      if ([v12 state] == 14 && !objc_msgSend(v12, "nextState"))
      {
        id v13 = [v18 mediumBubbleVersion];
        uint64_t v20 = 1;
      }
      else
      {
        id v13 = v18;
        uint64_t v20 = 0;
      }
      id v21 = [v12 clientProvidedError];
      if (v21)
      {
        [v12 setState:15];
        [v12 setNextState:16];
        [v12 setClientProvidedError:0];
      }
      if (v20 && dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFNotificationProxy *)self->_notificationProxy requestUpdate:v15 info:v13 mediumVariant:v20 canPostNotification:v21];
      goto LABEL_41;
    }
    id v13 = (id)v19;
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v25 = v9;
      LogPrintF();
    }
    -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v15, 1, v25);
    [v12 setClientProvidedError:1];
    if ([v12 stateIsClose])
    {
      uint64_t v22 = 20;
    }
    else
    {
      if (([v12 stateIsMedium] & 1) == 0)
      {
LABEL_41:
        int v17 = 0;
        goto LABEL_42;
      }
      uint64_t v22 = 15;
    }
    [v12 setState:v22];
    goto LABEL_41;
  }
  if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v17 = -6700;
LABEL_44:

  return v17;
}

- (int)proximityClientRequestScannerTimerReset:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_proxClients containsObject:v4])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_bleActionScanTimedOut || self->_bleActionScanTimer)
    {
      [(SDProxHandoffAgent *)self _bleActionScanTimerActivate];
    }
    else if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v5 = 0;
  }
  else
  {
    if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v5 = -6700;
  }

  return v5;
}

- (void)_proximityClientDeviceEnteredImmediate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 deviceEnteredImmediateHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceEnteredImmediateHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceExitedImmediate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 deviceExitedImmediateHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceExitedImmediateHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceEnteredNearby:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 deviceEnteredNearbyHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceEnteredNearbyHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceExitedNearby:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 deviceExitedNearbyHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceExitedNearbyHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceWasDismissed:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 deviceWasDismissedHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceWasDismissedHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceWasDismissed:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      if ((unint64_t)(a4 - 1) > 3) {
        CFStringRef v7 = @"?";
      }
      else {
        CFStringRef v7 = *(&off_1008CC558 + a4 - 1);
      }
      id v16 = v6;
      CFStringRef v17 = v7;
      LogPrintF();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_proxClients;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = [v13 deviceWasDismissedHandlerEx:v16 v17:v18];

          if (v14)
          {
            long long v15 = [v13 deviceWasDismissedHandlerEx];
            ((void (**)(void, id, int64_t))v15)[2](v15, v6, a4);
          }
        }
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

- (void)_proximityClientDeviceWasSelected:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 deviceWasSelectedHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceWasSelectedHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceWillTrigger:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 deviceWillTriggerHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceWillTriggerHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceDidUnTrigger:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = self->_proxClients;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 deviceDidUntriggerHandler:v13];

          if (v11)
          {
            int v12 = [v10 deviceDidUntriggerHandler];
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_proximityClientDeviceUpdated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = [v4 clinkDevice];
  id v6 = [v5 mediaRouteIdentifier];

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = self->_proxClients;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = [v12 deviceUpdateHandler];

          if (v13)
          {
            if (dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
            {
              id v17 = v4;
              LogPrintF();
            }
            [v12 deviceUpdateHandler:v17];
            long long v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
            long long v15 = [v4 bleDevice];
            long long v16 = [v15 bleDevice];
            ((void (**)(void, void *, id, void))v14)[2](v14, v6, [v16 rssi], (int)[v4 state]);
          }
        }
        id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (void)_proximityClientSeedInitialDevices:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000B60A8;
  v10[4] = sub_1000B60B8;
  id v11 = 0;
  id v11 = [(NSMutableDictionary *)self->_mappedDevices allValues];
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B60C0;
  v7[3] = &unk_1008CC368;
  id v8 = v4;
  id v9 = v10;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);

  _Block_object_dispose(v10, 8);
}

- (void)_proximityClientSeedWillTriggerDeviceIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B6314;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_serviceEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleActionService)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned __int8 v3 = (SFProxHandoffService *)objc_alloc_init((Class)SFProxHandoffService);
    bleActionService = self->_bleActionService;
    self->_bleActionService = v3;

    [(SFProxHandoffService *)self->_bleActionService setDispatchQueue:self->_dispatchQueue];
    int v5 = self->_bleActionService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B6594;
    v6[3] = &unk_1008CA5A8;
    v6[4] = self;
    [(SFProxHandoffService *)v5 activateWithCompletion:v6];
  }
}

- (void)_serviceTimeoutActivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDProxHandoffAgent *)self _serviceTimeoutInvalidate];
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned __int8 v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  bleActionServiceTimer = self->_bleActionServiceTimer;
  self->_bleActionServiceTimer = v3;

  SFDispatchTimerSet();
  int v5 = self->_bleActionServiceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B67A8;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_bleActionServiceTimer);
}

- (void)_serviceTimeoutInvalidate
{
  if (self->_bleActionServiceTimer)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    bleActionServiceTimer = self->_bleActionServiceTimer;
    if (bleActionServiceTimer)
    {
      int v5 = bleActionServiceTimer;
      dispatch_source_cancel(v5);
      id v4 = self->_bleActionServiceTimer;
      self->_bleActionServiceTimer = 0;
    }
  }
}

- (void)_serviceTimeoutFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDProxHandoffAgent *)self _serviceTimeoutInvalidate];
}

- (void)_throttleEventDidOccur
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unint64_t v3 = self->_prefThrottleEventCount + 1;

  [(SDProxHandoffAgent *)self _throttleEventSet:v3];
}

- (void)_throttleEventSet:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFPrefs_SetInt64();

  [(SDProxHandoffAgent *)self prefsChanged];
}

- (BOOL)_throttleEventsReachedMax
{
  return !self->_prefIgnoreMediumThrottle && self->_prefThrottleEventCount >= self->_prefThrottleEventMax;
}

- (void)_throttleEventsReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDProxHandoffAgent *)self _throttleEventSet:0];
}

- (BOOL)_throttleMediumAllowsTrigger
{
  if (self->_prefIgnoreMediumThrottle || self->_prefMediumBubbleLastTicks == -1) {
    return 1;
  }
  mach_absolute_time();
  UpTicksToSecondsF();
  return 64800.0 - v3 <= 0.0;
}

- (void)_throttleMediumReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDProxHandoffAgent *)self _throttleMediumSetTicks:-1];
}

- (void)_throttleMediumSetTicks:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFPrefs_SetInt64();

  [(SDProxHandoffAgent *)self prefsChanged];
}

- (void)_proxiedNotificationDidDismiss:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = [(SDProxHandoffAgent *)self _combinedDeviceForUIID:v6];
  id v8 = v7;
  if (!v7) {
    goto LABEL_29;
  }
  unint64_t v9 = a4 - 1;
  if ((unint64_t)(a4 - 1) > 3) {
    CFStringRef v10 = @"?";
  }
  else {
    CFStringRef v10 = *(&off_1008CC558 + v9);
  }
  id v11 = [v7 notificationType];
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    if (v9 > 3) {
      CFStringRef v12 = @"?";
    }
    else {
      CFStringRef v12 = *(&off_1008CC558 + v9);
    }
    id v26 = v6;
    CFStringRef v27 = v12;
    LogPrintF();
  }
  [v8 effectiveID:v26, v27];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v6;
  long long v15 = v14;
  if (v13 == v14)
  {
    CFStringRef v28 = v10;
  }
  else
  {
    if ((v14 != 0) == (v13 == 0))
    {

LABEL_25:
      if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_29;
    }
    CFStringRef v28 = v10;
    unsigned __int8 v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_25;
    }
  }
  [(SDProxHandoffAgent *)self _proximityClientDeviceWasDismissed:v15 reason:a4];
  unsigned int v17 = [v8 canTransition:15];
  if (v9 <= 1 && v17)
  {
    long long v18 = [v8 bleDevice];
    long long v19 = [v18 bleDevice];
    unsigned __int8 v20 = [v19 insideSmallBubble];

    if ((v20 & 1) == 0) {
      [v8 setNextState:15];
    }
    [v8 setDismissReason:a4];
    [(SDProxHandoffAgent *)self _run];
  }
  v29[0] = @"notificationDurationSecs";
  [v8 notificationDurationSecs];
  long long v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v30[0] = v21;
  v29[1] = @"notificationType";
  uint64_t v22 = +[NSNumber numberWithUnsignedInt:v11];
  v30[1] = v22;
  v29[2] = @"pendingContentSecs";
  [v8 pendingContentDurationSecs];
  long long v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v30[2] = v23;
  v29[3] = @"reason";
  uint64_t v24 = +[NSNumber numberWithInteger:a4];
  v30[3] = v24;
  v30[4] = v28;
  v29[4] = @"reasonStr";
  v29[5] = @"uiID";
  v30[5] = v15;
  id v25 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];
  SFMetricsLog();

LABEL_29:
}

- (void)_proxiedNotificationWasTapped:(id)a3
{
  id v4 = a3;
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    id v31 = v4;
    LogPrintF();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v6)
  {
    id v7 = v6;
    id v33 = 0;
    double v34 = 0;
    uint64_t v35 = *(void *)v41;
    int v8 = 0x7FFFFFFF;
    id obj = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v11 = -[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v10, v31);
        CFStringRef v12 = v11;
        if (v11)
        {
          id v13 = self;
          id v14 = [v11 bleDevice];
          long long v15 = [v14 bleDevice];
          signed int v16 = [v15 rssiEstimate];

          unint64_t v17 = v16;
          unint64_t v18 = v8;
          if ((unint64_t)v16 <= 0x8000000000000000) {
            unint64_t v17 = 0x8000000000000000;
          }
          if ((unint64_t)v8 <= 0x8000000000000000) {
            unint64_t v18 = 0x8000000000000000;
          }
          if (v17 > v18)
          {
            id v19 = v12;

            id v20 = v10;
            id v33 = v20;
            double v34 = v19;
            int v8 = v16;
          }
          self = v13;
        }
      }
      id v5 = obj;
      id v7 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);

    if (v34)
    {
      long long v21 = v33;
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        id v31 = v34;
        LogPrintF();
      }
      if (!self->_userOnCall) {
        [(SDProxHandoffAgent *)self _proximityClientDeviceWasSelected:v33];
      }
      if (objc_msgSend(v34, "canTransition:", 18, v31))
      {
        [v34 setNextState:18];
        [(SDProxHandoffAgent *)self _run];
      }
      id v23 = [obj mutableCopy];
      [v23 removeObject:v33];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v24 = v23;
      id v25 = [v24 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v37;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(v24);
            }
            [(SDProxHandoffAgent *)self _proxiedNotificationDidDismiss:*(void *)(*((void *)&v36 + 1) + 8 * (void)j) reason:2];
          }
          id v26 = [v24 countByEnumeratingWithState:&v36 objects:v46 count:16];
        }
        while (v26);
      }

      v44[0] = @"onCall";
      int v29 = +[NSNumber numberWithBool:self->_userOnCall];
      v44[1] = @"uiID";
      v45[0] = v29;
      v45[1] = v33;
      char v30 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      SFMetricsLog();

      id v5 = obj;
      uint64_t v22 = v34;
      goto LABEL_44;
    }
    long long v21 = v33;
  }
  else
  {

    long long v21 = 0;
  }
  if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v22 = 0;
LABEL_44:
}

- (void)notificationDidDismiss:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B7518;
  block[3] = &unk_1008CBB30;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)userDidTapNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B7610;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_hapticsFireNotificationSuccess
{
  if (SFDeviceClassCodeGet() != 4)
  {
    if (!self->_hapticNotification) {
      [(SDProxHandoffAgent *)self _hapticsEnsurePrepared];
    }
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    hapticNotification = self->_hapticNotification;
    [(UINotificationFeedbackGenerator *)hapticNotification notificationOccurred:0];
  }
}

- (void)_hapticsEnsurePrepared
{
  if (SFDeviceClassCodeGet() != 4)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    double v3 = (UINotificationFeedbackGenerator *)objc_alloc_init((Class)UINotificationFeedbackGenerator);
    hapticNotification = self->_hapticNotification;
    self->_hapticNotification = v3;

    id v5 = self->_hapticNotification;
    [(UINotificationFeedbackGenerator *)v5 prepare];
  }
}

- (void)_hapticsEnsureStopped
{
  hapticNotification = self->_hapticNotification;
  self->_hapticNotification = 0;
}

- (void)_uiDismissWhenReady:(id)a3 reason:(int64_t)a4
{
  id v12 = a3;
  mach_absolute_time();
  [v12 notificationTicks];
  UpTicksToSecondsF();
  double v7 = v6;
  if (1.5 - v6 > 0.0)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
    {
      double v11 = v7;
      LogPrintF();
    }
    if (objc_msgSend(v12, "canTransition:", 19, *(void *)&v11))
    {
      [v12 setDismissReason:a4];
      [v12 setNextState:19];
      [(SDProxHandoffAgent *)self _run];
    }
    [(SDProxHandoffAgent *)self _scheduleRunAfter:1.5 - v7];
    goto LABEL_17;
  }
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    double v11 = v7;
    LogPrintF();
  }
  [v12 setNotificationDurationSecs:v7, v11];
  id v8 = [v12 effectiveID];
  if (v8) {
    [(SFNotificationProxy *)self->_notificationProxy requestRemove:v8 withReason:a4];
  }

  unsigned int v9 = [v12 canTransition:20];
  id v10 = v12;
  if (v9)
  {
    [v12 setDismissReason:a4];
    [v12 setNextState:20];
    [(SDProxHandoffAgent *)self _run];
LABEL_17:
    id v10 = v12;
  }
}

- (void)_uiStopIfNeeded:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (SFDeviceClassCodeGet() - 1 <= 1)
  {
    double v7 = self->_uiDevice;
    if (!v7)
    {
LABEL_26:

      goto LABEL_27;
    }
    id v8 = [v6 effectiveID];
    if (v8)
    {
      unsigned int v9 = [(SFCombinedDevice *)self->_uiDevice effectiveID];
      id v10 = v8;
      id v11 = v9;
      if (v10 == v11)
      {

        goto LABEL_9;
      }
      id v12 = v11;
      if (v11)
      {
        unsigned int v13 = [v10 isEqual:v11];

        if (!v13) {
          goto LABEL_25;
        }
LABEL_9:
        if ((unint64_t)(a4 - 1) > 3) {
          CFStringRef v14 = @"?";
        }
        else {
          CFStringRef v14 = *(&off_1008CC558 + a4 - 1);
        }
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          id v24 = v10;
          CFStringRef v25 = v14;
          LogPrintF();
        }
        -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v10, a4, v24, v25);
        long long v15 = [v6 attachmentURL];
        if (v15)
        {
          CFStringRef v26 = v14;
          signed int v16 = +[NSFileManager defaultManager];
          id v27 = 0;
          id v17 = [v16 removeItemAtURL:v15 error:&v27];
          id v18 = v27;

          if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
          {
            id v19 = [v18 localizedDescription];
            LogPrintF();
          }
          CFStringRef v14 = v26;
        }
        else
        {
          id v17 = 0;
        }

        v28[0] = @"deletedAttachment";
        id v20 = +[NSNumber numberWithBool:v17];
        v29[0] = v20;
        v28[1] = @"notificationType";
        long long v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 notificationType]);
        v29[1] = v21;
        v28[2] = @"reason";
        uint64_t v22 = +[NSNumber numberWithInteger:a4];
        v29[2] = v22;
        v29[3] = v14;
        v28[3] = @"reasonStr";
        v28[4] = @"uiID";
        v29[4] = v10;
        id v23 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
        SFMetricsLog();

        goto LABEL_25;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:
}

- (id)_combinedDeviceForUIID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_1000B60A8;
  signed int v16 = sub_1000B60B8;
  id v17 = 0;
  mappedDevices = self->_mappedDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B7F08;
  v9[3] = &unk_1008CC3E0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(NSMutableDictionary *)mappedDevices enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)_combinedDeviceIsSuppressed:(id)a3
{
  id v4 = a3;
  id v5 = [v4 effectiveID];
  BOOL v6 = v5 && ([(NSMutableSet *)self->_suppressedDeviceIDs containsObject:v5] & 1) != 0;

  return v6;
}

- (BOOL)_expectingContentForDeviceID:(id)a3
{
  double v3 = [(SDProxHandoffAgent *)self _combinedDeviceForUIID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_combinedDevicePrepareForCallTransferTrigger:(id)a3
{
  id v6 = a3;
  [v6 setNotificationType:3];
  BOOL v4 = [(SDProxHandoffAgent *)self _routeForDevice:v6];
  if (v4) {
    [v6 setRoute:v4];
  }

  id v5 = [(SDProxHandoffAgent *)self callTransferInfoForDevice:v6];
  if (v5) {
    [v6 setNotificationInfo:v5];
  }
}

- (void)_resetAllStates
{
  uiDevice = self->_uiDevice;
  self->_uiDevice = 0;

  mappedDevices = self->_mappedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B81B4;
  v5[3] = &unk_1008CC408;
  v5[4] = self;
  [(NSMutableDictionary *)mappedDevices enumerateKeysAndObjectsUsingBlock:v5];
  [(SDProxHandoffAgent *)self _run];
}

- (id)_routeForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SDProxHandoffAgent *)self _routes];
  if (v5)
  {
    id v6 = [v4 bleDevice];
    if (v6)
    {
      id v7 = [v4 clinkDevice];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v11 = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
        SFDeviceToRPCompanionLinkDevice();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v5;
      id v10 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        id v21 = v4;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v12);
            }
            long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (sub_1000AC3E4(v6, v15, v9))
            {
              id v16 = v15;
              uint64_t v17 = [v16 uniqueIdentifier];
              if (v17)
              {
                id v18 = (void *)v17;
                unsigned __int8 v19 = [v16 isHomePodFamily];

                if (v19)
                {
                  id v10 = v16;
                  goto LABEL_22;
                }
              }
              else
              {
              }
            }
          }
          id v10 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v10);
LABEL_22:
        id v4 = v21;
      }
    }
    else
    {
      if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_routes
{
  v2 = [(objc_class *)off_100966EB0() sharedInstance];
  double v3 = [v2 routeController];
  id v4 = [v3 routes];

  return v4;
}

- (BOOL)_shouldMediumPromptWithInfo:(id)a3
{
  id v4 = a3;
  if (!self->_prefMediumBubbleEnabled)
  {
    if (dword_100966E40 > 30 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
LABEL_13:
    LogPrintF();
LABEL_19:
    BOOL v5 = 0;
    goto LABEL_20;
  }
  if ([(SDProxHandoffAgent *)self _throttleEventsReachedMax])
  {
    if (dword_100966E40 > 30 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (![(SDProxHandoffAgent *)self _throttleMediumAllowsTrigger])
  {
    if (dword_100966E40 > 30 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  BOOL v5 = [v4 interactionBehavior] == 2;
LABEL_20:

  return v5;
}

- (id)callTransferInfoForDevice:(id)a3
{
  id v4 = a3;
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = [(SDProxHandoffAgent *)self currentCall];
  if (!v5 && dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = [(SDProxHandoffAgent *)self contactForCall:v5];
  if (!v6 && dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v7 = [(SDProxHandoffAgent *)self appIconForCall:v5];
  if (!v7 && dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = [(SDProxHandoffAgent *)self persistImageForContact:v6 withAppIcon:v7];
  if (v8)
  {
    [v4 setAttachmentURL:v8];
  }
  else if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v9 = [(SDProxHandoffAgent *)self displayNameForContact:v6];
  long long v23 = (void *)v5;
  if (!v9)
  {

    id v11 = 0;
LABEL_31:
    id v12 = SFLocalizedStringForKey();

    goto LABEL_32;
  }
  SFDeviceClassCodeGet();
  id v10 = SFLocalizedStringForKey();
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v9, v5);

  if (!v11) {
    goto LABEL_31;
  }
  id v12 = v11;
  if (![v11 length]) {
    goto LABEL_31;
  }
LABEL_32:
  uint64_t v13 = SFLocalizedStringForKey();
  uint64_t v14 = [v4 route];
  long long v15 = v14;
  if (v14 && [v14 isCurrentlyPicked])
  {
    SFDeviceClassCodeGet();
    uint64_t v16 = SFLocalizedStringForKey();

    uint64_t v17 = 1;
    uint64_t v13 = (void *)v16;
  }
  else
  {
    uint64_t v17 = 2;
  }

  id v18 = objc_alloc_init((Class)SFNotificationInfo);
  unsigned __int8 v19 = v18;
  if (v8) {
    [v18 setAttachmentURL:v8];
  }
  [v19 setBody:v12];
  id v20 = [v4 name];
  id v21 = SFHomePodDisplayNameForDeviceName();
  [v19 setHeader:v21];

  [v19 setInteractionBehavior:2];
  [v19 setInteractionDirection:v17];
  [v19 setNotificationType:3];
  [v19 setTitle:v13];
  [v19 setHomePodType:-[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v4)];

  return v19;
}

- (BOOL)callTransferShouldPush:(id)a3
{
  double v3 = [a3 route];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 isCurrentlyPicked] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)mediaTransferInfoFromInfo:(id)a3
{
  id v3 = [a3 copy];
  [v3 setNotificationType:2];
  SFDeviceClassCodeGet();
  [v3 interactionDirection];
  if (![v3 interactionBehavior])
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [v3 setInteractionBehavior:2];
  }
  id v4 = SFLocalizedStringForKey();
  [v3 setTitle:v4];

  return v3;
}

- (unint64_t)notificationHomePodTypeForDevice:(id)a3
{
  id v3 = [a3 bleDevice];
  id v4 = [v3 model];
  unsigned int v5 = [v4 isEqualToString:@"AudioAccessory5,1"];

  if (v5) {
    return 2;
  }
  else {
    return 1;
  }
}

- (CGImage)appIconForCall:(id)a3
{
  if (a3)
  {
    id v3 = [a3 provider];
    id v4 = v3;
    if (!v3)
    {
      if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_29;
      }
      goto LABEL_9;
    }
    unsigned int v5 = [v3 displayAppBundleIdentifier];
    if (v5)
    {
      id v6 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v5];

      if (v6) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v8 = [v4 inCallUIBundleIdentifier];
    if (v8)
    {
      id v6 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v8];

      if (v6) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v9 = [v4 bundleIdentifier];
    if (!v9)
    {

      goto LABEL_19;
    }
    id v6 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v9];

    if (!v6)
    {
LABEL_19:
      id v10 = [v4 bundleURL];
      if (v10)
      {
        id v6 = [objc_alloc((Class)ISIcon) initWithURL:v10];

        if (v6) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      if (dword_100966E40 > 90 || dword_100966E40 == -1 && !_LogCategory_Initialize())
      {
LABEL_29:
        id v7 = 0;
        goto LABEL_30;
      }
LABEL_9:
      LogPrintF();
      goto LABEL_29;
    }
LABEL_21:
    id v11 = [objc_alloc((Class)ISImageDescriptor) initWithSize:12.0 scale:12.0];
    id v7 = (CGImage *)[v6 CGImageForImageDescriptor:v11];

LABEL_30:
    return v7;
  }
  return 0;
}

- (id)contactForCall:(id)a3
{
  if (a3)
  {
    id v3 = [a3 contactIdentifier];
    if (v3)
    {
      id v4 = [(objc_class *)off_100966EB0() sharedInstance];
      unsigned int v5 = [v4 contactStore];
      id v6 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
      v13[0] = v6;
      v13[1] = CNContactThumbnailImageDataKey;
      v13[2] = CNContactGivenNameKey;
      v13[3] = CNContactFamilyNameKey;
      v13[4] = CNContactTypeKey;
      id v7 = +[NSArray arrayWithObjects:v13 count:5];
      id v12 = 0;
      id v8 = [v5 unifiedContactWithIdentifier:v3 keysToFetch:v7 error:&v12];
      id v9 = v12;
      if (v8)
      {
        id v10 = v8;
      }
      else if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)currentCall
{
  v2 = [(objc_class *)off_100966EB0() sharedInstance];
  id v3 = [v2 currentCalls];
  id v4 = [v3 lastObject];
  if (v4 && dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v4;
}

- (id)displayNameForContact:(id)a3
{
  if (a3)
  {
    id v4 = +[CNContactFormatter stringFromContact:a3 style:0];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)persistImageForContact:(id)a3 withAppIcon:(CGImage *)a4
{
  id v5 = a3;
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v5;
    uint64_t v13 = a4;
    LogPrintF();
  }
  id v6 = +[SDXPCHelperConnection makeActivatedConnection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B9304;
  v14[3] = &unk_1008CA4B8;
  v14[4] = v6;
  id v7 = objc_retainBlock(v14);
  if (a4)
  {
    SFDataFromCGImage();
    id v8 = (CGImage *)objc_claimAutoreleasedReturnValue();
    a4 = v8;
    if (v8) {
      id v9 = v8;
    }
  }
  id v10 = [v6 urlToCGImgDataForCallHandoffIconWithAppIconImageData:a4 contact:v5];

  ((void (*)(void *))v7[2])(v7);

  return v10;
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  if (dword_100966E40 <= 50 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v4;
    LogPrintF();
  }
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleActionDevices, "objectForKeyedSubscript:", v4, v7);

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B9420;
    block[3] = &unk_1008CA640;
    block[4] = self;
    id v9 = v4;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)testUI:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUUID);
  unsigned int v6 = [v4 containsString:@"fail"];

  if (v6) {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000002";
  }
  else {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v26 = [v5 initWithUUIDString:v7];
  id v8 = objc_alloc_init((Class)SFDevice);
  [v8 setIdentifier:v26];
  [v8 setName:@"Living Room HomePod"];
  id v9 = [objc_alloc(off_100966EB8()) initWithUniqueIdentifier:@"uniqueID" name:@"Living Room"];
  [v9 setDeviceType:6];
  id v10 = [(SDProxHandoffAgent *)self currentCall];
  if (v10)
  {
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v11 = [(SDProxHandoffAgent *)self contactForCall:v10];
    id v12 = [(SDProxHandoffAgent *)self persistImageForContact:v11 withAppIcon:[(SDProxHandoffAgent *)self appIconForCall:v10]];
    if (v12)
    {
      id v13 = v12;
      id v14 = v13;
      goto LABEL_13;
    }
  }
  long long v15 = +[SDStatusMonitor sharedMonitor];
  id v10 = [v15 meCard];

  id v11 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:@"com.apple.mobilephone"];
  id v14 = [objc_alloc((Class)ISImageDescriptor) initWithSize:12.0 scale:12.0];
  -[SDProxHandoffAgent persistImageForContact:withAppIcon:](self, "persistImageForContact:withAppIcon:", v10, [v11 CGImageForImageDescriptor:v14]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  uint64_t v16 = v13;

  id v17 = objc_alloc_init((Class)SFNotificationInfo);
  [v17 setAttachmentURL:v16];
  id v18 = SFLocalizedStringForKey();
  [v17 setBody:v18];

  unsigned __int8 v19 = [v8 name];
  if (v19)
  {
    [v17 setHeader:v19];
  }
  else
  {
    id v20 = SFLocalizedStringForKey();
    [v17 setHeader:v20];
  }
  [v17 setNotificationType:3];
  id v21 = SFLocalizedStringForKey();
  [v17 setTitle:v21];

  long long v22 = objc_alloc_init(SFCombinedDevice);
  id v23 = objc_alloc_init((Class)RPCompanionLinkDevice);
  [(SFCombinedDevice *)v22 setClinkDevice:v23];

  [(SFCombinedDevice *)v22 setForced:1];
  long long v24 = +[NSUUID UUID];
  long long v25 = [v24 UUIDString];
  [(SFCombinedDevice *)v22 setForcedID:v25];

  [(SFCombinedDevice *)v22 setNotificationInfo:v17];
  [(SFCombinedDevice *)v22 setNotificationType:3];
  [(SFCombinedDevice *)v22 setRoute:v9];
  [(SFCombinedDevice *)v22 setBleDevice:v8];
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_uiDevice, 0);
  objc_storeStrong((id *)&self->_transferTimer, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_suppressedDeviceIDs, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_proxClients, 0);
  objc_storeStrong((id *)&self->_notificationProxy, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_mappedDevices, 0);
  objc_storeStrong((id *)&self->_hapticNotification, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_bleUnmapped, 0);
  objc_storeStrong((id *)&self->_bleMapCoalescer, 0);
  objc_storeStrong((id *)&self->_bleInfoDevices, 0);
  objc_storeStrong((id *)&self->_bleInfoDiscovery, 0);
  objc_storeStrong((id *)&self->_bleActionServiceTimer, 0);
  objc_storeStrong((id *)&self->_bleActionService, 0);
  objc_storeStrong((id *)&self->_bleActionScanTimer, 0);
  objc_storeStrong((id *)&self->_bleActionDevices, 0);

  objc_storeStrong((id *)&self->_bleActionDiscovery, 0);
}

@end