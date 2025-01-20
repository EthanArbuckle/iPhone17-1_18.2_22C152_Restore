@interface SFAuthenticateAccountsService
- (BOOL)_shouldSignInAccountsInInfoRequest:(id)a3;
- (BOOL)_validateConfiguration;
- (BOOL)homeKitSetupDidSucceed;
- (BOOL)isHomeKitSetupNeeded;
- (BOOL)isHomeSharingSetupNeeded;
- (OS_dispatch_queue)dispatchQueue;
- (SFAuthenticateAccountsService)init;
- (SFAuthenticateAccountsServiceConfiguration)configuration;
- (SFAuthenticateAccountsServiceDelegate)delegate;
- (id)_configurationExistingAccountWithType:(unsigned int)a3;
- (id)progressHandler;
- (int64_t)_nextServiceTypeForTRAccountServices:(id)a3;
- (unint64_t)_nextTRServiceTypeForTRAccountServices:(id)a3;
- (unsigned)_accountTypeForTRAccountService:(unint64_t)a3;
- (unsigned)targetedAccountTypes;
- (void)__runAuthenticateiCloudWithAuthResults:(id)a3 completion:(id)a4;
- (void)_activate;
- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 companionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7;
- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 password:(id)a5 completion:(id)a6;
- (void)_authenticateGameCenterWithAuthResults:(id)a3 completion:(id)a4;
- (void)_authenticateWithServiceType:(unint64_t)a3 authResults:(id)a4 completion:(id)a5;
- (void)_authenticateWithServiceTypes:(id)a3 authResults:(id)a4 completion:(id)a5;
- (void)_authenticateiCloudWithAuthResults:(id)a3 completion:(id)a4;
- (void)_authenticateiTunesWithAuthResults:(id)a3 completion:(id)a4;
- (void)_cleanup;
- (void)_finishSession:(id)a3;
- (void)_handleInfoExchange:(id)a3 responseHandler:(id)a4;
- (void)_handleRequest:(id)a3 flags:(unsigned int)a4 session:(id)a5 responseHandler:(id)a6;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleTRCompanionAuthenticationRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleTRProxyAuthenticationRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleTRProxyDeviceRequest:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_saveAccount:(id)a3 completion:(id)a4;
- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4;
- (void)_sfServiceStart;
- (void)_validateiCloudCredentialsWithRequest:(id)a3 unvalidatedResponse:(id)a4 completionHandler:(id)a5;
- (void)activate;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHomeKitSetupDidSucceed:(BOOL)a3;
- (void)setIsHomeKitSetupNeeded:(BOOL)a3;
- (void)setIsHomeSharingSetupNeeded:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
- (void)setTargetedAccountTypes:(unsigned int)a3;
@end

@implementation SFAuthenticateAccountsService

- (SFAuthenticateAccountsService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFAuthenticateAccountsService;
  v2 = [(SFAuthenticateAccountsService *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SFAuthenticateAccountsServiceConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    uint64_t v5 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)_cleanup
{
  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  accountStore = self->_accountStore;
  self->_accountStore = 0;

  cdpUIProvider = self->_cdpUIProvider;
  self->_cdpUIProvider = 0;

  authenticatedAccounts = self->_authenticatedAccounts;
  self->_authenticatedAccounts = 0;

  knownHomeUserIdentifiers = self->_knownHomeUserIdentifiers;
  self->_knownHomeUserIdentifiers = 0;

  self->_isVoiceProfileAvailable = 0;
  preferredLanguageCode = self->_preferredLanguageCode;
  self->_preferredLanguageCode = 0;

  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = 0;

  preferredLanguages = self->_preferredLanguages;
  self->_preferredLanguages = 0;
}

- (SFAuthenticateAccountsServiceConfiguration)configuration
{
  v2 = (void *)[(SFAuthenticateAccountsServiceConfiguration *)self->_configuration copy];

  return (SFAuthenticateAccountsServiceConfiguration *)v2;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_activateCalled)
  {
    id v9 = v4;
    v6 = (SFAuthenticateAccountsServiceConfiguration *)[v4 copy];
    configuration = self->_configuration;
    self->_configuration = v6;

    goto LABEL_6;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 115)
  {
    id v9 = v4;
    if (gLogCategory_SFAuthenticateAccountsService != -1 || (v8 = _LogCategory_Initialize(), uint64_t v5 = v9, v8))
    {
      LogPrintF();
LABEL_6:
      uint64_t v5 = v9;
    }
  }
}

- (unsigned)targetedAccountTypes
{
  return [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration targetedAccountTypes];
}

- (void)setTargetedAccountTypes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)[(SFAuthenticateAccountsServiceConfiguration *)self->_configuration copy];
  [v5 setTargetedAccountTypes:v3];
  [(SFAuthenticateAccountsService *)self setConfiguration:v5];
}

- (BOOL)isHomeSharingSetupNeeded
{
  return [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration isHomeSharingSetupNeeded];
}

- (void)setIsHomeSharingSetupNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[(SFAuthenticateAccountsServiceConfiguration *)self->_configuration copy];
  [v5 setIsHomeSharingSetupNeeded:v3];
  [(SFAuthenticateAccountsService *)self setConfiguration:v5];
}

- (BOOL)isHomeKitSetupNeeded
{
  return [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration isHomeKitSetupNeeded];
}

- (void)setIsHomeKitSetupNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[(SFAuthenticateAccountsServiceConfiguration *)self->_configuration copy];
  [v5 setIsHomeKitSetupNeeded:v3];
  [(SFAuthenticateAccountsService *)self setConfiguration:v5];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFAuthenticateAccountsService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFAuthenticateAccountsService_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (!self->_activateCalled
    && gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  BOOL v3 = [(Class)getACAccountStoreClass[0]() defaultStore];
  accountStore = self->_accountStore;
  self->_accountStore = v3;

  if ([(SFAuthenticateAccountsService *)self _validateConfiguration])
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    authenticatedAccounts = self->_authenticatedAccounts;
    self->_authenticatedAccounts = v5;

    [(SFAuthenticateAccountsService *)self _sfServiceStart];
  }
}

- (BOOL)_validateConfiguration
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SFAuthenticateAccountsService__validateConfiguration__block_invoke;
  aBlock[3] = &unk_1E5BBC870;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  if ((![(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType]
     || ([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType] & 1) != 0)
    && ![(SFAuthenticateAccountsServiceConfiguration *)self->_configuration targetedAccountTypes])
  {
    if (gLogCategory_SFAuthenticateAccountsService > 90
      || gLogCategory_SFAuthenticateAccountsService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType] & 1) != 0
    || ([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType] & 2) != 0)
  {
    id v4 = [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration existingAccountsIdentifiers];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      if (gLogCategory_SFAuthenticateAccountsService > 90
        || gLogCategory_SFAuthenticateAccountsService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
  }
  if (([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType] & 2) != 0)
  {
    v6 = [(SFAuthenticateAccountsService *)self _configurationExistingAccountWithType:1];
    if (v6)
    {

      goto LABEL_10;
    }
    if (gLogCategory_SFAuthenticateAccountsService > 90
      || gLogCategory_SFAuthenticateAccountsService == -1 && !_LogCategory_Initialize())
    {
LABEL_25:
      v3[2](v3);
      BOOL v7 = 0;
      goto LABEL_26;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_25;
  }
LABEL_10:
  BOOL v7 = 1;
LABEL_26:

  return v7;
}

uint64_t __55__SFAuthenticateAccountsService__validateConfiguration__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[19];
  if (v3)
  {
    v15 = @"eo";
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F28760];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithUTF8String:DebugGetErrorString()];
    BOOL v7 = (void *)v6;
    int v8 = @"?";
    if (v6) {
      int v8 = (__CFString *)v6;
    }
    v14 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v10 = [v4 errorWithDomain:v5 code:-6705 userInfo:v9];
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, 30, v11);

    v2 = *(void **)(a1 + 32);
  }
  return [v2 _invalidate];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFAuthenticateAccountsService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFAuthenticateAccountsService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  if (self->_sfSession) {
    -[SFAuthenticateAccountsService _handleSessionEnded:](self, "_handleSessionEnded:");
  }
  [(SFService *)self->_sfService invalidate];
  sfService = self->_sfService;
  self->_sfService = 0;

  id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 20, 0);
  }

  [(SFAuthenticateAccountsService *)self _cleanup];
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  unsigned int v3 = [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType];
  [(SFService *)self->_sfService invalidate];
  id v4 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v4;

  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setAdvertiseRate:50];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.AuthenticateAccounts"];
  [(SFService *)self->_sfService setLabel:@"AuthenticateAccounts"];
  [(SFService *)self->_sfService setNeedsSetup:1];
  if (v3) {
    uint64_t v6 = 43;
  }
  else {
    uint64_t v6 = 32;
  }
  [(SFService *)self->_sfService setDeviceActionType:v6];
  [(SFService *)self->_sfService setPairSetupACL:&unk_1EFA09A08];
  [(SFService *)self->_sfService setPinType:1];
  [(SFService *)self->_sfService setSessionFlags:1];
  [(SFService *)self->_sfService setTouchRemoteEnabled:1];
  id location = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke;
  v13[3] = &unk_1E5BBDBE8;
  objc_copyWeak(&v14, &location);
  [(SFService *)self->_sfService setSessionStartedHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_2;
  v11[3] = &unk_1E5BBDC10;
  objc_copyWeak(&v12, &location);
  [(SFService *)self->_sfService setSessionEndedHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_3;
  v9[3] = &unk_1E5BBDC38;
  objc_copyWeak(&v10, &location);
  [(SFService *)self->_sfService setReceivedRequestHandler:v9];
  BOOL v7 = self->_sfService;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_4;
  v8[3] = &unk_1E5BBC8E8;
  v8[4] = self;
  [(SFService *)v7 activateWithCompletion:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSessionStarted:v3];
}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSessionEnded:v3];
}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  int v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _handleRequest:v10 flags:a3 session:v11 responseHandler:v9];
}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 152);
  if (v3)
  {
    if (v5)
    {
      BOOL v7 = @"eo";
      v8[0] = v3;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 30, v6);
    }
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 10, 0);
  }
}

