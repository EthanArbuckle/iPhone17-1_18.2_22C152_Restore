@interface RPPeopleDaemon
+ (id)sharedPeopleDaemon;
- (BOOL)_pruneFamilyDevices;
- (BOOL)_pruneFriendAccounts:(BOOL)a3;
- (BOOL)_pruneFriendDevices;
- (BOOL)_pruneFriends:(BOOL)a3;
- (BOOL)_sendCloudIdentityFrameType:(unsigned __int8)a3 destinationID:(id)a4 flags:(unsigned int)a5 msgCtx:(id)a6;
- (BOOL)_shouldThrottleFriendSyncing;
- (BOOL)_updateFamilyAccounts;
- (BOOL)_updateFamilyDevices;
- (BOOL)_updateFamilyIdentityWithFamilyMember:(id)a3;
- (BOOL)_updateFriendAccounts;
- (BOOL)_updateFriendDevices;
- (BOOL)addOrUpdateAdHocPairedIdentity:(id)a3 error:(id *)a4;
- (BOOL)addOrUpdateIdentity:(id)a3 error:(id *)a4;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (RPPeopleDaemon)init;
- (id)_primaryAppleID:(BOOL)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)getFamilyDeviceIdentities;
- (id)getFamilyURIs;
- (id)getFriendDeviceIdentities;
- (unsigned)_updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4 sendersKnownAlias:(id)a5 userAdded:(BOOL)a6 updateDateRequested:(BOOL)a7 suggestedContactIDs:(id)a8;
- (unsigned)_updateIdentityType:(int)a3 idsDeviceID:(id)a4 appleID:(id)a5 contactID:(id)a6 msg:(id)a7;
- (void)_activate;
- (void)_bufferCloudMessage:(id)a3 frameType:(unsigned __int8)a4 msgCtx:(id)a5;
- (void)_daemonDevice:(id)a3 updatedMeasurement:(id)a4;
- (void)_daemonDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_daemonDeviceFound:(id)a3;
- (void)_daemonDeviceLost:(id)a3;
- (void)_discoveryEnsureStarted;
- (void)_discoveryEnsureStopped;
- (void)_familyEnsureStarted;
- (void)_familyEnsureStopped;
- (void)_fetchSameAccountIdentities;
- (void)_friendsEnsureStarted;
- (void)_friendsEnsureStopped;
- (void)_friendsUpdateSuggestedIfNeeded;
- (void)_invalidate;
- (void)_invalidated;
- (void)_irkMetricsSetup;
- (void)_processBufferedCloudMessages;
- (void)_rangingBLEActionScannerBurst;
- (void)_rangingBLEActionScannerDeviceFound:(id)a3;
- (void)_rangingBLEActionScannerDeviceLost:(id)a3;
- (void)_rangingBLEActionScannerEnsureStarted;
- (void)_rangingBLEActionScannerEnsureStopped;
- (void)_rangingInitiatorEnsureStarted;
- (void)_rangingInitiatorEnsureStopped;
- (void)_rangingInitiatorHandlePeer:(id)a3 measurement:(id)a4;
- (void)_rangingInitiatorStatusChanged;
- (void)_rangingRemoveDevice:(id)a3;
- (void)_rangingResponderEnsureStarted;
- (void)_rangingResponderEnsureStopped;
- (void)_rangingResponderUpdate;
- (void)_rangingResponderUpdateForAirDropChange;
- (void)_rangingUpdateForDevice:(id)a3;
- (void)_regenerateSelfIdentity:(id)a3;
- (void)_resetFriends;
- (void)_update;
- (void)_updateFamilyIdentities;
- (void)_updateFamilyNotification;
- (void)_updateFamilySyncing;
- (void)_updateFriendIdentities;
- (void)_updateFriendPrivacy;
- (void)_updateFriendPrivacyResults:(id)a3;
- (void)_updateFriendSyncing;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)receivedFamilyIdentityRequest:(id)a3 msgCtx:(id)a4;
- (void)receivedFamilyIdentityResponse:(id)a3 msgCtx:(id)a4;
- (void)receivedFamilyIdentityUpdate:(id)a3 msgCtx:(id)a4;
- (void)receivedFriendIdentityRequest:(id)a3 msgCtx:(id)a4;
- (void)receivedFriendIdentityResponse:(id)a3 msgCtx:(id)a4;
- (void)receivedFriendIdentityUpdate:(id)a3 msgCtx:(id)a4;
- (void)reportIRKMetrics;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPPeopleDaemon

+ (id)sharedPeopleDaemon
{
  if (qword_100142F30 != -1) {
    dispatch_once(&qword_100142F30, &stru_100124460);
  }
  v2 = (void *)qword_100142F28;

  return v2;
}

- (RPPeopleDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPPeopleDaemon;
  v2 = [(RPPeopleDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_airdropModeNotifyToken = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_familyNotifyToken = -1;
    v3->_friendsSuggestedNotifyToken = -1;
    v3->_privacyChangedNotifyToken = -1;
    [(RPPeopleDaemon *)v3 _irkMetricsSetup];
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 21)
  {
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x3032000000;
    v100 = sub_10008EB10;
    v101 = sub_10008EB20;
    id v102 = 0;
    v62 = [(CUSystemMonitor *)self->_familyMemberMonitor familyMembers];
    objc_super v6 = (id *)(v98 + 5);
    id obj = (id)v98[5];
    id v7 = [(NSMutableDictionary *)self->_discoveredDevices count];
    unint64_t v59 = (unint64_t)[v62 count];
    id v60 = [(NSMutableSet *)self->_xpcConnections count];
    double v57 = *(double *)&v7;
    NSAppendPrintF();
    objc_storeStrong(v6, obj);
    if (a3 > 10)
    {
      int v23 = 50;
    }
    else
    {
      if (objc_msgSend(v62, "count", v7, v59, v60))
      {
        v8 = (id *)(v98 + 5);
        id v95 = (id)v98[5];
        NSAppendPrintF();
        objc_storeStrong(v8, v95);
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v63 = v62;
        id v9 = [v63 countByEnumeratingWithState:&v91 objects:v104 count:16];
        if (v9)
        {
          v10 = "";
          uint64_t v11 = *(void *)v92;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v92 != v11) {
                objc_enumerationMutation(v63);
              }
              v13 = *(void **)(*((void *)&v91 + 1) + 8 * i);
              v14 = (id *)(v98 + 5);
              id v90 = (id)v98[5];
              v15 = [v13 appleID:v57 v59 v61];
              unsigned int v16 = [v13 isMe];
              v17 = " (me)";
              if (!v16) {
                v17 = "";
              }
              unint64_t v59 = (unint64_t)v15;
              v61 = v17;
              double v57 = *(double *)&v10;
              NSAppendPrintF();
              objc_storeStrong(v14, v90);

              v10 = ", ";
            }
            id v9 = [v63 countByEnumeratingWithState:&v91 objects:v104 count:16 *(void *)&v57, v15, v61];
            v10 = ", ";
          }
          while (v9);
        }

        v18 = (id *)(v98 + 5);
        id v89 = (id)v98[5];
        NSAppendPrintF();
        objc_storeStrong(v18, v89);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      CFPrefs_GetDouble();
      if (v20 >= 0.0)
      {
        if (v20 == 0.0)
        {
          v21 = (void **)(v98 + 5);
          v87 = (void *)v98[5];
          NSAppendPrintF();
          v22 = v87;
        }
        else
        {
          v21 = (void **)(v98 + 5);
          if (v20 <= Current)
          {
            v86 = (void *)v98[5];
            double v57 = v20;
            NSAppendPrintF();
            v22 = v86;
          }
          else
          {
            v85 = (void *)v98[5];
            unint64_t v59 = (int)fmin(v20 - Current, 2147483650.0);
            double v57 = v20;
            NSAppendPrintF();
            v22 = v85;
          }
        }
      }
      else
      {
        v21 = (void **)(v98 + 5);
        v88 = (void *)v98[5];
        NSAppendPrintF();
        v22 = v88;
      }
      id v24 = v22;
      v25 = *v21;
      *v21 = v24;

      int v23 = 30;
    }
    int v64 = v23;
    v26 = self->_deviceDiscovery;
    v27 = v26;
    if (v26)
    {
      v28 = (id *)(v98 + 5);
      id v84 = (id)v98[5];
      double v57 = *(double *)&v26;
      NSAppendPrintF();
      objc_storeStrong(v28, v84);
    }

    id v29 = [(NSMutableDictionary *)self->_discoveredDevices count];
    if (v29)
    {
      v30 = (id *)(v98 + 5);
      id v83 = (id)v98[5];
      double v57 = *(double *)&v29;
      NSAppendPrintF();
      objc_storeStrong(v30, v83);
    }
    discoveredDevices = self->_discoveredDevices;
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10008EB28;
    v81[3] = &unk_100124488;
    v81[4] = &v97;
    int v82 = v64;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v81, *(void *)&v57, v59);
    v32 = self->_rangingInitiator;
    if (v32)
    {
      v33 = (id *)(v98 + 5);
      id v80 = (id)v98[5];
      NSAppendPrintF();
      objc_storeStrong(v33, v80);
    }

    v34 = self->_rangingResponder;
    if (v34)
    {
      v35 = (id *)(v98 + 5);
      id v79 = (id)v98[5];
      NSAppendPrintF();
      objc_storeStrong(v35, v79);
    }

    v36 = self->_rangingBLEActionAdvertiser;
    v37 = v36;
    if (v36)
    {
      v38 = (id *)(v98 + 5);
      id v78 = (id)v98[5];
      id v58 = v36;
      NSAppendPrintF();
      objc_storeStrong(v38, v78);
    }

    v39 = self->_rangingBLEActionScanner;
    v40 = v39;
    if (v39)
    {
      v41 = (id *)(v98 + 5);
      id v77 = (id)v98[5];
      id v58 = v39;
      NSAppendPrintF();
      objc_storeStrong(v41, v77);
    }

    rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10008EB94;
    v75[3] = &unk_100121540;
    v75[4] = &v97;
    int v76 = v64;
    [(NSMutableDictionary *)rangingBLEActionDevicesActive enumerateKeysAndObjectsUsingBlock:v75];
    rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10008EC00;
    v73[3] = &unk_100121540;
    v73[4] = &v97;
    int v74 = v64;
    [(NSMutableDictionary *)rangingBLEActionDevicesOther enumerateKeysAndObjectsUsingBlock:v73];
    id v44 = [(NSMutableSet *)self->_xpcConnections count];
    if (v44)
    {
      v45 = (id *)(v98 + 5);
      id v72 = (id)v98[5];
      id v58 = v44;
      NSAppendPrintF();
      objc_storeStrong(v45, v72);
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v46 = self->_xpcConnections;
    id v47 = [(NSMutableSet *)v46 countByEnumeratingWithState:&v68 objects:v103 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v69;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v69 != v48) {
            objc_enumerationMutation(v46);
          }
          v50 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
          v51 = (id *)(v98 + 5);
          id v67 = (id)v98[5];
          v52 = [v50 xpcCnx:v58];
          id v58 = [v52 processIdentifier];
          NSAppendPrintF();
          objc_storeStrong(v51, v67);

          v53 = [v50 activatedDiscovery];
          if (v53)
          {
            v54 = (id *)(v98 + 5);
            id v66 = (id)v98[5];
            CUDescriptionWithLevel();
            id v58 = (id)objc_claimAutoreleasedReturnValue();
            NSAppendPrintF();
            objc_storeStrong(v54, v66);
          }
          v55 = (id *)(v98 + 5);
          id v65 = (id)v98[5];
          NSAppendPrintF();
          objc_storeStrong(v55, v65);
        }
        id v47 = [(NSMutableSet *)v46 countByEnumeratingWithState:&v68 objects:v103 count:16];
      }
      while (v47);
    }

    id v4 = (id)v98[5];
    _Block_object_dispose(&v97, 8);
  }
  else
  {
    NSPrintF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008ECE0;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.rapport.people"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (self->_airdropModeNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10008EF94;
    handler[3] = &unk_100121630;
    handler[4] = self;
    notify_register_dispatch("com.apple.sharing.airdrop-mode-changed", &self->_airdropModeNotifyToken, dispatchQueue, handler);
    int airdropModeNotifyToken = self->_airdropModeNotifyToken;
    uint64_t state64 = 0;
    notify_get_state(airdropModeNotifyToken, &state64);
    self->_airdropMode = state64;
  }
  if (!self->_systemMonitor)
  {
    id v7 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v7;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008F074;
    v13[3] = &unk_100121158;
    v13[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008F07C;
    v12[3] = &unk_100121158;
    v12[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008F0A4;
    v11[3] = &unk_100121158;
    v11[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v11];
    id v9 = self->_systemMonitor;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008F0AC;
    v10[3] = &unk_100121158;
    v10[4] = self;
    [(CUSystemMonitor *)v9 activateWithCompletion:v10];
  }
  [(RPPeopleDaemon *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F128;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    primaryAppleIDCached = self->_primaryAppleIDCached;
    self->_primaryAppleIDCached = 0;

    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    int airdropModeNotifyToken = self->_airdropModeNotifyToken;
    if (airdropModeNotifyToken != -1)
    {
      notify_cancel(airdropModeNotifyToken);
      self->_int airdropModeNotifyToken = -1;
    }
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_xpcConnections;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) xpcCnx:v13];
          [v12 invalidate];
        }
        id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [(RPPeopleDaemon *)self _discoveryEnsureStopped];
    [(RPPeopleDaemon *)self _familyEnsureStopped];
    [(RPPeopleDaemon *)self _friendsEnsureStopped];
    [(RPPeopleDaemon *)self _rangingInitiatorEnsureStopped];
    [(RPPeopleDaemon *)self _rangingResponderEnsureStopped];
    [(RPPeopleDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableSet *)self->_xpcConnections count]
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  int v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPPeopleDaemon *)self _familyEnsureStopped];
    v5 = +[RPDaemon sharedDaemon];
    [v5 postDaemonInfoChanges:2];

    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPPeopleDaemon *)self _friendsEnsureStopped];
    objc_super v6 = +[RPDaemon sharedDaemon];
    [v6 postDaemonInfoChanges:128];

    [(RPPeopleDaemon *)self _update];
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_20:
      [(NSMutableDictionary *)self->_familyAccountIdentityMap enumerateKeysAndObjectsUsingBlock:&stru_1001244C8];
      [(RPPeopleDaemon *)self _update];
      if ((v3 & 0x80000) == 0) {
        return;
      }
      goto LABEL_21;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPPeopleDaemon *)self _update];
  if ((v3 & 4) != 0) {
    goto LABEL_20;
  }
LABEL_4:
  if ((v3 & 0x80000) == 0) {
    return;
  }
LABEL_21:

  [(RPPeopleDaemon *)self reportIRKMetrics];
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 rangeOfString:@"FamilyReq" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FamilyAck" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FamilyUp" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (!v9) {
      goto LABEL_34;
    }
    if ([v6 rangeOfString:@"FamilyReq" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeOfString:@"FamilyAck" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"FamilyUp" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_49:

LABEL_50:
          BOOL v8 = 1;
          goto LABEL_51;
        }
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v7;
          LogPrintF();
        }
        uint64_t v10 = self;
        uint64_t v11 = 34;
      }
      else
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v7;
          LogPrintF();
        }
        uint64_t v10 = self;
        uint64_t v11 = 33;
      }
    }
    else
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v17 = v7;
        LogPrintF();
      }
      uint64_t v10 = self;
      uint64_t v11 = 32;
    }
    -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](v10, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", v11, v9, 0, 0, v17);
    goto LABEL_49;
  }
  if ([v6 rangeOfString:@"FriendReq" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FriendAck" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FriendUp" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      if (CFDictionaryGetInt64())
      {
        if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        long long v13 = objc_opt_new();
        [v13 setNonWakingRequest:1];
      }
      else
      {
        if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        long long v13 = 0;
      }
      if ([v6 rangeOfString:@"FriendReq" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"FriendAck" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v6 rangeOfString:@"FriendUp" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_88:

            goto LABEL_49;
          }
          if (dword_100142410 > 30)
          {
            uint64_t v14 = 66;
          }
          else
          {
            if (dword_100142410 != -1)
            {
              uint64_t v14 = 66;
              goto LABEL_72;
            }
            uint64_t v14 = 66;
            if (_LogCategory_Initialize()) {
              goto LABEL_72;
            }
          }
LABEL_87:
          -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](self, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", v14, v9, 1, v13, v17);
          goto LABEL_88;
        }
        if (dword_100142410 > 30)
        {
          uint64_t v14 = 65;
          goto LABEL_87;
        }
        if (dword_100142410 == -1)
        {
          uint64_t v14 = 65;
          if (_LogCategory_Initialize()) {
            goto LABEL_72;
          }
          goto LABEL_87;
        }
        uint64_t v14 = 65;
      }
      else
      {
        if (dword_100142410 > 30)
        {
          uint64_t v14 = 64;
          goto LABEL_87;
        }
        if (dword_100142410 == -1)
        {
          uint64_t v14 = 64;
          if (_LogCategory_Initialize()) {
            goto LABEL_72;
          }
          goto LABEL_87;
        }
        uint64_t v14 = 64;
      }
LABEL_72:
      LogPrintF();
      -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](self, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", v14, v9, 1, v13, v7);
      goto LABEL_88;
    }
