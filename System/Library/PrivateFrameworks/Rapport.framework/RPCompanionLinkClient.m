@interface RPCompanionLinkClient
+ (BOOL)supportsSecureCoding;
- (BOOL)encodeSensitiveProperties;
- (BOOL)reactivateCalled;
- (BOOL)shouldReportDevice:(id)a3 toXPCConnectionWithLaunchInstanceID:(id)a4 outReason:(id *)a5;
- (BOOL)targetUserSession;
- (BOOL)usingOnDemandConnection;
- (NSArray)activeDevices;
- (NSArray)allowedMACAddresses;
- (NSArray)deviceFilter;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSDictionary)siriInfo;
- (NSString)appID;
- (NSString)cloudServiceID;
- (NSString)password;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)init;
- (RPCompanionLinkClient)initWithCoder:(id)a3;
- (RPCompanionLinkClient)initWithUserProvider:(id)a3;
- (RPCompanionLinkDevice)activePersonalCompanion;
- (RPCompanionLinkDevice)destinationDevice;
- (RPCompanionLinkDevice)localDevice;
- (double)awdlGuestDiscoveryTimeout;
- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)_clientError:(id)a3;
- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7;
- (id)_ensureXPCStarted;
- (id)activateAssertionID:(id)a3 destinationID:(id)a4 options:(id)a5 completion:(id)a6;
- (id)authCompletionHandler;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)disconnectHandler;
- (id)errorFlagsChangedHandler;
- (id)eventIDRegistrationCompletion;
- (id)hidePasswordHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)localDeviceUpdatedHandler;
- (id)promptForPasswordHandler;
- (id)requestIDRegistrationCompletion;
- (id)showPasswordHandler;
- (id)stateUpdatedHandler;
- (int)passwordType;
- (int)passwordTypeActual;
- (int64_t)bleClientUseCase;
- (int64_t)bleScreenOffRescanInterval;
- (int64_t)rssiThreshold;
- (unint64_t)controlFlags;
- (unint64_t)errorFlags;
- (unsigned)bleScreenOffScanRate;
- (unsigned)clientID;
- (unsigned)flags;
- (unsigned)internalAuthFlags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (unsigned)useCase;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidateAssertion:(id)a3;
- (void)_invalidated;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_lostAllDevices;
- (void)_registerEventID:(id)a3 options:(id)a4 reregister:(BOOL)a5;
- (void)_registerProfileID:(id)a3 reregister:(BOOL)a4 completion:(id)a5;
- (void)_registerRequestID:(id)a3 options:(id)a4 reregister:(BOOL)a5;
- (void)_registerRequestIDOnQueue:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_reregisterAssertions;
- (void)_reregisterEvents;
- (void)_reregisterProfileIDs;
- (void)_reregisterRequests;
- (void)_startNWActivity:(unsigned int)a3 options:(id)a4 result:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)companionLinkAuthCompleted:(id)a3;
- (void)companionLinkChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)companionLinkFoundDevice:(id)a3;
- (void)companionLinkHandleDisconnect;
- (void)companionLinkLocalDeviceUpdated:(id)a3;
- (void)companionLinkLostDevice:(id)a3;
- (void)companionLinkPromptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5;
- (void)companionLinkReceivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)companionLinkReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)companionLinkUpdateClientState:(id)a3;
- (void)companionLinkUpdateErrorFlags:(unint64_t)a3;
- (void)createDeviceToEndpointMappingForDevice:(id)a3 completion:(id)a4;
- (void)deregisterEventID:(id)a3;
- (void)deregisterProfileID:(id)a3 completion:(id)a4;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)launchAppWithBundleID:(id)a3 destinationID:(id)a4 completion:(id)a5;
- (void)launchAppWithURL:(id)a3 destinationID:(id)a4 completion:(id)a5;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerProfileID:(id)a3 completion:(id)a4;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)removeLocalDeviceAsContextCollectorWithCompletion:(id)a3;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAwdlGuestDiscoveryTimeout:(double)a3;
- (void)setBleClientUseCase:(int64_t)a3;
- (void)setBleScreenOffRescanInterval:(int64_t)a3;
- (void)setBleScreenOffScanRate:(unsigned int)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setCloudServiceID:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDestinationDevice:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEncodeSensitiveProperties:(BOOL)a3;
- (void)setErrorFlags:(unint64_t)a3;
- (void)setErrorFlagsChangedHandler:(id)a3;
- (void)setEventIDRegistrationCompletion:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalDevice:(id)a3;
- (void)setLocalDeviceAsContextCollectorWithCompletion:(id)a3;
- (void)setLocalDeviceUpdatedHandler:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setReactivateCalled:(BOOL)a3;
- (void)setRequestIDRegistrationCompletion:(id)a3;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setServiceType:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)setSiriInfo:(id)a3;
- (void)setStateUpdatedHandler:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUsingOnDemandConnection:(BOOL)a3;
- (void)triggerEnhancedDiscoveryForReason:(id)a3 completion:(id)a4;
- (void)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
- (void)tryPassword:(id)a3;
@end

@implementation RPCompanionLinkClient

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

- (BOOL)shouldReportDevice:(id)a3 toXPCConnectionWithLaunchInstanceID:(id)a4 outReason:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 flags] & 1) == 0 || (self->_flags)
  {
    if (([v8 flags] & 0x2000) != 0)
    {
      if ((self->_flags & 0x2000) == 0)
      {
        LOBYTE(v10) = 0;
        if (a5)
        {
          v11 = @"deviceFlag.homeHubDevice";
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      v12 = [v8 launchInstanceID];
      int v13 = [v9 isEqual:v12];

      if (v13)
      {
        LOBYTE(v10) = 0;
        if (a5)
        {
          v11 = @"deviceFlag.homeHubDevice.launchInstanceIDMatches";
          goto LABEL_50;
        }
        goto LABEL_51;
      }
    }
    if (v9) {
      unint64_t v14 = self->_controlFlags | ((unint64_t)(self->_flags & 1) << 10) | 0x4000000000;
    }
    else {
      unint64_t v14 = self->_controlFlags | ((unint64_t)(self->_flags & 1) << 10);
    }
    uint64_t v15 = [v8 statusFlags];
    char v16 = [v8 flags];
    uint64_t v17 = v15 | 0x200080000;
    if ((v16 & 0x40) == 0) {
      uint64_t v17 = v15;
    }
    if (!(v14 & 0x400 | v17 & 0x80000)
      && ((v17 & 0x4000) == 0 || (v14 & 0x1000) == 0)
      && ((v17 & 0x20000) == 0 || (v14 & 0x100000) == 0)
      && ((v17 & 0x8000) == 0 || (v14 & 0x2000) == 0)
      && ((v17 & 0x2000000000) == 0 || (v14 & 0x100000000000) == 0)
      && ((v17 & 0x4000000000) == 0 || (v14 & 0x200000000000) == 0)
      && ((v17 & 0x2000) == 0 || (v14 & 0x800) == 0)
      && ((v17 & 0x1000000000) == 0 || (v14 & 0x80000000000) == 0))
    {
      LOBYTE(v10) = 0;
      if (!a5) {
        goto LABEL_51;
      }
      v11 = @"missingFlag.trustCircle";
      goto LABEL_50;
    }
    if ((v17 & 0x80000000) != 0 || (v14 & 0x1000000000000) == 0)
    {
      if ((v17 & 0x200000) != 0 && (v14 & 0x4000000) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = @"containsFlag.RPControlFlagsAppSignIn";
          goto LABEL_50;
        }
      }
      else if ((v14 & v17 & 8) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = @"containsFlag.RPControlFlagsAWDL";
          goto LABEL_50;
        }
      }
      else if ((v14 & v17 & 2) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = @"containsFlag.RPControlFlagsBLE";
          goto LABEL_50;
        }
      }
      else if ((v17 & 1) != 0 && (v14 & 0x20) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = @"containsFlag.RPControlFlagsBTPipe";
          goto LABEL_50;
        }
      }
      else
      {
        if ((v17 & 0x100000) != 0 && (v14 & 0x800000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          v11 = @"containsFlag.RPControlFlagsCloud";
          goto LABEL_50;
        }
        if ((v17 & 0x8000000) != 0 && (v14 & 0x100000000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          v11 = @"containsFlag.RPControlFlagsFitness";
          goto LABEL_50;
        }
        if ((v17 & 0x10000000) != 0 && (v14 & 0x400000000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          v11 = @"containsFlag.RPControlFlagsHomeHubDevice";
          goto LABEL_50;
        }
        if ((v17 & 0x200000000) != 0 && (v14 & 0x4000000000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          v11 = @"containsFlag.RPControlFlagsLaunchInstance";
          goto LABEL_50;
        }
        if ((v14 & v17 & 4) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          v11 = @"containsFlag.RPControlFlagsInfraWiFi";
          goto LABEL_50;
        }
        if ((v14 & v17 & 0x10) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          v11 = @"containsFlag.RPControlFlagsNAN";
          goto LABEL_50;
        }
        int v10 = (v14 >> 37) & 1 & (v17 >> 30);
        v11 = @"statusControlFlagMismatch";
        if (v10) {
          v11 = @"containsFlag.RPControlFlagsCompanionAuthentication";
        }
        if (a5) {
LABEL_50:
        }
          *a5 = v11;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
      if (a5)
      {
        v11 = @"missingFlag.RPStatusFlagsAWDLPairingMode";
        goto LABEL_50;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    if (a5)
    {
      v11 = @"deviceFlag.unauthenticated";
      goto LABEL_50;
    }
  }
LABEL_51:

  return v10 & 1;
}

- (RPCompanionLinkDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setServiceType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__RPCompanionLinkClient_setServiceType___block_invoke;
  v6[3] = &unk_1E605B5D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v6];
}

- (void)setControlFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__RPCompanionLinkClient_setControlFlags___block_invoke;
  v3[3] = &unk_1E605BCA0;
  v3[4] = self;
  v3[5] = a3;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v3];
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__RPCompanionLinkClient__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E605BD40;
    v7[4] = v5;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

uint64_t __41__RPCompanionLinkClient_setControlFlags___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 248) = *(void *)(result + 40);
  return result;
}