- (void)_handleSessionStarted:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      BOOL v7 = [v5 peer];
      v21 = [(SFSession *)*p_sfSession peer];
      LogPrintF();
    }
    goto LABEL_17;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    v20 = [v5 peer];
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_sfSession, a3);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke;
  v25[3] = &unk_1E5BBCBA8;
  v25[4] = self;
  [v5 registerRequestID:@"_info" options:0 handler:v25];
  int v8 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = v8;

  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setDispatchQueue:self->_dispatchQueue];
  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setSfSession:v5];
  if (([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType] & 2) == 0) {
    goto LABEL_14;
  }
  uint64_t v10 = [(SFAuthenticateAccountsService *)self _configurationExistingAccountWithType:1];
  if (v10)
  {
    id v11 = (void *)v10;
    [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setFailIfCDPNotEnabled:1];
    id v12 = objc_msgSend(v11, "aa_altDSID");
    [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setAltDSIDNeedingRepair:v12];

LABEL_14:
    [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler activate];
    uint64_t v13 = [(SFSession *)self->_sfSession trSession];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_2;
    v24[3] = &unk_1E5BBDC60;
    v24[4] = self;
    getTRSetupCompanionAuthenticationRequestClass[0]();
    [v13 setRequestHandler:v24 forRequestClass:objc_opt_class()];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_3;
    v23[3] = &unk_1E5BBDC60;
    v23[4] = self;
    getTRSetupProxyDeviceRequestClass[0]();
    [v13 setRequestHandler:v23 forRequestClass:objc_opt_class()];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_4;
    v22[3] = &unk_1E5BBDC60;
    v22[4] = self;
    getTRSetupProxyAuthenticationRequestClass[0]();
    [v13 setRequestHandler:v22 forRequestClass:objc_opt_class()];
    id v14 = (HMDeviceSetupOperationHandler *)objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass[0]());
    homeKitSetupHandler = self->_homeKitSetupHandler;
    self->_homeKitSetupHandler = v14;

    [(HMDeviceSetupOperationHandler *)self->_homeKitSetupHandler registerMessageHandlersForSession:v13];
    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 31, 0);
    }
    [(SFService *)self->_sfService setNeedsSetup:0];

    goto LABEL_17;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 115
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v17 = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (v17)
  {
    v26 = @"eo";
    v18 = NSErrorWithOSStatusF();
    v27[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v17[2](v17, 30, v19);
  }
  [(SFAuthenticateAccountsService *)self _invalidate];
LABEL_17:
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInfoExchange:responseHandler:");
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleTRCompanionAuthenticationRequest:a2 responseHandler:a3];
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleTRProxyDeviceRequest:a2 responseHandler:a3];
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleTRProxyAuthenticationRequest:a2 responseHandler:a3];
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  id v5 = sfSession;
  if (self->_sfSession != sfSession) {
    goto LABEL_9;
  }
  id v11 = sfSession;
  if (sfSession && gLogCategory_SFAuthenticateAccountsService <= 30)
  {
    if (gLogCategory_SFAuthenticateAccountsService != -1)
    {
LABEL_5:
      uint64_t v10 = [(SFSession *)sfSession peer];
      LogPrintF();

      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      sfSession = self->_sfSession;
      goto LABEL_5;
    }
  }
LABEL_7:
  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler invalidate];
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  [(SFAuthenticateAccountsService *)self _finishSession:v11];
  int v8 = self->_sfSession;
  self->_sfSession = 0;

  [(SFService *)self->_sfService setNeedsSetup:1];
  id v5 = v11;
  id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 32, 0);
    id v5 = v11;
  }
LABEL_9:
}

