@interface SFSession
+ (BOOL)supportsSecureCoding;
- (BOOL)_appleIDAddProof:(id)a3 error:(id *)a4;
- (BOOL)_sessionReceivedEvent:(id)a3 flags:(unsigned int)a4;
- (BOOL)_sessionReceivedRegisteredRequestID:(id)a3 flags:(unsigned int)a4 xidKey:(id)a5 xidValue:(id)a6;
- (BOOL)_sessionReceivedRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5;
- (BOOL)isCLIMode;
- (BOOL)pairingContainsACL:(id)a3;
- (BOOL)touchRemoteEnabled;
- (CUAppleIDClient)myAppleIDInfoClient;
- (CUMessageSession)messageSessionTemplate;
- (CUPairedPeer)pairedPeer;
- (NSDictionary)pairSetupACL;
- (NSDictionary)pairVerifyACL;
- (NSMutableDictionary)requestHandlers;
- (NSString)fixedPIN;
- (NSString)forcedPasscode;
- (NSString)label;
- (NSString)myAppleID;
- (NSString)peerAppleID;
- (NSString)peerContactIdentifier;
- (NSString)serviceIdentifier;
- (NSUUID)identifier;
- (NSUUID)peer;
- (NSUUID)serviceUUID;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFDevice)peerDevice;
- (SFSession)init;
- (SFSession)initWithCoder:(id)a3;
- (TRSession)trSession;
- (double)timeout;
- (id)_appleIDVerifyProof:(id)a3 error:(id *)a4;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)errorHandler;
- (id)eventMessageHandler;
- (id)hidePINHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairSetupCompletionHandler;
- (id)pairingDeriveKeyForIdentifier:(id)a3 keyLength:(unint64_t)a4;
- (id)promptForPINHandler;
- (id)receivedFrameHandler;
- (id)receivedObjectHandler;
- (id)receivedRequestHandler;
- (id)requestMessageHandler;
- (id)responseMessageInternalHandler;
- (id)sendFrameHandler;
- (id)sessionStartedHandler;
- (id)showPINHandlerEx;
- (id)timeoutHandler;
- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6;
- (int64_t)bluetoothState;
- (unint64_t)heartbeatLastTicks;
- (unsigned)serviceType;
- (unsigned)sessionFlags;
- (unsigned)sessionID;
- (unsigned)sharingSourceVersion;
- (void)_activateWithCompletion:(id)a3;
- (void)_activated;
- (void)_activatedIfReady:(id)a3;
- (void)_cleanup;
- (void)_deregisterRequestID:(id)a3;
- (void)_ensureXPCStarted;
- (void)_fetchInfo;
- (void)_hearbeatTimer;
- (void)_interrupted;
- (void)_invalidated;
- (void)_pairSetup:(id)a3 start:(BOOL)a4;
- (void)_pairSetupCompleted:(int)a3;
- (void)_pairSetupTryPIN:(id)a3;
- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4 isServer:(BOOL)a5;
- (void)_pairVerify:(id)a3 start:(BOOL)a4;
- (void)_pairVerifyCompleted:(int)a3;
- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_sendEncryptedObject:(id)a3;
- (void)_sendFrameType:(unsigned __int8)a3 object:(id)a4;
- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)_sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5;
- (void)_serviceInitiatedPairSetup:(id)a3;
- (void)_sessionReceivedEncryptedData:(id)a3 type:(unsigned __int8)a4;
- (void)_sessionReceivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_sessionReceivedRequestID:(id)a3 object:(id)a4 flags:(unsigned int)a5;
- (void)_sessionReceivedResponseID:(id)a3 object:(id)a4 flags:(unsigned int)a5;
- (void)_sessionReceivedStartAck:(id)a3;
- (void)_sessionReceivedUnencryptedData:(id)a3 type:(unsigned __int8)a4;
- (void)_setupMessageSession;
- (void)_setupTouchRemote;
- (void)_startTimeoutIfNeeded;
- (void)_tearDownMessageSession;
- (void)_tearDownTouchRemote;
- (void)_timeoutTimerFired;
- (void)activateWithCompletion:(id)a3;
- (void)appleIDAddProof:(id)a3 dispatchQueue:(id)a4 completion:(id)a5;
- (void)appleIDVerifyProof:(id)a3 dispatchQueue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4 isServer:(BOOL)a5;
- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)registerForExternalIO:(id)a3;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEvent:(id)a3;
- (void)sendExternalIO:(id)a3;
- (void)sendFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)sendFrameType:(unsigned __int8)a3 object:(id)a4;
- (void)sendRequest:(id)a3;
- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5;
- (void)sendResponse:(id)a3;
- (void)sendWithFlags:(unsigned int)a3 object:(id)a4;
- (void)sessionBluetoothStateChanged:(int64_t)a3;
- (void)sessionError:(id)a3;
- (void)sessionReceivedEvent:(id)a3;
- (void)sessionReceivedFragmentData:(id)a3 last:(BOOL)a4;
- (void)sessionReceivedFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)sessionReceivedRequest:(id)a3;
- (void)sessionReceivedResponse:(id)a3;
- (void)setBluetoothState:(int64_t)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setEventMessageHandler:(id)a3;
- (void)setFixedPIN:(id)a3;
- (void)setForcedPasscode:(id)a3;
- (void)setHeartbeatLastTicks:(unint64_t)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMyAppleID:(id)a3;
- (void)setMyAppleIDInfoClient:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupCompletionHandler:(id)a3;
- (void)setPairVerifyACL:(id)a3;
- (void)setPeer:(id)a3;
- (void)setPeerAppleID:(id)a3;
- (void)setPeerContactIdentifier:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setReceivedFrameHandler:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setRequestMessageHandler:(id)a3;
- (void)setResponseMessageInternalHandler:(id)a3;
- (void)setSendFrameHandler:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceType:(unsigned __int8)a3;
- (void)setServiceUUID:(id)a3;
- (void)setSessionFlags:(unsigned int)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setSessionStartedHandler:(id)a3;
- (void)setSharingSourceVersion:(unsigned int)a3;
- (void)setShowPINHandlerEx:(id)a3;
- (void)setStatusMonitor:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setTouchRemoteEnabled:(BOOL)a3;
- (void)setTrSession:(id)a3;
@end

@implementation SFSession

- (void)registerForExternalIO:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SFSession_CNJ__registerForExternalIO___block_invoke;
  v6[3] = &unk_1E5BBCBA8;
  id v7 = v4;
  id v5 = v4;
  [(SFSession *)self registerRequestID:@"_cnjExtIO" options:0 handler:v6];
}

void __40__SFSession_CNJ__registerForExternalIO___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a4;
  v6 = [a3 objectForKeyedSubscript:@"d"];
  if (v6)
  {
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = [v6 length];
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "receivedData:", v6, v8);
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, MEMORY[0x1E4F1CC08]);
  }
  else
  {
    id v7 = NSErrorWithOSStatusF();
    if (gLogCategory_SFDeviceOperationCNJ <= 90
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v7, 0, MEMORY[0x1E4F1CC08]);
  }
}

- (void)sendExternalIO:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = [v4 length];
    LogPrintF();
  }
  id v7 = @"d";
  v8[0] = v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1, v6);
  [(SFSession *)self sendRequestID:@"_cnjExtIO" options:0 request:v5 responseHandler:&__block_literal_global_52];
}

void __33__SFSession_CNJ__sendExternalIO___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFSession;
  v2 = [(SFSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucatCore = (LogCategory *)&gLogCategory_SFSessionCore;
    v3->_ucatCrypto = (LogCategory *)&gLogCategory_SFSessionCrypto;
  }
  return v3;
}

- (SFSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFSession;
  id v5 = [(SFSession *)&v21 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = SFMainQueue(v5);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    v6->_ucatCore = (LogCategory *)&gLogCategory_SFSessionCore;
    v6->_ucatCrypto = (LogCategory *)&gLogCategory_SFSessionCrypto;
    if ([v4 containsValueForKey:@"ident"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ident"];
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v9;
    }
    if ([v4 containsValueForKey:@"pd"])
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pd"];
      peerDevice = v6->_peerDevice;
      v6->_peerDevice = (SFDevice *)v11;
    }
    if ([v4 containsValueForKey:@"st"])
    {
      unint64_t v13 = [v4 decodeIntegerForKey:@"st"];
      v6->_serviceType = v13;
      if (v13 >= 0x100)
      {
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        v16 = _NSMethodExceptionProem();
        [v14 raise:v15, @"%@: service type out-of-range: %ld", v16, v13 format];
      }
    }
    if ([v4 containsValueForKey:@"sid"])
    {
      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
      serviceUUID = v6->_serviceUUID;
      v6->_serviceUUID = (NSUUID *)v17;
    }
    uint64_t v22 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_sessionFlags = v22;
    }
    v19 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v9 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"ident"];
    id v4 = v9;
  }
  peerDevice = self->_peerDevice;
  if (peerDevice)
  {
    [v9 encodeObject:peerDevice forKey:@"pd"];
    id v4 = v9;
  }
  if (self->_serviceType)
  {
    objc_msgSend(v9, "encodeInteger:forKey:");
    id v4 = v9;
  }
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    [v9 encodeObject:serviceUUID forKey:@"sid"];
    id v4 = v9;
  }
  uint64_t sessionFlags = self->_sessionFlags;
  if (sessionFlags)
  {
    [v9 encodeInteger:sessionFlags forKey:@"seFl"];
    id v4 = v9;
  }
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    id v5 = (SFSession *)FatalErrorF();
    [(SFSession *)v5 _cleanup];
  }
  else
  {
    [(SFSession *)self _cleanup];
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
    v7.super_class = (Class)SFSession;
    [(SFSession *)&v7 dealloc];
  }
}

- (void)_cleanup
{
  encryptionReadAEAD = self->_encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->_encryptionReadAEAD = 0;
  }
  encryptionWriteAEAD = self->_encryptionWriteAEAD;
  if (encryptionWriteAEAD)
  {
    CFRelease(encryptionWriteAEAD);
    self->_encryptionWriteAEAD = 0;
  }
  id pairSetupCompletion = self->_pairSetupCompletion;
  self->_id pairSetupCompletion = 0;

  [(CUPairingSession *)self->_pairSetupSession invalidate];
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  id pairVerifyCompletion = self->_pairVerifyCompletion;
  self->_id pairVerifyCompletion = 0;

  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    uint64_t v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_id bluetoothStateChangedHandler = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  id eventMessageHandler = self->_eventMessageHandler;
  self->_id eventMessageHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id receivedFrameHandler = self->_receivedFrameHandler;
  self->_id receivedFrameHandler = 0;

  id receivedObjectHandler = self->_receivedObjectHandler;
  self->_id receivedObjectHandler = 0;

  id receivedRequestHandler = self->_receivedRequestHandler;
  self->_id receivedRequestHandler = 0;

  id requestMessageHandler = self->_requestMessageHandler;
  self->_id requestMessageHandler = 0;

  id responseMessageInternalHandler = self->_responseMessageInternalHandler;
  self->_id responseMessageInternalHandler = 0;

  id sendFrameHandler = self->_sendFrameHandler;
  self->_id sendFrameHandler = 0;

  id sessionStartedHandler = self->_sessionStartedHandler;
  self->_id sessionStartedHandler = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

  id timeoutHandler = self->_timeoutHandler;
  self->_id timeoutHandler = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;
}