void __40__RPCompanionLinkClient_setServiceType___block_invoke(uint64_t a1)
{
}

- (void)encodeWithCoder:(id)a3
{
  id v26 = a3;
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses) {
    [v26 encodeObject:allowedMACAddresses forKey:@"MAcAddrs"];
  }
  appID = self->_appID;
  if (appID) {
    [v26 encodeObject:appID forKey:@"appID"];
  }
  if (self->_awdlGuestDiscoveryTimeout != 0.0) {
    objc_msgSend(v26, "encodeDouble:forKey:", @"agdt");
  }
  int64_t bleClientUseCase = self->_bleClientUseCase;
  if (bleClientUseCase) {
    [v26 encodeInteger:bleClientUseCase forKey:@"bleCUC"];
  }
  int64_t bleScreenOffRescanInterval = self->_bleScreenOffRescanInterval;
  if (bleScreenOffRescanInterval) {
    [v26 encodeInteger:bleScreenOffRescanInterval forKey:@"bleScnOffIntvl"];
  }
  uint64_t bleScreenOffScanRate = self->_bleScreenOffScanRate;
  if (bleScreenOffScanRate) {
    [v26 encodeInt64:bleScreenOffScanRate forKey:@"bleScnOffScnRt"];
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    [v26 encodeInt64:clientID forKey:@"cid"];
  }
  cloudServiceID = self->_cloudServiceID;
  if (cloudServiceID) {
    [v26 encodeObject:cloudServiceID forKey:@"clSI"];
  }
  unint64_t controlFlags = self->_controlFlags;
  if (controlFlags) {
    [v26 encodeInt64:controlFlags forKey:@"cFl"];
  }
  v12 = [(RPEndpoint *)self->_destinationDevice identifier];
  if (v12
    || ([(RPCompanionLinkDevice *)self->_destinationDevice publicIdentifier],
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v26 encodeObject:v12 forKey:@"ddID"];
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter) {
    [v26 encodeObject:deviceFilter forKey:@"dFtr"];
  }
  unint64_t v14 = [(RPEndpoint *)self->_destinationDevice ipAddress];
  if (v14) {
    [v26 encodeObject:v14 forKey:@"ddIP"];
  }

  if (self->_encodeSensitiveProperties) {
    [v26 encodeBool:1 forKey:@"esp"];
  }
  uint64_t flags = self->_flags;
  char v16 = v26;
  if (flags)
  {
    [v26 encodeInt64:flags forKey:@"flags"];
    char v16 = v26;
  }
  uint64_t internalAuthFlags = self->_internalAuthFlags;
  if (internalAuthFlags)
  {
    [v26 encodeInt64:internalAuthFlags forKey:@"iaf"];
    char v16 = v26;
  }
  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    [v26 encodeObject:pairingInfo forKey:@"pairI"];
    char v16 = v26;
  }
  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    [v26 encodeObject:pairSetupACL forKey:@"acl"];
    char v16 = v26;
  }
  password = self->_password;
  if (password)
  {
    [v26 encodeObject:password forKey:@"pw"];
    char v16 = v26;
  }
  uint64_t passwordType = self->_passwordType;
  if (passwordType)
  {
    [v26 encodeInteger:passwordType forKey:@"pwTy"];
    char v16 = v26;
  }
  if (self->_reactivateCalled)
  {
    [v26 encodeBool:1 forKey:@"reAcC"];
    char v16 = v26;
  }
  int64_t rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
  {
    [v26 encodeInteger:rssiThreshold forKey:@"rssiTh"];
    char v16 = v26;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v26 encodeObject:serviceType forKey:@"st"];
    char v16 = v26;
  }
  siriInfo = self->_siriInfo;
  if (siriInfo)
  {
    [v26 encodeObject:siriInfo forKey:@"siriInfo"];
    char v16 = v26;
  }
  uint64_t useCase = self->_useCase;
  if (useCase)
  {
    [v26 encodeInt64:useCase forKey:@"useCase"];
    char v16 = v26;
  }
  if (self->_usingOnDemandConnection)
  {
    [v26 encodeBool:1 forKey:@"uOnd"];
    char v16 = v26;
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__RPCompanionLinkClient_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E605B650;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)companionLinkUpdateErrorFlags:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_errorFlags == a3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_errorFlags = a3;
    objc_sync_exit(obj);

    dispatchQueue = obj->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__RPCompanionLinkClient_companionLinkUpdateErrorFlags___block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = obj;
    dispatch_async(dispatchQueue, block);
  }
}

- (RPCompanionLinkClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RPCompanionLinkClient;
  id v5 = [(RPCompanionLinkClient *)&v27 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    if ([v8 containsValueForKey:@"agdt"])
    {
      [v8 decodeDoubleForKey:@"agdt"];
      v6->_awdlGuestDiscoveryTimeout = v9;
    }

    id v10 = v8;
    if ([v10 containsValueForKey:@"bleCUC"]) {
      v6->_int64_t bleClientUseCase = [v10 decodeIntegerForKey:@"bleCUC"];
    }

    id v11 = v10;
    if ([v11 containsValueForKey:@"bleScnOffIntvl"]) {
      v6->_int64_t bleScreenOffRescanInterval = [v11 decodeIntegerForKey:@"bleScnOffIntvl"];
    }

    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_uint64_t bleScreenOffScanRate = v28;
    }
    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_uint64_t clientID = v28;
    }
    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    if ([v13 containsValueForKey:@"cFl"]) {
      v6->_unint64_t controlFlags = [v13 decodeInt64ForKey:@"cFl"];
    }

    unint64_t v14 = self;
    NSDecodeNSArrayOfClassIfPresent();

    id v15 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    if ([v17 containsValueForKey:@"esp"]) {
      v6->_encodeSensitiveProperties = [v17 decodeBoolForKey:@"esp"];
    }

    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_uint64_t flags = v28;
    }
    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_uint64_t internalAuthFlags = v28;
    }
    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_uint64_t passwordType = v28;
    }
    id v20 = v19;
    if ([v20 containsValueForKey:@"reAcC"]) {
      v6->_reactivateCalled = [v20 decodeBoolForKey:@"reAcC"];
    }

    id v21 = v20;
    if ([v21 containsValueForKey:@"rssiTh"]) {
      v6->_int64_t rssiThreshold = [v21 decodeIntegerForKey:@"rssiTh"];
    }

    id v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v23 = v22;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_uint64_t useCase = v28;
    }
    id v24 = v23;
    if ([v24 containsValueForKey:@"uOnd"]) {
      v6->_usingOnDemandConnection = [v24 decodeBoolForKey:@"uOnd"];
    }

    v25 = v6;
  }

  return v6;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RPCompanionLinkClient_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_daemonCnx)
    {
      invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler) {
        invalidationHandler[2]();
      }
      [(NSMutableSet *)self->_assertions removeAllObjects];
      [(NSMutableDictionary *)self->_eventRegistrations removeAllObjects];
      [(NSMutableDictionary *)self->_requestRegistrations removeAllObjects];
      id authCompletionHandler = self->_authCompletionHandler;
      self->_id authCompletionHandler = 0;

      id deviceFoundHandler = self->_deviceFoundHandler;
      self->_id deviceFoundHandler = 0;

      id deviceLostHandler = self->_deviceLostHandler;
      self->_id deviceLostHandler = 0;

      id deviceChangedHandler = self->_deviceChangedHandler;
      self->_id deviceChangedHandler = 0;

      id disconnectHandler = self->_disconnectHandler;
      self->_id disconnectHandler = 0;

      id errorFlagsChangedHandler = self->_errorFlagsChangedHandler;
      self->_id errorFlagsChangedHandler = 0;

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      id v11 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      id localDeviceUpdatedHandler = self->_localDeviceUpdatedHandler;
      self->_id localDeviceUpdatedHandler = 0;

      id showPasswordHandler = self->_showPasswordHandler;
      self->_id showPasswordHandler = 0;

      id hidePasswordHandler = self->_hidePasswordHandler;
      self->_id hidePasswordHandler = 0;

      id promptForPasswordHandler = self->_promptForPasswordHandler;
      self->_id promptForPasswordHandler = 0;

      id stateUpdatedHandler = self->_stateUpdatedHandler;
      self->_id stateUpdatedHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (RPCompanionLinkClient)init
{
  v3 = objc_alloc_init(RPSignedInUserProvider);
  id v4 = [(RPCompanionLinkClient *)self initWithUserProvider:v3];

  return v4;
}

