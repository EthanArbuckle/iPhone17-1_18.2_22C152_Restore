@interface SDSetupAgent
+ (SDSetupAgent)sharedSetupAgent;
- (BOOL)_deviceHandlesDovePeaceSetup;
- (BOOL)_screenLocked;
- (BOOL)_shouldOfferPassword:(id)a3;
- (BOOL)_uiShowing;
- (BOOL)_useSymptomsReport;
- (BOOL)preventRepair;
- (BOOL)reenableProxCardType:(unsigned __int8)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDSetupAgent)init;
- (id)_watchMigrating:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)extractParameter:(id)a3 inString:(id)a4;
- (unint64_t)problemFlags;
- (void)_activate;
- (void)_appleAccountSignIn:(id)a3;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_ensureClientStarted;
- (void)_ensureClientStopped;
- (void)_ensureServerStarted;
- (void)_ensureServerStopped;
- (void)_fetchSymptomsReport;
- (void)_iTunesAccountsChanged;
- (void)_invalidate;
- (void)_launchAppWithMachServiceName:(id)a3;
- (void)_openSetupURL:(id)a3;
- (void)_pinPairHandleRequest:(id)a3;
- (void)_postDeviceSetupNotificationForDevice:(id)a3 present:(BOOL)a4;
- (void)_primaryAccountChanged;
- (void)_pwsHandleProgressEvent:(unsigned int)a3 info:(id)a4;
- (void)_pwsHandleUserResponse:(int)a3 device:(id)a4 info:(id)a5;
- (void)_renewAccountIfNecessaryForCFUItems:(id)a3 completion:(id)a4;
- (void)_repairEnsuredStarted;
- (void)_repairEnsuredStopped;
- (void)_repairHandleCFUItems:(id)a3;
- (void)_repairHandleCFUItemsChanged;
- (void)_repairHandleCNSStateChanged;
- (void)_repairHandleCompletion;
- (void)_repairHandleManateeChanged;
- (void)_repairProblemCheck;
- (void)_repairProblemFlagsChanged;
- (void)_repairSilentProgress:(unsigned int)a3 info:(id)a4;
- (void)_repairSilentStart:(id)a3;
- (void)_repairUpdateIDSCache;
- (void)_repairVPNError:(id)a3;
- (void)_resetTriggers;
- (void)_scanTimerFired;
- (void)_screenStateChanged;
- (void)_uiLockStatusChanged;
- (void)_uiStartAppleTVSetup:(id)a3 extraInfo:(id)a4;
- (void)_uiStartAuthenticateAccounts:(id)a3;
- (void)_uiStartForMacWithDevice:(id)a3 label:(id)a4 extraInfo:(id)a5;
- (void)_uiStartHomeKitDeviceDetectedWithURL:(id)a3;
- (void)_uiStartPair:(id)a3 extraInfo:(id)a4;
- (void)_uiStartProxCardKitTest:(id)a3 extraInfo:(id)a4;
- (void)_uiStartRepair:(id)a3 flags:(unsigned int)a4;
- (void)_uiStartSetupB238:(id)a3 extraInfo:(id)a4;
- (void)_uiStartSetupDovePeace:(id)a3 autoStart:(BOOL)a4;
- (void)_uiStartSetupWHA:(id)a3;
- (void)_uiStartSetupWatch:(id)a3;
- (void)_uiStartSetupiOS:(id)a3 autoStart:(BOOL)a4;
- (void)_uiStartTVLatencyBanner:(id)a3 forActionType:(unsigned __int8)a4;
- (void)_uiStartTVLatencySetup:(id)a3 extraInfo:(id)a4 forActionType:(unsigned __int8)a5;
- (void)_uiStartTVLatencySetup:(id)a3 forActionType:(unsigned __int8)a4 withBLEDevice:(id)a5;
- (void)_uiStartWiFiPasswordSharing:(id)a3;
- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 label:(id)a5 unlessApps:(id)a6 extraInfo:(id)a7;
- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 extraInfo:(id)a7;
- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 unlessApps:(id)a7 extraInfo:(id)a8;
- (void)_uiStopIfNeededWithDevice:(id)a3;
- (void)_update;
- (void)_watchFastScanStartIfAllowed:(id)a3;
- (void)_watchFastScanStop;
- (void)_watchFound:(id)a3;
- (void)_watchStartMigration:(id)a3;
- (void)_wifiStateChanged;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openSetupURL:(id)a3;
- (void)prefsChanged;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)retriggerProximitySetup:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventRepair:(BOOL)a3;
- (void)setProblemFlags:(unint64_t)a3;
- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5;
- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4;
- (void)testHomeKitDeviceDetected:(id)a3;
- (void)testNFCUI:(id)a3;
- (void)testPairUI:(id)a3;
- (void)testProxCardKit:(id)a3;
- (void)testRepairUI:(id)a3;
- (void)testSetupUIB238:(id)a3;
- (void)testSetupUIPasswordSharing:(id)a3;
- (void)testSetupUIWHA:(id)a3;
- (void)testSetupUIWatch:(id)a3;
- (void)testSetupUIiOS:(id)a3;
- (void)testUIAppleTVSetup:(id)a3;
- (void)testUIShareAudio:(id)a3;
- (void)testUITVLatencyColorimeterSetup:(id)a3;
- (void)testUITVLatencySetup:(id)a3;
- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4;
@end

@implementation SDSetupAgent

+ (SDSetupAgent)sharedSetupAgent
{
  if (qword_10097FBD8 != -1) {
    dispatch_once(&qword_10097FBD8, &stru_1008CAC80);
  }
  v2 = (void *)gSDSetupAgent;

  return (SDSetupAgent *)v2;
}

- (SDSetupAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDSetupAgent;
  v2 = [(SDSetupAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    v4 = (void *)*((void *)v2 + 46);
    *((void *)v2 + 46) = v3;

    *(void *)(v2 + 252) = -1;
    *((_DWORD *)v2 + 18) = -1;
    *((_DWORD *)v2 + 69) = -1;
    *((_DWORD *)v2 + 85) = -1;
  }
  return (SDSetupAgent *)v2;
}

- (void)dealloc
{
  if (self->_deviceDiscovery)
  {
    FatalErrorF();
    goto LABEL_6;
  }
  if (self->_scanTimer)
  {
LABEL_6:
    FatalErrorF();
    goto LABEL_7;
  }
  if (!self->_pinPairService)
  {
    v5.receiver = self;
    v5.super_class = (Class)SDSetupAgent;
    [(SDSetupAgent *)&v5 dealloc];
    return;
  }
LABEL_7:
  v2 = (SDSetupAgent *)FatalErrorF();
  [(SDSetupAgent *)v2 setPreventRepair:v4];
}

- (void)setPreventRepair:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_preventRepair != v3)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_preventRepair = v3;
    [(SDSetupAgent *)self _update];
  }
}

- (NSString)description
{
  return (NSString *)[(SDSetupAgent *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v144 = 0;
  NSAppendPrintF();
  id v4 = 0;
  id v143 = v4;
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  id v92 = [(NSMutableDictionary *)self->_devices count];
  id v94 = [(NSMutableDictionary *)self->_triggeredDevices count];
  v85 = (const char *)deviceDiscovery;
  NSAppendPrintF();
  id v6 = v143;

  p_triggeredDevices = &self->_triggeredDevices;
  unint64_t scanSeconds = self->_scanSeconds;
  if ((int)scanSeconds >= 1)
  {
    id v142 = v6;
    if (self->_scanTimer) {
      v9 = "on";
    }
    else {
      v9 = "off";
    }
    v85 = v9;
    id v92 = (id)scanSeconds;
    NSAppendPrintF();
    id v10 = v142;

    id v6 = v10;
  }
  if (self->_remoteAlertHandle)
  {
    id v141 = v6;
    v85 = "yes";
    NSAppendPrintF();
    id v11 = v6;

    id v6 = v11;
  }
  v97 = self;
  if ([(NSMutableDictionary *)self->_devices count]) {
    p_devices = &self->_devices;
  }
  else {
    p_devices = &self->_triggeredDevices;
  }
  v13 = *p_devices;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  obj = v13;
  id v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v137 objects:v150 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v138;
    do
    {
      v17 = 0;
      v18 = v6;
      do
      {
        if (*(void *)v138 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v137 + 1) + 8 * (void)v17);
        id v136 = v18;
        v20 = -[NSMutableDictionary objectForKeyedSubscript:](*p_triggeredDevices, "objectForKeyedSubscript:", v19, problemFlags, pinPairUUID);
        if (v20) {
          v21 = "TRIG";
        }
        else {
          v21 = "----";
        }
        v22 = [(NSMutableDictionary *)obj objectForKeyedSubscript:v19];
        [v22 description];
        pinPairUUID = problemFlags = (void *)v21;
        NSAppendPrintF();
        id v6 = v136;

        v17 = (char *)v17 + 1;
        v18 = v6;
      }
      while (v15 != v17);
      id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v150, 16, v21, pinPairUUID);
    }
    while (v15);
  }
  pinPairService = v97->_pinPairService;
  if (pinPairService)
  {
    id v135 = v6;
    problemFlags = pinPairService;
    NSAppendPrintF();
    id v24 = v6;

    id v6 = v24;
  }
  pinPairSession = v97->_pinPairSession;
  if (pinPairSession)
  {
    id v134 = v6;
    problemFlags = pinPairSession;
    pinPairUUID = v97->_pinPairUUID;
    NSAppendPrintF();
    id v26 = v6;

    id v6 = v26;
  }
  if (v97->_repairEnabled)
  {
    id v133 = v6;
    problemFlags = (void *)v97->_problemFlags;
    pinPairUUID = &unk_10076DA88;
    NSAppendPrintF();
    id v27 = v6;

    if (v97->_repairService)
    {
      id v132 = v27;
      NSAppendPrintF();
      id v28 = v27;

      id v27 = v28;
    }
    wifiHealthMonitor = v97->_wifiHealthMonitor;
    if (wifiHealthMonitor)
    {
      id v131 = v27;
      problemFlags = wifiHealthMonitor;
      NSAppendPrintF();
      id v30 = v27;

      id v27 = v30;
    }
    id v130 = v27;
    NSAppendPrintF();
    id v6 = v27;
  }
  repairSession = v97->_repairSession;
  if (repairSession)
  {
    id v129 = v6;
    v32 = [(SFDeviceRepairSession *)repairSession peerDevice];
    problemFlags = [v32 identifier];
    NSAppendPrintF();
    id v33 = v6;

    id v6 = v33;
  }
  watchSetupScanner = v97->_watchSetupScanner;
  if (watchSetupScanner)
  {
    id v128 = v6;
    problemFlags = watchSetupScanner;
    NSAppendPrintF();
    id v35 = v6;

    id v6 = v35;
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v36 = v97->_watchSetupDevices;
  id v37 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v124 objects:v149 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v125;
    do
    {
      v40 = 0;
      v41 = v6;
      do
      {
        if (*(void *)v125 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v42 = *(void *)(*((void *)&v124 + 1) + 8 * (void)v40);
        v123 = v41;
        problemFlags = -[NSMutableDictionary objectForKeyedSubscript:](v97->_watchSetupDevices, "objectForKeyedSubscript:", v42, problemFlags, pinPairUUID);
        NSAppendPrintF();
        id v6 = v41;

        v40 = (char *)v40 + 1;
        v41 = v6;
      }
      while (v38 != v40);
      id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v124, v149, 16, problemFlags);
    }
    while (v38);
  }

  v43 = +[SDStatusMonitor sharedMonitor];
  id v44 = [v43 wifiPasswordSharingAvailability];

  id v122 = v6;
  if (v97->_pwsGrantingEnabled) {
    v45 = "enabled";
  }
  else {
    v45 = "disabled";
  }
  v87 = v45;
  NSAppendPrintF();
  id v46 = v122;

  if (a3 <= 10)
  {
    v47 = +[SDAppleIDAgent sharedAgent];
    v48 = [v47 myAccount];
    v96 = [v48 validationRecord];

    v49 = [(SDStatusMonitor *)v97->_statusMonitor myAppleIDPhoneHash];
    v50 = [v49 componentsSeparatedByString:@","];

    if ([v50 count])
    {
      id v121 = v46;
      NSAppendPrintF();
      id v51 = v46;

      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v52 = v50;
      v53 = (char *)[v52 countByEnumeratingWithState:&v117 objects:v148 count:16];
      if (v53)
      {
        v54 = v53;
        uint64_t v55 = *(void *)v118;
        do
        {
          v56 = 0;
          v57 = v51;
          do
          {
            if (*(void *)v118 != v55) {
              objc_enumerationMutation(v52);
            }
            v116 = v57;
            v88 = SFHexStringForBase64EncodedString();
            NSAppendPrintF();
            id v51 = v57;

            ++v56;
            v57 = v51;
          }
          while (v54 != v56);
          v54 = (char *)[v52 countByEnumeratingWithState:&v117 objects:v148 count:16];
        }
        while (v54);
      }

      id v46 = v51;
    }
    v58 = [v96 validatedPhoneHashes];

    if ([v58 count])
    {
      id v115 = v46;
      NSAppendPrintF();
      id v59 = v46;

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v60 = v58;
      id v61 = [v60 countByEnumeratingWithState:&v111 objects:v147 count:16];
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v112;
        do
        {
          v64 = 0;
          v65 = v59;
          do
          {
            if (*(void *)v112 != v63) {
              objc_enumerationMutation(v60);
            }
            uint64_t v66 = *(void *)(*((void *)&v111 + 1) + 8 * (void)v64);
            v110 = v65;
            uint64_t v89 = v66;
            NSAppendPrintF();
            id v59 = v65;

            v64 = (char *)v64 + 1;
            v65 = v59;
          }
          while (v62 != v64);
          id v62 = [v60 countByEnumeratingWithState:&v111 objects:v147 count:16];
        }
        while (v62);
      }

      id v46 = v59;
    }
    v67 = [(SDStatusMonitor *)v97->_statusMonitor myAppleIDEmailHash];
    v68 = [v67 componentsSeparatedByString:@","];

    if ([v68 count])
    {
      id v109 = v46;
      NSAppendPrintF();
      id v69 = v46;

      long long v108 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v105 = 0u;
      id v70 = v68;
      v71 = (char *)[v70 countByEnumeratingWithState:&v105 objects:v146 count:16];
      if (v71)
      {
        v72 = v71;
        uint64_t v73 = *(void *)v106;
        do
        {
          v74 = 0;
          v75 = v69;
          do
          {
            if (*(void *)v106 != v73) {
              objc_enumerationMutation(v70);
            }
            v104 = v75;
            v90 = SFHexStringForBase64EncodedString();
            NSAppendPrintF();
            id v69 = v75;

            ++v74;
            v75 = v69;
          }
          while (v72 != v74);
          v72 = (char *)[v70 countByEnumeratingWithState:&v105 objects:v146 count:16];
        }
        while (v72);
      }

      id v46 = v69;
    }
    v76 = [v96 validatedEmailHashes];

    if ([v76 count])
    {
      id v103 = v46;
      NSAppendPrintF();
      id v77 = v46;

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v78 = v76;
      id v79 = [v78 countByEnumeratingWithState:&v99 objects:v145 count:16];
      if (v79)
      {
        id v80 = v79;
        uint64_t v81 = *(void *)v100;
        do
        {
          v82 = 0;
          v83 = v77;
          do
          {
            if (*(void *)v100 != v81) {
              objc_enumerationMutation(v78);
            }
            uint64_t v91 = *(void *)(*((void *)&v99 + 1) + 8 * (void)v82);
            NSAppendPrintF();
            id v77 = v83;

            v82 = (char *)v82 + 1;
            v83 = v77;
          }
          while (v80 != v82);
          id v80 = [v78 countByEnumeratingWithState:&v99 objects:v145 count:16];
        }
        while (v80);
      }

      id v46 = v77;
    }
  }

  return v46;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056924;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_profilesNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100056A20;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", &self->_profilesNotifyToken, dispatchQueue, handler);
  }
  [(SDSetupAgent *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056B34;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int profilesNotifyToken = self->_profilesNotifyToken;
  if (profilesNotifyToken != -1)
  {
    notify_cancel(profilesNotifyToken);
    self->_int profilesNotifyToken = -1;
  }
  [(SDSetupAgent *)self _ensureClientStopped];

  [(SDSetupAgent *)self _ensureServerStopped];
}

- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100056CD8;
  v15[3] = &unk_1008CACD0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

- (void)openSetupURL:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_remoteAlertHandle)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_setupURL, a3);
  }
  else
  {
    [(SDSetupAgent *)self _openSetupURL:v5];
  }
}