LABEL_34:
    if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_49;
  }
  if (![v6 caseInsensitiveCompare:@"FamilyClearDates"])
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    long long v16 = &stru_1001244E8;
    goto LABEL_99;
  }
  if (![v6 caseInsensitiveCompare:@"FriendClearDates"])
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    familyAccountIdentityMap = self->_friendAccountIdentityMap;
    long long v16 = &stru_100124508;
LABEL_99:
    [(NSMutableDictionary *)familyAccountIdentityMap enumerateKeysAndObjectsUsingBlock:v16];
LABEL_100:
    [(RPPeopleDaemon *)self _update];
    goto LABEL_50;
  }
  if (![v6 caseInsensitiveCompare:@"FriendPrivacy"])
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPPeopleDaemon *)self _updateFriendPrivacy];
    goto LABEL_50;
  }
  if ([v6 caseInsensitiveCompare:@"FriendSuggest"])
  {
    if ([v6 caseInsensitiveCompare:@"PruneFriends"])
    {
      if (![v6 caseInsensitiveCompare:@"ResetFriends"])
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RPPeopleDaemon *)self _resetFriends];
        goto LABEL_50;
      }
      if (![v6 caseInsensitiveCompare:@"RegenerateSelfIdentity"])
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RPPeopleDaemon *)self _regenerateSelfIdentity:@"dcmd"];
        goto LABEL_50;
      }
      if ([v6 caseInsensitiveCompare:@"update"])
      {
        BOOL v8 = 0;
        goto LABEL_51;
      }
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_100;
    }
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v8 = 1;
    [(RPPeopleDaemon *)self _pruneFriends:1];
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v8 = 1;
    self->_friendsSuggestedNeedsUpdate = 1;
    [(RPPeopleDaemon *)self _update];
  }
LABEL_51:

  return v8;
}

- (BOOL)addOrUpdateIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 type] == 15)
  {
    BOOL v7 = [(RPPeopleDaemon *)self addOrUpdateAdHocPairedIdentity:v6 error:a4];
  }
  else
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_10008EB10;
    v37 = sub_10008EB20;
    id v38 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000904A8;
    v29[3] = &unk_100124530;
    v31 = &v33;
    id v8 = v6;
    id v30 = v8;
    v32 = a4;
    id v9 = objc_retainBlock(v29);
    v28 = v9;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v27 = v8;
      LogPrintF();
    }
    uint64_t v10 = [v8 accountID:v27];
    uint64_t v11 = v10;
    if (v10 && [v10 length])
    {
      v12 = [v8 idsDeviceID];
      if (v12 && [v8 type] == 6)
      {
        long long v13 = [v8 contactID];
        unsigned int v14 = [(RPPeopleDaemon *)self _updateFriendIdentityWithAppleID:v11 contactID:v13 sendersKnownAlias:0 userAdded:1 updateDateRequested:1 suggestedContactIDs:0];
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        long long v16 = [v8 deviceIRKData];
        [v15 setObject:v16 forKeyedSubscript:@"_dIRK"];

        id v17 = [v8 edPKData];
        [v15 setObject:v17 forKeyedSubscript:@"_edPK"];

        id v18 = [v8 featureFlags];
        if (v18)
        {
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 featureFlags]);
          v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = &off_10012B300;
        }
        [v15 setObject:v19 forKeyedSubscript:@"_ff"];
        if (v18) {

        }
        if ((([(RPPeopleDaemon *)self _updateIdentityType:6 idsDeviceID:v12 appleID:v11 contactID:v13 msg:v15] | v14) & 0xCA86C) != 0)
        {
          double v20 = objc_alloc_init(RPCloudMessageContext);
          v21 = [v8 sendersKnownAlias];
          [(RPCloudMessageContext *)v20 setSendersKnownAlias:v21];

          [(RPPeopleDaemon *)self _sendCloudIdentityFrameType:64 destinationID:v11 flags:1 msgCtx:v20];
        }

        BOOL v7 = 1;
        id v9 = v28;
      }
      else
      {
        v25 = v34;
        uint64_t v26 = RPErrorF();
        BOOL v7 = 0;
        long long v13 = (void *)v25[5];
        v25[5] = v26;
      }
    }
    else
    {
      int v23 = v34;
      uint64_t v24 = RPErrorF();
      BOOL v7 = 0;
      v12 = (void *)v23[5];
      v23[5] = v24;
    }

    ((void (*)(void *))v9[2])(v9);
    _Block_object_dispose(&v33, 8);
  }
  return v7;
}

- (BOOL)addOrUpdateAdHocPairedIdentity:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v4;
    LogPrintF();
  }
  v5 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 addOrUpdateAdHocPairedIdentity:v4];

  return 1;
}

- (void)prefsChanged
{
  unsigned int v91 = 0;
  unsigned int DeviceClass = GestaltGetDeviceClass();
  id v4 = [(objc_class *)off_100142480() sharedInstance];
  id v90 = 0;
  unsigned int v5 = [v4 isDeviceEnrolledWithDeKOTA:&v90];
  id v6 = v90;

  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  if (self->_prefDisableSelfIdentityRolling != v7)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v8 = "yes";
      if (v7) {
        *(double *)&id v9 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&id v9 = COERCE_DOUBLE("yes");
      }
      if (!v7) {
        id v8 = "no";
      }
      double v87 = *(double *)&v9;
      v88 = (char *)v8;
      LogPrintF();
    }
    self->_prefDisableSelfIdentityRolling = v7;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v91) {
    int64_t v11 = 600;
  }
  else {
    int64_t v11 = Int64;
  }
  int64_t prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
  if (v11 != prefFamilyIdentityPruneSeconds)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_23;
        }
        int64_t prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
      }
      double v87 = *(double *)&prefFamilyIdentityPruneSeconds;
      v88 = (char *)v11;
      LogPrintF();
    }
LABEL_23:
    self->_int64_t prefFamilyIdentityPruneSeconds = v11;
  }
  uint64_t v13 = CFPrefs_GetInt64();
  if (v91) {
    int64_t v14 = 604800;
  }
  else {
    int64_t v14 = v13;
  }
  int64_t prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
  if (v14 != prefFriendAccountPruneSeconds)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_32;
        }
        int64_t prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
      }
      double v87 = *(double *)&prefFriendAccountPruneSeconds;
      v88 = (char *)v14;
      LogPrintF();
    }
LABEL_32:
    self->_int64_t prefFriendAccountPruneSeconds = v14;
  }
  int64_t v16 = CFPrefs_GetInt64();
  int64_t prefFriendRefreshMaxSeconds = self->_prefFriendRefreshMaxSeconds;
  if (v16 == prefFriendRefreshMaxSeconds) {
    goto LABEL_39;
  }
  if (dword_100142410 <= 30)
  {
    int64_t v18 = self->_prefFriendRefreshMaxSeconds;
    if (dword_100142410 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_38;
      }
      int64_t v18 = self->_prefFriendRefreshMaxSeconds;
    }
    double v87 = *(double *)&v18;
    v88 = (char *)v16;
    LogPrintF();
  }
LABEL_38:
  self->_int64_t prefFriendRefreshMaxSeconds = v16;
LABEL_39:
  int64_t v19 = CFPrefs_GetInt64();
  int64_t prefFriendRefreshMinSeconds = self->_prefFriendRefreshMinSeconds;
  if (v19 != prefFriendRefreshMinSeconds)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_46;
        }
        int64_t prefFriendRefreshMinSeconds = self->_prefFriendRefreshMinSeconds;
      }
      double v87 = *(double *)&prefFriendRefreshMinSeconds;
      v88 = (char *)v19;
      LogPrintF();
    }
LABEL_46:
    self->_int64_t prefFriendRefreshMinSeconds = v19;
    p_int64_t prefFriendRefreshSeconds = &self->_prefFriendRefreshSeconds;
    goto LABEL_47;
  }
  p_int64_t prefFriendRefreshSeconds = &self->_prefFriendRefreshSeconds;
  if (v16 == prefFriendRefreshMaxSeconds)
  {
    int64_t prefFriendRefreshSeconds = self->_prefFriendRefreshSeconds;
    goto LABEL_52;
  }
LABEL_47:
  if (v19 < 1)
  {
    int64_t prefFriendRefreshSeconds = 0;
  }
  else
  {
    int64_t prefFriendRefreshSeconds = 0;
    int64_t v23 = self->_prefFriendRefreshMaxSeconds;
    if (v23 >= 1 && v19 < v23) {
      int64_t prefFriendRefreshSeconds = arc4random()
    }
                               % (self->_prefFriendRefreshMaxSeconds - self->_prefFriendRefreshMinSeconds + 1)
                               + v19;
  }
LABEL_52:
  int64_t v24 = *p_prefFriendRefreshSeconds;
  if (prefFriendRefreshSeconds == *p_prefFriendRefreshSeconds) {
    goto LABEL_58;
  }
  if (dword_100142410 <= 30)
  {
    if (dword_100142410 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_57;
      }
      int64_t v24 = *p_prefFriendRefreshSeconds;
    }
    double v87 = *(double *)&v24;
    v88 = (char *)prefFriendRefreshSeconds;
    LogPrintF();
  }
LABEL_57:
  int64_t *p_prefFriendRefreshSeconds = prefFriendRefreshSeconds;
LABEL_58:
  uint64_t v25 = CFPrefs_GetInt64();
  int v26 = v91;
  if (!v91)
  {
    id v29 = "pref";
    goto LABEL_70;
  }
  int v26 = 1;
  if ((DeviceClass > 0xB || ((1 << DeviceClass) & 0x80E) == 0) && DeviceClass != 100)
  {
    uint64_t v25 = 0;
    id v29 = "disabled";
    goto LABEL_70;
  }
  id v27 = +[IDSServerBag sharedInstance];
  v28 = [v27 objectForKey:@"rapport-friend-keys-max-v2"];

  if (v28)
  {
    id v29 = "server-v2";
  }
  else
  {
    id v30 = +[IDSServerBag sharedInstance];
    v28 = [v30 objectForKey:@"rapport-friend-keys-max"];

    if (!v28)
    {
      id v29 = "default";
      goto LABEL_69;
    }
    id v29 = "server";
  }
  uint64_t v25 = CFGetInt64();

LABEL_69:
  int v26 = v91;
LABEL_70:
  BOOL v31 = v26 == 0;
  v32 = "clamped";
  int v33 = !v31;
  if (!v31) {
    v32 = v29;
  }
  if (v25 < -1) {
    int v33 = 1;
  }
  if (v25 > 1000) {
    int v33 = 1;
  }
  if (v33)
  {
    uint64_t v25 = 32;
    v34 = v32;
  }
  else
  {
    v34 = v29;
  }
  *(void *)&double v35 = self->_prefFriendSuggestMax;
  if (v25 != *(void *)&v35)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_87;
        }
        *(void *)&double v35 = self->_prefFriendSuggestMax;
      }
      v88 = (char *)v25;
      id v89 = v34;
      double v87 = v35;
      LogPrintF();
    }
LABEL_87:
    self->_prefFriendSuggestMax = v25;
  }
  uint64_t v36 = CFPrefs_GetInt64();
  if (v36 <= 0x7FFFFFFF && v36 >= -1 && v91 == 0) {
    uint64_t v39 = v36;
  }
  else {
    uint64_t v39 = 3600;
  }
  *(void *)&double v40 = self->_prefFriendSuggestPollSeconds;
  if (v39 != *(void *)&v40)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_102;
        }
        *(void *)&double v40 = self->_prefFriendSuggestPollSeconds;
      }
      double v87 = v40;
      v88 = (char *)v39;
      LogPrintF();
    }
LABEL_102:
    self->_prefFriendSuggestPollSeconds = v39;
  }
  int64_t v41 = CFPrefs_GetInt64();
  if (v91)
  {
    if (DeviceClass <= 0xB && ((1 << DeviceClass) & 0x80E) != 0 || DeviceClass == 100)
    {
      v42 = +[IDSServerBag sharedInstance];
      v43 = [v42 objectForKey:@"rapport-friend-keys-initial-delay"];

      if (v43)
      {
        int64_t v41 = CFGetInt64();
        id v44 = "server";
      }
      else
      {
        id v44 = "default";
      }
    }
    else
    {
      id v44 = "disabled";
      int64_t v41 = -1;
    }
  }
  else
  {
    id v44 = "pref";
  }
  int64_t prefFriendSyncDelaySeconds = self->_prefFriendSyncDelaySeconds;
  if (v41 != prefFriendSyncDelaySeconds)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_118;
        }
        int64_t prefFriendSyncDelaySeconds = self->_prefFriendSyncDelaySeconds;
      }
      v88 = (char *)v41;
      id v89 = v44;
      double v87 = *(double *)&prefFriendSyncDelaySeconds;
      LogPrintF();
    }
LABEL_118:
    self->_int64_t prefFriendSyncDelaySeconds = v41;
  }
  uint64_t v46 = CFPrefs_GetInt64();
  if (v91) {
    BOOL v47 = 0;
  }
  else {
    BOOL v47 = v46 == 0;
  }
  BOOL v48 = !v47;
  if (self->_prefPeopleDiscoveryFamily != v48)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      v49 = "yes";
      if (v48) {
        *(double *)&v50 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v50 = COERCE_DOUBLE("yes");
      }
      if (!v48) {
        v49 = "no";
      }
      double v87 = *(double *)&v50;
      v88 = (char *)v49;
      LogPrintF();
    }
    self->_prefPeopleDiscoveryFamily = v48;
  }
  uint64_t v51 = CFPrefs_GetInt64();
  if (v91) {
    BOOL v52 = 0;
  }
  else {
    BOOL v52 = v51 == 0;
  }
  BOOL v53 = !v52;
  if (self->_prefPeopleDiscoveryFriends != v53)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      v54 = "yes";
      if (v53) {
        *(double *)&v55 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v55 = COERCE_DOUBLE("yes");
      }
      if (!v53) {
        v54 = "no";
      }
      double v87 = *(double *)&v55;
      v88 = (char *)v54;
      LogPrintF();
    }
    self->_prefPeopleDiscoveryFriends = v53;
  }
  CFPrefs_GetDouble();
  if (v91) {
    double v57 = 300.0;
  }
  else {
    double v57 = v56;
  }
  double prefPrivacyCoalesceMinSecs = self->_prefPrivacyCoalesceMinSecs;
  if (v57 != prefPrivacyCoalesceMinSecs)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_161;
        }
        double prefPrivacyCoalesceMinSecs = self->_prefPrivacyCoalesceMinSecs;
      }
      double v87 = prefPrivacyCoalesceMinSecs;
      v88 = *(char **)&v57;
      LogPrintF();
    }
LABEL_161:
    self->_double prefPrivacyCoalesceMinSecs = v57;
  }
  CFPrefs_GetDouble();
  if (v91) {
    double v60 = 900.0;
  }
  else {
    double v60 = v59;
  }
  double prefPrivacyCoalesceMaxSecs = self->_prefPrivacyCoalesceMaxSecs;
  if (v60 != prefPrivacyCoalesceMaxSecs)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_170;
        }
        double prefPrivacyCoalesceMaxSecs = self->_prefPrivacyCoalesceMaxSecs;
      }
      double v87 = prefPrivacyCoalesceMaxSecs;
      v88 = *(char **)&v60;
      LogPrintF();
    }
LABEL_170:
    self->_double prefPrivacyCoalesceMaxSecs = v60;
  }
  CFPrefs_GetDouble();
  double v63 = v62;
  if (v91 && GestaltGetBoolean()) {
    double v63 = 2.0;
  }
  double prefPTSBurstScanActionSecs = self->_prefPTSBurstScanActionSecs;
  if (v63 != prefPTSBurstScanActionSecs)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_179;
        }
        double prefPTSBurstScanActionSecs = self->_prefPTSBurstScanActionSecs;
      }
      double v87 = prefPTSBurstScanActionSecs;
      v88 = *(char **)&v63;
      LogPrintF();
    }
LABEL_179:
    self->_double prefPTSBurstScanActionSecs = v63;
  }
  CFPrefs_GetDouble();
  if (v91) {
    double v66 = 2.0;
  }
  else {
    double v66 = v65;
  }
  double prefPTSBurstScanInfoSecs = self->_prefPTSBurstScanInfoSecs;
  if (v66 != prefPTSBurstScanInfoSecs)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_188;
        }
        double prefPTSBurstScanInfoSecs = self->_prefPTSBurstScanInfoSecs;
      }
      double v87 = prefPTSBurstScanInfoSecs;
      v88 = *(char **)&v66;
      LogPrintF();
    }