- (void)_handleInfoExchange:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    id v40 = v6;
    LogPrintF();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", @"lang", v40);
  int v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredLanguageCode = self->_preferredLanguageCode;
  self->_preferredLanguageCode = v8;

  uint64_t v10 = [v6 objectForKeyedSubscript:@"locale"];
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v10;

  id v12 = [v6 objectForKeyedSubscript:@"langs"];
  preferredLanguages = self->_preferredLanguages;
  self->_preferredLanguages = v12;

  id v14 = [v6 objectForKeyedSubscript:@"kbs"];
  keyboards = self->_keyboards;
  self->_keyboards = v14;

  BOOL v16 = [(SFAuthenticateAccountsService *)self _shouldSignInAccountsInInfoRequest:v6];
  v17 = [v6 objectForKeyedSubscript:@"hkcuis"];
  if ([v17 count])
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19 = [v6 objectForKeyedSubscript:@"hkhrmve"];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke;
    v43[3] = &unk_1E5BBDC88;
    id v44 = v19;
    id v45 = v18;
    id v20 = v18;
    id v21 = v19;
    [v17 enumerateKeysAndObjectsUsingBlock:v43];
    v22 = (NSArray *)[v20 copy];
    knownHomeUserIdentifiers = self->_knownHomeUserIdentifiers;
    self->_knownHomeUserIdentifiers = v22;
  }
  v24 = [v6 objectForKeyedSubscript:@"siriVP"];
  self->_isVoiceProfileAvailable = [v24 BOOLValue];

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType"));
  [v25 setObject:v26 forKeyedSubscript:@"aaServiceType"];

  if (v16) {
    uint64_t v27 = [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration targetedAccountTypes];
  }
  else {
    uint64_t v27 = 0;
  }
  v28 = [NSNumber numberWithUnsignedInt:v27];
  [v25 setObject:v28 forKeyedSubscript:@"aaTargetedTypes"];

  v29 = [NSNumber numberWithUnsignedLongLong:16];
  [v25 setObject:v29 forKeyedSubscript:@"ff"];

  if ([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration isHomeKitSetupNeeded]) {
    uint64_t v30 = 8;
  }
  else {
    uint64_t v30 = 0;
  }
  unsigned int v31 = [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType];
  v32 = [NSNumber numberWithUnsignedLongLong:v30 | (v31 << 16) & 0x20000];
  [v25 setObject:v32 forKeyedSubscript:@"dpf"];

  v33 = [(SFAuthenticateAccountsService *)self _configurationExistingAccountWithType:1];
  v34 = objc_msgSend(v33, "aa_altDSID");

  [v25 setObject:v34 forKeyedSubscript:@"aaiCloudAltDSID"];
  v35 = [(SFAuthenticateAccountsService *)self _configurationExistingAccountWithType:2];
  v36 = objc_msgSend(v35, "aa_altDSID");

  [v25 setObject:v36 forKeyedSubscript:@"aaiTunesAltDSID"];
  v37 = [(SFAuthenticateAccountsService *)self _configurationExistingAccountWithType:3];
  v38 = objc_msgSend(v37, "aa_altDSID");

  [v25 setObject:v38 forKeyedSubscript:@"aaGameCenterAltDSID"];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke_2;
  v41[3] = &unk_1E5BBDCB0;
  id v42 = v7;
  id v39 = v7;
  [(SFAuthenticateAccountsService *)self _validateiCloudCredentialsWithRequest:v6 unvalidatedResponse:v25 completionHandler:v41];
}

void __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  int v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    uint64_t v11 = [v10 BOOLValue];

    id v12 = [[SFAuthenticateAccountHomeUserInfo alloc] initWithHomeUUID:v6 userUUID:v8 isRMVEnabled:v11];
    [*(id *)(a1 + 40) addObject:v12];
  }
}

void __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)_shouldSignInAccountsInInfoRequest:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v8 = [v4 objectForKeyedSubscript:@"aaiCloudAltDSID"];
    if (v8)
    {
      BOOL v9 = [[SFAuthenticateAccountInfo alloc] initWithType:1 altDSID:v8];
      [v7 addObject:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"aaiTunesAltDSID"];
    if (v10)
    {
      uint64_t v11 = [[SFAuthenticateAccountInfo alloc] initWithType:2 altDSID:v10];
      [v7 addObject:v11];
    }
    id v12 = [v4 objectForKeyedSubscript:@"aaGameCenterAltDSID"];
    if (v12)
    {
      id v13 = [[SFAuthenticateAccountInfo alloc] initWithType:3 altDSID:v12];
      [v7 addObject:v13];
    }
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = (void *)[v7 copy];
    char v16 = [v14 authenticateAccountsService:self shouldSignInAccounts:v15];

    if ((v16 & 1) == 0
      && gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (void)_validateiCloudCredentialsWithRequest:(id)a3 unvalidatedResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration serviceType])
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"aaiCloudAltDSID"];
    id v12 = [(SFAuthenticateAccountsService *)self _configurationExistingAccountWithType:1];
    id v13 = objc_msgSend(v12, "aa_altDSID");
    if (v12 && self->_accountStore && [v11 isEqualToString:v13])
    {
      id v14 = self->_dispatchQueue;
      accountStore = self->_accountStore;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke;
      v17[3] = &unk_1E5BBDCD8;
      id v18 = v9;
      v19 = v14;
      id v20 = v10;
      char v16 = v14;
      [(ACAccountStore *)accountStore verifyCredentialsForAccount:v12 withHandler:v17];
    }
    else
    {
      (*((void (**)(id, id))v10 + 2))(v10, v9);
    }
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }
}

void __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 50
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v10 = CFDictionaryGetInt64Ranged() | 1;
    uint64_t v11 = (void *)[*(id *)(a1 + 32) mutableCopy];
    id v12 = [NSNumber numberWithUnsignedInt:v10];
    [v11 setObject:v12 forKeyedSubscript:@"aaTargetedTypes"];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5BBC9C8;
    id v13 = *(NSObject **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v19 = v11;
    id v20 = v14;
    id v9 = v11;
    dispatch_async(v13, v18);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_3;
    block[3] = &unk_1E5BBC9C8;
    id v8 = *(NSObject **)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

    id v9 = v17;
  }
}

