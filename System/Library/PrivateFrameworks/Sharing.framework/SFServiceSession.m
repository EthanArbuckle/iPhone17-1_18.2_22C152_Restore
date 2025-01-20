@interface SFServiceSession
- (BOOL)pairingContainsACL:(id)a3;
- (SFService)service;
- (SFServiceSession)init;
- (id)pairingDeriveKeyForIdentifier:(id)a3 keyLength:(unint64_t)a4;
- (int)_pairSetupCompleted:(int)a3;
- (int)_pairVerifyCompleted:(int)a3;
- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6;
- (unint64_t)sendLastTicks;
- (void)_hearbeatTimer;
- (void)_receivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_receivedRequestID:(id)a3 object:(id)a4 flags:(unsigned int)a5;
- (void)_receivedResponseID:(id)a3 object:(id)a4 flags:(unsigned int)a5;
- (void)_sendFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4;
- (void)_sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5;
- (void)_sendWithFlags:(unsigned int)a3 object:(id)a4;
- (void)activate;
- (void)clearEncryptionInfo;
- (void)dealloc;
- (void)invalidate;
- (void)pairSetup:(id)a3 start:(BOOL)a4;
- (void)pairSetupWithFlags:(unsigned int)a3;
- (void)pairVerify:(id)a3 start:(BOOL)a4;
- (void)receivedEncryptedData:(id)a3 type:(unsigned __int8)a4;
- (void)receivedStartRequest:(id)a3;
- (void)receivedUnencryptedData:(id)a3 type:(unsigned __int8)a4;
- (void)sendEncryptedObject:(id)a3;
- (void)sendFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5;
- (void)sendWithFlags:(unsigned int)a3 object:(id)a4;
- (void)sessionReceivedFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)setSendLastTicks:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)tryPIN:(id)a3;
@end

@implementation SFServiceSession

- (SFServiceSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFServiceSession;
  result = [(SFSession *)&v3 init];
  if (result)
  {
    result->super._ucatCore = (LogCategory *)&gLogCategory_SFServiceCore;
    result->super._ucatCrypto = (LogCategory *)&gLogCategory_SFServiceCrypto;
  }
  return result;
}

- (void)dealloc
{
  if (self->super._transaction)
  {
    objc_super v3 = (SFServiceSession *)FatalErrorF();
    [(SFServiceSession *)v3 setEncryptionReadKey:v5 readKeyLen:v6 writeKey:v7 writeKeyLen:v8];
  }
  else
  {
    [(SFServiceSession *)self clearEncryptionInfo];
    v9.receiver = self;
    v9.super_class = (Class)SFServiceSession;
    [(SFSession *)&v9 dealloc];
  }
}

- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  encryptionReadAEAD = self->super._encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->super._encryptionReadAEAD = 0;
  }
  unint64_t v8 = (CryptoAEADPrivate *)CryptoAEADCreate();
  self->super._encryptionReadAEAD = v8;
  if (v8)
  {
    *(void *)self->super._encryptionReadNonce = 0;
    *(_DWORD *)&self->super._encryptionReadNonce[8] = 0;
    encryptionWriteAEAD = self->super._encryptionWriteAEAD;
    if (encryptionWriteAEAD)
    {
      CFRelease(encryptionWriteAEAD);
      self->super._encryptionWriteAEAD = 0;
    }
    v10 = (CryptoAEADPrivate *)CryptoAEADCreate();
    self->super._encryptionWriteAEAD = v10;
    if (v10)
    {
      *(void *)self->super._encryptionWriteNonce = 0;
      *(_DWORD *)&self->super._encryptionWriteNonce[8] = 0;
      int var0 = self->super._ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  return 0;
}

- (void)clearEncryptionInfo
{
  encryptionReadAEAD = self->super._encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->super._encryptionReadAEAD = 0;
  }
  encryptionWriteAEAD = self->super._encryptionWriteAEAD;
  if (encryptionWriteAEAD)
  {
    CFRelease(encryptionWriteAEAD);
    self->super._encryptionWriteAEAD = 0;
  }
  [(CUPairingSession *)self->_pairSetupSession invalidate];
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  [(CUPairingSession *)self->_pairVerifySession invalidate];
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0;
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  objc_super v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->super._transaction;
  self->super._transaction = v3;

  if (!self->super._transaction)
  {
    int var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(SFSession *)self _setupMessageSession];
  if ([(SFService *)self->_service touchRemoteEnabled]) {
    [(SFSession *)self _setupTouchRemote];
  }
  int v6 = self->super._ucatCore->var0;
  if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->super._heartbeatLastTicks = mach_absolute_time();
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
  heartbeatTimer = self->super._heartbeatTimer;
  self->super._heartbeatTimer = v7;

  objc_super v9 = self->super._heartbeatTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __28__SFServiceSession_activate__block_invoke;
  handler[3] = &unk_1E5BBC870;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  SFDispatchTimerSet(self->super._heartbeatTimer, 3.0, 3.0, -4.0);
  dispatch_resume((dispatch_object_t)self->super._heartbeatTimer);
}

