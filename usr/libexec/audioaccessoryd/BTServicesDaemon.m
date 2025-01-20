@interface BTServicesDaemon
+ (id)sharedBTServicesDaemon;
- (BOOL)ignoreBTRestart;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BTServicesDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_audioQualityShowBanner:(int)a3 title:(id)a4 deviceAddressString:(id)a5 messageKey:(id)a6 messageArgs:(id)a7 timeoutSeconds:(double)a8;
- (void)_cbConnectedDiscoveryEnsureStarted;
- (void)_cbConnectedDiscoveryEnsureStopped;
- (void)_fileRadar:(id)a3;
- (void)_fileRadarForFWCrash:(id)a3;
- (void)_fileRadarForHIDLag:(id)a3;
- (void)_prefsChanged;
- (void)_scheduleUpdate;
- (void)_shareAudioActionScannerDeviceFound:(id)a3;
- (void)_shareAudioActionScannerDeviceLost:(id)a3;
- (void)_shareAudioActionScannerEnsureStarted;
- (void)_shareAudioActionScannerEnsureStopped;
- (void)_shareAudioConnectedDeviceFound:(id)a3;
- (void)_shareAudioConnectedDeviceLost:(id)a3;
- (void)_shareAudioConnectedMonitorEnsureStarted;
- (void)_shareAudioConnectedMonitorEnsureStopped;
- (void)_shareAudioSessionEnded:(id)a3;
- (void)_shareAudioSessionProgressEvent:(int)a3 info:(id)a4;
- (void)_shareAudioSessionStartWithDarwinDevice:(id)a3 wxDevice:(id)a4;
- (void)_shareAudioShowConnectBanner:(id)a3;
- (void)_showConnectBannerIfEnabled:(id)a3;
- (void)_showHIDIntervalBannerIfEnabled:(id)a3;
- (void)_showHIDLagBannerIfEnabled:(id)a3;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)openRadarforAudioQuality;
- (void)setIgnoreBTRestart:(BOOL)a3;
- (void)showCrashBannerIfNeeded:(id)a3;
@end

@implementation BTServicesDaemon

+ (id)sharedBTServicesDaemon
{
  if (qword_100263F48[0] != -1) {
    dispatch_once(qword_100263F48, &stru_100235B00);
  }
  v2 = (void *)qword_100263F40;

  return v2;
}

- (BTServicesDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)BTServicesDaemon;
  v2 = [(BTServicesDaemon *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BTServicesDaemon", v3);
    v5 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v4;

    *((_DWORD *)v2 + 2) = -1;
    *(void *)(v2 + 52) = -1;
    v6 = v2;
  }

  return (BTServicesDaemon *)v2;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = sub_100099E7C;
  v78 = sub_100099E8C;
  id v79 = 0;
  id obj = 0;
  dispatch_queue_t v4 = +[BTIdentityDaemon sharedBTIdentityDaemon];
  v45 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong(&v79, 0);

  v5 = (id *)(v75 + 5);
  id v72 = (id)v75[5];
  v6 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  v46 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong(v5, v72);

  v7 = (id *)(v75 + 5);
  id v71 = (id)v75[5];
  id v47 = [(NSMutableDictionary *)self->_shareAudioActionTriggeredDevices count];
  NSAppendPrintF();
  objc_storeStrong(v7, v71);
  objc_super v8 = self->_shareAudioActionScanner;
  if (v8)
  {
    v9 = (id *)(v75 + 5);
    id v70 = (id)v75[5];
    CUDescriptionWithLevel();
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    objc_storeStrong(v9, v70);
  }
  shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100099E94;
  v69[3] = &unk_100233328;
  v69[4] = &v74;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](shareAudioActionTriggeredDevices, "enumerateKeysAndObjectsUsingBlock:", v69, v47);
  v11 = self->_shareAudioConnectedDeviceMonitor;
  if (v11)
  {
    v12 = (id *)(v75 + 5);
    id v68 = (id)v75[5];
    v48 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v12, v68);
  }
  v13 = self->_shareAudioActionUINoteSession;
  if (v13)
  {
    v14 = (id *)(v75 + 5);
    id v67 = (id)v75[5];
    v48 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v14, v67);
  }
  v15 = (id *)(v75 + 5);
  id v66 = (id)v75[5];
  NSAppendPrintF();
  objc_storeStrong(v15, v66);
  id v16 = [(NSMutableSet *)self->_xpcConnections count];
  if (v16)
  {
    v17 = (id *)(v75 + 5);
    id v65 = (id)v75[5];
    v48 = v16;
    NSAppendPrintF();
    objc_storeStrong(v17, v65);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v50 = self->_xpcConnections;
  id v18 = [(NSMutableSet *)v50 countByEnumeratingWithState:&v61 objects:v81 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v62;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v50);
        }
        v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v22 = (id *)(v75 + 5);
        id v60 = (id)v75[5];
        v23 = [v21 xpcCnx:v48];
        id v24 = [v23 processIdentifier];
        unsigned int v25 = [v21 entitled];
        v26 = "no";
        if (v25) {
          v26 = "yes";
        }
        v49 = v26;
        NSAppendPrintF();
        objc_storeStrong(v22, v60);

        uint64_t v27 = [v21 audioSession:v24 withOptions:v49];
        v28 = (void *)v27;
        if (v27)
        {
          v29 = (id *)(v75 + 5);
          id v59 = (id)v75[5];
          v48 = (void *)v27;
          NSAppendPrintF();
          objc_storeStrong(v29, v59);
        }

        uint64_t v30 = [v21 shareAudioSession];
        v31 = (void *)v30;
        if (v30)
        {
          v32 = (id *)(v75 + 5);
          id v58 = (id)v75[5];
          v48 = (void *)v30;
          NSAppendPrintF();
          objc_storeStrong(v32, v58);
        }

        v33 = (id *)(v75 + 5);
        id v57 = (id)v75[5];
        NSAppendPrintF();
        objc_storeStrong(v33, v57);
      }
      id v18 = [(NSMutableSet *)v50 countByEnumeratingWithState:&v61 objects:v81 count:16];
    }
    while (v18);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v34 = (void *)CFPrefs_CopyKeys();
  v35 = (char *)[v34 countByEnumeratingWithState:&v53 objects:v80 count:16];
  if (!v35) {
    goto LABEL_33;
  }
  int v36 = 0;
  uint64_t v37 = *(void *)v54;
  do
  {
    for (j = 0; j != v35; ++j)
    {
      if (*(void *)v54 != v37) {
        objc_enumerationMutation(v34);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = (void *)CFPrefs_CopyTypedValue();
        v40 = (id *)(v75 + 5);
        id v52 = (id)v75[5];
        NSAppendPrintF();
        objc_storeStrong(v40, v52);

        ++v36;
      }
    }
    v35 = (char *)[v34 countByEnumeratingWithState:&v53 objects:v80 count:16];
  }
  while (v35);

  if (v36 >= 1)
  {
    v41 = v75;
    v51 = (void *)v75[5];
    NSAppendPrintF();
    id v42 = v51;
    v34 = (void *)v41[5];
    v41[5] = (uint64_t)v42;
LABEL_33:
  }
  id v43 = (id)v75[5];
  _Block_object_dispose(&v74, 8);

  return v43;
}

