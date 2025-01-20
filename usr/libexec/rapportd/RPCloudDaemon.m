@interface RPCloudDaemon
+ (id)sharedCloudDaemon;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForID:(SEL)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForSelf;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)idsHasAppleTV;
- (BOOL)idsHasHomePod;
- (BOOL)idsHasMac;
- (BOOL)idsHasRealityDevice;
- (BOOL)idsHasWatch;
- (BOOL)idsHasiPad;
- (BOOL)idsIsSignedIn;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationDevice:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9;
- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationID:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9;
- (IDSService)nearbyIDSService;
- (NSArray)idsDeviceArray;
- (NSDictionary)idsDeviceMap;
- (NSDictionary)idsFamilyEndpointMap;
- (NSString)idsDeviceIDSelf;
- (OS_dispatch_queue)dispatchQueue;
- (RPCloudDaemon)init;
- (id)_idsAccountWithURI:(id)a3 senderID:(id *)a4;
- (id)_idsURIWithID:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)idsCorrelationIdentifier;
- (id)idsDeviceForBluetoothUUID:(id)a3;
- (int)idsHandheldCount;
- (void)_idsEnsureStarted;
- (void)_idsEnsureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)_primaryAppleIDChanged;
- (void)_receivedFamilyIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6;
- (void)_receivedFriendIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6;
- (void)_receivedWatchIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 fromID:(id)a6;
- (void)_receivedWatchIdentityRequest:(id)a3 fromIDSDevice:(id)a4;
- (void)_receivedWatchIdentityResponse:(id)a3 fromIDSDevice:(id)a4;
- (void)_update;
- (void)activate;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)idsFamilyEndpointQueryWithCompletion:(id)a3;
- (void)idsFamilyEndpointsUpdateWithForce:(BOOL)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdsFamilyEndpointMap:(id)a3;
- (void)setNearbyIDSService:(id)a3;
@end

@implementation RPCloudDaemon

+ (id)sharedCloudDaemon
{
  if (qword_100142BA0 != -1) {
    dispatch_once(&qword_100142BA0, &stru_100121130);
  }
  v2 = (void *)qword_100142B98;

  return v2;
}

- (RPCloudDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPCloudDaemon;
  v2 = [(RPCloudDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_prefIsSignedInForce = -1;
    *(void *)&v3->_idsHandheldCountCache = -1;
    *(void *)&v3->_idsHasHomePodCache = -1;
    *(void *)&v3->_idsHasMacCache = -1;
    v3->_idsIsSignedInCache = -1;
    *(void *)&v3->_prefHasAppleTVForce = -1;
    *(void *)&v3->_prefHasiPadForce = -1;
    v3->_prefHasRealityDeviceForce = -1;
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(NSDictionary *)self->_idsFamilyEndpointMap allKeys];
  id v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v26;
    v3 = &stru_100125378;
    do
    {
      v4 = 0;
      v5 = v3;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v4);
        v7 = [(NSDictionary *)self->_idsFamilyEndpointMap objectForKeyedSubscript:v6];
        v8 = [v7 familyEndpointData];
        v9 = [v8 deviceName];
        v10 = [(NSDictionary *)self->_idsFamilyEndpointMap objectForKeyedSubscript:v6];
        v11 = [v10 familyEndpointData];
        v12 = [v11 productVersion];
        v13 = +[NSString stringWithFormat:@"    IDSID: %@, name: %@, productVersion: %@\n", v6, v9, v12];

        v3 = [(__CFString *)v5 stringByAppendingString:v13];

        v4 = (char *)v4 + 1;
        v5 = v3;
      }
      while (v24 != v4);
      id v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v24);
  }
  else
  {
    v3 = &stru_100125378;
  }

  v14 = [(RPCloudDaemon *)self idsDeviceArray];
  [v14 count];
  [(RPCloudDaemon *)self idsIsSignedIn];
  [(RPCloudDaemon *)self idsHasAppleTV];
  [(RPCloudDaemon *)self idsHasHomePod];
  [(RPCloudDaemon *)self idsHasiPad];
  [(RPCloudDaemon *)self idsHasMac];
  [(RPCloudDaemon *)self idsHasWatch];
  [(RPCloudDaemon *)self idsHasRealityDevice];
  [(RPCloudDaemon *)self idsHandheldCount];
  v15 = [(RPCloudDaemon *)self idsFamilyEndpointMap];
  [v15 count];
  NSAppendPrintF();
  id v16 = 0;

  if (a3 <= 20)
  {
    NSAppendPrintF();
    id v17 = v16;

    id v16 = v17;
  }
  id v18 = v16;

  return v18;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007C7C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007EAC;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    [(RPCloudDaemon *)self _idsEnsureStopped];
    [(RPCloudDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  if ((a3 & 0x400) != 0)
  {
    if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCloudDaemon *)self idsFamilyEndpointsUpdateWithForce:1];
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (void)prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  prefHasAppleTVForce = (const char *)self->_prefHasAppleTVForce;
  if (v3 != prefHasAppleTVForce)
  {
    if (dword_100140D18 <= 40)
    {
      if (dword_100140D18 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_6;
        }
        prefHasAppleTVForce = (const char *)self->_prefHasAppleTVForce;
      }
      id v18 = prefHasAppleTVForce;
      v19 = (const char *)v3;
      LogPrintF();
    }
LABEL_6:
    self->_prefHasAppleTVForce = v3;
  }
  BOOL v5 = CFPrefs_GetInt64() != 0;
  prefHasHomePodForce = (const char *)self->_prefHasHomePodForce;
  if (v5 == prefHasHomePodForce) {
    goto LABEL_13;
  }
  if (dword_100140D18 <= 40)
  {
    if (dword_100140D18 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_12;
      }
      prefHasHomePodForce = (const char *)self->_prefHasHomePodForce;
    }
    id v18 = prefHasHomePodForce;
    v19 = (const char *)v5;
    LogPrintF();
  }