- (void)_openSetupURL:(id)a3
{
  id v3 = a3;
  v9[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v9[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v8 = 0;
  unsigned int v6 = [v5 openSensitiveURL:v3 withOptions:v4 error:&v8];
  id v7 = v8;

  if (v6)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
}

- (void)prefsChanged
{
  uint64_t v47 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFPrefs_GetData();
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&v47 length:0];
  bleAuthTagFilter = self->_bleAuthTagFilter;
  id v5 = (NSData *)v3;
  unsigned int v6 = bleAuthTagFilter;
  if (v5 == v6)
  {

    id v9 = v5;
LABEL_12:

    goto LABEL_13;
  }
  id v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_7:
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      v45 = self->_bleAuthTagFilter;
      id v46 = (const char *)v5;
      LogPrintF();
    }
    id v10 = v5;
    id v9 = self->_bleAuthTagFilter;
    self->_bleAuthTagFilter = v10;
    goto LABEL_12;
  }
  unsigned __int8 v8 = [(NSData *)v5 isEqual:v6];

  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_13:
  BOOL v11 = CFPrefs_GetInt64() != 0;
  if (self->_cdpEnabled != v11)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v12 = "yes";
      if (v11) {
        id v13 = "no";
      }
      else {
        id v13 = "yes";
      }
      if (!v11) {
        id v12 = "no";
      }
      v45 = (NSData *)v13;
      id v46 = v12;
      LogPrintF();
    }
    self->_cdpEnabled = v11;
  }
  BOOL v14 = CFPrefs_GetInt64() != 0;
  if (self->_clientEnabled != v14)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v15 = "yes";
      if (v14) {
        id v16 = "no";
      }
      else {
        id v16 = "yes";
      }
      if (!v14) {
        id v15 = "no";
      }
      v45 = (NSData *)v16;
      id v46 = v15;
      LogPrintF();
    }
    self->_clientEnabled = v14;
  }
  BOOL v17 = CFPrefs_GetInt64() != 0;
  if (!IsAppleInternalBuild()) {
    BOOL v17 = 0;
  }
  if (self->_pwsAutoGrantingEnabled != v17)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v18 = "yes";
      if (v17) {
        uint64_t v19 = "no";
      }
      else {
        uint64_t v19 = "yes";
      }
      if (!v17) {
        id v18 = "no";
      }
      v45 = (NSData *)v19;
      id v46 = v18;
      LogPrintF();
    }
    self->_pwsAutoGrantingEnabled = v17;
  }
  BOOL v20 = CFPrefs_GetInt64() != 0;
  if (self->_pwsGrantingEnabled != v20)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      v21 = "yes";
      if (v20) {
        v22 = "no";
      }
      else {
        v22 = "yes";
      }
      if (!v20) {
        v21 = "no";
      }
      v45 = (NSData *)v22;
      id v46 = v21;
      LogPrintF();
    }
    self->_pwsGrantingEnabled = v20;
  }
  BOOL v23 = CFPrefs_GetInt64() != 0;
  if (self->_repairEnabled != v23)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v24 = "yes";
      if (v23) {
        v25 = "no";
      }
      else {
        v25 = "yes";
      }
      if (!v23) {
        id v24 = "no";
      }
      v45 = (NSData *)v25;
      id v46 = v24;
      LogPrintF();
    }
    self->_repairEnabled = v23;
  }
  *(_WORD *)&self->_prefRepairAccounts = 0;
  char v26 = SFIsDeviceAudioAccessory();
  self->_prefRepairVPN = v26;
  self->_prefRepairWiFi = v26;
  BOOL v27 = CFPrefs_GetInt64() != 0;
  if (self->_repairSilent != v27)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v28 = "yes";
      if (v27) {
        v29 = "no";
      }
      else {
        v29 = "yes";
      }
      if (!v27) {
        id v28 = "no";
      }
      v45 = (NSData *)v29;
      id v46 = v28;
      LogPrintF();
    }
    self->_repairSilent = v27;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  if (Int64 < 0) {
    uint64_t v31 = -1;
  }
  else {
    uint64_t v31 = Int64;
  }
  if (v31 >= 100000) {
    uint64_t v31 = 100000;
  }
  uint64_t v32 = v31;
  unint64_t scanSeconds = (NSData *)self->_scanSeconds;
  if ((NSData *)v31 != scanSeconds)
  {
    if (dword_1009664E8 <= 40)
    {
      if (dword_1009664E8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_91;
        }
        unint64_t scanSeconds = (NSData *)self->_scanSeconds;
      }
      v45 = scanSeconds;
      id v46 = (const char *)v32;
      LogPrintF();
    }
LABEL_91:
    self->_unint64_t scanSeconds = v32;
  }
  uint64_t v34 = CFPrefs_GetInt64();
  BOOL v35 = v34 != 0;
  if (self->_serverEnabled != v35)
  {
    if (dword_1009664E8 <= 40)
    {
      uint64_t v36 = v34;
      if (dword_1009664E8 != -1 || _LogCategory_Initialize())
      {
        id v37 = "yes";
        if (v36) {
          id v38 = "no";
        }
        else {
          id v38 = "yes";
        }
        if (!v36) {
          id v37 = "no";
        }
        v45 = (NSData *)v38;
        id v46 = v37;
        LogPrintF();
      }
    }
    self->_serverEnabled = v35;
  }
  BOOL v39 = CFPrefs_GetInt64() != 0;
  if (self->_watchMigrationEnabled != v39)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      v40 = "yes";
      if (v39) {
        v41 = "no";
      }
      else {
        v41 = "yes";
      }
      if (!v39) {
        v40 = "no";
      }
      v45 = (NSData *)v41;
      id v46 = v40;
      LogPrintF();
    }
    self->_watchMigrationEnabled = v39;
  }
  BOOL v42 = CFPrefs_GetInt64() != 0;
  if (self->_watchSetupEnabled != v42)
  {
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      v43 = "yes";
      if (v42) {
        id v44 = "no";
      }
      else {
        id v44 = "yes";
      }
      if (!v42) {
        v43 = "no";
      }
      v45 = (NSData *)v44;
      id v46 = v43;
      LogPrintF();
    }
    self->_watchSetupEnabled = v42;
  }
  [(SDSetupAgent *)self _update];
}

- (BOOL)reenableProxCardType:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL result = 0;
  if ((int)a3 > 24)
  {
    switch(a3)
    {
      case 0x19u:
      case 0x1Eu:
        uint64_t v6 = 158;
        goto LABEL_18;
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Fu:
      case 0x22u:
      case 0x23u:
        return result;
      case 0x20u:
        goto LABEL_12;
      case 0x21u:
LABEL_11:
        uint64_t v6 = 155;
        goto LABEL_18;
      case 0x24u:
        uint64_t v6 = 170;
        goto LABEL_18;
      default:
        if (a3 == 43)
        {
LABEL_12:
          uint64_t v6 = 171;
LABEL_18:
          *((unsigned char *)&self->super.isa + v6) = 0;
          if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
          {
            sub_100057B78(v3);
            LogPrintF();
          }
          BOOL result = 1;
        }
        else if (a3 == 100)
        {
          if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          BOOL result = 1;
          self->_renableB238SetupAfterWiFi = 1;
        }
        break;
    }
  }
  else
  {
    uint64_t v6 = 152;
    switch(a3)
    {
      case 1u:
        uint64_t v6 = 153;
        goto LABEL_18;
      case 5u:
        uint64_t v6 = 168;
        goto LABEL_18;
      case 6u:
        goto LABEL_18;
      case 9u:
        uint64_t v6 = 156;
        goto LABEL_18;
      case 0xAu:
        uint64_t v6 = 157;
        goto LABEL_18;
      case 0xBu:
        goto LABEL_11;
      case 0xDu:
        uint64_t v6 = 169;
        goto LABEL_18;
      default:
        return result;
    }
  }
  return result;
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100057FDC;
  v13[3] = &unk_1008CACF8;
  v13[4] = self;
  id v14 = v8;
  unsigned int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)retriggerProximitySetup:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000580C4;
  v7[3] = &unk_1008CAD20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000584CC;
  block[3] = &unk_1008CAD48;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000585E4;
  block[3] = &unk_1008CAD70;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005883C;
  block[3] = &unk_1008CAD70;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientEnabled) {
    [(SDSetupAgent *)self _ensureClientStarted];
  }
  else {
    [(SDSetupAgent *)self _ensureClientStopped];
  }
  if (self->_serverEnabled) {
    [(SDSetupAgent *)self _ensureServerStarted];
  }
  else {
    [(SDSetupAgent *)self _ensureServerStopped];
  }
  if (self->_repairEnabled && !self->_preventRepair)
  {
    [(SDSetupAgent *)self _repairEnsuredStarted];
  }
  else
  {
    [(SDSetupAgent *)self _repairEnsuredStopped];
  }
}

- (void)_ensureClientStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_iTunesNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005945C;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.itunesstored.accountschanged", &self->_iTunesNotifyToken, dispatchQueue, handler);
  }
  if (!self->_statusMonitor)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_appleAccountSignIn:" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
    [v4 addObserver:self selector:"_screenStateChanged" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    id v5 = +[SDStatusMonitor sharedMonitor];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v5;
  }
  if (!self->_systemMonitor)
  {
    id v7 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v7;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000594FC;
    v53[3] = &unk_1008CA4B8;
    v53[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v53];
    [(CUSystemMonitor *)self->_systemMonitor setCallChangedHandler:&stru_1008CAD90];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100059508;
    v52[3] = &unk_1008CA4B8;
    v52[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenLockedChangedHandler:v52];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100059510;
    v51[3] = &unk_1008CA4B8;
    v51[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setWifiStateChangedHandler:v51];
    id v9 = self->_systemMonitor;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100059518;
    v50[3] = &unk_1008CA4B8;
    v50[4] = self;
    [(CUSystemMonitor *)v9 activateWithCompletion:v50];
  }
  unsigned int scanEligible = self->_scanEligible;
  unsigned int v11 = [(SDStatusMonitor *)self->_statusMonitor screenOn];
  self->_unsigned int scanEligible = v11;
  unsigned int v12 = scanEligible;
  if (scanEligible != v11)
  {
    if (dword_1009664E8 <= 30)
    {
      if (dword_1009664E8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_26;
        }
        unsigned int v11 = self->_scanEligible;
      }
      id v13 = "yes";
      if (scanEligible) {
        id v14 = "yes";
      }
      else {
        id v14 = "no";
      }
      if (!v11) {
        id v13 = "no";
      }
      BOOL v42 = v14;
      v43 = v13;
      LogPrintF();
LABEL_26:
      if (!self->_scanEligible) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }
    unsigned int v12 = v11;
  }
  if (!v12)
  {
LABEL_27:
    self->_shouldScan = 0;
    goto LABEL_30;
  }
LABEL_18:
  if (!scanEligible)
  {
    self->_shouldScan = 1;
    scanTimer = self->_scanTimer;
    if (scanTimer)
    {
      unsigned int v16 = scanTimer;
      dispatch_source_cancel(v16);
      BOOL v17 = self->_scanTimer;
      self->_scanTimer = 0;
    }
    unint64_t scanSeconds = (const char *)self->_scanSeconds;
    if ((int)scanSeconds >= 1)
    {
      if (dword_1009664E8 <= 30)
      {
        if (dword_1009664E8 == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_29;
          }
          unint64_t scanSeconds = (const char *)self->_scanSeconds;
        }
        BOOL v42 = scanSeconds;
        LogPrintF();
      }
LABEL_29:
      uint64_t v19 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      BOOL v20 = self->_scanTimer;
      self->_scanTimer = v19;

      v21 = self->_scanTimer;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100059554;
      v49[3] = &unk_1008CA4B8;
      v49[4] = self;
      dispatch_source_set_event_handler(v21, v49);
      unint64_t v22 = 1000000000 * self->_scanSeconds;
      BOOL v23 = self->_scanTimer;
      dispatch_time_t v24 = dispatch_time(0, v22);
      dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, v22 / 0xA);
      dispatch_resume((dispatch_object_t)self->_scanTimer);
    }
  }