- (void)openRadarforAudioQuality
{
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v20[0] = @"Classification";
  v20[1] = @"ComponentID";
  v21[0] = @"Performance";
  v21[1] = @"815886";
  v20[2] = @"ComponentName";
  v20[3] = @"ComponentVersion";
  v21[2] = @"CoreBluetooth - HFP Audio | iOS";
  v21[3] = @"iOS";
  v20[4] = @"ExtensionIdentifiers";
  v20[5] = @"Reproducibility";
  v21[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v21[5] = @"I Didn't Try";
  v20[6] = @"Keywords";
  v20[7] = @"Title";
  v21[6] = @"1551854";
  v21[7] = @"Bluetooth Audio Quality Feedback";
  v2 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:8];
  v3 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        v11 = +[NSURLQueryItem queryItemWithName:v9 value:v10];
        [v3 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v12 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v12 setQueryItems:v3];
  v13 = +[LSApplicationWorkspace defaultWorkspace];
  v14 = [v12 URL];
  [v13 openURL:v14 configuration:0 completionHandler:0];
}

- (void)_audioQualityShowBanner:(int)a3 title:(id)a4 deviceAddressString:(id)a5 messageKey:(id)a6 messageArgs:(id)a7 timeoutSeconds:(double)a8
{
  v11 = (__CFString *)a4;
  id v12 = a6;
  v13 = (BTBannerUISession *)objc_alloc_init((Class)BTBannerUISession);
  audioQualityBanner = self->_audioQualityBanner;
  self->_audioQualityBanner = v13;
  long long v15 = v13;

  if (v11) {
    CFStringRef v16 = v11;
  }
  else {
    CFStringRef v16 = &stru_10023D730;
  }
  [(BTBannerUISession *)v15 setCenterContentText:v16];
  [(BTBannerUISession *)v15 setCenterContentItemsText:v12];

  [(BTBannerUISession *)v15 setDispatchQueue:self->_dispatchQueue];
  [(BTBannerUISession *)v15 setTimeoutSeconds:a8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10009A300;
  v18[3] = &unk_100235B28;
  v18[4] = v15;
  v18[5] = self;
  uint64_t v19 = v11;
  long long v17 = v11;
  [(BTBannerUISession *)v15 setActionHandler:v18];
  [(BTBannerUISession *)v15 activate];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A5EC;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.BluetoothServices"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10009AA74;
    handler[3] = &unk_1002329C0;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  if (self->_ignoreResetNotifyToken == -1)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = self->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10009AAF8;
    v15[3] = &unk_1002329C0;
    v15[4] = self;
    notify_register_dispatch("com.apple.bluetooth.ignoreReset", &self->_ignoreResetNotifyToken, (dispatch_queue_t)v6, v15);
  }
  if (IsAppleInternalBuild() && self->_audioQualityNotifyToken == -1)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v7 = self->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009AB74;
    v14[3] = &unk_1002329C0;
    v14[4] = self;
    notify_register_dispatch("com.apple.bluetooth.audioQuality", &self->_audioQualityNotifyToken, (dispatch_queue_t)v7, v14);
  }
  if (!self->_stateHandle)
  {
    v13[5] = _NSConcreteStackBlock;
    v13[6] = 3221225472;
    v13[7] = sub_10009AC1C;
    v13[8] = &unk_100232F88;
    v13[9] = self;
    self->_stateHandle = os_state_add_handler();
  }
  id v8 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.ShareAudioNotifications"];
  [v8 setWantsNotificationResponsesDelivered];
  [(BTServicesDaemon *)self _prefsChanged];
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v9 = (CBController *)objc_alloc_init((Class)CBController);
  cbController = self->_cbController;
  self->_cbController = v9;

  [(CBController *)self->_cbController setDispatchQueue:self->_dispatchQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009AC38;
  v13[3] = &unk_100232710;
  v13[4] = self;
  [(CBController *)self->_cbController setInterruptionHandler:v13];
  v11 = self->_cbController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009ACC8;
  v12[3] = &unk_100232738;
  v12[4] = self;
  [(CBController *)v11 activateWithCompletion:v12];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009ADE8;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefShareAudioTV != v3)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      id v4 = "yes";
      if (v3) {
        id v5 = "no";
      }
      else {
        id v5 = "yes";
      }
      if (!v3) {
        id v4 = "no";
      }
      long long v18 = v5;
      uint64_t v19 = v4;
      LogPrintF();
    }
    self->_prefShareAudioTV = v3;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_dontShowConnectBanner != v6)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = "yes";
      if (v6) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (!v6) {
        uint64_t v7 = "no";
      }
      long long v18 = v8;
      uint64_t v19 = v7;
      LogPrintF();
    }
    self->_dontShowConnectBanner = v6;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_dontShowCrashBanner != v9)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      v10 = "yes";
      if (v9) {
        v11 = "no";
      }
      else {
        v11 = "yes";
      }
      if (!v9) {
        v10 = "no";
      }
      long long v18 = v11;
      uint64_t v19 = v10;
      LogPrintF();
    }
    self->_dontShowCrashBanner = v9;
  }
  BOOL v12 = CFPrefs_GetInt64() != 0;
  if (self->_dontShowHIDLagBanner != v12)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      v13 = "yes";
      if (v12) {
        v14 = "no";
      }
      else {
        v14 = "yes";
      }
      if (!v12) {
        v13 = "no";
      }
      long long v18 = v14;
      uint64_t v19 = v13;
      LogPrintF();
    }
    self->_dontShowHIDLagBanner = v12;
  }
  BOOL v15 = CFPrefs_GetInt64() != 0;
  if (self->_doesShowHIDIntervalBanner != v15)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v16 = "yes";
      if (v15) {
        long long v17 = "no";
      }
      else {
        long long v17 = "yes";
      }
      if (!v15) {
        CFStringRef v16 = "no";
      }
      long long v18 = v17;
      uint64_t v19 = v16;
      LogPrintF();
    }
    self->_doesShowHIDIntervalBanner = v15;
  }
  [(BTServicesDaemon *)self _scheduleUpdate];
}

