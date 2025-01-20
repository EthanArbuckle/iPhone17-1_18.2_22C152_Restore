@interface AAServicesDaemon
+ (id)sharedAAServicesDaemon;
- (AAServicesDaemon)init;
- (BOOL)_shouldRunHeadGesture;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_activateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)_activateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)_avSystemControllerServerReset;
- (void)_createBannerSessionMuteActionForIOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6;
- (void)_createBannerSessionMuteActionForMacOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6;
- (void)_deregisterFromAVSystemControllerDeathNotifications;
- (void)_deregisterFromAVSystemControllerStateNotifications;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_ensureHeadGestureDetectionStarted;
- (void)_ensureHeadGestureDetectionStopped;
- (void)_handleCallIsActiveDidChangeNotification:(id)a3;
- (void)_handlePTTCallStatusChangedNotification:(id)a3;
- (void)_invalidateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)_invalidateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)_invalidateMuteBanner;
- (void)_muteStateChanged;
- (void)_playChime:(int)a3;
- (void)_processBannerRequestForMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)_processFirstPartyBannerRequestWithCompletion:(id)a3;
- (void)_registerForAVSystemControllerDeathNotifications;
- (void)_registerForAVSystemControllerStateNotifications;
- (void)_reportDeviceFound:(id)a3;
- (void)_reportDeviceLost:(id)a3;
- (void)_reverseMuteActionForToken:(id *)a3 shouldMute:(BOOL)a4;
- (void)_scheduleUpdate;
- (void)_submitMetricsForMuteAction:(int)a3 auditTokenBundleID:(id)a4 appName:(id)a5 appBundleID:(id)a6;
- (void)_toggleInputMuteState;
- (void)_update;
- (void)_updateAudioSessionControl:(id)a3;
- (void)_updateBannerChimeSuppressionState;
- (void)_updateDetectedHeadGesture:(id)a3;
- (void)_updateMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)activateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)activateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)invalidateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)invalidateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)reportDeviceFound:(id)a3;
- (void)reportDeviceLost:(id)a3;
- (void)reportHeadGestureDetected:(id)a3;
- (void)updateAudioSessionControl:(id)a3;
@end

@implementation AAServicesDaemon

+ (id)sharedAAServicesDaemon
{
  if (qword_100263E88 != -1) {
    dispatch_once(&qword_100263E88, &stru_100232F60);
  }
  v2 = (void *)qword_100263E80;

  return v2;
}

- (AAServicesDaemon)init
{
  v11.receiver = self;
  v11.super_class = (Class)AAServicesDaemon;
  v2 = [(AAServicesDaemon *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectedHeadphones = v2->_connectedHeadphones;
    v2->_connectedHeadphones = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AAServicesDaemon", v5);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    *(void *)&v2->_muteStateChangedToken = -1;
    tuSharedInst = v2->_tuSharedInst;
    v2->_tuSharedInst = 0;

    objc_storeStrong((id *)&qword_10026AAD0, v2);
    v9 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v96 = 0;
  NSAppendPrintF_safe();
  id v95 = 0;
  id v54 = [(NSMutableSet *)self->_activatedAudioSessionControlSet count];
  NSAppendPrintF();
  id v4 = v95;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v5 = self->_activatedAudioSessionControlSet;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v91, v100, 16, v54);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v92;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v92 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v91 + 1) + 8 * (void)v9);
        v90 = v10;
        uint64_t v56 = v11;
        NSAppendPrintF();
        id v4 = v10;

        v9 = (char *)v9 + 1;
        v10 = v4;
      }
      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v91, v100, 16, v56);
    }
    while (v7);
  }

  id v89 = v4;
  NSAppendPrintF();
  id v12 = v4;

  currentAudioSessionControl = self->_currentAudioSessionControl;
  if (currentAudioSessionControl)
  {
    id v88 = v12;
    v55 = currentAudioSessionControl;
    NSAppendPrintF();
    id v14 = v12;

    id v12 = v14;
  }
  id v87 = v12;
  id v57 = [(NSMutableSet *)self->_activatedDeviceManagerSet count];
  NSAppendPrintF();
  id v15 = v12;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v16 = self->_activatedDeviceManagerSet;
  id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v83, v99, 16, v57);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v84;
    do
    {
      v20 = 0;
      v21 = v15;
      do
      {
        if (*(void *)v84 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v83 + 1) + 8 * (void)v20);
        v82 = v21;
        uint64_t v58 = v22;
        NSAppendPrintF();
        id v15 = v21;

        v20 = (char *)v20 + 1;
        v21 = v15;
      }
      while (v18 != v20);
      id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v83, v99, 16, v58);
    }
    while (v18);
  }

  id v81 = v15;
  NSAppendPrintF();
  id v23 = v15;

  uiNotificationSessionMuteControl = self->_uiNotificationSessionMuteControl;
  if (uiNotificationSessionMuteControl)
  {
    id v80 = v23;
    v59 = uiNotificationSessionMuteControl;
    NSAppendPrintF();
    id v25 = v23;

    id v23 = v25;
  }
  id v79 = v23;
  if (self->_isCallActive) {
    v26 = "yes";
  }
  else {
    v26 = "no";
  }
  if (self->_isCallHighPriority) {
    v27 = "yes";
  }
  else {
    v27 = "no";
  }
  v60 = v26;
  v64 = v27;
  NSAppendPrintF_safe();
  id v28 = v79;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v29 = (void *)CFPrefs_CopyKeys();
  id v30 = [v29 countByEnumeratingWithState:&v75 objects:v98 count:16];
  if (!v30) {
    goto LABEL_36;
  }
  id v31 = v30;
  v67 = self;
  int v32 = 0;
  uint64_t v33 = *(void *)v76;
  do
  {
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v76 != v33) {
        objc_enumerationMutation(v29);
      }
      uint64_t v35 = *(void *)(*((void *)&v75 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v74 = v28;
        uint64_t v61 = v35;
        v65 = (void *)CFPrefs_CopyTypedValue();
        NSAppendPrintF();
        id v36 = v28;

        ++v32;
        id v28 = v36;
      }
    }
    id v31 = [v29 countByEnumeratingWithState:&v75 objects:v98 count:16];
  }
  while (v31);

  if (v32 >= 1)
  {
    id v73 = v28;
    NSAppendPrintF();
    v29 = v28;
    id v28 = v28;
    self = v67;
LABEL_36:

    goto LABEL_38;
  }
  self = v67;