LABEL_12:
  self->_prefHasHomePodForce = v5;
LABEL_13:
  BOOL v7 = CFPrefs_GetInt64() != 0;
  prefHasiPadForce = (const char *)self->_prefHasiPadForce;
  if (v7 == prefHasiPadForce) {
    goto LABEL_19;
  }
  if (dword_100140D18 <= 40)
  {
    if (dword_100140D18 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_18;
      }
      prefHasiPadForce = (const char *)self->_prefHasiPadForce;
    }
    id v18 = prefHasiPadForce;
    v19 = (const char *)v7;
    LogPrintF();
  }
LABEL_18:
  self->_prefHasiPadForce = v7;
LABEL_19:
  BOOL v9 = CFPrefs_GetInt64() != 0;
  prefHasMacForce = (const char *)self->_prefHasMacForce;
  if (v9 == prefHasMacForce) {
    goto LABEL_25;
  }
  if (dword_100140D18 <= 40)
  {
    if (dword_100140D18 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_24;
      }
      prefHasMacForce = (const char *)self->_prefHasMacForce;
    }
    id v18 = prefHasMacForce;
    v19 = (const char *)v9;
    LogPrintF();
  }
LABEL_24:
  self->_prefHasMacForce = v9;
LABEL_25:
  BOOL v11 = CFPrefs_GetInt64() != 0;
  prefHasRealityDeviceForce = (const char *)self->_prefHasRealityDeviceForce;
  if (v11 == prefHasRealityDeviceForce) {
    goto LABEL_31;
  }
  if (dword_100140D18 <= 40)
  {
    if (dword_100140D18 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_30;
      }
      prefHasRealityDeviceForce = (const char *)self->_prefHasRealityDeviceForce;
    }
    id v18 = prefHasRealityDeviceForce;
    v19 = (const char *)v11;
    LogPrintF();
  }
LABEL_30:
  self->_prefHasRealityDeviceForce = v11;
LABEL_31:
  BOOL v13 = CFPrefs_GetInt64() != 0;
  if (self->_prefIDSEnabled != v13)
  {
    if (dword_100140D18 <= 40 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      v14 = "yes";
      if (v13) {
        v15 = "no";
      }
      else {
        v15 = "yes";
      }
      if (!v13) {
        v14 = "no";
      }
      id v18 = v15;
      v19 = v14;
      LogPrintF();
    }
    self->_prefIDSEnabled = v13;
  }
  BOOL v16 = CFPrefs_GetInt64() != 0;
  prefIsSignedInForce = (const char *)self->_prefIsSignedInForce;
  if (v16 != prefIsSignedInForce)
  {
    if (dword_100140D18 <= 40)
    {
      if (dword_100140D18 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_47;
        }
        prefIsSignedInForce = (const char *)self->_prefIsSignedInForce;
      }
      id v18 = prefIsSignedInForce;
      v19 = (const char *)v16;
      LogPrintF();
    }
LABEL_47:
    self->_prefIsSignedInForce = v16;
  }
  [(RPCloudDaemon *)self _update];
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
  if (self->_prefIDSEnabled) {
    [(RPCloudDaemon *)self _idsEnsureStarted];
  }
  else {
    [(RPCloudDaemon *)self _idsEnsureStopped];
  }
}

- (void)_primaryAppleIDChanged
{
  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  self->_idsCorrelationIdentifier = 0;
}