- (void)_scheduleUpdate
{
  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009B33C;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }
}

- (void)_update
{
  self->_updatePending = 0;
  if (self->_dontShowConnectBanner) {
    [(BTServicesDaemon *)self _cbConnectedDiscoveryEnsureStopped];
  }
  else {
    [(BTServicesDaemon *)self _cbConnectedDiscoveryEnsureStarted];
  }
  if (self->_prefShareAudioTV) {
    [(BTServicesDaemon *)self _shareAudioActionScannerEnsureStarted];
  }
  else {
    [(BTServicesDaemon *)self _shareAudioActionScannerEnsureStopped];
  }
  if (self->_prefShareAudioTV)
  {
    [(BTServicesDaemon *)self _shareAudioConnectedMonitorEnsureStarted];
  }
  else
  {
    [(BTServicesDaemon *)self _shareAudioConnectedMonitorEnsureStopped];
  }
}

- (void)showCrashBannerIfNeeded:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  unint64_t v5 = UpTicksToSeconds();
  if (!self->_showFirmwareCrashLastTicks || (unint64_t v6 = v5, v5 >= 0x3C))
  {
    self->_showFirmwareCrashLastTicks = mach_absolute_time();
    if (IsAppleInternalBuild() && !self->_dontShowCrashBanner)
    {
      if (self->_uiNoteSession)
      {
        if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(CUUserNotificationSession *)self->_uiNoteSession removeAllActions];
        [(CUUserNotificationSession *)self->_uiNoteSession invalidate];
      }
      uint64_t v7 = [v4 objectForKeyedSubscript:@"_input"];
      unsigned int v8 = [v7 isEqual:@"HostCrashed"];

      if (v8) {
        CFStringRef v9 = @"Bluetooth host has crashed";
      }
      else {
        CFStringRef v9 = @"Bluetooth firmware has crashed";
      }
      if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v10 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
      uiNoteSession = self->_uiNoteSession;
      self->_uiNoteSession = v10;
      BOOL v12 = v10;

      [(CUUserNotificationSession *)v12 setBundleID:@"com.apple.BTUserNotifications"];
      [(CUUserNotificationSession *)v12 setCategoryID:@"BTUserNotifications"];
      [(CUUserNotificationSession *)v12 setDispatchQueue:self->_dispatchQueue];
      [(CUUserNotificationSession *)v12 setIconName:@"Bluetooth.icns"];
      [(CUUserNotificationSession *)v12 setTitleKey:v9];
      [(CUUserNotificationSession *)v12 setBodyKey:@"Please file a radar"];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10009B790;
      v16[3] = &unk_100235B50;
      v16[4] = v12;
      [(CUUserNotificationSession *)v12 setActionHandler:v16];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10009B858;
      v14[3] = &unk_100232B98;
      v14[4] = v12;
      void v14[5] = self;
      id v15 = v4;
      [(CUUserNotificationSession *)v12 addActionWithIdentifier:@"FileRadarAction" title:@"File Radar" flags:0 handler:v14];
      [(CUUserNotificationSession *)v12 activate];
    }
    goto LABEL_25;
  }
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v6 >= 0xA)
  {
LABEL_25:
    CFStringRef v17 = @"CrashType";
    CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue();
    v13 = +[NSDictionary dictionaryWithObjects:&TypedValue forKeys:&v17 count:1];
    CUMetricsLog();
  }
}