- (id)description
{
  v19[1] = 0;
  NSAppendPrintF();
  id v3 = 0;
  int serviceType = self->_serviceType;
  if (self->_serviceType)
  {
    v19[0] = v3;
    identifier = (void *)SFNearbyBLEServiceTypeToString_0(serviceType);
    id v5 = (id *)v19;
  }
  else
  {
    serviceIdentifier = self->_serviceIdentifier;
    if (!serviceIdentifier) {
      goto LABEL_6;
    }
    id v18 = v3;
    identifier = serviceIdentifier;
    id v5 = &v18;
  }
  NSAppendPrintF();
  id v7 = *v5;

  id v3 = v7;
LABEL_6:
  if (self->_invalidateCalled)
  {
    NSAppendPrintF();
    id v8 = v3;

    id v3 = v8;
  }
  if (self->_identifier)
  {
    identifier = self->_identifier;
    NSAppendPrintF();
    id v9 = v3;

    id v3 = v9;
  }
  if (self->_peerDevice)
  {
    identifier = self->_peerDevice;
    NSAppendPrintF();
    id v10 = v3;

    id v3 = v10;
  }
  if (self->_sessionFlags)
  {
    identifier = (void *)self->_sessionFlags;
    uint64_t v17 = &unk_1A56EB678;
    NSAppendPrintF();
    id v11 = v3;

    id v3 = v11;
  }
  if ([(NSMutableDictionary *)self->_requestHandlers count])
  {
    uint64_t v16 = [(NSMutableDictionary *)self->_requestHandlers count];
    NSAppendPrintF();
    id v12 = v3;

    id v3 = v12;
  }
  if ([(NSMutableDictionary *)self->_requestMap count])
  {
    [(NSMutableDictionary *)self->_requestMap count];
    NSAppendPrintF();
    id v13 = v3;

    id v3 = v13;
  }

  return v3;
}

- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  encryptionReadAEAD = self->_encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->_encryptionReadAEAD = 0;
  }
  id v8 = (CryptoAEADPrivate *)CryptoAEADCreate();
  self->_encryptionReadAEAD = v8;
  if (v8)
  {
    *(_DWORD *)&self->_encryptionReadNonce[8] = 0;
    *(void *)self->_encryptionReadNonce = 0;
    encryptionWriteAEAD = self->_encryptionWriteAEAD;
    if (encryptionWriteAEAD)
    {
      CFRelease(encryptionWriteAEAD);
      self->_encryptionWriteAEAD = 0;
    }
    id v10 = (CryptoAEADPrivate *)CryptoAEADCreate();
    self->_encryptionWriteAEAD = v10;
    if (v10)
    {
      *(_DWORD *)&self->_encryptionWriteNonce[8] = 0;
      *(void *)self->_encryptionWriteNonce = 0;
      int var0 = self->_ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  return 0;
}

- (void)setLabel:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  label = self->_label;
  self->_label = v4;

  [(NSString *)self->_label UTF8String];
  ASPrintF();
}

- (CUPairedPeer)pairedPeer
{
  return (CUPairedPeer *)[(CUPairingSession *)self->_pairSetupSession pairedPeer];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SFSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __36__SFSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  unsigned int v37 = 0;
  p_sessionID = &self->_sessionID;
  RandomBytes();
  id v8 = self->_serviceIdentifier;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v32 = (uint64_t)v8;
    uint64_t v33 = *p_sessionID;
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    uint64_t v25 = 4294960572;
  }
  else
  {
    self->_activateCalled = 1;
    if (v8)
    {
      int serviceType = self->_serviceType;
      if (!self->_serviceType)
      {
        int serviceType = SFServiceIdentifierToType(v8);
        self->_int serviceType = serviceType;
      }
      if (self->_serviceUUID) {
        goto LABEL_39;
      }
      SFServiceTypeToUUID(serviceType);
      id v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      serviceUUID = self->_serviceUUID;
      self->_serviceUUID = v11;

      if (self->_serviceUUID
        || (SFServiceIdentifierToUUID(v8, (int *)&v37),
            id v13 = (NSUUID *)objc_claimAutoreleasedReturnValue(),
            v14 = self->_serviceUUID,
            self->_serviceUUID = v13,
            v14,
            self->_serviceUUID))
      {
LABEL_39:
        if (!self->_requestQueue)
        {
          uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          requestQueue = self->_requestQueue;
          self->_requestQueue = v15;
        }
        if (!self->_identifier)
        {
          uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
          identifier = self->_identifier;
          self->_identifier = v17;
        }
        if (!self->_peer)
        {
          v19 = [(SFDevice *)self->_peerDevice identifier];
          peer = self->_peer;
          self->_peer = v19;
        }
        [(SFSession *)self _ensureXPCStarted];
        [(SFSession *)self _fetchInfo];
        objc_super v21 = _Block_copy(v5);
        id activateCompletion = self->_activateCompletion;
        self->_id activateCompletion = v21;

        self->_activateInProgress = 1;
        xpcCnx = self->_xpcCnx;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __37__SFSession__activateWithCompletion___block_invoke;
        v35[3] = &unk_1E5BBD618;
        v35[4] = self;
        id v36 = v5;
        v24 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v35];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __37__SFSession__activateWithCompletion___block_invoke_2;
        v34[3] = &unk_1E5BBC8E8;
        v34[4] = self;
        [v24 sessionActivate:self completion:v34];

        unsigned int v37 = 0;
        goto LABEL_19;
      }
      uint64_t v25 = 4294960588;
    }
    else
    {
      uint64_t v25 = 4294960551;
    }
  }
  unsigned int v37 = v25;
  int v26 = self->_ucatCore->var0;
  if (v26 <= 60)
  {
    if (v26 != -1)
    {
LABEL_25:
      uint64_t v32 = v25;
      LogPrintF();
      goto LABEL_27;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v25 = v37;
      goto LABEL_25;
    }
  }
LABEL_27:
  if (v5)
  {
    uint64_t v27 = (int)v37;
    if (v37)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      uint64_t v29 = [NSString stringWithUTF8String:DebugGetErrorString()];
      p_sessionID = (unsigned int *)v29;
      v30 = @"?";
      if (v29) {
        v30 = (__CFString *)v29;
      }
      v40[0] = v30;
      id v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, v32, v33);
      v31 = [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:v27 userInfo:v3];
    }
    else
    {
      v31 = 0;
    }
    (*((void (**)(id, void *))v5 + 2))(v5, v31);
    if (v27)
    {
    }
  }
LABEL_19:

  os_activity_scope_leave(&state);
}

void __37__SFSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 177) = 0;
  id v8 = v3;
  if (v3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = 0;
}

uint64_t __37__SFSession__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 177) = 0;
  return [*(id *)(a1 + 32) _activatedIfReady:a2];
}

- (void)_activatedIfReady:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_5;
  }
  if (!self->_activateInProgress && self->_appleIDContactCompleted)
  {
    [(SFSession *)self _activated];
LABEL_5:
    id activateCompletion = (void (**)(id, id))self->_activateCompletion;
    if (activateCompletion)
    {
      activateCompletion[2](activateCompletion, v7);
      id v5 = self->_activateCompletion;
    }
    else
    {
      id v5 = 0;
    }
    self->_id activateCompletion = 0;
  }
}

- (void)_activated
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (!self->_invalidateCalled)
  {
    self->_activateCompleted = 1;
    int var0 = self->_ucatCore->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = SFNearbyBLEServiceTypeToString_0(self->_serviceType);
      LogPrintF();
    }
    if (self->_serviceType)
    {
      [(SFSession *)self _setupMessageSession];
      if (self->_touchRemoteEnabled) {
        [(SFSession *)self _setupTouchRemote];
      }
      [(SFSession *)self _startTimeoutIfNeeded];
      if (!self->_transaction)
      {
        int v4 = (OS_os_transaction *)os_transaction_create();
        transaction = self->_transaction;
        self->_transaction = v4;

        if (!self->_transaction)
        {
          int v6 = self->_ucatCore->var0;
          if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
      v18[0] = @"sid";
      id v7 = [NSNumber numberWithUnsignedInt:self->_sessionID];
      v18[1] = @"shv";
      v19[0] = v7;
      v19[1] = @"1945.10.6";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

      int v9 = self->_ucatCore->var0;
      if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      DataMutable = (void *)OPACKEncoderCreateDataMutable();
      if (DataMutable)
      {
        [(SFSession *)self sendFrameType:23 data:DataMutable];
      }
      else
      {
        int v11 = self->_ucatCore->var0;
        if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      if (!self->_heartbeatTimer)
      {
        RandomBytes();
        int v12 = self->_ucatCore->var0;
        if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        self->_heartbeatLastTicks = mach_absolute_time();
        id v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        heartbeatTimer = self->_heartbeatTimer;
        self->_heartbeatTimer = v13;

        uint64_t v15 = self->_heartbeatTimer;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __23__SFSession__activated__block_invoke;
        handler[3] = &unk_1E5BBC870;
        handler[4] = self;
        dispatch_source_set_event_handler(v15, handler);
        SFDispatchTimerSet(self->_heartbeatTimer, 3.0, 3.0, -4.0);
        dispatch_resume((dispatch_object_t)self->_heartbeatTimer);
      }
    }
  }
}

uint64_t __23__SFSession__activated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hearbeatTimer];
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    if (testListenerEndpoint) {
      id v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:self->_testListenerEndpoint];
    }
    else {
      id v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.SharingServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__SFSession__ensureXPCStarted__block_invoke;
    v11[3] = &unk_1E5BBC870;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__SFSession__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_1E5BBC870;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA398C0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
    int var0 = self->_ucatCore->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t __30__SFSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __30__SFSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_fetchInfo
{
  if ((self->_sessionFlags & 4) != 0)
  {
    if (!self->_appleIDContactInfo)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v4 = objc_alloc_init(SFAppleIDClient);
      [(SFAppleIDClient *)v4 setDispatchQueue:self->_dispatchQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __23__SFSession__fetchInfo__block_invoke;
      v6[3] = &unk_1E5BC1760;
      void v6[4] = self;
      id v7 = v4;
      id v5 = v4;
      [(SFAppleIDClient *)v5 myAccountWithCompletion:v6];
    }
  }
  else
  {
    self->_appleIDContactCompleted = 1;
  }
}

void __23__SFSession__fetchInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
  int v7 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v6)
  {
    int v17 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v17 > 60 || v17 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_8;
    }
    id v20 = v6;
  }
  else if (v5)
  {
    uint64_t v8 = [v5 contactInfo];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 192);
    *(void *)(v9 + 192) = v8;

    uint64_t v11 = *(void *)(a1 + 32);
    if (*(void *)(v11 + 192)) {
      goto LABEL_8;
    }
    int v19 = **(_DWORD **)(v11 + 160);
    if (v19 > 60 || v19 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_8;
    }
  }
  else
  {
    int v18 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v18 > 60 || v18 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_8;
    }
  }
  LogPrintF();
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v20);
  [*(id *)(a1 + 32) _activatedIfReady:0];
  v21[0] = @"errDomain";
  uint64_t v12 = [v6 domain];
  id v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_1EF9BDC68;
  }
  v21[1] = @"errCode";
  v22[0] = v14;
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  v22[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  SFMetricsLog(@"com.apple.sharing.sessionFetchInfo", v16);
}

