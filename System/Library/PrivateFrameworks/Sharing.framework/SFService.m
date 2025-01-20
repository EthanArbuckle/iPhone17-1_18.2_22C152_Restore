@interface SFService
+ (BOOL)supportsSecureCoding;
- (BOOL)autoUnlockEnabled;
- (BOOL)autoUnlockWatch;
- (BOOL)duetSync;
- (BOOL)hasProblem;
- (BOOL)isCLIMode;
- (BOOL)needsAWDL;
- (BOOL)needsKeyboard;
- (BOOL)needsSetup;
- (BOOL)overrideScreenOff;
- (BOOL)pairSetupDisabled;
- (BOOL)supportsAirPlayReceiver;
- (BOOL)touchRemoteEnabled;
- (BOOL)wakeDevice;
- (BOOL)watchLocked;
- (BOOL)wifiP2P;
- (CUAppleIDClient)myAppleIDInfoClient;
- (NSData)authTagOverride;
- (NSData)targetAuthTag;
- (NSDictionary)pairSetupACL;
- (NSDictionary)pairVerifyACL;
- (NSString)fixedPIN;
- (NSString)forcedPin;
- (NSString)identifier;
- (NSString)label;
- (NSString)myAppleID;
- (NSString)peerAppleID;
- (NSString)requestSSID;
- (NSUUID)serviceUUID;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (SFService)init;
- (SFService)initWithCoder:(id)a3;
- (id)description;
- (id)errorHandler;
- (id)eventMessageHandler;
- (id)hidePINHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairSetupCompletionHandler;
- (id)peerDisconnectedHandler;
- (id)promptForPINHandler;
- (id)receivedFramePeerHandler;
- (id)receivedObjectHandler;
- (id)receivedRequestHandler;
- (id)requestMessageHandler;
- (id)responseMessageInternalHandler;
- (id)sendFramePeerHandler;
- (id)sessionEndedHandler;
- (id)sessionSecuredHandler;
- (id)sessionStartedHandler;
- (id)showPINHandler;
- (id)showPINHandlerEx;
- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6 peer:(id)a7;
- (int64_t)advertiseRate;
- (unint64_t)problemFlags;
- (unsigned)deviceActionType;
- (unsigned)deviceClassCode;
- (unsigned)deviceColorCode;
- (unsigned)deviceModelCode;
- (unsigned)pinType;
- (unsigned)serviceType;
- (unsigned)sessionFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_activated;
- (void)_cleanup;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_performActivateSafeChange:(id)a3;
- (void)_sendToPeer:(id)a3 type:(unsigned __int8)a4 data:(id)a5;
- (void)_sendToPeer:(id)a3 type:(unsigned __int8)a4 unencryptedObject:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)clearEncryptionInfoForPeer:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3 peer:(id)a4;
- (void)pairSetupWithFlags:(unsigned int)a3 peer:(id)a4;
- (void)sendEvent:(id)a3;
- (void)sendRequest:(id)a3;
- (void)sendResponse:(id)a3;
- (void)sendToPeer:(id)a3 flags:(unsigned int)a4 object:(id)a5;
- (void)sendToPeer:(id)a3 type:(unsigned __int8)a4 data:(id)a5;
- (void)serviceError:(id)a3;
- (void)servicePeerDisconnected:(id)a3 error:(id)a4;
- (void)serviceReceivedEvent:(id)a3;
- (void)serviceReceivedFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5;
- (void)serviceReceivedRequest:(id)a3;
- (void)serviceReceivedResponse:(id)a3;
- (void)serviceSessionFailed:(id)a3 error:(id)a4;
- (void)setAdvertiseRate:(int64_t)a3;
- (void)setAuthTagOverride:(id)a3;
- (void)setAutoUnlockEnabled:(BOOL)a3;
- (void)setAutoUnlockWatch:(BOOL)a3;
- (void)setDeviceActionType:(unsigned __int8)a3;
- (void)setDeviceClassCode:(unsigned __int8)a3;
- (void)setDeviceColorCode:(unsigned __int8)a3;
- (void)setDeviceModelCode:(unsigned __int8)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDuetSync:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setEventMessageHandler:(id)a3;
- (void)setFixedPIN:(id)a3;
- (void)setForcedPin:(id)a3;
- (void)setHasProblem:(BOOL)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMyAppleID:(id)a3;
- (void)setMyAppleIDInfoClient:(id)a3;
- (void)setNeedsAWDL:(BOOL)a3;
- (void)setNeedsKeyboard:(BOOL)a3;
- (void)setNeedsSetup:(BOOL)a3;
- (void)setOverrideScreenOff:(BOOL)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupCompletionHandler:(id)a3;
- (void)setPairSetupDisabled:(BOOL)a3;
- (void)setPairVerifyACL:(id)a3;
- (void)setPeerAppleID:(id)a3;
- (void)setPeerDisconnectedHandler:(id)a3;
- (void)setPinType:(unsigned int)a3;
- (void)setProblemFlags:(unint64_t)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setReceivedFramePeerHandler:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setRequestMessageHandler:(id)a3;
- (void)setRequestSSID:(id)a3;
- (void)setResponseMessageInternalHandler:(id)a3;
- (void)setSendFramePeerHandler:(id)a3;
- (void)setServiceType:(unsigned __int8)a3;
- (void)setServiceUUID:(id)a3;
- (void)setSessionEndedHandler:(id)a3;
- (void)setSessionFlags:(unsigned int)a3;
- (void)setSessionSecuredHandler:(id)a3;
- (void)setSessionStartedHandler:(id)a3;
- (void)setShowPINHandler:(id)a3;
- (void)setShowPINHandlerEx:(id)a3;
- (void)setSupportsAirPlayReceiver:(BOOL)a3;
- (void)setTargetAuthTag:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTouchRemoteEnabled:(BOOL)a3;
- (void)setWakeDevice:(BOOL)a3;
- (void)setWatchLocked:(BOOL)a3;
- (void)setWifiP2P:(BOOL)a3;
- (void)updateWithService:(id)a3;
@end