- (void)_fileRadarForFWCrash:(id)a3
{
  id v4 = a3;
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  unint64_t v5 = CFDictionaryGetTypedValue();
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Bluetooth Crashed: %@", v5];
  v8[0] = @"Classification";
  v8[1] = @"ComponentID";
  v9[0] = @"Crash/Hang/Data Loss";
  v9[1] = @"161045";
  v8[2] = @"ComponentName";
  v8[3] = @"ComponentVersion";
  v9[2] = @"Bluetooth (New Bugs)";
  v9[3] = @"iOS";
  v8[4] = @"ExtensionIdentifiers";
  v8[5] = @"Reproducibility";
  v9[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v9[5] = @"I Didn't Try";
  v8[6] = @"Title";
  v9[6] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:7];
  [(BTServicesDaemon *)self _fileRadar:v7];
}

- (void)_fileRadarForHIDLag:(id)a3
{
  id v4 = a3;
  if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Bluetooth HID Lag Detected"];
  v7[0] = @"Classification";
  v7[1] = @"ComponentID";
  v8[0] = @"Crash/Hang/Data Loss";
  v8[1] = @"183565";
  v7[2] = @"ComponentName";
  v7[3] = @"ComponentVersion";
  v8[2] = @"CoreBluetooth - HID Lag";
  v8[3] = @"iOS";
  v7[4] = @"ExtensionIdentifiers";
  v7[5] = @"Reproducibility";
  v8[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v8[5] = @"I Didn't Try";
  v7[6] = @"Title";
  v8[6] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:7];
  [(BTServicesDaemon *)self _fileRadar:v6];
}

- (void)_fileRadar:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        BOOL v12 = +[NSURLQueryItem queryItemWithName:v10 value:v11];
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v13 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v13 setQueryItems:v4];
  v14 = +[LSApplicationWorkspace defaultWorkspace];
  id v15 = [v13 URL];
  [v14 openURL:v15 configuration:0 completionHandler:0];
}