- (void)_hearbeatTimer
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (self->_heartbeatTimer)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    double v4 = v3;
    if (v3 >= 300.0)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      {
        double v17 = v4;
        LogPrintF();
      }
      self->_heartbeatWaiting = 0;
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28760];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = @"?";
      if (v10) {
        uint64_t v12 = (__CFString *)v10;
      }
      v23[0] = v12;
      id v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1, *(void *)&v17);
      v14 = [v8 errorWithDomain:v9 code:-71160 userInfo:v13];
      [(SFSession *)self sessionError:v14];
    }
    else if (self->_heartbeatWaiting)
    {
      int v5 = self->_ucatCore->var0;
      if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else if (self->_activateCompleted)
    {
      int v7 = self->_ucatCore->var0;
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v19 = 4;
        uint64_t v20 = 4;
        p_heartbeatID = &self->_heartbeatID;
        double v17 = v4;
        LogPrintF();
      }
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_heartbeatID, 4, *(void *)&v17, p_heartbeatID, v19, v20);
      ++self->_heartbeatID;
      self->_heartbeatWaiting = 1;
      if (self->_heartbeatV2) {
        uint64_t v16 = 21;
      }
      else {
        uint64_t v16 = 20;
      }
      id v21 = (id)v15;
      -[SFSession sendFrameType:data:](self, "sendFrameType:data:", v16);
    }
  }
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
    int v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    int v6 = self->_ucatCore->var0;
    if (v6 <= 50 && (v6 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFSession *)self _ensureXPCStarted];
    self->_activateInProgress = 1;
    xpcCnx = self->_xpcCnx;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __25__SFSession__interrupted__block_invoke;
    v10[3] = &unk_1E5BBC8E8;
    v10[4] = self;
    uint64_t v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__SFSession__interrupted__block_invoke_2;
    v9[3] = &unk_1E5BBC8E8;
    v9[4] = self;
    [v8 sessionActivate:self completion:v9];

    os_activity_scope_leave(&state);
  }
}

void __25__SFSession__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 177) = 0;
  if (v3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v4 <= 60)
    {
      id v6 = v3;
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = v6, v5))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
}

void __25__SFSession__interrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 177) = 0;
  int v4 = *(_DWORD ***)(a1 + 32);
  if (!v3)
  {
    id v7 = 0;
    [v4 _activated];
    goto LABEL_6;
  }
  int v5 = *v4[20];
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
  block[2] = __23__SFSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__SFSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 201))
  {
    *(unsigned char *)(v1 + 201) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 160);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }
    int v6 = *(void **)(v3 + 96);
    if (v6)
    {
      id v7 = v6;
      dispatch_source_cancel(v7);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 96);
      *(void *)(v8 + 96) = 0;
    }
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 304);
    if (v10)
    {
      uint64_t v11 = v10;
      dispatch_source_cancel(v11);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 304);
      *(void *)(v12 + 304) = 0;
    }
    v14 = *(void **)(*(void *)(a1 + 32) + 312);
    if (v14)
    {
      [v14 invalidate];
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(v15 + 312);
      *(void *)(v15 + 312) = 0;
    }
    else
    {
      double v17 = *(void **)(a1 + 32);
      [v17 _invalidated];
    }
  }
}

- (void)_invalidated
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
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
    heartbeatTimer = self->_heartbeatTimer;
    if (heartbeatTimer)
    {
      int v5 = heartbeatTimer;
      dispatch_source_cancel(v5);
      int v6 = self->_heartbeatTimer;
      self->_heartbeatTimer = 0;
    }
    [(SFSession *)self _tearDownMessageSession];
    [(SFSession *)self _tearDownTouchRemote];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = self->_requestQueue;
    uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      uint64_t v28 = *MEMORY[0x1E4F28760];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [(NSMutableDictionary *)self->_requestQueue objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          id v13 = [v12 responseHandler];

          if (v13)
          {
            v14 = [v12 responseHandler];
            uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v34 = v10;
            uint64_t v16 = [NSString stringWithUTF8String:DebugGetErrorString()];
            double v17 = (void *)v16;
            int v18 = @"?";
            if (v16) {
              int v18 = (__CFString *)v16;
            }
            v35 = v18;
            uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            uint64_t v20 = [v15 errorWithDomain:v28 code:-6723 userInfo:v19];
            ((void (**)(void, void *, void))v14)[2](v14, v20, 0);
          }
          [v12 invalidate];
        }
        uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v8);
    }

    [(NSMutableDictionary *)self->_requestQueue removeAllObjects];
    requestQueue = self->_requestQueue;
    self->_requestQueue = 0;

    if (self->_pairSetupSession && !self->_pairSetupEnded) {
      [(SFSession *)self _pairSetupCompleted:4294960573];
    }
    if (self->_pairVerifySession && !self->_pairVerifyEnded) {
      [(SFSession *)self _pairVerifyCompleted:4294960573];
    }
    [(NSMutableDictionary *)self->_requestHandlers removeAllObjects];
    requestHandlers = self->_requestHandlers;
    self->_requestHandlers = 0;

    requestMap = self->_requestMap;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __25__SFSession__invalidated__block_invoke;
    v29[3] = &unk_1E5BC1788;
    v29[4] = self;
    [(NSMutableDictionary *)requestMap enumerateKeysAndObjectsUsingBlock:v29];
    [(NSMutableDictionary *)self->_requestMap removeAllObjects];
    v24 = self->_requestMap;
    self->_requestMap = 0;

    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    [(SFSession *)self _cleanup];
    self->_invalidateDone = 1;
    int v26 = self->_ucatCore->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void __25__SFSession__invalidated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
  if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v5;
    LogPrintF();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", @"_rh", v16);
  uint64_t v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28760];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v12 = (void *)v11;
    id v13 = @"?";
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    v18[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v15 = [v9 errorWithDomain:v10 code:-6723 userInfo:v14];
    ((void (**)(void, void, void *, void))v8)[2](v8, 0, v15, 0);
  }
}

- (void)_setupMessageSession
{
  if (!self->_messageSessionServer)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v4 = (CUMessageSessionServer *)objc_alloc_init(MEMORY[0x1E4F5E140]);
    messageSessionServer = self->_messageSessionServer;
    self->_messageSessionServer = v4;

    [(CUMessageSessionServer *)self->_messageSessionServer setDispatchQueue:self->_dispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__SFSession__setupMessageSession__block_invoke;
    v11[3] = &unk_1E5BC1800;
    v11[4] = self;
    [(CUMessageSessionServer *)self->_messageSessionServer setRegisterRequestHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__SFSession__setupMessageSession__block_invoke_4;
    v10[3] = &unk_1E5BC1828;
    v10[4] = self;
    [(CUMessageSessionServer *)self->_messageSessionServer setDeregisterRequestHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__SFSession__setupMessageSession__block_invoke_5;
    v9[3] = &unk_1E5BC1878;
    v9[4] = self;
    [(CUMessageSessionServer *)self->_messageSessionServer setSendRequestHandler:v9];
    [(CUMessageSessionServer *)self->_messageSessionServer activate];
    id v6 = [(CUMessageSessionServer *)self->_messageSessionServer templateSession];
    messageSessionTemplate = self->_messageSessionTemplate;
    self->_messageSessionTemplate = v6;

    if (!self->_messageSessionTemplate)
    {
      int v8 = self->_ucatCore->var0;
      if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

void __33__SFSession__setupMessageSession__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  int v8 = v7;
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9[27])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__SFSession__setupMessageSession__block_invoke_2;
    v10[3] = &unk_1E5BC17D8;
    id v11 = v7;
    [v9 _registerRequestID:a2 options:a3 handler:v10];
  }
}

void __33__SFSession__setupMessageSession__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__SFSession__setupMessageSession__block_invoke_3;
  v11[3] = &unk_1E5BC17B0;
  id v12 = v7;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16);
  id v10 = v7;
  v9(v8, a2, a3, v11);
}

void __33__SFSession__setupMessageSession__block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28760];
    uint64_t v8 = a2;
    id v9 = a4;
    id v10 = a3;
    id v12 = [v6 errorWithDomain:v7 code:v8 userInfo:0];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, void))(v5 + 16);
    id v10 = a4;
    id v12 = a3;
    v11(v5, 0);
  }
}

void *__33__SFSession__setupMessageSession__block_invoke_4(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[27]) {
    return (void *)[result _deregisterRequestID:a2];
  }
  return result;
}

void __33__SFSession__setupMessageSession__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = v9;
  id v11 = *(void **)(a1 + 32);
  if (v11[27])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__SFSession__setupMessageSession__block_invoke_6;
    v12[3] = &unk_1E5BC1850;
    id v13 = v9;
    [v11 _sendRequestID:a2 options:a3 request:a4 responseHandler:v12];
  }
}

void __33__SFSession__setupMessageSession__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a4;
  id v8 = a3;
  uint64_t v7 = NSErrorToOSStatus();
  (*(void (**)(uint64_t, uint64_t, id, id))(v5 + 16))(v5, v7, v8, v6);
}

- (void)_tearDownMessageSession
{
  [(CUMessageSession *)self->_messageSessionTemplate invalidate];
  messageSessionTemplate = self->_messageSessionTemplate;
  self->_messageSessionTemplate = 0;

  [(CUMessageSessionServer *)self->_messageSessionServer invalidate];
  messageSessionServer = self->_messageSessionServer;
  self->_messageSessionServer = 0;
}

- (void)_setupTouchRemote
{
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v4 = objc_alloc_init(SFTRSession);
  sfTRSession = self->_sfTRSession;
  self->_sfTRSession = v4;

  [(SFTRSession *)self->_sfTRSession setDispatchQueue:self->_dispatchQueue];
  [(SFTRSession *)self->_sfTRSession setSession:self];
  [(SFTRSession *)self->_sfTRSession activate];
  id v6 = [(SFTRSession *)self->_sfTRSession trSession];
  trSession = self->_trSession;
  self->_trSession = v6;
}

- (void)_tearDownTouchRemote
{
  trSession = self->_trSession;
  self->_trSession = 0;

  [(SFTRSession *)self->_sfTRSession invalidate];
  sfTRSession = self->_sfTRSession;
  self->_sfTRSession = 0;
}

- (void)_startTimeoutIfNeeded
{
  if (self->_timeout > 0.0 && self->_bluetoothState == 3 && !self->_timeoutFired && !self->_timeoutTimer)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v4;

    id v6 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __34__SFSession__startTimeoutIfNeeded__block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    SFDispatchTimerSet(self->_timeoutTimer, self->_timeout, 1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

uint64_t __34__SFSession__startTimeoutIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutTimerFired];
}

- (void)_timeoutTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucatCore->var0;
  if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  }
  self->_id timeoutHandler = 0;
}

- (BOOL)pairingContainsACL:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_pairVerifySession)
  {
    uint64_t v6 = PairingSessionCopyPairedPeer();
  }
  else
  {
    pairSetupSession = self->_pairSetupSession;
    if (!pairSetupSession)
    {
      id v8 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [(CUPairingSession *)pairSetupSession pairedPeer];
  }
  id v8 = (void *)v6;
LABEL_6:
  id v9 = [v8 acl];
  uint64_t Int64 = CFDictionaryGetInt64();

  return Int64 != 0;
}

- (id)pairingDeriveKeyForIdentifier:(id)a3 keyLength:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (const char *)[v6 UTF8String];
  size_t v8 = strlen(v7);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a4];
  id v10 = v9;
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    if (!-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "IdentifierKeyInfo", 17, v7, v8, a4, [v9 mutableBytes]))
    {
LABEL_3:
      id v12 = v10;
      goto LABEL_4;
    }
  }
  else if (self->_pairVerifySession)
  {
    [v9 mutableBytes];
    if (!PairingSessionDeriveKey()) {
      goto LABEL_3;
    }
  }
  int var0 = self->_ucatCore->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v12 = 0;
LABEL_4:

  return v12;
}