- (void)_idsEnsureStarted
{
  if (!self->_nearbyIDSService)
  {
    if (dword_100140D18 <= 40 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.nearby"];
    nearbyIDSService = self->_nearbyIDSService;
    self->_nearbyIDSService = v3;

    dispatchQueue = self->_dispatchQueue;
    BOOL v5 = self->_nearbyIDSService;
    [(IDSService *)v5 addDelegate:self queue:dispatchQueue];
  }
}

- (void)_idsEnsureStopped
{
  if (self->_nearbyIDSService)
  {
    if (dword_100140D18 <= 40 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [self->_nearbyIDSService removeDelegate:self];
    nearbyIDSService = self->_nearbyIDSService;
    self->_nearbyIDSService = 0;
  }
  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  self->_idsCorrelationIdentifier = 0;
}

- (id)_idsAccountWithURI:(id)a3 senderID:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)IDSCopyRawAddressForDestination();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v8 = [self->_nearbyIDSService accounts];
  id v9 = [v8 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v60;
    v44 = a4;
    id v46 = v6;
    uint64_t v40 = *(void *)v60;
    v42 = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if ([v13 canSend])
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v14 = [v13 aliasStrings];
          id v15 = [v14 countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v56;
            while (2)
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v56 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
                if ([v19 isEqual:v7])
                {
                  if (v44)
                  {
                    uint64_t v33 = [(RPCloudDaemon *)v42 _idsURIWithID:v19];
                    id v34 = *v44;
                    id *v44 = (id)v33;
                  }
                  id v32 = v13;
                  goto LABEL_40;
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v55 objects:v65 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v40;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v59 objects:v66 count:16];
      a4 = v44;
      id v6 = v46;
      self = v42;
    }
    while (v10);
  }

  if ([v6 _FZIDType] == (id)-1)
  {
    id v32 = 0;
  }
  else
  {
    v8 = IMCanonicalizeFormattedString();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v14 = [self->_nearbyIDSService accounts];
    id v20 = [v14 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v20)
    {
      id v21 = v20;
      v43 = self;
      v45 = a4;
      id v46 = v6;
      uint64_t v22 = *(void *)v52;
      uint64_t v38 = *(void *)v52;
      do
      {
        v23 = 0;
        id v39 = v21;
        do
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v14);
          }
          id v24 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v23);
          if (objc_msgSend(v24, "canSend", v38))
          {
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            v41 = v24;
            long long v25 = [v24 aliasStrings];
            id v26 = [v25 countByEnumeratingWithState:&v47 objects:v63 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v48;
              while (2)
              {
                for (k = 0; k != v27; k = (char *)k + 1)
                {
                  if (*(void *)v48 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * (void)k);
                  v31 = IMCanonicalizeFormattedString();
                  if ([v31 isEqual:v8])
                  {
                    if (v45)
                    {
                      uint64_t v36 = [(RPCloudDaemon *)v43 _idsURIWithID:v30];
                      id v37 = *v45;
                      id *v45 = (id)v36;
                    }
                    id v32 = v41;

                    goto LABEL_40;
                  }
                }
                id v27 = [v25 countByEnumeratingWithState:&v47 objects:v63 count:16];
                if (v27) {
                  continue;
                }
                break;
              }
            }

            uint64_t v22 = v38;
            id v21 = v39;
          }
          v23 = (char *)v23 + 1;
        }
        while (v23 != v21);
        id v21 = [v14 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v21);
      id v32 = 0;
LABEL_40:
      id v6 = v46;
    }
    else
    {
      id v32 = 0;
    }
  }

  return v32;
}

- (id)idsCorrelationIdentifier
{
  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  if (!idsCorrelationIdentifier)
  {
    if (self->_idQueryInProgress)
    {
      idsCorrelationIdentifier = 0;
    }
    else
    {
      v4 = [(CUSystemMonitor *)self->_systemMonitor primaryAppleID];
      BOOL v5 = [v4 _bestGuessURI];
      if (v5)
      {
        id v6 = +[NSArray arrayWithObject:v5];
        BOOL v7 = +[IDSIDQueryController sharedInstance];
        dispatchQueue = self->_dispatchQueue;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100008BF0;
        v10[3] = &unk_100121180;
        v10[4] = self;
        v10[5] = v4;
        [v7 currentRemoteDevicesForDestinations:v6 service:@"com.apple.private.alloy.nearby" listenerID:@"com.apple.private.alloy.nearby" queue:dispatchQueue completionBlock:v10];
        self->_idQueryInProgress = 1;
      }
      idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
    }
  }

  return idsCorrelationIdentifier;
}

- (NSArray)idsDeviceArray
{
  v2 = self;
  objc_sync_enter(v2);
  idsDeviceArray = v2->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = [v2->_nearbyIDSService devices];
    BOOL v5 = v2->_idsDeviceArray;
    v2->_idsDeviceArray = (NSArray *)v4;

    idsDeviceArray = v2->_idsDeviceArray;
  }
  id v6 = idsDeviceArray;
  objc_sync_exit(v2);

  return v6;
}

- (id)idsDeviceForBluetoothUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(RPCloudDaemon *)v5 idsDeviceArray];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 nsuuid];
        unsigned __int8 v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);

  return v7;
}