@implementation SFService

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (BOOL)needsKeyboard
{
  return self->_needsKeyboard;
}

- (int64_t)advertiseRate
{
  return self->_advertiseRate;
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (unsigned)deviceModelCode
{
  return self->_deviceModelCode;
}

- (unsigned)deviceColorCode
{
  return self->_deviceColorCode;
}

- (unsigned)deviceClassCode
{
  return self->_deviceClassCode;
}

- (NSData)authTagOverride
{
  return self->_authTagOverride;
}

- (BOOL)watchLocked
{
  return self->_watchLocked;
}

- (BOOL)needsAWDL
{
  return self->_needsAWDL;
}

- (BOOL)duetSync
{
  return self->_duetSync;
}

- (BOOL)autoUnlockWatch
{
  return self->_autoUnlockWatch;
}

- (BOOL)autoUnlockEnabled
{
  return self->_autoUnlockEnabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFService;
  v2 = [(SFService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucatCore = (LogCategory *)&gLogCategory_SFServiceCore;
    v3->_ucatCrypto = (LogCategory *)&gLogCategory_SFServiceCrypto;
  }
  return v3;
}

- (SFService)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFService;
  v5 = [(SFService *)&v26 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = SFMainQueue(v5);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    v6->_ucatCore = (LogCategory *)&gLogCategory_SFServiceCore;
    v6->_ucatCrypto = (LogCategory *)&gLogCategory_SFServiceCrypto;
    if ([v4 containsValueForKey:@"advR"]) {
      v6->_advertiseRate = [v4 decodeIntegerForKey:@"advR"];
    }
    id v9 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ([v9 containsValueForKey:@"auE"]) {
      v6->_autoUnlockEnabled = [v9 decodeBoolForKey:@"auE"];
    }
    if ([v9 containsValueForKey:@"auW"]) {
      v6->_autoUnlockWatch = [v9 decodeBoolForKey:@"auW"];
    }
    if ([v9 containsValueForKey:@"dat"]) {
      v6->_deviceActionType = [v9 decodeIntegerForKey:@"dat"];
    }
    if ([v9 containsValueForKey:@"deviceClassCode"]) {
      v6->_deviceClassCode = [v9 decodeIntegerForKey:@"deviceClassCode"];
    }
    if ([v9 containsValueForKey:@"deviceColorCode"]) {
      v6->_deviceColorCode = [v9 decodeIntegerForKey:@"deviceColorCode"];
    }
    if ([v9 containsValueForKey:@"deviceModelCode"]) {
      v6->_deviceModelCode = [v9 decodeIntegerForKey:@"deviceModelCode"];
    }
    id v10 = v9;
    if ([v10 containsValueForKey:@"ds"]) {
      v6->_duetSync = [v10 decodeBoolForKey:@"ds"];
    }

    if ([v10 containsValueForKey:@"prob"]) {
      v6->_hasProblem = [v10 decodeBoolForKey:@"prob"];
    }
    if ([v10 containsValueForKey:@"ident"])
    {
      uint64_t v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"ident"];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v11;
    }
    id v13 = v10;
    if ([v13 containsValueForKey:@"awdl"]) {
      v6->_needsAWDL = [v13 decodeBoolForKey:@"awdl"];
    }

    if ([v13 containsValueForKey:@"kb"]) {
      v6->_needsKeyboard = [v13 decodeBoolForKey:@"kb"];
    }
    if ([v13 containsValueForKey:@"setup"]) {
      v6->_needsSetup = [v13 decodeBoolForKey:@"setup"];
    }
    id v14 = v13;
    if ([v14 containsValueForKey:@"oso"]) {
      v6->_overrideScreenOff = [v14 decodeBoolForKey:@"oso"];
    }

    id v15 = v14;
    if ([v15 containsValueForKey:@"pf"]) {
      v6->_problemFlags = [v15 decodeInt64ForKey:@"pf"];
    }

    if ([v15 containsValueForKey:@"st"])
    {
      unint64_t v16 = [v15 decodeIntegerForKey:@"st"];
      v6->_serviceType = v16;
      if (v16 >= 0x100)
      {
        v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3C8];
        v19 = _NSMethodExceptionProem();
        [v17 raise:v18, @"%@: service type out-of-range: %ld", v19, v16 format];
      }
    }
    id v20 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ([v20 containsValueForKey:@"svid"])
    {
      uint64_t v21 = [v20 decodeObjectOfClass:objc_opt_class() forKey:@"svid"];
      serviceUUID = v6->_serviceUUID;
      v6->_serviceUUID = (NSUUID *)v21;
    }
    uint64_t v27 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_sessionFlags = v27;
    }
    if ([v20 containsValueForKey:@"wake"]) {
      v6->_wakeDevice = [v20 decodeBoolForKey:@"wake"];
    }
    id v23 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ([v23 containsValueForKey:@"wl"]) {
      v6->_watchLocked = [v23 decodeBoolForKey:@"wl"];
    }
    v24 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t advertiseRate = self->_advertiseRate;
  id v13 = v4;
  if (advertiseRate)
  {
    [v4 encodeInteger:advertiseRate forKey:@"advR"];
    id v4 = v13;
  }
  authTagOverride = self->_authTagOverride;
  if (authTagOverride)
  {
    [v13 encodeObject:authTagOverride forKey:@"ato"];
    id v4 = v13;
  }
  if (self->_autoUnlockEnabled)
  {
    [v13 encodeBool:1 forKey:@"auE"];
    id v4 = v13;
  }
  if (self->_autoUnlockWatch)
  {
    [v13 encodeBool:1 forKey:@"auW"];
    id v4 = v13;
  }
  if (self->_deviceActionType)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    id v4 = v13;
  }
  if (self->_deviceClassCode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    id v4 = v13;
  }
  if (self->_deviceColorCode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    id v4 = v13;
  }
  if (self->_deviceModelCode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    id v4 = v13;
  }
  if (self->_duetSync)
  {
    [v13 encodeBool:1 forKey:@"ds"];
    id v4 = v13;
  }
  if (self->_hasProblem)
  {
    [v13 encodeBool:1 forKey:@"prob"];
    id v4 = v13;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v13 encodeObject:identifier forKey:@"ident"];
    id v4 = v13;
  }
  if (self->_needsAWDL)
  {
    [v13 encodeBool:1 forKey:@"awdl"];
    id v4 = v13;
  }
  if (self->_needsKeyboard)
  {
    [v13 encodeBool:1 forKey:@"kb"];
    id v4 = v13;
  }
  if (self->_needsSetup)
  {
    [v13 encodeBool:1 forKey:@"setup"];
    id v4 = v13;
  }
  if (self->_overrideScreenOff)
  {
    [v13 encodeBool:1 forKey:@"oso"];
    id v4 = v13;
  }
  unint64_t problemFlags = self->_problemFlags;
  if (problemFlags)
  {
    [v13 encodeInt64:problemFlags forKey:@"pf"];
    id v4 = v13;
  }
  requestSSID = self->_requestSSID;
  if (requestSSID)
  {
    [v13 encodeObject:requestSSID forKey:@"rSSID"];
    id v4 = v13;
  }
  if (self->_serviceType)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    id v4 = v13;
  }
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    [v13 encodeObject:serviceUUID forKey:@"svid"];
    id v4 = v13;
  }
  uint64_t sessionFlags = self->_sessionFlags;
  if (sessionFlags)
  {
    [v13 encodeInteger:sessionFlags forKey:@"seFl"];
    id v4 = v13;
  }
  targetAuthTag = self->_targetAuthTag;
  if (targetAuthTag)
  {
    [v13 encodeObject:targetAuthTag forKey:@"tATag"];
    id v4 = v13;
  }
  if (self->_wakeDevice)
  {
    [v13 encodeBool:1 forKey:@"wake"];
    id v4 = v13;
  }
  if (self->_watchLocked)
  {
    [v13 encodeBool:1 forKey:@"wl"];
    id v4 = v13;
  }
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v5 = (SFService *)FatalErrorF();
    [(SFService *)v5 _cleanup];
  }
  else
  {
    [(SFService *)self _cleanup];
    ucatCore = self->_ucatCore;
    if (ucatCore && (ucatCore->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucatCore = 0;
    }
    ucatCrypto = self->_ucatCrypto;
    if (ucatCrypto)
    {
      if ((ucatCrypto->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucatCrypto = 0;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)SFService;
    [(SFService *)&v7 dealloc];
  }
}

- (void)_cleanup
{
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  id eventMessageHandler = self->_eventMessageHandler;
  self->_id eventMessageHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id pairSetupCompletionHandler = self->_pairSetupCompletionHandler;
  self->_id pairSetupCompletionHandler = 0;

  id peerDisconnectedHandler = self->_peerDisconnectedHandler;
  self->_id peerDisconnectedHandler = 0;

  id receivedFramePeerHandler = self->_receivedFramePeerHandler;
  self->_id receivedFramePeerHandler = 0;

  id receivedObjectHandler = self->_receivedObjectHandler;
  self->_id receivedObjectHandler = 0;

  id requestMessageHandler = self->_requestMessageHandler;
  self->_id requestMessageHandler = 0;

  id responseMessageInternalHandler = self->_responseMessageInternalHandler;
  self->_id responseMessageInternalHandler = 0;

  id sessionStartedHandler = self->_sessionStartedHandler;
  self->_id sessionStartedHandler = 0;

  id sessionEndedHandler = self->_sessionEndedHandler;
  self->_id sessionEndedHandler = 0;

  id sessionSecuredHandler = self->_sessionSecuredHandler;
  self->_id sessionSecuredHandler = 0;

  id showPINHandler = self->_showPINHandler;
  self->_id showPINHandler = 0;

  id showPINHandlerEx = self->_showPINHandlerEx;
  self->_id showPINHandlerEx = 0;

  id hidePINHandler = self->_hidePINHandler;
  self->_id hidePINHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;
}

- (id)description
{
  v29[1] = 0;
  NSAppendPrintF();
  id v3 = 0;
  int serviceType = self->_serviceType;
  if (self->_serviceType)
  {
    v29[0] = v3;
    SFNearbyBLEServiceTypeToString(serviceType);
    v5 = (id *)v29;
  }
  else
  {
    if (!self->_identifier) {
      goto LABEL_6;
    }
    id v28 = v3;
    v5 = &v28;
  }
  NSAppendPrintF();
  id v6 = *v5;

  id v3 = v6;
LABEL_6:
  if (self->_invalidateCalled)
  {
    NSAppendPrintF();
    id v7 = v3;

    id v3 = v7;
  }
  if (self->_advertiseRate)
  {
    NSAppendPrintF();
    id v9 = v3;

    id v3 = v9;
  }
  authTagOverride = self->_authTagOverride;
  if (authTagOverride)
  {
    objc_super v26 = authTagOverride;
    NSAppendPrintF();
    id v11 = v3;

    id v3 = v11;
  }
  if (self->_autoUnlockEnabled)
  {
    NSAppendPrintF();
    id v12 = v3;

    id v3 = v12;
  }
  if (self->_autoUnlockWatch)
  {
    NSAppendPrintF();
    id v13 = v3;

    id v3 = v13;
  }
  if (self->_deviceActionType)
  {
    SFDeviceActionTypeToString(self->_deviceActionType);
    NSAppendPrintF();
    id v14 = v3;

    id v3 = v14;
  }
  if (self->_duetSync)
  {
    NSAppendPrintF();
    id v15 = v3;

    id v3 = v15;
  }
  if (self->_needsAWDL)
  {
    NSAppendPrintF();
    id v16 = v3;

    id v3 = v16;
  }
  if (self->_needsKeyboard)
  {
    NSAppendPrintF();
    id v17 = v3;

    id v3 = v17;
  }
  if (self->_needsSetup)
  {
    SFDeviceActionTypeToString(self->_deviceActionType);
    NSAppendPrintF();
    id v18 = v3;

    id v3 = v18;
  }
  if (self->_overrideScreenOff)
  {
    NSAppendPrintF();
    id v19 = v3;

    id v3 = v19;
  }
  if (self->_requestSSID)
  {
    NSAppendPrintF();
    id v20 = v3;

    id v3 = v20;
  }
  if (self->_sessionFlags)
  {
    NSAppendPrintF();
    id v21 = v3;

    id v3 = v21;
  }
  targetAuthTag = self->_targetAuthTag;
  if (targetAuthTag)
  {
    uint64_t v27 = targetAuthTag;
    NSAppendPrintF();
    id v23 = v3;

    id v3 = v23;
  }
  if (self->_watchLocked)
  {
    NSAppendPrintF();
    id v24 = v3;

    id v3 = v24;
  }

  return v3;
}

- (void)setAdvertiseRate:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__SFService_setAdvertiseRate___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  v3[5] = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __30__SFService_setAdvertiseRate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = *(void *)(result + 40);
  return result;
}

- (void)setAutoUnlockEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__SFService_setAutoUnlockEnabled___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __34__SFService_setAutoUnlockEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 99) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setAutoUnlockWatch:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__SFService_setAutoUnlockWatch___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __32__SFService_setAutoUnlockWatch___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 100) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__SFService_setDeviceActionType___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __33__SFService_setDeviceActionType___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDuetSync:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__SFService_setDuetSync___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __25__SFService_setDuetSync___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 89) = *(unsigned char *)(result + 40);
  return result;
}

- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6 peer:(id)a7
{
  id v11 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:a7];
  id v12 = v11;
  if (v11) {
    int v13 = [v11 setEncryptionReadKey:a3 readKeyLen:a4 writeKey:a5 writeKeyLen:a6];
  }
  else {
    int v13 = -6727;
  }

  return v13;
}

- (void)clearEncryptionInfoForPeer:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:a3];
  [v3 clearEncryptionInfo];
}

- (void)setHasProblem:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__SFService_setHasProblem___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __27__SFService_setHasProblem___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 95) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setLabel:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  label = self->_label;
  self->_label = v4;

  [(NSString *)self->_label UTF8String];
  ASPrintF();
}

- (void)setNeedsAWDL:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__SFService_setNeedsAWDL___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __26__SFService_setNeedsAWDL___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 90) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setNeedsKeyboard:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__SFService_setNeedsKeyboard___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __30__SFService_setNeedsKeyboard___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 91) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setNeedsSetup:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__SFService_setNeedsSetup___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __27__SFService_setNeedsSetup___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 92) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setProblemFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__SFService_setProblemFlags___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  void v3[5] = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __29__SFService_setProblemFlags___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 352) = *(void *)(result + 40);
  return result;
}

- (void)setTargetAuthTag:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SFService_setTargetAuthTag___block_invoke;
  v6[3] = &unk_1E5BBBD18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SFService *)self _performActivateSafeChange:v6];
}