uint64_t __28__SFServiceSession_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hearbeatTimer];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  heartbeatTimer = self->super._heartbeatTimer;
  if (heartbeatTimer)
  {
    SEL v4 = heartbeatTimer;
    dispatch_source_cancel(v4);
    v5 = self->super._heartbeatTimer;
    self->super._heartbeatTimer = 0;
  }
  [(SFSession *)self _tearDownMessageSession];
  [(SFSession *)self _tearDownTouchRemote];
  [(NSMutableDictionary *)self->super._requestHandlers removeAllObjects];
  requestHandlers = self->super._requestHandlers;
  self->super._requestHandlers = 0;

  requestMap = self->super._requestMap;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__SFServiceSession_invalidate__block_invoke;
  v11[3] = &unk_1E5BC0268;
  v11[4] = self;
  [(NSMutableDictionary *)requestMap enumerateKeysAndObjectsUsingBlock:v11];
  [(NSMutableDictionary *)self->super._requestMap removeAllObjects];
  unint64_t v8 = self->super._requestMap;
  self->super._requestMap = 0;

  [(SFServiceSession *)self clearEncryptionInfo];
  transaction = self->super._transaction;
  self->super._transaction = 0;

  int var0 = self->super._ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void __30__SFServiceSession_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
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
  unint64_t v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28760];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v12 = (void *)v11;
    v13 = @"?";
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v18[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v15 = [v9 errorWithDomain:v10 code:-6723 userInfo:v14];
    ((void (**)(void, void, void *, void))v8)[2](v8, 0, v15, 0);
  }
}

- (void)_hearbeatTimer
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->super._heartbeatTimer)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    double v4 = v3;
    if (v3 >= 300.0)
    {
      int var0 = self->super._ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      {
        double v15 = v4;
        LogPrintF();
      }
      service = self->_service;
      unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28760];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v11 = (void *)v10;
      v12 = @"?";
      if (v10) {
        v12 = (__CFString *)v10;
      }
      v17[0] = v12;
      v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, *(void *)&v15);
      v14 = [v8 errorWithDomain:v9 code:-71160 userInfo:v13];
      [(SFService *)service serviceSessionFailed:self error:v14];
    }
    else if (v3 > 6.0)
    {
      int v5 = self->super._ucatCore->var0;
      if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)receivedEncryptedData:(id)a3 type:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (!self->super._encryptionReadAEAD)
  {
    int var0 = self->super._ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_43;
    }
LABEL_24:
    LogPrintF();
LABEL_43:
    id v11 = 0;
    goto LABEL_44;
  }
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7;
  if (v7 <= 0xF)
  {
    int v23 = self->super._ucatCore->var0;
    if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_43;
    }
    goto LABEL_24;
  }
  unint64_t v9 = v7 - 16;
  uint64_t v10 = [v6 bytes];
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v8 - 16];
  if ([v11 length] != v9)
  {
    int v24 = self->super._ucatCore->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_44;
    }
LABEL_30:
    LogPrintF();
    goto LABEL_44;
  }
  id v11 = v11;
  [v11 mutableBytes];
  encryptionReadNonce = self->super._encryptionReadNonce;
  unint64_t v30 = v10 + v9;
  int v13 = CryptoAEADDecryptMessage();
  uint64_t v14 = 0;
  do
  {
    if (++encryptionReadNonce[v14]) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v14 == 11;
    }
    ++v14;
  }
  while (!v16);
  if (v13)
  {
    int v25 = self->super._ucatCore->var0;
    if (v25 > 60 || v25 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_44;
    }
    goto LABEL_30;
  }
  if (v4 == 28)
  {
    NSDataDecompress();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = 0;
    v19 = v18;
    if (v17)
    {

      goto LABEL_15;
    }
    int v29 = self->super._ucatCore->var0;
    if (v29 <= 60 && (v29 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

LABEL_44:
    id v17 = 0;
LABEL_45:
    v21 = 0;
    goto LABEL_18;
  }
  id v17 = v11;
LABEL_15:
  uint64_t v20 = OPACKDecodeData();
  if (!v20)
  {
    int v26 = self->super._ucatCore->var0;
    if (v26 <= 60 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_45;
  }
  v21 = (void *)v20;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SFServiceSession _receivedObject:flags:](self, "_receivedObject:flags:", v21, 1, v30, 16);
  }
  else
  {
    int v27 = self->super._ucatCore->var0;
    if (v27 <= 60 && (v27 != -1 || _LogCategory_Initialize()))
    {
      v28 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v28);
      LogPrintF();
    }
  }
LABEL_18:
}

- (void)receivedUnencryptedData:(id)a3 type:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (v4 == 29)
  {
    uint64_t v7 = NSDataDecompress();
    id v8 = 0;

    if (!v7)
    {
      int var0 = self->super._ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }

      id v6 = 0;
      goto LABEL_30;
    }

    id v6 = (id)v7;
  }
  uint64_t v9 = OPACKDecodeData();
  if (!v9)
  {
    int v17 = self->super._ucatCore->var0;
    if (v17 <= 60 && (v17 != -1 || _LogCategory_Initialize()))
    {
      SFNearbyBLEFrameTypeToString(v4);
      LogPrintF();
    }
LABEL_30:
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = (void *)v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    switch(v4)
    {
      case 0x10u:
        id v11 = self;
        v12 = v10;
        uint64_t v13 = 1;
        goto LABEL_10;
      case 0x11u:
        id v11 = self;
        v12 = v10;
        uint64_t v13 = 0;
LABEL_10:
        [(SFServiceSession *)v11 pairSetup:v12 start:v13];
        break;
      case 0x12u:
        uint64_t v14 = self;
        double v15 = v10;
        uint64_t v16 = 1;
        goto LABEL_13;
      case 0x13u:
        uint64_t v14 = self;
        double v15 = v10;
        uint64_t v16 = 0;
LABEL_13:
        [(SFServiceSession *)v14 pairVerify:v15 start:v16];
        break;
      default:
        [(SFServiceSession *)self _receivedObject:v10 flags:0];
        break;
    }
  }
  else
  {
    int v18 = self->super._ucatCore->var0;
    if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
    {
      SFNearbyBLEFrameTypeToString(v4);
      v19 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v19);
      LogPrintF();
    }
  }