- (void)_serviceInitiatedPairSetup:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SFSession__serviceInitiatedPairSetup___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__SFSession__serviceInitiatedPairSetup___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 472));
  if (v2)
  {
    char Int64Ranged = CFDictionaryGetInt64Ranged();
    *(_DWORD *)(*(void *)(a1 + 32) + 256) = CFDictionaryGetInt64Ranged();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned int *)(v4 + 140);
    if ((v5 & 0x800) != 0) {
      uint64_t v6 = 20;
    }
    else {
      uint64_t v6 = Int64Ranged & 0x18 | 4u;
    }
    int v7 = **(_DWORD **)(v4 + 160);
    if (v7 > 30) {
      goto LABEL_9;
    }
    if (v7 == -1)
    {
      int v8 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 32);
      if (!v8) {
        goto LABEL_9;
      }
      uint64_t v5 = *(unsigned int *)(v4 + 140);
    }
    uint64_t v13 = v6;
    v14 = &unk_1A56EB74D;
    uint64_t v11 = v5;
    id v12 = &unk_1A56EB678;
    uint64_t v10 = *(unsigned int *)(v4 + 256);
    LogPrintF();
    uint64_t v4 = *(void *)(a1 + 32);
LABEL_9:
    objc_msgSend((id)v4, "_pairSetupWithFlags:completion:isServer:", v6, v2, 1, v10, v11, v12, v13, v14);
    [*(id *)(a1 + 32) _pairSetup:*(void *)(a1 + 40) start:1];
    goto LABEL_14;
  }
  int v9 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
  if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_14:
}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4 isServer:(BOOL)a5
{
  id v8 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SFSession_pairSetupWithFlags_completion_isServer___block_invoke;
  block[3] = &unk_1E5BC18A0;
  unsigned int v13 = a3;
  block[4] = self;
  id v12 = v8;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(dispatchQueue, block);
}

uint64_t __52__SFSession_pairSetupWithFlags_completion_isServer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40) isServer:*(unsigned __int8 *)(a1 + 52)];
}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4 isServer:(BOOL)a5
{
  BOOL v5 = a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v5) {
    RandomBytes();
  }
  int var0 = self->_ucatCore->var0;
  if (self->_pairSetupCompletion)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t pairSetupXID = self->_pairSetupXID;
      LogPrintF();
    }
    id pairSetupCompletion = (void (**)(id, void *))self->_pairSetupCompletion;
    if ((a3 & 0x80000) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28760];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
      BOOL v14 = (void *)v13;
      uint64_t v15 = @"?";
      if (v13) {
        uint64_t v15 = (__CFString *)v13;
      }
      v34[0] = v15;
      id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1, pairSetupXID);
      uint64_t v17 = [v11 errorWithDomain:v12 code:-6723 userInfo:v16];
      pairSetupCompletion[2](pairSetupCompletion, v17);

      id pairSetupCompletion = (void (**)(id, void *))self->_pairSetupCompletion;
    }
    self->_id pairSetupCompletion = 0;
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t pairSetupXID = self->_pairSetupXID;
    LogPrintF();
  }
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0, pairSetupXID);
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:0];
  [(CUPairingSession *)self->_pairSetupSession invalidate];
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  self->_pairSetupEnded = 0;
  self->_pairSetupFlags = a3 | 4;
  uint64_t v19 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
  uint64_t v20 = self->_pairSetupSession;
  self->_pairSetupSession = v19;

  [(CUPairingSession *)self->_pairSetupSession setDispatchQueue:self->_dispatchQueue];
  id v21 = [NSString stringWithUTF8String:self->_ucatCrypto->var4];
  [(CUPairingSession *)self->_pairSetupSession setLabel:v21];

  [(CUPairingSession *)self->_pairSetupSession setFlags:self->_pairSetupFlags];
  if (v5) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  [(CUPairingSession *)self->_pairSetupSession setSessionType:v22];
  if (self->_promptForPINHandler) {
    -[CUPairingSession setPromptForPINHandler:](self->_pairSetupSession, "setPromptForPINHandler:");
  }
  if (self->_showPINHandlerEx) {
    -[CUPairingSession setShowPINHandlerEx:](self->_pairSetupSession, "setShowPINHandlerEx:");
  }
  if (self->_hidePINHandler) {
    -[CUPairingSession setHidePINHandler:](self->_pairSetupSession, "setHidePINHandler:");
  }
  if (self->_pairSetupACL) {
    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:");
  }
  v23 = self->_fixedPIN;
  if (![(NSString *)v23 length] && IsAppleInternalBuild())
  {
    CFStringGetTypeID();
    uint64_t v24 = CFPrefs_CopyTypedValue();

    v23 = (NSString *)v24;
  }
  if ([(NSString *)v23 length]) {
    [(CUPairingSession *)self->_pairSetupSession setFixedPIN:v23];
  }
  forcedPasscode = self->_forcedPasscode;
  if (forcedPasscode
    && self->_isCLIMode
    && [(NSString *)forcedPasscode length]
    && IsAppleInternalBuild())
  {
    int v26 = self->_ucatCore->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUPairingSession *)self->_pairSetupSession setFixedPIN:self->_forcedPasscode];
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke;
  v31[3] = &unk_1E5BC13A8;
  v31[4] = self;
  unsigned int v32 = a3;
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:v31];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke_2;
  v30[3] = &unk_1E5BBC8E8;
  v30[4] = self;
  [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:v30];
  uint64_t v27 = _Block_copy(v8);
  id v28 = self->_pairSetupCompletion;
  self->_id pairSetupCompletion = v27;

  [(SFSession *)self _pairSetup:0 start:1];
}

void __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke(uint64_t a1, char a2, void *a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12[0] = @"pd";
  v12[1] = @"pxid";
  v13[0] = v5;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 256)];
  v13[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  if (a2)
  {
    int v9 = (void *)[v7 mutableCopy];
    id v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    [v9 setObject:v10 forKeyedSubscript:@"pf"];

    uint64_t v11 = [v9 copy];
    uint64_t v8 = 16;
    int v7 = (void *)v11;
  }
  else
  {
    uint64_t v8 = 17;
  }
  [*(id *)(a1 + 32) sendFrameType:v8 object:v7];
}

uint64_t __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = NSErrorToOSStatus();

  return [v1 _pairSetupCompleted:v2];
}

- (void)_pairSetup:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v15 = 0;
  if (!self->_pairSetupSession)
  {
    id v10 = 0;
LABEL_32:
    [(SFSession *)self _pairSetupCompleted:pairSetupXID];
    goto LABEL_33;
  }
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t pairSetupXID = self->_pairSetupXID;
    LogPrintF();
  }
  if (v4) {
    [(CUPairingSession *)self->_pairSetupSession activate];
  }
  if (!v6) {
    goto LABEL_30;
  }
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  int v15 = Int64Ranged;
  if (Int64Ranged)
  {
    int v12 = self->_ucatCore->var0;
    if (v12 > 60 || v12 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_30;
    }
    uint64_t pairSetupXID = Int64Ranged;
    goto LABEL_25;
  }
  CFDataGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  if (!v9)
  {
    int v13 = self->_ucatCore->var0;
    if (v13 > 60 || v13 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_30;
    }
    uint64_t pairSetupXID = 0;
LABEL_25:
    LogPrintF();
LABEL_30:
    id v10 = 0;
    goto LABEL_31;
  }
  id v10 = (void *)v9;
  if (self->_pairSetupXID != CFDictionaryGetInt64Ranged())
  {
    int v11 = self->_ucatCore->var0;
    if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_33;
  }
  -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v10, pairSetupXID);
LABEL_31:
  if (v15) {
    goto LABEL_32;
  }
LABEL_33:
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__SFSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __29__SFSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)_pairSetupTryPIN:(id)a3
{
  id v4 = (__CFString *)a3;
  int var0 = self->_ucatCore->var0;
  int v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v8 = _LogCategory_Initialize(), id v4 = v12, v8))
    {
      int v6 = IsAppleInternalBuild();
      int v7 = @"*";
      if (v6) {
        int v7 = v12;
      }
      uint64_t v11 = (uint64_t)v7;
      LogPrintF();
      id v4 = v12;
    }
  }
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    [(CUPairingSession *)pairSetupSession tryPIN:v4];
  }
  else
  {
    int v10 = self->_ucatCore->var0;
    if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = 4294960551;
      LogPrintF();
    }
    -[SFSession _pairSetupCompleted:](self, "_pairSetupCompleted:", 4294960551, v11);
  }
}

- (void)_pairSetupCompleted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  memset(v27, 0, sizeof(v27));
  self->_pairSetupEnded = 1;
  if (!a3)
  {
    pairSetupSession = self->_pairSetupSession;
    if (pairSetupSession)
    {
      uint64_t v6 = [(CUPairingSession *)pairSetupSession deriveKeyWithSaltPtr:"ReadKeySalt" saltLen:11 infoPtr:"ReadKeyInfo" infoLen:11 keyLen:32 outputKeyPtr:__s];
      if (!v6)
      {
        uint64_t v6 = [(CUPairingSession *)self->_pairSetupSession deriveKeyWithSaltPtr:"WriteKeySalt" saltLen:12 infoPtr:"WriteKeyInfo" infoLen:12 keyLen:32 outputKeyPtr:v27];
        if (!v6)
        {
          uint64_t v6 = [(SFSession *)self setEncryptionReadKey:__s readKeyLen:32 writeKey:v27 writeKeyLen:32];
          if (!v6)
          {
            memset_s(__s, 0x20uLL, 0, 0x20uLL);
            memset_s(v27, 0x20uLL, 0, 0x20uLL);
            int var0 = self->_ucatCore->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            id pairSetupCompletion = (void (**)(id, void))self->_pairSetupCompletion;
            p_id pairSetupCompletion = &self->_pairSetupCompletion;
            int v8 = pairSetupCompletion;
            if (pairSetupCompletion)
            {
              v8[2](v8, 0);
LABEL_12:
              id v11 = *p_pairSetupCompletion;
              *p_id pairSetupCompletion = 0;

              return;
            }
            return;
          }
        }
      }
      uint64_t v3 = v6;
    }
    else
    {
      uint64_t v3 = 4294960534;
    }
  }
  int v12 = self->_ucatCore->var0;
  if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v24 = v3;
    LogPrintF();
  }
  [(CUPairingSession *)self->_pairSetupSession invalidate];
  int v13 = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  int v15 = (void (**)(id, void *))self->_pairSetupCompletion;
  p_id pairSetupCompletion = &self->_pairSetupCompletion;
  BOOL v14 = v15;
  if (v15)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28760];
    uint64_t v18 = (int)v3;
    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v20 = (void *)v19;
    id v21 = @"?";
    if (v19) {
      id v21 = (__CFString *)v19;
    }
    int v26 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v23 = [v16 errorWithDomain:v17 code:v18 userInfo:v22];
    v14[2](v14, v23);

    goto LABEL_12;
  }
}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFSession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E5BBFC48;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__SFSession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairVerifyWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unint64_t v8 = 0x1E4F28000;
  uint64_t v9 = (void *)MEMORY[0x1E4F28760];
  unint64_t v10 = 0x1E4F29000;
  unsigned int v11 = (uint64_t *)MEMORY[0x1E4F28568];
  if (self->_pairVerifyCompletion)
  {
    v46 = v6;
    int v12 = self->_ucatCore->var0;
    if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id pairVerifyCompletion = (void (**)(id, void *))self->_pairVerifyCompletion;
    BOOL v14 = (void *)MEMORY[0x1E4F28C58];
    int v15 = v9;
    uint64_t v16 = *v9;
    uint64_t v50 = *v11;
    uint64_t v17 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (__CFString *)v17;
    }
    else {
      uint64_t v19 = @"?";
    }
    v51[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    uint64_t v21 = v16;
    uint64_t v9 = v15;
    uint64_t v22 = [v14 errorWithDomain:v21 code:-6723 userInfo:v20];
    pairVerifyCompletion[2](pairVerifyCompletion, v22);

    unint64_t v8 = 0x1E4F28000uLL;
    unint64_t v10 = 0x1E4F29000uLL;
    id v23 = self->_pairVerifyCompletion;
    self->_id pairVerifyCompletion = 0;

    id v6 = v46;
  }
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  self->_pairVerifyEnded = 0;
  self->_pairVerifyFlags = a3 | 4;
  int v25 = PairingSessionCreate();
  if (v25)
  {
    if (v6)
    {
      int v26 = *(void **)(v8 + 3160);
      uint64_t v27 = *v9;
      uint64_t v28 = v25;
      uint64_t v48 = *v11;
      uint64_t v29 = [*(id *)(v10 + 24) stringWithUTF8String:DebugGetErrorString()];
      long long v30 = (void *)v29;
      if (v29) {
        long long v31 = (__CFString *)v29;
      }
      else {
        long long v31 = @"?";
      }
      v49 = v31;
      unsigned int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      uint64_t v33 = [v26 errorWithDomain:v27 code:v28 userInfo:v32];
      v6[2](v6, v33);
    }
  }
  else
  {
    unsigned int sessionFlags = self->_sessionFlags;
    if (sessionFlags & 4 | a3 & 0x1000)
    {
      if ((sessionFlags & 8) != 0) {
        int v35 = 1052672;
      }
      else {
        int v35 = 4096;
      }
      self->_pairVerifyFlags |= (sessionFlags << 17) & 0x200000 | v35;
      if (self->_myAppleIDInfoClient)
      {
        PairingSessionSetMyAppleIDInfoClient();
      }
      else if (self->_myAppleID)
      {
        PairingSessionSetMyAppleID();
      }
      if (self->_peerAppleID) {
        PairingSessionSetPeerAppleID();
      }
      id v36 = self->_peerContactIdentifier;
      uint64_t v37 = v36;
      if (v36)
      {
        char v47 = 0;
        v38 = SFNormalizedUserIdentifiersForContactIdentifier(v36, 0, &v47);
        uint64_t v39 = v38;
        if (v47)
        {
          v40 = (void *)[v38 mutableCopy];
          v41 = [(SFAppleIDContactInfo *)self->_appleIDContactInfo validatedPhoneNumbers];
          v42 = [(SFAppleIDContactInfo *)self->_appleIDContactInfo validatedEmailAddresses];
          if (v41) {
            [v40 addObjectsFromArray:v41];
          }
          if (v42) {
            [v40 addObjectsFromArray:v42];
          }
          uint64_t v43 = [v40 copy];

          uint64_t v39 = (void *)v43;
        }
        if ([v39 count]) {
          PairingSessionSetPeerAppleIDs();
        }
      }
    }
    else if ((sessionFlags & 0x440) == 0x40)
    {
      self->_pairVerifyFlags |= 0x4000000u;
    }
    if (self->_pairVerifyACL) {
      PairingSessionSetACL();
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    v44 = _Block_copy(v6);
    id v45 = self->_pairVerifyCompletion;
    self->_id pairVerifyCompletion = v44;

    [(SFSession *)self _pairVerify:0 start:1];
  }
}