void __30__SFService_setTargetAuthTag___block_invoke(uint64_t a1)
{
}

- (void)setWakeDevice:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__SFService_setWakeDevice___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __27__SFService_setWakeDevice___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 97) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setWatchLocked:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__SFService_setWatchLocked___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFService *)self _performActivateSafeChange:v3];
}

uint64_t __28__SFService_setWatchLocked___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 106) = *(unsigned char *)(result + 40);
  return result;
}

- (void)updateWithService:(id)a3
{
  id v6 = a3;
  if ([v6 advertiseRate]) {
    self->_int64_t advertiseRate = [v6 advertiseRate];
  }
  self->_autoUnlockEnabled = [v6 autoUnlockEnabled];
  self->_autoUnlockWatch = [v6 autoUnlockWatch];
  self->_deviceActionType = [v6 deviceActionType];
  self->_duetSync = [v6 duetSync];
  self->_hasProblem = [v6 hasProblem];
  self->_needsAWDL = [v6 needsAWDL];
  self->_needsKeyboard = [v6 needsKeyboard];
  self->_needsSetup = [v6 needsSetup];
  self->_unint64_t problemFlags = [v6 problemFlags];
  self->_wakeDevice = [v6 wakeDevice];
  self->_watchLocked = [v6 watchLocked];
  BOOL v4 = [v6 targetAuthTag];
  targetAuthTag = self->_targetAuthTag;
  self->_targetAuthTag = v4;
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
  v8[2] = __36__SFService_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __36__SFService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  unsigned int v32 = 0;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    id v9 = 0;
    uint64_t v20 = 4294960572;
  }
  else
  {
    id v9 = self->_identifier;
    if (v9)
    {
      int serviceType = self->_serviceType;
      if (!self->_serviceType)
      {
        int serviceType = SFServiceIdentifierToType(v9);
        self->_int serviceType = serviceType;
      }
      if (self->_serviceUUID) {
        goto LABEL_35;
      }
      SFServiceTypeToUUID(serviceType);
      id v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      serviceUUID = self->_serviceUUID;
      self->_serviceUUID = v11;

      if (self->_serviceUUID
        || (SFServiceIdentifierToUUID(v9, (int *)&v32),
            int v13 = (NSUUID *)objc_claimAutoreleasedReturnValue(),
            id v14 = self->_serviceUUID,
            self->_serviceUUID = v13,
            v14,
            self->_serviceUUID))
      {
LABEL_35:
        if (!self->_requestQueue)
        {
          id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          requestQueue = self->_requestQueue;
          self->_requestQueue = v15;
        }
        [(SFService *)self _ensureXPCStarted];
        self->_activateInProgress = 1;
        xpcCnx = self->_xpcCnx;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __37__SFService__activateWithCompletion___block_invoke;
        v30[3] = &unk_1E5BBD618;
        v30[4] = self;
        id v18 = v6;
        id v31 = v18;
        id v19 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v30];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __37__SFService__activateWithCompletion___block_invoke_2;
        v28[3] = &unk_1E5BBD618;
        v28[4] = self;
        id v29 = v18;
        [v19 serviceActivate:self completion:v28];

        unsigned int v32 = 0;
        goto LABEL_15;
      }
      uint64_t v20 = 4294960588;
    }
    else
    {
      uint64_t v20 = 4294960551;
    }
  }
  unsigned int v32 = v20;
  int v21 = self->_ucatCore->var0;
  if (v21 <= 60)
  {
    if (v21 != -1)
    {
LABEL_21:
      uint64_t v27 = v20;
      LogPrintF();
      goto LABEL_23;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v20 = v32;
      goto LABEL_21;
    }
  }