LABEL_14:
}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  uint64_t v6 = [v12 objectForKeyedSubscript:@"_xc"];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (![(SFSession *)self _sessionReceivedRegisteredRequestID:v12 flags:v4 xidKey:@"_xc" xidValue:v6])[(SFServiceSession *)self _receivedRequestID:v7 object:v12 flags:v4]; {
  }
    }
  else
  {
    uint64_t v8 = [v12 objectForKeyedSubscript:@"_xs"];
    if (v8)
    {
      uint64_t v7 = (void *)v8;
      [(SFServiceSession *)self _receivedResponseID:v8 object:v12 flags:v4];
    }
    else
    {
      if (![(SFSession *)self _sessionReceivedEvent:v12 flags:v4])
      {
        uint64_t v9 = [(SFService *)self->_service receivedObjectHandler];

        if (v9)
        {
          uint64_t v10 = [(SFService *)self->_service receivedObjectHandler];
          ((void (**)(void, SFServiceSession *, uint64_t, id))v10)[2](v10, self, v4, v12);
        }
        else
        {
          int var0 = self->super._ucatCore->var0;
          if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
      uint64_t v7 = 0;
    }
  }
}

- (void)_receivedRequestID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  uint64_t v9 = (void *)[a4 mutableCopy];
  [v9 removeObjectForKey:@"_xc"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SFServiceSession__receivedRequestID_object_flags___block_invoke;
  aBlock[3] = &unk_1E5BC1380;
  aBlock[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v11 = _Block_copy(aBlock);
  if (![(SFSession *)self _sessionReceivedRequest:v9 flags:v5 responseHandler:v11])
  {
    id v12 = [(SFService *)self->_service receivedRequestHandler];

    if (v12)
    {
      uint64_t v13 = [(SFService *)self->_service receivedRequestHandler];
      ((void (**)(void, SFServiceSession *, uint64_t, void *, void *))v13)[2](v13, self, v5, v9, v11);
    }
    else
    {
      int var0 = self->super._ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

void __52__SFServiceSession__receivedRequestID_object_flags___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    id v16 = objc_msgSend(v8, "mutableCopy", v17, v18);
    [v16 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"_xc"];
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
    uint64_t v14 = [v11 numberWithInt:v13];
    v19[1] = @"_xc";
    v20[0] = v14;
    v20[1] = *(void *)(a1 + 40);
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v10 sendWithFlags:a2 object:v15];
  }
}

- (void)_receivedResponseID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->super._requestMap objectForKeyedSubscript:v8];
  if (!v10)
  {
    int var0 = self->super._ucatCore->var0;
    if (var0 > 50 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_6;
    }
LABEL_12:
    LogPrintF();
    goto LABEL_6;
  }
  [(NSMutableDictionary *)self->super._requestMap removeObjectForKey:v8];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"_rh"];
  if (!v11)
  {
    int v16 = self->super._ucatCore->var0;
    if (v16 > 50 || v16 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  unsigned int v12 = (void (**)(void, void, void, void))v11;
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v5 & 1) == 0 && (Int64Ranged)
  {
    int v17 = self->super._ucatCore->var0;
    if (v17 <= 50 && (v17 != -1 || _LogCategory_Initialize()))
    {
      id v25 = v8;
      LogPrintF();
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    uint64_t v20 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v21 = (void *)v20;
    v22 = @"?";
    if (v20) {
      v22 = (__CFString *)v20;
    }
    v27[0] = v22;
    int v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v25);
    int v24 = [v18 errorWithDomain:v19 code:-6768 userInfo:v23];
    ((void (**)(void, void, void *, void))v12)[2](v12, 0, v24, 0);
  }
  else
  {
    uint64_t v14 = (void *)[v9 mutableCopy];
    [v14 removeObjectForKey:@"_xs"];
    ((void (**)(void, uint64_t, void, void *))v12)[2](v12, v5, 0, v14);
  }
LABEL_6:
}