LABEL_38:
  id v37 = [(NSMutableSet *)self->_xpcConnections count];
  if (v37)
  {
    id v72 = v28;
    id v62 = v37;
    NSAppendPrintF();
    id v38 = v28;

    id v28 = v38;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v39 = self->_xpcConnections;
  id v40 = [(NSMutableSet *)v39 countByEnumeratingWithState:&v68 objects:v97 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v69;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v69 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
        v45 = [v44 xpcCnx:v62 with:v66];
        id v46 = [v45 processIdentifier];
        unsigned int v47 = [v44 entitled];
        v48 = "yes";
        if (!v47) {
          v48 = "no";
        }
        id v62 = v46;
        v66 = v48;
        NSAppendPrintF();
        id v49 = v28;

        NSAppendPrintF();
        id v28 = v49;
      }
      id v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v68, v97, 16, v46, v66);
    }
    while (v41);
  }

  NSAppendPrintF();
  id v50 = v28;

  v51 = +[AADeviceManagerDaemon sharedAADeviceManagerDaemon];
  v63 = CUDescriptionWithLevel();
  NSAppendPrintF();
  id v52 = v50;

  return v52;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014A78;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  if (_os_feature_enabled_impl())
  {
    v3 = +[AAConversationDetectSessionManager sharedCDSessionManager];
    [v3 activate];
  }
  if (_os_feature_enabled_impl())
  {
    id v4 = +[AAContextManager sharedContextManager];
    [v4 activate];
  }
  v5 = +[AADeviceManagerDaemon sharedAADeviceManagerDaemon];
  [v5 setDispatchQueue:self->_dispatchQueue];

  id v6 = +[AADeviceManagerDaemon sharedAADeviceManagerDaemon];
  [v6 activate];

  if (!self->_xpcListener)
  {
    id v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.AudioAccessoryServices"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v7;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (self->_muteStateChangedToken == -1 && _os_feature_enabled_impl())
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000150D0;
    handler[3] = &unk_1002329C0;
    handler[4] = self;
    notify_register_dispatch("com.apple.audioaccessoryd.MuteState", &self->_muteStateChangedToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  [(AAServicesDaemon *)self _registerForAVSystemControllerDeathNotifications];
  [(AAServicesDaemon *)self _registerForAVSystemControllerStateNotifications];
  [(AAServicesDaemon *)self _updateBannerChimeSuppressionState];
  v10 = +[TUCallCenter callCenterWithQueue:self->_dispatchQueue];
  tuSharedInst = self->_tuSharedInst;
  self->_tuSharedInst = v10;

  id v12 = +[TUCallCenter sharedInstance];
  tuBargeCallCenter = self->_tuBargeCallCenter;
  self->_tuBargeCallCenter = v12;

  if (!self->_tuBargeCallStatusChangedNotificationRegistered)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"_handlePTTCallStatusChangedNotification:" name:TUBargeCallStatusChangedNotification object:0];

    self->_tuBargeCallStatusChangedNotificationRegistered = 1;
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    id v15 = self->_dispatchQueue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10001516C;
    v41[3] = &unk_1002329C0;
    v41[4] = self;
    notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)v15, v41);
  }
  if (!self->_stateHandle)
  {
    id v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    id v38 = sub_1000151F0;
    v39 = &unk_100232F88;
    id v40 = self;
    self->_stateHandle = os_state_add_handler();
  }
  v16 = self->_connectedDeviceDiscovery;
  if (!v16)
  {
    id v17 = objc_alloc_init((Class)CBDiscovery);
    [v17 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_connectedDeviceDiscovery, v17);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001520C;
    v33[3] = &unk_1002329E8;
    id v18 = v17;
    id v34 = v18;
    uint64_t v35 = self;
    [v18 setDeviceFoundHandler:v33];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100015228;
    v30[3] = &unk_1002329E8;
    id v19 = v18;
    id v31 = v19;
    int v32 = self;
    [v19 setDeviceLostHandler:v30];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100015244;
    v27[3] = &unk_100232A10;
    id v20 = v19;
    id v28 = v20;
    v29 = self;
    [v20 setInterruptionHandler:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000152D8;
    v25[3] = &unk_100232710;
    id v21 = v20;
    id v26 = v21;
    [v21 setInvalidationHandler:v25];
    [v21 setDiscoveryFlags:((unint64_t)[v21 discoveryFlags] | 0x80000200000)];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100015358;
    v22[3] = &unk_100232A38;
    v16 = (CBDiscovery *)v21;
    id v23 = v16;
    v24 = self;
    [(CBDiscovery *)v16 activateWithCompletion:v22];
  }
  notify_post("com.apple.AudioAccessory.daemonStarted");
  [(AAServicesDaemon *)self _prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001550C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(AAServicesXPCConnection);
  [(AAServicesXPCConnection *)v6 setDaemon:self];
  [(AAServicesXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  [(AAServicesXPCConnection *)v6 setXpcCnx:v5];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AAServicesXPCClientInterface];
  [v5 _setQueue:self->_dispatchQueue];
  uint64_t v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AAServicesXPCDaemonInterface];
  [v5 setExportedInterface:v11];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000158E4;
  v13[3] = &unk_100232A10;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  [v5 setRemoteObjectInterface:v10];
  [v5 resume];
  if (dword_100260FE0 <= 20 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_scheduleUpdate
{
  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015978;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }
}

- (void)_update
{
  self->_updatePending = 0;
  if ([(AAServicesDaemon *)self _shouldRunHeadGesture])
  {
    [(AAServicesDaemon *)self _ensureHeadGestureDetectionStarted];
  }
  else
  {
    [(AAServicesDaemon *)self _ensureHeadGestureDetectionStopped];
  }
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_100260FE0 <= 20)
  {
    if (dword_100260FE0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      id v5 = [v4 xpcCnx];
      id v7 = [v5 processIdentifier];
      LogPrintF();

      id v4 = v8;
    }
  }
  [v4 xpcConnectionInvalidated:v7];
  [(NSMutableSet *)self->_xpcConnections removeObject:v8];
  [(AAServicesDaemon *)self _update];
}

- (void)activateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015B7C;
  block[3] = &unk_1002328D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_activatedAudioRoutingControlSet;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = v6;
        id v15 = v13;
        if (v15 == v14)
        {

LABEL_17:
          if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
          {
            id v21 = v14;
            LogPrintF();
          }
          goto LABEL_26;
        }
        v16 = v15;
        if ((v6 == 0) != (v15 != 0))
        {
          unsigned __int8 v17 = [v14 isEqual:v15];

          if (v17) {
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (dword_100260FE0 < 31 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v6;
    LogPrintF();
  }
  activatedAudioRoutingControlSet = self->_activatedAudioRoutingControlSet;
  if (!activatedAudioRoutingControlSet)
  {
    id v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v20 = self->_activatedAudioRoutingControlSet;
    self->_activatedAudioRoutingControlSet = v19;

    activatedAudioRoutingControlSet = self->_activatedAudioRoutingControlSet;
  }
  -[NSMutableSet addObject:](activatedAudioRoutingControlSet, "addObject:", v6, v21);
  objc_storeStrong((id *)&self->_currentAudioRoutingControl, a3);
LABEL_26:
  [(AAServicesDaemon *)self _update];
  v7[2](v7, 0);
}

- (void)invalidateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015ED0;
  block[3] = &unk_1002328D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = self->_activatedAudioRoutingControlSet;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v25;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v14 = v6;
      id v15 = v13;
      if (v15 == v14)
      {

        v16 = v14;
LABEL_15:
        if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
        {
          id v23 = v14;
          LogPrintF();
        }
        -[NSMutableSet removeObject:](self->_activatedAudioRoutingControlSet, "removeObject:", v14, v23);
        currentAudioRoutingControl = self->_currentAudioRoutingControl;
        id v19 = v16;
        id v20 = currentAudioRoutingControl;
        if (v19 == v20)
        {
        }
        else
        {
          id v21 = v20;
          if ((v19 == 0) == (v20 != 0))
          {

            goto LABEL_26;
          }
          unsigned int v22 = [(AAAudioRoutingControl *)v19 isEqual:v20];

          if (!v22) {
            goto LABEL_27;
          }
        }
        id v19 = self->_currentAudioRoutingControl;
        self->_currentAudioRoutingControl = 0;
LABEL_26:

        goto LABEL_27;
      }
      v16 = v15;
      if ((v6 == 0) != (v15 != 0))
      {
        unsigned int v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_27:

  [(AAServicesDaemon *)self _update];
  v7[2](v7, 0);
}

- (void)activateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016210;
  block[3] = &unk_1002328D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_activatedAudioSessionControlSet;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = v6;
        id v15 = v13;
        if (v15 == v14)
        {

LABEL_17:
          if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
          {
            id v21 = v14;
            LogPrintF();
          }
          goto LABEL_26;
        }
        v16 = v15;
        if ((v6 == 0) != (v15 != 0))
        {
          unsigned __int8 v17 = [v14 isEqual:v15];

          if (v17) {
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (dword_100260FE0 < 31 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v6;
    LogPrintF();
  }
  activatedAudioSessionControlSet = self->_activatedAudioSessionControlSet;
  if (!activatedAudioSessionControlSet)
  {
    id v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v20 = self->_activatedAudioSessionControlSet;
    self->_activatedAudioSessionControlSet = v19;

    activatedAudioSessionControlSet = self->_activatedAudioSessionControlSet;
  }
  -[NSMutableSet addObject:](activatedAudioSessionControlSet, "addObject:", v6, v21);
  objc_storeStrong((id *)&self->_currentAudioSessionControl, a3);
LABEL_26:
  [(AAServicesDaemon *)self _update];
  v7[2](v7, 0);
}

- (void)updateAudioSessionControl:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016538;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_updateAudioSessionControl:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_activatedAudioSessionControlSet;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_15:
          if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }

          [(AAServicesDaemon *)self _update];
          goto LABEL_20;
        }
        id v13 = v12;
        if ((v4 == 0) != (v12 != 0))
        {
          unsigned int v14 = [v11 isEqual:v12];

          if (v14) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_20:
}

- (void)invalidateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000167D4;
  block[3] = &unk_1002328D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = self->_activatedAudioSessionControlSet;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v25;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v14 = v6;
      id v15 = v13;
      if (v15 == v14)
      {

        long long v16 = v14;
LABEL_15:
        if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
        {
          id v23 = v14;
          LogPrintF();
        }
        -[NSMutableSet removeObject:](self->_activatedAudioSessionControlSet, "removeObject:", v14, v23);
        currentAudioSessionControl = self->_currentAudioSessionControl;
        id v19 = v16;
        id v20 = currentAudioSessionControl;
        if (v19 == v20)
        {
        }
        else
        {
          id v21 = v20;
          if ((v19 == 0) == (v20 != 0))
          {

            goto LABEL_26;
          }
          unsigned int v22 = [(AAAudioSessionControl *)v19 isEqual:v20];

          if (!v22) {
            goto LABEL_27;
          }
        }
        id v19 = self->_currentAudioSessionControl;
        self->_currentAudioSessionControl = 0;
LABEL_26:

        goto LABEL_27;
      }
      long long v16 = v15;
      if ((v6 == 0) != (v15 != 0))
      {
        unsigned int v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_27:

  [(AAServicesDaemon *)self _update];
  v7[2](v7, 0);
}

- (void)_deviceFound:(id)a3
{
  id v20 = a3;
  id v5 = [v20 identifier];
  p_currentAudioOwnerDevice = &self->_currentAudioOwnerDevice;
  id v7 = [(CBDevice *)self->_currentAudioOwnerDevice identifier];
  id v8 = v5;
  id v9 = v7;
  if (v8 == v9)
  {

    id v12 = v20;
  }
  else
  {
    id v10 = v9;
    if ((v8 == 0) == (v9 != 0))
    {

      id v12 = v20;
      goto LABEL_13;
    }
    unsigned __int8 v11 = [v8 isEqual:v9];

    id v12 = v20;
    if ((v11 & 1) == 0)
    {
LABEL_13:
      if (([v12 deviceFlags] & 0x40) != 0
        && [v20 audioStreamState] == 3)
      {
        if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
        {
          id v19 = v20;
          LogPrintF();
        }
        objc_storeStrong((id *)&self->_currentAudioOwnerDevice, a3);
      }
      unsigned int v14 = [v20 productID:v19] - 8194;
      if (v14 <= 0x24 && ((1 << v14) & 0x1C7BB7FF9BLL) != 0)
      {
        connectedHeadphones = self->_connectedHeadphones;
        if (!connectedHeadphones)
        {
          long long v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          unsigned int v17 = self->_connectedHeadphones;
          self->_connectedHeadphones = v16;

          connectedHeadphones = self->_connectedHeadphones;
        }
        long long v18 = [v20 identifier];
        [(NSMutableDictionary *)connectedHeadphones setObject:v20 forKeyedSubscript:v18];
      }
      [(AAServicesDaemon *)self _update];
      goto LABEL_28;
    }
  }
  if (([v12 deviceFlags] & 0x40) != 0
    && [v20 audioStreamState] == 3)
  {
    objc_storeStrong((id *)&self->_currentAudioOwnerDevice, a3);
  }
  else
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v13 = *p_currentAudioOwnerDevice;
    *p_currentAudioOwnerDevice = 0;
  }
LABEL_28:
}