LABEL_30:
  if (self->_shouldScan)
  {
    if (!self->_deviceDiscovery)
    {
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v28 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
      deviceDiscovery = self->_deviceDiscovery;
      self->_deviceDiscovery = v28;

      [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:5];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:100794240];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setFastScanMode:2];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setPurpose:@"SetupAgent"];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:20];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setRssiThreshold:-70];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10005955C;
      v48[3] = &unk_1008CADB8;
      v48[4] = self;
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v48];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100059568;
      v47[3] = &unk_1008CADB8;
      v47[4] = self;
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v47];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100059574;
      v46[3] = &unk_1008CADE0;
      v46[4] = self;
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v46];
      [(SFDeviceDiscovery *)self->_deviceDiscovery activateWithCompletion:&stru_1008CAE00];
    }
    if (self->_watchSetupEnabled && !self->_watchSetupScanner)
    {
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v38 = (SFBLEScanner *)[objc_alloc((Class)SFBLEScanner) initWithType:17];
      watchSetupScanner = self->_watchSetupScanner;
      self->_watchSetupScanner = v38;

      [(SFBLEScanner *)self->_watchSetupScanner setDispatchQueue:self->_dispatchQueue];
      [(SFBLEScanner *)self->_watchSetupScanner setChangeFlags:13];
      [(SFBLEScanner *)self->_watchSetupScanner setRssiThreshold:-60];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100059668;
      v45[3] = &unk_1008CAE28;
      v45[4] = self;
      [(SFBLEScanner *)self->_watchSetupScanner setDeviceFoundHandler:v45];
      [(SFBLEScanner *)self->_watchSetupScanner setDeviceLostHandler:&stru_1008CAE68];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000597A8;
      v44[3] = &unk_1008CAE90;
      v44[4] = self;
      [(SFBLEScanner *)self->_watchSetupScanner setDeviceChangedHandler:v44];
      [(SFBLEScanner *)self->_watchSetupScanner activateWithCompletion:&stru_1008CAEB0];
      if (!self->_proximityController)
      {
        v40 = +[SDProximityController sharedController];
        proximityController = self->_proximityController;
        self->_proximityController = v40;
      }
    }
  }
  else
  {
    v25 = self->_scanTimer;
    if (v25)
    {
      char v26 = v25;
      dispatch_source_cancel(v26);
      BOOL v27 = self->_scanTimer;
      self->_scanTimer = 0;
    }
    if (self->_deviceDiscovery)
    {
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
      id v30 = self->_deviceDiscovery;
      self->_deviceDiscovery = 0;

      [(NSMutableDictionary *)self->_devices removeAllObjects];
      devices = self->_devices;
      self->_devices = 0;

      [(SDSetupAgent *)self _resetTriggers];
    }
    [(CUUserNotificationSession *)self->_unoteTVLatencySetup invalidate];
    unoteTVLatencySetup = self->_unoteTVLatencySetup;
    self->_unoteTVLatencySetup = 0;

    watchFastScanTimer = self->_watchFastScanTimer;
    if (watchFastScanTimer)
    {
      uint64_t v34 = watchFastScanTimer;
      dispatch_source_cancel(v34);
      BOOL v35 = self->_watchFastScanTimer;
      self->_watchFastScanTimer = 0;
    }
    if (self->_watchSetupScanner)
    {
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFBLEScanner *)self->_watchSetupScanner invalidate];
      uint64_t v36 = self->_watchSetupScanner;
      self->_watchSetupScanner = 0;

      [(NSMutableDictionary *)self->_watchSetupDevices removeAllObjects];
      watchSetupDevices = self->_watchSetupDevices;
      self->_watchSetupDevices = 0;

      self->_triggeredUIWatchSetup = 0;
    }
  }
}

- (void)_ensureClientStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int iTunesNotifyToken = self->_iTunesNotifyToken;
  if (iTunesNotifyToken != -1)
  {
    notify_cancel(iTunesNotifyToken);
    self->_int iTunesNotifyToken = -1;
  }
  if (self->_statusMonitor)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_deviceDiscovery)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;
  }
  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;

  self->_unsigned int scanEligible = 0;
  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    id v10 = scanTimer;
    dispatch_source_cancel(v10);
    unsigned int v11 = self->_scanTimer;
    self->_scanTimer = 0;
  }
  self->_shouldScan = 0;
  [(SDSetupAgent *)self _resetTriggers];
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    [(SBSRemoteAlertHandle *)remoteAlertHandle removeObserver:self];
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    id v13 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;
  }
  [(SFDeviceRepairSession *)self->_repairSession invalidate];
  repairSession = self->_repairSession;
  self->_repairSession = 0;

  setupURL = self->_setupURL;
  self->_setupURL = 0;

  [(CUUserNotificationSession *)self->_unoteTVLatencySetup invalidate];
  unoteTVLatencySetup = self->_unoteTVLatencySetup;
  self->_unoteTVLatencySetup = 0;

  watchFastScanTimer = self->_watchFastScanTimer;
  if (watchFastScanTimer)
  {
    id v18 = watchFastScanTimer;
    dispatch_source_cancel(v18);
    uint64_t v19 = self->_watchFastScanTimer;
    self->_watchFastScanTimer = 0;
  }
  if (self->_watchSetupScanner)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFBLEScanner *)self->_watchSetupScanner invalidate];
    watchSetupScanner = self->_watchSetupScanner;
    self->_watchSetupScanner = 0;
  }
  [(NSMutableDictionary *)self->_watchSetupDevices removeAllObjects];
  watchSetupDevices = self->_watchSetupDevices;
  self->_watchSetupDevices = 0;

  self->_triggeredUIWatchSetup = 0;
}

- (void)_deviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceActionType];
  id v6 = [v4 bleDevice];
  id v7 = [v4 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v8 = 0;
  if (!self->_deviceDiscovery || !v7) {
    goto LABEL_165;
  }
  id v8 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v7];
  if (![v4 needsSetup])
  {
    if (v8) {
      [(SDSetupAgent *)self _postDeviceSetupNotificationForDevice:v4 present:1];
    }
    [(NSMutableDictionary *)self->_devices removeObjectForKey:v7];
    if ([v8 deviceActionType] == 12
      || [v8 deviceActionType] == 17)
    {
      [(NSMutableDictionary *)self->_triggeredDevices removeObjectForKey:v7];
    }
    else if ([v8 deviceActionType] == 27)
    {
      uint64_t v19 = +[SDNearbyAgent sharedNearbyAgent];
      [v19 setBoostNearbyInfo:0];
    }
    else if ([v8 deviceActionType] == 8)
    {
      [(SDSetupAgent *)self _uiStopIfNeededWithDevice:v7];
    }
    unoteTVLatencySetup = self->_unoteTVLatencySetup;
    if (unoteTVLatencySetup)
    {
      id v13 = [(CUUserNotificationSession *)unoteTVLatencySetup identifier];
      id v14 = [v7 UUIDString];
      unsigned int v15 = [v13 isEqual:v14];

      if (v15)
      {
        [(CUUserNotificationSession *)self->_unoteTVLatencySetup invalidate];
        unsigned int v16 = self->_unoteTVLatencySetup;
        self->_unoteTVLatencySetup = 0;
      }
    }
    goto LABEL_165;
  }
  devices = self->_devices;
  if (!devices)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v11 = self->_devices;
    self->_devices = v10;

    devices = self->_devices;
  }
  [(NSMutableDictionary *)devices setObject:v4 forKeyedSubscript:v7];
  if (!gSDProxCardsSuppressed && ![(SDSetupAgent *)self _uiShowing])
  {
    if (v5 == 30 || v5 == 25)
    {
      if (([(SDStatusMonitor *)self->_statusMonitor systemUIFlags] & 0x7C808) != 0) {
        goto LABEL_165;
      }
    }
    else
    {
      if (([(SDStatusMonitor *)self->_statusMonitor systemUIFlags] & 0x7C809) != 0) {
        goto LABEL_165;
      }
      if (v5 <= 0x1B && ((1 << (char)v5) & 0x8021100) != 0)
      {
        BOOL v17 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v7];

        if (v17) {
          goto LABEL_165;
        }
      }
    }
    [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v4];
    if ([v6 triggered])
    {
      if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v18 = [v4 deviceActionType];
        [v4 description];
        v64 = uint64_t v61 = v18;
        LogPrintF();
      }
      if (v5 != 33 && v5 != 11
        || ![(CUSystemMonitor *)self->_systemMonitor activeCallCount])
      {
        unsigned int v20 = [(SDSetupAgent *)self _screenLocked];
        if (v5 <= 0x24 && ((1 << (char)v5) & 0x1042000200) != 0)
        {
          if (v20)
          {
            double v21 = CACurrentMediaTime();
            BKSHIDServicesLastUserEventTime();
            if (v21 - v22 > 30.0)
            {
              if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
              {
LABEL_40:
                LogPrintF();
                goto LABEL_165;
              }
              goto LABEL_165;
            }
          }
        }
        else if (v20)
        {
          goto LABEL_165;
        }
        if (self->_bleAuthTagFilter)
        {
          BOOL v23 = [v6 advertisementFields];
          CFDataGetTypeID();
          dispatch_time_t v24 = CFDictionaryGetTypedValue();

          bleAuthTagFilter = self->_bleAuthTagFilter;
          char v26 = v24;
          BOOL v27 = bleAuthTagFilter;
          if (v26 == v27)
          {
          }
          else
          {
            id v28 = v27;
            if ((v26 == 0) == (v27 != 0))
            {

              goto LABEL_165;
            }
            unsigned int v29 = [(NSData *)v26 isEqual:v27];

            if (!v29) {
              goto LABEL_165;
            }
          }
        }
        if (SFStoreDemoMode() & 1) != 0 || (SFLostMode()) {
          goto LABEL_165;
        }
        triggeredDevices = self->_triggeredDevices;
        if (!triggeredDevices)
        {
          uint64_t v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v32 = self->_triggeredDevices;
          self->_triggeredDevices = v31;

          triggeredDevices = self->_triggeredDevices;
        }
        [(NSMutableDictionary *)triggeredDevices setObject:v4 forKeyedSubscript:v7];
        [(SDSetupAgent *)self _postDeviceSetupNotificationForDevice:v4 present:1];
        [(SFDeviceDiscovery *)self->_deviceDiscovery fastScanCancel:@"Triggered"];
        switch((int)v5)
        {
          case 1:
            if (self->_triggeredUIAppleTVSetup)
            {
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            else
            {
              id v37 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v38 = [v37 isProximitySetupToNewDeviceAllowed];

              if (v38)
              {
                self->_triggeredUIAppleTVSetup = 1;
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  id v62 = v6;
                  LogPrintF();
                }
                -[SDSetupAgent _uiStartAppleTVSetup:extraInfo:](self, "_uiStartAppleTVSetup:extraInfo:", v4, 0, v62);
                goto LABEL_163;
              }
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            break;
          case 2:
          case 3:
          case 4:
          case 5:
          case 7:
          case 14:
          case 15:
          case 16:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 26:
          case 28:
          case 29:
          case 31:
          case 34:
          case 35:
            break;
          case 6:
            if (self->_triggeredUIAppleTVPair)
            {
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            else
            {
              BOOL v39 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v40 = [v39 isProximitySetupToNewDeviceAllowed];

              if (v40)
              {
                self->_triggeredUIAppleTVPair = 1;
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  id v62 = v6;
                  LogPrintF();
                }
                -[SDSetupAgent _uiStartPair:extraInfo:](self, "_uiStartPair:extraInfo:", v4, 0, v62);
                goto LABEL_163;
              }
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            break;
          case 8:
            v41 = +[MCProfileConnection sharedConnection];
            unsigned __int8 v42 = [v41 isWiFiPasswordSharingAllowed];

            if (v42)
            {
              if (self->_pwsGrantingEnabled && [(SDSetupAgent *)self _shouldOfferPassword:v4])
              {
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  id v62 = v6;
                  LogPrintF();
                }
                -[SDSetupAgent _uiStartWiFiPasswordSharing:](self, "_uiStartWiFiPasswordSharing:", v4, v62);
                goto LABEL_163;
              }
              if (dword_1009664E8 > 30 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_163;
              }
              goto LABEL_135;
            }
            if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
              goto LABEL_40;
            }
            break;
          case 9:
            if (self->_triggeredUIiOSSetup)
            {
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            else
            {
              v43 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v44 = [v43 isProximitySetupToNewDeviceAllowed];

              if (v44)
              {
                if (([v4 deviceFlags] & 0x100) == 0)
                {
                  if (![(SDStatusMonitor *)self->_statusMonitor eduModeEnabled])
                  {
                    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                    {
                      id v62 = v6;
                      LogPrintF();
                    }
                    self->_triggeredUIiOSSetup = 1;
                    -[SDSetupAgent _uiStartSetupiOS:autoStart:](self, "_uiStartSetupiOS:autoStart:", v4, 0, v62);
                    goto LABEL_163;
                  }
                  if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
                    goto LABEL_163;
                  }
                  goto LABEL_135;
                }
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                  goto LABEL_40;
                }
              }
              else if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_40;
              }
            }
            break;
          case 10:
            if (self->_triggeredUIRepair)
            {
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            else
            {
              v45 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v46 = [v45 isProximitySetupToNewDeviceAllowed];

              if (v46)
              {
                if (([v4 paired] & 1) != 0
                  || [v4 systemPairState] > 0x13)
                {
                  self->_triggeredUIRepair = 1;
                  if (self->_repairSilent)
                  {
                    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                    {
                      id v62 = v6;
                      LogPrintF();
                    }
                    -[SDSetupAgent _repairSilentStart:](self, "_repairSilentStart:", v4, v62);
                  }
                  goto LABEL_163;
                }
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                  goto LABEL_40;
                }
              }
              else if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_40;
              }
            }
            break;
          case 11:
          case 33:
            if (self->_triggeredUIB238Setup)
            {
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            else
            {
              id v33 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v34 = [v33 isProximitySetupToNewDeviceAllowed];

              if (v34)
              {
                self->_triggeredUIB238Setup = 1;
                if (dword_1009664E8 > 50) {
                  goto LABEL_162;
                }
                if (dword_1009664E8 != -1 || _LogCategory_Initialize())
                {
                  id v62 = v6;
                  LogPrintF();
                }
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v63 = sub_100057B78((int)v5);
                  LogPrintF();
                  -[SDSetupAgent _uiStartSetupB238:extraInfo:](self, "_uiStartSetupB238:extraInfo:", v4, 0, v63);
                }
                else
                {
LABEL_162:
                  -[SDSetupAgent _uiStartSetupB238:extraInfo:](self, "_uiStartSetupB238:extraInfo:", v4, 0, v62);
                }
                goto LABEL_163;
              }
              if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                goto LABEL_40;
              }
            }
            break;
          case 12:
            if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            notify_post("com.apple.applepay.proximity");
            goto LABEL_163;
          case 13:
            if (self->_triggeredUIWHASetup)
            {
              if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
                break;
              }
            }
            else
            {
              uint64_t v47 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v48 = [v47 isProximitySetupToNewDeviceAllowed];

              if (v48)
              {
                self->_triggeredUIWHASetup = 1;
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  id v62 = v6;
                  LogPrintF();
                }
                -[SDSetupAgent _uiStartSetupWHA:](self, "_uiStartSetupWHA:", v4, v62);
                goto LABEL_163;
              }
              if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
                break;
              }
            }
            goto LABEL_40;
          case 17:
            if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
            {
              id v62 = v6;
              LogPrintF();
            }
            [(SDSetupAgent *)self _launchAppWithMachServiceName:@"com.apple.diagnosticextensionsd.sharing-wakeup", v62];
            goto LABEL_163;
          case 25:
            if (!self->_triggeredUITVLatencySetup)
            {
              v49 = self;
              id v50 = v4;
              uint64_t v51 = 25;
              goto LABEL_117;
            }
            if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
              goto LABEL_40;
            }
            break;
          case 27:
            if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
            {
              id v62 = v6;
              LogPrintF();
            }
            v54 = +[SDNearbyAgent sharedNearbyAgent];
            [v54 setBoostNearbyInfo:1];

            goto LABEL_163;
          case 30:
            if (!self->_triggeredUITVLatencySetup)
            {
              v49 = self;
              id v50 = v4;
              uint64_t v51 = 30;
LABEL_117:
              [(SDSetupAgent *)v49 _uiStartTVLatencySetup:v50 forActionType:v51 withBLEDevice:v6];
              goto LABEL_163;
            }
            if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
              break;
            }
            goto LABEL_40;
          case 32:
            goto LABEL_64;
          case 36:
            if ([(SDSetupAgent *)self _deviceHandlesDovePeaceSetup])
            {
              if (self->_triggeredUIDovePeace)
              {
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                  goto LABEL_40;
                }
                break;
              }
              id v52 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v53 = [v52 isProximitySetupToNewDeviceAllowed];

              if ((v53 & 1) == 0)
              {
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                  goto LABEL_40;
                }
                break;
              }
              if (([v4 deviceFlags] & 0x100) != 0)
              {
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                  goto LABEL_40;
                }
                break;
              }
              if ([(SDStatusMonitor *)self->_statusMonitor eduModeEnabled])
              {
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
LABEL_135:
                }
                  LogPrintF();
              }
              else if (_os_feature_enabled_impl())
              {
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  id v62 = v6;
                  LogPrintF();
                }
                self->_triggeredUIDovePeace = 1;
                -[SDSetupAgent _uiStartSetupDovePeace:autoStart:](self, "_uiStartSetupDovePeace:autoStart:", v4, 0, v62);
              }
            }
            else if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
            {
              goto LABEL_135;
            }