LABEL_23:
  if (v6)
  {
    uint64_t v22 = (int)v32;
    if (v32)
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      uint64_t v24 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v3 = (void *)v24;
      v25 = @"?";
      if (v24) {
        v25 = (__CFString *)v24;
      }
      v35[0] = v25;
      id v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1, v27);
      objc_super v26 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:v22 userInfo:v4];
    }
    else
    {
      objc_super v26 = 0;
    }
    (*((void (**)(id, void *))v6 + 2))(v6, v26);
    if (v22)
    {
    }
  }
LABEL_15:

  os_activity_scope_leave(&state);
}

void __37__SFService__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 11))
  {
    int v5 = **(_DWORD **)(v4 + 32);
    if (v5 <= 60)
    {
      id v8 = v3;
      if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v3 = v8, v6))
      {
        LogPrintF();
        id v3 = v8;
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v9 = v3;
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    id v3 = v9;
  }
}

void __37__SFService__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  if (!v3)
  {
    [(id)v4 _activated];
    goto LABEL_7;
  }
  if (!*(unsigned char *)(v4 + 11))
  {
    int v5 = **(_DWORD **)(v4 + 32);
    if (v5 <= 60)
    {
      if (v5 != -1 || (int v7 = _LogCategory_Initialize(), v3 = v8, v7))
      {
        LogPrintF();
LABEL_7:
        id v3 = v8;
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    id v3 = v8;
  }
}

- (void)_activated
{
  self->_activateCompleted = 1;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    if (testListenerEndpoint) {
      int v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:self->_testListenerEndpoint];
    }
    else {
      int v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.SharingServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    int v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__SFService__ensureXPCStarted__block_invoke;
    v11[3] = &unk_1E5BBC870;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__SFService__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_1E5BBC870;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39800];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
    int var0 = self->_ucatCore->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t __30__SFService__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __30__SFService__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucatCore->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  *(_WORD *)&self->_activateInProgress = 0;
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  if (self->_activateCalled)
  {
    int v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    int v6 = self->_ucatCore->var0;
    if (v6 <= 50 && (v6 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFService *)self _ensureXPCStarted];
    self->_activateInProgress = 1;
    xpcCnx = self->_xpcCnx;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __25__SFService__interrupted__block_invoke;
    v10[3] = &unk_1E5BBC8E8;
    v10[4] = self;
    id v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__SFService__interrupted__block_invoke_2;
    v9[3] = &unk_1E5BBC8E8;
    v9[4] = self;
    [v8 serviceActivate:self completion:v9];

    os_activity_scope_leave(&state);
  }
}

void __25__SFService__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  if (v3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 32);
    if (v4 <= 60)
    {
      id v6 = v3;
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = v6, v5))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
}

void __25__SFService__interrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  int v4 = *(_DWORD ***)(a1 + 32);
  if (!v3)
  {
    id v7 = 0;
    [v4 _activated];
    goto LABEL_6;
  }
  int v5 = *v4[4];
  if (v5 <= 60)
  {
    id v7 = v3;
    if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v3 = v7, v6))
    {
      LogPrintF();
LABEL_6:
      id v3 = v7;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SFService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__SFService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 11))
  {
    *(unsigned char *)(v1 + 11) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }
    int v6 = *(void **)(v3 + 80);
    if (v6)
    {
      [v6 invalidate];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = 0;
    }
    else
    {
      [(id)v3 _invalidated];
    }
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    [(NSMutableDictionary *)self->_requestQueue enumerateKeysAndObjectsUsingBlock:&__block_literal_global_64];
    [(NSMutableDictionary *)self->_requestQueue removeAllObjects];
    requestQueue = self->_requestQueue;
    self->_requestQueue = 0;

    sessions = self->_sessions;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__SFService__invalidated__block_invoke_2;
    v9[3] = &unk_1E5BC0268;
    v9[4] = self;
    [(NSMutableDictionary *)sessions enumerateKeysAndObjectsUsingBlock:v9];
    [(NSMutableDictionary *)self->_sessions removeAllObjects];
    int v6 = self->_sessions;
    self->_sessions = 0;

    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    [(SFService *)self _cleanup];
    self->_invalidateDone = 1;
    int v8 = self->_ucatCore->var0;
    if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void __25__SFService__invalidated__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 responseHandler];

  if (v4)
  {
    int v5 = [v3 responseHandler];
    int v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28760];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v8 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v9 = (void *)v8;
    id v10 = @"?";
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    v14[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v12 = [v6 errorWithDomain:v7 code:-6723 userInfo:v11];
    ((void (**)(void, void *, void))v5)[2](v5, v12, 0);
  }
  [v3 invalidate];
}