uint64_t __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleTRCompanionAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 account];
  if (v8)
  {
    id v9 = [v6 targetedAccountServices];
    if (v9)
    {
      uint64_t v10 = [v6 companionDevice];
      if (v10)
      {
        if (gLogCategory_SFAuthenticateAccountsService <= 30
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          id v12 = [v8 username];
          LogPrintF();
        }
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke;
        v13[3] = &unk_1E5BBDD28;
        id v17 = v7;
        void v13[4] = self;
        id v14 = v9;
        id v15 = v8;
        id v16 = v10;
        [(SFAuthenticateAccountsService *)self _saveRemoteVerifiedAccount:v15 completion:v13];
      }
      else
      {
        uint64_t v11 = NSErrorWithOSStatusF();
        if (gLogCategory_SFAuthenticateAccountsService <= 90
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(id, void *, void))v7 + 2))(v7, v11, 0);
      }
    }
    else
    {
      uint64_t v10 = NSErrorWithOSStatusF();
      if (gLogCategory_SFAuthenticateAccountsService <= 90
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, void))v7 + 2))(v7, v10, 0);
    }
  }
  else
  {
    id v9 = NSErrorWithOSStatusF();
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

void __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      id v12 = v3;
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_nextServiceTypeForTRAccountServices:", *(void *)(a1 + 40), v12);
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = objc_alloc((Class)getTRAnisetteDataProviderClass[0]());
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) trSession];
  id v7 = (void *)[v5 initWithSession:v6];

  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2;
  v13[3] = &unk_1E5BBDD00;
  uint64_t v17 = v4;
  uint64_t v10 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v11;
  [v10 _authenticateAccount:v8 serviceType:v4 companionDevice:v9 anisetteDataProvider:v7 completion:v13];
}

void __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v7 || v6)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v10 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass[0]());
    [v10 setUnauthenticatedAccountServices:*(void *)(a1 + 32)];
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3;
    v11[3] = &unk_1E5BBCD68;
    id v12 = *(id *)(a1 + 48);
    [v8 _authenticateWithServiceTypes:v9 authResults:v7 completion:v11];
  }
}

void __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass[0]());
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [v3 setUnauthenticatedAccountServices:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_handleTRProxyDeviceRequest:(id)a3 responseHandler:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void, id))a4;
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = [(Class)getAKDeviceClass[0]() currentDevice];
  [v6 setLinkType:3];
  id v7 = objc_alloc_init((Class)getTRSetupProxyDeviceResponseClass[0]());
  [v7 setProxyDevice:v6];
  v5[2](v5, 0, v7);
}

- (void)_handleTRProxyAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 account];
  if (v8)
  {
    uint64_t v9 = [v6 rawPassword];
    if (v9)
    {
      id v10 = [v6 targetedAccountServices];
      if (v10)
      {
        if (gLogCategory_SFAuthenticateAccountsService <= 30
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          [v8 username];
          id v13 = v12 = v10;
          LogPrintF();
        }
        objc_msgSend(v8, "_aa_setRawPassword:", v9, v12, v13);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke;
        v14[3] = &unk_1E5BBDD28;
        id v18 = v7;
        v14[4] = self;
        id v15 = v10;
        id v16 = v8;
        id v17 = v9;
        [(SFAuthenticateAccountsService *)self _saveRemoteVerifiedAccount:v16 completion:v14];
      }
      else
      {
        id v11 = NSErrorWithOSStatusF();
        if (gLogCategory_SFAuthenticateAccountsService <= 90
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(id, void *, void))v7 + 2))(v7, v11, 0);
      }
    }
    else
    {
      id v10 = NSErrorWithOSStatusF();
      if (gLogCategory_SFAuthenticateAccountsService <= 90
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, void))v7 + 2))(v7, v10, 0);
    }
  }
  else
  {
    uint64_t v9 = NSErrorWithOSStatusF();
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

void __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      id v11 = v3;
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_nextServiceTypeForTRAccountServices:", *(void *)(a1 + 40), v11);
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2;
  v12[3] = &unk_1E5BBDD50;
  uint64_t v15 = v4;
  id v8 = *(id *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v14 = v8;
  v12[4] = v9;
  id v13 = v10;
  [v5 _authenticateAccount:v6 serviceType:v4 password:v7 completion:v12];
}

void __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v7 || v6)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v10 = *(void *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v6, 0);
    }
    else
    {
      id v11 = NSErrorWithOSStatusF();
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3;
    v12[3] = &unk_1E5BBCD68;
    id v13 = *(id *)(a1 + 48);
    [v8 _authenticateWithServiceTypes:v9 authResults:v7 completion:v12];
  }
}