- (RPCompanionLinkClient)initWithUserProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPCompanionLinkClient;
  v6 = [(RPCompanionLinkClient *)&v9 init];
  if (v6)
  {
    if (gRPCompanionLinkClientIDOnce != -1) {
      dispatch_once(&gRPCompanionLinkClientIDOnce, &__block_literal_global_3);
    }
    v6->_uint64_t clientID = atomic_fetch_add((atomic_uint *volatile)&gRPCompanionLinkClientIDNext, 1u) + 1;
    v6->_unint64_t controlFlags = 36;
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1E4F14428]);
    objc_storeStrong((id *)&v6->_userProvider, a3);
    id v7 = v6;
  }

  return v6;
}

- (void)companionLinkLocalDeviceUpdated:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = (void *)MEMORY[0x1B3EBCA50]([(RPCompanionLinkClient *)self setLocalDevice:v7]);
  if ((self->_controlFlags & 0x4000000000000) == 0) {
    [v7 setSiriInfo:0];
  }
  id localDeviceUpdatedHandler = (void (**)(id, id))self->_localDeviceUpdatedHandler;
  v6 = v7;
  if (localDeviceUpdatedHandler)
  {
    localDeviceUpdatedHandler[2](localDeviceUpdatedHandler, v7);
    v6 = v7;
  }
}

- (void)setLocalDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_requestIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_stateUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_siriInfo, 0);
  objc_storeStrong(&self->_localDeviceUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorFlagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_destinationDevice, 0);
  objc_storeStrong((id *)&self->_cloudServiceID, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_userProvider, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_requestRegistrations, 0);
  objc_storeStrong((id *)&self->_registeredProfileIDs, 0);
  objc_storeStrong((id *)&self->_eventRegistrations, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
  objc_storeStrong((id *)&self->_daemonCnx, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (void)companionLinkLostDevice:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v8 identifier];
  if (v5 || ([v8 publicIdentifier], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(NSMutableDictionary *)v4->_deviceDictionary setObject:0 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
    id v7 = v8;
    if (!deviceLostHandler) {
      goto LABEL_7;
    }
    deviceLostHandler[2](deviceLostHandler, v8);
  }
  else
  {
    objc_sync_exit(v4);
  }
  id v7 = v8;
LABEL_7:
}

void __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v18 = a3;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "_clientError:");
  if (!v5)
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v19;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v11 = [v10 identifier];
          if (v11
            || ([v10 publicIdentifier], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!*(void *)(*(void *)(a1 + 32) + 48))
            {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              uint64_t v13 = *(void *)(a1 + 32);
              unint64_t v14 = *(void **)(v13 + 48);
              *(void *)(v13 + 48) = v12;
            }
            id v15 = (void *)MEMORY[0x1B3EBCA50]();
            if ((*(unsigned char *)(*(void *)(a1 + 32) + 254) & 4) == 0) {
              [v10 setSiriInfo:0];
            }
            [*(id *)(*(void *)(a1 + 32) + 48) setObject:v10 forKeyedSubscript:v11];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    objc_sync_exit(obj);
    if (*(unsigned char *)(a1 + 48))
    {
      if (gLogCategory_CLinkClient > 30 || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize()) {
        goto LABEL_37;
      }
    }
    else if (gLogCategory_CLinkClient > 30 {
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_37;
    }
    LogPrintF();
    goto LABEL_37;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
LABEL_26:
    }
      LogPrintF();
  }
  else if (gLogCategory_CLinkClient <= 60 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_26;
  }
LABEL_37:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v5);
  }
}

