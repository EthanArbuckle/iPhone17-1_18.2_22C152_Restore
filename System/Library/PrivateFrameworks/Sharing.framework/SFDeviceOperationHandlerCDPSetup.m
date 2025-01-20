@interface SFDeviceOperationHandlerCDPSetup
- (BOOL)failIfCDPNotEnabled;
- (NSString)altDSIDNeedingRepair;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceOperationHandlerCDPSetup)init;
- (SFSession)sfSession;
- (void)_activate;
- (void)_handleCDP;
- (void)_handleCDPSetupRequest:(id)a3 responseHandler:(id)a4;
- (void)_repairCDP;
- (void)activate;
- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4;
- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7;
- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6;
- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5;
- (void)invalidate;
- (void)setAltDSIDNeedingRepair:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFailIfCDPNotEnabled:(BOOL)a3;
- (void)setSfSession:(id)a3;
@end

@implementation SFDeviceOperationHandlerCDPSetup

- (SFDeviceOperationHandlerCDPSetup)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFDeviceOperationHandlerCDPSetup;
  v2 = [(SFDeviceOperationHandlerCDPSetup *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFDeviceOperationHandlerCDPSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__SFDeviceOperationHandlerCDPSetup_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  if (sfSession)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__SFDeviceOperationHandlerCDPSetup__activate__block_invoke;
    v4[3] = &unk_1E5BBCBA8;
    v4[4] = self;
    [(SFSession *)sfSession registerRequestID:@"_cdpSetup" options:0 handler:v4];
  }
  else if (gLogCategory_SFDeviceOperationCDPSetup <= 90 {
         && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __45__SFDeviceOperationHandlerCDPSetup__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCDPSetupRequest:responseHandler:");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCDPSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __46__SFDeviceOperationHandlerCDPSetup_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  id v11 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 32));
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;

  if (v11)
  {
    objc_super v8 = NSErrorWithOSStatusF();
    (*((void (**)(id, void *, void, void))v11 + 2))(v11, v8, 0, 0);
  }
  [*(id *)(*(void *)(a1 + 32) + 64) deregisterRequestID:@"_cdpSetup"];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 64);
  *(void *)(v9 + 64) = 0;
}

- (void)_handleCDPSetupRequest:(id)a3 responseHandler:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (self->_responseHandler)
  {
    v7 = NSErrorWithOSStatusF();
    if (gLogCategory_SFDeviceOperationCDPSetup <= 90
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, v7, 0, 0);
  }
  else
  {
    v7 = [(SFSession *)self->_sfSession messageSessionTemplate];
    if (!v7) {
      goto LABEL_19;
    }
    if (gLogCategory_SFDeviceOperationCDPSetup <= 30
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    altDSIDNeedingRepair = self->_altDSIDNeedingRepair;
    Class v9 = (Class)getCDPContextClass[0]();
    if (altDSIDNeedingRepair) {
      [(objc_class *)v9 contextForAccountWithAltDSID:self->_altDSIDNeedingRepair];
    }
    else {
    v10 = [(objc_class *)v9 contextForPrimaryAccount];
    }
    cdpContext = self->_cdpContext;
    self->_cdpContext = v10;

    v12 = self->_cdpContext;
    if (v12)
    {
      [(CDPContext *)v12 setSharingChannel:v7];
      v13 = (CDPStateController *)[objc_alloc((Class)getCDPStateControllerClass[0]()) initWithContext:self->_cdpContext];
      cdpController = self->_cdpController;
      self->_cdpController = v13;

      [(CDPStateController *)self->_cdpController setUiProvider:self];
      v15 = _Block_copy(v6);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = v15;

      if (CFDictionaryGetInt64()) {
        [(SFDeviceOperationHandlerCDPSetup *)self _repairCDP];
      }
      else {
        [(SFDeviceOperationHandlerCDPSetup *)self _handleCDP];
      }
    }
    else
    {
LABEL_19:
      v17 = NSErrorWithOSStatusF();
      if (gLogCategory_SFDeviceOperationCDPSetup <= 90
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, void, void))v6 + 2))(v6, v17, 0, 0);
    }
  }
}