- (void)receivedStartRequest:(id)a3
{
  id v4 = a3;
  int v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFServiceSession_receivedStartRequest___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  if (receivedStartRequest__onceToken != -1) {
    dispatch_once(&receivedStartRequest__onceToken, block);
  }
  uint64_t v5 = (void *)OPACKDecodeData();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int var0 = self->super._ucatCore->var0;
  if (isKindOfClass)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->super._sessionID = CFDictionaryGetInt64Ranged();
    CFStringGetTypeID();
    id v8 = CFDictionaryGetTypedValue();
    id v9 = v8;
    if (v8)
    {
      [v8 UTF8String];
      unsigned int v10 = TextToSourceVersion();
      self->super._sharingSourceVersion = v10;
      if (!v10) {
        goto LABEL_12;
      }
    }
    else if (!self->super._sharingSourceVersion)
    {
LABEL_12:
      int v11 = self->super._ucatCore->var0;
      if (v11 <= 115 && (v11 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    unsigned int sessionFlags = self->super._sessionFlags;
    if ((sessionFlags & 1) != 0 && self->super._sharingSourceVersion >= 0x7E57C0)
    {
      sessionFlags |= 2u;
      self->super._unsigned int sessionFlags = sessionFlags;
    }
    if ((sessionFlags & 0x20) != 0 && self->super._sharingSourceVersion >= 0x8FE454) {
      self->super._unsigned int sessionFlags = sessionFlags | 0x40;
    }
    int v13 = self->super._ucatCore->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t DataMutable = OPACKEncoderCreateDataMutable();
    if (DataMutable)
    {
      double v15 = (void *)DataMutable;
      [(SFServiceSession *)self _sendFrameType:24 data:DataMutable];
    }
    else
    {
      int v16 = self->super._ucatCore->var0;
      if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    goto LABEL_28;
  }
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v9 = 0;
LABEL_28:
}

int *__41__SFServiceSession_receivedStartRequest___block_invoke(uint64_t a1)
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

- (void)sendEncryptedObject:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21[0] = 0;
  v21[1] = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (!self->_service->_xpcCnx)
  {
    int var0 = self->super._ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
LABEL_25:
    LogPrintF();
LABEL_26:
    id v6 = 0;
    goto LABEL_16;
  }
  if (!self->super._encryptionWriteAEAD)
  {
    int v17 = self->super._ucatCore->var0;
    if (v17 > 60 || v17 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t DataMutable = OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    int v18 = self->super._ucatCore->var0;
    if (v18 > 60 || v18 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  id v6 = (id)DataMutable;
  if ((self->super._sessionFlags & 2) == 0)
  {
    uint64_t v7 = 6;
    goto LABEL_8;
  }
  id v8 = NSDataCompress();
  id v9 = 0;
  if (v8)
  {
    uint64_t v10 = [v8 mutableCopy];

    uint64_t v7 = 28;
    id v6 = (id)v10;
LABEL_8:
    id v6 = v6;
    [v6 mutableBytes];
    [v6 length];
    encryptionWriteNonce = self->super._encryptionWriteNonce;
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
    if (v12)
    {
      int v19 = self->super._ucatCore->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      objc_msgSend(v6, "appendBytes:length:", v21, 16, v21, 16);
      [(SFServiceSession *)self _sendFrameType:v7 data:v6];
    }
    goto LABEL_16;
  }
  int v20 = self->super._ucatCore->var0;
  if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

LABEL_16:
}

- (void)sendFrameType:(unsigned __int8)a3 data:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFServiceSession_sendFrameType_data___block_invoke;
  block[3] = &unk_1E5BC0128;
  unsigned __int8 v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFServiceSession_sendFrameType_data___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendFrameType:*(unsigned __int8 *)(a1 + 48) data:*(void *)(a1 + 40)];
}

- (void)_sendFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  self->_sendLastTicks = mach_absolute_time();
  [(SFService *)self->_service _sendToPeer:self->super._peer type:v4 data:v6];
}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  self->_sendLastTicks = mach_absolute_time();
  [(SFService *)self->_service _sendToPeer:self->super._peer type:v4 unencryptedObject:v6];
}

- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->super._dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SFServiceSession_sendRequestWithFlags_object_responseHandler___block_invoke;
  v13[3] = &unk_1E5BBFC20;
  unsigned int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __64__SFServiceSession_sendRequestWithFlags_object_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequestWithFlags:*(unsigned int *)(a1 + 56) object:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 48)];
}

- (void)_sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)[a4 mutableCopy];
  RandomBytes();
  id v10 = [NSNumber numberWithLongLong:0];
  [v9 setObject:v10 forKeyedSubscript:@"_xs"];
  if (!self->super._requestMap)
  {
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestMap = self->super._requestMap;
    self->super._requestMap = v11;
  }
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6, 0, @"_fl");
  v16[1] = @"_rh";
  v17[0] = v13;
  id v14 = _Block_copy(v8);

  v17[1] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [(NSMutableDictionary *)self->super._requestMap setObject:v15 forKeyedSubscript:v10];

  [(SFServiceSession *)self _sendWithFlags:v6 object:v9];
}

- (void)sendWithFlags:(unsigned int)a3 object:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFServiceSession_sendWithFlags_object___block_invoke;
  block[3] = &unk_1E5BBFDF8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFServiceSession_sendWithFlags_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendWithFlags:*(unsigned int *)(a1 + 48) object:*(void *)(a1 + 40)];
}

- (void)_sendWithFlags:(unsigned int)a3 object:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v8 = v6;
  if (v4)
  {
    [(SFServiceSession *)self sendEncryptedObject:v6];
  }
  else
  {
    if ((self->super._sessionFlags & 2) != 0) {
      uint64_t v7 = 29;
    }
    else {
      uint64_t v7 = 5;
    }
    [(SFServiceSession *)self _sendFrameType:v7 unencryptedObject:v6];
  }
}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if ((int)v4 <= 15)
  {
    if (v4 == 5)
    {
LABEL_3:
      id v10 = v6;
      [(SFServiceSession *)self receivedUnencryptedData:v6 type:v4];
    }
    else
    {
      if (v4 != 6) {
        goto LABEL_14;
      }
LABEL_6:
      id v10 = v6;
      [(SFServiceSession *)self receivedEncryptedData:v6 type:v4];
    }
  }
  else
  {
    switch((int)v4)
    {
      case 16:
      case 17:
      case 18:
      case 19:
      case 29:
        goto LABEL_3;
      case 20:
      case 21:
      case 22:
      case 24:
      case 25:
      case 26:
      case 27:
        goto LABEL_14;
      case 23:
        id v10 = v6;
        [(SFServiceSession *)self receivedStartRequest:v6];
        break;
      case 28:
        goto LABEL_6;
      default:
        if (v4 == 64)
        {
          uint64_t v7 = self;
          id v10 = v6;
          id v8 = v6;
          uint64_t v9 = 0;
        }
        else
        {
          if (v4 != 65) {
            goto LABEL_14;
          }
          uint64_t v7 = self;
          id v10 = v6;
          id v8 = v6;
          uint64_t v9 = 1;
        }
        [(SFSession *)v7 sessionReceivedFragmentData:v8 last:v9];
        break;
    }
  }
  id v6 = v10;