- (void)companionLinkFoundDevice:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v10 identifier];
  if (v5 || ([v10 publicIdentifier], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (!v4->_deviceDictionary)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      deviceDictionary = v4->_deviceDictionary;
      v4->_deviceDictionary = v6;
    }
    uint64_t v8 = (void *)MEMORY[0x1B3EBCA50]();
    if ((v4->_controlFlags & 0x4000000000000) == 0) {
      [v10 setSiriInfo:0];
    }
    [(NSMutableDictionary *)v4->_deviceDictionary setObject:v10 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    id deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }
    else if (v4->_appID {
           && gLogCategory_CLinkClient <= 40
    }
           && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (id)_clientError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if ([v4 code] == 4099)
    {
      id v6 = v5;
      if (self->_invalidateCalled)
      {
        id v6 = RPErrorF();
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setErrorFlags:(unint64_t)a3
{
  self->_errorFlags = a3;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (unsigned)flags
{
  return self->_flags;
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_int64_t rssiThreshold = a3;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (void)setAwdlGuestDiscoveryTimeout:(double)a3
{
  self->_awdlGuestDiscoveryTimeout = a3;
}

- (unsigned)bleScreenOffScanRate
{
  return self->_bleScreenOffScanRate;
}

- (int64_t)bleScreenOffRescanInterval
{
  return self->_bleScreenOffRescanInterval;
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      if (self->_targetUserSession) {
        uint64_t v7 = (RPCompanionLinkClient *)@"(TargetUserSession)";
      }
      else {
        uint64_t v7 = self;
      }
      uint64_t v13 = v7;
      LogPrintF();
    }
    self->_reactivateCalled = 1;
  }
  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    if (self->_targetUserSession) {
      uint64_t v8 = (RPCompanionLinkClient *)@"(TargetUserSession)";
    }
    else {
      uint64_t v8 = self;
    }
    uint64_t v13 = v8;
    LogPrintF();
  }
  objc_super v9 = [(RPCompanionLinkClient *)self _ensureXPCStarted];
  if (v9)
  {
    if (v6) {
      v6[2](v6, v9);
    }
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke;
    v17[3] = &unk_1E605BCF0;
    v17[4] = self;
    BOOL v19 = v4;
    id v11 = v6;
    id v18 = v11;
    id v12 = [(RPDaemonConnection *)daemonCnx remoteObjectProxyWithErrorHandler:v17];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke_2;
    v14[3] = &unk_1E605BD18;
    v14[4] = self;
    BOOL v16 = v4;
    id v15 = v11;
    [v12 companionLinkActivateClient:self completion:v14];
  }
}

- (id)_ensureXPCStarted
{
  if (self->_daemonCnx)
  {
    v2 = 0;
    goto LABEL_21;
  }
  if (self->_invalidateCalled)
  {
    v2 = RPErrorF();
    goto LABEL_21;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke;
  v13[3] = &unk_1E605B540;
  v13[4] = self;
  BOOL v4 = (void *)MEMORY[0x1B3EBCC80](v13, a2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke_2;
  v12[3] = &unk_1E605B540;
  v12[4] = self;
  id v5 = (void *)MEMORY[0x1B3EBCC80](v12);
  if ([(RPSignedInUserProvider *)self->_userProvider supportsMultipleUsers]
    && self->_targetUserSession)
  {
    unsigned int v6 = [(RPSignedInUserProvider *)self->_userProvider signedInUserID];
    if (!v6)
    {
      if (gLogCategory_CLinkClient <= 50 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v2 = RPErrorF();
      goto LABEL_20;
    }
    if (gLogCategory_CLinkClient <= 30)
    {
      unsigned int v7 = v6;
      if (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())
      {
        uint64_t v11 = v7;
        LogPrintF();
      }
    }
  }
  -[RPCompanionLinkClient _connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:](self, "_connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:", self, self->_dispatchQueue, self->_userProvider, v4, v5, v11);
  uint64_t v8 = (RPDaemonConnection *)objc_claimAutoreleasedReturnValue();
  daemonCnx = self->_daemonCnx;
  self->_daemonCnx = v8;

  if (gLogCategory_CLinkClient <= 10 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = 0;
LABEL_20:

LABEL_21:
  return v2;
}

- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v12 = a5;
  id v32 = a7;
  id v31 = a6;
  id v34 = a4;
  id v30 = a3;
  uint64_t v13 = [(RPCompanionLinkClient *)self _XPCConnectionWithMachServiceName:@"com.apple.CompanionLink" options:0];
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  long long v22 = objc_msgSend(v14, "initWithObjects:", v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  long long v23 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C39EE8];
  [v23 setClasses:v22 forSelector:sel_companionLinkReceivedEventID_event_options_ argumentIndex:1 ofReply:0];
  [v23 setClasses:v22 forSelector:sel_companionLinkReceivedRequestID_request_options_responseHandler_ argumentIndex:1 ofReply:0];
  [v23 setClasses:v22 forSelector:sel_companionLinkReceivedRequestID_request_options_responseHandler_ argumentIndex:0 ofReply:1];
  id v24 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C480E0];
  id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v26 = objc_opt_class();
  objc_super v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  [v24 setClasses:v27 forSelector:sel_companionLinkActivateClient_completion_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v22 forSelector:sel_companionLinkSendEventID_event_destinationID_options_nwActivityToken_completion_ argumentIndex:1 ofReply:0];
  [v24 setClasses:v22 forSelector:sel_companionLinkSendRequestID_request_destinationID_options_nwActivityToken_responseHandler_ argumentIndex:1 ofReply:0];
  [v24 setClasses:v22 forSelector:sel_companionLinkSendRequestID_request_destinationID_options_nwActivityToken_responseHandler_ argumentIndex:0 ofReply:1];
  [v13 setExportedInterface:v23];
  [v13 setExportedObject:v30];

  [v13 setInterruptionHandler:v31];
  [v13 setInvalidationHandler:v32];

  [v13 setRemoteObjectInterface:v24];
  [v13 _setQueue:v34];

  if (self->_targetUserSession
    && [v12 supportsMultipleUsers]
    && [v12 signedInUserID])
  {
    objc_msgSend(v13, "_setTargetUserIdentifier:", objc_msgSend(v12, "signedInUserID"));
  }
  [v13 resume];
  uint64_t v28 = [[RPCompanionLinkClientDaemonConnection_XPC alloc] initWithConnection:v13];

  return v28;
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F29268];
  id v6 = a3;
  unsigned int v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

void __55__RPCompanionLinkClient_companionLinkUpdateErrorFlags___block_invoke(uint64_t a1)
{
  v1 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 288));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (id)description
{
  unint64_t controlFlags = self->_controlFlags;
  uint64_t flags = self->_flags;
  int64_t clientID = self->_clientID;
  NSAppendPrintF();
  id v3 = 0;
  BOOL v4 = v3;
  appID = self->_appID;
  if (appID)
  {
    v36 = v3;
    int64_t clientID = appID;
    NSAppendPrintF();
    id v6 = v36;

    BOOL v4 = v6;
  }
  if (self->_bleClientUseCase)
  {
    int64_t clientID = self->_bleClientUseCase;
    NSAppendPrintF();
    id v7 = v4;

    BOOL v4 = v7;
  }
  if (self->_useCase)
  {
    int64_t clientID = self->_useCase;
    NSAppendPrintF();
    id v8 = v4;

    BOOL v4 = v8;
  }
  cloudServiceID = self->_cloudServiceID;
  if (cloudServiceID)
  {
    int64_t clientID = cloudServiceID;
    NSAppendPrintF();
    id v10 = v4;

    BOOL v4 = v10;
  }
  if (self->_rssiThreshold)
  {
    int64_t clientID = self->_rssiThreshold;
    NSAppendPrintF();
    id v11 = v4;

    BOOL v4 = v11;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    int64_t clientID = serviceType;
    NSAppendPrintF();
    id v13 = v4;

    BOOL v4 = v13;
  }
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses)
  {
    uint64_t v15 = allowedMACAddresses;
    [(NSArray *)v15 count];
    NSAppendPrintF();
    id v16 = v4;

    BOOL v4 = v16;
  }
  if (self->_passwordType)
  {
    NSAppendPrintF();
    id v17 = v4;

    BOOL v4 = v17;
  }
  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    uint64_t v19 = pairingInfo;
    [(NSData *)v19 length];
    NSAppendPrintF();
    id v20 = v4;

    BOOL v4 = v20;
  }
  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    id v32 = pairSetupACL;
    NSAppendPrintF();
    id v22 = v4;

    BOOL v4 = v22;
  }
  if (self->_usingOnDemandConnection)
  {
    NSAppendPrintF();
    id v23 = v4;

    BOOL v4 = v23;
  }
  NSAppendPrintF();
  id v24 = v4;

  if (self->_bleScreenOffRescanInterval)
  {
    NSAppendPrintF();
    id v25 = v24;

    id v24 = v25;
  }
  if (self->_bleScreenOffScanRate)
  {
    NSAppendPrintF();
    id v27 = v24;

    id v24 = v27;
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
  {
    v33 = deviceFilter;
    NSAppendPrintF();
    id v29 = v24;

    id v24 = v29;
  }
  return v24;
}

uint64_t __35__RPCompanionLinkClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 64))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 64) = 1;
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(v2 + 32) + 40), "invalidate", v4);
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

uint64_t __48__RPCompanionLinkClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 168))
  {
    *(_DWORD *)(v1 + 136) |= 8u;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(void *)(v1 + 184))
  {
    *(_DWORD *)(v1 + 136) |= 1u;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(void *)(v1 + 192))
  {
    *(_DWORD *)(v1 + 136) |= 2u;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(void *)(v1 + 200))
  {
    *(_DWORD *)(v1 + 136) |= 4u;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  return [(id)v1 _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

uint64_t __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __46__RPCompanionLinkClient_initWithUserProvider___block_invoke()
{
  uint64_t result = RandomBytes();
  gRPCompanionLinkClientIDNext = (unsigned __int16)word_1EB47BD22 << 16;
  return result;
}

- (void)setBleScreenOffRescanInterval:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__RPCompanionLinkClient_setBleScreenOffRescanInterval___block_invoke;
  v3[3] = &unk_1E605BCA0;
  v3[4] = self;
  v3[5] = a3;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v3];
}

uint64_t __55__RPCompanionLinkClient_setBleScreenOffRescanInterval___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = *(void *)(result + 40);
  return result;
}

- (void)setBleScreenOffScanRate:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__RPCompanionLinkClient_setBleScreenOffScanRate___block_invoke;
  v3[3] = &unk_1E605BCC8;
  v3[4] = self;
  unsigned int v4 = a3;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v3];
}

uint64_t __49__RPCompanionLinkClient_setBleScreenOffScanRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setDeviceFilter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__RPCompanionLinkClient_setDeviceFilter___block_invoke;
  v6[3] = &unk_1E605B5D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v6];
}

void __41__RPCompanionLinkClient_setDeviceFilter___block_invoke(uint64_t a1)
{
}

- (void)setSiriInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__RPCompanionLinkClient_setSiriInfo___block_invoke;
  v6[3] = &unk_1E605B5D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v6];
}

void __37__RPCompanionLinkClient_setSiriInfo___block_invoke(uint64_t a1)
{
}

- (void)setUseCase:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__RPCompanionLinkClient_setUseCase___block_invoke;
  v3[3] = &unk_1E605BCC8;
  v3[4] = self;
  unsigned int v4 = a3;
  [(RPCompanionLinkClient *)self _invokeBlockActivateSafe:v3];
}

uint64_t __36__RPCompanionLinkClient_setUseCase___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 104) = *(_DWORD *)(result + 40);
  return result;
}

void __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v7 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

uint64_t __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