LABEL_188:
    self->_double prefPTSBurstScanInfoSecs = v66;
  }
  uint64_t v68 = CFPrefs_GetInt64();
  BOOL v69 = v68 != 0;
  if (v91)
  {
    uint64_t v70 = v68;
    if (GestaltGetBoolean()) {
      BOOL v71 = 0;
    }
    else {
      BOOL v71 = v70 == 0;
    }
    BOOL v69 = !v71;
  }
  if (self->_prefRanging != v69)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v72 = "yes";
      if (v69) {
        *(double *)&v73 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v73 = COERCE_DOUBLE("yes");
      }
      if (!v69) {
        id v72 = "no";
      }
      double v87 = *(double *)&v73;
      v88 = (char *)v72;
      LogPrintF();
    }
    self->_prefRanging = v69;
  }
  uint64_t v74 = CFPrefs_GetInt64();
  BOOL v75 = v74 != 0;
  if (self->_prefPeopleStrangers != v75)
  {
    if (dword_100142410 <= 30)
    {
      uint64_t v76 = v74;
      if (dword_100142410 != -1 || _LogCategory_Initialize())
      {
        id v77 = "yes";
        if (v76) {
          *(double *)&id v78 = COERCE_DOUBLE("no");
        }
        else {
          *(double *)&id v78 = COERCE_DOUBLE("yes");
        }
        if (!v76) {
          id v77 = "no";
        }
        double v87 = *(double *)&v78;
        v88 = (char *)v77;
        LogPrintF();
      }
    }
    self->_prefPeopleStrangers = v75;
  }
  if (CFPrefs_GetInt64()) {
    int v79 = 6;
  }
  else {
    int v79 = 5;
  }
  if (v91) {
    int v80 = 0;
  }
  else {
    int v80 = v79;
  }
  int prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
  if (v80 != prefTrackWhileAsleepState)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 != -1)
      {
LABEL_227:
        if (prefTrackWhileAsleepState >= 8)
        {
          if (prefTrackWhileAsleepState <= 9) {
            *(double *)&int v82 = COERCE_DOUBLE("?");
          }
          else {
            *(double *)&int v82 = COERCE_DOUBLE("User");
          }
        }
        else
        {
          int v82 = (&off_1001248A8)[prefTrackWhileAsleepState];
        }
        double v87 = *(double *)&v82;
        v88 = (&off_1001248E8)[v80];
        LogPrintF();
        goto LABEL_235;
      }
      if (_LogCategory_Initialize())
      {
        int prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
        goto LABEL_227;
      }
    }
LABEL_235:
    self->_int prefTrackWhileAsleepState = v80;
  }
  BOOL v83 = CFPrefs_GetInt64() != 0;
  *(void *)&double v84 = v91;
  if (!v91) {
    goto LABEL_242;
  }
  if (dword_100142410 <= 30)
  {
    if (dword_100142410 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_241;
      }
      *(void *)&double v84 = v91;
    }
    double v87 = v84;
    LogPrintF();
  }
LABEL_241:
  BOOL v83 = 0;
LABEL_242:
  if (self->_prefOneTimeDateRequestedResetCompleted != v83)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      v85 = "yes";
      if (v83) {
        *(double *)&v86 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v86 = COERCE_DOUBLE("yes");
      }
      if (!v83) {
        v85 = "no";
      }
      double v87 = *(double *)&v86;
      v88 = (char *)v85;
      LogPrintF();
    }
    self->_prefOneTimeDateRequestedResetCompleted = v83;
  }
  [(RPPeopleDaemon *)self _update];
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)_update
{
  if ([(NSMutableSet *)self->_discoveryClients count]) {
    [(RPPeopleDaemon *)self _discoveryEnsureStarted];
  }
  else {
    [(RPPeopleDaemon *)self _discoveryEnsureStopped];
  }
  if (self->_prefPeopleDiscoveryFamily
    && ([(RPPeopleDaemon *)self _primaryAppleID:0],
        int v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    [(RPPeopleDaemon *)self _familyEnsureStarted];
  }
  else
  {
    [(RPPeopleDaemon *)self _familyEnsureStopped];
  }
  if (self->_prefPeopleDiscoveryFriends) {
    [(RPPeopleDaemon *)self _friendsEnsureStarted];
  }
  else {
    [(RPPeopleDaemon *)self _friendsEnsureStopped];
  }
  if ([(CUSystemMonitor *)self->_systemMonitor screenOn])
  {
    if (self->_ptsActive) {
      [(RPPeopleDaemon *)self _rangingInitiatorEnsureStarted];
    }
    else {
      [(RPPeopleDaemon *)self _rangingInitiatorEnsureStopped];
    }
    if (self->_prefRanging)
    {
      [(RPPeopleDaemon *)self _rangingBLEActionScannerEnsureStarted];
      return;
    }
  }
  else
  {
    [(RPPeopleDaemon *)self _rangingInitiatorEnsureStopped];
  }

  [(RPPeopleDaemon *)self _rangingBLEActionScannerEnsureStopped];
}

- (id)_primaryAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  p_primaryAppleIDCached = &self->_primaryAppleIDCached;
  id v6 = self->_primaryAppleIDCached;
  BOOL v7 = v6;
  if (v3 || !v6)
  {
    uint64_t v9 = [(CUSystemMonitor *)self->_systemMonitor primaryAppleID];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      CUNormalizeEmailAddress();
      id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    objc_storeStrong((id *)p_primaryAppleIDCached, v8);
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v3) {
      [(RPPeopleDaemon *)self _update];
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)_regenerateSelfIdentity:(id)a3
{
  id v6 = a3;
  *(int32x2_t *)&self->_irkMetrics.selfIdentRolled = vadd_s32(*(int32x2_t *)&self->_irkMetrics.selfIdentRolled, (int32x2_t)0x100000001);
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v4 regenerateSelfIdentity:v6];

  [(NSMutableDictionary *)self->_familyAccountIdentityMap enumerateKeysAndObjectsUsingBlock:&stru_100124550];
  [(NSMutableDictionary *)self->_friendAccountIdentityMap enumerateKeysAndObjectsUsingBlock:&stru_100124570];
  [(RPPeopleDaemon *)self _update];
}

- (void)_discoveryEnsureStarted
{
  deviceDiscovery = self->_deviceDiscovery;
  p_inst_props = &OBJC_PROTOCOL___NFConnectionHandoverReceiverDelegate.inst_props;
  if (!deviceDiscovery)
  {
    uint64_t deviceDiscoveryID = self->_deviceDiscoveryID;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v58 = deviceDiscoveryID;
      LogPrintF();
    }
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = v6;

    id v8 = (SFDeviceDiscovery *)objc_alloc_init(off_100142488());
    uint64_t v9 = self->_deviceDiscovery;
    self->_deviceDiscovery = v8;

    [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:11];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setPurpose:@"RPPeople"];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:20];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_100092270;
    v89[3] = &unk_100121890;
    v89[4] = self;
    int v90 = deviceDiscoveryID;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v89];
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_100092294;
    v87[3] = &unk_100121890;
    v87[4] = self;
    int v88 = deviceDiscoveryID;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v87];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1000922B8;
    v85[3] = &unk_1001218B8;
    v85[4] = self;
    int v86 = deviceDiscoveryID;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v85];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000922E0;
    v83[3] = &unk_1001218E0;
    v83[4] = self;
    int v84 = deviceDiscoveryID;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setInterruptionHandler:v83];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_100092378;
    v81[3] = &unk_100124590;
    int v82 = deviceDiscoveryID;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setInvalidationHandler:v81];
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v10 = self->_discoveryClients;
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v11)
  {
    id v12 = v11;
    unsigned int v13 = 0;
    uint64_t v14 = *(void *)v78;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v78 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 |= [*(id *)(*((void *)&v77 + 1) + 8 * i) discoveryFlags:v58];
      }
      id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v12);

    self->_discoveryFlagsAggregate = v13;
    if ((v13 & 0x5FE) == 2)
    {
      uint64_t v16 = 1048577;
      goto LABEL_23;
    }
  }
  else
  {

    LOWORD(v13) = 0;
    self->_discoveryFlagsAggregate = 0;
  }
  if ((v13 & 0x5F8) != 0 || (v13 & 6) == 0) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 33;
  }
LABEL_23:
  id v18 = [(SFDeviceDiscovery *)self->_deviceDiscovery discoveryFlags];
  if ((id)v16 != v18)
  {
    if (deviceDiscovery
      && dword_100142410 <= 30
      && ((id v19 = v18, dword_100142410 != -1) || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", v16, v19, &unk_10011AD88, v16, &unk_10011AD88);
    }
    else
    {
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", v16, v59, v62, v65, v66);
    }
  }
  int prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
  BOOL v21 = prefTrackWhileAsleepState == 6;
  if (!prefTrackWhileAsleepState)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v22 = self->_discoveryClients;
    id v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v73 objects:v92 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v74;
      while (2)
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v74 != v25) {
            objc_enumerationMutation(v22);
          }
          if ([*(id *)(*((void *)&v73 + 1) + 8 * (void)j) discoveryFlags])
          {
            BOOL v21 = 1;
            goto LABEL_41;
          }
        }
        id v24 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v73 objects:v92 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
LABEL_41:
  }
  if (v21 != [(SFDeviceDiscovery *)self->_deviceDiscovery trackPeers])
  {
    if (deviceDiscovery && dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v27 = "yes";
      if (v21) {
        v28 = "no";
      }
      else {
        v28 = "yes";
      }
      if (!v21) {
        id v27 = "no";
      }
      double v60 = v28;
      double v63 = v27;
      LogPrintF();
      -[SFDeviceDiscovery setTrackPeers:](self->_deviceDiscovery, "setTrackPeers:", v21, v60, v63);
    }
    else
    {
      -[SFDeviceDiscovery setTrackPeers:](self->_deviceDiscovery, "setTrackPeers:", v21, v59, v62);
    }
  }
  uint64_t v29 = v21 | ((unsigned __int16)(v13 & 0x200) >> 9);
  if (v29 != [(SFDeviceDiscovery *)self->_deviceDiscovery overrideScreenOff])
  {
    if (deviceDiscovery && dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v30 = "yes";
      if (v29) {
        BOOL v31 = "no";
      }
      else {
        BOOL v31 = "yes";
      }
      if (!v29) {
        id v30 = "no";
      }
      v61 = v31;
      int v64 = v30;
      LogPrintF();
      -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", v29, v61, v64);
    }
    else
    {
      -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", v29, v59, v62);
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v32 = self->_discoveryClients;
  id v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v69 objects:v91 count:16];
  if (!v33)
  {

    char v36 = 0;
LABEL_81:
    uint64_t v35 = 20;
    goto LABEL_82;
  }
  id v34 = v33;
  id v67 = deviceDiscovery;
  uint64_t v35 = 0;
  char v36 = 0;
  uint64_t v37 = *(void *)v70;
  do
  {
    for (k = 0; k != v34; k = (char *)k + 1)
    {
      if (*(void *)v70 != v37) {
        objc_enumerationMutation(v32);
      }
      uint64_t v39 = *(void **)(*((void *)&v69 + 1) + 8 * (void)k);
      uint64_t v40 = [v39 scanRate];
      unsigned int v41 = [v39 discoveryMode];
      if (v35 <= v40) {
        uint64_t v42 = v40;
      }
      else {
        uint64_t v42 = v35;
      }
      if (v41 != 1) {
        uint64_t v35 = v42;
      }
      v36 |= v41 == 1;
    }
    id v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v69 objects:v91 count:16];
  }
  while (v34);

  deviceDiscovery = v67;
  p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___NFConnectionHandoverReceiverDelegate + 56);
  if (!v35) {
    goto LABEL_81;
  }
LABEL_82:
  if (self->_ptsActive == (v36 & 1))
  {
    if ((v36 & 1) == 0) {
      goto LABEL_113;
    }
    goto LABEL_105;
  }
  if (deviceDiscovery)
  {
    int v43 = *((_DWORD *)p_inst_props + 260);
    if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize()))
    {
      id v44 = "yes";
      if (v36) {
        v45 = "no";
      }
      else {
        v45 = "yes";
      }
      if ((v36 & 1) == 0) {
        id v44 = "no";
      }
      double v59 = v45;
      double v62 = v44;
      LogPrintF();
    }
  }
  self->_ptsActive = v36 & 1;
  unsigned int v46 = [(SFDeviceDiscovery *)self->_deviceDiscovery changeFlags];
  if (v36) {
    int v47 = 4;
  }
  else {
    int v47 = 0;
  }
  if ((v46 & 0xFFFFFFFB | v47) != v46) {
    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:");
  }
  if (v36)
  {
    if (self->_prefPTSBurstScanInfoSecs > 0.0)
    {
      ptsBurstScanTimer = self->_ptsBurstScanTimer;
      if (ptsBurstScanTimer)
      {
        v49 = ptsBurstScanTimer;
        dispatch_source_cancel(v49);
        v50 = self->_ptsBurstScanTimer;
        self->_ptsBurstScanTimer = 0;
      }
      uint64_t v51 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      BOOL v52 = self->_ptsBurstScanTimer;
      self->_ptsBurstScanTimer = v51;
      BOOL v53 = v51;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000923F8;
      handler[3] = &unk_100121158;
      handler[4] = self;
      dispatch_source_set_event_handler(v53, handler);
      CUDispatchTimerSet();
      dispatch_activate(v53);
    }
LABEL_105:
    if (self->_ptsBurstScanTimer)
    {
      if (v35 <= 50) {
        uint64_t v35 = 50;
      }
    }
    else
    {
      int Boolean = GestaltGetBoolean();
      uint64_t v55 = 30;
      if (v35 > 30) {
        uint64_t v55 = v35;
      }
      if (Boolean) {
        uint64_t v35 = v55;
      }
    }
  }
LABEL_113:
  int v56 = *((_DWORD *)p_inst_props + 260);
  if (v56 <= 30 && (v56 != -1 || _LogCategory_Initialize()))
  {
    if (v35 <= 19)
    {
      double v57 = "Background";
      switch(v35)
      {
        case 1:
          double v57 = "BackgroundOld";
          break;
        case 2:
          double v57 = "NormalOld";
          break;
        case 3:
          double v57 = "HighOld";
          break;
        case 4:
          double v57 = "AggressiveOld";
          break;
        case 10:
          goto LABEL_133;
        default:
          goto LABEL_132;
      }
      goto LABEL_133;
    }
    if (v35 > 39)
    {
      if (v35 == 40)
      {
        double v57 = "High";
        goto LABEL_133;
      }
      if (v35 == 50)
      {
        double v57 = "Aggressive";
        goto LABEL_133;
      }
    }
    else
    {
      if (v35 == 20)
      {
        double v57 = "Normal";
        goto LABEL_133;
      }
      if (v35 == 30)
      {
        double v57 = "HighNormal";
LABEL_133:
        double v59 = v57;
        LogPrintF();
        goto LABEL_134;
      }
    }
LABEL_132:
    double v57 = "?";
    goto LABEL_133;
  }
LABEL_134:
  if ((id)v35 != [(SFDeviceDiscovery *)self->_deviceDiscovery scanRate]) {
    [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:v35];
  }
  if (!deviceDiscovery) {
    [(SFDeviceDiscovery *)self->_deviceDiscovery activateWithCompletion:&stru_1001245B0];
  }
}

- (void)_discoveryEnsureStopped
{
  if (self->_deviceDiscovery)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t deviceDiscoveryID = self->_deviceDiscoveryID;
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    ++self->_deviceDiscoveryID;
    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0;

    self->_discoveryFlagsAggregate = 0;
    if (self->_ptsActive)
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_ptsActive = 0;
    }
    [(NSMutableSet *)self->_rangingCapableDevices removeAllObjects];
    ptsBurstScanTimer = self->_ptsBurstScanTimer;
    if (ptsBurstScanTimer)
    {
      id v8 = ptsBurstScanTimer;
      dispatch_source_cancel(v8);
      id v6 = self->_ptsBurstScanTimer;
      self->_ptsBurstScanTimer = 0;
    }
  }
}

- (void)_daemonDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)RPDevice);
    [v7 setIdentifier:v6];
    [v7 updateWithSFDevice:v4 changes:0xFFFFFFFFLL];
    [(NSMutableDictionary *)self->_discoveredDevices setObject:v7 forKeyedSubscript:v6];
    if (dword_100142410 <= 20 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v7;
      LogPrintF();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = self->_xpcConnections;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) clientDeviceFound:v7 report:1 v13];
        }
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [(RPPeopleDaemon *)self _rangingUpdateForDevice:v7];
  }
}

- (void)_daemonDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v5];
    if (v6)
    {
      [(NSMutableDictionary *)self->_discoveredDevices setObject:0 forKeyedSubscript:v5];
      if (dword_100142410 <= 20 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v12 = v6;
        LogPrintF();
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = self->_xpcConnections;
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) clientDeviceLost:v6, v12];
          }
          id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      [(RPPeopleDaemon *)self _rangingRemoveDevice:v6];
    }
  }
}

- (void)_daemonDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [v6 identifier];
  id v8 = [v7 UUIDString];

  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v8];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = [v9 updateWithSFDevice:v6 changes:v4];
      if (((unsigned __int16)v11 & 0x25B) != 0) {
        int v12 = 30;
      }
      else {
        int v12 = 20;
      }
      if (v12 >= dword_100142410 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v19 = v11;
        double v20 = &unk_10011AEA4;
        id v18 = v10;
        LogPrintF();
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v13 = self->_xpcConnections;
      id v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * i) clientDeviceChanged:v10 changes:v11, v18, v19, v20];
          }
          id v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v15);
      }

      [(RPPeopleDaemon *)self _rangingUpdateForDevice:v10];
    }
    else
    {
      [(RPPeopleDaemon *)self _daemonDeviceFound:v6];
    }
  }
}