- (void)_deviceLost:(id)a3
{
  id v13 = a3;
  id v4 = [v13 identifier];
  id v5 = [(CBDevice *)self->_currentAudioOwnerDevice identifier];
  currentAudioOwnerDevice = v4;
  id v7 = v5;
  if (currentAudioOwnerDevice == v7)
  {

    goto LABEL_6;
  }
  id v8 = v7;
  if ((currentAudioOwnerDevice == 0) == (v7 != 0))
  {

LABEL_12:
    goto LABEL_13;
  }
  unsigned __int8 v9 = [(CBDevice *)currentAudioOwnerDevice isEqual:v7];

  if (v9)
  {
LABEL_6:
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
    {
      id v12 = v13;
      LogPrintF();
    }
    currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
    self->_currentAudioOwnerDevice = 0;
    goto LABEL_12;
  }
LABEL_13:
  id v10 = [v13 identifier:v12];
  unsigned __int8 v11 = [(NSMutableDictionary *)self->_connectedHeadphones objectForKeyedSubscript:v10];
  if (v11)
  {
    [(NSMutableDictionary *)self->_connectedHeadphones setObject:0 forKeyedSubscript:v10];
    [(AAServicesDaemon *)self _update];
  }
}

- (BOOL)_shouldRunHeadGesture
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_activatedDeviceManagerSet;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 headGestureUpdateFlags])
        {
          if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
          {
            [v6 headGestureUpdateFlags];
            LogPrintF();
          }
          LOBYTE(v3) = 1;
          goto LABEL_15;
        }
      }
      id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v3;
}