void __50__RPCompanionLinkClient__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 companionLinkUpdateClient:*(void *)(a1 + 32)];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CLinkClient <= 50 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPCompanionLinkClient *)self _lostAllDevices];
  if (self->_activateCalled) {
    [(RPCompanionLinkClient *)self _activateWithCompletion:0 reactivate:1];
  }
  [(RPCompanionLinkClient *)self _reregisterAssertions];
  [(RPCompanionLinkClient *)self _reregisterEvents];
  [(RPCompanionLinkClient *)self _reregisterRequests];
  [(RPCompanionLinkClient *)self _reregisterProfileIDs];
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    int v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (id)activateAssertionID:(id)a3 destinationID:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(RPCompanionLinkAssertion);
  [(RPCompanionLinkAssertion *)v12 setAssertionID:v11];

  [(RPCompanionLinkAssertion *)v12 setClient:self];
  [(RPCompanionLinkAssertion *)v12 setDestinationID:v10];

  id v13 = [MEMORY[0x1E4F29128] UUID];
  id v14 = [v13 UUIDString];
  [(RPCompanionLinkAssertion *)v12 setIdentifier:v14];

  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RPCompanionLinkClient_activateAssertionID_destinationID_options_completion___block_invoke;
  block[3] = &unk_1E605BD68;
  block[4] = self;
  id v16 = v12;
  id v22 = v16;
  id v23 = v9;
  id v17 = v9;
  dispatch_async(dispatchQueue, block);
  uint64_t v18 = v23;
  uint64_t v19 = v16;

  return v19;
}

void __78__RPCompanionLinkClient_activateAssertionID_destinationID_options_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (!v7) {
      goto LABEL_8;
    }
    id v9 = v6;
    (*(void (**)(void))(v7 + 16))();
  }
  else
  {
    id v9 = 0;
    id v8 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
    [v8 companionLinkActivateAssertion:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  uint64_t v6 = v9;
LABEL_8:
}

- (void)_invalidateAssertion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__RPCompanionLinkClient__invalidateAssertion___block_invoke;
  v7[3] = &unk_1E605B5D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__RPCompanionLinkClient__invalidateAssertion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 companionLinkInvalidateAssertion:*(void *)(a1 + 40)];
}

- (void)_reregisterAssertions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_assertions count]
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_assertions;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [(RPCompanionLinkClient *)self _ensureXPCStarted];
        if (v9)
        {
          id v11 = (void *)v9;
          if (gLogCategory_CLinkClient <= 90
            && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }

          goto LABEL_20;
        }
        id v10 = [(RPDaemonConnection *)self->_daemonCnx remoteObjectProxy];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __46__RPCompanionLinkClient__reregisterAssertions__block_invoke;
        v12[3] = &unk_1E605B568;
        v12[4] = self;
        void v12[5] = v8;
        [v10 companionLinkActivateAssertion:v8 completion:v12];
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_20:
}

void __46__RPCompanionLinkClient__reregisterAssertions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v4 = (void *)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    uint64_t v7 = (void *)v3;
    if (gLogCategory_CLinkClient != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = v7, v5))
    {
      uint64_t v6 = [*(id *)(a1 + 40) assertionID];
      LogPrintF();

      uint64_t v4 = v7;
    }
  }
}

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__RPCompanionLinkClient_tryPassword___block_invoke;
  v7[3] = &unk_1E605B5D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __37__RPCompanionLinkClient_tryPassword___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 companionLinkTryPassword:*(void *)(a1 + 40)];
}

- (void)companionLinkPromptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  uint64_t v9 = MEMORY[0x1B3EBCC80](self->_promptForPasswordHandler);
  id v10 = (void *)v9;
  if (v9)
  {
    self->_passwordTypeActual = a3;
    id v12 = (void *)v9;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v6, v5);
LABEL_4:
    id v10 = v12;
    goto LABEL_9;
  }
  if (gLogCategory_CLinkClient <= 90)
  {
    id v12 = 0;
    if (gLogCategory_CLinkClient != -1 || (v11 = _LogCategory_Initialize(), id v10 = 0, v11))
    {
      LogPrintF();
      goto LABEL_4;
    }
  }
LABEL_9:
}

- (void)companionLinkAuthCompleted:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = MEMORY[0x1B3EBCC80](self->_authCompletionHandler);
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  else if (gLogCategory_CLinkClient <= 90 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (NSArray)activeDevices
{
  id v2 = self;
  objc_sync_enter(v2);
  deviceDictionary = v2->_deviceDictionary;
  if (deviceDictionary)
  {
    uint64_t v4 = [(NSMutableDictionary *)deviceDictionary allValues];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (RPCompanionLinkDevice)activePersonalCompanion
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  int v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  deviceDictionary = v2->_deviceDictionary;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__RPCompanionLinkClient_activePersonalCompanion__block_invoke;
  v6[3] = &unk_1E605BD90;
  v6[4] = &v7;
  [(NSMutableDictionary *)deviceDictionary enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  objc_sync_exit(v2);
  return (RPCompanionLinkDevice *)v4;
}

void __48__RPCompanionLinkClient_activePersonalCompanion__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([v7 isPersonal])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)companionLinkChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [v11 identifier];
  if (!v7)
  {
    id v7 = [v11 publicIdentifier];
    if (!v7)
    {
      objc_sync_exit(v6);

      goto LABEL_8;
    }
  }
  id v8 = (void *)MEMORY[0x1B3EBCA50]([(NSMutableDictionary *)v6->_deviceDictionary setObject:v11 forKeyedSubscript:v7]);
  if ((v6->_controlFlags & 0x4000000000000) == 0) {
    [v11 setSiriInfo:0];
  }

  objc_sync_exit(v6);
  id deviceChangedHandler = (void (**)(id, id, void))v6->_deviceChangedHandler;
  id v10 = v11;
  if (deviceChangedHandler)
  {
    deviceChangedHandler[2](deviceChangedHandler, v11, v4);
LABEL_8:
    id v10 = v11;
  }
}

- (void)_lostAllDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id deviceLostHandler = self->_deviceLostHandler;
  id obj = self;
  objc_sync_enter(obj);
  deviceDictionary = obj->_deviceDictionary;
  if (deviceLostHandler)
  {
    uint64_t v5 = [(NSMutableDictionary *)deviceDictionary allValues];
    [(NSMutableDictionary *)obj->_deviceDictionary removeAllObjects];
    objc_sync_exit(obj);

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = (void (**)(id, void))self->_deviceLostHandler;
          if (v10) {
            v10[2](v10, *(void *)(*((void *)&v12 + 1) + 8 * i));
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [(NSMutableDictionary *)deviceDictionary removeAllObjects];
    objc_sync_exit(obj);
  }
}

- (void)companionLinkUpdateClientState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int usingOnDemandConnection = v5->_usingOnDemandConnection;
  if (usingOnDemandConnection == [v4 usingOnDemandConnection])
  {
    objc_sync_exit(v5);
  }
  else
  {
    v5->_int usingOnDemandConnection = [v4 usingOnDemandConnection];
    objc_sync_exit(v5);

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RPCompanionLinkClient_companionLinkUpdateClientState___block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
}

void __56__RPCompanionLinkClient_companionLinkUpdateClientState___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 368));
  if (v1)
  {
    id v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__RPCompanionLinkClient_registerEventID_options_handler___block_invoke;
  v15[3] = &unk_1E605BDB8;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __57__RPCompanionLinkClient_registerEventID_options_handler___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(RPEventRegistration);
  [(RPEventRegistration *)v6 setEventID:*(void *)(a1 + 32)];
  [(RPEventRegistration *)v6 setOptions:*(void *)(a1 + 40)];
  [(RPEventRegistration *)v6 setHandler:*(void *)(a1 + 56)];
  id v2 = *(void **)(*(void *)(a1 + 48) + 56);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    id v2 = *(void **)(*(void *)(a1 + 48) + 56);
  }
  [v2 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _registerEventID:*(void *)(a1 + 32) options:*(void *)(a1 + 40) reregister:0];
}

- (void)_registerEventID:(id)a3 options:(id)a4 reregister:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v14 = v8;
      LogPrintF();
    }
  }
  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  id v10 = [(RPCompanionLinkClient *)self _ensureXPCStarted];
  if (v10)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke;
    v18[3] = &unk_1E605BDE0;
    v18[4] = self;
    BOOL v20 = v5;
    id v12 = v8;
    id v19 = v12;
    id v13 = [(RPDaemonConnection *)daemonCnx remoteObjectProxyWithErrorHandler:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_2;
    v15[3] = &unk_1E605BDE0;
    void v15[4] = self;
    BOOL v17 = v5;
    id v16 = v12;
    [v13 companionLinkRegisterEventID:v16 options:v9 completion:v15];
  }
}