LABEL_14:
}

- (BOOL)pairingContainsACL:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  pairVerifySession = self->_pairVerifySession;
  if (!pairVerifySession) {
    pairVerifySession = self->_pairSetupSession;
  }
  uint64_t v7 = [(CUPairingSession *)pairVerifySession pairedPeer];
  id v8 = [v7 acl];
  uint64_t Int64 = CFDictionaryGetInt64();

  return Int64 != 0;
}

- (id)pairingDeriveKeyForIdentifier:(id)a3 keyLength:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (const char *)[v6 UTF8String];
  size_t v8 = strlen(v7);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a4];
  id v10 = v9;
  pairSetupSession = self->_pairSetupSession;
  if ((pairSetupSession || (pairSetupSession = self->_pairVerifySession) != 0)
    && !-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "IdentifierKeyInfo", 17, v7, v8, a4, [v9 mutableBytes]))
  {
    id v12 = v10;
  }
  else
  {
    int var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v12 = 0;
  }

  return v12;
}

- (void)pairSetupWithFlags:(unsigned int)a3
{
  p_pairSetupXID = &self->_pairSetupXID;
  RandomBytes();
  int var0 = self->super._ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = *p_pairSetupXID;
    LogPrintF();
  }
  if ((self->super._sessionFlags & 0x800) != 0)
  {
    uint64_t v7 = 20;
  }
  else
  {
    uint64_t v7 = a3 & 0x18 | 4;
    size_t v8 = [(SFService *)self->_service showPINHandler];
    if (v8)
    {
    }
    else
    {
      uint64_t v9 = [(SFService *)self->_service showPINHandlerEx];

      if (v9) {
        uint64_t v7 = v7;
      }
      else {
        uint64_t v7 = a3 & 0x18 | 0x84;
      }
    }
  }
  id v10 = [(SFService *)self->_service promptForPINHandler];

  [(CUPairingSession *)self->_pairSetupSession invalidate];
  unsigned int v11 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v11;

  uint64_t v13 = [(SFService *)self->_service pairSetupACL];

  if (v13)
  {
    id v14 = [(SFService *)self->_service pairSetupACL];
    [(CUPairingSession *)self->_pairSetupSession setAcl:v14];
  }
  [(CUPairingSession *)self->_pairSetupSession setDispatchQueue:self->super._dispatchQueue];
  [(CUPairingSession *)self->_pairSetupSession setFlags:v7];
  id v15 = [NSString stringWithUTF8String:self->super._ucatCrypto->var4];
  [(CUPairingSession *)self->_pairSetupSession setLabel:v15];

  [(CUPairingSession *)self->_pairSetupSession setPinType:[(SFService *)self->_service pinType]];
  [(CUPairingSession *)self->_pairSetupSession setSessionType:1];
  unsigned int v16 = self->super._fixedPIN;
  if (![(NSString *)v16 length])
  {
    uint64_t v17 = [(SFService *)self->_service fixedPIN];

    unsigned int v16 = (NSString *)v17;
  }
  if (![(NSString *)v16 length] && IsAppleInternalBuild())
  {
    CFStringGetTypeID();
    uint64_t v18 = CFPrefs_CopyTypedValue();

    unsigned int v16 = (NSString *)v18;
  }
  if ([(NSString *)v16 length]) {
    [(CUPairingSession *)self->_pairSetupSession setFixedPIN:v16];
  }
  int v19 = [(SFService *)self->_service showPINHandlerEx];

  service = self->_service;
  if (v19)
  {
    v21 = [(SFService *)service showPINHandlerEx];
    [(CUPairingSession *)self->_pairSetupSession setShowPINHandlerEx:v21];
  }
  else
  {
    v22 = [(SFService *)service showPINHandler];

    if (!v22) {
      goto LABEL_26;
    }
    v21 = [(SFService *)self->_service showPINHandler];
    [(CUPairingSession *)self->_pairSetupSession setShowPINHandler:v21];
  }

LABEL_26:
  int v23 = [(SFService *)self->_service hidePINHandler];

  if (v23)
  {
    int v24 = [(SFService *)self->_service hidePINHandler];
    [(CUPairingSession *)self->_pairSetupSession setHidePINHandler:v24];
  }
  if (v10)
  {
    id v25 = [(SFService *)self->_service promptForPINHandler];
    [(CUPairingSession *)self->_pairSetupSession setPromptForPINHandler:v25];
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __39__SFServiceSession_pairSetupWithFlags___block_invoke;
  v34[3] = &unk_1E5BC13A8;
  v34[4] = self;
  unsigned int v35 = a3;
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__SFServiceSession_pairSetupWithFlags___block_invoke_2;
  v33[3] = &unk_1E5BBC8E8;
  v33[4] = self;
  [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:v33];
  int v26 = self->super._ucatCore->var0;
  if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v31 = v7;
    v32 = &unk_1A56EB45D;
    uint64_t sessionFlags = self->super._sessionFlags;
    unint64_t v30 = &unk_1A56EB388;
    uint64_t v28 = *p_pairSetupXID;
    LogPrintF();
  }
  [(CUPairingSession *)self->_pairSetupSession activate];
}

void __39__SFServiceSession_pairSetupWithFlags___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = **(_DWORD **)(v6 + 160);
  if (v7 <= 30)
  {
    if (v7 != -1 || (v8 = _LogCategory_Initialize(), uint64_t v6 = *(void *)(a1 + 32), v8))
    {
      uint64_t v15 = a2;
      LogPrintF();
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v6 + 608), v15, @"pd", @"pxid", v5);
  v17[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:2];

  if (a2)
  {
    id v12 = (void *)[v10 mutableCopy];
    uint64_t v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    [v12 setObject:v13 forKeyedSubscript:@"pf"];

    uint64_t v14 = [v12 copy];
    uint64_t v11 = 16;
    id v10 = (void *)v14;
  }
  else
  {
    uint64_t v11 = 17;
  }
  [*(id *)(a1 + 32) _sendFrameType:v11 unencryptedObject:v10];
}