- (NSString)idsDeviceIDSelf
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_idsDeviceIDSelf;
  if (!v3)
  {
    BOOL v3 = (NSString *)IDSCopyLocalDeviceUniqueID();
    if (v3)
    {
      objc_storeStrong((id *)&v2->_idsDeviceIDSelf, v3);
    }
    else
    {
      if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v3 = 0;
    }
  }
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)idsDeviceMap
{
  v2 = self;
  objc_sync_enter(v2);
  idsDeviceMap = v2->_idsDeviceMap;
  if (idsDeviceMap)
  {
LABEL_13:
    long long v14 = idsDeviceMap;
    goto LABEL_14;
  }
  id v4 = [(RPCloudDaemon *)v2 idsDeviceArray];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v10 uniqueIDOverride:v16];
          if (v11) {
            [v5 setObject:v10 forKeyedSubscript:v11];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    unsigned __int8 v12 = (NSDictionary *)[v5 copy];
    BOOL v13 = v2->_idsDeviceMap;
    v2->_idsDeviceMap = v12;

    idsDeviceMap = v2->_idsDeviceMap;
    goto LABEL_13;
  }
  long long v14 = 0;
LABEL_14:
  objc_sync_exit(v2);

  return v14;
}

- (void)idsFamilyEndpointQueryWithCompletion:(id)a3
{
  id v8 = a3;
  id v4 = +[RPPeopleDaemon sharedPeopleDaemon];
  id v5 = [v4 getFamilyURIs];

  id v6 = +[IDSIDQueryController sharedInstance];
  id v7 = +[IDSIDInfoOptions refreshIDInfo];
  if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v6 idInfoForDestinations:v5 service:@"com.apple.private.alloy.nearby.family" infoTypes:1 options:v7 listenerID:@"com.apple.private.alloy.nearby" queue:self->_dispatchQueue completionBlock:v8];
}

- (void)setIdsFamilyEndpointMap:(id)a3
{
  id v4 = (NSDictionary *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsFamilyEndpointMap = self->_idsFamilyEndpointMap;
  self->_idsFamilyEndpointMap = v4;
}

- (NSDictionary)idsFamilyEndpointMap
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsFamilyEndpointMap = self->_idsFamilyEndpointMap;

  return idsFamilyEndpointMap;
}

- (void)idsFamilyEndpointsUpdateWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSDate date];
  id v6 = v5;
  if (self->_lastFamilyQueryDate)
  {
    [v5 timeIntervalSinceDate:];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  if ([(RPCloudDaemon *)self getDeviceClass] == 4
    && !self->_idQueryInProgress
    && (v3 || v8 == 0.0 || v8 > 300.0))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009684;
    v9[3] = &unk_1001211A8;
    v9[4] = self;
    [(RPCloudDaemon *)self idsFamilyEndpointQueryWithCompletion:v9];
    self->_idQueryInProgress = 1;
  }
}

- (int)idsHandheldCount
{
  v2 = self;
  objc_sync_enter(v2);
  int idsHandheldCountCache = v2->_idsHandheldCountCache;
  if (idsHandheldCountCache < 0 && v2->_nearbyIDSService)
  {
    v2->_int idsHandheldCountCache = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(RPCloudDaemon *)v2 idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) modelIdentifier];
          BOOL v9 = GestaltProductTypeStringToDeviceClass() - 4 < 0xFFFFFFFD;

          if (!v9) {
            ++v2->_idsHandheldCountCache;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    int idsHandheldCountCache = v2->_idsHandheldCountCache;
  }
  objc_sync_exit(v2);

  return idsHandheldCountCache;
}