void __25__SFService__invalidated__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 272);
  if (v5)
  {
    int v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28760];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v8 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v9 = (void *)v8;
    id v10 = @"?";
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    v14[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v12 = [v6 errorWithDomain:v7 code:-6723 userInfo:v11];
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v4, v12);
  }
  [v4 invalidate];
}

- (void)_performActivateSafeChange:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    int v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceUpdate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    dispatchQueue = v5->_dispatchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__SFService__performActivateSafeChange___block_invoke;
    v8[3] = &unk_1E5BBC9C8;
    v8[4] = v5;
    id v9 = v4;
    dispatch_async(dispatchQueue, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

void __40__SFService__performActivateSafeChange___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) remoteObjectProxy];
  [v2 serviceUpdate:*(void *)(a1 + 32)];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  [v4 setIdentifier:v5];

  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__SFService_sendEvent___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);
}

void __23__SFService_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80))
  {
    id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceSendEvent", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 80) remoteObjectProxy];
    [v4 serviceSendEvent:*(void *)(a1 + 40)];

    os_activity_scope_leave(&state);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 32);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)sendRequest:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F29128] UUID];
  [v4 setIdentifier:v5];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__SFService_sendRequest___block_invoke;
  block[3] = &unk_1E5BBD418;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(dispatchQueue, block);
}

void __25__SFService_sendRequest___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 80))
  {
    id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceSendRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = [*(id *)(a1[4] + 80) remoteObjectProxy];
    [v4 serviceSendRequest:a1[5]];

    [*(id *)(a1[4] + 16) setObject:a1[5] forKeyedSubscript:a1[6]];
    os_activity_scope_leave(&state);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 32);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)sendResponse:(id)a3
{
  id v4 = a3;
  int v5 = [v4 identifier];

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__SFService_sendResponse___block_invoke;
    block[3] = &unk_1E5BBBD18;
    block[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    uint64_t v8 = FatalErrorF();
    __26__SFService_sendResponse___block_invoke(v8);
  }
}

void __26__SFService_sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80))
  {
    id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceSendResponse", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 80) remoteObjectProxy];
    [v4 serviceSendResponse:*(void *)(a1 + 40)];

    os_activity_scope_leave(&state);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 32);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)sendToPeer:(id)a3 flags:(unsigned int)a4 object:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  if (v6)
  {
    id v11 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v12 = __37__SFService_sendToPeer_flags_object___block_invoke;
  }
  else
  {
    id v11 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v12 = __37__SFService_sendToPeer_flags_object___block_invoke_2;
  }
  v11[2] = v12;
  v11[3] = &unk_1E5BBD418;
  v11[4] = self;
  id v13 = v8;
  void v11[5] = v13;
  id v14 = v9;
  v11[6] = v14;
  dispatch_async(dispatchQueue, v11);
}

void __37__SFService_sendToPeer_flags_object___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  id v3 = v2;
  char v6 = v2;
  if (v2)
  {
    [v2 sendEncryptedObject:a1[6]];
LABEL_3:
    id v3 = v6;
    goto LABEL_4;
  }
  int v4 = **(_DWORD **)(a1[4] + 32);
  if (v4 <= 60)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:
}

void __37__SFService_sendToPeer_flags_object___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v5 = v2;
  if (v2) {
    LOBYTE(v3) = [v2 sessionFlags];
  }
  else {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 112);
  }
  if ((v3 & 2) != 0) {
    uint64_t v4 = 29;
  }
  else {
    uint64_t v4 = 5;
  }
  [*(id *)(a1 + 32) _sendToPeer:*(void *)(a1 + 40) type:v4 unencryptedObject:*(void *)(a1 + 48)];
}

- (void)_sendToPeer:(id)a3 type:(unsigned __int8)a4 unencryptedObject:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v22 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t DataMutable = OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_24;
  }
  id v11 = (void *)DataMutable;
  if (v6 != 29) {
    goto LABEL_5;
  }
  uint64_t v21 = 0;
  uint64_t v12 = NSDataCompress();
  id v13 = 0;

  if (!v12)
  {
    int v19 = self->_ucatCore->var0;
    if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

LABEL_24:
    id v11 = 0;
    goto LABEL_13;
  }

  id v11 = (void *)v12;
LABEL_5:
  if (self->_xpcCnx)
  {
    id v14 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceSendFrameType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);
    id v15 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v15 serviceSendFrameType:v6 data:v11 peer:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    sendFramePeerHandler = (void (**)(id, void, void *, id))self->_sendFramePeerHandler;
    if (sendFramePeerHandler)
    {
      sendFramePeerHandler[2](sendFramePeerHandler, v6, v11, v8);
    }
    else
    {
      int v17 = self->_ucatCore->var0;
      if (v17 <= 60 && (v17 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
LABEL_13:
}

- (void)sendToPeer:(id)a3 type:(unsigned __int8)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__SFService_sendToPeer_type_data___block_invoke;
  v13[3] = &unk_1E5BC0218;
  v13[4] = self;
  id v14 = v8;
  unsigned __int8 v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __34__SFService_sendToPeer_type_data___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendToPeer:*(void *)(a1 + 40) type:*(unsigned __int8 *)(a1 + 56) data:*(void *)(a1 + 48)];
}

- (void)_sendToPeer:(id)a3 type:(unsigned __int8)a4 data:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_xpcCnx)
  {
    id v10 = _os_activity_create(&dword_1A5389000, "Sharing/SFService/serviceSendFrameType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    id v11 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v11 serviceSendFrameType:v6 data:v9 peer:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    int var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [v9 length];
      LogPrintF();
    }
  }
}