LABEL_163:
            if (!arc4random_uniform(0xAu))
            {
              v67[0] = @"_cat";
              v67[1] = @"_op";
              v68[0] = @"Setup";
              v68[1] = @"Triggered";
              v67[2] = @"action";
              uint64_t v55 = +[NSNumber numberWithUnsignedChar:v5];
              v68[2] = v55;
              v67[3] = @"rssi";
              v56 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 rssiEstimate]);
              v68[3] = v56;
              v57 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];
              SFDashboardLogJSON();

              v65[0] = @"action";
              v58 = +[NSNumber numberWithUnsignedChar:v5];
              v65[1] = @"rssi";
              v66[0] = v58;
              id v59 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 rssiEstimate]);
              v66[1] = v59;
              id v60 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
              SFMetricsLog();
            }
            break;
          default:
            if (v5 != 43) {
              break;
            }
LABEL_64:
            if (self->_triggeredUIAuthenticateAccounts)
            {
              if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
                break;
              }
            }
            else
            {
              BOOL v35 = +[MCProfileConnection sharedConnection];
              unsigned __int8 v36 = [v35 isProximitySetupToNewDeviceAllowed];

              if (v36)
              {
                self->_triggeredUIAuthenticateAccounts = 1;
                if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
                {
                  id v62 = v6;
                  LogPrintF();
                }
                -[SDSetupAgent _uiStartAuthenticateAccounts:](self, "_uiStartAuthenticateAccounts:", v4, v62);
                goto LABEL_163;
              }
              if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
                break;
              }
            }
            goto LABEL_40;
        }
      }
    }
  }
LABEL_165:
}

- (void)_deviceLost:(id)a3
{
  unsigned int v12 = [a3 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v12)
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v12];
    if (v4)
    {
      id v5 = (void *)v4;
      [(NSMutableDictionary *)self->_devices removeObjectForKey:v12];
      if ([v5 deviceActionType] == 17) {
        [(NSMutableDictionary *)self->_triggeredDevices removeObjectForKey:v12];
      }
      if ([v5 deviceActionType] == 27)
      {
        id v6 = +[SDNearbyAgent sharedNearbyAgent];
        [v6 setBoostNearbyInfo:0];
      }
      unoteTVLatencySetup = self->_unoteTVLatencySetup;
      if (unoteTVLatencySetup)
      {
        id v8 = [(CUUserNotificationSession *)unoteTVLatencySetup identifier];
        id v9 = [v12 UUIDString];
        unsigned int v10 = [v8 isEqual:v9];

        if (v10)
        {
          [(CUUserNotificationSession *)self->_unoteTVLatencySetup invalidate];
          unsigned int v11 = self->_unoteTVLatencySetup;
          self->_unoteTVLatencySetup = 0;
        }
      }
      [(SDSetupAgent *)self _postDeviceSetupNotificationForDevice:v5 present:0];
    }
  }

  _objc_release_x2();
}

- (void)_launchAppWithMachServiceName:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = v4;
  id v6 = (const char *)[v5 UTF8String];
  if (v6)
  {
    mach_service = xpc_connection_create_mach_service(v6, (dispatch_queue_t)self->_dispatchQueue, 0);
    xpc_connection_set_event_handler(mach_service, &stru_1008CAEF0);
    xpc_connection_activate(mach_service);
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "SharingXPCLaunch", 1);
    xpc_connection_send_message(mach_service, v8);
    barrier[0] = _NSConcreteStackBlock;
    barrier[1] = 3221225472;
    barrier[2] = sub_10005B514;
    barrier[3] = &unk_1008CA640;
    unsigned int v11 = mach_service;
    id v12 = v5;
    id v9 = mach_service;
    xpc_connection_send_barrier(v9, barrier);
  }
}

- (void)_postDeviceSetupNotificationForDevice:(id)a3 present:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 identifier];
  id v7 = [v6 UUIDString];

  if (v7)
  {
    v11[0] = @"deviceID";
    v11[1] = @"needsSetup";
    v12[0] = v7;
    xpc_object_t v8 = &__kCFBooleanFalse;
    if (v4 && [v5 needsSetup]) {
      xpc_object_t v8 = &__kCFBooleanTrue;
    }
    v12[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    unsigned int v10 = +[NSDistributedNotificationCenter defaultCenter];
    [v10 postNotificationName:@"com.apple.sharing.DeviceSetup" object:@"com.apple.sharingd" userInfo:v9 deliverImmediately:1];
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B7B8;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B91C;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BAAC;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_appleAccountSignIn:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BC50;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_primaryAccountChanged
{
  systemMonitor = self->_systemMonitor;
  if (systemMonitor)
  {
    unsigned int v4 = [(CUSystemMonitor *)systemMonitor manateeAvailable];
    if (self->_d2dEncryptionAvailable != v4)
    {
      self->_d2dEncryptionAvailable = v4;
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SDSetupAgent *)self _resetTriggers];
    }
  }
}

- (void)_iTunesAccountsChanged
{
  if (self->_triggeredUIB238Setup || self->_triggeredUIRepair)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDSetupAgent *)self _resetTriggers];
  }
}

- (void)_resetTriggers
{
  [(NSMutableDictionary *)self->_triggeredDevices removeAllObjects];
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0;

  *(_WORD *)&self->_triggeredUIWHASetup = 0;
  self->_triggeredUIAuthenticateAccounts = 0;
  *(_DWORD *)&self->_triggeredUIAppleTVPair = 0;
  *(_DWORD *)&self->_triggeredUIB238Setup = 0;
}

- (void)_scanTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    unsigned int v4 = scanTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_scanTimer;
    self->_scanTimer = 0;
  }
  self->_shouldScan = 0;

  [(SDSetupAgent *)self _update];
}

- (BOOL)_screenLocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v2 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v3 = [v2 deviceKeyBagLocked];

  return v3;
}

- (void)_screenStateChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C000;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_shouldOfferPassword:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 requestSSID];
  id v5 = [v3 contactIdentifier];

  if (!v5)
  {
    if (dword_1009664E8 > 30 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_21:
    LogPrintF();
LABEL_22:
    id v9 = 0;
    BOOL v12 = 0;
    goto LABEL_12;
  }
  id v6 = +[SDStatusMonitor sharedMonitor];
  id v7 = [v3 contactIdentifier];
  unsigned int v8 = [v6 contactIdentifierIsBlocked:v7];

  if (v8)
  {
    if (dword_1009664E8 > 30 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (!v4)
  {
    if (dword_1009664E8 > 30 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  CFStringRef v14 = @"ssid";
  unsigned int v15 = v4;
  +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v9 = (void *)WiFiCopyNetworkInfo();
  if (CFDictionaryGetInt64Ranged() == 3)
  {
    id v10 = SFShareablePasswordForSSID();
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  if (dword_1009664E8 >= 31)
  {
    BOOL v12 = v11;
  }
  else
  {
    if (dword_1009664E8 != -1)
    {
      BOOL v12 = v11;
LABEL_24:
      IsAppleInternalBuild();
      LogPrintF();
      goto LABEL_12;
    }
    BOOL v12 = v11;
    if (_LogCategory_Initialize()) {
      goto LABEL_24;
    }
  }
LABEL_12:

  return v12;
}

- (void)_uiLockStatusChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C638;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_uiShowing
{
  return self->_remoteAlertHandle != 0;
}

- (void)_uiStartAppleTVSetup:(id)a3 extraInfo:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = [a4 mutableCopy];
  }
  else
  {
    id v9 = a3;
    id v8 = +[NSMutableDictionary dictionary];
  }
  id v12 = v8;
  id v10 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [a3 deviceModelCode]);
  [v12 setObject:v10 forKeyedSubscript:@"deviceModelCode"];

  id v11 = [v12 copy];
  [(SDSetupAgent *)self _uiStartWithDevice:a3 viewControllerName:@"TVSetupUIService.TVSetupAlertViewController" label:@"AppleTVSetupUI" unlessApps:0 extraInfo:v11];
}

- (void)_uiStartHomeKitDeviceDetectedWithURL:(id)a3
{
  unsigned int v4 = [a3 absoluteString];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)SFDevice);
    id v6 = +[NSUUID UUID];
    [v5 setIdentifier:v6];

    CFStringRef v8 = @"urlStr";
    id v9 = v4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [(SDSetupAgent *)self _uiStartWithDevice:v5 viewControllerName:@"HomeKitDeviceDetectedMainController" label:@"HomeKitDeviceDetected" unlessApps:0 extraInfo:v7];
  }
}

- (void)_uiStartPair:(id)a3 extraInfo:(id)a4
{
}

- (void)_uiStartRepair:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CFStringRef v9 = @"repairFlags";
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInt:v4];
  id v10 = v7;
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(SDSetupAgent *)self _uiStartWithDevice:v6 viewControllerName:@"RepairMainController" label:@"RepairUI" unlessApps:0 extraInfo:v8];
}

- (void)_uiStartSetupB238:(id)a3 extraInfo:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = [a4 mutableCopy];
  }
  else
  {
    id v9 = a3;
    id v8 = (id)objc_opt_new();
  }
  id v12 = v8;
  id v10 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [a3 deviceModelCode]);
  [v12 setValue:v10 forKey:@"deviceModelCode"];

  [a3 setDeviceActionType:33];
  id v11 = [v12 copy];
  [(SDSetupAgent *)self _uiStartWithDevice:a3 viewControllerName:@"HDSViewService.HomePodSetupFlowViewController" label:@"B238SetupUI" unlessApps:0 extraInfo:v11];
}

- (void)_uiStartSetupiOS:(id)a3 autoStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl();
  id v8 = @"iOSSetupMainController";
  if (v7) {
    id v8 = @"SharingViewService.D2DSetupFlowViewController";
  }
  v14[0] = @"autoStart";
  id v9 = v8;
  id v10 = +[NSNumber numberWithBool:v4];
  v15[0] = v10;
  v14[1] = @"deviceClassCode";
  id v11 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v6 deviceClassCode]);
  v15[1] = v11;
  v14[2] = @"deviceModelCode";
  id v12 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v6 deviceModelCode]);
  v15[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [(SDSetupAgent *)self _uiStartWithDevice:v6 viewControllerName:v9 label:@"iOSSetupUI" unlessApps:0 extraInfo:v13];
}

- (void)_uiStartSetupDovePeace:(id)a3 autoStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SDSetupAgent *)self _deviceHandlesDovePeaceSetup])
  {
    v11[0] = @"autoStart";
    int v7 = +[NSNumber numberWithBool:v4];
    v12[0] = v7;
    v11[1] = @"deviceClassCode";
    id v8 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v6 deviceClassCode]);
    v12[1] = v8;
    void v11[2] = @"deviceModelCode";
    id v9 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v6 deviceModelCode]);
    void v12[2] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    [(SDSetupAgent *)self _uiStartWithDevice:v6 viewControllerName:@"BYDovePeaceRemoteViewController" label:@"dovePeaceSetupUI" unlessApps:0 extraInfo:v10];
  }
}