void __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass[0]());
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [v3 setUnauthenticatedAccountServices:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 companionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7
{
  id v11 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass[0];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v18 = objc_alloc_init(v11());
  [v18 _setProxyingForApp:1];
  [v18 setAnisetteDataProvider:v13];

  [v18 setAuthenticationType:1];
  [v18 setCompanionDevice:v14];

  [v18 setIsUsernameEditable:0];
  [v18 setServiceType:a4];
  [v18 setShouldAllowAppleIDCreation:0];
  [v18 setShouldUpdatePersistentServiceTokens:1];
  id v16 = [v15 username];

  [v18 setUsername:v16];
  id v17 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass[0]());
  [v17 authenticateWithContext:v18 completion:v12];
}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 password:(id)a5 completion:(id)a6
{
  uint64_t v9 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass[0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v15 = objc_alloc_init(v9());
  [v15 _setProxyingForApp:1];
  [v15 _setPassword:v11];

  [v15 setAuthenticationType:1];
  [v15 setIsUsernameEditable:0];
  [v15 setServiceType:a4];
  [v15 setShouldAllowAppleIDCreation:0];
  [v15 setShouldUpdatePersistentServiceTokens:1];
  id v13 = [v12 username];

  [v15 setUsername:v13];
  id v14 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass[0]());
  [v14 authenticateWithContext:v15 completion:v10];
}

- (void)__runAuthenticateiCloudWithAuthResults:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 setWithObject:&unk_1EFA094B8];
  [(SFAuthenticateAccountsService *)self _authenticateWithServiceTypes:v9 authResults:v8 completion:v7];
}

- (void)_authenticateWithServiceTypes:(id)a3 authResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 801, 0);
    }
    unint64_t v12 = [(SFAuthenticateAccountsService *)self _nextTRServiceTypeForTRAccountServices:v8];
    uint64_t v13 = [(SFAuthenticateAccountsService *)self _accountTypeForTRAccountService:v12];
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 authenticateAccountsService:self willAttemptSignInWithAccountType:v13];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke;
    v17[3] = &unk_1E5BBDD78;
    int v22 = v13;
    void v17[4] = self;
    unint64_t v21 = v12;
    id v20 = v10;
    id v18 = v9;
    id v19 = v8;
    [(SFAuthenticateAccountsService *)self _authenticateWithServiceType:v12 authResults:v18 completion:v17];
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 152);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 802, 0);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v4 + 136));
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    [v8 authenticateAccountsService:*(void *)(a1 + 32) didAttemptSignInWithAccountType:*(unsigned int *)(a1 + 72)];
  }
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    id v9 = [v3 domain];
    id v10 = getSSServerErrorDomain[0]();
    if ([v9 isEqual:v10])
    {
      uint64_t v11 = [v3 code];

      if (v11 == 5304)
      {
        if (gLogCategory_SFAuthenticateAccountsService <= 50
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v3) {
          goto LABEL_25;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  if (!v3)
  {
LABEL_20:
    unint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = getAKAuthenticationAlternateDSIDKey[0]();
    id v14 = [v12 objectForKeyedSubscript:v13];

    char v15 = [[SFAuthenticateAccountInfo alloc] initWithType:*(unsigned int *)(a1 + 72) altDSID:v14];
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:v15];
    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
      [v18 authenticateAccountsService:*(void *)(a1 + 32) didAuthenticateWithAccountInfo:v15];
    }
    if (*(_DWORD *)(a1 + 72) == 1)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = *(NSObject **)(v19 + 144);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke_2;
      block[3] = &unk_1E5BBBD18;
      void block[4] = v19;
      id v24 = v14;
      dispatch_async(v20, block);
    }
LABEL_25:
    unint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 48)];
    int v22 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v21 removeObject:v22];

    [*(id *)(a1 + 32) _authenticateWithServiceTypes:v21 authResults:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
    goto LABEL_26;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 90
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3);
LABEL_26:
}

void __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _configurationExistingAccountWithType:1];

  if (!v2)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 50
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72);
    [v4 setAltDSIDNeedingRepair:v3];
  }
}

- (void)_authenticateWithServiceType:(unint64_t)a3 authResults:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v8 = (void (**)(id, void *))a5;
  switch(a3)
  {
    case 3uLL:
      [(SFAuthenticateAccountsService *)self _authenticateGameCenterWithAuthResults:v10 completion:v8];
      break;
    case 2uLL:
      [(SFAuthenticateAccountsService *)self _authenticateiTunesWithAuthResults:v10 completion:v8];
      break;
    case 1uLL:
      [(SFAuthenticateAccountsService *)self _authenticateiCloudWithAuthResults:v10 completion:v8];
      break;
    default:
      id v9 = NSErrorWithOSStatusF();
      v8[2](v8, v9);

      break;
  }
}

- (void)_authenticateiCloudWithAuthResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getAKAuthenticationUsernameKey[0]();
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_accountStore)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4D938]) initWithAccountStore:self->_accountStore];
    id v10 = objc_alloc_init(MEMORY[0x1E4F4D928]);
    [v10 setAuthenticationResults:v6];
    [v10 setCdpUiProvider:self->_cdpUIProvider];
    uint64_t v11 = *MEMORY[0x1E4F4D8E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke;
    v13[3] = &unk_1E5BBDDC8;
    id v14 = v8;
    char v15 = self;
    id v16 = v7;
    [v9 signInService:v11 withContext:v10 completion:v13];
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unint64_t v12 = NSErrorWithOSStatusF();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
    goto LABEL_22;
  }
  id v7 = [v5 domain];
  id v8 = getAASignInErrorDomain[0]();
  if ([v7 isEqualToString:v8])
  {
    uint64_t v9 = [v6 code];

    if (v9 == -8010)
    {
      if (gLogCategory_SFAuthenticateAccountsService <= 50
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      unint64_t v12 = *(void **)(*(void *)(a1 + 40) + 24);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke_2;
      v13[3] = &unk_1E5BBDDA0;
      id v14 = *(id *)(a1 + 32);
      id v15 = *(id *)(a1 + 48);
      [v12 sendRequestID:@"_aaTerms" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v13];

      goto LABEL_22;
    }
  }
  else
  {
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 90
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }
  else
  {
    uint64_t v11 = NSErrorWithOSStatusF();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
LABEL_22:
}

void __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v9)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9);
  }
}

- (void)_authenticateiTunesWithAuthResults:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void (__cdecl *)())getAKAuthenticationUsernameKey[0];
  id v8 = a3;
  v7();
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  getAKAuthenticationAlternateDSIDKey[0]();
  CFStringGetTypeID();
  uint64_t v10 = CFDictionaryGetTypedValue();
  getAKAuthenticationPasswordKey[0]();
  CFStringGetTypeID();
  uint64_t v11 = CFDictionaryGetTypedValue();

  [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration isHomeSharingSetupNeeded];
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  unint64_t v12 = [(Class)getSSMutableAuthenticationContextClass[0]() contextForSignIn];
  [v12 setAccountName:v9];
  [v12 setAllowsRetry:0];
  [v12 setAltDSID:v10];
  [v12 setCanSetActiveAccount:0];
  [v12 setPasswordEquivalentToken:v11];
  [v12 setPromptStyle:1];
  [v12 setShouldSuppressDialogs:0];
  uint64_t v13 = [(Class)getSSAccountStoreClass[0]() defaultStore];
  id v14 = (void *)[objc_alloc((Class)getSSAuthenticateRequestClass[0]()) initWithAuthenticationContext:v12];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__SFAuthenticateAccountsService__authenticateiTunesWithAuthResults_completion___block_invoke;
  v18[3] = &unk_1E5BBDDF0;
  id v20 = v13;
  id v21 = v6;
  id v19 = v9;
  id v15 = v13;
  id v16 = v6;
  id v17 = v9;
  [v14 startWithAuthenticateResponseBlock:v18];
}

void __79__SFAuthenticateAccountsService__authenticateiTunesWithAuthResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = [a2 authenticatedAccount];
  if (v5)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      id v8 = v5;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "saveAccount:error:", v5, 0, v8);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v9)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else
    {
      id v7 = NSErrorWithOSStatusF();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
}

- (void)_authenticateGameCenterWithAuthResults:(id)a3 completion:(id)a4
{
  id v5 = a4;
  NSErrorWithOSStatusF();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (int64_t)_nextServiceTypeForTRAccountServices:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_1EFA094B8])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsObject:&unk_1EFA094D0])
  {
    int64_t v4 = 2;
  }
  else if ([v3 containsObject:&unk_1EFA094E8])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_nextTRServiceTypeForTRAccountServices:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_1EFA094B8])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 containsObject:&unk_1EFA094D0])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 containsObject:&unk_1EFA094E8])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)_accountTypeForTRAccountService:(unint64_t)a3
{
  if (a3 - 1 < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 setAuthenticated:0];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend(v6, "aa_isPrimaryEmailVerified"))
  {
    int v22 = self;
    id v23 = v7;
    id v24 = v6;
    id v9 = [(ACAccountStore *)self->_accountStore dataclassActionsForAccountSave:v6];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v14 = [v9 objectForKeyedSubscript:v13];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v29 != v17) {
                  objc_enumerationMutation(v14);
                }
                id v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                if ([v19 type]) {
                  [v8 setObject:v19 forKeyedSubscript:v13];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v16);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v11);
    }

    id v7 = v23;
    id v6 = v24;
    self = v22;
  }
  accountStore = self->_accountStore;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__SFAuthenticateAccountsService__saveAccount_completion___block_invoke;
  v26[3] = &unk_1E5BBDE18;
  id v27 = v7;
  id v21 = v7;
  [(ACAccountStore *)accountStore saveAccount:v6 withDataclassActions:v8 completion:v26];
}