- (void)pairSetupWithFlags:(unsigned int)a3 peer:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFService_pairSetupWithFlags_peer___block_invoke;
  block[3] = &unk_1E5BBFDF8;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __37__SFService_pairSetupWithFlags_peer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v3 = v2;
  id v6 = v2;
  if (v2)
  {
    [v2 pairSetupWithFlags:*(unsigned int *)(a1 + 48)];
LABEL_3:
    int v3 = v6;
    goto LABEL_4;
  }
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 32);
  if (v4 <= 60)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), int v3 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (void)pairSetupTryPIN:(id)a3 peer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFService_pairSetupTryPIN_peer___block_invoke;
  block[3] = &unk_1E5BBD418;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __34__SFService_pairSetupTryPIN_peer___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  int v3 = v2;
  id v6 = v2;
  if (v2)
  {
    [v2 tryPIN:a1[6]];
LABEL_3:
    int v3 = v6;
    goto LABEL_4;
  }
  int v4 = **(_DWORD **)(a1[4] + 32);
  if (v4 <= 60)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), int v3 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (void)serviceError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler) {
    errorHandler[2](errorHandler, v5);
  }
}

- (void)servicePeerDisconnected:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_xpcCnx)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v14];
    if (v7)
    {
      id v8 = (void *)v7;
      int var0 = self->_ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        id v12 = SFNearbyBLEServiceTypeToString(self->_serviceType);
        id v13 = v6;
        id v11 = v14;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v14, v11, v12, v13);
      [v8 invalidate];
      id sessionEndedHandler = (void (**)(id, void *, id))self->_sessionEndedHandler;
      if (sessionEndedHandler) {
        sessionEndedHandler[2](sessionEndedHandler, v8, v6);
      }
    }
  }
}

- (void)serviceReceivedEvent:(id)a3
{
  id v7 = a3;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id eventMessageHandler = (void (**)(id, id))self->_eventMessageHandler;
  id v6 = v7;
  if (eventMessageHandler)
  {
    eventMessageHandler[2](eventMessageHandler, v7);
    id v6 = v7;
  }
}

- (void)serviceReceivedFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5
{
  uint64_t v6 = a3;
  id v29 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v9 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v8];
  if (v9)
  {
    id v10 = (SFServiceSession *)v9;
    BOOL v11 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(SFDevice);
    [(SFDevice *)v12 setIdentifier:v8];
    id v10 = objc_alloc_init(SFServiceSession);
    [(SFSession *)v10 setDispatchQueue:self->_dispatchQueue];
    if (self->_label) {
      -[SFSession setLabel:](v10, "setLabel:");
    }
    [(SFSession *)v10 setPeer:v8];
    [(SFSession *)v10 setPeerDevice:v12];
    [(SFServiceSession *)v10 setService:self];
    [(SFSession *)v10 setServiceType:self->_serviceType];
    [(SFSession *)v10 setSessionFlags:self->_sessionFlags];
    sessions = self->_sessions;
    if (!sessions)
    {
      id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = self->_sessions;
      self->_sessions = v14;

      sessions = self->_sessions;
    }
    [(NSMutableDictionary *)sessions setObject:v10 forKeyedSubscript:v8];
    [(SFServiceSession *)v10 activate];
    BOOL v11 = v6 == 23;
    if (v6 == 23) {
      [(SFServiceSession *)v10 receivedStartRequest:v29];
    }
    int var0 = self->_ucatCore->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = [(SFSession *)v10 sessionID];
      id v27 = v8;
      id v28 = SFNearbyBLEServiceTypeToString(self->_serviceType);
      uint64_t v26 = v17;
      LogPrintF();
    }
    id sessionStartedHandler = (void (**)(id, SFServiceSession *))self->_sessionStartedHandler;
    if (sessionStartedHandler) {
      sessionStartedHandler[2](sessionStartedHandler, v10);
    }
  }
  [(SFSession *)v10 setHeartbeatLastTicks:mach_absolute_time()];
  switch((int)v6)
  {
    case 20:
      [(SFServiceSession *)v10 setSendLastTicks:mach_absolute_time()];
      int v19 = self;
      id v20 = v8;
      uint64_t v21 = 20;
      goto LABEL_26;
    case 21:
      int v22 = self->_ucatCore->var0;
      if (v22 <= 50 && (v22 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFServiceSession *)v10 setSendLastTicks:mach_absolute_time()];
      int v19 = self;
      id v20 = v8;
      uint64_t v21 = 22;
LABEL_26:
      -[SFService _sendToPeer:type:data:](v19, "_sendToPeer:type:data:", v20, v21, v29, v26, v27, v28);
      break;
    case 22:
    case 24:
      break;
    case 23:
      if (!v11) {
        [(SFServiceSession *)v10 receivedStartRequest:v29];
      }
      break;
    default:
      [(SFServiceSession *)v10 sessionReceivedFrameType:v6 data:v29];
      break;
  }
  [(SFServiceSession *)v10 sendLastTicks];
  UpTicksToSecondsF();
  if (v23 > 15.0)
  {
    uint64_t v24 = NSRandomData();
    if (v24)
    {
      int v25 = self->_ucatCore->var0;
      if (v25 <= 50 && (v25 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFServiceSession *)v10 setSendLastTicks:mach_absolute_time()];
      [(SFService *)self _sendToPeer:v8 type:30 data:v24];
    }
  }
}

- (void)serviceReceivedRequest:(id)a3
{
  id v7 = a3;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id requestMessageHandler = (void (**)(id, id))self->_requestMessageHandler;
  uint64_t v6 = v7;
  if (requestMessageHandler)
  {
    requestMessageHandler[2](requestMessageHandler, v7);
    uint64_t v6 = v7;
  }
}