- (void)_daemonDevice:(id)a3 updatedMeasurement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v8];
    if (v9)
    {
      [v6 setRelativeLocation:v7];
      if (dword_100142410 <= 20 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v15 = v6;
        LogPrintF();
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v10 = self->_xpcConnections;
      id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * i) clientDevice:v9 updatedMeasurement:v7];
          }
          id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)_familyEnsureStarted
{
  if (!self->_familyMemberMonitor)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    familyMemberMonitor = self->_familyMemberMonitor;
    self->_familyMemberMonitor = v3;

    [(CUSystemMonitor *)self->_familyMemberMonitor setDispatchQueue:self->_dispatchQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100093050;
    v13[3] = &unk_100121158;
    v13[4] = self;
    [(CUSystemMonitor *)self->_familyMemberMonitor setFamilyUpdatedHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000930A4;
    v12[3] = &unk_100121158;
    v12[4] = self;
    [(CUSystemMonitor *)self->_familyMemberMonitor setFirstUnlockHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000930AC;
    v11[3] = &unk_100121158;
    v11[4] = self;
    [(CUSystemMonitor *)self->_familyMemberMonitor setSystemNameChangedHandler:v11];
    id v5 = self->_familyMemberMonitor;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000930B4;
    v10[3] = &unk_100121158;
    v10[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v10];
  }
  if (!self->_familySyncCheckTimer)
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    familySyncCheckTimer = self->_familySyncCheckTimer;
    self->_familySyncCheckTimer = v6;

    id v8 = self->_familySyncCheckTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000930BC;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_familySyncCheckTimer);
  }
  [(RPPeopleDaemon *)self _updateFamilyIdentities];
}

- (void)_familyEnsureStopped
{
  bufferedCloudMessages = self->_bufferedCloudMessages;
  self->_bufferedCloudMessages = 0;

  if (self->_familyMemberMonitor)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_familyMemberMonitor invalidate];
    familyMemberMonitor = self->_familyMemberMonitor;
    self->_familyMemberMonitor = 0;
  }
  int familyNotifyToken = self->_familyNotifyToken;
  if (familyNotifyToken != -1)
  {
    notify_cancel(familyNotifyToken);
    self->_int familyNotifyToken = -1;
  }
  [(NSMutableDictionary *)self->_familyAccountIdentityMap removeAllObjects];
  familyAccountIdentityMap = self->_familyAccountIdentityMap;
  self->_familyAccountIdentityMap = 0;

  [(NSMutableDictionary *)self->_familyDeviceIdentityMap removeAllObjects];
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  self->_familyDeviceIdentityMap = 0;

  self->_familyFlags = 0;
  familySyncCheckTimer = self->_familySyncCheckTimer;
  if (familySyncCheckTimer)
  {
    uint64_t v10 = familySyncCheckTimer;
    dispatch_source_cancel(v10);
    id v9 = self->_familySyncCheckTimer;
    self->_familySyncCheckTimer = 0;
  }
}

- (id)getFamilyDeviceIdentities
{
  return [(NSMutableDictionary *)self->_familyDeviceIdentityMap allValues];
}

- (id)getFamilyURIs
{
  v2 = [(CUSystemMonitor *)self->_familyMemberMonitor familyMembers];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isMe", (void)v13) & 1) == 0)
        {
          uint64_t v10 = [v9 appleID];

          if (v10)
          {
            id v11 = [v9 appleID];
            [v3 addObject:v11];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_updateFamilyIdentities
{
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    unsigned int v3 = [(RPPeopleDaemon *)self _updateFamilyAccounts];
    unsigned int v4 = [(RPPeopleDaemon *)self _updateFamilyDevices] + v3;
    int v5 = [(RPPeopleDaemon *)self _pruneFamilyDevices] << 31 >> 31;
    [(RPPeopleDaemon *)self _processBufferedCloudMessages];
    [(RPPeopleDaemon *)self _updateFamilySyncing];
    if (v4 != v5)
    {
      id v6 = +[RPDaemon sharedDaemon];
      [v6 postDaemonInfoChanges:2];
    }
    [(RPPeopleDaemon *)self _updateFamilyNotification];
  }
  else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_updateFamilyAccounts
{
  int v26 = [(CUSystemMonitor *)self->_familyMemberMonitor familyMembers];
  if (v26
    || ([(NSMutableDictionary *)self->_familyAccountIdentityMap allKeys],
        unsigned int v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        v4))
  {
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    if (!familyAccountIdentityMap)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v7 = self->_familyAccountIdentityMap;
      self->_familyAccountIdentityMap = v6;

      id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
      id v36 = 0;
      id v9 = [v8 identitiesOfType:3 error:&v36];
      id v25 = v36;

      if (!v9 && dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v24 = v25;
        LogPrintF();
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v33;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v11);
            }
            long long v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            long long v16 = [v15 identifier:v24];
            if (v16)
            {
              [(NSMutableDictionary *)self->_familyAccountIdentityMap setObject:v15 forKeyedSubscript:v16];
              if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
              {
                id v24 = v15;
                LogPrintF();
              }
              *((unsigned char *)v38 + 24) = 1;
            }
          }
          id v12 = [v11 countByEnumeratingWithState:&v32 objects:v42 count:16];
        }
        while (v12);
      }

      familyAccountIdentityMap = self->_familyAccountIdentityMap;
    }
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001245D0, v24);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v26;
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v29;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          if (([v21 isMe] & 1) == 0
            && [(RPPeopleDaemon *)self _updateFamilyIdentityWithFamilyMember:v21])
          {
            *((unsigned char *)v38 + 24) = 1;
          }
        }
        id v18 = [v17 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v18);
    }

    long long v22 = self->_familyAccountIdentityMap;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100093944;
    v27[3] = &unk_1001245F8;
    v27[4] = &v37;
    [(NSMutableDictionary *)v22 enumerateKeysAndObjectsUsingBlock:v27];
    BOOL v10 = *((unsigned char *)v38 + 24) != 0;
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_updateFamilyIdentityWithFamilyMember:(id)a3
{
  id v4 = a3;
  int v5 = [v4 appleID];
  if (v5)
  {
    id v6 = CUNormalizeEmailAddress();
    uint64_t v7 = [(NSMutableDictionary *)self->_familyAccountIdentityMap objectForKeyedSubscript:v6];
    LODWORD(v8) = v7 == 0;
    id v9 = (id)v7;
    if (!v7) {
      id v9 = objc_alloc_init((Class)RPIdentity);
    }
    [v9 setPresent:1];
    BOOL v10 = [v9 dateAdded];

    if (!v10)
    {
      id v8 = +[NSDate date];
      [v9 setDateAdded:v8];

      LODWORD(v8) = 1;
    }
    id v11 = [v9 dateRemoved];

    if (v11)
    {
      [v9 setDateRemoved:0];
      LODWORD(v8) = 1;
    }
    id v12 = [v9 identifier];
    unsigned __int8 v13 = [v12 isEqual:v6];

    if ((v13 & 1) == 0)
    {
      [v9 setIdentifier:v6];
      LODWORD(v8) = 1;
    }
    if ([v9 type] == 3)
    {
      if (v7)
      {
        if (!v8)
        {
          if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          LOBYTE(v8) = 0;
LABEL_37:

          goto LABEL_38;
        }
LABEL_20:
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          id v19 = v9;
          LogPrintF();
        }
        id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
        [v8 saveIdentity:v9 error:0];

        LOBYTE(v8) = 1;
        goto LABEL_37;
      }
    }
    else
    {
      [v9 setType:3];
      if (v7) {
        goto LABEL_20;
      }
      LOBYTE(v8) = 1;
    }
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    if (!familyAccountIdentityMap)
    {
      long long v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v16 = self->_familyAccountIdentityMap;
      self->_familyAccountIdentityMap = v15;

      familyAccountIdentityMap = self->_familyAccountIdentityMap;
    }
    [(NSMutableDictionary *)familyAccountIdentityMap setObject:v9 forKeyedSubscript:v6];
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v9;
      LogPrintF();
    }
    id v17 = +[RPIdentityDaemon sharedIdentityDaemon];
    [v17 saveIdentity:v9 error:0];

    goto LABEL_37;
  }
  if (dword_100142410 <= 50 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  LOBYTE(v8) = 0;
LABEL_38:

  return (char)v8;
}

- (BOOL)_updateFamilyDevices
{
  if (self->_familyDeviceIdentityMap) {
    return 0;
  }
  id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  self->_familyDeviceIdentityMap = v4;

  id v6 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v23 = 0;
  uint64_t v7 = [v6 loadFamilyDeviceIdentitiesWithError:&v23];
  id v8 = v23;

  if (!v7 && dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v8;
    LogPrintF();
  }
  id v18 = v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    BOOL v2 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [v14 identifier:v17 v18:v19];
        if (v15)
        {
          [(NSMutableDictionary *)self->_familyDeviceIdentityMap setObject:v14 forKeyedSubscript:v15];
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            id v17 = v14;
            LogPrintF();
          }
          BOOL v2 = 1;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)_pruneFamilyDevices
{
  int64_t prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
  if (prefFamilyIdentityPruneSeconds > 0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(NSMutableDictionary *)self->_familyAccountIdentityMap allKeys];
    id v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v5)
    {
      BOOL v22 = 0;
      goto LABEL_32;
    }
    id v6 = v5;
    BOOL v22 = 0;
    uint64_t v7 = *(void *)v27;
    long long v21 = v25;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_familyAccountIdentityMap, "objectForKeyedSubscript:", v9, v19, v20, v21);
        id v11 = [v10 dateRemoved];
        uint64_t v12 = v11;
        if (v11)
        {
          [v11 timeIntervalSinceReferenceDate];
          uint64_t v14 = (uint64_t)(Current - v13);
          if (prefFamilyIdentityPruneSeconds <= v14)
          {
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              long long v19 = (void *)v14;
              long long v20 = v10;
              LogPrintF();
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_familyAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v9, v19);
            long long v15 = +[RPIdentityDaemon sharedIdentityDaemon];
            [v15 removeIdentity:v10 error:0];

            familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v25[0] = sub_10009437C;
            v25[1] = &unk_100124620;
            v25[2] = v9;
            v25[3] = v10;
            v25[4] = self;
            [(NSMutableDictionary *)familyDeviceIdentityMap enumerateKeysAndObjectsUsingBlock:v24];
            BOOL v22 = 1;
          }
          else if (dword_100142410 <= 9 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            long long v19 = (void *)v14;
            long long v20 = v10;
LABEL_15:
            LogPrintF();
          }
        }
        else if (dword_100142410 <= 8 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          long long v19 = v10;
          goto LABEL_15;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v6)
      {
LABEL_32:

        return v22;
      }
    }
  }
  if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (void)_updateFamilySyncing
{
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 10;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  int v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  int v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  unsigned int v3 = [(CUSystemMonitor *)self->_familyMemberMonitor systemName];
  if (v3)
  {
    CFStringGetTypeID();
    id v4 = (void *)CFPrefs_CopyTypedValue();
    id v5 = v4;
    BOOL v6 = v4 != 0;
    if (v4 && ([v4 isEqual:v3] & 1) != 0) {
      BOOL v6 = 0;
    }
    else {
      CFPrefs_SetValue();
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  familyAccountIdentityMap = self->_familyAccountIdentityMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000947CC;
  v11[3] = &unk_100124648;
  v11[6] = v23;
  v11[7] = v21;
  BOOL v12 = v6;
  v11[8] = v19;
  v11[9] = v17;
  v11[4] = v3;
  void v11[5] = self;
  v11[10] = &v25;
  v11[11] = v13;
  v11[12] = v15;
  [(NSMutableDictionary *)familyAccountIdentityMap enumerateKeysAndObjectsUsingBlock:v11];
  int maxNumFamilyDevices = self->_irkMetrics.maxNumFamilyDevices;
  signed int v9 = [(NSMutableDictionary *)self->_familyDeviceIdentityMap count];
  if (maxNumFamilyDevices <= v9) {
    int v10 = v9;
  }
  else {
    int v10 = maxNumFamilyDevices;
  }
  self->_irkMetrics.int maxNumFamilyDevices = v10;
  self->_sendIRKMetricsReport = 1;
  if (dword_100142410 <= *((_DWORD *)v26 + 6)
    && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)self->_familyAccountIdentityMap count];
    LogPrintF();
  }

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

- (void)receivedFamilyIdentityRequest:(id)a3 msgCtx:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = [v6 appleID];
  id v8 = [v6 fromID];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    signed int v9 = self->_familyAccountIdentityMap;
    int v10 = v9;
    if (v9)
    {
      id v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v7];

      if (v11)
      {
        CFStringGetTypeID();
        BOOL v12 = CFDictionaryGetTypedValue();
        if (v12)
        {
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            double v13 = v7;
            int v14 = v12;
            LogPrintF();
          }
          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 4, v12, v7, 0, v15, v13, v14);
          [(RPPeopleDaemon *)self _sendCloudIdentityFrameType:33 destinationID:v8 flags:0 msgCtx:v6];
        }
        else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        double v13 = v7;
        LogPrintF();
      }
      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v15, 32, v6, v13);
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      double v13 = v7;
      LogPrintF();
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v15, 32, v6, v13);
  }
}

- (void)receivedFamilyIdentityResponse:(id)a3 msgCtx:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = [v6 appleID];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    id v8 = self->_familyAccountIdentityMap;
    signed int v9 = v8;
    if (v8)
    {
      int v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v7];
      if (v10)
      {
        CFStringGetTypeID();
        id v11 = CFDictionaryGetTypedValue();
        if (v11)
        {
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            int v14 = v7;
            id v15 = v11;
            LogPrintF();
          }
          BOOL v12 = +[NSDate date];
          [v10 setDateAcknowledged:v12];

          double v13 = +[RPIdentityDaemon sharedIdentityDaemon];
          [v13 saveIdentity:v10 error:0];

          [(RPPeopleDaemon *)self _updateIdentityType:4 idsDeviceID:v11 appleID:v7 contactID:0 msg:v16];
        }
        else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        int v14 = v7;
        LogPrintF();
      }
      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v16, 33, v6, v14);
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      int v14 = v7;
      LogPrintF();
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v16, 33, v6, v14);
  }
}

- (void)receivedFamilyIdentityUpdate:(id)a3 msgCtx:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = [v6 appleID];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    id v8 = self->_familyAccountIdentityMap;
    signed int v9 = v8;
    if (v8)
    {
      int v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v7];

      if (v10)
      {
        CFStringGetTypeID();
        id v11 = CFDictionaryGetTypedValue();
        if (v11)
        {
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 4, v11, v7, 0, v14, v7, v11);
          }
          else
          {
            -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 4, v11, v7, 0, v14, v12, v13);
          }
        }
        else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        BOOL v12 = v7;
        LogPrintF();
      }
      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v14, 34, v6, v12);
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      BOOL v12 = v7;
      LogPrintF();
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v14, 34, v6, v12);
  }
}

- (void)_updateFamilyNotification
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 1;
  if ([(NSMutableDictionary *)self->_familyDeviceIdentityMap count]) {
    v11[3] |= 2uLL;
  }
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009562C;
  v9[3] = &unk_1001245F8;
  v9[4] = &v10;
  [(NSMutableDictionary *)familyDeviceIdentityMap enumerateKeysAndObjectsUsingBlock:v9];
  id v4 = v11;
  if (v11[3] != self->_familyFlags)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v11, v5))
      {
        LogPrintF();
        id v4 = v11;
      }
    }
    int familyNotifyToken = self->_familyNotifyToken;
    p_int familyNotifyToken = &self->_familyNotifyToken;
    int v6 = familyNotifyToken;
    *((void *)p_familyNotifyToken - 1) = v4[3];
    if (familyNotifyToken == -1)
    {
      notify_register_check("com.apple.rapport.familyFlagsChanged", p_familyNotifyToken);
      int v6 = *p_familyNotifyToken;
      id v4 = v11;
    }
    notify_set_state(v6, v4[3]);
    notify_post("com.apple.rapport.familyFlagsChanged");
  }
  _Block_object_dispose(&v10, 8);
}

- (void)_friendsEnsureStarted
{
  [(RPPeopleDaemon *)self _friendsUpdateSuggestedIfNeeded];
  [(RPPeopleDaemon *)self _updateFriendIdentities];
  if (!self->_privacyChangedCoalescer
    && self->_prefPrivacyCoalesceMinSecs > 0.0
    && self->_prefPrivacyCoalesceMaxSecs > 0.0)
  {
    unsigned int v3 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    privacyChangedCoalescer = self->_privacyChangedCoalescer;
    self->_privacyChangedCoalescer = v3;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100095800;
    v7[3] = &unk_100121158;
    v7[4] = self;
    [(CUCoalescer *)self->_privacyChangedCoalescer setActionHandler:v7];
    [(CUCoalescer *)self->_privacyChangedCoalescer setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)self->_privacyChangedCoalescer setMinDelay:self->_prefPrivacyCoalesceMinSecs];
    [(CUCoalescer *)self->_privacyChangedCoalescer setMaxDelay:self->_prefPrivacyCoalesceMaxSecs];
  }
  if (self->_privacyChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100095808;
    v6[3] = &unk_100121630;
    v6[4] = self;
    notify_register_dispatch("com.apple.sharing.privacy-changed", &self->_privacyChangedNotifyToken, dispatchQueue, v6);
    [(CUCoalescer *)self->_privacyChangedCoalescer trigger];
  }
}