void __39__SFServiceSession_pairSetupWithFlags___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 632) pairSetupCompletionHandler];

  if (v4)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 632) pairSetupCompletionHandler];
    ((void (**)(void, id))v5)[2](v5, v3);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _pairSetupCompleted:NSErrorToOSStatus()];
  if (v6)
  {
    int v7 = *(void **)(a1 + 32);
    id v10 = @"er";
    int v8 = [NSNumber numberWithInt:v6];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 _sendFrameType:17 unencryptedObject:v9];
  }
}

- (void)pairSetup:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v54 = 0;
  if ([(SFService *)self->_service pairSetupDisabled])
  {
    int v54 = -6731;
    v55 = @"er";
    int v7 = [NSNumber numberWithInt:4294960565];
    v56[0] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    [(SFServiceSession *)self _sendFrameType:17 unencryptedObject:v8];

    goto LABEL_3;
  }
  int var0 = self->super._ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = "no";
    if (v4) {
      uint64_t v11 = "yes";
    }
    if (self->_pairSetupSession) {
      id v12 = @"not nil";
    }
    else {
      id v12 = @"is nil";
    }
    v45 = v11;
    v47 = v12;
    LogPrintF();
  }
  if (v4 || !self->_pairSetupSession)
  {
    __int16 Int64Ranged = CFDictionaryGetInt64Ranged();
    self->_uint64_t pairSetupXID = CFDictionaryGetInt64Ranged();
    if ((self->super._sessionFlags & 0x800) != 0)
    {
      int v15 = 20;
    }
    else
    {
      int v15 = Int64Ranged & 0x18 | 4;
      uint64_t v16 = [(SFService *)self->_service showPINHandler];
      if (v16)
      {
      }
      else
      {
        uint64_t v17 = [(SFService *)self->_service showPINHandlerEx];

        if (!v17) {
          int v15 = Int64Ranged & 0x18 | 0x84;
        }
      }
    }
    uint64_t v18 = v15 | Int64Ranged & 0x100u;
    int v19 = [(SFService *)self->_service promptForPINHandler];

    [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:0];
    [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:0];
    [(CUPairingSession *)self->_pairSetupSession invalidate];
    int v20 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
    pairSetupSession = self->_pairSetupSession;
    self->_pairSetupSession = v20;

    v22 = [(SFService *)self->_service pairSetupACL];

    if (v22)
    {
      int v23 = [(SFService *)self->_service pairSetupACL];
      [(CUPairingSession *)self->_pairSetupSession setAcl:v23];
    }
    [(CUPairingSession *)self->_pairSetupSession setDispatchQueue:self->super._dispatchQueue];
    [(CUPairingSession *)self->_pairSetupSession setFlags:v18];
    int v24 = [NSString stringWithUTF8String:self->super._ucatCrypto->var4];
    [(CUPairingSession *)self->_pairSetupSession setLabel:v24];

    [(CUPairingSession *)self->_pairSetupSession setPinType:[(SFService *)self->_service pinType]];
    if (v19) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = 2;
    }
    [(CUPairingSession *)self->_pairSetupSession setSessionType:v25];
    int v26 = [(SFSession *)self peerDevice];
    -[CUPairingSession setPeerDeviceClass:](self->_pairSetupSession, "setPeerDeviceClass:", MGDeviceClassFromSFDeviceClassCode([v26 deviceClassCode]));

    uint64_t v27 = self->super._fixedPIN;
    if (![(NSString *)v27 length])
    {
      uint64_t v28 = [(SFService *)self->_service fixedPIN];

      uint64_t v27 = (NSString *)v28;
    }
    if (![(NSString *)v27 length] && IsAppleInternalBuild())
    {
      CFStringGetTypeID();
      uint64_t v29 = CFPrefs_CopyTypedValue();

      uint64_t v27 = (NSString *)v29;
    }
    if ([(NSString *)v27 length]) {
      [(CUPairingSession *)self->_pairSetupSession setFixedPIN:v27];
    }
    unint64_t v30 = [(SFService *)self->_service showPINHandlerEx];

    service = self->_service;
    if (v30)
    {
      v32 = [(SFService *)service showPINHandlerEx];
      [(CUPairingSession *)self->_pairSetupSession setShowPINHandlerEx:v32];
    }
    else
    {
      v33 = [(SFService *)service showPINHandler];

      if (!v33)
      {
LABEL_41:
        v34 = [(SFService *)self->_service hidePINHandler];

        if (v34)
        {
          unsigned int v35 = [(SFService *)self->_service hidePINHandler];
          [(CUPairingSession *)self->_pairSetupSession setHidePINHandler:v35];
        }
        if (v19)
        {
          v36 = [(SFService *)self->_service promptForPINHandler];
          [(CUPairingSession *)self->_pairSetupSession setPromptForPINHandler:v36];
        }
        BOOL v37 = [(SFService *)self->_service isCLIMode];
        int v38 = self->super._ucatCore->var0;
        if (v37)
        {
          if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          v39 = [(SFService *)self->_service forcedPin];
          [(CUPairingSession *)self->_pairSetupSession setFixedPIN:v39];
        }
        else if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __36__SFServiceSession_pairSetup_start___block_invoke;
        v53[3] = &unk_1E5BC13D0;
        v53[4] = self;
        [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:v53];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __36__SFServiceSession_pairSetup_start___block_invoke_2;
        v52[3] = &unk_1E5BBC8E8;
        v52[4] = self;
        [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:v52];
        int v40 = self->super._ucatCore->var0;
        if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v50 = v18;
          v51 = &unk_1A56EB45D;
          uint64_t sessionFlags = self->super._sessionFlags;
          v49 = &unk_1A56EB388;
          uint64_t pairSetupXID = self->_pairSetupXID;
          LogPrintF();
        }
        [(CUPairingSession *)self->_pairSetupSession activate];

        goto LABEL_59;
      }
      v32 = [(SFService *)self->_service showPINHandler];
      [(CUPairingSession *)self->_pairSetupSession setShowPINHandler:v32];
    }

    goto LABEL_41;
  }
  int v13 = self->super._ucatCore->var0;
  if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_59:
  CFDataGetTypeID();
  uint64_t v41 = CFDictionaryGetTypedValue();
  uint64_t v9 = (void *)v41;
  if (v54)
  {
    int v43 = self->super._ucatCore->var0;
    if (v43 <= 60 && (v43 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_62;
  }
  if (v41)
  {
    [(CUPairingSession *)self->_pairSetupSession receivedData:v41];
    goto LABEL_62;
  }
  int v54 = -6762;
  int v44 = self->super._ucatCore->var0;
  if (v44 > 60)
  {
    uint64_t v9 = 0;
    goto LABEL_67;
  }
  if (v44 != -1 || _LogCategory_Initialize()) {
    LogPrintF();
  }
LABEL_3:
  uint64_t v9 = 0;
LABEL_62:
  if (v54)
  {
    int v42 = self->super._ucatCore->var0;
    if (v42 <= 60 && (v42 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_67:
}

void __36__SFServiceSession_pairSetup_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = *(unsigned int **)(a1 + 32);
  v9[0] = @"pd";
  v9[1] = @"pxid";
  v10[0] = a3;
  BOOL v4 = NSNumber;
  uint64_t v5 = v3[152];
  id v6 = a3;
  int v7 = [v4 numberWithUnsignedInt:v5];
  v10[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v3 _sendFrameType:17 unencryptedObject:v8];
}

void __36__SFServiceSession_pairSetup_start___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 632) pairSetupCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 632) pairSetupCompletionHandler];
    ((void (**)(void, id))v5)[2](v5, v3);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _pairSetupCompleted:NSErrorToOSStatus()];
  if (v6)
  {
    int v7 = *(void **)(a1 + 32);
    id v10 = @"er";
    int v8 = [NSNumber numberWithInt:v6];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 _sendFrameType:17 unencryptedObject:v9];
  }
}