- (BOOL)_deviceHandlesDovePeaceSetup
{
  if (SFDeviceClassCodeGet() == 3)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = SFDeviceClassCodeGet();
    if (v2 != 1) {
      LOBYTE(v2) = SFDeviceClassCodeGet() == 2;
    }
  }
  return v2;
}

- (void)_uiStartSetupWatch:(id)a3
{
  id v11 = a3;
  BOOL v4 = +[NSMutableDictionary dictionary];
  if (!_os_feature_enabled_impl())
  {
    int v7 = [v11 name];
    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:@"advertisingName"];
    }
    id v8 = [v11 bleDevice];
    id v9 = [v8 advertisementFields];
    id v10 = [v9 objectForKeyedSubscript:@"wpv"];

    if (v10) {
      [v4 setObject:v10 forKeyedSubscript:@"pairingVersion"];
    }

    goto LABEL_9;
  }
  id v5 = [v11 bleDevice];
  id v6 = [v5 advertisementFields];
  int v7 = [v6 objectForKeyedSubscript:@"wd"];

  if (v7)
  {
    [v4 setObject:v7 forKeyedSubscript:@"watchData"];
LABEL_9:

    [(SDSetupAgent *)self _uiStartWithDevice:v11 viewControllerName:@"WatchSetupViewControllerProxy" label:@"WatchSetupUI" unlessApps:&off_100906D88 extraInfo:v4];
    goto LABEL_10;
  }
  if (dword_1009664E8 <= 90 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_10:
}

- (void)_uiStartSetupWHA:(id)a3
{
}

- (void)_uiStartProxCardKitTest:(id)a3 extraInfo:(id)a4
{
}

- (void)_uiStartAuthenticateAccounts:(id)a3
{
  id v5 = a3;
  CFStringRef v4 = @"SharingViewService.AuthenticateAccountsFlowViewController";
  if (_os_feature_enabled_impl() && [v5 osVersion] > 0xC) {
    CFStringRef v4 = @"AppleIDSetupUIService.SetupAlertViewController";
  }
  [(SDSetupAgent *)self _uiStartWithDevice:v5 viewControllerName:v4 label:@"AuthenticateAccountsUI" unlessApps:0 extraInfo:0];
}

- (void)_uiStartTVLatencySetup:(id)a3 forActionType:(unsigned __int8)a4 withBLEDevice:(id)a5
{
  uint64_t v6 = a4;
  id v17 = a3;
  id v8 = a5;
  int DeviceClass = GestaltGetDeviceClass();
  id v10 = @"ColorCalibration";
  if (v6 == 25) {
    id v10 = &stru_1008E7020;
  }
  id v11 = v10;
  if ((DeviceClass - 3) <= 0xFFFFFFFD)
  {
    if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
  if (![(SDSetupAgent *)self _screenLocked])
  {
    id v12 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v13 = [v12 deviceUIUnlocked];

    if (v13)
    {
      if (!self->_triggeredUITVLatencySetup)
      {
        if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
        {
          unsigned int v15 = v11;
          id v16 = v8;
          LogPrintF();
        }
        self->_triggeredUITVLatencySetup = 1;
        [(CUUserNotificationSession *)self->_unoteTVLatencySetup invalidate];
        unoteTVLatencySetup = self->_unoteTVLatencySetup;
        self->_unoteTVLatencySetup = 0;

        [(SDSetupAgent *)self _uiStartTVLatencySetup:v17 extraInfo:0 forActionType:v6];
        goto LABEL_15;
      }
      if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_15;
      }
LABEL_28:
      LogPrintF();
      goto LABEL_15;
    }
  }
  if (!self->_triggeredUITVLatencySetup && !self->_unoteTVLatencySetup)
  {
    [(SDSetupAgent *)self _uiStartTVLatencyBanner:v17 forActionType:v6];
    goto LABEL_15;
  }
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    goto LABEL_28;
  }
LABEL_15:
}

- (void)_uiStartTVLatencyBanner:(id)a3 forActionType:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  unoteTVLatencySetup = self->_unoteTVLatencySetup;
  if (!unoteTVLatencySetup) {
    goto LABEL_21;
  }
  id v8 = [(CUUserNotificationSession *)unoteTVLatencySetup identifier];
  id v9 = [v6 identifier];
  id v10 = [v9 UUIDString];
  unsigned __int8 v11 = [v8 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_21:
    if (GestaltGetDeviceClass() == 1 && MGIsQuestionValid()) {
      int v12 = MGGetBoolAnswer() ^ 1;
    }
    else {
      int v12 = 1;
    }
    if (v4 == 30 && v12)
    {
      if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      [(CUUserNotificationSession *)self->_unoteTVLatencySetup invalidate];
      id v13 = objc_alloc_init((Class)CUUserNotificationSession);
      objc_storeStrong((id *)&self->_unoteTVLatencySetup, v13);
      [v13 setBundleID:@"com.apple.SFUserNotificationTVLatency"];
      [v13 setCategoryID:@"SFUserNotificationTVLatency"];
      [v13 setDispatchQueue:self->_dispatchQueue];
      CFStringRef v14 = SFLocalizedStringForKey();
      [v13 setHeader:v14];

      [v13 setFlags:1];
      unsigned int v15 = [v6 identifier];
      id v16 = [v15 UUIDString];
      [v13 setIdentifier:v16];

      if (v4 == 25)
      {
        [v13 setTitleKey:@"TV_LATENCY_TITLE"];
        id v17 = SFAddSuffixForCurrentDeviceClass();
        [v13 setBodyKey:v17];
      }
      else
      {
        unsigned int v18 = SFLocalizedStringForKeyInStringsFileNamed();
        [v13 setTitleKey:v18];

        id v17 = SFAddSuffixForCurrentDeviceClass();
        uint64_t v19 = SFLocalizedStringForKeyInStringsFileNamed();
        [v13 setBodyKey:v19];
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005D650;
      v20[3] = &unk_1008CAF40;
      v20[4] = self;
      id v21 = v6;
      char v22 = v4;
      [v13 setActionHandler:v20];
      [v13 activate];
    }
  }
}

- (void)_uiStartTVLatencySetup:(id)a3 extraInfo:(id)a4 forActionType:(unsigned __int8)a5
{
  if (a5 == 25) {
    CFStringRef v6 = @"TVLatencySetupMainController";
  }
  else {
    CFStringRef v6 = @"TVLatencyColorimeterSetupMainController";
  }
  [(SDSetupAgent *)self _uiStartWithDevice:a3 viewControllerName:v6 label:@"TVLatencySetupUI" unlessApps:0 extraInfo:a4];
}

- (void)_uiStartWiFiPasswordSharing:(id)a3
{
  id v4 = a3;
  id v5 = +[SDHotspotAgent sharedAgent];
  CFStringRef v6 = [v4 contactIdentifier];
  uint64_t v7 = [v4 requestSSID];
  id v8 = (void *)v7;
  if (!v6)
  {
    if (dword_1009664E8 > 50 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_28:
    LogPrintF();
    goto LABEL_22;
  }
  if (!v7)
  {
    if (dword_1009664E8 > 60 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_28;
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(SDStatusMonitor *)self->_statusMonitor computerName];
  uint64_t v11 = [(SDStatusMonitor *)self->_statusMonitor myAppleIDEmailHash];
  uint64_t v12 = [(SDStatusMonitor *)self->_statusMonitor myAppleIDPhoneHash];
  if (!(v11 | v12) && dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v9 setObject:v6 forKeyedSubscript:@"cid"];
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:@"dn"];
  }
  if (v11) {
    [v9 setObject:v11 forKeyedSubscript:@"eh"];
  }
  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:@"ph"];
  }
  [v9 setObject:v8 forKeyedSubscript:@"nw"];
  if (![v5 isTetheringInUse]) {
    goto LABEL_19;
  }
  [v5 hotspotName];
  v13 = id v28 = v5;
  unsigned int v14 = [v8 isEqualToString:v13];

  id v5 = v28;
  if (!v14) {
    goto LABEL_19;
  }
  BOOL v27 = v6;
  char v32 = 0;
  memset(v31, 0, sizeof(v31));
  unsigned int v15 = [v28 hotspotName];
  id v16 = [v28 hotspotPassword];
  int v17 = WPAHashPSK();

  if (v17)
  {
    if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      uint64_t v22 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      BOOL v23 = (void *)v22;
      CFStringRef v24 = @"?";
      if (v22) {
        CFStringRef v24 = (const __CFString *)v22;
      }
      CFStringRef v30 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      char v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:v25];
      LogPrintF();
    }
    unsigned int v18 = 0;
    goto LABEL_40;
  }
  unsigned int v18 = +[NSString stringWithUTF8String:v31];
  if ([v18 length] != (id)64)
  {
LABEL_40:
    CFStringRef v6 = v27;

    id v5 = v28;
    goto LABEL_22;
  }
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"hs"];
  [v9 setObject:v18 forKeyedSubscript:@"psk"];

  CFStringRef v6 = v27;
  id v5 = v28;
LABEL_19:
  int v19 = _os_feature_enabled_impl();
  unsigned int v20 = @"PasswordSharingViewControllerProxy";
  if (v19) {
    unsigned int v20 = @"SharingViewService.PasswordSharingFlowViewController";
  }
  id v21 = v20;
  [(SDSetupAgent *)self _uiStartWithDevice:v4 viewControllerName:v21 xpcEndpoint:0 label:@"WiFiPasswordSharing" extraInfo:v9];

LABEL_22:
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 label:(id)a5 unlessApps:(id)a6 extraInfo:(id)a7
{
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 unlessApps:(id)a7 extraInfo:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  unsigned __int8 v34 = v14;
  BOOL v35 = v16;
  id v33 = v18;
  if (v18)
  {
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x2020000000;
    char v55 = 0;
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v22 = dispatch_group_create();
    id v23 = objc_alloc((Class)BKSApplicationStateMonitor);
    id v24 = [v23 initWithBundleIDs:v18 states:BKSApplicationStateAll];
    uint64_t v31 = self;
    char v32 = v19;
    id v21 = v17;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v18;
    id v25 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v51;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          dispatch_group_enter(v22);
          if (dword_1009664E8 <= 20 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_10005E0D4;
          v45[3] = &unk_1008CAF68;
          id v46 = v21;
          uint64_t v47 = v28;
          v49 = v54;
          unsigned __int8 v48 = v22;
          [v24 applicationInfoForApplication:v28 completion:v45];
        }
        id v25 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v25);
    }

    dispatchQueue = v31->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E1B8;
    block[3] = &unk_1008CAF90;
    unsigned __int8 v44 = v54;
    void block[4] = v31;
    id v38 = v34;
    id v39 = v15;
    id v40 = v35;
    id v41 = v21;
    id v42 = v32;
    id v43 = v24;
    id v30 = v24;
    dispatch_group_notify(v22, dispatchQueue, block);

    _Block_object_dispose(v54, 8);
    id v19 = v32;
  }
  else
  {
    unsigned int v20 = self;
    id v21 = v17;
    [(SDSetupAgent *)v20 _uiStartWithDevice:v14 viewControllerName:v15 xpcEndpoint:v16 label:v17 extraInfo:v19];
  }
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 extraInfo:(id)a7
{
  id v12 = a3;
  id v51 = a4;
  id v13 = a5;
  id v14 = a6;
  id v52 = a7;
  id v15 = [v12 bleDevice];
  id v50 = [v15 smoothedRSSI];
  id v16 = [v12 identifier];
  uint64_t v17 = [v16 UUIDString];

  v49 = (void *)v17;
  if (v17)
  {
    id v18 = [v15 advertisementFields];
    unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();

    unsigned int v20 = +[NSUUID UUID];
    long long v53 = [v20 UUIDString];

    uint64_t v47 = v15;
    id v48 = v14;
    id v21 = v13;
    if ([v15 foundTicks])
    {
      mach_absolute_time();
      [v15 foundTicks];
      UpTicksToSecondsF();
      double v23 = v22;
    }
    else
    {
      double v23 = 0.0;
    }
    v54[0] = @"colorCode";
    id v24 = +[NSNumber numberWithUnsignedChar:Int64Ranged];
    v55[0] = v24;
    v54[1] = @"deviceActionType";
    id v25 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v12 deviceActionType]);
    v55[1] = v25;
    v55[2] = v17;
    v54[2] = @"deviceIdentifier";
    void v54[3] = @"name";
    uint64_t v26 = [v12 name];
    BOOL v27 = (void *)v26;
    CFStringRef v28 = &stru_1008E7020;
    if (v26) {
      CFStringRef v28 = (const __CFString *)v26;
    }
    v55[3] = v28;
    v54[4] = @"osVersion";
    id v29 = v12;
    id v30 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v12 osVersion]);
    v55[4] = v30;
    v54[5] = @"rssi";
    uint64_t v31 = +[NSNumber numberWithInteger:v50];
    v55[5] = v31;
    v55[6] = v53;
    v54[6] = @"sessionUUID";
    v54[7] = @"triggerSecs";
    char v32 = +[NSNumber numberWithDouble:v23];
    v55[7] = v32;
    id v33 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:8];

    id v34 = v52;
    if (v34)
    {
      id v35 = [v33 mutableCopy];
      [v35 addEntriesFromDictionary:v34];

      id v33 = v35;
    }
    unsigned __int8 v36 = v51;
    if ([v51 isEqualToString:@"HDSViewService.HomePodSetupFlowViewController"]) {
      CFStringRef v37 = @"com.apple.HDSViewService";
    }
    else {
      CFStringRef v37 = @"com.apple.SharingViewService";
    }
    id v13 = v21;
    id v12 = v29;
    if ([v51 isEqualToString:@"BYDovePeaceRemoteViewController"])
    {
      id v15 = v47;
      id v14 = v48;
      if ([(SDSetupAgent *)self _deviceHandlesDovePeaceSetup])
      {
        CFStringRef v37 = @"com.apple.TDGSharingViewService";
        if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
        {
          CFStringRef v45 = @"com.apple.TDGSharingViewService";
          LogPrintF();
        }
      }
    }
    else
    {
      id v15 = v47;
      id v14 = v48;
    }
    if (objc_msgSend(v51, "isEqualToString:", @"TVSetupUIService.TVSetupAlertViewController", v45)) {
      CFStringRef v37 = @"com.apple.TVSetupUIService";
    }
    if ([v51 isEqualToString:@"AppleIDSetupUIService.SetupAlertViewController"]) {
      CFStringRef v37 = @"com.apple.AppleIDSetupUIService";
    }
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v46 = v37;
      LogPrintF();
    }
    id v38 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v37 viewControllerClassName:v51];
    id v39 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    if (v13)
    {
      id v40 = [v13 _endpoint];
      [v39 setXpcEndpoint:v40];

      unsigned __int8 v36 = v51;
    }
    [v39 setUserInfo:v33, v46];
    remoteAlertHandle = self->_remoteAlertHandle;
    if (remoteAlertHandle)
    {
      [(SBSRemoteAlertHandle *)remoteAlertHandle removeObserver:self];
      [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    }
    id v42 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v38 configurationContext:v39];
    id v43 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = v42;

    unsigned __int8 v44 = self->_remoteAlertHandle;
    if (v44)
    {
      [(SBSRemoteAlertHandle *)v44 addObserver:self];
      [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:0];
      if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_35;
    }
    if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v53 = 0;
    id v33 = 0;
    id v34 = 0;
    id v38 = 0;
    id v39 = 0;
  }
  if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned __int8 v36 = v51;