- (void)_pairVerify:(id)a3 start:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_pairVerifySession)
  {
    id v10 = 0;
    goto LABEL_15;
  }
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v5)
  {
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    int v13 = Int64Ranged;
    if (Int64Ranged)
    {
      int v11 = self->_ucatCore->var0;
      if (v11 > 60 || v11 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_26;
      }
      uint64_t v12 = Int64Ranged;
      goto LABEL_21;
    }
    CFDataGetTypeID();
    unint64_t v8 = CFDictionaryGetTypedValue();
    if (!v8)
    {
      int v9 = self->_ucatCore->var0;
      if (v9 > 60 || v9 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_26;
      }
      uint64_t v12 = 0;
LABEL_21:
      LogPrintF();
LABEL_26:
      id v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  id v10 = v8;
  [v10 bytes];
  [v10 length];
  int v13 = PairingSessionExchange();
  if (!v13)
  {
LABEL_15:
    [(SFSession *)self _pairVerifyCompleted:v12];
    goto LABEL_16;
  }
LABEL_14:
  if (v13) {
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_pairVerifyCompleted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  memset(v23, 0, sizeof(v23));
  self->_pairVerifyEnded = 1;
  if (!a3)
  {
    if (self->_pairVerifySession)
    {
      uint64_t v5 = PairingSessionDeriveKey();
      if (!v5)
      {
        uint64_t v5 = PairingSessionDeriveKey();
        if (!v5)
        {
          uint64_t v5 = [(SFSession *)self setEncryptionReadKey:__s readKeyLen:32 writeKey:v23 writeKeyLen:32];
          if (!v5)
          {
            memset_s(__s, 0x20uLL, 0, 0x20uLL);
            memset_s(v23, 0x20uLL, 0, 0x20uLL);
            int var0 = self->_ucatCore->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            LODWORD(v3) = 0;
            int v7 = 1;
            goto LABEL_11;
          }
        }
      }
      uint64_t v3 = v5;
    }
    else
    {
      uint64_t v3 = 4294960534;
    }
  }
  int v18 = self->_ucatCore->var0;
  if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v20 = v3;
    LogPrintF();
  }
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    int v7 = 0;
    self->_pairVerifySession = 0;
  }
  else
  {
    int v7 = 0;
  }
LABEL_11:
  id pairVerifyCompletion = (void (**)(id, void))self->_pairVerifyCompletion;
  if (pairVerifyCompletion)
  {
    if (v7)
    {
      pairVerifyCompletion[2](self->_pairVerifyCompletion, 0);
    }
    else
    {
      int v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28760];
      uint64_t v11 = (int)v3;
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v12 = [NSString stringWithUTF8String:DebugGetErrorString()];
      int v13 = (void *)v12;
      uint64_t v14 = @"?";
      if (v12) {
        uint64_t v14 = (__CFString *)v12;
      }
      uint64_t v22 = v14;
      int v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, v20);
      uint64_t v16 = [v9 errorWithDomain:v10 code:v11 userInfo:v15];
      ((void (**)(id, void *))pairVerifyCompletion)[2](pairVerifyCompletion, v16);
    }
    id v17 = self->_pairVerifyCompletion;
    self->_id pairVerifyCompletion = 0;
  }
}

- (void)appleIDAddProof:(id)a3 dispatchQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_queue_create("AppleIDAddProof", 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke;
  v15[3] = &unk_1E5BBCDE0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  [v2 _appleIDAddProof:v3 error:&v12];
  id v4 = v12;
  if (v4)
  {
    int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke_2;
  block[3] = &unk_1E5BBC9C8;
  id v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v10 = v4;
  id v11 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

uint64_t __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_appleIDAddProof:(id)a3 error:(id *)a4
{
  id v30 = a3;
  id v6 = [(SDStatusMonitor *)self->_statusMonitor myMediumHashes];
  if ([v6 length])
  {
    if ((unint64_t)[v6 length] <= 8)
    {
      id v7 = (void *)[v6 mutableCopy];
      [v7 setLength:9];

      id v6 = v7;
    }
    id v8 = [(SFSession *)self pairingDeriveKeyForIdentifier:@"AppleIDChallenge" keyLength:16];
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F5E0C0]);
      id v33 = 0;
      id v10 = (void *)[v9 copyMyCertificateDataAndReturnError:&v33];
      id v11 = v33;
      id v12 = v11;
      if (v10)
      {
        id v32 = v11;
        id v13 = (void *)[v9 copyMyValidationDataAndReturnError:&v32];
        id v14 = v32;

        if (v13)
        {
          int v15 = v9;
          id v16 = v6;
          int v26 = a4;
          uint64_t v29 = v8;
          id v17 = v8;
          uint64_t v28 = v10;
          id v18 = v10;
          id v19 = v13;
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
          [v20 appendData:v17];
          [v20 appendData:v18];
          [v20 appendData:v19];
          id v31 = v14;
          uint64_t v27 = v15;
          uint64_t v21 = [v15 signData:v20 error:&v31];
          id v12 = v31;

          BOOL v22 = v21 != 0;
          if (v21)
          {
            id v23 = v30;
            [v30 setObject:v18 forKeyedSubscript:@"cert"];
            [v30 setObject:v16 forKeyedSubscript:@"medHash"];
            [v30 setObject:v21 forKeyedSubscript:@"sig"];
            [v30 setObject:v19 forKeyedSubscript:@"vrec"];
          }
          else
          {
            id v23 = v30;
            if (v26)
            {
              SFNestedErrorF();
              *int v26 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

          id v10 = v28;
          id v8 = v29;
          BOOL v24 = v22;
          id v6 = v16;
          id v9 = v27;
        }
        else
        {
          if (a4)
          {
            SFNestedErrorF();
            BOOL v24 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v24 = 0;
          }
          id v12 = v14;
          id v23 = v30;
        }
      }
      else
      {
        if (a4)
        {
          SFNestedErrorF();
          BOOL v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v24 = 0;
        }
        id v23 = v30;
      }
    }
    else
    {
      id v23 = v30;
      if (a4)
      {
        SFErrorF();
        BOOL v24 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v24 = 0;
      }
    }
  }
  else
  {
    if (a4)
    {
      SFErrorF();
      BOOL v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v24 = 0;
    }
    id v23 = v30;
  }

  return v24;
}

- (void)appleIDVerifyProof:(id)a3 dispatchQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_queue_create("AppleIDVerifyProof", 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke;
  v15[3] = &unk_1E5BBCDE0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  id v4 = [v2 _appleIDVerifyProof:v3 error:&v13];
  id v5 = v13;
  if (v5)
  {
    int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke_2;
  block[3] = &unk_1E5BBD838;
  id v7 = *(NSObject **)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v11 = v5;
  id v12 = v8;
  void block[4] = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_appleIDVerifyProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFDataGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  if (!v7)
  {
    if (a4) {
      goto LABEL_24;
    }
    goto LABEL_39;
  }
  statusMonitor = self->_statusMonitor;
  if (!statusMonitor)
  {
    if (a4)
    {
LABEL_24:
      SFErrorF();
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_39:
    id v22 = 0;
    goto LABEL_18;
  }
  id v9 = [(SDStatusMonitor *)statusMonitor contactIdentifierForMediumHashes:v7];
  id v10 = v9;
  if (v9)
  {
    id v30 = 0;
    uint64_t v11 = SFNormalizedUserIdentifiersForContactIdentifierEx(v9, 0, &v30, 0);
    uint64_t v27 = (void *)v11;
    if (v11)
    {
      uint64_t v12 = v11;
      CFDataGetTypeID();
      uint64_t v28 = CFDictionaryGetTypedValue();
      if (v28)
      {
        CFDataGetTypeID();
        id v13 = CFDictionaryGetTypedValue();
        if (v13)
        {
          CFDataGetTypeID();
          id v14 = CFDictionaryGetTypedValue();
          if (v14)
          {
            int v15 = [(SFSession *)self pairingDeriveKeyForIdentifier:@"AppleIDChallenge" keyLength:16];
            if (v15)
            {
              BOOL v24 = a4;
              uint64_t v25 = v10;
              int v26 = v7;
              id v16 = v28;
              id v17 = v14;
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
              [v18 appendData:v15];
              [v18 appendData:v16];
              [v18 appendData:v17];
              id v19 = objc_alloc_init(MEMORY[0x1E4F5E0C0]);
              [v19 setPeerAppleIDs:v12];
              [v19 setPeerCertificateData:v16];
              [v19 setPeerValidationData:v17];
              id v29 = 0;
              char v20 = [v19 verifyData:v18 signature:v13 error:&v29];
              id v21 = v29;
              if (v20)
              {
                id v22 = v30;
              }
              else if (v24)
              {
                SFNestedErrorF();
                id v22 = 0;
                id *v24 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v22 = 0;
              }

              id v10 = v25;
              id v7 = v26;
            }
            else if (a4)
            {
              SFErrorF();
              id v22 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v22 = 0;
            }
          }
          else if (a4)
          {
            SFErrorF();
            id v22 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v22 = 0;
          }
        }
        else if (a4)
        {
          SFErrorF();
          id v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v22 = 0;
        }
      }
      else if (a4)
      {
        SFErrorF();
        id v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v22 = 0;
      }
    }
    else if (a4)
    {
      SFErrorF();
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
  }
  else if (a4)
  {
    SFErrorF();
    id v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }

LABEL_18:

  return v22;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  [v4 setIdentifier:v5];

  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __23__SFSession_sendEvent___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);
}

void __23__SFSession_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 312))
  {
    uint64_t v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionSendEvent", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 312) remoteObjectProxy];
    [v4 sessionSendEvent:*(void *)(a1 + 40)];

    os_activity_scope_leave(&state);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 160);
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
  block[2] = __25__SFSession_sendRequest___block_invoke;
  block[3] = &unk_1E5BBD418;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(dispatchQueue, block);
}