- (void)serviceReceivedResponse:(id)a3
{
  id v12 = a3;
  int v4 = [v12 identifier];
  int var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v12;
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4
    && ([(NSMutableDictionary *)self->_requestQueue objectForKeyedSubscript:v4],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    id v8 = [v6 responseHandler];

    if (v8)
    {
      uint64_t v9 = [v7 responseHandler];
      ((void (**)(void, void, id))v9)[2](v9, 0, v12);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_requestQueue, "removeObjectForKey:", v4, v11);
  }
  else
  {
    int v10 = self->_ucatCore->var0;
    if (v10 <= 50 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)serviceSessionFailed:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = [v13 peer];
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v11 = SFNearbyBLEServiceTypeToString(self->_serviceType);
    id v12 = v6;
    int v10 = v7;
    LogPrintF();
  }
  if (v7) {
    [(NSMutableDictionary *)self->_sessions removeObjectForKey:v7];
  }
  objc_msgSend(v13, "invalidate", v10, v11, v12);
  id sessionEndedHandler = (void (**)(id, id, id))self->_sessionEndedHandler;
  if (sessionEndedHandler) {
    sessionEndedHandler[2](sessionEndedHandler, v13, v6);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)overrideScreenOff
{
  return self->_overrideScreenOff;
}

- (void)setOverrideScreenOff:(BOOL)a3
{
  self->_overrideScreenOff = a3;
}

- (NSDictionary)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (BOOL)pairSetupDisabled
{
  return self->_pairSetupDisabled;
}

- (void)setPairSetupDisabled:(BOOL)a3
{
  self->_pairSetupDisabled = a3;
}

- (NSDictionary)pairVerifyACL
{
  return self->_pairVerifyACL;
}

- (void)setPairVerifyACL:(id)a3
{
}

- (unsigned)pinType
{
  return self->_pinType;
}

- (void)setPinType:(unsigned int)a3
{
  self->_pinType = a3;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_uint64_t sessionFlags = a3;
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
}

- (CUAppleIDClient)myAppleIDInfoClient
{
  return self->_myAppleIDInfoClient;
}

- (void)setMyAppleIDInfoClient:(id)a3
{
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setPeerAppleID:(id)a3
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

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)receivedObjectHandler
{
  return self->_receivedObjectHandler;
}

- (void)setReceivedObjectHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (id)sessionStartedHandler
{
  return self->_sessionStartedHandler;
}

- (void)setSessionStartedHandler:(id)a3
{
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
}

- (id)sessionSecuredHandler
{
  return self->_sessionSecuredHandler;
}

- (void)setSessionSecuredHandler:(id)a3
{
}

- (id)peerDisconnectedHandler
{
  return self->_peerDisconnectedHandler;
}

- (void)setPeerDisconnectedHandler:(id)a3
{
}

- (id)pairSetupCompletionHandler
{
  return self->_pairSetupCompletionHandler;
}

- (void)setPairSetupCompletionHandler:(id)a3
{
}

- (NSData)targetAuthTag
{
  return self->_targetAuthTag;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)eventMessageHandler
{
  return self->_eventMessageHandler;
}

- (void)setEventMessageHandler:(id)a3
{
}

- (BOOL)hasProblem
{
  return self->_hasProblem;
}

- (id)requestMessageHandler
{
  return self->_requestMessageHandler;
}

- (void)setRequestMessageHandler:(id)a3
{
}

- (BOOL)supportsAirPlayReceiver
{
  return self->_supportsAirPlayReceiver;
}

- (void)setSupportsAirPlayReceiver:(BOOL)a3
{
  self->_supportsAirPlayReceiver = a3;
}

- (BOOL)wakeDevice
{
  return self->_wakeDevice;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPin
{
  return self->_forcedPin;
}

- (void)setForcedPin:(id)a3
{
  self->_forcedPin = (NSString *)a3;
}

- (void)setAuthTagOverride:(id)a3
{
}

- (void)setDeviceClassCode:(unsigned __int8)a3
{
  self->_deviceClassCode = a3;
}

- (void)setDeviceColorCode:(unsigned __int8)a3
{
  self->_deviceColorCode = a3;
}

- (void)setDeviceModelCode:(unsigned __int8)a3
{
  self->_deviceModelCode = a3;
}

- (id)receivedFramePeerHandler
{
  return self->_receivedFramePeerHandler;
}

- (void)setReceivedFramePeerHandler:(id)a3
{
}

- (NSString)requestSSID
{
  return self->_requestSSID;
}

- (void)setRequestSSID:(id)a3
{
}

- (id)responseMessageInternalHandler
{
  return self->_responseMessageInternalHandler;
}

- (void)setResponseMessageInternalHandler:(id)a3
{
}

- (id)sendFramePeerHandler
{
  return self->_sendFramePeerHandler;
}

- (void)setSendFramePeerHandler:(id)a3
{
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unsigned __int8)a3
{
  self->_int serviceType = a3;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (BOOL)touchRemoteEnabled
{
  return self->_touchRemoteEnabled;
}

- (void)setTouchRemoteEnabled:(BOOL)a3
{
  self->_touchRemoteEnabled = a3;
}

- (BOOL)wifiP2P
{
  return self->_wifiP2P;
}

- (void)setWifiP2P:(BOOL)a3
{
  self->_wifiP2P = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong(&self->_sendFramePeerHandler, 0);
  objc_storeStrong(&self->_responseMessageInternalHandler, 0);
  objc_storeStrong((id *)&self->_requestSSID, 0);
  objc_storeStrong(&self->_receivedFramePeerHandler, 0);
  objc_storeStrong((id *)&self->_authTagOverride, 0);
  objc_storeStrong(&self->_requestMessageHandler, 0);
  objc_storeStrong(&self->_eventMessageHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_targetAuthTag, 0);
  objc_storeStrong(&self->_pairSetupCompletionHandler, 0);
  objc_storeStrong(&self->_peerDisconnectedHandler, 0);
  objc_storeStrong(&self->_sessionSecuredHandler, 0);
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_pairVerifyACL, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_pairSetupCompletion, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end