- (void)_friendsEnsureStopped
{
  [(NSMutableDictionary *)self->_friendAccountIdentityMap removeAllObjects];
  friendAccountIdentityMap = self->_friendAccountIdentityMap;
  self->_friendAccountIdentityMap = 0;

  [(NSMutableDictionary *)self->_friendDeviceIdentityMap removeAllObjects];
  friendDeviceIdentityMap = self->_friendDeviceIdentityMap;
  self->_friendDeviceIdentityMap = 0;

  friendsSuggestedArray = self->_friendsSuggestedArray;
  self->_friendsSuggestedArray = 0;

  self->_friendsSuggestedNeedsUpdate = 0;
  int friendsSuggestedNotifyToken = self->_friendsSuggestedNotifyToken;
  if (friendsSuggestedNotifyToken != -1)
  {
    notify_cancel(friendsSuggestedNotifyToken);
    self->_int friendsSuggestedNotifyToken = -1;
  }
  [(CUCoalescer *)self->_privacyChangedCoalescer invalidate];
  privacyChangedCoalescer = self->_privacyChangedCoalescer;
  self->_privacyChangedCoalescer = 0;

  int privacyChangedNotifyToken = self->_privacyChangedNotifyToken;
  if (privacyChangedNotifyToken != -1)
  {
    notify_cancel(privacyChangedNotifyToken);
    self->_int privacyChangedNotifyToken = -1;
  }
  friendsSuggestedPollTimer = self->_friendsSuggestedPollTimer;
  if (friendsSuggestedPollTimer)
  {
    id v11 = friendsSuggestedPollTimer;
    dispatch_source_cancel(v11);
    uint64_t v10 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = 0;
  }
}

- (void)_friendsUpdateSuggestedIfNeeded
{
  if (([(CUSystemMonitor *)self->_systemMonitor firstUnlocked] & 1) == 0)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return;
  }
  p_int friendsSuggestedNotifyToken = &self->_friendsSuggestedNotifyToken;
  int friendsSuggestedNotifyToken = self->_friendsSuggestedNotifyToken;
  int prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (prefFriendSuggestMax < 1)
  {
    if (friendsSuggestedNotifyToken != -1)
    {
      if (dword_100142410 > 30) {
        goto LABEL_27;
      }
      if (dword_100142410 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int friendsSuggestedNotifyToken = *p_friendsSuggestedNotifyToken;
      if (*p_friendsSuggestedNotifyToken != -1)
      {
LABEL_27:
        notify_cancel(friendsSuggestedNotifyToken);
        *p_int friendsSuggestedNotifyToken = -1;
      }
    }
LABEL_28:
    friendsSuggestedPollTimer = self->_friendsSuggestedPollTimer;
    if (!friendsSuggestedPollTimer) {
      goto LABEL_36;
    }
    if (dword_100142410 >= 31)
    {
      signed int v9 = friendsSuggestedPollTimer;
    }
    else
    {
      if (dword_100142410 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      signed int v9 = self->_friendsSuggestedPollTimer;
      if (!v9)
      {
LABEL_36:
        if (prefFriendSuggestMax < 1) {
          return;
        }
        goto LABEL_40;
      }
    }
    dispatch_source_cancel((dispatch_source_t)v9);
    uint64_t v10 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = 0;

    goto LABEL_36;
  }
  if (friendsSuggestedNotifyToken == -1)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100095F0C;
    handler[3] = &unk_100121630;
    handler[4] = self;
    notify_register_dispatch("com.apple.PeopleSuggester.ReQuery", &self->_friendsSuggestedNotifyToken, dispatchQueue, handler);
  }
  uint64_t prefFriendSuggestPollSeconds = self->_prefFriendSuggestPollSeconds;
  if ((int)prefFriendSuggestPollSeconds < 1) {
    goto LABEL_28;
  }
  if (!self->_friendsSuggestedPollTimer)
  {
    if (dword_100142410 <= 30)
    {
      if (dword_100142410 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_39;
        }
        uint64_t prefFriendSuggestPollSeconds = self->_prefFriendSuggestPollSeconds;
      }
      uint64_t v17 = prefFriendSuggestPollSeconds;
      LogPrintF();
    }
LABEL_39:
    id v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    uint64_t v12 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = v11;
    uint64_t v13 = v11;

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100095FB8;
    v20[3] = &unk_1001219D0;
    v20[4] = v13;
    v20[5] = self;
    dispatch_source_set_event_handler(v13, v20);
    CUDispatchTimerSet();
    dispatch_activate(v13);
  }
LABEL_40:
  if (!self->_friendsSuggestedGetting && (!self->_friendsSuggestedArray || self->_friendsSuggestedNeedsUpdate))
  {
    id v14 = objc_alloc_init(off_100142490());
    [v14 setDispatchQueue:self->_dispatchQueue];
    id v15 = objc_alloc_init(off_100142498());
    [v15 setMaxPeople:self->_prefFriendSuggestMax];
    NSSelectorFromString(@"excludeBackfills");
    if (objc_opt_respondsToSelector())
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [v15 setValue:&__kCFBooleanTrue forKey:@"excludeBackfills" v17];
    }
    else
    {
      if (dword_100142410 > 30)
      {
LABEL_56:
        *(_WORD *)&self->_friendsSuggestedGetting = 1;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10009606C;
        v18[3] = &unk_1001231F8;
        v18[4] = self;
        id v19 = v14;
        id v16 = v14;
        [v16 getPeopleSuggestions:v15 completion:v18];

        return;
      }
      if (dword_100142410 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_56;
  }
}

- (id)getFriendDeviceIdentities
{
  return [(NSMutableDictionary *)self->_friendDeviceIdentityMap allValues];
}

- (BOOL)_pruneFriends:(BOOL)a3
{
  BOOL v3 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (v3 || Current >= 584466893.0)
  {
    double pruneLastSeconds = self->_pruneLastSeconds;
    if (pruneLastSeconds == 0.0)
    {
      CFPrefs_GetDouble();
      self->_double pruneLastSeconds = pruneLastSeconds;
    }
    double v7 = vabdd_f64(Current, pruneLastSeconds);
    if (v3 || v7 >= 86400.0)
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v12 = (uint64_t)v7;
        LogPrintF();
      }
      unsigned __int8 v9 = -[RPPeopleDaemon _pruneFriendAccounts:](self, "_pruneFriendAccounts:", v3, v12);
      unsigned __int8 v10 = [(RPPeopleDaemon *)self _pruneFriendDevices];
      self->_double pruneLastSeconds = Current;
      CFPrefs_SetDouble();
      LOBYTE(v8) = v9 | v10;
      return v8;
    }
    if (dword_100142410 <= 10)
    {
      if (dword_100142410 != -1) {
        goto LABEL_12;
      }
      int v8 = _LogCategory_Initialize();
      if (v8) {
        goto LABEL_12;
      }
      return v8;
    }
LABEL_13:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (dword_100142410 > 30) {
    goto LABEL_13;
  }
  if (dword_100142410 != -1 || (int v8 = _LogCategory_Initialize()) != 0)
  {
LABEL_12:
    LogPrintF();
    goto LABEL_13;
  }
  return v8;
}

- (BOOL)_pruneFriendAccounts:(BOOL)a3
{
  int64_t prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
  if (a3 || prefFriendAccountPruneSeconds > 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v5 = [(NSMutableDictionary *)self->_friendAccountIdentityMap allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v6)
    {
      BOOL v8 = 0;
      goto LABEL_40;
    }
    id v7 = v6;
    int64_t v20 = prefFriendAccountPruneSeconds;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v22;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_friendAccountIdentityMap, "objectForKeyedSubscript:", v11, v18, v19);
        if (![v11 length])
        {
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            int v18 = v12;
            LogPrintF();
          }
          goto LABEL_35;
        }
        uint64_t v13 = [v12 dateRemoved];
        if (v13)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [v13 timeIntervalSinceReferenceDate];
          uint64_t v16 = (uint64_t)(Current - v15);
          if (v20 <= v16)
          {
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              int v18 = (void *)v16;
              id v19 = v12;
              LogPrintF();
            }

LABEL_35:
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v11, v18);
            BOOL v8 = 1;
            self->_needsFriendAccountUpdate = 1;
            uint64_t v13 = +[RPIdentityDaemon sharedIdentityDaemon];
            [v13 removeIdentity:v12 error:0];
            goto LABEL_36;
          }
          if (dword_100142410 <= 9 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            int v18 = (void *)v16;
            id v19 = v12;
LABEL_23:
            LogPrintF();
          }
        }
        else if (dword_100142410 <= 8 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          int v18 = v12;
          goto LABEL_23;
        }
LABEL_36:
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v7)
      {
LABEL_40:

        return v8;
      }
    }
  }
  if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (BOOL)_pruneFriendDevices
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(NSMutableDictionary *)self->_friendDeviceIdentityMap allKeys];
  id v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v7);
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_friendDeviceIdentityMap, "objectForKeyedSubscript:", v8, v16, v17);
        unsigned __int8 v10 = [v9 accountID];
        if (v10
          && ([(NSMutableDictionary *)self->_friendAccountIdentityMap objectForKeyedSubscript:v10], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v12 = (void *)v11;
          if (dword_100142410 <= 8 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v16 = v9;
            uint64_t v17 = v12;
            LogPrintF();
          }
        }
        else
        {
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v16 = v9;
            LogPrintF();
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", 0, v8, v16);
          uint64_t v13 = +[RPIdentityDaemon sharedIdentityDaemon];
          [v13 removeIdentity:v9 error:0];

          uint64_t v12 = 0;
          char v5 = 1;
        }

        id v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v14 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v4 = v14;
    }
    while (v14);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (void)_resetFriends
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [(NSMutableDictionary *)self->_friendAccountIdentityMap allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)self->_friendAccountIdentityMap objectForKeyedSubscript:v8];
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          long long v19 = v9;
          LogPrintF();
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v8, v19);
        self->_needsFriendAccountUpdate = 1;
        unsigned __int8 v10 = +[RPIdentityDaemon sharedIdentityDaemon];
        [v10 removeIdentity:v9 error:0];
      }
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [(NSMutableDictionary *)self->_friendDeviceIdentityMap allKeys];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
        uint64_t v17 = [(NSMutableDictionary *)self->_friendDeviceIdentityMap objectForKeyedSubscript:v16];
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          long long v19 = v17;
          LogPrintF();
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", 0, v16, v19);
        int v18 = +[RPIdentityDaemon sharedIdentityDaemon];
        [v18 removeIdentity:v17 error:0];
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  [(RPPeopleDaemon *)self _update];
}

- (BOOL)_shouldThrottleFriendSyncing
{
  int prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (prefFriendSuggestMax >= 33
    && dword_100142410 <= 30
    && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return prefFriendSuggestMax > 32;
}

- (void)_updateFriendIdentities
{
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    unsigned int v3 = [(RPPeopleDaemon *)self _updateFriendAccounts];
    unsigned int v4 = [(RPPeopleDaemon *)self _updateFriendDevices] + v3;
    int v5 = [(RPPeopleDaemon *)self _pruneFriends:0] << 31 >> 31;
    [(RPPeopleDaemon *)self _processBufferedCloudMessages];
    [(RPPeopleDaemon *)self _updateFriendSyncing];
    if (v4 != v5)
    {
      id v6 = +[RPDaemon sharedDaemon];
      [v6 postDaemonInfoChanges:128];
    }
  }
  else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_updateFriendAccounts
{
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  if (!self->_friendAccountIdentityMap)
  {
    unsigned int v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    friendAccountIdentityMap = self->_friendAccountIdentityMap;
    self->_friendAccountIdentityMap = v3;

    int v5 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v64 = 0;
    id v6 = [v5 identitiesOfType:5 error:&v64];
    id v44 = v64;

    if (!v6 && dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v37 = v44;
      LogPrintF();
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v61;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v61 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          id v12 = [v11 identifier:v37];
          if (v12)
          {
            [(NSMutableDictionary *)self->_friendAccountIdentityMap setObject:v11 forKeyedSubscript:v12];
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              id v37 = v11;
              LogPrintF();
            }
            *((unsigned char *)v66 + 24) = 1;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v8);
    }

    self->_needsFriendAccountUpdate = 1;
  }
  uint64_t v39 = self->_friendsSuggestedArray;
  if (!v39)
  {
    ++self->_irkMetrics.duetNotQueried;
    self->_sendIRKMetricsReport = 1;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_62;
  }
  int maxNumDuetSuggestions = self->_irkMetrics.maxNumDuetSuggestions;
  signed int v14 = [(NSArray *)self->_friendsSuggestedArray count];
  if (maxNumDuetSuggestions <= v14) {
    int v15 = v14;
  }
  else {
    int v15 = maxNumDuetSuggestions;
  }
  self->_irkMetrics.int maxNumDuetSuggestions = v15;
  self->_sendIRKMetricsReport = 1;
  if (!self->_needsFriendAccountUpdate)
  {
LABEL_62:
    int v35 = *((unsigned __int8 *)v66 + 24);
    goto LABEL_63;
  }
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_needsFriendAccountUpdate = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v17 = self->_friendAccountIdentityMap;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100097544;
  v59[3] = &unk_100124668;
  *(CFAbsoluteTime *)&v59[4] = Current;
  [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v59];
  id v18 = [objc_alloc((Class)NSMutableSet) initWithCapacity:-[NSArray count](v39, "count")];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v19 = v39;
  id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v56;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) contactID:v37];
        [v18 addObject:v23];
      }
      id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v20);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v19;
  id v42 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v70 count:16];
  if (v42)
  {
    int v38 = 0;
    uint64_t v41 = *(void *)v52;
LABEL_42:
    uint64_t v45 = 0;
    int v43 = v38;
    v38 += (int)v42;
    while (1)
    {
      if (*(void *)v52 != v41) {
        objc_enumerationMutation(obj);
      }
      long long v24 = *(void **)(*((void *)&v51 + 1) + 8 * v45);
      if (objc_opt_respondsToSelector())
      {
        long long v25 = [v24 sendersKnownAlias];
        long long v26 = [v25 _stripFZIDPrefix];
      }
      else
      {
        long long v26 = 0;
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v27 = [v24 handles:v37];
      id v28 = [v27 countByEnumeratingWithState:&v47 objects:v69 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v48;
        do
        {
          for (k = 0; k != v28; k = (char *)k + 1)
          {
            if (*(void *)v48 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * (void)k);
            long long v32 = [v24 contactID];
            LODWORD(v31) = [(RPPeopleDaemon *)self _updateFriendIdentityWithAppleID:v31 contactID:v32 sendersKnownAlias:v26 userAdded:0 updateDateRequested:0 suggestedContactIDs:v18];

            if (v31) {
              *((unsigned char *)v66 + 24) = 1;
            }
          }
          id v28 = [v27 countByEnumeratingWithState:&v47 objects:v69 count:16];
        }
        while (v28);
      }

      BOOL v33 = ++v43 < self->_prefFriendSuggestMax;
      if (!v33) {
        break;
      }
      if ((id)++v45 == v42)
      {
        id v42 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v70 count:16];
        if (v42) {
          goto LABEL_42;
        }
        break;
      }
    }
  }

  long long v34 = self->_friendAccountIdentityMap;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000975D8;
  v46[3] = &unk_1001245F8;
  v46[4] = &v65;
  [(NSMutableDictionary *)v34 enumerateKeysAndObjectsUsingBlock:v46];
  int v35 = *((unsigned __int8 *)v66 + 24);

LABEL_63:
  _Block_object_dispose(&v65, 8);
  return v35 != 0;
}