- (void)_ensureHeadGestureDetectionStarted
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_activatedDeviceManagerSet;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "headGestureUpdateFlags", (void)v9))
        {
          long long v8 = +[AADeviceManagerDaemon sharedAADeviceManagerDaemon];
          [v8 startHeadGestureManagerWithFlags:[v7 headGestureUpdateFlags]];
        }
      }
      id v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_ensureHeadGestureDetectionStopped
{
  id v2 = +[AADeviceManagerDaemon sharedAADeviceManagerDaemon];
  [v2 stopHeadGestureManager];
}

- (void)_updateDetectedHeadGesture:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [v10 deviceManager:v13];
        unsigned int v12 = [v11 headGestureUpdateFlags];

        if (v12) {
          [v10 deviceManagerHeadGestureDetected:v4];
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)reportHeadGestureDetected:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  [(AAServicesDaemon *)self _updateDetectedHeadGesture:v5];
}

- (void)reportDeviceFound:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017364;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_reportDeviceFound:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v11 = [v10 deviceManager];
        if (v11) {
          [v10 deviceManagerReportDeviceFound:v4];
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)reportDeviceLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001752C;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_reportDeviceLost:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) deviceManagerReportDeviceLost:v4 (void)v10];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleCallIsActiveDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000176D0;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_handlePTTCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017968;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_updateBannerChimeSuppressionState
{
  if (self->_isCallActive)
  {
    int isPTTCallActive = self->_isPTTCallActive;
    self->_shouldSuppressMuteBanner = isPTTCallActive;
    p_shouldSuppressMuteBanner = &self->_shouldSuppressMuteBanner;
    BOOL isCallHighPriority = self->_isCallHighPriority;
  }
  else
  {
    int isPTTCallActive = 1;
    self->_shouldSuppressMuteBanner = 1;
    p_shouldSuppressMuteBanner = &self->_shouldSuppressMuteBanner;
    BOOL isCallHighPriority = 1;
  }
  self->_shouldSuppressMuteChime = isCallHighPriority;
  if (dword_100260FE0 <= 30)
  {
    if (dword_100260FE0 != -1 || (int v6 = _LogCategory_Initialize(), isPTTCallActive = *p_shouldSuppressMuteBanner, v6))
    {
      LogPrintF();
      int isPTTCallActive = *p_shouldSuppressMuteBanner;
    }
  }
  if (isPTTCallActive && self->_muteBanner)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(AAServicesDaemon *)self _invalidateMuteBanner];
  }
}

- (void)_createBannerSessionMuteActionForIOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (self->_muteBanner) {
    [(AAServicesDaemon *)self _invalidateMuteBanner];
  }
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = sub_100017F48;
  id v28 = sub_100017F58;
  id v29 = objc_alloc_init((Class)BTBannerUISession);
  objc_storeStrong((id *)&self->_muteBanner, (id)v25[5]);
  [(id)v25[5] setBannerAppID:v11];
  [(id)v25[5] setBannerType:2];
  [(id)v25[5] setCenterContentText:v10];
  if (a3 == 1)
  {
    long long v12 = @"mute";
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    long long v12 = @"unmute";
LABEL_12:
    [(id)v25[5] setCenterContentItemsText:v12];
    [(id)v25[5] setDispatchQueue:self->_dispatchQueue];
    [(id)v25[5] setTimeoutSeconds:4.0];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    long long v16 = *(_OWORD *)&a4->var0[4];
    long long v21 = *(_OWORD *)a4->var0;
    v19[2] = sub_100017F60;
    v19[3] = &unk_100232FB0;
    v19[4] = self;
    v19[5] = &v24;
    int v20 = a3;
    long long v22 = v16;
    BOOL v23 = a3 == 2;
    [(id)v25[5] setActionHandler:v19];
    [(id)v25[5] activate];

    goto LABEL_19;
  }
  currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
  if (currentAudioOwnerDevice)
  {
    long long v14 = [(CBDevice *)currentAudioOwnerDevice productName];
    if (v14)
    {
      unsigned int v15 = [(CBDevice *)self->_currentAudioOwnerDevice productID] - 8194;
      if (v15 <= 0x24 && ((1 << v15) & 0x1C7BB7FF9BLL) != 0)
      {

        long long v12 = [(CBDevice *)self->_currentAudioOwnerDevice productName];
        goto LABEL_12;
      }
    }
  }
  if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
  {
    long long v18 = self->_currentAudioOwnerDevice;
    LogPrintF();
    [(AAServicesDaemon *)self _invalidateMuteBanner];
  }
  else
  {
    [(AAServicesDaemon *)self _invalidateMuteBanner];
  }
LABEL_19:
  _Block_object_dispose(&v24, 8);
}

- (void)_createBannerSessionMuteActionForMacOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v9 = a6;
  if (_os_feature_enabled_impl())
  {
    if (self->_uiNotificationSessionMuteControl) {
      [(AAServicesDaemon *)self _invalidateMuteBanner];
    }
    id v10 = +[NSBundle bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.MuteControlUserNotifications.bundle"];
    id v11 = objc_alloc_init((Class)CUUserNotificationSession);
    objc_storeStrong((id *)&self->_uiNotificationSessionMuteControl, v11);
    [v11 setBundleID:@"com.apple.MuteControlUserNotifications"];
    [v11 setCategoryID:@"MuteControlUserNotifications"];
    [v11 setDispatchQueue:self->_dispatchQueue];
    [v11 setFlags:81];
    [v11 setIconAppIdentifier:v9];
    [v11 setLabel:@"MuteControl"];
    [v11 setSubtitleKey:@"TITLE_FORMAT"];
    [v11 setTimeoutSeconds:20.0];
    [v11 setTitleKey:@"TITLE_FORMAT"];
    long long v12 = CULocalizedStringEx();
    id v38 = v12;
    long long v13 = +[NSArray arrayWithObjects:&v38 count:1];
    [v11 setTitleArguments:v13];

    [v11 removeAllActions];
    long long v14 = &off_1001CF000;
    switch(a3)
    {
      case 3:
        currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
        if (currentAudioOwnerDevice)
        {
          uint64_t v19 = [(CBDevice *)currentAudioOwnerDevice productName];
          if (v19)
          {
            int v20 = (void *)v19;
            unsigned int v21 = [(CBDevice *)self->_currentAudioOwnerDevice productID] - 8194;
            if (v21 <= 0x24 && ((1 << v21) & 0x1C7BB7FF9BLL) != 0)
            {

              long long v22 = CULocalizedStringEx();
              if (v22)
              {
                BOOL v23 = [(CBDevice *)self->_currentAudioOwnerDevice productName];
                +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);
                uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v24 = &stru_10023D730;
              }
              uint64_t v35 = v24;
              id v28 = +[NSArray arrayWithObjects:&v35 count:1];
              [v11 setSubtitleArguments:v28];

              goto LABEL_23;
            }
          }
        }
        if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
        {
          id v29 = self->_currentAudioOwnerDevice;
LABEL_40:
          LogPrintF();
        }
        break;
      case 2:
        if (objc_opt_respondsToSelector()) {
          [v11 setUserInfo:&off_100244368];
        }
        unsigned int v15 = CULocalizedStringEx();
        id v36 = v15;
        char v16 = 1;
        uint64_t v17 = &v36;
        goto LABEL_22;
      case 1:
        if (objc_opt_respondsToSelector()) {
          [v11 setUserInfo:&off_100244340];
        }
        unsigned int v15 = CULocalizedStringEx();
        char v16 = 0;
        uint64_t v37 = v15;
        uint64_t v17 = &v37;
LABEL_22:
        long long v25 = +[NSArray arrayWithObjects:v17 count:1];
        [v11 setSubtitleArguments:v25];

        long long v22 = CULocalizedStringEx();
        v31[0] = _NSConcreteStackBlock;
        long long v14 = &off_1001CF000;
        v31[1] = 3221225472;
        v31[2] = sub_10001880C;
        v31[3] = &unk_100232FD8;
        v31[4] = v11;
        v31[5] = self;
        long long v26 = *(_OWORD *)&a4->var0[4];
        long long v32 = *(_OWORD *)a4->var0;
        long long v33 = v26;
        char v34 = v16;
        [v11 addActionWithIdentifier:@"ReverseMuteAction" title:v22 flags:0 handler:v31];
LABEL_23:

        v30[0] = _NSConcreteStackBlock;
        v30[1] = *((void *)v14 + 352);
        v30[2] = sub_1000188C4;
        v30[3] = &unk_100233000;
        void v30[4] = v11;
        v30[5] = self;
        [v11 setActionHandler:v30];
        [v11 activate];
LABEL_42:

        goto LABEL_43;
      default:
        if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
        {
          if (a3 > 6) {
            long long v27 = "?";
          }
          else {
            long long v27 = (&off_1002331E0)[a3];
          }
          id v29 = (CBDevice *)v27;
          goto LABEL_40;
        }
        break;
    }
    [(AAServicesDaemon *)self _invalidateMuteBanner];
    goto LABEL_42;
  }
  if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_43:
}