- (BOOL)idsHasAppleTV
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasAppleTVForce = v2->_prefHasAppleTVForce;
  if (prefHasAppleTVForce < 0)
  {
    if (v2->_idsHasAppleTVCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasAppleTVCache = 0;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [(RPCloudDaemon *)v2 idsDeviceArray];
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) modelIdentifier];
            unsigned __int8 v10 = [v9 hasPrefix:@"AppleTV"];

            if (v10)
            {
              v2->_idsHasAppleTVCache = 1;
              goto LABEL_15;
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    BOOL v4 = v2->_idsHasAppleTVCache > 0;
  }
  else
  {
    BOOL v4 = prefHasAppleTVForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasHomePod
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasHomePodForce = v2->_prefHasHomePodForce;
  if (prefHasHomePodForce < 0)
  {
    if (v2->_idsHasHomePodCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasHomePodCache = 0;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = [(RPCloudDaemon *)v2 idsDeviceArray];
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v12;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) modelIdentifier];
            if (([v9 hasPrefix:@"AudioAccessory1,"] & 1) != 0
              || ([v9 hasPrefix:@"AudioAccessory5,"] & 1) != 0
              || ([v9 hasPrefix:@"AudioAccessory6,"] & 1) != 0
              || ([v9 hasPrefix:@"HomePod"] & 1) != 0)
            {

              v2->_idsHasHomePodCache = 1;
              goto LABEL_18;
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
    BOOL v4 = v2->_idsHasHomePodCache > 0;
  }
  else
  {
    BOOL v4 = prefHasHomePodForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasiPad
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasiPadForce = v2->_prefHasiPadForce;
  if (prefHasiPadForce < 0)
  {
    if (v2->_idsHasiPadCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasiPadCache = 0;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [(RPCloudDaemon *)v2 idsDeviceArray];
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) modelIdentifier];
            unsigned __int8 v10 = [v9 hasPrefix:@"iPad"];

            if (v10)
            {
              v2->_idsHasiPadCache = 1;
              goto LABEL_15;
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    BOOL v4 = v2->_idsHasiPadCache > 0;
  }
  else
  {
    BOOL v4 = prefHasiPadForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasMac
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasMacForce = v2->_prefHasMacForce;
  if (prefHasMacForce < 0)
  {
    if (v2->_idsHasMacCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasMacCache = 0;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [(RPCloudDaemon *)v2 idsDeviceArray];
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) modelIdentifier];
            unsigned __int8 v10 = [v9 containsString:@"Mac"];

            if (v10)
            {
              v2->_idsHasMacCache = 1;
              goto LABEL_15;
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    BOOL v4 = v2->_idsHasMacCache > 0;
  }
  else
  {
    BOOL v4 = prefHasMacForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasRealityDevice
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasRealityDeviceForce = v2->_prefHasRealityDeviceForce;
  if (prefHasRealityDeviceForce < 0)
  {
    if (v2->_idsHasRealityDeviceCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasRealityDeviceCache = 0;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [(RPCloudDaemon *)v2 idsDeviceArray];
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) modelIdentifier];
            unsigned __int8 v10 = [v9 hasPrefix:@"RealityDevice"];

            if (v10)
            {
              v2->_idsHasRealityDeviceCache = 1;
              goto LABEL_15;
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    BOOL v4 = v2->_idsHasRealityDeviceCache > 0;
  }
  else
  {
    BOOL v4 = prefHasRealityDeviceForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsIsSignedIn
{
  v2 = self;
  objc_sync_enter(v2);
  int prefIsSignedInForce = v2->_prefIsSignedInForce;
  if (prefIsSignedInForce < 0)
  {
    if (v2->_idsIsSignedInCache < 0)
    {
      nearbyIDSService = v2->_nearbyIDSService;
      if (nearbyIDSService)
      {
        v2->_idsIsSignedInCache = 0;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v6 = [nearbyIDSService accounts];
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v12;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v12 != v8) {
                objc_enumerationMutation(v6);
              }
              if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isActive])
              {
                v2->_idsIsSignedInCache = 1;
                goto LABEL_15;
              }
            }
            id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_15:
      }
    }
    BOOL v4 = v2->_idsIsSignedInCache > 0;
  }
  else
  {
    BOOL v4 = prefIsSignedInForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasWatch
{
  if (![(RPCloudDaemon *)self idsIsSignedIn]) {
    return 0;
  }
  BOOL v3 = self;
  objc_sync_enter(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(RPCloudDaemon *)v3 idsDeviceArray];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) modelIdentifier];
        unsigned __int8 v9 = [v8 hasPrefix:@"Watch"];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  objc_sync_exit(v3);
  return v10;
}

- (id)_idsURIWithID:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 _FZIDType] == (id)-1)
    {
      uint64_t v6 = [v4 _bestGuessURI];
      id v7 = (void *)v6;
      if (v6) {
        id v8 = (void *)v6;
      }
      else {
        id v8 = v4;
      }
      id v5 = v8;
    }
    else
    {
      id v5 = v4;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v28 = a5;
  id v11 = a6;
  id v12 = a7;
  dispatchQueue = self->_dispatchQueue;
  long long v14 = (IDSService *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  long long v15 = (char *)[v28 length];
  nearbyIDSService = self->_nearbyIDSService;

  if (nearbyIDSService == v14)
  {
    long long v17 = @"com.apple.private.alloy.nearby";
    long long v18 = (unsigned __int8 *)[v28 bytes];
    long long v19 = v15 - 4;
    if ((unint64_t)v15 < 4)
    {
      if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    id v20 = v18;
    unint64_t v21 = ((unint64_t)v18[1] << 16) | ((unint64_t)v18[2] << 8) | v18[3];
    if ((unint64_t)v19 < v21)
    {
      if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_15;
      }
LABEL_12:
      LogPrintF();
      goto LABEL_15;
    }
    uint64_t v22 = objc_alloc_init(RPCloudMessageContext);
    [(RPCloudMessageContext *)v22 setCloudServiceID:v17];
    [(RPCloudMessageContext *)v22 setFromID:v11];
    v23 = [v12 toID];
    [(RPCloudMessageContext *)v22 setToID:v23];

    uint64_t v24 = *v20;
    if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      long long v25 = [(RPCloudMessageContext *)v22 toID];
      LogPrintF();
    }
    char v26 = v24 - 32;
    if ((v24 - 32) <= 0x21)
    {
      id v27 = v20 + 4;
      if (((1 << v26) & 7) != 0)
      {
        [(RPCloudDaemon *)self _receivedFamilyIdentityFrameType:v24 ptr:v27 length:v21 msgCtx:v22];
        goto LABEL_38;
      }
      if (((1 << v26) & 0x30000) != 0)
      {
        [(RPCloudDaemon *)self _receivedWatchIdentityFrameType:v24 ptr:v27 length:v21 fromID:v11];
        goto LABEL_38;
      }
      if (((1 << v26) & 0x300000000) != 0)
      {
        [(RPCloudDaemon *)self _receivedFriendIdentityFrameType:v24 ptr:v27 length:v21 msgCtx:v22];
LABEL_38:

        goto LABEL_15;
      }
    }
    if (v24 != 1 && dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      sub_10000AE3C(v24);
      LogPrintF();
    }
    goto LABEL_38;
  }
  if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  long long v17 = 0;
LABEL_15:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v17 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  if (v15 || !a6)
  {
    if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      goto LABEL_8;
    }
  }
  else if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