- (unsigned)_updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4 sendersKnownAlias:(id)a5 userAdded:(BOOL)a6 updateDateRequested:(BOOL)a7 suggestedContactIDs:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v18 = CUNormalizeEmailAddress();
  long long v19 = [(RPPeopleDaemon *)self _primaryAppleID:0];
  if ([v19 caseInsensitiveCompare:v18])
  {
    BOOL v65 = v10;
    uint64_t v66 = v19;
    id v64 = self;
    uint64_t v20 = [(NSMutableDictionary *)self->_friendAccountIdentityMap objectForKeyedSubscript:v18];
    if (v20)
    {
      id v21 = (id)v20;
      uint64_t v22 = 0;
    }
    else
    {
      id v21 = objc_alloc_init((Class)RPIdentity);
      uint64_t v22 = 2048;
    }
    [v21 setPresent:1];
    if ([v15 length])
    {
      BOOL v23 = v9;
      long long v24 = [v21 contactID];
      if ([v24 isEqual:v15])
      {
      }
      else
      {
        id v62 = v16;
        id v25 = v14;
        id v26 = v15;
        long long v27 = [v21 contactID];
        unsigned __int8 v28 = [v17 containsObject:v27];

        if (v28)
        {
          id v15 = v26;
        }
        else
        {
          id v15 = v26;
          [v21 setContactID:v26];
          uint64_t v22 = v22 | 0x8000;
        }
        id v14 = v25;
        id v16 = v62;
      }
      BOOL v9 = v23;
    }
    uint64_t v29 = [v21 dateAdded];

    if (!v29)
    {
      long long v30 = +[NSDate date];
      [v21 setDateAdded:v30];

      uint64_t v22 = v22 | 2;
    }
    uint64_t v31 = [v21 dateRemoved];

    if (v31)
    {
      [v21 setDateRemoved:0];
      uint64_t v22 = v22 | 2;
    }
    if (v9)
    {
      long long v32 = +[NSDate date];
      [v21 setDateRequested:v32];
    }
    BOOL v33 = [v21 identifier];
    unsigned __int8 v34 = [v33 isEqual:v18];

    if ((v34 & 1) == 0)
    {
      [v21 setIdentifier:v18];
      uint64_t v22 = v22 | 0x2020;
    }
    id v35 = v16;
    if (!v16) {
      goto LABEL_48;
    }
    id v36 = [v21 allUsedSendersKnownAliases];

    id v63 = v15;
    if (!v36)
    {
      id v37 = [v21 sendersKnownAlias];

      if (v37)
      {
        int v38 = [v21 sendersKnownAlias];
        uint64_t v67 = v38;
        uint64_t v39 = +[NSArray arrayWithObjects:&v67 count:1];
        [v21 setAllUsedSendersKnownAliases:v39];
      }
      else
      {
        int v38 = +[NSArray array];
        [v21 setAllUsedSendersKnownAliases:v38];
      }
    }
    if (![v35 length])
    {
LABEL_48:

      if ([v21 type] != 5)
      {
        [v21 setType:5];
        uint64_t v22 = v22 | 0x200;
      }
      if (v65 && ([v21 userAdded] & 1) == 0)
      {
        [v21 setUserAdded:1];
        uint64_t v22 = v22 | 0x4000;
      }
      if ((v22 & 0x800) != 0)
      {
        friendAccountIdentityMap = v64->_friendAccountIdentityMap;
        if (!friendAccountIdentityMap)
        {
          long long v55 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v56 = v64->_friendAccountIdentityMap;
          v64->_friendAccountIdentityMap = v55;

          friendAccountIdentityMap = v64->_friendAccountIdentityMap;
        }
        [(NSMutableDictionary *)friendAccountIdentityMap setObject:v21 forKeyedSubscript:v18];
        if (dword_100142410 > 30 || dword_100142410 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_70;
        }
        id v59 = v21;
      }
      else
      {
        if (!v22)
        {
          if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_71;
        }
        if (dword_100142410 > 30 || dword_100142410 == -1 && !_LogCategory_Initialize())
        {
LABEL_70:
          long long v57 = +[RPIdentityDaemon sharedIdentityDaemon];
          [v57 saveIdentity:v21 error:0];

LABEL_71:
          long long v19 = v66;
          goto LABEL_72;
        }
        uint64_t v60 = v22;
        long long v61 = &unk_10011AF02;
        id v59 = v21;
      }
      LogPrintF();
      goto LABEL_70;
    }
    char v40 = [v21 sendersKnownAlias];
    id v41 = v35;
    id v42 = v40;
    if (v42 == v41)
    {

      goto LABEL_40;
    }
    int v43 = v42;
    if (v42)
    {
      unsigned __int8 v44 = [v41 isEqual:v42];

      if (v44)
      {
LABEL_40:
        uint64_t v45 = [v21 allUsedSendersKnownAliases];
        unsigned int v46 = [v21 sendersKnownAlias];
        unsigned __int8 v47 = [v45 containsObject:v46];

        long long v48 = [(NSMutableDictionary *)v64->_friendDeviceIdentityMap allKeys];
        unsigned __int8 v49 = [v48 containsObject:v14];

        if ((v47 & 1) == 0 && (v49 & 1) == 0)
        {
          long long v50 = [v21 allUsedSendersKnownAliases];
          long long v51 = +[NSMutableArray arrayWithArray:v50];

          long long v52 = [v21 sendersKnownAlias];
          [v51 addObject:v52];

          id v53 = [v51 copy];
          [v21 setAllUsedSendersKnownAliases:v53];

          uint64_t v22 = v22 | 0x1000000;
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [v21 setDateRequested:0];
        }
        id v15 = v63;
        goto LABEL_48;
      }
    }
    else
    {
    }
    [v21 setSendersKnownAlias:v41];
    uint64_t v22 = v22 | 0x40000;
    goto LABEL_40;
  }
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  LODWORD(v22) = 0;
LABEL_72:

  return v22;
}

- (BOOL)updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4
{
  return [(RPPeopleDaemon *)self _updateFriendIdentityWithAppleID:a3 contactID:a4 sendersKnownAlias:0 userAdded:1 updateDateRequested:1 suggestedContactIDs:0] != 0;
}

- (BOOL)_updateFriendDevices
{
  if (self->_friendDeviceIdentityMap) {
    return 0;
  }
  unsigned int v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  friendDeviceIdentityMap = self->_friendDeviceIdentityMap;
  self->_friendDeviceIdentityMap = v4;

  id v6 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v23 = 0;
  id v7 = [v6 loadFriendDeviceIdentitiesWithError:&v23];
  id v8 = v23;

  if (!v7 && dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v8;
    LogPrintF();
  }
  id v18 = v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    BOOL v2 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v14 identifier:v17 v18:v19];
        if (v15)
        {
          [(NSMutableDictionary *)self->_friendDeviceIdentityMap setObject:v14 forKeyedSubscript:v15];
          if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            id v17 = v14;
            LogPrintF();
          }
          BOOL v2 = 1;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (void)_updateFriendPrivacy
{
  if (!self->_friendPrivacyGetting)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    friendAccountIdentityMap = self->_friendAccountIdentityMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009827C;
    v10[3] = &unk_100124690;
    v10[4] = v3;
    [(NSMutableDictionary *)friendAccountIdentityMap enumerateKeysAndObjectsUsingBlock:v10];
    if ([v3 count])
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        [v3 count];
        LogPrintF();
      }
      id v5 = objc_alloc_init(off_100142490());
      [v5 setDispatchQueue:self->_dispatchQueue];
      id v6 = objc_alloc_init(off_100142498());
      [v6 setContactIDs:v3];
      self->_friendPrivacyGetting = 1;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000982DC;
      v8[3] = &unk_1001231F8;
      v8[4] = self;
      id v9 = v5;
      id v7 = v5;
      [v7 getPeopleSuggestions:v6 completion:v8];
    }
    else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_updateFriendPrivacyResults:(id)a3
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v4)
  {
    char v20 = 0;
    char v5 = 0;
    uint64_t v6 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v9 = [v8 contactID:v17];
        if (!v9)
        {

          goto LABEL_31;
        }
        uint64_t v29 = 0;
        long long v30 = &v29;
        uint64_t v31 = 0x3032000000;
        long long v32 = sub_10008EB10;
        BOOL v33 = sub_10008EB20;
        id v34 = 0;
        uint64_t v23 = 0;
        long long v24 = &v23;
        uint64_t v25 = 0x3032000000;
        id v26 = sub_10008EB10;
        long long v27 = sub_10008EB20;
        id v28 = 0;
        friendAccountIdentityMap = self->_friendAccountIdentityMap;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000988AC;
        v22[3] = &unk_1001246B8;
        v22[4] = v9;
        v22[5] = &v29;
        v22[6] = &v23;
        [(NSMutableDictionary *)friendAccountIdentityMap enumerateKeysAndObjectsUsingBlock:v22];
        if (v30[5] && v24[5])
        {
          id v11 = [v8 flags];
          if ((v11 & 3) != 0)
          {
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              id v18 = v11;
              long long v19 = &unk_10011AFFD;
              id v17 = (void *)v30[5];
              LogPrintF();
            }
            uint64_t v12 = [v30[5] dateRequested:v17, v18, v19];

            BOOL v13 = v12 != 0;
            [(NSMutableDictionary *)self->_friendAccountIdentityMap setObject:0 forKeyedSubscript:v24[5]];
            self->_needsFriendAccountUpdate = 1;
            id v14 = +[RPIdentityDaemon sharedIdentityDaemon];
            [v14 removeIdentity:v30[5] error:0];

            [(RPPeopleDaemon *)self _pruneFriendDevices];
            v20 |= v13;
            char v5 = 1;
          }
        }
        else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v9;
          LogPrintF();
        }
        _Block_object_dispose(&v23, 8);

        _Block_object_dispose(&v29, 8);
      }
      id v4 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if (v5)
    {
      id v15 = +[RPDaemon sharedDaemon];
      [v15 postDaemonInfoChanges:128];
    }
    if (v20)
    {
      if (self->_prefDisableSelfIdentityRolling)
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else
      {
        friendsSuggestedArray = self->_friendsSuggestedArray;
        self->_friendsSuggestedArray = 0;

        [(RPPeopleDaemon *)self _regenerateSelfIdentity:@"Friend Blocked/Removed"];
      }
    }
  }
  else
  {
  }
LABEL_31:
}

- (void)_updateFriendSyncing
{
  if (self->_prefFriendSyncDelaySeconds < 0)
  {
    if (dword_100142410 > 30 || dword_100142410 == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_10:
    LogPrintF();
    return;
  }
  CFPrefs_GetDouble();
  if (v3 < 0.0)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFAbsoluteTimeGetCurrent();
    goto LABEL_25;
  }
  double v4 = v3;
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = Current;
  if (v4 > 0.0 && vabdd_f64(v4, Current) > 2592000.0)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_25;
  }
  if (v4 == 0.0)
  {
LABEL_25:
    arc4random();
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFPrefs_SetDouble();
    return;
  }
  if (v4 > Current)
  {
    if (dword_100142410 > 30 || dword_100142410 == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_10;
  }
  unsigned int v7 = [(RPPeopleDaemon *)self _shouldThrottleFriendSyncing];
  char v8 = v7;
  if (v7)
  {
    double friendRequestMaxReachedLastSeconds = self->_friendRequestMaxReachedLastSeconds;
    if (friendRequestMaxReachedLastSeconds == 0.0)
    {
      CFPrefs_GetDouble();
      self->_double friendRequestMaxReachedLastSeconds = friendRequestMaxReachedLastSeconds;
    }
    if (vabdd_f64(v6, friendRequestMaxReachedLastSeconds) < 3300.0)
    {
      if (dword_100142410 > 30 || dword_100142410 == -1 && !_LogCategory_Initialize()) {
        return;
      }
      goto LABEL_10;
    }
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  int v42 = 10;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  int v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  int v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  int v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  int v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  int v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  friendAccountIdentityMap = self->_friendAccountIdentityMap;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009912C;
  void v17[3] = &unk_1001246E0;
  v17[6] = &v19;
  v17[7] = v27;
  v17[4] = self;
  v17[5] = v39;
  v17[8] = v25;
  v17[9] = v33;
  v17[10] = v37;
  v17[11] = v35;
  v17[12] = v41;
  v17[13] = v29;
  v17[14] = v31;
  v17[15] = v23;
  char v18 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](friendAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v17, &v19);
  if (*((unsigned char *)v20 + 24))
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_double friendRequestMaxReachedLastSeconds = CFAbsoluteTimeGetCurrent();
    CFPrefs_SetDouble();
  }
  int maxNumFriendAccounts = self->_irkMetrics.maxNumFriendAccounts;
  signed int v12 = [(NSMutableDictionary *)self->_friendAccountIdentityMap count];
  if (maxNumFriendAccounts <= v12) {
    int v13 = v12;
  }
  else {
    int v13 = maxNumFriendAccounts;
  }
  self->_irkMetrics.int maxNumFriendAccounts = v13;
  int maxNumFriendDevices = self->_irkMetrics.maxNumFriendDevices;
  signed int v15 = [(NSMutableDictionary *)self->_friendDeviceIdentityMap count];
  if (maxNumFriendDevices <= v15) {
    int v16 = v15;
  }
  else {
    int v16 = maxNumFriendDevices;
  }
  self->_irkMetrics.int maxNumFriendDevices = v16;
  self->_sendIRKMetricsReport = 1;
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)self->_friendAccountIdentityMap count];
    LogPrintF();
  }
  if (!self->_prefOneTimeDateRequestedResetCompleted)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFPrefs_SetValue();
    self->_prefOneTimeDateRequestedResetCompleted = 1;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)_irkMetricsSetup
{
  self->_irkMetricsReportLock._os_unfair_lock_opaque = 0;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)&self->_irkMetrics.selfIdentRolled = v2;
  *(_OWORD *)&self->_irkMetrics.requestsSent = v2;
  *(_OWORD *)&self->_irkMetrics.requestsIgnoredNoIDSDevice = v2;
  *(void *)&self->_irkMetrics.int maxNumFamilyDevices = -1;
}

- (void)_fetchSameAccountIdentities
{
  double v3 = +[RPIdentityDaemon sharedIdentityDaemon];
  uint64_t v8 = 0;
  double v4 = [v3 identitiesOfType:2 error:&v8];

  int maxNumSelfDevices = self->_irkMetrics.maxNumSelfDevices;
  signed int v6 = [v4 count];
  if (maxNumSelfDevices <= v6) {
    int v7 = v6;
  }
  else {
    int v7 = maxNumSelfDevices;
  }
  self->_irkMetrics.int maxNumSelfDevices = v7;
  self->_sendIRKMetricsReport = 1;
}

- (void)reportIRKMetrics
{
  [(RPPeopleDaemon *)self _fetchSameAccountIdentities];
  os_unfair_lock_lock(&self->_irkMetricsReportLock);
  if (self->_sendIRKMetricsReport)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    selfIdentRolled = self->_irkMetrics.selfIdentRolled;
    id v28 = (id)v3;
    if ((selfIdentRolled & 0x80000000) == 0)
    {
      char v5 = +[NSNumber numberWithInt:(selfIdentRolled + 1)];
      [v28 setObject:v5 forKeyedSubscript:@"selfIdentRolled"];
    }
    selfIdentRolledBlocked = self->_irkMetrics.selfIdentRolledBlocked;
    if ((selfIdentRolledBlocked & 0x80000000) == 0)
    {
      int v7 = +[NSNumber numberWithInt:(selfIdentRolledBlocked + 1)];
      [v28 setObject:v7 forKeyedSubscript:@"selfIdentRolledBlocked"];
    }
    int duetNotQueried = self->_irkMetrics.duetNotQueried;
    if ((duetNotQueried & 0x80000000) == 0)
    {
      id v9 = +[NSNumber numberWithInt:(duetNotQueried + 1)];
      [v28 setObject:v9 forKeyedSubscript:@"duetNotQueried"];
    }
    if ((self->_irkMetrics.maxNumDuetSuggestions & 0x80000000) == 0)
    {
      id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v28 setObject:v10 forKeyedSubscript:@"numDuetSuggestions"];
    }
    int requestsSent = self->_irkMetrics.requestsSent;
    if ((requestsSent & 0x80000000) == 0)
    {
      signed int v12 = +[NSNumber numberWithInt:(requestsSent + 1)];
      [v28 setObject:v12 forKeyedSubscript:@"requestsSent"];
    }
    if ((self->_irkMetrics.maxNumFriendAccounts & 0x80000000) == 0)
    {
      int v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v28 setObject:v13 forKeyedSubscript:@"numFriendAccounts"];
    }
    if ((self->_irkMetrics.maxNumFriendDevices & 0x80000000) == 0)
    {
      id v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v28 setObject:v14 forKeyedSubscript:@"numFriendDevices"];
    }
    int requestsIgnored = self->_irkMetrics.requestsIgnored;
    if ((requestsIgnored & 0x80000000) == 0)
    {
      int v16 = +[NSNumber numberWithInt:(requestsIgnored + 1)];
      [v28 setObject:v16 forKeyedSubscript:@"requestsIgnored"];
    }
    int requestsIgnoredNoIDSDevice = self->_irkMetrics.requestsIgnoredNoIDSDevice;
    if ((requestsIgnoredNoIDSDevice & 0x80000000) == 0)
    {
      char v18 = +[NSNumber numberWithInt:(requestsIgnoredNoIDSDevice + 1)];
      [v28 setObject:v18 forKeyedSubscript:@"requestsIgnoredNoIDSDevice"];
    }
    int requestsIgnoredSelfIdentReq = self->_irkMetrics.requestsIgnoredSelfIdentReq;
    if ((requestsIgnoredSelfIdentReq & 0x80000000) == 0)
    {
      char v20 = +[NSNumber numberWithInt:(requestsIgnoredSelfIdentReq + 1)];
      [v28 setObject:v20 forKeyedSubscript:@"requestsIgnoredSelfIdentReq"];
    }
    int requestsIgnoredUnknownPeer = self->_irkMetrics.requestsIgnoredUnknownPeer;
    if ((requestsIgnoredUnknownPeer & 0x80000000) == 0)
    {
      char v22 = +[NSNumber numberWithInt:(requestsIgnoredUnknownPeer + 1)];
      [v28 setObject:v22 forKeyedSubscript:@"requestsIgnoredUnknownPeer"];
    }
    int requestsAcked = self->_irkMetrics.requestsAcked;
    if ((requestsAcked & 0x80000000) == 0)
    {
      int v24 = +[NSNumber numberWithInt:(requestsAcked + 1)];
      [v28 setObject:v24 forKeyedSubscript:@"requestsAcked"];
    }
    if ((self->_irkMetrics.maxNumFamilyDevices & 0x80000000) == 0)
    {
      uint64_t v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v28 setObject:v25 forKeyedSubscript:@"numFamilyDevices"];
    }
    if ((self->_irkMetrics.maxNumSelfDevices & 0x80000000) == 0)
    {
      int v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v28 setObject:v26 forKeyedSubscript:@"numSelfDevices"];
    }
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CUMetricsLog();
    *(void *)&self->_irkMetrics.int maxNumFamilyDevices = -1;
    *(void *)&long long v27 = -1;
    *((void *)&v27 + 1) = -1;
    *(_OWORD *)&self->_irkMetrics.int requestsSent = v27;
    *(_OWORD *)&self->_irkMetrics.int requestsIgnoredNoIDSDevice = v27;
    *(_OWORD *)&self->_irkMetrics.selfIdentRolled = v27;
    self->_sendIRKMetricsReport = 0;
    os_unfair_lock_unlock(&self->_irkMetricsReportLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_irkMetricsReportLock);
  }
}