- (void)_invalidateMuteBanner
{
  muteBanner = self->_muteBanner;
  if (muteBanner)
  {
    [(BTBannerUISession *)muteBanner invalidate];
    id v4 = self->_muteBanner;
    self->_muteBanner = 0;
  }
}

- (void)_muteStateChanged
{
}

- (void)_toggleInputMuteState
{
  if (_os_feature_enabled_impl())
  {
    id v5 = 0;
    +[AVAudioApplication toggleInputMute:&v5];
    id v3 = v5;
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else
  {
    id v3 = +[AVSystemController sharedAVSystemController];
    [v3 toggleInputMute];
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_7;
    }
  }

  muteActionTrigger = self->_muteActionTrigger;
  self->_muteActionTrigger = (NSString *)@"stemClick";
}

- (void)_playChime:(int)a3
{
  if (a3 > 6) {
    goto LABEL_35;
  }
  if (((1 << a3) & 0x18) != 0)
  {
    uint64_t v3 = 1366;
    goto LABEL_21;
  }
  if (((1 << a3) & 0x22) != 0)
  {
    if (self->_shouldSuppressMuteChime)
    {
      if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_18;
      }
      return;
    }
    uint64_t v3 = 1364;
LABEL_21:
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    _AudioServicesPlaySystemSoundWithOptions(v3, 0, 0);
    return;
  }
  if (((1 << a3) & 0x44) == 0)
  {
LABEL_35:
    if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_18;
    }
    return;
  }
  if (!self->_shouldSuppressMuteChime)
  {
    uint64_t v3 = 1365;
    goto LABEL_21;
  }
  if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
LABEL_18:
  }
    LogPrintF();
}

- (void)_processFirstPartyBannerRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self->_tuSharedInst uiDataSource];

  if (v5)
  {
    int v6 = [(TUCallCenter *)self->_tuSharedInst uiDataSource];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100018EAC;
    v12[3] = &unk_100233050;
    v12[4] = self;
    id v13 = v4;
    [v6 fetchInCallUIState:v12];
  }
  else
  {
    uint64_t currentMuteControlAction = self->_currentMuteControlAction;
    currentMuteControlAppName = self->_currentMuteControlAppName;
    currentMuteControlBundleIdentifier = self->_currentMuteControlBundleIdentifier;
    long long v10 = *(_OWORD *)&self->_currentMuteControlAuditToken.val[4];
    v11[0] = *(_OWORD *)self->_currentMuteControlAuditToken.val;
    v11[1] = v10;
    [(AAServicesDaemon *)self _createBannerSessionMuteActionForIOS:currentMuteControlAction auditToken:v11 appName:currentMuteControlAppName appBundleID:currentMuteControlBundleIdentifier];
    if (v4) {
      (*((void (**)(id, NSString *, NSString *, NSString *, void))v4 + 2))(v4, self->_currentMuteControlAuditTokenBundleIdentifier, self->_currentMuteControlAppName, self->_currentMuteControlBundleIdentifier, 0);
    }
  }
}

- (void)_processBannerRequestForMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v30 = self;
  if (v10)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
    {
      id v26 = v10;
      LogPrintF();
    }
    id v35 = 0;
    id v13 = +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v35, v26);
    id v12 = v35;
    if (!v12)
    {
      id v14 = v10;
      unsigned int v15 = [v13 localizedName];

      char v16 = 0;
      if (v15) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
    if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
    {
      id v26 = v10;
      id v27 = v12;
      LogPrintF();
    }
  }
  else
  {
    id v12 = 0;
  }
  id v14 = 0;
LABEL_16:
  id v34 = v12;
  long long v17 = *(_OWORD *)&a4->var0[4];
  long long v32 = *(_OWORD *)a4->var0;
  long long v33 = v17;
  long long v18 = +[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", &v32, &v34, v26, v27);
  id v19 = v34;

  if (v19)
  {
    if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v11) {
      (*((void (**)(id, void, void, id, id))v11 + 2))(v11, 0, 0, v14, v19);
    }

    char v16 = 0;
    unsigned int v15 = 0;
    goto LABEL_67;
  }
  unsigned int v15 = [v18 localizedName];
  int v20 = [v18 bundleIdentifier];

  id v14 = v20;
  char v16 = v14;
  if (!v15) {
    goto LABEL_26;
  }
