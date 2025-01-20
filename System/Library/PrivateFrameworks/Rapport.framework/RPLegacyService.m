@interface RPLegacyService
- (BOOL)needsSetup;
- (NSDictionary)txtDictionary;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPLegacyService)init;
- (id)description;
- (id)errorHandler;
- (id)hidePINHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)sessionEndedHandler;
- (id)sessionStartedHandler;
- (id)showPINHandler;
- (int)_bonjourUpdateService;
- (int)_bonjourUpdateTXT;
- (int)_tcpStart;
- (unsigned)advertiseRate;
- (unsigned)deviceActionType;
- (void)_activateWithCompletion:(id)a3;
- (void)_cleanup;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setAdvertiseRate:(unsigned int)a3;
- (void)setDeviceActionType:(unsigned __int8)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setNeedsSetup:(BOOL)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionEndedHandler:(id)a3;
- (void)setSessionStartedHandler:(id)a3;
- (void)setShowPINHandler:(id)a3;
- (void)setTxtDictionary:(id)a3;
@end

@implementation RPLegacyService

- (RPLegacyService)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPLegacyService;
  v2 = [(RPLegacyService *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    *(void *)&v3->_tcpSockV4 = -1;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (RPLegacyService *)FatalErrorF();
    [(RPLegacyService *)v3 _cleanup];
  }
  else
  {
    [(RPLegacyService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)RPLegacyService;
    [(RPLegacyService *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  [(NSMutableDictionary *)self->_requestMap removeAllObjects];
  requestMap = self->_requestMap;
  self->_requestMap = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id sessionStartedHandler = self->_sessionStartedHandler;
  self->_id sessionStartedHandler = 0;

  id sessionEndedHandler = self->_sessionEndedHandler;
  self->_id sessionEndedHandler = 0;

  id showPINHandler = self->_showPINHandler;
  self->_id showPINHandler = 0;

  id hidePINHandler = self->_hidePINHandler;
  self->_id hidePINHandler = 0;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RPLegacyService_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__RPLegacyService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v9 = a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled) {
    goto LABEL_17;
  }
  if (self->_activateCalled) {
    goto LABEL_17;
  }
  serviceType = self->_serviceType;
  if (!serviceType) {
    goto LABEL_17;
  }
  self->_activateCalled = 1;
  if (*[(NSString *)serviceType UTF8String] == 95)
  {
    if (![(RPLegacyService *)self _tcpStart]
      && ![(RPLegacyService *)self _bonjourUpdateService])
    {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if (gLogCategory_RPLegacySupport <= 90)
  {
    if (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
LABEL_17:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  id errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    id v6 = RPErrorF();
    errorHandler[2](errorHandler, v6);
  }
LABEL_23:
  v7 = v9;
  if (v9)
  {
    id v8 = RPErrorF();
    (*((void (**)(id, void *))v9 + 2))(v9, v8);

    v7 = v9;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RPLegacyService_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPLegacyService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_bonjourAdvertiser) {
      BonjourAdvertiserStop();
    }
    int tcpSockV4 = self->_tcpSockV4;
    if ((tcpSockV4 & 0x80000000) == 0)
    {
      if (close(tcpSockV4) && *__error()) {
        __error();
      }
      self->_int tcpSockV4 = -1;
    }
    int tcpSockV6 = self->_tcpSockV6;
    if ((tcpSockV6 & 0x80000000) == 0)
    {
      if (close(tcpSockV6) && *__error()) {
        __error();
      }
      self->_int tcpSockV6 = -1;
    }
    [(RPLegacyService *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_bonjourAdvertiser)
    {
      id invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler) {
        invalidationHandler[2]();
      }
      [(RPLegacyService *)self _cleanup];
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__RPLegacyService_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E605BDB8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __53__RPLegacyService_registerRequestID_options_handler___block_invoke(void *a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1[4] + 16))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
  v9[0] = @"handler";
  uint64_t v5 = MEMORY[0x1B3EBCC80](a1[7]);
  id v6 = (void *)v5;
  v9[1] = @"options";
  uint64_t v7 = a1[6];
  if (!v7) {
    uint64_t v7 = MEMORY[0x1E4F1CC08];
  }
  v10[0] = v5;
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [*(id *)(a1[4] + 16) setObject:v8 forKeyedSubscript:a1[5]];
}

- (int)_bonjourUpdateService
{
  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  if (self->_bonjourAdvertiser)
  {
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      serviceType = self->_serviceType;
      LogPrintF();
    }
    int v4 = [(RPLegacyService *)self _bonjourUpdateTXT];
    if (!v4)
    {
      int v5 = BonjourAdvertiserUpdate();
      goto LABEL_11;
    }
  }
  else
  {
    if (gLogCategory_RPLegacySupport <= 30)
    {
      if (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (*p_bonjourAdvertiser)
      {
        BonjourAdvertiserStop();
        CFRelease(*p_bonjourAdvertiser);
        *p_bonjourAdvertiser = 0;
      }
    }
    int v4 = BonjourAdvertiserCreate();
    if (!v4)
    {
      BonjourAdvertiserSetDispatchQueue();
      BonjourAdvertiserSetPort();
      [(NSString *)self->_serviceType UTF8String];
      BonjourAdvertiserSetServiceType();
      int v4 = [(RPLegacyService *)self _bonjourUpdateTXT];
      if (!v4)
      {
        int v5 = BonjourAdvertiserStart();
LABEL_11:
        int v4 = v5;
        if (!v5) {
          return v4;
        }
      }
    }
  }
  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v4;
}

- (int)_bonjourUpdateTXT
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  TXTRecordRef txtRecord = 0uLL;
  TXTRecordCreate(&txtRecord, 0x100u, buffer);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_txtDictionary;
  uint64_t v3 = [(NSDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v19 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      id v8 = [(NSDictionary *)self->_txtDictionary objectForKeyedSubscript:v7];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (gLogCategory_RPLegacySupport > 90
          || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_47;
        }
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = 0;
          uint8_t v11 = 0;
          goto LABEL_12;
        }
        if (gLogCategory_RPLegacySupport > 90
          || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
        {
LABEL_47:
          int v14 = -6756;
LABEL_48:

          goto LABEL_49;
        }
LABEL_36:
        LogPrintF();
        goto LABEL_47;
      }
      id v9 = (const char *)[v8 UTF8String];
      size_t v10 = strlen(v9);
      if (v10 >= 0x100)
      {
        if (gLogCategory_RPLegacySupport <= 90
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v14 = -6743;
        goto LABEL_48;
      }
      uint8_t v11 = v10;
LABEL_12:
      DNSServiceErrorType v12 = TXTRecordSetValue(&txtRecord, (const char *)[v7 UTF8String], v11, v9);
      if (v12)
      {
        int v14 = v12;
        if (gLogCategory_RPLegacySupport <= 90
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_48;
      }
    }
    uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_15:

  if (self->_deviceActionType)
  {
    int v13 = SNPrintF();
    if (v13 <= 255)
    {
      int v14 = TXTRecordSetValue(&txtRecord, "rpFl", v13, value);
      if (!v14) {
        goto LABEL_18;
      }
      goto LABEL_49;
    }
LABEL_54:
    int v14 = -6743;
    goto LABEL_49;
  }
LABEL_18:
  if (self->_needsSetup)
  {
    int v15 = SNPrintF();
    if (v15 > 255) {
      goto LABEL_54;
    }
    int v14 = TXTRecordSetValue(&txtRecord, "rpDA", v15, value);
    if (v14) {
      goto LABEL_49;
    }
  }
  if (!self->_bonjourAdvertiser)
  {
    int v14 = -6762;
    goto LABEL_49;
  }
  TXTRecordGetBytesPtr(&txtRecord);
  TXTRecordGetLength(&txtRecord);
  if (gLogCategory_RPLegacySupport <= 20
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v14 = BonjourAdvertiserSetTXTRecord();
  if (v14)
  {
LABEL_49:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  TXTRecordDeallocate(&txtRecord);
  return v14;
}

- (int)_tcpStart
{
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((self->_tcpSockV4 & 0x80000000) == 0 || (self->_tcpSockV6 & 0x80000000) == 0)
  {
    int v3 = -6721;
    goto LABEL_8;
  }
  int v3 = ServerSocketPairOpen();
  if (v3)
  {
LABEL_8:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return v3;
  }
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

- (unsigned)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(unsigned int)a3
{
  self->_advertiseRate = a3;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (void)setNeedsSetup:(BOOL)a3
{
  self->_needsSetup = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (void)setTxtDictionary:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
}

@end