- (void)receivedFriendIdentityRequest:(id)a3 msgCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v8 = [v7 appleID];
  id v9 = [v7 fromID];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    CFStringGetTypeID();
    id v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      id v11 = [(RPPeopleDaemon *)self _primaryAppleID:0];
      if ([v11 caseInsensitiveCompare:v8])
      {
        id v12 = objc_alloc_init(off_1001424A0());
        [v12 setEmailAddress:v8];
        [v12 setPhoneNumber:v8];
        id v13 = objc_alloc_init(off_100142490());
        [v13 setDispatchQueue:self->_dispatchQueue];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100099E28;
        v16[3] = &unk_100124708;
        id v17 = v13;
        char v18 = self;
        uint64_t v19 = v8;
        char v20 = v10;
        id v21 = v6;
        id v22 = v7;
        uint64_t v23 = v9;
        id v14 = v13;
        [v14 findContact:v12 completion:v16];
      }
      else
      {
        ++self->_irkMetrics.requestsIgnored;
        ++self->_irkMetrics.requestsIgnoredSelfIdentReq;
        self->_sendIRKMetricsReport = 1;
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
    }
    else
    {
      *(int32x2_t *)&self->_irkMetrics.int requestsIgnored = vadd_s32(*(int32x2_t *)&self->_irkMetrics.requestsIgnored, (int32x2_t)0x100000001);
      self->_sendIRKMetricsReport = 1;
      if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      signed int v15 = v8;
      LogPrintF();
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 64, v7, v15);
  }
}

- (void)receivedFriendIdentityResponse:(id)a3 msgCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v8 = [v7 appleID];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      id v10 = self->_friendAccountIdentityMap;
      if (v10)
      {
        id v11 = [(RPPeopleDaemon *)self _primaryAppleID:0];
        if ([v11 caseInsensitiveCompare:v8])
        {
          id v12 = objc_alloc_init(off_1001424A0());
          [v12 setEmailAddress:v8];
          [v12 setPhoneNumber:v8];
          id v13 = objc_alloc_init(off_100142490());
          [v13 setDispatchQueue:self->_dispatchQueue];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_10009A324;
          v16[3] = &unk_100124730;
          id v17 = v13;
          char v18 = v8;
          uint64_t v19 = v9;
          char v20 = v10;
          id v21 = self;
          id v22 = v6;
          id v14 = v13;
          [v14 findContact:v12 completion:v16];
        }
        else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          signed int v15 = v8;
          LogPrintF();
        }
        -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 65, v7, v15);
      }
    }
    else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      signed int v15 = v8;
      LogPrintF();
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 65, v7, v15);
  }
}

- (void)receivedFriendIdentityUpdate:(id)a3 msgCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v8 = [v7 appleID];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      id v10 = self->_friendAccountIdentityMap;
      if (v10)
      {
        id v11 = [(RPPeopleDaemon *)self _primaryAppleID:0];
        if ([v11 caseInsensitiveCompare:v8])
        {
          id v12 = objc_alloc_init(off_1001424A0());
          [v12 setEmailAddress:v8];
          [v12 setPhoneNumber:v8];
          id v13 = objc_alloc_init(off_100142490());
          [v13 setDispatchQueue:self->_dispatchQueue];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_10009A870;
          v16[3] = &unk_100124758;
          id v17 = v13;
          char v18 = v8;
          uint64_t v19 = v9;
          char v20 = self;
          id v21 = v6;
          id v14 = v13;
          [v14 findContact:v12 completion:v16];
        }
        else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
        {
          signed int v15 = v8;
          LogPrintF();
        }
        -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 66, v7, v15);
      }
    }
    else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      signed int v15 = v8;
      LogPrintF();
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 66, v7, v15);
  }
}

- (void)_rangingBLEActionScannerEnsureStarted
{
  if (!self->_rangingBLEActionScanner)
  {
    p_rangingBLEActionScanner = &self->_rangingBLEActionScanner;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = objc_alloc_init(off_100142488());
    objc_storeStrong((id *)p_rangingBLEActionScanner, v4);
    [v4 setChangeFlags:1];
    [v4 setDiscoveryFlags:16];
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setPurpose:@"RPPeople"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10009AC18;
    void v17[3] = &unk_100124780;
    id v5 = v4;
    id v18 = v5;
    uint64_t v19 = self;
    [v5 setDeviceFoundHandler:v17];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009AC34;
    v14[3] = &unk_100124780;
    id v6 = v5;
    id v15 = v6;
    int v16 = self;
    [v6 setDeviceLostHandler:v14];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009AC50;
    v11[3] = &unk_1001247A8;
    id v12 = v6;
    id v13 = self;
    id v7 = v6;
    [v7 setDeviceChangedHandler:v11];

    rangingBLEActionScanner = self->_rangingBLEActionScanner;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009AC6C;
    v10[3] = &unk_1001222C0;
    v10[4] = rangingBLEActionScanner;
    void v10[5] = self;
    id v9 = rangingBLEActionScanner;
    [(SFDeviceDiscovery *)v9 activateWithCompletion:v10];
  }
}

- (void)_rangingBLEActionScannerEnsureStopped
{
  rangingBLEActionBurstTimer = self->_rangingBLEActionBurstTimer;
  if (rangingBLEActionBurstTimer)
  {
    id v4 = rangingBLEActionBurstTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_rangingBLEActionBurstTimer;
    self->_rangingBLEActionBurstTimer = 0;
  }
  if (self->_rangingBLEActionScanner)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_rangingBLEActionScanner invalidate];
    rangingBLEActionScanner = self->_rangingBLEActionScanner;
    self->_rangingBLEActionScanner = 0;

    rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
    self->_rangingBLEActionDevicesActive = 0;

    rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
    self->_rangingBLEActionDevicesOther = 0;

    [(RPPeopleDaemon *)self _rangingResponderUpdate];
  }
}

- (void)_rangingBLEActionScannerDeviceFound:(id)a3
{
  id v4 = a3;
  id v17 = v4;
  if (dword_100142410 <= 30)
  {
    if (dword_100142410 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v17, v5))
    {
      id v16 = v4;
      LogPrintF();
      id v4 = v17;
    }
  }
  id v6 = [v4 identifier:v16];
  id v7 = [v6 UUIDString];

  if (v7)
  {
    if ([v17 deviceActionType] == 53)
    {
      if (self->_airdropMode != 1
        && (((unsigned __int16)[v17 deviceFlags] & 0x444E) != 0
         || self->_airdropMode == 3 && self->_prefPeopleStrangers))
      {
        rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
        if (!rangingBLEActionDevicesActive)
        {
          id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v14 = self->_rangingBLEActionDevicesActive;
          self->_rangingBLEActionDevicesActive = v13;

          rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
        }
        id v15 = [(NSMutableDictionary *)rangingBLEActionDevicesActive objectForKeyedSubscript:v7];

        [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive setObject:v17 forKeyedSubscript:v7];
        if (!v15) {
          [(RPPeopleDaemon *)self _rangingBLEActionScannerBurst];
        }
        goto LABEL_13;
      }
      rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
      if (!rangingBLEActionDevicesOther)
      {
        id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v10 = self->_rangingBLEActionDevicesOther;
        self->_rangingBLEActionDevicesOther = v9;

        rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
      }
      id v11 = v17;
    }
    else
    {
      [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive setObject:0 forKeyedSubscript:v7];
      rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
      id v11 = 0;
    }
    [(NSMutableDictionary *)rangingBLEActionDevicesOther setObject:v11 forKeyedSubscript:v7];
LABEL_13:
    [(RPPeopleDaemon *)self _rangingResponderUpdate];
  }
}

- (void)_rangingBLEActionScannerDeviceLost:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (dword_100142410 <= 30)
  {
    if (dword_100142410 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v9, v5))
    {
      id v8 = v4;
      LogPrintF();
      id v4 = v9;
    }
  }
  id v6 = [v4 identifier:v8];
  id v7 = [v6 UUIDString];

  if (v7)
  {
    [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive setObject:0 forKeyedSubscript:v7];
    [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther setObject:0 forKeyedSubscript:v7];
    [(RPPeopleDaemon *)self _rangingResponderUpdate];
  }
}

- (void)_rangingBLEActionScannerBurst
{
  double prefPTSBurstScanActionSecs = self->_prefPTSBurstScanActionSecs;
  if (prefPTSBurstScanActionSecs > 0.0)
  {
    id v4 = self->_rangingBLEActionBurstTimer;
    if (v4)
    {
      int v5 = v4;
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        double v7 = prefPTSBurstScanActionSecs;
        LogPrintF();
      }
      CUDispatchTimerSet();
    }
    else
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        double v7 = prefPTSBurstScanActionSecs;
        LogPrintF();
      }
      dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_rangingBLEActionBurstTimer, v6);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10009B318;
      handler[3] = &unk_1001219D0;
      int v5 = v6;
      id v9 = v5;
      id v10 = self;
      dispatch_source_set_event_handler(v5, handler);
      CUDispatchTimerSet();
      dispatch_activate(v5);
    }
    if ([(SFDeviceDiscovery *)self->_rangingBLEActionScanner scanRate] != (id)30) {
      [(SFDeviceDiscovery *)self->_rangingBLEActionScanner setScanRate:30];
    }
  }
}

- (void)_rangingInitiatorEnsureStarted
{
  if (!self->_rangingInitiator)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = (CURangingSession *)objc_alloc_init((Class)CURangingSession);
    rangingInitiator = self->_rangingInitiator;
    self->_rangingInitiator = v3;
    int v5 = v3;

    [(CURangingSession *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CURangingSession *)v5 setLabel:@"RPPeople"];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009B660;
    v12[3] = &unk_1001247D0;
    v12[4] = v5;
    void v12[5] = self;
    [(CURangingSession *)v5 setMeasurementHandlerEx:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009B680;
    v11[3] = &unk_100121158;
    void v11[4] = self;
    [(CURangingSession *)v5 setStatusChangedHandler:v11];
    [(CURangingSession *)self->_rangingInitiator activate];
  }
  if (!self->_rangingBLEActionAdvertiser && self->_prefRanging)
  {
    id v6 = objc_alloc_init(off_1001424A8());
    objc_storeStrong((id *)&self->_rangingBLEActionAdvertiser, v6);
    [v6 setAdvertiseRate:50];
    [v6 setDeviceActionType:53];
    [v6 setDispatchQueue:self->_dispatchQueue];
    [v6 setIdentifier:@"1e270a1a-2920-49b6-b076-4b7914bc85e2"];
    [v6 setLabel:@"RPPeople"];
    [v6 setPairSetupDisabled:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009B688;
    v8[3] = &unk_1001222C0;
    id v9 = v6;
    id v10 = self;
    id v7 = v6;
    [v7 activateWithCompletion:v8];
  }
}

- (void)_rangingInitiatorEnsureStopped
{
  if (self->_rangingInitiator)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CURangingSession *)self->_rangingInitiator invalidate];
    rangingInitiator = self->_rangingInitiator;
    self->_rangingInitiator = 0;
  }
  rangingBLEActionAdvertiser = self->_rangingBLEActionAdvertiser;
  if (rangingBLEActionAdvertiser)
  {
    [(SFService *)rangingBLEActionAdvertiser invalidate];
    int v5 = self->_rangingBLEActionAdvertiser;
    self->_rangingBLEActionAdvertiser = 0;
  }
}

- (void)_rangingInitiatorHandlePeer:(id)a3 measurement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 deviceAddress];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10008EB10;
  id v16 = sub_10008EB20;
  id v17 = 0;
  discoveredDevices = self->_discoveredDevices;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009B944;
  v11[3] = &unk_1001247F8;
  void v11[4] = v8;
  void v11[5] = &v12;
  [(NSMutableDictionary *)discoveredDevices enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v10 = v13[5];
  if (v10) {
    [(RPPeopleDaemon *)self _daemonDevice:v10 updatedMeasurement:v7];
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_rangingInitiatorStatusChanged
{
  unint64_t v3 = (unint64_t)[(CURangingSession *)self->_rangingInitiator statusFlags] & 1;
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v9 = v3;
    uint64_t v10 = &unk_10011B017;
    LogPrintF();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_xpcConnections;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) clientPeopleStatusChanged:v3, v9, v10, (void)v11];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_rangingResponderUpdate
{
  if ([(NSMutableDictionary *)self->_rangingBLEActionDevicesActive count])
  {
    [(RPPeopleDaemon *)self _rangingResponderEnsureStarted];
  }
  else
  {
    [(RPPeopleDaemon *)self _rangingResponderEnsureStopped];
  }
}

- (void)_rangingResponderEnsureStarted
{
  rangingResponder = self->_rangingResponder;
  if (!rangingResponder)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = (CURangingSession *)objc_alloc_init((Class)CURangingSession);
    id v5 = self->_rangingResponder;
    self->_rangingResponder = v4;
    id v6 = v4;

    [(CURangingSession *)v6 setDispatchQueue:self->_dispatchQueue];
    [(CURangingSession *)v6 setFlags:1];
    [(CURangingSession *)v6 setLabel:@"RPPeople"];
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009BCE0;
  v9[3] = &unk_100124820;
  v9[4] = v7;
  [(NSMutableDictionary *)rangingBLEActionDevicesActive enumerateKeysAndObjectsUsingBlock:v9];
  [(CURangingSession *)self->_rangingResponder setPeers:v7];
  if (!rangingResponder) {
    [(CURangingSession *)self->_rangingResponder activate];
  }
}

- (void)_rangingResponderEnsureStopped
{
  if (self->_rangingResponder)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CURangingSession *)self->_rangingResponder invalidate];
    rangingResponder = self->_rangingResponder;
    self->_rangingResponder = 0;
  }
}

- (void)_rangingResponderUpdateForAirDropChange
{
  int airdropMode = self->_airdropMode;
  if (airdropMode != 3)
  {
    if (airdropMode != 2)
    {
      if (airdropMode == 1 && [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive count])
      {
        rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
        if (!rangingBLEActionDevicesOther)
        {
          id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v6 = self->_rangingBLEActionDevicesOther;
          self->_rangingBLEActionDevicesOther = v5;

          rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
        }
        [(NSMutableDictionary *)rangingBLEActionDevicesOther addEntriesFromDictionary:self->_rangingBLEActionDevicesActive];
        [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive removeAllObjects];
        int v7 = 1;
      }
      else
      {
        int v7 = 0;
      }
      goto LABEL_49;
    }
    goto LABEL_22;
  }
  if (!self->_prefPeopleStrangers)
  {
LABEL_22:
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v19 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive allKeys];
    id v20 = [v19 countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v20)
    {
      id v21 = v20;
      char v22 = 0;
      uint64_t v23 = *(void *)v58;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v58 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          int v26 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive objectForKeyedSubscript:v25];
          if (([v26 deviceFlags] & 0x444E) == 0)
          {
            [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive setObject:0 forKeyedSubscript:v25];
            long long v27 = self->_rangingBLEActionDevicesOther;
            if (!v27)
            {
              id v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              uint64_t v29 = self->_rangingBLEActionDevicesOther;
              self->_rangingBLEActionDevicesOther = v28;

              long long v27 = self->_rangingBLEActionDevicesOther;
            }
            [(NSMutableDictionary *)v27 setObject:v26 forKeyedSubscript:v25];
            char v22 = 1;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v21);
    }
    else
    {
      char v22 = 0;
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    int v30 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther allKeys];
    id v31 = [v30 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v54;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
          int v36 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther objectForKeyedSubscript:v35];
          if (([v36 deviceFlags] & 0x444E) != 0)
          {
            [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther setObject:0 forKeyedSubscript:v35];
            rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
            if (!rangingBLEActionDevicesActive)
            {
              int v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              uint64_t v39 = self->_rangingBLEActionDevicesActive;
              self->_rangingBLEActionDevicesActive = v38;

              rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
            }
            [(NSMutableDictionary *)rangingBLEActionDevicesActive setObject:v36 forKeyedSubscript:v35];
            char v22 = 1;
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v32);
    }

    int v7 = v22 & 1;
    goto LABEL_49;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v8 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v9)
  {
    id v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v50;
    do
    {
      for (k = 0; k != v10; k = (char *)k + 1)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * (void)k);
        id v15 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther objectForKeyedSubscript:v14];
        if (([v15 deviceFlags] & 0x444E) == 0)
        {
          [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther setObject:0 forKeyedSubscript:v14];
          id v16 = self->_rangingBLEActionDevicesActive;
          if (!v16)
          {
            id v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v18 = self->_rangingBLEActionDevicesActive;
            self->_rangingBLEActionDevicesActive = v17;

            id v16 = self->_rangingBLEActionDevicesActive;
          }
          [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v14];
          char v11 = 1;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  int v7 = v11 & 1;
LABEL_49:
  if (dword_100142410 > 30 || dword_100142410 == -1 && !_LogCategory_Initialize())
  {
    if (!v7) {
      return;
    }
    goto LABEL_55;
  }
  unsigned int v40 = self->_airdropMode - 1;
  if (v40 > 2) {
    id v41 = "?";
  }
  else {
    id v41 = (&off_100124920)[v40];
  }
  id v42 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesActive count];
  id v43 = [(NSMutableDictionary *)self->_rangingBLEActionDevicesOther count];
  unsigned __int8 v44 = "no";
  if (v7) {
    unsigned __int8 v44 = "yes";
  }
  id v47 = v43;
  long long v48 = v44;
  uint64_t v45 = v41;
  id v46 = v42;
  LogPrintF();
  if (v7) {
LABEL_55:
  }
    [(RPPeopleDaemon *)self _rangingResponderUpdate];
}