LABEL_21:
  if (!v14)
  {
LABEL_26:
    if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_65;
  }
  if ((a3 - 4) <= 2)
  {
    if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
LABEL_65:
    NSErrorF();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v11) {
      (*((void (**)(id, void *, void *, id, id))v11 + 2))(v11, v16, v15, v14, v19);
    }
    goto LABEL_67;
  }
  if (![(NSString *)v30->_muteActionTrigger isEqualToString:@"stemClick"]
    && ![(NSString *)v30->_muteActionTrigger isEqualToString:@"bannerAction"])
  {
    if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
    {
      if (a3 > 3) {
        long long v22 = "?";
      }
      else {
        long long v22 = (&off_1002331C0)[a3];
      }
      CFStringRef muteActionTrigger = (const __CFString *)v30->_muteActionTrigger;
      if (!muteActionTrigger) {
        CFStringRef muteActionTrigger = @"nil";
      }
      id v28 = v22;
      CFStringRef v29 = muteActionTrigger;
      id v26 = v15;
      id v27 = v14;
      LogPrintF();
    }
    [(AAServicesDaemon *)v30 _invalidateMuteBanner];
    goto LABEL_65;
  }
  if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize()))
  {
    if (a3 > 3) {
      unsigned int v21 = "?";
    }
    else {
      unsigned int v21 = (&off_1002331C0)[a3];
    }
    id v27 = v14;
    id v28 = v21;
    id v26 = v15;
    LogPrintF();
  }
  v30->_uint64_t currentMuteControlAction = a3;
  objc_storeStrong((id *)&v30->_currentMuteControlAppName, v15);
  long long v23 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v30->_currentMuteControlAuditToken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v30->_currentMuteControlAuditToken.val[4] = v23;
  objc_storeStrong((id *)&v30->_currentMuteControlAuditTokenBundleIdentifier, v16);
  objc_storeStrong((id *)&v30->_currentMuteControlBundleIdentifier, a5);
  if ([v14 caseInsensitiveCompare:@"com.apple.facetime"]
    && [v14 caseInsensitiveCompare:@"com.apple.mobilephone"])
  {
    long long v24 = *(_OWORD *)&a4->var0[4];
    long long v32 = *(_OWORD *)a4->var0;
    long long v33 = v24;
    [(AAServicesDaemon *)v30 _createBannerSessionMuteActionForIOS:a3 auditToken:&v32 appName:v15 appBundleID:v14];
    if (v11) {
      (*((void (**)(id, void *, void *, id, void))v11 + 2))(v11, v16, v15, v14, 0);
    }
  }
  else
  {
    -[AAServicesDaemon _processFirstPartyBannerRequestWithCompletion:](v30, "_processFirstPartyBannerRequestWithCompletion:", v11, v26, v27, v28);
  }
  id v19 = 0;
LABEL_67:
}

- (void)_reverseMuteActionForToken:(id *)a3 shouldMute:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc((Class)AVAudioApplication);
  long long v8 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v8;
  id v9 = [v7 initProxyForProcess:v14];
  id v10 = v9;
  if (v9)
  {
    id v13 = 0;
    [v9 setInputMuted:v4 error:&v13];
    id v11 = v13;
    if (v11)
    {
      if (dword_100260FE0 > 90 || dword_100260FE0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_17;
      }
    }
    else if (dword_100260FE0 > 30 || dword_100260FE0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    LogPrintF();
LABEL_17:
    CFStringRef muteActionTrigger = self->_muteActionTrigger;
    self->_CFStringRef muteActionTrigger = (NSString *)@"bannerAction";

    goto LABEL_18;
  }
  if (dword_100260FE0 <= 90 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_18:
}

- (void)_submitMetricsForMuteAction:(int)a3 auditTokenBundleID:(id)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v10 = (__CFString *)a4;
  id v11 = (__CFString *)a5;
  id v12 = (__CFString *)a6;
  if (a3 > 6) {
    id v13 = "?";
  }
  else {
    id v13 = (&off_100233278)[a3];
  }
  uint64_t v14 = +[NSString stringWithUTF8String:v13];
  unsigned int v15 = (void *)v14;
  v27[0] = @"action";
  v27[1] = @"attributionAppName";
  char v16 = @"unknown";
  if (v11) {
    CFStringRef v17 = v11;
  }
  else {
    CFStringRef v17 = @"unknown";
  }
  v28[0] = v14;
  v28[1] = v17;
  if (v12) {
    CFStringRef v18 = v12;
  }
  else {
    CFStringRef v18 = @"unknown";
  }
  v27[2] = @"attributionBundleID";
  v27[3] = @"bundleID";
  if (v10) {
    CFStringRef v19 = v10;
  }
  else {
    CFStringRef v19 = @"unknown";
  }
  v28[2] = v18;
  v28[3] = v19;
  CFStringRef muteActionTrigger = (const __CFString *)self->_muteActionTrigger;
  if (!muteActionTrigger) {
    CFStringRef muteActionTrigger = @"appUITapAction";
  }
  void v27[4] = @"trigger";
  v27[5] = @"isSupportedAccessoryRouted";
  currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
  long long v22 = &off_1002447F0;
  if (!currentAudioOwnerDevice) {
    long long v22 = &off_100244808;
  }
  v28[4] = muteActionTrigger;
  v28[5] = v22;
  v27[6] = @"accessoryProductID";
  unsigned int v23 = [(CBDevice *)currentAudioOwnerDevice productID];
  if (v23)
  {
    int v24 = [(CBDevice *)self->_currentAudioOwnerDevice productID];
    if (v24 <= 21759)
    {
      if (v24 > 8193)
      {
        switch(v24)
        {
          case 8194:
            long long v25 = "AirPods1,1";
            break;
          case 8195:
            long long v25 = "PowerBeats3,1";
            break;
          case 8197:
            long long v25 = "BeatsX1,1";
            break;
          case 8198:
            long long v25 = "BeatsSolo3,1";
            break;
          case 8201:
            long long v25 = "BeatsStudio3,2";
            break;
          case 8202:
            long long v25 = "Device1,8202";
            break;
          case 8203:
            long long v25 = "PowerbeatsPro1,1";
            break;
          case 8204:
            long long v25 = "BeatsSoloPro1,1";
            break;
          case 8205:
            long long v25 = "Powerbeats4,1";
            break;
          case 8206:
            long long v25 = "AirPodsPro1,1";
            break;
          case 8207:
            long long v25 = "AirPods1,3";
            break;
          case 8208:
            long long v25 = "Device1,8208";
            break;
          case 8209:
            long long v25 = "BeatsStudioBuds1,1";
            break;
          case 8210:
            long long v25 = "Device1,8210";
            break;
          case 8211:
            long long v25 = "Device1,8211";
            break;
          case 8212:
            long long v25 = "Device1,8212";
            break;
          case 8213:
            long long v25 = "Device1,8213";
            break;
          case 8214:
            long long v25 = "BeatsStudioBuds1,2";
            break;
          case 8215:
            long long v25 = "BeatsStudioPro1,1";
            break;
          case 8216:
            long long v25 = "Device1,8216";
            break;
          case 8217:
            long long v25 = "Device1,8217";
            break;
          case 8218:
            long long v25 = "Device1,8218";
            break;
          case 8219:
            long long v25 = "Device1,8219";
            break;
          case 8220:
            long long v25 = "Device1,8220";
            break;
          case 8221:
            long long v25 = "Device1,8221";
            break;
          case 8222:
            long long v25 = "Device1,8222";
            break;
          case 8223:
            long long v25 = "Device1,8223";
            break;
          case 8224:
            long long v25 = "Device1,8224";
            break;
          case 8228:
            long long v25 = "Device1,8228";
            break;
          case 8229:
            long long v25 = "Device1,8229";
            break;
          case 8230:
            long long v25 = "Device1,8230";
            break;
          default:
            goto LABEL_79;
        }
        goto LABEL_80;
      }
      switch(v24)
      {
        case 0:
          long long v25 = "Invalid";
          goto LABEL_80;
        case 614:
          long long v25 = "ATVRemote1,1";
          goto LABEL_80;
        case 621:
          long long v25 = "ATVRemote1,2";
          goto LABEL_80;
      }
LABEL_79:
      long long v25 = "?";
      goto LABEL_80;
    }
    if (v24 <= 28943)
    {
      if (v24 > 28935)
      {
        if (v24 == 28936)
        {
          long long v25 = "AppleTV6,2";
          goto LABEL_80;
        }
        if (v24 == 28943)
        {
          long long v25 = "AudioAccessory1,1";
          goto LABEL_80;
        }
        goto LABEL_79;
      }
      if (v24 == 21760)
      {
        long long v25 = "Device1,21760";
        goto LABEL_80;
      }
      if (v24 != 28420) {
        goto LABEL_79;
      }
      long long v25 = "AppleTV5,3";
    }
    else
    {
      if (v24 <= 29714)
      {
        if (v24 == 28944)
        {
          long long v25 = "AudioAccessory1,2";
          goto LABEL_80;
        }
        if (v24 == 29455)
        {
          long long v25 = "AppleTV11,2";
          goto LABEL_80;
        }
        goto LABEL_79;
      }
      if (v24 == 29715)
      {
        long long v25 = "AudioAccessory5,1";
        goto LABEL_80;
      }
      if (v24 == 65533)
      {
        long long v25 = "HeGn";
        goto LABEL_80;
      }
      if (v24 != 65534) {
        goto LABEL_79;
      }
      long long v25 = "ApGn";
    }
LABEL_80:
    char v16 = +[NSString stringWithUTF8String:v25];
  }
  v28[6] = v16;
  id v26 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:7];
  CUMetricsLog();

  if (v23) {
}
  }