LABEL_8:
    LogPrintF();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
    [v6 count];
    LogPrintF();
  }
  id v7 = self;
  objc_sync_enter(v7);
  idsDeviceArray = v7->_idsDeviceArray;
  v7->_idsDeviceArray = 0;

  idsDeviceMap = v7->_idsDeviceMap;
  v7->_idsDeviceMap = 0;

  v7->_idsIsSignedInCache = -1;
  *(void *)&v7->_idsHasHomePodCache = -1;
  *(void *)&v7->_idsHasMacCache = -1;
  *(void *)&v7->_int idsHandheldCountCache = -1;
  objc_sync_exit(v7);

  id v10 = +[RPDaemon sharedDaemon];
  [v10 postDaemonInfoChanges:1];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
    [v7 count];
    LogPrintF();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v18 = v8;
          if (dword_100140D18 <= 90)
          {
            if (dword_100140D18 != -1 || (long long v18 = v8, _LogCategory_Initialize()))
            {
              LogPrintF();
              long long v18 = v8;
            }
          }
          goto LABEL_18;
        }
      }
      id v10 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v13 = (NSArray *)[v8 copy];
  id v14 = self;
  objc_sync_enter(v14);
  idsDeviceArray = v14->_idsDeviceArray;
  v14->_idsDeviceArray = v13;
  id v16 = v13;

  idsDeviceMap = v14->_idsDeviceMap;
  v14->_idsDeviceMap = 0;

  v14->_idsIsSignedInCache = -1;
  *(void *)&v14->_idsHasHomePodCache = -1;
  *(void *)&v14->_idsHasMacCache = -1;
  *(void *)&v14->_int idsHandheldCountCache = -1;
  objc_sync_exit(v14);

  long long v18 = +[RPDaemon sharedDaemon];

  [v18 postDaemonInfoChanges:1];
LABEL_18:
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (dword_100140D18 <= 30)
  {
    id v6 = v3;
    if (dword_100140D18 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      BOOL v4 = v6;
    }
  }
}

- (void)_receivedFamilyIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6
{
  int v6 = a3;
  id v7 = a6;
  id v8 = [v7 fromID];
  id v9 = (void *)OPACKDecodeBytes();
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)IDSCopyRawAddressForDestination();
      uint64_t v11 = v10;
      if (v10)
      {
        if ([v10 _appearsToBePhoneNumber]) {
          CUNormalizePhoneNumber();
        }
        else {
        id v12 = CUNormalizeEmailAddress();
        }
        [v7 setAppleID:v12];

        switch(v6)
        {
          case '""':
            id v13 = +[RPPeopleDaemon sharedPeopleDaemon];
            [v13 receivedFamilyIdentityUpdate:v9 msgCtx:v7];
            goto LABEL_26;
          case '!':
            id v13 = +[RPPeopleDaemon sharedPeopleDaemon];
            [v13 receivedFamilyIdentityResponse:v9 msgCtx:v7];
            goto LABEL_26;
          case ' ':
            id v13 = +[RPPeopleDaemon sharedPeopleDaemon];
            [v13 receivedFamilyIdentityRequest:v9 msgCtx:v7];
LABEL_26:

LABEL_34:
            goto LABEL_36;
        }
        if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_34;
        }
        sub_10000AE3C(v6);
      }
      else if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_34;
      }
      LogPrintF();
      goto LABEL_34;
    }
    if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
LABEL_35:
    }
      LogPrintF();
  }
  else if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_35;
  }
LABEL_36:
}