- (void)_rangingRemoveDevice:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    id v8 = v4;
    id v5 = [(NSMutableSet *)self->_rangingCapableDevices count];
    [(NSMutableSet *)self->_rangingCapableDevices removeObject:v8];
    BOOL v6 = [(NSMutableSet *)self->_rangingCapableDevices count] == 0;
    id v4 = v8;
    BOOL v7 = v6;
    if ((((v5 != 0) ^ v7) & 1) == 0)
    {
      [(RPPeopleDaemon *)self _update];
      id v4 = v8;
    }
  }
}

- (void)_rangingUpdateForDevice:(id)a3
{
  id v16 = a3;
  id v4 = [v16 identifier];
  if (v4)
  {
    id v5 = [(NSMutableSet *)self->_rangingCapableDevices count];
    if (((unsigned __int16)[v16 flags] & 0x24D) != 0 || (self->_discoveryFlagsAggregate & 0x400) != 0)
    {
      rangingCapableDevices = self->_rangingCapableDevices;
      if (!rangingCapableDevices)
      {
        BOOL v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        id v8 = self->_rangingCapableDevices;
        self->_rangingCapableDevices = v7;

        rangingCapableDevices = self->_rangingCapableDevices;
      }
      [(NSMutableSet *)rangingCapableDevices addObject:v4];
      rangingInitiator = self->_rangingInitiator;
      if (rangingInitiator)
      {
        id v10 = rangingInitiator;
        char v11 = [v16 bleDevice];
        uint64_t v12 = [v11 bleDevice];
        long long v13 = [v12 advertisementFields];
        id v14 = objc_alloc_init((Class)CURangingSample);
        [v14 setChannel:CFDictionaryGetInt64Ranged()];
        CFDataGetTypeID();
        [v14 setDeviceAddress:CFDictionaryGetTypedValue()];
        id v15 = [v11 model];
        [v14 setDeviceModel:v15];

        [v14 setRawRSSI:[v12 rssi]];
        [(CURangingSession *)v10 addSample:v14];
      }
    }
    else
    {
      [(NSMutableSet *)self->_rangingCapableDevices removeObject:v4];
    }
    if ((v5 != 0) == ([(NSMutableSet *)self->_rangingCapableDevices count] == 0)) {
      [(RPPeopleDaemon *)self _update];
    }
  }
}

- (void)_bufferCloudMessage:(id)a3 frameType:(unsigned __int8)a4 msgCtx:(id)a5
{
  uint64_t v6 = a4;
  id v13 = a3;
  id v8 = a5;
  if ((unint64_t)[(NSMutableArray *)self->_bufferedCloudMessages count] < 0x64)
  {
    id v9 = objc_alloc_init(RPBufferedCloudMessage);
    [(RPBufferedCloudMessage *)v9 setFrameType:v6];
    [(RPBufferedCloudMessage *)v9 setMessage:v13];
    [(RPBufferedCloudMessage *)v9 setMsgCtx:v8];
    bufferedCloudMessages = self->_bufferedCloudMessages;
    if (!bufferedCloudMessages)
    {
      char v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      uint64_t v12 = self->_bufferedCloudMessages;
      self->_bufferedCloudMessages = v11;

      bufferedCloudMessages = self->_bufferedCloudMessages;
    }
    [(NSMutableArray *)bufferedCloudMessages addObject:v9];
    goto LABEL_10;
  }
  if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    id v9 = [v8 appleID];
    LogPrintF();
LABEL_10:
  }
}

- (void)_processBufferedCloudMessages
{
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked]
    && self->_familyAccountIdentityMap
    && [(NSMutableArray *)self->_bufferedCloudMessages count])
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v15 = (unint64_t)[(NSMutableArray *)self->_bufferedCloudMessages count];
      LogPrintF();
    }
    unint64_t v3 = self->_bufferedCloudMessages;
    bufferedCloudMessages = self->_bufferedCloudMessages;
    self->_bufferedCloudMessages = 0;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
          int v11 = [v10 frameType:v15];
          if (v11 > 63)
          {
            switch(v11)
            {
              case '@':
                uint64_t v12 = [v10 message];
                id v13 = [v10 msgCtx];
                [(RPPeopleDaemon *)self receivedFriendIdentityRequest:v12 msgCtx:v13];
                goto LABEL_26;
              case 'A':
                uint64_t v12 = [v10 message];
                id v13 = [v10 msgCtx];
                [(RPPeopleDaemon *)self receivedFriendIdentityResponse:v12 msgCtx:v13];
                goto LABEL_26;
              case 'B':
                uint64_t v12 = [v10 message];
                id v13 = [v10 msgCtx];
                [(RPPeopleDaemon *)self receivedFriendIdentityUpdate:v12 msgCtx:v13];
                goto LABEL_26;
            }
          }
          else
          {
            switch(v11)
            {
              case ' ':
                uint64_t v12 = [v10 message];
                id v13 = [v10 msgCtx];
                [(RPPeopleDaemon *)self receivedFamilyIdentityRequest:v12 msgCtx:v13];
                goto LABEL_26;
              case '!':
                uint64_t v12 = [v10 message];
                id v13 = [v10 msgCtx];
                [(RPPeopleDaemon *)self receivedFamilyIdentityResponse:v12 msgCtx:v13];
                goto LABEL_26;
              case '""':
                uint64_t v12 = [v10 message];
                id v13 = [v10 msgCtx];
                [(RPPeopleDaemon *)self receivedFamilyIdentityUpdate:v12 msgCtx:v13];
LABEL_26:

                goto LABEL_27;
            }
          }
          if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
          {
            unint64_t v15 = [v10 frameType];
            LogPrintF();
          }
LABEL_27:
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        id v7 = v14;
      }
      while (v14);
    }
  }
}

- (BOOL)_sendCloudIdentityFrameType:(unsigned __int8)a3 destinationID:(id)a4 flags:(unsigned int)a5 msgCtx:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a6;
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v13 addSelfIdentityInfoToMessage:v12 flags:v7];

  id v14 = +[RPCloudDaemon sharedCloudDaemon];
  unint64_t v15 = [v14 idsDeviceIDSelf];

  if (v15) {
    [v12 setObject:v15 forKeyedSubscript:@"_idsID"];
  }

  long long v16 = +[RPCloudDaemon sharedCloudDaemon];
  unsigned __int8 v17 = [v16 sendIDSMessage:v12 cloudServiceID:@"com.apple.private.alloy.nearby" frameType:v8 destinationID:v10 sendFlags:0 msgCtx:v11 error:0];

  return v17;
}

- (unsigned)_updateIdentityType:(int)a3 idsDeviceID:(id)a4 appleID:(id)a5 contactID:(id)a6 msg:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v10 == 4)
  {
    uint64_t v16 = 120;
    goto LABEL_5;
  }
  if (v10 == 6)
  {
    uint64_t v16 = 168;
LABEL_5:
    location = (id *)((char *)&self->super.isa + v16);
    long long v78 = self;
    id v79 = *(id *)((char *)&self->super.isa + v16);
    uint64_t v17 = [v79 objectForKeyedSubscript:v12];
    long long v80 = v14;
    if (v17)
    {
      id v18 = (id)v17;
      unsigned int v19 = 0;
    }
    else
    {
      id v18 = objc_alloc_init((Class)RPIdentity);
      [v18 setIdentifier:v12];
      [v18 setType:v10];
      unsigned int v19 = 2048;
    }
    if ([v13 length])
    {
      id v20 = [v18 accountID];
      id v21 = v13;
      char v22 = v21;
      if (v20 == v21)
      {

        goto LABEL_19;
      }
      if ((v21 != 0) == (v20 == 0))
      {
      }
      else
      {
        unsigned __int8 v23 = [v20 isEqual:v21];

        if (v23) {
          goto LABEL_19;
        }
      }
      [v18 setAccountID:v22];
      v19 |= 0x2000u;
    }
LABEL_19:
    if (![v80 length]) {
      goto LABEL_27;
    }
    id v24 = [v18 contactID];
    id v25 = v80;
    int v26 = v25;
    if (v24 == v25)
    {

      goto LABEL_27;
    }
    if ((v25 != 0) == (v24 == 0))
    {
    }
    else
    {
      unsigned __int8 v27 = [v24 isEqual:v25];

      if (v27)
      {
LABEL_27:
        id v28 = CFDictionaryGetCFDataOfLength();
        id v81 = v13;
        if (!v28) {
          goto LABEL_35;
        }
        id v29 = [v18 deviceIRKData];
        id v30 = v28;
        id v31 = v30;
        if (v29 == v30)
        {

          goto LABEL_35;
        }
        if (v29)
        {
          unsigned __int8 v32 = [v29 isEqual:v30];

          if (v32)
          {
LABEL_35:

            uint64_t v33 = CFDictionaryGetCFDataOfLength();
            if (!v33) {
              goto LABEL_43;
            }
            id v34 = [v18 edPKData];
            id v35 = v33;
            int v36 = v35;
            if (v34 == v35)
            {

              goto LABEL_43;
            }
            if (v34)
            {
              unsigned __int8 v37 = [v34 isEqual:v35];

              if (v37)
              {
LABEL_43:

                int v38 = NSDictionaryGetNSNumber();
                if (!v38) {
                  goto LABEL_51;
                }
                +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 featureFlags]);
                id v39 = (id)objc_claimAutoreleasedReturnValue();
                id v40 = v38;
                id v41 = v40;
                if (v39 == v40)
                {

                  goto LABEL_51;
                }
                if (v39)
                {
                  unsigned __int8 v42 = [v39 isEqual:v40];

                  if (v42)
                  {
LABEL_51:

                    [v18 idsDeviceID:v73, v74, v75, v76];
                    id v43 = (id)objc_claimAutoreleasedReturnValue();
                    id v44 = v12;
                    uint64_t v45 = v44;
                    if (v43 == v44)
                    {
                    }
                    else
                    {
                      if ((v44 != 0) != (v43 == 0))
                      {
                        unsigned __int8 v46 = [v43 isEqual:v44];

                        if (v46) {
                          goto LABEL_58;
                        }
                      }
                      else
                      {
                      }
                      [v18 setIdsDeviceID:v45];
                      v19 |= 0x40u;
                    }
LABEL_58:
                    CFStringGetTypeID();
                    id v47 = CFDictionaryGetTypedValue();
                    long long v48 = v47;
                    if (v47 && [v47 length])
                    {
                      id v49 = [v18 model];
                      id v50 = v48;
                      long long v51 = v50;
                      if (v49 == v50)
                      {
                      }
                      else
                      {
                        if (v49)
                        {
                          unsigned __int8 v52 = [v49 isEqual:v50];

                          if (v52) {
                            goto LABEL_67;
                          }
                        }
                        else
                        {
                        }
                        [v18 setModel:v51];
                        v19 |= 0x80u;
                      }
                    }
LABEL_67:

                    CFStringGetTypeID();
                    long long v53 = CFDictionaryGetTypedValue();
                    long long v54 = v53;
                    if (v53 && [v53 length])
                    {
                      id v55 = [v18 name];
                      id v56 = v54;
                      long long v57 = v56;
                      if (v55 == v56)
                      {

                        goto LABEL_76;
                      }
                      if (v55)
                      {
                        unsigned __int8 v58 = [v55 isEqual:v56];

                        if (v58) {
                          goto LABEL_76;
                        }
                      }
                      else
                      {
                      }
                      [v18 setName:v57];
                      v19 |= 0x100u;
                    }
LABEL_76:

                    long long v59 = CFDictionaryGetCFDataOfLength();
                    if (!v59) {
                      goto LABEL_84;
                    }
                    id v60 = [v18 btIRKData];
                    id v61 = v59;
                    id v62 = v61;
                    if (v60 == v61)
                    {

                      goto LABEL_84;
                    }
                    if (v60)
                    {
                      unsigned __int8 v63 = [v60 isEqual:v61];

                      if (v63)
                      {
LABEL_84:

                        id v64 = CFDictionaryGetCFDataOfLength();
                        if (!v64) {
                          goto LABEL_92;
                        }
                        id v65 = [v18 btAddress];
                        id v66 = v64;
                        uint64_t v67 = v66;
                        if (v65 == v66)
                        {

                          goto LABEL_92;
                        }
                        if (v65)
                        {
                          unsigned __int8 v68 = [v65 isEqual:v66];

                          if (v68)
                          {
LABEL_92:

                            if ((v19 & 0x800) != 0)
                            {
                              long long v69 = v79;
                              id v14 = v80;
                              if (!v79)
                              {
                                id v70 = objc_alloc_init((Class)NSMutableDictionary);
                                objc_storeStrong(location, v70);
                                long long v69 = v70;
                              }
                              id v79 = v69;
                              [v69 setObject:v18 forKeyedSubscript:v45];
                            }
                            else
                            {
                              id v14 = v80;
                              if (!v19) {
                                goto LABEL_99;
                              }
                            }
                            long long v71 = +[RPIdentityDaemon sharedIdentityDaemon];
                            [v71 saveIdentity:v18 error:0];

LABEL_99:
                            id v13 = v81;
                            if (v10 == 4) {
                              [(RPPeopleDaemon *)v78 _updateFamilyNotification];
                            }

                            goto LABEL_104;
                          }
                        }
                        else
                        {
                        }
                        [v18 setBtAddress:v67];
                        v19 |= 0x800000u;
                        goto LABEL_92;
                      }
                    }
                    else
                    {
                    }
                    [v18 setBtIRKData:v62];
                    v19 |= 0x400000u;
                    goto LABEL_84;
                  }
                }
                else
                {
                }
                [v18 setFeatureFlags:objc_msgSend(v41, "unsignedIntegerValue", v73, v74, v75, v76)];
                v19 |= 0x400u;
                goto LABEL_51;
              }
            }
            else
            {
            }
            [v18 setEdPKData:v36, v73, v74, v75, v76, location];
            v19 |= 8u;
            goto LABEL_43;
          }
        }
        else
        {
        }
        [v18 setDeviceIRKData:v31];
        v19 |= 4u;
        goto LABEL_35;
      }
    }
    [v18 setContactID:v26];
    v19 |= 0x8000u;
    goto LABEL_27;
  }
  if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned int v19 = 0;
LABEL_104:

  return v19;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [[RPPeopleXPCConnection alloc] initWithDaemon:self xpcCnx:v5];
  [(RPPeopleXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  uint64_t v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPPeopleXPCDaemonInterface];
  id v11 = objc_alloc((Class)NSSet);
  uint64_t v12 = objc_opt_class();
  id v13 = [v11 initWithObjects:v12, objc_opt_class(), 0];
  [v10 setClasses:v13 forSelector:"xpcPeopleDiscoveryActivate:completion:" argumentIndex:0 ofReply:1];

  [v5 _setQueue:self->_dispatchQueue];
  [v5 setExportedInterface:v10];
  [v5 setExportedObject:v6];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009DB74;
  v16[3] = &unk_1001219D0;
  void v16[4] = self;
  v16[5] = v6;
  [v5 setInvalidationHandler:v16];
  id v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPPeopleXPCClientInterface];
  [v5 setRemoteObjectInterface:v14];

  [v5 resume];
  if (dword_100142410 <= 20 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  [(NSMutableSet *)self->_xpcConnections removeObject:v5];

  [(RPPeopleDaemon *)self _update];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_ptsBurstScanTimer, 0);
  objc_storeStrong((id *)&self->_rangingResponder, 0);
  objc_storeStrong((id *)&self->_rangingInitiator, 0);
  objc_storeStrong((id *)&self->_rangingCapableDevices, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionScanner, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionDevicesOther, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionDevicesActive, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionBurstTimer, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_privacyChangedCoalescer, 0);
  objc_storeStrong((id *)&self->_friendsSuggestedPollTimer, 0);
  objc_storeStrong((id *)&self->_friendsSuggestedArray, 0);
  objc_storeStrong((id *)&self->_friendDeviceIdentityMap, 0);
  objc_storeStrong((id *)&self->_friendAccountIdentityMap, 0);
  objc_storeStrong((id *)&self->_familySyncCheckTimer, 0);
  objc_storeStrong((id *)&self->_familyDeviceIdentityMap, 0);
  objc_storeStrong((id *)&self->_familyAccountIdentityMap, 0);
  objc_storeStrong((id *)&self->_familyMemberMonitor, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_primaryAppleIDCached, 0);
  objc_storeStrong((id *)&self->_discoveryClients, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);

  objc_storeStrong((id *)&self->_bufferedCloudMessages, 0);
}

@end