void __25__SFSession_sendRequest___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 312))
  {
    uint64_t v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionSendRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = [*(id *)(a1[4] + 312) remoteObjectProxy];
    [v4 sessionSendRequest:a1[5]];

    [*(id *)(a1[4] + 288) setObject:a1[5] forKeyedSubscript:a1[6]];
    os_activity_scope_leave(&state);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 160);
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
    block[2] = __26__SFSession_sendResponse___block_invoke;
    block[3] = &unk_1E5BBBD18;
    void block[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    uint64_t v8 = FatalErrorF();
    __26__SFSession_sendResponse___block_invoke(v8);
  }
}

void __26__SFSession_sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 312))
  {
    uint64_t v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionSendResponse", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 312) remoteObjectProxy];
    [v4 sessionSendResponse:*(void *)(a1 + 40)];

    os_activity_scope_leave(&state);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 160);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)sendFrameType:(unsigned __int8)a3 data:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SFSession_sendFrameType_data___block_invoke;
  block[3] = &unk_1E5BC0128;
  unsigned __int8 v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __32__SFSession_sendFrameType_data___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 312))
  {
    uint64_t v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionSendFrameType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v3, &v6);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 312) remoteObjectProxy];
    [v4 sessionSendFrameType:*(unsigned __int8 *)(a1 + 48) data:*(void *)(a1 + 40)];

    os_activity_scope_leave(&v6);
  }
  else
  {
    int v5 = **(_DWORD **)(v2 + 160);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)sendFrameType:(unsigned __int8)a3 object:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFSession_sendFrameType_object___block_invoke;
  block[3] = &unk_1E5BC0128;
  unsigned __int8 v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFSession_sendFrameType_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendFrameType:*(unsigned __int8 *)(a1 + 48) object:*(void *)(a1 + 40)];
}

- (void)_sendFrameType:(unsigned __int8)a3 object:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  int v19 = 0;
  uint64_t DataMutable = OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      SFNearbyBLEFrameTypeToString_0(v4);
      LogPrintF();
    }
    goto LABEL_24;
  }
  id v8 = (void *)DataMutable;
  if (v4 != 29) {
    goto LABEL_5;
  }
  uint64_t v18 = 0;
  uint64_t v9 = NSDataCompress();
  id v10 = 0;

  if (!v9)
  {
    int v16 = self->_ucatCore->var0;
    if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

LABEL_24:
    id v8 = 0;
    goto LABEL_13;
  }

  id v8 = (void *)v9;
LABEL_5:
  if (self->_xpcCnx)
  {
    unsigned __int8 v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionSendFrameType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    uint64_t v12 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v12 sessionSendFrameType:v4 data:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    id sendFrameHandler = (void (**)(id, void, void *))self->_sendFrameHandler;
    if (sendFrameHandler)
    {
      sendFrameHandler[2](sendFrameHandler, v4, v8);
    }
    else
    {
      int v14 = self->_ucatCore->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
LABEL_13:
}

- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__SFSession_sendRequestWithFlags_object_responseHandler___block_invoke;
  void v13[3] = &unk_1E5BBFC20;
  unsigned int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __57__SFSession_sendRequestWithFlags_object_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequestWithFlags:*(unsigned int *)(a1 + 56) object:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 48)];
}

- (void)_sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)[a4 mutableCopy];
  RandomBytes();
  id v10 = [NSNumber numberWithLongLong:0];
  [v9 setObject:v10 forKeyedSubscript:@"_xc"];
  if (!self->_requestMap)
  {
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestMap = self->_requestMap;
    self->_requestMap = v11;
  }
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6, 0, @"_fl");
  v17[1] = @"_rh";
  v18[0] = v13;
  id v14 = _Block_copy(v8);

  v18[1] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [(NSMutableDictionary *)self->_requestMap setObject:v15 forKeyedSubscript:v10];

  if (v6)
  {
    [(SFSession *)self _sendEncryptedObject:v9];
  }
  else
  {
    if ((self->_sessionFlags & 2) != 0) {
      uint64_t v16 = 29;
    }
    else {
      uint64_t v16 = 5;
    }
    [(SFSession *)self _sendFrameType:v16 object:v9];
  }
}

- (void)sendWithFlags:(unsigned int)a3 object:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  if (v4)
  {
    id v8 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v9 = __34__SFSession_sendWithFlags_object___block_invoke;
  }
  else
  {
    id v8 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v9 = __34__SFSession_sendWithFlags_object___block_invoke_2;
  }
  void v8[2] = v9;
  v8[3] = &unk_1E5BBBD18;
  v8[4] = self;
  id v10 = v6;
  void v8[5] = v10;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __34__SFSession_sendWithFlags_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEncryptedObject:*(void *)(a1 + 40)];
}

uint64_t __34__SFSession_sendWithFlags_object___block_invoke_2(uint64_t a1)
{
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 140) & 2) != 0) {
    uint64_t v1 = 29;
  }
  else {
    uint64_t v1 = 5;
  }
  return [*(id *)(a1 + 32) _sendFrameType:v1 object:*(void *)(a1 + 40)];
}

- (void)_sendEncryptedObject:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFSession/sessionSendFrameType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v22[0] = 0;
  v22[1] = 0;
  if (!self->_xpcCnx)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_38;
    }
LABEL_26:
    LogPrintF();
LABEL_38:
    id DataMutable = 0;
    goto LABEL_17;
  }
  if (!self->_encryptionWriteAEAD)
  {
    int v17 = self->_ucatCore->var0;
    if (v17 > 60 || v17 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_38;
    }
    goto LABEL_26;
  }
  id DataMutable = (id)OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    int v18 = self->_ucatCore->var0;
    if (v18 > 60 || v18 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_38;
    }
    goto LABEL_26;
  }
  if ((self->_sessionFlags & 2) != 0)
  {
    id v8 = NSDataCompress();
    id v9 = 0;
    if (!v8)
    {
      int v20 = self->_ucatCore->var0;
      if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_16;
    }
    uint64_t v10 = [v8 mutableCopy];

    uint64_t v7 = 28;
    id DataMutable = (id)v10;
  }
  else
  {
    uint64_t v7 = 6;
  }
  id DataMutable = DataMutable;
  [DataMutable mutableBytes];
  [DataMutable length];
  encryptionWriteNonce = self->_encryptionWriteNonce;
  int v12 = CryptoAEADEncryptMessage();
  uint64_t v13 = 0;
  do
  {
    if (++encryptionWriteNonce[v13]) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = v13 == 11;
    }
    ++v13;
  }
  while (!v15);
  if (!v12)
  {
    objc_msgSend(DataMutable, "appendBytes:length:", v22, 16, v22, 16);
    id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v9 sessionSendFrameType:v7 data:DataMutable];
LABEL_16:

    goto LABEL_17;
  }
  int v19 = self->_ucatCore->var0;
  if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_17:

  os_activity_scope_leave(&state);
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (CFDictionaryGetInt64())
  {
    [(SFSession *)self _registerRequestID:v8 options:v9 handler:v10];
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __47__SFSession_registerRequestID_options_handler___block_invoke;
    v12[3] = &unk_1E5BBCDE0;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(dispatchQueue, v12);
  }
}

uint64_t __47__SFSession_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerRequestID:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  dispatchQueue = self->_dispatchQueue;
  id v10 = a5;
  dispatch_assert_queue_V2(dispatchQueue);
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v17;
    LogPrintF();
  }
  int v12 = objc_alloc_init(SFMessageSessionRequestEntry);
  [(SFMessageSessionRequestEntry *)v12 setHandler:v10];

  if (v8) {
    [(SFMessageSessionRequestEntry *)v12 setOptions:v8];
  }
  -[SFMessageSessionRequestEntry setAllowUnencrypted:](v12, "setAllowUnencrypted:", CFDictionaryGetInt64() != 0, v16);
  requestHandlers = self->_requestHandlers;
  if (!requestHandlers)
  {
    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = self->_requestHandlers;
    self->_requestHandlers = v14;

    requestHandlers = self->_requestHandlers;
  }
  [(NSMutableDictionary *)requestHandlers setObject:v12 forKeyedSubscript:v17];
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SFSession_deregisterRequestID___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __33__SFSession_deregisterRequestID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deregisterRequestID:*(void *)(a1 + 40)];
}

- (void)_deregisterRequestID:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30)
  {
    id v5 = v7;
    if (var0 != -1)
    {
LABEL_3:
      id v6 = v5;
      LogPrintF();
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      id v5 = v7;
      goto LABEL_3;
    }
  }
LABEL_5:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestHandlers, "setObject:forKeyedSubscript:", 0, v7, v6);
}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SFSession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_1E5BC0E98;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__SFSession_sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequestID:*(void *)(a1 + 40) options:*(void *)(a1 + 48) request:*(void *)(a1 + 56) responseHandler:*(void *)(a1 + 64)];
}

- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v19 = v10;
    uint64_t v20 = [v12 count];
    LogPrintF();
  }
  if (self->_encryptionWriteAEAD) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = CFDictionaryGetInt64() == 0;
  }
  v25[0] = @"_ri";
  v25[1] = @"_ro";
  v26[0] = v10;
  v26[1] = v12;
  id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, v25, 2, v19, v20);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __60__SFSession__sendRequestID_options_request_responseHandler___block_invoke;
  v21[3] = &unk_1E5BC18C8;
  v21[4] = self;
  id v22 = v10;
  id v23 = v13;
  BOOL v24 = v15;
  id v17 = v13;
  id v18 = v10;
  [(SFSession *)self _sendRequestWithFlags:v15 object:v16 responseHandler:v21];
}

void __60__SFSession__sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    int v9 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7);
  }
  else if (a2 & 1) == 0 && (*(unsigned char *)(a1 + 56))
  {
    int v14 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    if (Int64Ranged)
    {
      int v11 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
      if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v25 = *(void *)(a1 + 40);
        uint64_t v26 = Int64Ranged;
        LogPrintF();
      }
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28760];
      uint64_t v18 = (int)Int64Ranged;
      uint64_t v27 = *MEMORY[0x1E4F28568];
      uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v12 = (void *)v19;
      uint64_t v20 = @"?";
      if (v19) {
        uint64_t v20 = (__CFString *)v19;
      }
      v28[0] = v20;
      id v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v25, v26);
      id v22 = [v16 errorWithDomain:v17 code:v18 userInfo:v21];
      (*(void (**)(uint64_t, void *, void, void))(v15 + 16))(v15, v22, 0, 0);
    }
    else
    {
      CFDictionaryGetTypeID();
      id v12 = CFDictionaryGetTypedValue();
      int v13 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
      if (v12)
      {
        if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
        {
          [v12 count];
          LogPrintF();
        }
        (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
      }
      else
      {
        if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v23 = *(void *)(a1 + 48);
        BOOL v24 = NSErrorWithOSStatusF();
        (*(void (**)(uint64_t, void *, void, void))(v23 + 16))(v23, v24, 0, 0);
      }
    }
  }
}