- (void)_showConnectBannerIfEnabled:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  unint64_t v5 = UpTicksToSeconds();
  if (self->_showConnectBannerLastTicks) {
    BOOL v6 = v5 >= 0xA;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    self->_showConnectBannerLastTicks = mach_absolute_time();
    if (IsAppleInternalBuild())
    {
      if (!self->_dontShowConnectBanner)
      {
        id v7 = [v4 name];
        if (![v7 length])
        {
LABEL_21:

          goto LABEL_22;
        }
        unsigned int v8 = [v4 connectedServices];

        if (v8 && ([v4 connectedServices] & 0x1000000) == 0)
        {
          if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize()))
          {
            [v4 connectedServices];
            LogPrintF();
          }
          id v7 = objc_alloc_init((Class)NSDateFormatter);
          [v7 setDateFormat:@"hh:mm:ss a"];
          CFStringRef v9 = +[NSDate date];
          uint64_t v10 = [v7 stringFromDate:v9];

          v11 = [v4 btAddressData];
          BOOL v12 = CUPrintNSDataAddress();

          v13 = [v12 substringFromIndex:[v12 length] - 5];
          if (([v4 connectedServices] & 0x400000) != 0)
          {
            +[NSString stringWithFormat:@"LE Connection at %@", v10];
          }
          else if (([v4 connectedServices] & 0x800000) != 0)
          {
            +[NSString stringWithFormat:@"Classic Connection at %@", v10];
          }
          else
          {
            +[NSString stringWithFormat:@"Connected at %@", v10];
          v14 = };
          id v15 = objc_alloc_init((Class)CUUserNotificationSession);
          [v15 setBundleID:@"com.apple.BTUserNotifications"];
          [v15 setCategoryID:@"BTUserNotifications"];
          [v15 setDispatchQueue:self->_dispatchQueue];
          [v15 setIconName:@"Bluetooth.icns"];
          long long v16 = [v4 name];
          long long v17 = +[NSString stringWithFormat:@"%@%@%@%@", v16, @" ("), v13, CFSTR(")"];
          [v15 setTitleKey:v17];

          [v15 setSubtitleKey:v14];
          [v15 activate];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10009C0D4;
          v18[3] = &unk_100235B50;
          v18[4] = v15;
          [v15 setActionHandler:v18];

          goto LABEL_21;
        }
      }
    }
  }
LABEL_22:
}

- (void)_showHIDLagBannerIfEnabled:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  unint64_t v5 = UpTicksToSeconds();
  if (self->_showHIDLagBannerLastTicks && v5 < 0x3C)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    self->_showHIDLagBannerLastTicks = mach_absolute_time();
    if (IsAppleInternalBuild() && !self->_dontShowHIDLagBanner)
    {
      if (self->_uiNoteSession)
      {
        if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(CUUserNotificationSession *)self->_uiNoteSession removeAllActions];
        [(CUUserNotificationSession *)self->_uiNoteSession invalidate];
      }
      BOOL v6 = [v4 objectForKeyedSubscript:@"_input"];
      unsigned int v7 = [v6 isEqual:@"HIDLagDetected"];

      if (v7) {
        CFStringRef v8 = @"Bluetooth HID Lag Detected";
      }
      else {
        CFStringRef v8 = @"Bluetooth HID Lag detected";
      }
      if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      CFStringRef v9 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
      uiNoteSession = self->_uiNoteSession;
      self->_uiNoteSession = v9;
      v11 = v9;

      [(CUUserNotificationSession *)v11 setBundleID:@"com.apple.BTUserNotifications"];
      [(CUUserNotificationSession *)v11 setCategoryID:@"BTUserNotifications"];
      [(CUUserNotificationSession *)v11 setDispatchQueue:self->_dispatchQueue];
      [(CUUserNotificationSession *)v11 setIconName:@"Bluetooth.icns"];
      [(CUUserNotificationSession *)v11 setTitleKey:v8];
      [(CUUserNotificationSession *)v11 setBodyKey:@"Please file a radar"];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10009C4B8;
      v19[3] = &unk_100235B50;
      v19[4] = v11;
      [(CUUserNotificationSession *)v11 setActionHandler:v19];
      BOOL v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      v14 = sub_10009C580;
      id v15 = &unk_100232B98;
      long long v16 = v11;
      long long v17 = self;
      id v18 = v4;
      [(CUUserNotificationSession *)v11 addActionWithIdentifier:@"FileRadarAction" title:@"File Radar" flags:0 handler:&v12];
      [(CUUserNotificationSession *)v11 activate];
    }
  }
}

- (void)_showHIDIntervalBannerIfEnabled:(id)a3
{
  id v9 = a3;
  if (IsAppleInternalBuild() && self->_doesShowHIDIntervalBanner)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = [v9 objectForKeyedSubscript:@"DeviceName"];
    unint64_t v5 = [v9 objectForKeyedSubscript:@"Intervalms"];
    [v5 doubleValue];
    unsigned int v7 = +[NSString stringWithFormat:@"%@ is %.2f ms", v4, v6];
    id v8 = objc_alloc_init((Class)CUUserNotificationSession);
    [v8 setBundleID:@"com.apple.BTUserNotifications"];
    [v8 setCategoryID:@"BTUserNotifications"];
    [v8 setFlags:8];
    [v8 setDispatchQueue:self->_dispatchQueue];
    [v8 setIconName:@"Bluetooth.icns"];
    [v8 setTimeoutSeconds:5.0];
    [v8 setTitleKey:@"Update HID interval"];
    [v8 setSubtitleKey:v7];
    [v8 activate];
  }
}