- (void)_handleCDP
{
  cdpController = self->_cdpController;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke;
  v3[3] = &unk_1E5BC0178;
  v3[4] = self;
  [(CDPStateController *)cdpController handleCloudDataProtectionStateWithCompletion:v3];
}

void __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  Class v9 = *(NSObject **)(v8 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke_2;
  block[3] = &unk_1E5BC0150;
  block[4] = v8;
  id v12 = v7;
  char v13 = a3;
  char v14 = a2;
  id v10 = v7;
  dispatch_async(v9, block);
}

void __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke_2(uint64_t a1)
{
  Class v9 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4 || *(unsigned char *)(*(void *)(a1 + 32) + 40) && !*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_SFDeviceOperationCDPSetup <= 90)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup != -1
        || (v5 = _LogCategory_Initialize(), uint64_t v4 = *(void **)(a1 + 40), v5))
      {
        LogPrintF();
        uint64_t v4 = *(void **)(a1 + 40);
      }
    }
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      SFErrorF();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;
    if (v9) {
      (*((void (**)(void *, id, void, void))v9 + 2))(v9, v6, 0, 0);
    }

    goto LABEL_17;
  }
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(void *, void, void, void))v9 + 2))(v9, 0, 0, MEMORY[0x1E4F1CC08]);
LABEL_17:
    uint64_t v8 = v9;
  }
}

- (void)_repairCDP
{
  cdpController = self->_cdpController;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke;
  v3[3] = &unk_1E5BBD7E8;
  v3[4] = self;
  [(CDPStateController *)cdpController repairCloudDataProtectionStateWithCompletion:v3];
}

void __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke_2;
  block[3] = &unk_1E5BC0128;
  block[4] = v6;
  id v10 = v5;
  char v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke_2(uint64_t a1)
{
  Class v9 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4 || *(unsigned char *)(*(void *)(a1 + 32) + 40) && !*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_SFDeviceOperationCDPSetup <= 90)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup != -1
        || (v5 = _LogCategory_Initialize(), uint64_t v4 = *(void **)(a1 + 40), v5))
      {
        LogPrintF();
        uint64_t v4 = *(void **)(a1 + 40);
      }
    }
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      SFErrorF();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;
    if (v9) {
      (*((void (**)(void *, id, void, void))v9 + 2))(v9, v6, 0, 0);
    }

    goto LABEL_17;
  }
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = v9;
  if (v9)
  {
    (*((void (**)(void *, void, void, void))v9 + 2))(v9, 0, 0, MEMORY[0x1E4F1CC08]);
LABEL_17:
    id v8 = v9;
  }
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  int v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 errorWithDomain:@"com.apple.sharing.operation.cdp" code:-8000 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v12 = a3;
  id v9 = a5;
  id v10 = a7;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  char v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sharing.operation.cdp" code:-8001 userInfo:0];
  [v10 cancelValidationWithError:v11];
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  id v7 = a3;
  int v5 = (void (**)(id, void, void *))a4;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sharing.operation.cdp" code:-8002 userInfo:0];
  v5[2](v5, 0, v6);
}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  id v7 = a3;
  int v5 = (void (**)(id, void, void *))a4;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sharing.operation.cdp" code:-8003 userInfo:0];
  v5[2](v5, 0, v6);
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a6;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sharing.operation.cdp" code:-8004 userInfo:0];
  [v9 cancelValidationWithError:v10];
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 context];
  uint64_t v11 = [v10 hasPeersForRemoteApproval];

  [(SFDeviceOperationHandlerCDPSetup *)self cdpContext:v12 promptForRemoteSecretWithDevices:v9 offeringRemoteApproval:v11 validator:v8];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)failIfCDPNotEnabled
{
  return self->_failIfCDPNotEnabled;
}

- (void)setFailIfCDPNotEnabled:(BOOL)a3
{
  self->_failIfCDPNotEnabled = a3;
}

- (NSString)altDSIDNeedingRepair
{
  return self->_altDSIDNeedingRepair;
}

- (void)setAltDSIDNeedingRepair:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_altDSIDNeedingRepair, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_cdpController, 0);

  objc_storeStrong((id *)&self->_cdpContext, 0);
}

@end