- (void)_updateMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  [(AAServicesDaemon *)self _playChime:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _OWORD v11[2] = sub_100019F10;
  v11[3] = &unk_100233078;
  v11[4] = self;
  int v12 = v6;
  long long v9 = *(_OWORD *)&a4->var0[4];
  v10[0] = *(_OWORD *)a4->var0;
  v10[1] = v9;
  [(AAServicesDaemon *)self _processBannerRequestForMuteAction:v6 auditToken:v10 bundleIdentifier:v8 completion:v11];
}

- (void)_avSystemControllerServerReset
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A10C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_deregisterFromAVSystemControllerDeathNotifications
{
  if (self->_avSystemControllerServerDeathNotificationRegistered)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];

    self->_avSystemControllerServerDeathNotificationRegistered = 0;
  }
}

- (void)_deregisterFromAVSystemControllerStateNotifications
{
  if (self->_avSystemControllerStateNotificationRegistered)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = AVSystemController_CallIsActiveDidChangeNotification;
    id v5 = +[AVSystemController sharedAVSystemController];
    [v3 removeObserver:self name:v4 object:v5];

    self->_avSystemControllerStateNotificationRegistered = 0;
  }
}

- (void)_registerForAVSystemControllerDeathNotifications
{
  if (!self->_avSystemControllerServerDeathNotificationRegistered)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_avSystemControllerServerReset" name:AVSystemController_ServerConnectionDiedNotification object:0];

    self->_avSystemControllerServerDeathNotificationRegistered = 1;
  }
}

- (void)_registerForAVSystemControllerStateNotifications
{
  if (!self->_avSystemControllerStateNotificationRegistered)
  {
    if (dword_100260FE0 <= 30 && (dword_100260FE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = +[AVSystemController sharedAVSystemController];
    uint64_t v8 = AVSystemController_CallIsActiveDidChangeNotification;
    uint64_t v4 = +[NSArray arrayWithObjects:&v8 count:1];
    [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = AVSystemController_CallIsActiveDidChangeNotification;
    id v7 = +[AVSystemController sharedAVSystemController];
    [v5 addObserver:self selector:"_handleCallIsActiveDidChangeNotification:" name:v6 object:v7];

    self->_avSystemControllerStateNotificationRegistered = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_uiNotificationSessionMuteControl, 0);
  objc_storeStrong((id *)&self->_tuSharedInst, 0);
  objc_storeStrong((id *)&self->_tuBargeCallCenter, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_muteBanner, 0);
  objc_storeStrong((id *)&self->_muteActionTrigger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentMuteControlBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMuteControlAuditTokenBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMuteControlAppName, 0);
  objc_storeStrong((id *)&self->_currentAudioSessionControl, 0);
  objc_storeStrong((id *)&self->_currentAudioRoutingControl, 0);
  objc_storeStrong((id *)&self->_currentAudioOwnerDevice, 0);
  objc_storeStrong((id *)&self->_connectedHeadphones, 0);
  objc_storeStrong((id *)&self->_connectedDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_activatedDeviceManagerSet, 0);
  objc_storeStrong((id *)&self->_activatedAudioSessionControlSet, 0);
  objc_storeStrong((id *)&self->_activatedAudioRoutingControlSet, 0);

  objc_storeStrong((id *)&self->_aaController, 0);
}

@end