- (void)_cbConnectedDiscoveryEnsureStarted
{
  if (!self->_cbConnectedDiscovery)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    cbConnectedDiscovery = self->_cbConnectedDiscovery;
    self->_cbConnectedDiscovery = v3;

    [(CBDiscovery *)self->_cbConnectedDiscovery setDispatchQueue:self->_dispatchQueue];
    [(CBDiscovery *)self->_cbConnectedDiscovery setDiscoveryFlags:(unint64_t)[(CBDiscovery *)self->_cbConnectedDiscovery discoveryFlags] | 0x200000];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009C8C4;
    v7[3] = &unk_1002336E8;
    v7[4] = self;
    [(CBDiscovery *)self->_cbConnectedDiscovery setDeviceFoundHandler:v7];
    unint64_t v5 = self->_cbConnectedDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009C8D0;
    v6[3] = &unk_100232738;
    v6[4] = self;
    [(CBDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_cbConnectedDiscoveryEnsureStopped
{
  if (self->_cbConnectedDiscovery)
  {
    if (dword_100261638 <= 30 && (dword_100261638 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CBDiscovery *)self->_cbConnectedDiscovery invalidate];
    cbConnectedDiscovery = self->_cbConnectedDiscovery;
    self->_cbConnectedDiscovery = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(BTServicesXPCConnection);
  [(BTServicesXPCConnection *)v6 setDaemon:self];
  [(BTServicesXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  [(BTServicesXPCConnection *)v6 setXpcCnx:v5];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  v22 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BTServicesXPCClientInterface];
  id v21 = objc_alloc((Class)NSSet);
  uint64_t v20 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  id v17 = [v21 initWithObjects:v20, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0];
  [v22 setClasses:v17 forSelector:"shareAudioProgressEvent:info:" argumentIndex:1 ofReply:0];
  [v5 _setQueue:self->_dispatchQueue];
  id v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BTServicesXPCDaemonInterface];
  [v5 setExportedInterface:v18];

  [v5 setExportedObject:v6];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009CCEC;
  v23[3] = &unk_100232A10;
  v23[4] = self;
  v23[5] = v6;
  [v5 setInvalidationHandler:v23];
  [v5 setRemoteObjectInterface:v22];
  [v5 resume];
  if (dword_100261638 <= 20 && (dword_100261638 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_100261638 <= 20)
  {
    if (dword_100261638 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v5 = [v4 xpcCnx];
      id v7 = [v5 processIdentifier];
      LogPrintF();

      id v4 = v8;
    }
  }
  [v4 xpcConnectionInvalidated:v7];
  [(NSMutableSet *)self->_xpcConnections removeObject:v8];
}

- (void)_shareAudioActionScannerEnsureStarted
{
  p_shareAudioActionScanner = &self->_shareAudioActionScanner;
  if (!self->_shareAudioActionScanner)
  {
    id v4 = objc_alloc_init((Class)SFDeviceDiscovery);
    objc_storeStrong((id *)p_shareAudioActionScanner, v4);
    [v4 setChangeFlags:5];
    [v4 setDiscoveryFlags:16];
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setPurpose:@"ShareAudio"];
    [v4 setRssiThreshold:-70];
    [v4 setScanRate:20];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009CFF8;
    v8[3] = &unk_100233888;
    v8[4] = self;
    v8[5] = v4;
    [v4 setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009D01C;
    v7[3] = &unk_100233888;
    v7[4] = self;
    void v7[5] = v4;
    [v4 setDeviceLostHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009D040;
    v6[3] = &unk_1002338B0;
    v6[4] = self;
    void v6[5] = v4;
    [v4 setDeviceChangedHandler:v6];
    if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10009D064;
    v5[3] = &unk_100232A38;
    v5[4] = self;
    v5[5] = v4;
    [v4 activateWithCompletion:v5];
  }
}

- (void)_shareAudioActionScannerEnsureStopped
{
  if (self->_shareAudioActionScanner)
  {
    if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_shareAudioActionScanner invalidate];
    shareAudioActionScanner = self->_shareAudioActionScanner;
    self->_shareAudioActionScanner = 0;
  }
}

- (void)_shareAudioActionScannerDeviceFound:(id)a3
{
  id v15 = a3;
  id v4 = [v15 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    if ([v15 deviceActionType] != 31)
    {
      [(BTServicesDaemon *)self _shareAudioActionScannerDeviceLost:v15];
      goto LABEL_21;
    }
    int v6 = [v15 bleDevice];
    if (self->_shareAudioActionUINoteSession)
    {
      if (dword_100261768 > 10 || dword_100261768 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_20;
      }
    }
    else if (self->_shareAudioSession)
    {
      if (dword_100261768 > 10 || dword_100261768 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = [(NSMutableDictionary *)self->_shareAudioActionTriggeredDevices objectForKeyedSubscript:v5];

      if (v7)
      {
        if (dword_100261768 > 10 || dword_100261768 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_20;
        }
      }
      else if ((uint64_t)[v6 smoothedRSSI] <= -71)
      {
        if (dword_100261768 > 10 || dword_100261768 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_20;
        }
      }
      else
      {
        if (([(CUBluetoothClient *)self->_shareAudioConnectedDeviceMonitor statusFlags] & 8) != 0)
        {
          if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v14 = v6;
            LogPrintF();
          }
          shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
          id v9 = v15;
          if (!shareAudioActionTriggeredDevices)
          {
            uint64_t v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v11 = self->_shareAudioActionTriggeredDevices;
            self->_shareAudioActionTriggeredDevices = v10;

            id v9 = v15;
            shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](shareAudioActionTriggeredDevices, "setObject:forKeyedSubscript:", v9, v5, v14);
          uint64_t v12 = [(NSMutableDictionary *)self->_shareAudioConnectedDeviceMap allValues];
          uint64_t v13 = [v12 firstObject];

          if (v13 && ([v15 deviceFlags] & 8) != 0) {
            [(BTServicesDaemon *)self _shareAudioSessionStartWithDarwinDevice:v15 wxDevice:v13];
          }
          else {
            [(BTServicesDaemon *)self _shareAudioShowConnectBanner:v15];
          }

          goto LABEL_20;
        }
        if (dword_100261768 > 10 || dword_100261768 == -1 && !_LogCategory_Initialize())
        {
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    LogPrintF();
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_shareAudioActionScannerDeviceLost:(id)a3
{
  id v12 = a3;
  id v4 = [v12 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    int v6 = [(NSMutableDictionary *)self->_shareAudioActionTriggeredDevices objectForKeyedSubscript:v5];

    if (v6)
    {
      if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = [v12 bleDevice];
        LogPrintF();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shareAudioActionTriggeredDevices, "setObject:forKeyedSubscript:", 0, v5, v11);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shareAudioActionTriggeredDevices, "setObject:forKeyedSubscript:", 0, v5, v10);
      }
    }
    id v7 = [(CUUserNotificationSession *)self->_shareAudioActionUINoteSession identifier];
    unsigned int v8 = [v7 isEqual:v5];

    if (v8)
    {
      if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v10 = [v12 bleDevice];
        LogPrintF();
      }
      [(CUUserNotificationSession *)self->_shareAudioActionUINoteSession invalidate];
      shareAudioActionUINoteSession = self->_shareAudioActionUINoteSession;
      self->_shareAudioActionUINoteSession = 0;
    }
  }
}

- (void)_shareAudioConnectedMonitorEnsureStarted
{
  if (!self->_shareAudioConnectedDeviceMonitor)
  {
    if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUBluetoothClient *)objc_alloc_init((Class)CUBluetoothClient);
    shareAudioConnectedDeviceMonitor = self->_shareAudioConnectedDeviceMonitor;
    self->_shareAudioConnectedDeviceMonitor = v3;
    id v5 = v3;

    [(CUBluetoothClient *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CUBluetoothClient *)v5 setFlags:24];
    [(CUBluetoothClient *)v5 setLabel:@"ShareAudio"];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009D85C;
    v7[3] = &unk_100235B78;
    v7[4] = v5;
    void v7[5] = self;
    [(CUBluetoothClient *)v5 setDeviceConnectedHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009D878;
    v6[3] = &unk_100235B78;
    v6[4] = v5;
    void v6[5] = self;
    [(CUBluetoothClient *)v5 setDeviceDisconnectedHandler:v6];
    [(CUBluetoothClient *)v5 activate];
  }
}

- (void)_shareAudioConnectedMonitorEnsureStopped
{
  if (self->_shareAudioConnectedDeviceMonitor)
  {
    if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBluetoothClient *)self->_shareAudioConnectedDeviceMonitor invalidate];
    shareAudioConnectedDeviceMonitor = self->_shareAudioConnectedDeviceMonitor;
    self->_shareAudioConnectedDeviceMonitor = 0;
  }
}

- (void)_shareAudioConnectedDeviceFound:(id)a3
{
  id v12 = a3;
  id v4 = [v12 deviceFlags];
  id v5 = v12;
  if (v4)
  {
    int v6 = [v12 identifier];
    id v7 = [v6 UUIDString];

    if (v7)
    {
      if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
      {
        id v11 = v12;
        LogPrintF();
      }
      shareAudioConnectedDeviceMap = self->_shareAudioConnectedDeviceMap;
      if (!shareAudioConnectedDeviceMap)
      {
        id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v10 = self->_shareAudioConnectedDeviceMap;
        self->_shareAudioConnectedDeviceMap = v9;

        shareAudioConnectedDeviceMap = self->_shareAudioConnectedDeviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](shareAudioConnectedDeviceMap, "setObject:forKeyedSubscript:", v12, v7, v11);
    }

    id v5 = v12;
  }

  _objc_release_x1(v4, v5);
}

- (void)_shareAudioConnectedDeviceLost:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    int v6 = [(NSMutableDictionary *)self->_shareAudioConnectedDeviceMap objectForKeyedSubscript:v5];

    if (v6)
    {
      if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shareAudioConnectedDeviceMap, "setObject:forKeyedSubscript:", 0, v5, v8);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shareAudioConnectedDeviceMap, "setObject:forKeyedSubscript:", 0, v5, v7);
      }
    }
  }
}