- (int)_pairSetupCompleted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  memset(v12, 0, sizeof(v12));
  if (a3) {
    goto LABEL_16;
  }
  pairSetupSession = self->_pairSetupSession;
  if (!pairSetupSession)
  {
    uint64_t v3 = 4294960534;
LABEL_16:
    int var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = v3;
      LogPrintF();
    }
    [(CUPairingSession *)self->_pairSetupSession invalidate];
    int v8 = (void (**)(void, void))self->_pairSetupSession;
    self->_pairSetupSession = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [(CUPairingSession *)pairSetupSession deriveKeyWithSaltPtr:"ReadKeySalt" saltLen:11 infoPtr:"ReadKeyInfo" infoLen:11 keyLen:32 outputKeyPtr:v12];
  if (v6
    || (uint64_t v6 = [(CUPairingSession *)self->_pairSetupSession deriveKeyWithSaltPtr:"WriteKeySalt" saltLen:12 infoPtr:"WriteKeyInfo" infoLen:12 keyLen:32 outputKeyPtr:__s], v6)|| (uint64_t v6 = [(SFServiceSession *)self setEncryptionReadKey:__s readKeyLen:32 writeKey:v12 writeKeyLen:32], v6))
  {
    uint64_t v3 = v6;
    goto LABEL_16;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v12, 0x20uLL, 0, 0x20uLL);
  int v7 = self->super._ucatCore->var0;
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = [(SFService *)self->_service sessionSecuredHandler];

  if (v3)
  {
    int v8 = [(SFService *)self->_service sessionSecuredHandler];
    ((void (**)(void, SFServiceSession *))v8)[2](v8, self);
    LODWORD(v3) = 0;
LABEL_12:
  }
  return v3;
}

- (void)tryPIN:(id)a3
{
}