- (void)sessionBluetoothStateChanged:(int64_t)a3
{
  int var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_bluetoothState = a3;
  id bluetoothStateChangedHandler = (void (**)(id, int64_t))self->_bluetoothStateChangedHandler;
  if (bluetoothStateChangedHandler) {
    bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, a3);
  }

  [(SFSession *)self _startTimeoutIfNeeded];
}

- (void)sessionError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v18 = v4;
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    id v7 = heartbeatTimer;
    dispatch_source_cancel(v7);
    id v8 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;
  }
  if (self->_pairSetupSession && !self->_pairSetupEnded)
  {
    unsigned int v9 = NSErrorToOSStatus();
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 4294960596;
    }
    -[SFSession _pairSetupCompleted:](self, "_pairSetupCompleted:", v10, v18);
  }
  if (self->_pairVerifySession && !self->_pairVerifyEnded)
  {
    unsigned int v11 = NSErrorToOSStatus();
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 4294960596;
    }
    -[SFSession _pairVerifyCompleted:](self, "_pairVerifyCompleted:", v12, v18);
  }
  [(NSMutableDictionary *)self->_requestHandlers removeAllObjects];
  requestHandlers = self->_requestHandlers;
  self->_requestHandlers = 0;

  requestMap = self->_requestMap;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __26__SFSession_sessionError___block_invoke;
  void v19[3] = &unk_1E5BC18F0;
  v19[4] = self;
  id v15 = v4;
  id v20 = v15;
  [(NSMutableDictionary *)requestMap enumerateKeysAndObjectsUsingBlock:v19];
  [(NSMutableDictionary *)self->_requestMap removeAllObjects];
  id v16 = self->_requestMap;
  self->_requestMap = 0;

  id errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler) {
    errorHandler[2](errorHandler, v15);
  }
}

void __26__SFSession_sessionError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
  if (v6 <= 50 && (v6 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v11;
    uint64_t v10 = *(void *)(a1 + 40);
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend(v5, "objectForKeyedSubscript:", @"_rh", v9, v10);
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, void, void, void))(v7 + 16))(v7, 0, *(void *)(a1 + 40), 0);
  }
}

- (void)sessionReceivedEvent:(id)a3
{
  id v7 = a3;
  int var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id eventMessageHandler = (void (**)(id, id))self->_eventMessageHandler;
  int v6 = v7;
  if (eventMessageHandler)
  {
    eventMessageHandler[2](eventMessageHandler, v7);
    int v6 = v7;
  }
}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_heartbeatLastTicks = mach_absolute_time();
  if ((int)v4 > 47)
  {
    if ((v4 - 64) < 2) {
      goto LABEL_15;
    }
    if (v4 == 48)
    {
      int v6 = self;
      id v7 = v10;
      uint64_t v8 = 0;
    }
    else
    {
      if (v4 != 49)
      {
LABEL_13:
        id receivedFrameHandler = (void (**)(id, void, id))self->_receivedFrameHandler;
        if (receivedFrameHandler) {
          receivedFrameHandler[2](receivedFrameHandler, v4, v10);
        }
        goto LABEL_15;
      }
      int v6 = self;
      id v7 = v10;
      uint64_t v8 = 1;
    }
    [(SFSession *)v6 sessionReceivedFragmentData:v7 last:v8];
    goto LABEL_15;
  }
  switch((int)v4)
  {
    case 5:
    case 16:
    case 17:
    case 19:
    case 29:
      [(SFSession *)self _sessionReceivedUnencryptedData:v10 type:v4];
      break;
    case 6:
    case 28:
      [(SFSession *)self _sessionReceivedEncryptedData:v10 type:v4];
      break;
    case 20:
    case 22:
      self->_heartbeatWaiting = 0;
      break;
    case 21:
    case 23:
    case 30:
      break;
    case 24:
      self->_heartbeatV2 = 1;
      [(SFSession *)self _sessionReceivedStartAck:v10];
      break;
    default:
      goto LABEL_13;
  }
LABEL_15:
}

- (void)sessionReceivedFragmentData:(id)a3 last:(BOOL)a4
{
  id v25 = a3;
  uint64_t v6 = [v25 length];
  if (!v6
    || (uint64_t v7 = v6,
        id v8 = v25,
        int v9 = *(unsigned __int8 *)[v8 bytes],
        self->_fragmentLastIndex + 1 != v9))
  {
    id v22 = NSErrorWithOSStatusF();
    int v14 = 0;
LABEL_24:
    if (v22)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      fragmentData = self->_fragmentData;
      self->_fragmentData = 0;

      self->_fragmentLastIndex = 0;
    }
    goto LABEL_19;
  }
  id v10 = self->_fragmentData;
  if (!v10)
  {
    id v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    uint64_t v12 = self->_fragmentData;
    self->_fragmentData = v11;

    id v10 = self->_fragmentData;
  }
  int v13 = objc_msgSend(v8, "subdataWithRange:", 1, v7 - 1);
  [(NSMutableData *)v10 appendData:v13];

  if (a4)
  {
    int v14 = self->_fragmentData;
    unint64_t v15 = [(NSMutableData *)v14 length];
    int v16 = self->_ucatCore->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v15 > 1)
    {
      int v14 = v14;
      id v18 = (unsigned __int8 *)[(NSMutableData *)v14 bytes];
      uint64_t v19 = *v18;
      if ((((_BYTE)v19 - 48) & 0xEE) != 0 && v18[1] == self->_serviceType)
      {
        uint64_t v20 = -[NSMutableData subdataWithRange:](v14, "subdataWithRange:", 2, v15 - 2);

        [(SFSession *)self sessionReceivedFrameType:v19 data:v20];
        id v21 = self->_fragmentData;
        self->_fragmentData = 0;

        id v22 = 0;
        self->_fragmentLastIndex = 0;
        int v14 = (NSMutableData *)v20;
        goto LABEL_19;
      }
    }
    id v22 = NSErrorWithOSStatusF();
    goto LABEL_24;
  }
  int v17 = self->_ucatCore->var0;
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableData *)self->_fragmentData length];
    LogPrintF();
  }
  id v22 = 0;
  int v14 = 0;
  self->_fragmentLastIndex = v9;
LABEL_19:
}

- (void)_sessionReceivedEncryptedData:(id)a3 type:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!self->_encryptionReadAEAD)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_41;
    }
LABEL_22:
    LogPrintF();
LABEL_41:
    id v12 = 0;
    goto LABEL_42;
  }
  unint64_t v8 = [v6 length];
  unint64_t v9 = v8;
  if (v8 <= 0xF)
  {
    int v23 = self->_ucatCore->var0;
    if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_41;
    }
    goto LABEL_22;
  }
  unint64_t v10 = v8 - 16;
  uint64_t v11 = [v7 bytes];
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v9 - 16];
  if ([v12 length] != v10)
  {
    int v24 = self->_ucatCore->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_42;
    }
LABEL_28:
    LogPrintF();
    goto LABEL_42;
  }
  id v12 = v12;
  [v12 mutableBytes];
  unint64_t v30 = v11 + v10;
  int v13 = CryptoAEADDecryptMessage();
  uint64_t v14 = 24;
  do
  {
    char v15 = *((unsigned char *)&self->super.isa + v14) + 1;
    *((unsigned char *)&self->super.isa + v14) = v15;
    if (v15) {
      break;
    }
  }
  while (v14++ != 35);
  if (v13)
  {
    int v25 = self->_ucatCore->var0;
    if (v25 > 60 || v25 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_42;
    }
    goto LABEL_28;
  }
  if (v4 == 28)
  {
    NSDataDecompress();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = 0;
    uint64_t v19 = v18;
    if (v17)
    {

      goto LABEL_13;
    }
    int v29 = self->_ucatCore->var0;
    if (v29 <= 60 && (v29 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

LABEL_42:
    id v17 = 0;
LABEL_43:
    id v21 = 0;
    goto LABEL_16;
  }
  id v17 = v12;
LABEL_13:
  uint64_t v20 = OPACKDecodeData();
  if (!v20)
  {
    int v26 = self->_ucatCore->var0;
    if (v26 <= 60 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_43;
  }
  id v21 = (void *)v20;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SFSession _sessionReceivedObject:flags:](self, "_sessionReceivedObject:flags:", v21, 1, v30, 16);
  }
  else
  {
    int v27 = self->_ucatCore->var0;
    if (v27 <= 60 && (v27 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v28 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v28);
      LogPrintF();
    }
  }
LABEL_16:
}

- (void)_sessionReceivedUnencryptedData:(id)a3 type:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 == 29)
  {
    uint64_t v7 = NSDataDecompress();
    id v8 = 0;

    if (!v7)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }

      id v6 = 0;
      goto LABEL_41;
    }

    id v6 = (id)v7;
  }
  uint64_t v9 = OPACKDecodeData();
  if (!v9)
  {
    int v13 = self->_ucatCore->var0;
    if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
LABEL_41:
    unint64_t v10 = 0;
    goto LABEL_15;
  }
  unint64_t v10 = (void *)v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == 19)
    {
      if (self->_pairVerifySession)
      {
        [(SFSession *)self _pairVerify:v10 start:0];
        goto LABEL_15;
      }
      int v11 = self->_ucatCore->var0;
      if (v11 <= 50 && (v11 != -1 || _LogCategory_Initialize())) {
        goto LABEL_21;
      }
    }
    else
    {
      if (v4 != 17)
      {
        if (v4 == 16) {
          [(SFSession *)self _serviceInitiatedPairSetup:v10];
        }
        else {
          [(SFSession *)self _sessionReceivedObject:v10 flags:0];
        }
        goto LABEL_15;
      }
      if (self->_pairSetupSession)
      {
        [(SFSession *)self _pairSetup:v10 start:0];
        goto LABEL_15;
      }
      int v12 = self->_ucatCore->var0;
      if (v12 <= 50 && (v12 != -1 || _LogCategory_Initialize())) {
LABEL_21:
      }
        LogPrintF();
    }
  }
  else
  {
    int v14 = self->_ucatCore->var0;
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
    {
      char v15 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v15);
      LogPrintF();
    }
  }
LABEL_15:
}

- (void)_sessionReceivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  uint64_t v6 = [v11 objectForKeyedSubscript:@"_xc"];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    [(SFSession *)self _sessionReceivedResponseID:v6 object:v11 flags:v4];
  }
  else
  {
    uint64_t v8 = [v11 objectForKeyedSubscript:@"_xs"];
    if (v8)
    {
      uint64_t v7 = (void *)v8;
      if (![(SFSession *)self _sessionReceivedRegisteredRequestID:v11 flags:v4 xidKey:@"_xs" xidValue:v8])[(SFSession *)self _sessionReceivedRequestID:v7 object:v11 flags:v4]; {
    }
      }
    else
    {
      id receivedObjectHandler = (void (**)(id, void, id))self->_receivedObjectHandler;
      if (receivedObjectHandler)
      {
        receivedObjectHandler[2](receivedObjectHandler, v4, v11);
      }
      else
      {
        int var0 = self->_ucatCore->var0;
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      uint64_t v7 = 0;
    }
  }
}

- (BOOL)_sessionReceivedEvent:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (!self->_sfTRSession)
  {
    BOOL v10 = 0;
    goto LABEL_10;
  }
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 10)
  {
    if ((v4 & 1) == 0)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      char v8 = 1;
      goto LABEL_6;
    }
    [(SFTRSession *)self->_sfTRSession handleEvent:v6 flags:v4];
  }
  char v8 = 0;