void __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _clientError:a2];
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v7 = v3, int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        id v6 = v3;
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    id v8 = v3;
    int v5 = _LogCategory_Initialize();
    id v3 = v8;
    if (v5) {
      goto LABEL_7;
    }
  }
}

void __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    int v5 = [v4 _clientError:v3];
    if (*(unsigned char *)(a1 + 48))
    {
      if (gLogCategory_CLinkClient > 60 || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize()) {
        goto LABEL_14;
      }
    }
    else if (gLogCategory_CLinkClient > 60 {
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:

    goto LABEL_15;
  }
  if (v4[48])
  {
    id v6 = v4[34];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_3;
    block[3] = &unk_1E605B5D8;
    block[4] = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
LABEL_15:
}

uint64_t __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 384) + 16))();
}

- (void)_reregisterEvents
{
  if ([(NSMutableDictionary *)self->_eventRegistrations count]
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  eventRegistrations = self->_eventRegistrations;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__RPCompanionLinkClient__reregisterEvents__block_invoke;
  v4[3] = &unk_1E605BE08;
  v4[4] = self;
  [(NSMutableDictionary *)eventRegistrations enumerateKeysAndObjectsUsingBlock:v4];
}

void __42__RPCompanionLinkClient__reregisterEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v6 = [v4 eventID];
  int v5 = [v4 options];

  [v3 _registerEventID:v6 options:v5 reregister:1];
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke;
  v7[3] = &unk_1E605B5D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke(uint64_t a1)
{
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", 0, *(void *)(a1 + 32), v6);
  id v2 = [*(id *)(a1 + 40) _ensureXPCStarted];
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke_2;
    v10[3] = &unk_1E605B568;
    v10[4] = v3;
    id v11 = *(id *)(a1 + 32);
    int v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke_3;
    v8[3] = &unk_1E605B568;
    int8x16_t v7 = *(int8x16_t *)(a1 + 32);
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    [v5 companionLinkDeregisterEventID:(id)v7.i64[0] completion:v8];
  }
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v3 = (void *)v2;
  if (gLogCategory_CLinkClient <= 60)
  {
    int v5 = (void *)v2;
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
    uint64_t v3 = (void *)v2;
    if (gLogCategory_CLinkClient <= 60)
    {
      int v5 = (void *)v2;
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke;
  v36[3] = &unk_1E605BE30;
  v36[4] = &v43;
  v36[5] = &v37;
  [(RPCompanionLinkClient *)self _startNWActivity:1 options:v15 result:v36];
  BOOL v17 = +[RPNWActivityUtils tokenForActivity:v44[5]];
  uint64_t v18 = [(id)v38[5] valueForKey:@"highPriority"];
  [v18 BOOLValue];

  if (!CFDictionaryGetInt64())
  {
    id v19 = v12;
    if (([v19 isEqual:@"HIDRelay"] & 1) != 0
      || ([v19 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
      || ([v19 isEqual:@"_hidT"] & 1) != 0
      || ([v19 isEqual:@"_laData"] & 1) != 0)
    {
    }
    else
    {
      int v27 = [v19 isEqual:@"_siA"];

      if (!v27)
      {
        int v20 = 30;
        goto LABEL_8;
      }
    }
  }
  int v20 = 10;
LABEL_8:
  if (v20 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    [v13 count];
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_2;
  block[3] = &unk_1E605BE80;
  block[4] = self;
  id v29 = v12;
  id v30 = v14;
  id v31 = v13;
  id v34 = &v43;
  v35 = &v37;
  id v32 = v17;
  id v33 = v16;
  id v22 = v17;
  id v23 = v13;
  id v24 = v14;
  id v25 = v12;
  id v26 = v16;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v2)
  {
    +[RPNWActivityUtils failActivity:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) error:v2];
    uint64_t v3 = *(void *)(a1 + 72);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_3;
    v20[3] = &unk_1E605BE58;
    v20[4] = v4;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    long long v14 = *(_OWORD *)(a1 + 72);
    id v6 = (id)v14;
    long long v23 = v14;
    uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v20];
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_4;
    v16[3] = &unk_1E605BE58;
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    id v18 = *(id *)(a1 + 48);
    long long v15 = *(_OWORD *)(a1 + 72);
    id v13 = (id)v15;
    long long v19 = v15;
    [v7 companionLinkSendEventID:v17 event:v11 destinationID:v9 options:v10 nwActivityToken:v12 completion:v16];
  }
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v9 = (id)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = (uint64_t)v9, v4))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = v3;
      uint64_t v6 = *(void *)(a1 + 40);
      LogPrintF();
      uint64_t v3 = (uint64_t)v9;
    }
  }
  +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3, v6, v7, v8);
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v9);
  }
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  long long v14 = (void *)v3;
  if (v3)
  {
    uint64_t v4 = v3;
    if (gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = (uint64_t)v14, v5)))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = v4;
      uint64_t v9 = *(void *)(a1 + 40);
      LogPrintF();
      +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v14, v9, v11, v13);
    }
    else
    {
      +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v4, v8, v10, v12);
    }
  }
  else
  {
    nw_activity_complete_with_reason();
  }
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = v14;
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v14);
    uint64_t v7 = v14;
  }
}

- (void)companionLinkReceivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v10 = [(NSMutableDictionary *)self->_eventRegistrations objectForKeyedSubscript:v15];
  uint64_t v11 = [v10 handler];

  if (v11)
  {
    ((void (**)(void, id, id))v11)[2](v11, v8, v9);
  }
  else
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_eventRegistrations objectForKeyedSubscript:@"*"];
    uint64_t v11 = [v12 handler];

    if (!v11) {
      goto LABEL_9;
    }
    if (v9) {
      id v13 = (id)[v9 mutableCopy];
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    long long v14 = v13;
    [v13 setObject:v15 forKeyedSubscript:@"eventID"];
    ((void (**)(void, id, void *))v11)[2](v11, v8, v14);
  }
LABEL_9:
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__RPCompanionLinkClient_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E605BEA8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __59__RPCompanionLinkClient_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerRequestIDOnQueue:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_registerRequestIDOnQueue:(id)a3 options:(id)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(RPRequestRegistration);
  [(RPRequestRegistration *)v10 setRequestID:v14];
  [(RPRequestRegistration *)v10 setOptions:v8];
  [(RPRequestRegistration *)v10 setHandler:v9];

  requestRegistrations = self->_requestRegistrations;
  if (!requestRegistrations)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = self->_requestRegistrations;
    self->_requestRegistrations = v12;

    requestRegistrations = self->_requestRegistrations;
  }
  [(NSMutableDictionary *)requestRegistrations setObject:v10 forKeyedSubscript:v14];
  [(RPCompanionLinkClient *)self _registerRequestID:v14 options:v8 reregister:0];
}

- (void)_registerRequestID:(id)a3 options:(id)a4 reregister:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v14 = v8;
      LogPrintF();
    }
  }
  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  id v10 = [(RPCompanionLinkClient *)self _ensureXPCStarted];
  if (v10)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke;
    v18[3] = &unk_1E605BDE0;
    v18[4] = self;
    BOOL v20 = v5;
    id v12 = v8;
    id v19 = v12;
    id v13 = [(RPDaemonConnection *)daemonCnx remoteObjectProxyWithErrorHandler:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_2;
    v15[3] = &unk_1E605BDE0;
    void v15[4] = self;
    BOOL v17 = v5;
    id v16 = v12;
    [v13 companionLinkRegisterRequestID:v16 options:v9 completion:v15];
  }
}

void __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v7 = v3, int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        uint64_t v6 = v3;
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    id v8 = v3;
    int v5 = _LogCategory_Initialize();
    uint64_t v3 = v8;
    if (v5) {
      goto LABEL_7;
    }
  }
}

void __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    int v5 = [v4 _clientError:v3];
    if (*(unsigned char *)(a1 + 48))
    {
      if (gLogCategory_CLinkClient > 60 || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize()) {
        goto LABEL_14;
      }
    }
    else if (gLogCategory_CLinkClient > 60 {
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:

    goto LABEL_15;
  }
  if (v4[47])
  {
    uint64_t v6 = v4[34];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_3;
    block[3] = &unk_1E605B5D8;
    block[4] = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
LABEL_15:
}

uint64_t __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 376) + 16))();
}