- (void)_shareAudioShowConnectBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_shareAudioConnectedDeviceMap allValues];
  int v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = [v4 name];
    if (![v7 length])
    {
      id v8 = +[NSBundle bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.ShareAudioNotifications.bundle"];
      uint64_t v9 = CULocalizedStringEx();

      uint64_t v7 = (void *)v9;
    }
    uint64_t v10 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
    shareAudioActionUINoteSession = self->_shareAudioActionUINoteSession;
    self->_shareAudioActionUINoteSession = v10;
    id v12 = v10;

    [(CUUserNotificationSession *)v12 setBundleID:@"com.apple.ShareAudioNotifications"];
    [(CUUserNotificationSession *)v12 setCategoryID:@"ShareAudioCategoryID"];
    [(CUUserNotificationSession *)v12 setDispatchQueue:self->_dispatchQueue];
    [(CUUserNotificationSession *)v12 setFlags:9];
    uint64_t v13 = [v4 identifier];
    uint64_t v14 = [v13 UUIDString];
    [(CUUserNotificationSession *)v12 setIdentifier:v14];

    [(CUUserNotificationSession *)v12 setLabel:@"ShareAudio"];
    [(CUUserNotificationSession *)v12 setTitleKey:v7];
    [(CUUserNotificationSession *)v12 setBodyKey:@"SHARE_AUDIO_BODY_FORMAT"];
    uint64_t v15 = [v6 name];
    uint64_t v16 = (void *)v15;
    CFStringRef v17 = @"?";
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    CFStringRef v28 = v17;
    id v18 = +[NSArray arrayWithObjects:&v28 count:1];
    [(CUUserNotificationSession *)v12 setBodyArguments:v18];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10009DE78;
    v27[3] = &unk_100233000;
    v27[4] = v12;
    v27[5] = self;
    [(CUUserNotificationSession *)v12 setActionHandler:v27];
    long long v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_10009DF64;
    v22 = &unk_100235BA0;
    v23 = v12;
    id v24 = self;
    id v25 = v4;
    id v26 = v6;
    [(CUUserNotificationSession *)v12 addActionWithIdentifier:@"ShareAudioActionIDConnect" title:@"SHARE_AUDIO_BUTTON" flags:0 handler:&v19];
    [(CUUserNotificationSession *)v12 activate];
  }
  else if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_shareAudioSessionStartWithDarwinDevice:(id)a3 wxDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_shareAudioSession)
  {
    if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [(BTShareAudioSessionDaemon *)self->_shareAudioSession invalidate];
    }
    else
    {
      [(BTShareAudioSessionDaemon *)self->_shareAudioSession invalidate];
    }
  }
  if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = objc_alloc_init(BTShareAudioSessionDaemon);
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = v8;
  uint64_t v10 = v8;

  [(BTShareAudioSessionDaemon *)v10 setDarwinDevice:v6];
  [(BTShareAudioSessionDaemon *)v10 setDispatchQueue:self->_dispatchQueue];
  [(BTShareAudioSessionDaemon *)v10 setMode:1];
  [(BTShareAudioSessionDaemon *)v10 setWxDevice:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009E1D8;
  v12[3] = &unk_100235BC8;
  v12[4] = v10;
  void v12[5] = self;
  [(BTShareAudioSessionDaemon *)v10 setProgressHandler:v12];
  [(BTShareAudioSessionDaemon *)v10 activate];
}