- (void)pairVerify:(id)a3 start:(BOOL)a4
{
  id v6 = a3;
  int v27 = 0;
  if (a4 || !self->_pairVerifySession)
  {
    __int16 Int64Ranged = CFDictionaryGetInt64Ranged();
    if ((CFDictionaryGetInt64Ranged() & 8) != 0) {
      uint64_t v8 = 12;
    }
    else {
      uint64_t v8 = 4;
    }
    [(CUPairingSession *)self->_pairVerifySession setCompletionHandler:0];
    [(CUPairingSession *)self->_pairVerifySession setSendDataHandler:0];
    [(CUPairingSession *)self->_pairVerifySession invalidate];
    if (([(SFService *)self->_service sessionFlags] & 4) != 0)
    {
      if (([(SFService *)self->_service sessionFlags] & 8) != 0) {
        int v9 = 1052672;
      }
      else {
        int v9 = 4096;
      }
      uint64_t v8 = v9 & 0xFFDFFFFF | ((([(SFService *)self->_service sessionFlags] >> 4) & 1) << 21) | v8;
    }
    else if ((Int64Ranged & 0x400) == 0)
    {
      uint64_t v8 = v8 & 0xFBFFFFFF | (((self->super._sessionFlags >> 6) & 1) << 26);
    }
    id v10 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
    pairVerifySession = self->_pairVerifySession;
    self->_pairVerifySession = v10;

    id v12 = [(SFService *)self->_service pairVerifyACL];

    if (v12)
    {
      int v13 = [(SFService *)self->_service pairVerifyACL];
      [(CUPairingSession *)self->_pairVerifySession setAcl:v13];
    }
    [(CUPairingSession *)self->_pairVerifySession setDispatchQueue:self->super._dispatchQueue];
    [(CUPairingSession *)self->_pairVerifySession setFlags:v8];
    uint64_t v14 = [NSString stringWithUTF8String:self->super._ucatCrypto->var4];
    [(CUPairingSession *)self->_pairVerifySession setLabel:v14];

    [(CUPairingSession *)self->_pairVerifySession setSessionType:4];
    if ((v8 & 0x1000) == 0) {
      goto LABEL_24;
    }
    int v15 = [(SFService *)self->_service myAppleIDInfoClient];

    service = self->_service;
    if (v15)
    {
      uint64_t v17 = [(SFService *)service myAppleIDInfoClient];
      [(CUPairingSession *)self->_pairVerifySession setMyAppleIDInfoClient:v17];
    }
    else
    {
      uint64_t v18 = [(SFService *)service myAppleID];

      if (!v18) {
        goto LABEL_21;
      }
      uint64_t v17 = [(SFService *)self->_service myAppleID];
      [(CUPairingSession *)self->_pairVerifySession setMyAppleID:v17];
    }

LABEL_21:
    if (self->super._peerAppleID)
    {
      -[CUPairingSession setPeerAppleID:](self->_pairVerifySession, "setPeerAppleID:");
    }
    else
    {
      int v19 = [(SFService *)self->_service peerAppleID];
      [(CUPairingSession *)self->_pairVerifySession setPeerAppleID:v19];
    }
LABEL_24:
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __37__SFServiceSession_pairVerify_start___block_invoke;
    v26[3] = &unk_1E5BC13D0;
    v26[4] = self;
    [(CUPairingSession *)self->_pairVerifySession setSendDataHandler:v26];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __37__SFServiceSession_pairVerify_start___block_invoke_2;
    v25[3] = &unk_1E5BBC8E8;
    v25[4] = self;
    [(CUPairingSession *)self->_pairVerifySession setCompletionHandler:v25];
    [(CUPairingSession *)self->_pairVerifySession activate];
  }
  CFDataGetTypeID();
  uint64_t v20 = CFDictionaryGetTypedValue();
  v21 = (void *)v20;
  if (v27)
  {
    int var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (v20)
  {
    [(CUPairingSession *)self->_pairVerifySession receivedData:v20];
  }
  else
  {
    int v27 = -6762;
    int v24 = self->super._ucatCore->var0;
    if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v21 = 0;
  }
  if (v27)
  {
    int v22 = self->super._ucatCore->var0;
    if (v22 <= 60 && (v22 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void __37__SFServiceSession_pairVerify_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  int v7 = @"pd";
  v8[0] = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 _sendFrameType:19 unencryptedObject:v6];
}

void __37__SFServiceSession_pairVerify_start___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _pairVerifyCompleted:NSErrorToOSStatus()];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v6 = @"er";
    BOOL v4 = [NSNumber numberWithInt:v2];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v3 _sendFrameType:19 unencryptedObject:v5];
  }
}

- (int)_pairVerifyCompleted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  memset(v12, 0, sizeof(v12));
  if (a3) {
    goto LABEL_16;
  }
  pairVerifySession = self->_pairVerifySession;
  if (!pairVerifySession)
  {
    uint64_t v3 = 4294960534;
LABEL_16:
    int var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = v3;
      LogPrintF();
    }
    [(CUPairingSession *)self->_pairVerifySession invalidate];
    uint64_t v8 = (void (**)(void, void))self->_pairVerifySession;
    self->_pairVerifySession = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [(CUPairingSession *)pairVerifySession deriveKeyWithSaltPtr:"ReadKeySalt" saltLen:11 infoPtr:"ReadKeyInfo" infoLen:11 keyLen:32 outputKeyPtr:v12];
  if (v6
    || (uint64_t v6 = [(CUPairingSession *)self->_pairVerifySession deriveKeyWithSaltPtr:"WriteKeySalt" saltLen:12 infoPtr:"WriteKeyInfo" infoLen:12 keyLen:32 outputKeyPtr:__s], v6)|| (uint64_t v6 = [(SFServiceSession *)self setEncryptionReadKey:__s readKeyLen:32 writeKey:v12 writeKeyLen:32], v6))
  {
    uint64_t v3 = v6;
    goto LABEL_16;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v12, 0x20uLL, 0, 0x20uLL);
  int v7 = self->super._ucatCore->var0;
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = [(SFService *)self->_service sessionSecuredHandler];

  if (v3)
  {
    uint64_t v8 = [(SFService *)self->_service sessionSecuredHandler];
    ((void (**)(void, SFServiceSession *))v8)[2](v8, self);
    LODWORD(v3) = 0;
LABEL_12:
  }
  return v3;
}

- (unint64_t)sendLastTicks
{
  return self->_sendLastTicks;
}

- (void)setSendLastTicks:(unint64_t)a3
{
  self->_sendLastTicks = a3;
}

- (SFService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pairVerifySession, 0);

  objc_storeStrong((id *)&self->_pairSetupSession, 0);
}

@end