- (void)_reregisterRequests
{
  if ([(NSMutableDictionary *)self->_requestRegistrations count]
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  requestRegistrations = self->_requestRegistrations;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__RPCompanionLinkClient__reregisterRequests__block_invoke;
  v4[3] = &unk_1E605BED0;
  v4[4] = self;
  [(NSMutableDictionary *)requestRegistrations enumerateKeysAndObjectsUsingBlock:v4];
}

void __44__RPCompanionLinkClient__reregisterRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v6 = [v4 requestID];
  int v5 = [v4 options];

  [v3 _registerRequestID:v6 options:v5 reregister:1];
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke;
  v7[3] = &unk_1E605B5D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke(uint64_t a1)
{
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "setObject:forKeyedSubscript:", 0, *(void *)(a1 + 32), v6);
  uint64_t v2 = [*(id *)(a1 + 40) _ensureXPCStarted];
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_2;
    v10[3] = &unk_1E605B568;
    v10[4] = v3;
    id v11 = *(id *)(a1 + 32);
    int v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_3;
    v8[3] = &unk_1E605B568;
    int8x16_t v7 = *(int8x16_t *)(a1 + 32);
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    [v5 companionLinkDeregisterRequestID:(id)v7.i64[0] completion:v8];
  }
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v3 = (void *)v2;
  if (gLogCategory_CLinkClient <= 60)
  {
    int v5 = (void *)v2;
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      int v5 = (void *)v2;
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v35 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  v33[3] = &unk_1E605BE30;
  v33[4] = &v36;
  v33[5] = v34;
  [(RPCompanionLinkClient *)self _startNWActivity:2 options:v15 result:v33];
  BOOL v17 = +[RPNWActivityUtils tokenForActivity:v37[5]];
  dispatchQueue = self->_dispatchQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_2;
  v24[3] = &unk_1E605BF20;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  uint64_t v28 = self;
  id v31 = v34;
  id v32 = &v36;
  id v29 = v17;
  id v30 = v16;
  id v19 = v17;
  id v20 = v16;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  dispatch_async(dispatchQueue, v24);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) valueForKey:@"highPriority"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    int v4 = "at high priority";
  }
  else {
    int v4 = "";
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v6;
  if (Int64)
  {
    int v8 = 10;
  }
  else if ([v6 isEqual:@"_ftSm"])
  {
    int v8 = 9;
  }
  else
  {
    int v8 = 9;
    if (([v7 isEqual:@"_ftLg"] & 1) == 0)
    {
      if ([v7 isEqual:@"_ftRs"]) {
        int v8 = 9;
      }
      else {
        int v8 = 30;
      }
    }
  }

  if (v8 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    uint64_t v26 = *(void *)(a1 + 48);
    id v27 = v4;
    uint64_t v24 = v9;
    uint64_t v25 = v10;
    LogPrintF();
  }
  id v11 = objc_msgSend(*(id *)(a1 + 56), "_ensureXPCStarted", v24, v25, v26, v27);
  if (v11)
  {
    +[RPNWActivityUtils failActivity:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) error:v11];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = *(void **)(v12 + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_3;
    v33[3] = &unk_1E605BE58;
    v33[4] = v12;
    id v34 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 88);
    id v35 = v14;
    uint64_t v37 = v15;
    id v36 = *(id *)(a1 + 72);
    id v16 = [v13 remoteObjectProxyWithErrorHandler:v33];
    BOOL v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v20 = *(void *)(a1 + 64);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_4;
    v28[3] = &unk_1E605BEF8;
    uint64_t v21 = *(void *)(a1 + 48);
    v28[4] = *(void *)(a1 + 56);
    id v29 = v17;
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 88);
    id v30 = v22;
    uint64_t v32 = v23;
    id v31 = *(id *)(a1 + 72);
    [v16 companionLinkSendRequestID:v29 request:v18 destinationID:v21 options:v19 nwActivityToken:v20 responseHandler:v28];
  }
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v8 = (id)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = (uint64_t)v8, v4))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = v3;
      uint64_t v5 = *(void *)(a1 + 40);
      LogPrintF();
      uint64_t v3 = (uint64_t)v8;
    }
  }
  +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3, v5, v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_4(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 _clientError:a4];
  id v19 = (id)v10;
  if (v10)
  {
    id v11 = (id)v10;
    if (gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || (v12 = _LogCategory_Initialize(), id v11 = v19, v12)))
    {
      uint64_t v16 = a1[6];
      id v18 = v11;
      uint64_t v14 = a1[5];
      LogPrintF();
      +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", *(void *)(*(void *)(a1[8] + 8) + 40), v19, v14, v16, v18);
    }
    else
    {
      +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", *(void *)(*(void *)(a1[8] + 8) + 40), v11, v13, v15, v17);
    }
  }
  else
  {
    nw_activity_complete_with_reason();
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)companionLinkReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t Int64 = CFDictionaryGetInt64();
  uint64_t v15 = [(NSMutableDictionary *)self->_requestRegistrations objectForKeyedSubscript:v10];
  uint64_t v16 = [v15 handler];

  if (v16)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke;
    v18[3] = &unk_1E605BF70;
    v18[4] = self;
    id v19 = v10;
    BOOL v21 = Int64 != 0;
    id v20 = v13;
    ((void (**)(void, id, id, void *))v16)[2](v16, v11, v12, v18);
  }
  else
  {
    uint64_t v17 = RPErrorF();
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v17);
  }
}

void __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 272);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke_2;
  v16[3] = &unk_1E605BF48;
  id v11 = *(id *)(a1 + 40);
  char v22 = *(unsigned char *)(a1 + 56);
  id v17 = v11;
  id v18 = v7;
  id v12 = *(id *)(a1 + 48);
  id v20 = v9;
  id v21 = v12;
  id v19 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v10, v16);
}

uint64_t __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  id v3 = *(id *)(a1 + 32);
  int v4 = v3;
  if (v2)
  {
    int v5 = 10;
  }
  else if ([v3 isEqual:@"_ftSm"])
  {
    int v5 = 9;
  }
  else
  {
    int v5 = 9;
    if (([v4 isEqual:@"_ftLg"] & 1) == 0)
    {
      if ([v4 isEqual:@"_ftRs"]) {
        int v5 = 9;
      }
      else {
        int v5 = 30;
      }
    }
  }

  if (v5 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    [*(id *)(a1 + 40) count];
    LogPrintF();
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v6();
}

- (void)companionLinkHandleDisconnect
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RPCompanionLinkClient_companionLinkHandleDisconnect__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __54__RPCompanionLinkClient_companionLinkHandleDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 176));
  if (v1)
  {
    int v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

- (void)launchAppWithBundleID:(id)a3 destinationID:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v16 = @"_bundleID";
  v17[0] = a3;
  id v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__RPCompanionLinkClient_launchAppWithBundleID_destinationID_completion___block_invoke;
  v14[3] = &unk_1E605BF98;
  id v15 = v8;
  id v13 = v8;
  [(RPCompanionLinkClient *)self sendRequestID:@"_launchApp" request:v12 destinationID:v10 options:0 responseHandler:v14];
}

uint64_t __72__RPCompanionLinkClient_launchAppWithBundleID_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)launchAppWithURL:(id)a3 destinationID:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v15 = @"_urlS";
  id v9 = a4;
  id v10 = [a3 absoluteString];
  v16[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__RPCompanionLinkClient_launchAppWithURL_destinationID_completion___block_invoke;
  v13[3] = &unk_1E605BF98;
  id v14 = v8;
  id v12 = v8;
  [(RPCompanionLinkClient *)self sendRequestID:@"_launchApp" request:v11 destinationID:v9 options:0 responseHandler:v13];
}

uint64_t __67__RPCompanionLinkClient_launchAppWithURL_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)triggerEnhancedDiscoveryForReason:(id)a3 completion:(id)a4
{
}