LABEL_35:
}

- (void)_uiStartForMacWithDevice:(id)a3 label:(id)a4 extraInfo:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_uiStopIfNeededWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1009664E8 <= 30)
  {
    id v6 = v3;
    if (dword_1009664E8 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_watchFastScanStartIfAllowed:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  if ((unint64_t)UpTicksToSeconds() >= 0x64
    && [(SFBLEScanner *)self->_watchSetupScanner scanRate] != (id)50)
  {
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v4;
      LogPrintF();
    }
    -[SFBLEScanner setScanRate:](self->_watchSetupScanner, "setScanRate:", 50, v8);
    if (!self->_watchFastScanTimer)
    {
      int v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      watchFastScanTimer = self->_watchFastScanTimer;
      self->_watchFastScanTimer = v5;

      id v7 = self->_watchFastScanTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10005EBCC;
      handler[3] = &unk_1008CA4B8;
      handler[4] = self;
      dispatch_source_set_event_handler(v7, handler);
      SFDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_watchFastScanTimer);
    }
  }
}

- (void)_watchFastScanStop
{
  if ([(SFBLEScanner *)self->_watchSetupScanner scanRate] != (id)20)
  {
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFBLEScanner *)self->_watchSetupScanner setScanRate:20];
    self->_watchFastScanLastEndTicks = mach_absolute_time();
    watchFastScanTimer = self->_watchFastScanTimer;
    if (watchFastScanTimer)
    {
      int v5 = watchFastScanTimer;
      dispatch_source_cancel(v5);
      id v4 = self->_watchFastScanTimer;
      self->_watchFastScanTimer = 0;
    }
  }
}

- (void)_watchFound:(id)a3
{
  id v4 = a3;
  int v5 = [v4 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_watchSetupScanner) {
    BOOL v6 = gSDProxCardsSuppressed == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6
    || [(SDSetupAgent *)self _uiShowing]
    || ([(SDStatusMonitor *)self->_statusMonitor systemUIFlags] & 0x7C809) != 0)
  {
    goto LABEL_48;
  }
  id v7 = 0;
  id v8 = 0;
  id v9 = 0;
  if ([(SDSetupAgent *)self _screenLocked] || !v5) {
    goto LABEL_47;
  }
  id v10 = [(NSMutableDictionary *)self->_watchSetupDevices objectForKeyedSubscript:v5];

  if (v10)
  {
LABEL_48:
    id v7 = 0;
    id v8 = 0;
LABEL_42:
    id v9 = 0;
    goto LABEL_47;
  }
  [(SDSetupAgent *)self _watchFastScanStartIfAllowed:v4];
  id v7 = objc_alloc_init((Class)SFDevice);
  [v7 updateWithBLEDevice:v4];
  [v7 setDeviceActionType:5];
  id v8 = [v4 setupProximityEstimator];
  if (!v8)
  {
    uint64_t v11 = +[SDNearbyAgent sharedNearbyAgent];
    id v8 = [v11 bleProximityEstimatorForActionType:5 device:v7];

    [v4 setSetupProximityEstimator:v8];
  }
  id v12 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v5];

  if (!v12) {
    [(NSMutableDictionary *)self->_devices setObject:v7 forKeyedSubscript:v5];
  }
  [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v7];
  unint64_t v13 = [(SDProximityController *)self->_proximityController checkDeviceRegion:v7];
  if (v13 == 2 && dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (_os_feature_enabled_impl()) {
    [v4 setTriggered:v13 == 2];
  }
  else {
    [v8 updateWithSFBLEDevice:v4];
  }
  if (![v4 triggered] || (SFStoreDemoMode() & 1) != 0 || (SFLostMode() & 1) != 0) {
    goto LABEL_42;
  }
  watchSetupDevices = self->_watchSetupDevices;
  if (!watchSetupDevices)
  {
    id v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v16 = self->_watchSetupDevices;
    self->_watchSetupDevices = v15;

    watchSetupDevices = self->_watchSetupDevices;
  }
  [(NSMutableDictionary *)watchSetupDevices setObject:v4 forKeyedSubscript:v5];
  if (self->_triggeredUIWatchSetup)
  {
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_42;
  }
  self->_triggeredUIWatchSetup = 1;
  uint64_t v17 = [(SDSetupAgent *)self _watchMigrating:v5];
  if (!v17)
  {
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v22 = v4;
      LogPrintF();
    }
    [(SDSetupAgent *)self _watchFastScanStop];
    [(SDSetupAgent *)self _uiStartSetupWatch:v7];
    v23[0] = @"_cat";
    v23[1] = @"_op";
    v24[0] = @"WatchSetup";
    v24[1] = @"Triggered";
    v23[2] = @"rssi";
    unsigned int v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 estimatedRSSI]);
    v24[2] = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    SFDashboardLogJSON();

    goto LABEL_42;
  }
  id v9 = (void *)v17;
  uint64_t v18 = mach_absolute_time();
  unint64_t v19 = v18 - self->_watchMigrationLastTicks;
  if (v19 >= SecondsToUpTicks())
  {
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      id v22 = v4;
      LogPrintF();
    }
    [(SDSetupAgent *)self _watchFastScanStop];
    self->_watchMigrationLastTicks = v18;
    [(SDSetupAgent *)self _watchStartMigration:v9];
  }
  else if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    UpTicksToSeconds();
    LogPrintF();
  }
LABEL_47:
}

- (id)_watchMigrating:(id)a3
{
  id v4 = a3;
  if (self->_watchMigrationEnabled)
  {
    int v5 = [(objc_class *)off_100966558() sharedInstance];
    BOOL v6 = [v5 getDevicesMatching:&stru_1008CAFD0];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = off_100966570();
          unint64_t v13 = [v11 valueForProperty:v12];

          if ([v13 isEqual:v4])
          {
            id v8 = v11;

            goto LABEL_12;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_watchStartMigration:(id)a3
{
  id v3 = a3;
  id v4 = [(objc_class *)off_100966578() sharedMigrator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005F4F0;
  v6[3] = &unk_1008CA5A8;
  id v7 = v3;
  id v5 = v3;
  [v4 beginMigrationWithDevice:v5 withCompletion:v6];
}

- (void)_wifiStateChanged
{
  if ([(CUSystemMonitor *)self->_systemMonitor wifiState] == 40
    && (self->_renableB238SetupAfterWiFi || self->_triggeredUIRepair))
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDSetupAgent *)self _resetTriggers];
  }
}

- (void)_ensureServerStarted
{
  if (!self->_pinPairService)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFService *)objc_alloc_init((Class)SFService);
    pinPairService = self->_pinPairService;
    self->_pinPairService = v3;

    [(SFService *)self->_pinPairService setIdentifier:SFServiceIdentifierPINPair];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005F848;
    v8[3] = &unk_1008CA5A8;
    v8[4] = self;
    [(SFService *)self->_pinPairService setErrorHandler:v8];
    [(SFService *)self->_pinPairService setInvalidationHandler:&stru_1008CAFF0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005F980;
    v7[3] = &unk_1008CB018;
    void v7[4] = self;
    [(SFService *)self->_pinPairService setRequestMessageHandler:v7];
    id v5 = self->_pinPairService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005FA2C;
    v6[3] = &unk_1008CA5A8;
    void v6[4] = self;
    [(SFService *)v5 activateWithCompletion:v6];
  }
}

- (void)_ensureServerStopped
{
  if (self->_pinPairService)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFService *)self->_pinPairService invalidate];
    pinPairService = self->_pinPairService;
    self->_pinPairService = 0;
  }
  if (self->_pinPairSession)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFPINPairSession *)self->_pinPairSession invalidate];
    pinPairSession = self->_pinPairSession;
    self->_pinPairSession = 0;
  }
  pinPairUUID = self->_pinPairUUID;
  self->_pinPairUUID = 0;
}

- (void)_pinPairHandleRequest:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = 0;
  id v5 = [v4 headerFields];
  int UUIDEx = CFDictionaryGetUUIDEx();

  if (UUIDEx)
  {
    if (dword_1009664E8 > 60 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
LABEL_23:
    LogPrintF();
    goto LABEL_17;
  }
  id v7 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:v18];
  if (!v7)
  {
    if (dword_1009664E8 > 60 || dword_1009664E8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
    goto LABEL_23;
  }
  id v8 = v7;
  if (([(NSUUID *)self->_pinPairUUID isEqual:v7] & 1) == 0 && self->_pinPairSession)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      pinPairUUID = self->_pinPairUUID;
      id v14 = v8;
      LogPrintF();
    }
    [(SFPINPairSession *)self->_pinPairSession invalidate];
    pinPairSession = self->_pinPairSession;
    self->_pinPairSession = 0;
  }
  id v10 = self->_pinPairSession;
  if (!v10)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      pinPairUUID = v8;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_pinPairUUID, v8);
    uint64_t v11 = (SFPINPairSession *)objc_alloc_init((Class)SFPINPairSession);
    id v12 = self->_pinPairSession;
    self->_pinPairSession = v11;

    [(SFPINPairSession *)self->_pinPairSession setDispatchQueue:self->_dispatchQueue];
    [(SFPINPairSession *)self->_pinPairSession setSfService:self->_pinPairService];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005FFCC;
    v17[3] = &unk_1008CA5A8;
    v17[4] = self;
    [(SFPINPairSession *)self->_pinPairSession setCompletionHandler:v17];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006008C;
    v16[3] = &unk_1008CB040;
    v16[4] = self;
    [(SFPINPairSession *)self->_pinPairSession setShowPINHandler:v16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100060094;
    void v15[3] = &unk_1008CA4B8;
    v15[4] = self;
    [(SFPINPairSession *)self->_pinPairSession setHidePINHandler:v15];
    [(SFPINPairSession *)self->_pinPairSession activate];
    id v10 = self->_pinPairSession;
  }
  -[SFPINPairSession handleServerRequest:](v10, "handleServerRequest:", v4, pinPairUUID);

LABEL_17:
}

- (void)_pwsHandleUserResponse:(int)a3 device:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v6 = a5;
  if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_pwsHandleProgressEvent:(unsigned int)a3 info:(id)a4
{
  id v4 = a4;
  id v5 = v4;
  if (dword_1009664E8 <= 30)
  {
    id v7 = v4;
    if (dword_1009664E8 != -1 || (int v6 = _LogCategory_Initialize(), v5 = v7, v6))
    {
      LogPrintF();
      id v5 = v7;
    }
  }
}

- (void)_repairEnsuredStarted
{
  if (self->_problemNotifyToken == -1)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    notify_register_check("com.apple.sharing.problems", &self->_problemNotifyToken);
  }
  if (self->_cfuNotifyToken == -1 && (self->_prefRepairAccounts || self->_prefRepairHomeKit))
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100060980;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.corefollowup.items_changed", &self->_cfuNotifyToken, dispatchQueue, handler);
    [(SDSetupAgent *)self _repairHandleCFUItemsChanged];
  }
  if (!self->_manateeMonitor && self->_cdpEnabled)
  {
    id v4 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    manateeMonitor = self->_manateeMonitor;
    self->_manateeMonitor = v4;

    [(CUSystemMonitor *)self->_manateeMonitor setDispatchQueue:self->_dispatchQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100060A20;
    v27[3] = &unk_1008CA4B8;
    v27[4] = self;
    [(CUSystemMonitor *)self->_manateeMonitor setManateeChangedHandler:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100060A28;
    v26[3] = &unk_1008CA4B8;
    v26[4] = self;
    [(CUSystemMonitor *)self->_manateeMonitor setPrimaryAppleIDChangedHandler:v26];
    int v6 = self->_manateeMonitor;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100060A30;
    v25[3] = &unk_1008CA4B8;
    v25[4] = self;
    [(CUSystemMonitor *)v6 activateWithCompletion:v25];
  }
  if (!self->_vpnCnx && self->_prefRepairVPN)
  {
    id v7 = (NEVPNConnection *)[(objc_class *)off_100966580() createConnectionForEnabledEnterpriseConfiguration];
    vpnCnx = self->_vpnCnx;
    self->_vpnCnx = v7;

    [(NEVPNConnection *)self->_vpnCnx addObserver:self forKeyPath:@"lastDisconnectError" options:0 context:0];
    uint64_t v9 = [(NEVPNConnection *)self->_vpnCnx lastDisconnectError];
    if (dword_1009664E8 <= 40 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v20 = v9;
      LogPrintF();
    }
    -[SDSetupAgent _repairVPNError:](self, "_repairVPNError:", v9, v20);
  }
  if (!self->_wifiHealthMonitor && self->_prefRepairWiFi)
  {
    id v10 = (SFWiFiHealthMonitor *)objc_alloc_init((Class)SFWiFiHealthMonitor);
    wifiHealthMonitor = self->_wifiHealthMonitor;
    self->_wifiHealthMonitor = v10;

    [(SFWiFiHealthMonitor *)self->_wifiHealthMonitor setDispatchQueue:self->_dispatchQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100060A38;
    void v24[3] = &unk_1008CB068;
    v24[4] = self;
    [(SFWiFiHealthMonitor *)self->_wifiHealthMonitor setStatusHandler:v24];
    [(SFWiFiHealthMonitor *)self->_wifiHealthMonitor activate];
  }
  if (SFDeviceClassCodeGet() == 4 && self->_cnsNotifyToken == -1)
  {
    id v12 = self->_dispatchQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100060B74;
    void v23[3] = &unk_1008CACA8;
    v23[4] = self;
    notify_register_dispatch(kCNUserInteractionRequirementNotifyKey, &self->_cnsNotifyToken, v12, v23);
    [(SDSetupAgent *)self _repairHandleCNSStateChanged];
  }
  if (!self->_repairService)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unint64_t v13 = (SFDeviceRepairService *)objc_alloc_init((Class)SFDeviceRepairService);
    repairService = self->_repairService;
    self->_repairService = v13;

    [(SFDeviceRepairService *)self->_repairService setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceRepairService *)self->_repairService setProblemFlags:0];
    long long v15 = +[SDStatusMonitor sharedMonitor];
    long long v16 = [v15 myAltDSID];
    [(SFDeviceRepairService *)self->_repairService setAltDSID:v16];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100060C14;
    v22[3] = &unk_1008CB090;
    v22[4] = self;
    [(SFDeviceRepairService *)self->_repairService setProgressHandler:v22];
    [(SFDeviceRepairService *)self->_repairService activate];
  }
  if (!self->_repairTimer)
  {
    long long v17 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    repairTimer = self->_repairTimer;
    self->_repairTimer = v17;

    unint64_t v19 = self->_repairTimer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000615F4;
    v21[3] = &unk_1008CA4B8;
    v21[4] = self;
    dispatch_source_set_event_handler(v19, v21);
    SFDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_repairTimer);
  }
  [(SDSetupAgent *)self _repairProblemFlagsChanged];
}