LABEL_6:
  char v9 = v8 ^ 1;
  if (Int64Ranged == 10) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
LABEL_10:

  return v10;
}

- (BOOL)_sessionReceivedRegisteredRequestID:(id)a3 flags:(unsigned int)a4 xidKey:(id)a5 xidValue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  CFStringGetTypeID();
  int v13 = CFDictionaryGetTypedValue();
  if (v13)
  {
    CFDictionaryGetTypeID();
    int v14 = CFDictionaryGetTypedValue();
    if (!v14)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v18 = 0;
      goto LABEL_35;
    }
    char v15 = [(NSMutableDictionary *)self->_requestHandlers objectForKeyedSubscript:v13];
    int v16 = v15;
    if (v15)
    {
      if (a4 & 1) != 0 || ([v15 allowUnencrypted])
      {
        id v17 = [v16 handler];
        BOOL v18 = v17 != 0;
        int v19 = self->_ucatCore->var0;
        if (v17)
        {
          if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
          {
            [v14 count];
            LogPrintF();
          }
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __71__SFSession__sessionReceivedRegisteredRequestID_flags_xidKey_xidValue___block_invoke;
          v24[3] = &unk_1E5BC1918;
          v24[4] = self;
          id v25 = v13;
          unsigned int v28 = a4;
          id v26 = v11;
          id v27 = v12;
          ((void (**)(void, void, void *, void *))v17)[2](v17, 0, v14, v24);
        }
        else if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_34;
      }
      int v22 = self->_ucatCore->var0;
      if (v22 > 60 || v22 == -1 && !_LogCategory_Initialize())
      {
LABEL_33:
        BOOL v18 = 0;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {
      int v21 = self->_ucatCore->var0;
      if (v21 > 60 || v21 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_33;
      }
    }
    LogPrintF();
    goto LABEL_33;
  }
  BOOL v18 = 0;
LABEL_36:

  return v18;
}

void __71__SFSession__sessionReceivedRegisteredRequestID_flags_xidKey_xidValue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (v7)
    {
      int v10 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
      if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        id v24 = v7;
        LogPrintF();
      }
    }
    int v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(unsigned int *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 56);
    v27[0] = @"_ro";
    v27[1] = v21;
    v28[0] = v9;
    v28[1] = v22;
    int v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 2, v23, v24);
    [v19 sendWithFlags:v20 object:v16];
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(unsigned int *)(a1 + 64);
    v25[0] = @"er";
    int v13 = NSNumber;
    unsigned int v14 = NSErrorToOSStatus();
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 4294960596;
    }
    int v16 = [v13 numberWithInt:v15];
    uint64_t v17 = *(void *)(a1 + 56);
    v25[1] = *(void *)(a1 + 48);
    v26[0] = v16;
    v26[1] = v17;
    BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v11 sendWithFlags:v12 object:v18];
  }
}

- (void)_sessionReceivedRequestID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = (void *)[a4 mutableCopy];
  [v9 removeObjectForKey:@"_xs"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SFSession__sessionReceivedRequestID_object_flags___block_invoke;
  aBlock[3] = &unk_1E5BC1380;
  aBlock[4] = self;
  id v10 = v8;
  id v15 = v10;
  id v11 = _Block_copy(aBlock);
  if (![(SFSession *)self _sessionReceivedRequest:v9 flags:v5 responseHandler:v11])
  {
    id receivedRequestHandler = (void (**)(id, void, void *, void *))self->_receivedRequestHandler;
    if (receivedRequestHandler)
    {
      receivedRequestHandler[2](receivedRequestHandler, v5, v9, v11);
    }
    else
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

void __52__SFSession__sessionReceivedRequestID_object_flags___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      int v9 = **(_DWORD **)(*(void *)(a1 + 32) + 160);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        id v18 = v7;
        LogPrintF();
      }
    }
    int v16 = objc_msgSend(v8, "mutableCopy", v17, v18);
    [v16 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"_xs"];
    [*(id *)(a1 + 32) sendWithFlags:a2 object:v16];
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    v19[0] = @"er";
    id v11 = NSNumber;
    unsigned int v12 = NSErrorToOSStatus();
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 4294960596;
    }
    unsigned int v14 = [v11 numberWithInt:v13];
    v19[1] = @"_xs";
    v20[0] = v14;
    v20[1] = *(void *)(a1 + 40);
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v10 sendWithFlags:a2 object:v15];
  }
}

- (BOOL)_sessionReceivedRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!self->_sfTRSession)
  {
    BOOL v13 = 0;
    goto LABEL_10;
  }
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 11)
  {
    if ((v6 & 1) == 0)
    {
      int var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      char v11 = 1;
      goto LABEL_6;
    }
    [(SFTRSession *)self->_sfTRSession handleRequest:v8 flags:v6 responseHandler:v9];
  }
  char v11 = 0;
LABEL_6:
  char v12 = v11 ^ 1;
  if (Int64Ranged == 11) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
LABEL_10:

  return v13;
}

- (void)_sessionReceivedResponseID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_requestMap objectForKeyedSubscript:v8];
  if (!v10)
  {
    int var0 = self->_ucatCore->var0;
    if (var0 > 50 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_6;
    }
LABEL_12:
    LogPrintF();
    goto LABEL_6;
  }
  [(NSMutableDictionary *)self->_requestMap removeObjectForKey:v8];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"_rh"];
  if (!v11)
  {
    int v16 = self->_ucatCore->var0;
    if (v16 > 50 || v16 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  char v12 = (void (**)(void, void, void, void))v11;
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v5 & 1) == 0 && (Int64Ranged)
  {
    int v17 = self->_ucatCore->var0;
    if (v17 <= 50 && (v17 != -1 || _LogCategory_Initialize()))
    {
      id v25 = v8;
      LogPrintF();
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    uint64_t v20 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v21 = (void *)v20;
    uint64_t v22 = @"?";
    if (v20) {
      uint64_t v22 = (__CFString *)v20;
    }
    v27[0] = v22;
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v25);
    id v24 = [v18 errorWithDomain:v19 code:-6768 userInfo:v23];
    ((void (**)(void, void, void *, void))v12)[2](v12, 0, v24, 0);
  }
  else
  {
    unsigned int v14 = (void *)[v9 mutableCopy];
    [v14 removeObjectForKey:@"_xc"];
    ((void (**)(void, uint64_t, void, void *))v12)[2](v12, v5, 0, v14);
  }
LABEL_6:
}

- (void)_sessionReceivedStartAck:(id)a3
{
  id v4 = a3;
  int v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SFSession__sessionReceivedStartAck___block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  if (_sessionReceivedStartAck__onceToken != -1) {
    dispatch_once(&_sessionReceivedStartAck__onceToken, block);
  }
  uint64_t v5 = (void *)OPACKDecodeData();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int var0 = self->_ucatCore->var0;
  if (isKindOfClass)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringGetTypeID();
    id v8 = CFDictionaryGetTypedValue();
    id v9 = v8;
    if (v8)
    {
      [v8 UTF8String];
      unsigned int v10 = TextToSourceVersion();
      self->_sharingSourceVersion = v10;
      if (!v10) {
        goto LABEL_12;
      }
    }
    else if (!self->_sharingSourceVersion)
    {
LABEL_12:
      int v11 = self->_ucatCore->var0;
      if (v11 <= 115 && (v11 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    unsigned int sessionFlags = self->_sessionFlags;
    if ((sessionFlags & 1) != 0 && self->_sharingSourceVersion >= 0x7E57C0)
    {
      sessionFlags |= 2u;
      self->_unsigned int sessionFlags = sessionFlags;
    }
    if ((sessionFlags & 0x20) != 0 && self->_sharingSourceVersion >= 0x8FE454) {
      self->_unsigned int sessionFlags = sessionFlags | 0x40;
    }
    id sessionStartedHandler = (void (**)(id))self->_sessionStartedHandler;
    if (sessionStartedHandler)
    {
      sessionStartedHandler[2](sessionStartedHandler);
      id v14 = self->_sessionStartedHandler;
      self->_id sessionStartedHandler = 0;
    }
    goto LABEL_24;
  }
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v9 = 0;
LABEL_24:
}

int *__38__SFSession__sessionReceivedStartAck___block_invoke(uint64_t a1)
{
  [@"1945.10.6" UTF8String];
  result = (int *)TextToSourceVersion();
  if (!result)
  {
    result = *(int **)(*(void *)(a1 + 32) + 160);
    if (*result <= 115)
    {
      if (*result != -1) {
        return (int *)LogPrintF();
      }
      result = (int *)_LogCategory_Initialize();
      if (result) {
        return (int *)LogPrintF();
      }
    }
  }
  return result;
}

- (void)sessionReceivedRequest:(id)a3
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

- (void)sessionReceivedResponse:(id)a3
{
  id v12 = a3;
  id v4 = [v12 identifier];
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
      id v9 = [v7 responseHandler];
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

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
}

- (NSUUID)identifier
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

- (CUMessageSession)messageSessionTemplate
{
  return self->_messageSessionTemplate;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_unsigned int sessionFlags = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
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

- (NSString)peerContactIdentifier
{
  return self->_peerContactIdentifier;
}

- (void)setPeerContactIdentifier:(id)a3
{
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
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

- (NSDictionary)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (NSDictionary)pairVerifyACL
{
  return self->_pairVerifyACL;
}

- (void)setPairVerifyACL:(id)a3
{
}

- (id)pairSetupCompletionHandler
{
  return self->_pairSetupCompletionHandler;
}

- (void)setPairSetupCompletionHandler:(id)a3
{
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
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

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPasscode
{
  return self->_forcedPasscode;
}

- (void)setForcedPasscode:(id)a3
{
  self->_forcedPasscode = (NSString *)a3;
}

- (id)eventMessageHandler
{
  return self->_eventMessageHandler;
}

- (void)setEventMessageHandler:(id)a3
{
}

- (id)requestMessageHandler
{
  return self->_requestMessageHandler;
}

- (void)setRequestMessageHandler:(id)a3
{
}

- (unint64_t)heartbeatLastTicks
{
  return self->_heartbeatLastTicks;
}

- (void)setHeartbeatLastTicks:(unint64_t)a3
{
  self->_heartbeatLastTicks = a3;
}

- (NSUUID)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (id)receivedFrameHandler
{
  return self->_receivedFrameHandler;
}

- (void)setReceivedFrameHandler:(id)a3
{
}

- (NSMutableDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (id)responseMessageInternalHandler
{
  return self->_responseMessageInternalHandler;
}

- (void)setResponseMessageInternalHandler:(id)a3
{
}

- (id)sendFrameHandler
{
  return self->_sendFrameHandler;
}

- (void)setSendFrameHandler:(id)a3
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

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sharingSourceVersion
{
  return self->_sharingSourceVersion;
}

- (void)setSharingSourceVersion:(unsigned int)a3
{
  self->_sharingSourceVersion = a3;
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

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong(&self->_sendFrameHandler, 0);
  objc_storeStrong(&self->_responseMessageInternalHandler, 0);
  objc_storeStrong(&self->_receivedFrameHandler, 0);
  objc_storeStrong(&self->_requestMessageHandler, 0);
  objc_storeStrong(&self->_eventMessageHandler, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_pairSetupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairVerifyACL, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_peerContactIdentifier, 0);
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_sfTRSession, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong(&self->_pairVerifyCompletion, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_storeStrong(&self->_pairSetupCompletion, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_messageSessionServer, 0);
  objc_storeStrong((id *)&self->_appleIDContactInfo, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_fragmentData, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end