void __57__SFAuthenticateAccountsService__saveAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5 || (a2 & 1) == 0)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    }
    else
    {
      id v7 = NSErrorWithOSStatusF();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v9 = [(Class)getACAccountStoreClass[0]() defaultStore];
    uint64_t v10 = self->_accountStore;
    self->_accountStore = v9;

    accountStore = self->_accountStore;
  }
  uint64_t v11 = [v6 accountType];
  unint64_t v12 = [v11 identifier];
  uint64_t v13 = [(ACAccountStore *)accountStore accountTypeWithAccountTypeIdentifier:v12];

  [v6 setAccountType:v13];
  [v6 _setObjectID:0];
  [v6 markAllPropertiesDirty];
  id v14 = self->_accountStore;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __71__SFAuthenticateAccountsService__saveRemoteVerifiedAccount_completion___block_invoke;
  v16[3] = &unk_1E5BBDE18;
  id v17 = v7;
  id v15 = v7;
  [(ACAccountStore *)v14 saveVerifiedAccount:v6 withCompletionHandler:v16];
}

void __71__SFAuthenticateAccountsService__saveRemoteVerifiedAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v7 = v5;
  if ([v5 code] == 5)
  {
    id v5 = v7;
LABEL_6:

LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v6 = NSErrorWithOSStatusF();
  }
LABEL_8:
  id v8 = (id)v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleRequest:(id)a3 flags:(unsigned int)a4 session:(id)a5 responseHandler:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 9)
  {
    if (v8)
    {
      if (gLogCategory_SFAuthenticateAccountsService <= 30
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if ([(SFAuthenticateAccountsServiceConfiguration *)self->_configuration isHomeKitSetupNeeded])
      {
        self->_homeKitSetupDidSucceed = CFDictionaryGetInt64() != 0;
      }
      (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, v8, 0, MEMORY[0x1E4F1CC08]);
      [(SFAuthenticateAccountsService *)self _finishSession:v11];
      goto LABEL_18;
    }
    int v14 = -6768;
    if (gLogCategory_SFAuthenticateAccountsService <= 60)
    {
      if (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int v14 = -6768;
    }
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      uint64_t v23 = Int64Ranged;
      uint64_t v24 = 0;
      LogPrintF();
    }
    int v14 = -6732;
  }
  id v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F28760];
  uint64_t v17 = v14;
  uint64_t v25 = *MEMORY[0x1E4F28568];
  uint64_t v18 = [NSString stringWithUTF8String:DebugGetErrorString()];
  id v19 = (void *)v18;
  id v20 = @"?";
  if (v18) {
    id v20 = (__CFString *)v18;
  }
  v26[0] = v20;
  id v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v23, v24);
  int v22 = [v15 errorWithDomain:v16 code:v17 userInfo:v21];
  (*((void (**)(id, uint64_t, void *, void))v12 + 2))(v12, v8, v22, 0);

LABEL_18:
}

- (id)_configurationExistingAccountWithType:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a3 - 1 > 2)
  {
    id v11 = 0;
  }
  else
  {
    id v5 = **((id **)&unk_1E5BBDE80 + (int)(a3 - 1));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [(SFAuthenticateAccountsServiceConfiguration *)self->_configuration existingAccountsIdentifiers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(ACAccountStore *)self->_accountStore accountWithIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * v10)];
        id v12 = [v11 accountType];
        uint64_t v13 = [v12 identifier];
        char v14 = [v13 isEqual:v5];

        if (v14) {
          break;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      id v11 = 0;
    }
  }

  return v11;
}

- (void)_finishSession:(id)a3
{
  id object = a3;
  unint64_t v4 = objc_getAssociatedObject(object, "finished");
  if (([v4 BOOLValue] & 1) == 0)
  {
    if ([(NSMutableArray *)self->_authenticatedAccounts count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = [SFAuthenticateAccountResult alloc];
        uint64_t v8 = (void *)[(NSMutableArray *)self->_authenticatedAccounts copy];
        uint64_t v9 = [(SFAuthenticateAccountResult *)v7 initWithAuthenticatedAccounts:v8 knownHomeUserIdentifiers:self->_knownHomeUserIdentifiers isVoiceProfileAvailable:self->_isVoiceProfileAvailable];

        [(SFAuthenticateAccountResult *)v9 setPreferredLanguageCode:self->_preferredLanguageCode];
        [(SFAuthenticateAccountResult *)v9 setLocaleIdentifier:self->_localeIdentifier];
        [(SFAuthenticateAccountResult *)v9 setPreferredLanguages:self->_preferredLanguages];
        [(SFAuthenticateAccountResult *)v9 setKeyboards:self->_keyboards];
        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        [v10 authenticateAccountsService:self didFinishAuthentication:v9];
      }
    }
    objc_setAssociatedObject(object, "finished", MEMORY[0x1E4F1CC38], (void *)0x301);
    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 100, 0);
    }
  }
}

- (SFAuthenticateAccountsServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAuthenticateAccountsServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (BOOL)homeKitSetupDidSucceed
{
  return self->_homeKitSetupDidSucceed;
}

- (void)setHomeKitSetupDidSucceed:(BOOL)a3
{
  self->_homeKitSetupDidSucceed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredLanguageCode, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_knownHomeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_authenticatedAccounts, 0);
  objc_storeStrong((id *)&self->_cdpUIProvider, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);

  objc_storeStrong((id *)&self->_sfService, 0);
}

@end