- (void)_repairEnsuredStopped
{
  int cfuNotifyToken = self->_cfuNotifyToken;
  if (cfuNotifyToken != -1)
  {
    notify_cancel(cfuNotifyToken);
    self->_int cfuNotifyToken = -1;
  }
  [(CUSystemMonitor *)self->_manateeMonitor invalidate];
  manateeMonitor = self->_manateeMonitor;
  self->_manateeMonitor = 0;

  self->_manateeProblem = 0;
  repairTimer = self->_repairTimer;
  if (repairTimer)
  {
    int v6 = repairTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_repairTimer;
    self->_repairTimer = 0;
  }
  vpnCnx = self->_vpnCnx;
  if (vpnCnx)
  {
    [(NEVPNConnection *)vpnCnx removeObserver:self forKeyPath:@"lastDisconnectError"];
    uint64_t v9 = self->_vpnCnx;
    self->_vpnCnx = 0;
  }
  [(SFWiFiHealthMonitor *)self->_wifiHealthMonitor invalidate];
  wifiHealthMonitor = self->_wifiHealthMonitor;
  self->_wifiHealthMonitor = 0;

  *(_WORD *)&self->_wifiBad = 0;
  int cnsNotifyToken = self->_cnsNotifyToken;
  if (cnsNotifyToken != -1)
  {
    notify_cancel(cnsNotifyToken);
    self->_int cnsNotifyToken = -1;
  }
  self->_cnsNeedsUI = 0;
  self->_problemFlags = 0;
  [(SDSetupAgent *)self _repairProblemFlagsChanged];
  if (self->_repairService)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceRepairService *)self->_repairService invalidateWithFlags:1];
    repairService = self->_repairService;
    self->_repairService = 0;
  }
  int problemNotifyToken = self->_problemNotifyToken;
  if (problemNotifyToken != -1)
  {
    notify_cancel(problemNotifyToken);
    self->_int problemNotifyToken = -1;
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_renewAccountIfNecessaryForCFUItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (self->_prefRepairAccounts)
  {
    uint64_t v9 = [v6 indexesOfObjectsPassingTest:&stru_1008CB0D0];
    if ([v9 count])
    {
      if (!self->_lastRenewalAttempt) {
        goto LABEL_6;
      }
      id v10 = +[NSDate now];
      [v10 timeIntervalSinceDate:self->_lastRenewalAttempt];
      double v12 = v11;
      unint64_t v13 = +[NSDate now];
      [v13 timeIntervalSinceDate:self->_lastRenewalAttempt];
      double v15 = v14;

      if (v12 >= 0.0)
      {
        if (v15 >= 86400.0)
        {
LABEL_6:
          long long v16 = +[ACAccountStore defaultStore];
          long long v17 = sub_1001B22F4(v16);
          long long v18 = v17;
          if (v17)
          {
            if (![v17 isWarmingUp])
            {
              if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              unint64_t v19 = +[NSDate now];
              lastRenewalAttempt = self->_lastRenewalAttempt;
              self->_lastRenewalAttempt = v19;

              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_100061C94;
              v21[3] = &unk_1008CB0F8;
              id v24 = v8;
              id v22 = v6;
              id v23 = v9;
              [v16 renewCredentialsForAccount:v18 completion:v21];

              goto LABEL_30;
            }
            if (dword_1009664E8 > 30 || dword_1009664E8 == -1 && !_LogCategory_Initialize())
            {
LABEL_27:
              ((void (**)(void, id))v8)[2](v8, v6);
LABEL_30:

              goto LABEL_31;
            }
          }
          else if (dword_1009664E8 > 90 || dword_1009664E8 == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_27;
          }
          LogPrintF();
          goto LABEL_27;
        }
      }
      else if (v15 <= -86400.0)
      {
        goto LABEL_6;
      }
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    ((void (**)(void, id))v8)[2](v8, v6);
LABEL_31:

    goto LABEL_32;
  }
  (*((void (**)(id, id))v7 + 2))(v7, v6);
LABEL_32:
}

- (void)_repairHandleCFUItemsChanged
{
  id v3 = [objc_alloc(off_100966588()) initWithClientIdentifier:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100061E78;
  v4[3] = &unk_1008CB120;
  v4[4] = self;
  [v3 pendingFollowUpItemsWithCompletion:v4];
}

- (void)_repairHandleCFUItems:(id)a3
{
  id v4 = a3;
  unint64_t problemFlags = self->_problemFlags;
  if ([(SDSetupAgent *)self _useSymptomsReport])
  {
    uint64_t v6 = problemFlags & 0xFFBAFFA7;
  }
  else
  {
    uint64_t v6 = problemFlags & 0xFFB8FFA1;
    if (self->_manateeProblem) {
      uint64_t v6 = problemFlags & 0xFFB8FFA1 | 0x20000;
    }
  }
  if (self->_wifiBad || self->_cnsNeedsUI) {
    v6 |= 0x10uLL;
  }
  if (self->_wifiBad8021x) {
    unint64_t v7 = v6 | 0x10000;
  }
  else {
    unint64_t v7 = v6;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    id v22 = v25;
    uint64_t v10 = *(void *)v27;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v11);
        unint64_t v13 = [v12 uniqueIdentifier:v21, v22];
        if (v13)
        {
          if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
          {
            id v21 = v13;
            LogPrintF();
          }
          if (self->_prefRepairHomeKit)
          {
            double v14 = off_100966590();
            unsigned int v15 = [v13 isEqual:v14];

            if (v15)
            {
LABEL_26:
              v7 |= 8uLL;
              goto LABEL_58;
            }
          }
          if (objc_msgSend(v13, "isEqual:", @"com.apple.homekit.PrimaryResident", v21))
          {
            v7 |= 0x400000uLL;
            goto LABEL_58;
          }
          if (self->_prefRepairAccounts)
          {
            if (sub_100061B14(v12) && ![(SDSetupAgent *)self _useSymptomsReport])
            {
              [(CUSystemMonitor *)self->_manateeMonitor forceManateeStateRefresh];
              [(SDSetupAgent *)self _fetchSymptomsReport];
              if (SFIsDeviceAppleTV())
              {
                long long v17 = 0;
              }
              else
              {
                long long v18 = [(objc_class *)off_100966598() defaultStore];
                long long v17 = [v18 activeAccount];
              }
              uint64_t v19 = 6;
              if (!v17) {
                uint64_t v19 = 2;
              }
              v7 |= v19;
              goto LABEL_58;
            }
            if (self->_prefRepairAccounts
              && [v13 isEqual:@"com.apple.SSFollowUpIdentifier.RenewCredentials"]
              && ![(SDSetupAgent *)self _useSymptomsReport])
            {
              goto LABEL_57;
            }
          }
          if ([v13 isEqual:@"RepairCDPState"])
          {
            dispatchQueue = self->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v25[0] = sub_1000626A4;
            v25[1] = &unk_1008CA4B8;
            v25[2] = self;
            dispatch_async(dispatchQueue, block);
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-bt"])
          {
            v7 |= 0x200uLL;
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-cdp"])
          {
            v7 |= 0x20000uLL;
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-homekit"]) {
            goto LABEL_26;
          }
          if ([v13 isEqual:@"x-hw"])
          {
            v7 |= 0x100uLL;
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-icloud"])
          {
            v7 |= 2uLL;
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-inet"])
          {
            v7 |= 0x80uLL;
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-itunes"])
          {
LABEL_57:
            v7 |= 4uLL;
            goto LABEL_58;
          }
          if ([v13 isEqual:@"x-profile"])
          {
            v7 |= 0x40000uLL;
          }
          else if ([v13 isEqual:@"x-recovery"])
          {
            v7 |= 0x800uLL;
          }
          else if ([v13 isEqual:@"x-StereoError"])
          {
            v7 |= 0x4000uLL;
          }
          else if ([v13 isEqual:@"x-StereoNotFound"])
          {
            v7 |= 0x1000uLL;
          }
          else if ([v13 isEqual:@"x-StereoVersion"])
          {
            v7 |= 0x2000uLL;
          }
          else if ([v13 isEqual:@"x-thermal"])
          {
            v7 |= 0x400uLL;
          }
          else if ([v13 isEqual:@"x-wifi"])
          {
            v7 |= 0x10uLL;
          }
          else if ([v13 isEqual:@"x-wifi8021x"])
          {
            v7 |= 0x10000uLL;
          }
          else if ([v13 isEqual:@"x-wifiperf"])
          {
            v7 |= 0x40uLL;
          }
          else if ([v13 isEqual:@"x-vpn"])
          {
            v7 |= 0x8000uLL;
          }
          else if ([v13 isEqual:@"x-netnoshare"])
          {
            v7 |= 0x80000uLL;
          }
          else if ([v13 isEqual:@"x-netneedprofile"])
          {
            v7 |= 0x100000uLL;
          }
          else if ([v13 isEqual:@"x-captivenetwork"])
          {
            v7 |= 0x200000uLL;
          }
          else if ([v13 isEqual:@"x-hkprimary"])
          {
            v7 |= 0x400000uLL;
          }
        }
        else if (dword_1009664E8 <= 60 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
        {
          id v21 = v12;
          LogPrintF();
        }
LABEL_58:

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v20 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v9 = v20;
    }
    while (v20);
  }

  if (v7 != self->_problemFlags)
  {
    self->_unint64_t problemFlags = v7;
    [(SDSetupAgent *)self _repairProblemFlagsChanged];
  }
}

- (BOOL)_useSymptomsReport
{
  int v2 = _os_feature_enabled_impl();
  if (v2) {
    LOBYTE(v2) = SFDeviceClassCodeGet() == 6;
  }
  return v2;
}

- (void)_fetchSymptomsReport
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  id v4 = [v3 myAltDSID];

  if (v4)
  {
    if (!self->_repairController)
    {
      id v5 = (AISRepairController *)objc_alloc_init(off_1009665A0());
      repairController = self->_repairController;
      self->_repairController = v5;
    }
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = [objc_alloc(off_1009665A8()) initWithAltDSID:v4];
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", AIDAServiceTypeCloud, AIDAServiceTypeStore, 0);
    [v7 setRequiredServiceTypes:v8];

    id v9 = self->_repairController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_1000628C0;
    v10[3] = &unk_1008CB148;
    v10[4] = self;
    [(AISRepairController *)v9 generateSymptomReportWithContext:v7 completionHandler:v10];
  }
  else if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_repairHandleCompletion
{
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_repairTimer) {
    SFDispatchTimerSet();
  }
  self->_unint64_t problemFlags = 0;
  [(SDSetupAgent *)self _repairProblemFlagsChanged];
  wifiHealthMonitor = self->_wifiHealthMonitor;

  [(SFWiFiHealthMonitor *)wifiHealthMonitor reset];
}

- (void)_repairHandleManateeChanged
{
  manateeMonitor = self->_manateeMonitor;
  if (manateeMonitor && [(CUSystemMonitor *)manateeMonitor primaryAppleIDIsHSA2])
  {
    if ([(SDSetupAgent *)self _useSymptomsReport])
    {
      [(SDSetupAgent *)self _fetchSymptomsReport];
    }
    else
    {
      unsigned int v4 = [(CUSystemMonitor *)self->_manateeMonitor manateeState];
      self->_manateeProblem = v4 == 1;
      unint64_t problemFlags = self->_problemFlags;
      unint64_t v6 = problemFlags | 0x20000;
      if (v4 != 1) {
        unint64_t v6 = self->_problemFlags & 0xFFFDFFFF;
      }
      if (v6 != problemFlags)
      {
        self->_unint64_t problemFlags = v6;
        [(SDSetupAgent *)self _repairProblemFlagsChanged];
      }
    }
  }
}

- (void)_repairHandleCNSStateChanged
{
  unint64_t problemFlags = self->_problemFlags;
  int IsRequired = CNUserInteractionIsRequired();
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (IsRequired)
  {
    self->_cnsNeedsUI = 1;
    problemFlags |= 0x10uLL;
  }
  else if (self->_cnsNeedsUI)
  {
    self->_cnsNeedsUI = 0;
    if (self->_wifiBad) {
      problemFlags |= 0x10uLL;
    }
    else {
      unint64_t problemFlags = problemFlags & 0xFFFFFFEF;
    }
  }
  if (problemFlags != self->_problemFlags)
  {
    self->_unint64_t problemFlags = problemFlags;
    [(SDSetupAgent *)self _repairProblemFlagsChanged];
  }
}

- (void)_repairProblemCheck
{
  [(CUSystemMonitor *)self->_manateeMonitor forceManateeStateRefresh];
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    [(CUSystemMonitor *)self->_manateeMonitor manateeState];
    LogPrintF();
  }

  [(SDSetupAgent *)self _repairHandleManateeChanged];
}

- (void)_repairProblemFlagsChanged
{
  unint64_t problemFlags = self->_problemFlags;
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v6 = problemFlags;
    id v7 = &unk_10076DA88;
    LogPrintF();
  }
  if (problemFlags) {
    uint64_t v4 = problemFlags | 1;
  }
  else {
    uint64_t v4 = 0;
  }
  -[SFDeviceRepairService setProblemFlags:](self->_repairService, "setProblemFlags:", v4, v6, v7);
  int problemNotifyToken = self->_problemNotifyToken;
  if (problemNotifyToken != -1)
  {
    notify_set_state(problemNotifyToken, v4);
    notify_post("com.apple.sharing.problems");
  }
}

- (void)_repairSilentStart:(id)a3
{
  id v4 = a3;
  if (([v4 problemFlags] & 0x10000) != 0)
  {
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      goto LABEL_19;
    }
  }
  else
  {
    if (([v4 problemFlags] & 0x10) != 0)
    {
      id v5 = [v4 model];
      unsigned int v6 = [v5 hasPrefix:@"AudioAccessory"];

      if (v6)
      {
        id v7 = (void *)WiFiCopyCurrentNetworkInfo();
        if (CFDictionaryGetInt64())
        {
          if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
LABEL_25:

          goto LABEL_26;
        }
      }
    }
    if (((unint64_t)[v4 problemFlags] & 0x22001E) != 0)
    {
      [(SFDeviceRepairSession *)self->_repairSession invalidate];
      id v8 = (SFDeviceRepairSession *)objc_alloc_init((Class)SFDeviceRepairSession);
      repairSession = self->_repairSession;
      self->_repairSession = v8;

      [(SFDeviceRepairSession *)self->_repairSession setPeerDevice:v4];
      uint64_t v10 = +[SDStatusMonitor sharedMonitor];
      double v11 = [v10 myAltDSID];
      [(SFDeviceRepairSession *)self->_repairSession setAltDSID:v11];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000631E4;
      v16[3] = &unk_1008CB090;
      v16[4] = self;
      [(SFDeviceRepairSession *)self->_repairSession setProgressHandler:v16];
      double v12 = [v4 bleDevice];
      id v13 = [v12 foundTicks];

      if (v13)
      {
        mach_absolute_time();
        uint64_t v14 = UpTicksToMilliseconds();
      }
      else
      {
        uint64_t v14 = 0;
      }
      [(SFDeviceRepairSession *)self->_repairSession setTriggerMs:v14];
      unsigned int v15 = +[IDSServerBag sharedInstance];
      id v7 = [v15 objectForKey:@"SDDisableRepairSilentAuth"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 BOOLValue]) {
        [(SFDeviceRepairSession *)self->_repairSession setDisableSilentAuth:1];
      }
      [(SFDeviceRepairSession *)self->_repairSession activate];
      goto LABEL_25;
    }
    if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
    {
      [v4 problemFlags];
LABEL_19:
      LogPrintF();
    }
  }
LABEL_26:
}

- (void)_repairSilentProgress:(unsigned int)a3 info:(id)a4
{
  id v13 = (__CFString *)a4;
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v6 = sub_100060CDC(a3);
    CFStringRef v7 = &stru_1008E7020;
    if (v13) {
      CFStringRef v7 = v13;
    }
    double v11 = v6;
    CFStringRef v12 = v7;
    LogPrintF();
  }
  if (a3 == 20)
  {
    if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (a3 == 96)
    {
      id v8 = [(SFDeviceRepairSession *)self->_repairSession peerDevice];
      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
      {
        double v11 = v8;
        LogPrintF();
      }
      [(SFDeviceRepairSession *)self->_repairSession invalidate];
      repairSession = self->_repairSession;
      self->_repairSession = 0;

      self->_triggeredUIRepair = 0;
    }
    else
    {
      if (a3 != 30) {
        goto LABEL_26;
      }
      CFErrorGetTypeID();
      CFDictionaryGetTypedValue();
      id v8 = (char *)objc_claimAutoreleasedReturnValue();
      [(SDSetupAgent *)self _repairUpdateIDSCache];
      [(SFDeviceRepairSession *)self->_repairSession invalidate];
      id v9 = self->_repairSession;
      self->_repairSession = 0;

      if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
LABEL_26:
}

- (void)_repairUpdateIDSCache
{
  id v3 = [(SFDeviceRepairSession *)self->_repairSession idsIdentifier];
  if (v3)
  {
    id v6 = v3;
    id v4 = [(SFDeviceRepairSession *)self->_repairSession peerDevice];
    if (v4)
    {
      id v5 = +[SDNearbyAgent sharedNearbyAgent];
      [v5 idsAddCachedIDSIdentifier:v6 device:v4];
    }
    id v3 = v6;
  }
}

- (void)_repairVPNError:(id)a3
{
  id v9 = a3;
  id v4 = [v9 domain];
  unsigned __int8 v5 = [v4 isEqual:@"NEVPNConnectionErrorDomainIPSec"];

  if (v5)
  {
    id v6 = [v9 code];
    unint64_t problemFlags = self->_problemFlags;
    unint64_t v8 = problemFlags | 0x8000;
    if (v6 != (id)21) {
      unint64_t v8 = self->_problemFlags & 0xFFFF7FFF;
    }
  }
  else
  {
    unint64_t problemFlags = self->_problemFlags;
    unint64_t v8 = problemFlags & 0xFFFF7FFF;
  }
  if (v8 != problemFlags)
  {
    self->_unint64_t problemFlags = v8;
    [(SDSetupAgent *)self _repairProblemFlagsChanged];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"lastDisconnectError", a4, a5, a6))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1000635FC;
    block[3] = &unk_1008CA4B8;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100063760;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)testHomeKitDeviceDetected:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100063A88;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testNFCUI:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100063BD0;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testPairUI:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [v5 setIdentifier:v6];

  id v7 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v7];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100063DDC;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testRepairUI:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v4;
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = objc_alloc((Class)NSUUID);
  if ([v4 isEqual:@"-fail"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000002";
  }
  else if ([v4 isEqual:@"-nowifi"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000003";
  }
  else if ([v4 isEqual:@"-badwifi"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000004";
  }
  else
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v8 = [v6 initWithUUIDString:v7, v12];
  [v5 setIdentifier:v8];

  [v5 setName:@"Living Room"];
  id v9 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v9];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10006406C;
  block[3] = &unk_1008CA640;
  void block[4] = self;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIB238:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v4;
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = objc_alloc((Class)NSUUID);
  if ([v4 isEqual:@"-fail"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000002";
  }
  else if ([v4 isEqual:@"-code"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000003";
  }
  else if ([v4 isEqual:@"-nowifi"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000004";
  }
  else if ([v4 isEqual:@"-badwifi"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000005";
  }
  else if ([v4 isEqual:@"-noicloud"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000006";
  }
  else if ([v4 isEqual:@"-nohsa2"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000007";
  }
  else if ([v4 isEqual:@"-noitunes"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000008";
  }
  else if ([v4 isEqual:@"-nohome"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000009";
  }
  else if ([v4 isEqual:@"-nokeychain"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000A";
  }
  else if ([v4 isEqual:@"-sharesplit"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000B";
  }
  else if ([v4 isEqual:@"-audio"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000C";
  }
  else if ([v4 isEqual:@"-siri"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000D";
  }
  else if ([v4 isEqual:@"-AppleMusic"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000E";
  }
  else if ([v4 isEqual:@"-WiFiBadEnterprise"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000F";
  }
  else
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v8 = [v6 initWithUUIDString:v7, v17];
  [v5 setIdentifier:v8];

  [v5 setOsVersion:13];
  id v9 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v9];
  [v5 setDeviceClassCode:4];
  [v5 setDeviceModelCode:-[SDSetupAgent extractParameter:inString:](self, "extractParameter:inString:", @"device", v4)];
  int64_t v10 = [(SDSetupAgent *)self extractParameter:@"color" inString:v4];
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 2;
  }
  [v5 setDeviceActionType:33];
  CFStringRef v21 = @"cc";
  id v12 = +[NSNumber numberWithInteger:v11];
  id v22 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v9 setAdvertisementFields:v13];

  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    [v5 deviceActionType];
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10006451C;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v19 = v5;
  id v20 = v4;
  id v15 = v4;
  id v16 = v5;
  dispatch_async(dispatchQueue, block);
}

- (int64_t)extractParameter:(id)a3 inString:(id)a4
{
  id v5 = a3;
  [a4 componentsSeparatedByString:@","];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (int64_t)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", v5, (void)v14))
        {
          uint64_t v11 = [v10 componentsSeparatedByString:@"="];
          id v12 = [v11 lastObject];
          int64_t v7 = (int)[v12 intValue];

          goto LABEL_11;
        }
      }
      int64_t v7 = (int64_t)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)testSetupUIiOS:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    id v14 = v4;
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  if ([v4 hasSuffix:@"-ipad"])
  {
    uint64_t v6 = 3;
LABEL_9:
    uint64_t v7 = [v4 substringToIndex:[v4 length] - 5];

    id v4 = (id)v7;
    goto LABEL_11;
  }
  if ([v4 hasSuffix:@"-ipod"])
  {
    uint64_t v6 = 2;
    goto LABEL_9;
  }
  uint64_t v6 = 1;
LABEL_11:
  [v5 setDeviceClassCode:v6, v14];
  id v8 = objc_alloc((Class)NSUUID);
  if ([v4 isEqual:@"-fail"]) {
    CFStringRef v9 = @"00000000-0000-0000-0000-000000000002";
  }
  else {
    CFStringRef v9 = @"00000000-0000-0000-0000-000000000001";
  }
  id v10 = [v8 initWithUUIDString:v9];
  [v5 setIdentifier:v10];

  id v11 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v11];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100064924;
  block[3] = &unk_1008CA640;
  void block[4] = self;
  id v16 = v5;
  id v13 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIPasswordSharing:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v4;
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  [v5 setContactIdentifier:@"00000000-0000-0000-0000-000000000000"];
  [v5 setRequestSSID:@"WiFiNetwork"];
  id v6 = objc_alloc((Class)NSUUID);
  if ([v4 isEqual:@"-rich"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000002";
  }
  else if ([v4 isEqual:@"-fail"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000003";
  }
  else if ([v4 isEqual:@"-hs"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000004";
  }
  else if ([v4 isEqual:@"-hsfail"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000005";
  }
  else if ([v4 isEqual:@"-device"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000006";
  }
  else if ([v4 isEqual:@"-long"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000007";
  }
  else
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v8 = [v6 initWithUUIDString:v7, v11];
  [v5 setIdentifier:v8];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100064B50;
  block[3] = &unk_1008CA640;
  void block[4] = self;
  id v13 = v5;
  id v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIWatch:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [v5 setIdentifier:v6];

  [v5 setName:@"05938CDC"];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100064CA4;
  block[3] = &unk_1008CA640;
  void block[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIWHA:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v4;
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = objc_alloc((Class)NSUUID);
  if ([v4 isEqual:@"-fail"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000002";
  }
  else if ([v4 isEqual:@"-code"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000003";
  }
  else if ([v4 isEqual:@"-nowifi"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000004";
  }
  else if ([v4 isEqual:@"-badwifi"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000005";
  }
  else if ([v4 isEqual:@"-noicloud"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000006";
  }
  else if ([v4 isEqual:@"-nohsa2"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000007";
  }
  else if ([v4 isEqual:@"-noitunes"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000008";
  }
  else if ([v4 isEqual:@"-nohome"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000009";
  }
  else if ([v4 isEqual:@"-mismatch"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000A";
  }
  else if ([v4 isEqual:@"-keychain"])
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-00000000000B";
  }
  else
  {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v8 = [v6 initWithUUIDString:v7, v12];
  [v5 setIdentifier:v8];

  id v9 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v9];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100064F58;
  block[3] = &unk_1008CA640;
  void block[4] = self;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testUIAppleTVSetup:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [v5 setIdentifier:v6];

  id v7 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v7];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000650D8;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testUIShareAudio:(id)a3
{
  id v3 = a3;
  if (dword_1009664E8 <= 30 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = objc_alloc_init((Class)SFProxCardSessionClient);
  [v4 setViewControllerClassName:@"ShareAudioAcceptMainController"];
  id v5 = v3;
  id v6 = v5;
  if (v5)
  {
    CFStringRef v9 = @"_proxTestParams";
    id v10 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v4 setUserInfo:v7];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100065324;
  v8[3] = &unk_1008CA5A8;
  v8[4] = v4;
  [v4 setErrorHandler:v8];
  [v4 setInvalidationHandler:&stru_1008CB168];
  [v4 activateWithCompletion:&stru_1008CB188];
}

- (void)testUITVLatencySetup:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [v5 setIdentifier:v6];

  id v7 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v7];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100065644;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testUITVLatencyColorimeterSetup:(id)a3
{
  id v4 = a3;
  if (dword_1009664E8 <= 50 && (dword_1009664E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [v5 setIdentifier:v6];

  id v7 = objc_alloc_init((Class)SFBLEDevice);
  [v5 setBleDevice:v7];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10006586C;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testProxCardKit:(id)a3
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [v4 setIdentifier:v5];

  id v6 = objc_alloc_init((Class)SFBLEDevice);
  [v4 setBleDevice:v6];
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_100065A18;
  v9[3] = &unk_1008CA640;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(dispatchQueue, v9);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventRepair
{
  return self->_preventRepair;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(unint64_t)a3
{
  self->_unint64_t problemFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lastRenewalAttempt, 0);
  objc_storeStrong((id *)&self->_wifiHealthMonitor, 0);
  objc_storeStrong((id *)&self->_repairTimer, 0);
  objc_storeStrong((id *)&self->_repairSession, 0);
  objc_storeStrong((id *)&self->_repairService, 0);
  objc_storeStrong((id *)&self->_repairController, 0);
  objc_storeStrong((id *)&self->_manateeMonitor, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_watchSetupScanner, 0);
  objc_storeStrong((id *)&self->_watchSetupDevices, 0);
  objc_storeStrong((id *)&self->_watchFastScanTimer, 0);
  objc_storeStrong((id *)&self->_vpnCnx, 0);
  objc_storeStrong((id *)&self->_unoteTVLatencySetup, 0);
  objc_storeStrong((id *)&self->_triggeredDevices, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_setupURL, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_pinPairUUID, 0);
  objc_storeStrong((id *)&self->_pinPairSession, 0);
  objc_storeStrong((id *)&self->_pinPairService, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);

  objc_storeStrong((id *)&self->_bleAuthTagFilter, 0);
}

@end