- (void)_receivedFriendIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6
{
  int v6 = a3;
  id v7 = a6;
  id v8 = [v7 fromID];
  id v9 = (void *)OPACKDecodeBytes();
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)IDSCopyRawAddressForDestination();
      uint64_t v11 = v10;
      if (v10)
      {
        if ([v10 _appearsToBePhoneNumber]) {
          CUNormalizePhoneNumber();
        }
        else {
        id v12 = CUNormalizeEmailAddress();
        }
        [v7 setAppleID:v12];

        switch(v6)
        {
          case 'B':
            id v13 = +[RPPeopleDaemon sharedPeopleDaemon];
            [v13 receivedFriendIdentityUpdate:v9 msgCtx:v7];
            goto LABEL_26;
          case 'A':
            id v13 = +[RPPeopleDaemon sharedPeopleDaemon];
            [v13 receivedFriendIdentityResponse:v9 msgCtx:v7];
            goto LABEL_26;
          case '@':
            id v13 = +[RPPeopleDaemon sharedPeopleDaemon];
            [v13 receivedFriendIdentityRequest:v9 msgCtx:v7];
LABEL_26:

LABEL_34:
            goto LABEL_36;
        }
        if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_34;
        }
        sub_10000AE3C(v6);
      }
      else if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_34;
      }
      LogPrintF();
      goto LABEL_34;
    }
    if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
LABEL_35:
    }
      LogPrintF();
  }
  else if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_35;
  }
LABEL_36:
}

- (void)_receivedWatchIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 fromID:(id)a6
{
  int v6 = a3;
  id v8 = a6;
  if ([v8 hasPrefix:@"device:"])
  {
    id v9 = [(RPCloudDaemon *)self idsDeviceMap];
    id v10 = [v8 substringFromIndex:7];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if (!v11)
    {
      if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_36;
    }
    id v12 = (void *)OPACKDecodeBytes();
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v6 == 49)
        {
          [(RPCloudDaemon *)self _receivedWatchIdentityResponse:v12 fromIDSDevice:v11];
          goto LABEL_35;
        }
        if (v6 == 48)
        {
          [(RPCloudDaemon *)self _receivedWatchIdentityRequest:v12 fromIDSDevice:v11];
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
        if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_35;
        }
        sub_10000AE3C(v6);
      }
      else if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_35;
      }
    }
    else if (dword_100140D18 > 90 || dword_100140D18 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_35;
    }
    LogPrintF();
    goto LABEL_35;
  }
  if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_37:
}