- (void)_shareAudioSessionEnded:(id)a3
{
  id v6 = a3;
  if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  [(BTShareAudioSessionDaemon *)self->_shareAudioSession invalidate];
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;
}

- (void)_shareAudioSessionProgressEvent:(int)a3 info:(id)a4
{
  id v8 = a4;
  if (dword_100261768 <= 30 && (dword_100261768 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a3 == 50)
  {
    CFErrorGetTypeID();
    id v6 = CFDictionaryGetTypedValue();
    if (v6)
    {
      [(BTServicesDaemon *)self _shareAudioSessionEnded:v6];
    }
    else
    {
      id v7 = BTErrorF();
      [(BTServicesDaemon *)self _shareAudioSessionEnded:v7];
    }
  }
  else if (a3 == 40)
  {
    [(BTServicesDaemon *)self _shareAudioSessionEnded:0];
  }
}

- (BOOL)ignoreBTRestart
{
  return self->_ignoreBTRestart;
}

- (void)setIgnoreBTRestart:(BOOL)a3
{
  self->_ignoreBTRestart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_uiNoteSession, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong((id *)&self->_shareAudioActionUINoteSession, 0);
  objc_storeStrong((id *)&self->_shareAudioConnectedDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_shareAudioConnectedDeviceMap, 0);
  objc_storeStrong((id *)&self->_shareAudioActionTriggeredDevices, 0);
  objc_storeStrong((id *)&self->_shareAudioActionScanner, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cbController, 0);
  objc_storeStrong((id *)&self->_cbConnectedDiscovery, 0);

  objc_storeStrong((id *)&self->_audioQualityBanner, 0);
}

@end