- (void)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke;
  v13[3] = &unk_1E605B6F0;
  id v14 = v8;
  id v15 = v9;
  unsigned int v16 = a4;
  void v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(dispatchQueue, v13);
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (!v2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    uint64_t v4 = v3;
    if (!v3) {
      uint64_t v4 = *(unsigned int *)(*(void *)(a1 + 32) + 104);
    }
    if (gLogCategory_CLinkClient > 30) {
      goto LABEL_18;
    }
    if (gLogCategory_CLinkClient == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_18:
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = *(void **)(v6 + 40);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_2;
        v13[3] = &unk_1E605BFC0;
        void v13[4] = v6;
        id v14 = *(id *)(a1 + 40);
        id v15 = *(id *)(a1 + 48);
        id v8 = [v7 remoteObjectProxyWithErrorHandler:v13];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_3;
        v10[3] = &unk_1E605BFC0;
        id v9 = *(void **)(a1 + 40);
        v10[4] = *(void *)(a1 + 32);
        id v11 = v9;
        id v12 = *(id *)(a1 + 48);
        [v8 companionLinkTriggerEnhancedDiscovery:v11 useCase:v4 completion:v10];

        goto LABEL_19;
      }
      LODWORD(v3) = *(_DWORD *)(a1 + 56);
    }
    if (v3 < 0x20000)
    {
      switch((int)v3)
      {
        case 65536:
        case 65537:
        case 65538:
        case 65539:
        case 65540:
        case 65541:
        case 65542:
        case 65543:
        case 65544:
        case 65545:
        case 65546:
        case 65547:
        case 65548:
        case 65549:
        case 65550:
        case 65551:
        case 65552:
        case 65553:
        case 65554:
        case 65555:
        case 65556:
        case 65557:
        case 65558:
        case 65559:
        case 65560:
        case 65561:
          break;
        default:
          JUMPOUT(0);
      }
    }
    LogPrintF();
    goto LABEL_18;
  }
  if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v2);
  }
LABEL_19:
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

- (void)createDeviceToEndpointMappingForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke;
  block[3] = &unk_1E605B628;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke(id *a1)
{
  int v2 = [a1[4] _ensureXPCStarted];
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = (void (**)(id, void, void *))a1[6];
    if (v8) {
      v8[2](v8, 0, v2);
    }
  }
  else
  {
    uint64_t v3 = a1[4];
    int v4 = (void *)v3[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_2;
    v12[3] = &unk_1E605BFC0;
    v12[4] = v3;
    id v13 = a1[5];
    id v14 = a1[6];
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v12];
    id v6 = [a1[5] identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_3;
    v9[3] = &unk_1E605BFE8;
    id v7 = a1[5];
    v9[4] = a1[4];
    id v10 = v7;
    id v11 = a1[6];
    [v5 companionLinkCreateDeviceToEndpointMappingForDeviceID:v6 completion:v9];
  }
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    uint64_t v3 = v6;
  }
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) _clientError:a3];
  if (v5
    && gLogCategory_CLinkClient <= 60
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v7, v5);
  }
}

- (void)setLocalDeviceAsContextCollectorWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }
  else
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      id v8 = [*(id *)(*(void *)(a1 + 32) + 344) idsDeviceIdentifier];
      LogPrintF();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_2;
    v11[3] = &unk_1E605BC60;
    v11[4] = v4;
    id v12 = *(id *)(a1 + 40);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_3;
    v9[3] = &unk_1E605BC60;
    id v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v6 companionLinkSetLocalDeviceAsContextCollector:v9];
  }
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

- (void)removeLocalDeviceAsContextCollectorWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }
  else
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      id v8 = [*(id *)(*(void *)(a1 + 32) + 344) idsDeviceIdentifier];
      LogPrintF();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_2;
    v11[3] = &unk_1E605BC60;
    v11[4] = v4;
    id v12 = *(id *)(a1 + 40);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_3;
    v9[3] = &unk_1E605BC60;
    id v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v6 companionLinkRemoveLocalDeviceAsContextCollector:v9];
  }
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

- (void)_startNWActivity:(unsigned int)a3 options:(id)a4 result:(id)a5
{
  id v10 = a4;
  id v6 = (void (**)(id, void *, void *))a5;
  id v7 = (void *)nw_activity_create();
  if (v10)
  {
    id v8 = (void *)[v10 mutableCopy];
    id v9 = [v8 objectForKeyedSubscript:@"nwActivity"];
    if (v9)
    {
      nw_activity_set_parent_activity();
      [v8 removeObjectForKey:@"nwActivity"];
    }
  }
  else
  {
    id v8 = 0;
  }
  nw_activity_activate();
  v6[2](v6, v7, v8);
}

- (void)registerProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RPCompanionLinkClient_registerProfileID_completion___block_invoke;
  block[3] = &unk_1E605BD68;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__RPCompanionLinkClient_registerProfileID_completion___block_invoke(void *a1)
{
  int v2 = *(void **)(a1[4] + 72);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;

    int v2 = *(void **)(a1[4] + 72);
  }
  [v2 addObject:a1[5]];
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  return [v6 _registerProfileID:v7 reregister:0 completion:v8];
}

- (void)_registerProfileID:(id)a3 reregister:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v15 = v8;
      LogPrintF();
    }
  }
  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  id v10 = [(RPCompanionLinkClient *)self _ensureXPCStarted];
  if (v10)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke;
    v20[3] = &unk_1E605C010;
    v20[4] = self;
    BOOL v23 = v6;
    id v12 = v8;
    id v21 = v12;
    id v13 = v9;
    id v22 = v13;
    id v14 = [(RPDaemonConnection *)daemonCnx remoteObjectProxyWithErrorHandler:v20];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke_2;
    v16[3] = &unk_1E605C010;
    void v16[4] = self;
    BOOL v19 = v6;
    id v17 = v12;
    id v18 = v13;
    [v14 companionLinkRegisterProfileID:v17 completion:v16];
  }
}

void __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v7 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

void __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v7 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      if (gLogCategory_CLinkClient <= 60)
      {
        if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
        {
LABEL_8:
          LogPrintF();
          id v3 = v7;
        }
      }
    }
    else if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1) {
        goto LABEL_8;
      }
      int v5 = _LogCategory_Initialize();
      id v3 = v7;
      if (v5) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

- (void)_reregisterProfileIDs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableOrderedSet *)self->_registeredProfileIDs count]
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = self->_registeredProfileIDs;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RPCompanionLinkClient _registerProfileID:reregister:completion:](self, "_registerProfileID:reregister:completion:", *(void *)(*((void *)&v8 + 1) + 8 * i), 1, 0, (void)v8);
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)deregisterProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke;
  block[3] = &unk_1E605BD68;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "removeObject:", *(void *)(a1 + 32), v8);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_2;
    v13[3] = &unk_1E605BFC0;
    void v13[4] = v2;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v13];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_3;
    v10[3] = &unk_1E605BFC0;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v5 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    id v12 = *(id *)(a1 + 48);
    [v4 companionLinkDeregisterProfileID:v5 completion:v10];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v6 = v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_uint64_t passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (double)awdlGuestDiscoveryTimeout
{
  return self->_awdlGuestDiscoveryTimeout;
}

- (int64_t)bleClientUseCase
{
  return self->_bleClientUseCase;
}

- (void)setBleClientUseCase:(int64_t)a3
{
  self->_int64_t bleClientUseCase = a3;
}

- (NSString)cloudServiceID
{
  return self->_cloudServiceID;
}

- (void)setCloudServiceID:(id)a3
{
}

- (void)setDestinationDevice:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)errorFlagsChangedHandler
{
  return self->_errorFlagsChangedHandler;
}

- (void)setErrorFlagsChangedHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (RPCompanionLinkDevice)localDevice
{
  return (RPCompanionLinkDevice *)objc_getProperty(self, a2, 344, 1);
}

- (id)localDeviceUpdatedHandler
{
  return self->_localDeviceUpdatedHandler;
}

- (void)setLocalDeviceUpdatedHandler:(id)a3
{
}

- (BOOL)usingOnDemandConnection
{
  return self->_usingOnDemandConnection;
}

- (void)setUsingOnDemandConnection:(BOOL)a3
{
  self->_int usingOnDemandConnection = a3;
}

- (NSDictionary)siriInfo
{
  return self->_siriInfo;
}

- (id)stateUpdatedHandler
{
  return self->_stateUpdatedHandler;
}

- (void)setStateUpdatedHandler:(id)a3
{
}

- (id)requestIDRegistrationCompletion
{
  return self->_requestIDRegistrationCompletion;
}

- (void)setRequestIDRegistrationCompletion:(id)a3
{
}

- (id)eventIDRegistrationCompletion
{
  return self->_eventIDRegistrationCompletion;
}

- (void)setEventIDRegistrationCompletion:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_int64_t clientID = a3;
}

- (BOOL)encodeSensitiveProperties
{
  return self->_encodeSensitiveProperties;
}

- (void)setEncodeSensitiveProperties:(BOOL)a3
{
  self->_encodeSensitiveProperties = a3;
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (BOOL)reactivateCalled
{
  return self->_reactivateCalled;
}

- (void)setReactivateCalled:(BOOL)a3
{
  self->_reactivateCalled = a3;
}

@end