- (void)_receivedWatchIdentityRequest:(id)a3 fromIDSDevice:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    id v7 = [v6 uniqueIDOverride];
    if (v7)
    {
      if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = v7;
        LogPrintF();
      }
      id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v8 saveIdentityWithIDSDeviceID:v7 message:v12 error:0];

      id v9 = objc_alloc_init((Class)NSMutableDictionary);
      id v10 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v10 addSelfIdentityInfoToMessage:v9 flags:0];

      [(RPCloudDaemon *)self sendIDSMessage:v9 cloudServiceID:@"com.apple.private.alloy.nearby" frameType:49 destinationDevice:v6 sendFlags:1 msgCtx:0 error:0];
    }
    else if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_receivedWatchIdentityResponse:(id)a3 fromIDSDevice:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    id v7 = [v6 uniqueIDOverride];
    if (v7)
    {
      if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
      {
        id v9 = v7;
        LogPrintF();
      }
      id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v8 saveIdentityWithIDSDeviceID:v7 message:v10 error:0];
    }
    else if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_100140D18 <= 60 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationDevice:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  long long v19 = (void *)IDSCopyIDForDevice();
  if (v19)
  {
    BOOL v20 = [(RPCloudDaemon *)self sendIDSMessage:v15 cloudServiceID:v16 frameType:v12 destinationID:v19 sendFlags:v10 msgCtx:v18 error:a9];
  }
  else
  {
    long long v21 = RPErrorF();
    if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a9) {
      *a9 = v21;
    }

    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationID:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9
{
  char v10 = a7;
  id v14 = a4;
  id v15 = (__CFString *)a6;
  id v16 = a8;
  int v49 = 0;
  Data = (void *)OPACKEncoderCreateData();
  id v18 = Data;
  if (Data)
  {
    id v42 = v14;
    v48[0] = a5;
    id v19 = [Data length];
    v48[1] = BYTE2(v19);
    v48[2] = BYTE1(v19);
    v48[3] = (_BYTE)v19;
    id v20 = objc_alloc_init((Class)NSMutableData);
    [v20 appendBytes:v48 length:4];
    [v20 appendData:v18];
    id v21 = objc_alloc_init((Class)NSMutableDictionary);
    long long v22 = v21;
    if (v10)
    {
      [v21 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
      [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionRequireBluetoothKey];
    }
    uint64_t v23 = IDSSendMessageOptionFromIDKey;
    uint64_t v24 = [v16 toID];
    if (v24)
    {
      [v22 setObject:v24 forKeyedSubscript:v23];
      long long v25 = [(RPCloudDaemon *)self _idsAccountWithURI:v24 senderID:0];

      id v14 = v42;
      if (v25) {
        goto LABEL_16;
      }
    }
    else
    {

      id v14 = v42;
    }
    id v27 = [v16 sendersKnownAlias];
    uint64_t v47 = [(RPCloudDaemon *)self _idsURIWithID:v27];

    id v28 = (void *)v47;
    if (v47)
    {
      long long v25 = [(RPCloudDaemon *)self _idsAccountWithURI:v47 senderID:&v47];
      id v28 = (void *)v47;
      if (v25)
      {
        [v22 setObject:v47 forKeyedSubscript:v23];
        id v28 = (void *)v47;
      }
    }
    else
    {
      long long v25 = 0;
    }

LABEL_16:
    if ([v16 nonWakingRequest]) {
      [v22 setObject:&off_10012B030 forKeyedSubscript:IDSSendMessageOptionPushPriorityKey];
    }
    if (![v14 isEqual:@"com.apple.private.alloy.nearby"]
      || (v29 = self->_nearbyIDSService) == 0)
    {
      RPErrorF();
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (a9)
      {
        id v30 = v30;
        BOOL v33 = 0;
        *a9 = v30;
      }
      else
      {
        BOOL v33 = 0;
      }
      goto LABEL_59;
    }
    id v30 = v29;
    id v15 = v15;
    v31 = v15;
    if (([(__CFString *)v15 hasPrefix:@"token:"] & 1) == 0)
    {
      if ([(__CFString *)v15 _appearsToBePhoneNumber])
      {
        uint64_t v32 = IDSCopyIDForPhoneNumber();
LABEL_36:
        v31 = (void *)v32;

        goto LABEL_37;
      }
      v31 = v15;
      if ([(__CFString *)v15 _appearsToBeEmail])
      {
        uint64_t v32 = IDSCopyIDForEmailAddress();
        goto LABEL_36;
      }
    }
LABEL_37:
    if ([v31 isEqual:v15])
    {

      id v15 = @"=";
    }
    uint64_t v40 = v31;
    if (v31)
    {
      id v34 = +[NSSet setWithObject:v31];
      if (v25)
      {
        id v46 = 0;
        v45 = 0;
        unsigned __int8 v35 = [v30 sendData:v20 fromAccount:v25 toDestinations:v34 priority:300 options:v22 identifier:&v46 error:&v45];
        id v39 = v46;
        uint64_t v36 = v45;
      }
      else
      {
        v43 = 0;
        id v44 = 0;
        unsigned __int8 v35 = [v30 sendData:v20 toDestinations:v34 priority:300 options:v22 identifier:&v44 error:&v43];
        id v39 = v44;
        uint64_t v36 = v43;
      }
      id v41 = v36;

      if (v35)
      {
        if (dword_100140D18 > 30)
        {
          BOOL v33 = 1;
          id v14 = v42;
        }
        else
        {
          id v14 = v42;
          if (dword_100140D18 != -1 || _LogCategory_Initialize())
          {
            uint64_t v38 = [v25 loginID];
            LogPrintF();
          }
          BOOL v33 = 1;
        }
      }
      else
      {
        if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v14 = v42;
        if (a9)
        {
          RPNestedErrorF();
          BOOL v33 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v33 = 0;
        }
      }
    }
    else if (a9)
    {
      RPErrorF();
      BOOL v33 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v33 = 0;
    }

LABEL_59:
    goto LABEL_60;
  }
  char v26 = RPErrorF();
  if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a9) {
    *a9 = v26;
  }

  BOOL v33 = 0;
LABEL_60:

  return v33;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForID:(SEL)a3
{
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  if ([(RPCloudDaemon *)self idsIsSignedIn])
  {
    id v7 = self;
    objc_sync_enter(v7);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = [(RPCloudDaemon *)v7 idsDeviceArray];
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = [v12 uniqueID];
          unsigned int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            if (v12)
            {
              [v12 operatingSystemVersion];
            }
            else
            {
              long long v16 = 0uLL;
              int64_t v17 = 0;
            }
            *(_OWORD *)&retstr->var0 = v16;
            retstr->var2 = v17;
            goto LABEL_15;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    objc_sync_exit(v7);
  }

  return result;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForSelf
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  BOOL v4 = +[NSProcessInfo processInfo];
  if (v4)
  {
    id v6 = v4;
    [v4 operatingSystemVersion];
    BOOL v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (IDSService)nearbyIDSService
{
  return self->_nearbyIDSService;
}

- (void)setNearbyIDSService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyIDSService, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_lastFamilyQueryDate, 0);
  objc_storeStrong((id *)&self->_idsFamilyEndpointMap, 0);
  objc_storeStrong((id *)&self->_idsDeviceMap, 0);
  objc_storeStrong((id *)&self->_idsDeviceIDSelf, 0);
  objc_storeStrong((id *)&self->_idsDeviceArray, 0);

  objc_storeStrong((id *)&self->_idsCorrelationIdentifier, 0);
}

@end