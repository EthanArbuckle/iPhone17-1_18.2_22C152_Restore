@interface SFTouchRemoteAccountServicesHandler
- (ACAccountStore)accountStore;
- (BOOL)activateWithSession:(id)a3 error:(id *)a4;
- (BSAtomicSignal)activated;
- (BSAtomicSignal)invalidated;
- (SFTouchRemoteAccountServicesHandler)initWithConfiguration:(id)a3;
- (SFTouchRemoteAccountServicesHandlerConfiguration)configuration;
- (TRSession)trSession;
- (int64_t)_nextServiceTypeForTRAccountServices:(id)a3;
- (int64_t)appleAccountSignInState;
- (unint64_t)_nextTRServiceTypeForTRAccountServices:(id)a3;
- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 companionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7;
- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 rawPassword:(id)a5 completion:(id)a6;
- (void)_authenticateGameCenterWithAuthResults:(id)a3 completion:(id)a4;
- (void)_authenticateWithServiceType:(unint64_t)a3 authResults:(id)a4 completion:(id)a5;
- (void)_authenticateWithServiceTypes:(id)a3 authResults:(id)a4 completion:(id)a5;
- (void)_authenticateiCloudWithAuthResults:(id)a3 completion:(id)a4;
- (void)_authenticateiTunesWithAuthResults:(id)a3 completion:(id)a4;
- (void)_handleTRCompanionAuthenticationRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleTRProxyAuthenticationRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleTRProxyDeviceRequest:(id)a3 responseHandler:(id)a4;
- (void)_saveNewAccount:(id)a3 completion:(id)a4;
- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setAccountStore:(id)a3;
- (void)setActivated:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setInvalidated:(id)a3;
- (void)setTrSession:(id)a3;
@end

@implementation SFTouchRemoteAccountServicesHandler

- (SFTouchRemoteAccountServicesHandler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFTouchRemoteAccountServicesHandler;
  v5 = [(SFTouchRemoteAccountServicesHandler *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SFTouchRemoteAccountServicesHandlerConfiguration *)v6;

    uint64_t v8 = [(Class)getACAccountStoreClass_1[0]() defaultStore];
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v8;

    v5->_appleAccountSignInState = 0;
  }

  return v5;
}

- (BOOL)activateWithSession:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (![(BSAtomicSignal *)self->_activated hasBeenSignalled])
  {
    if ([(BSAtomicSignal *)self->_invalidated hasBeenSignalled])
    {
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (a4) {
        goto LABEL_26;
      }
    }
    else
    {
      if (v7)
      {
        if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
          && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        [(BSAtomicSignal *)self->_activated signal];
        p_trSession = &self->_trSession;
        objc_storeStrong((id *)&self->_trSession, a3);
        id location = 0;
        objc_initWeak(&location, self);
        trSession = self->_trSession;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke;
        v18[3] = &unk_1E5BBFE80;
        objc_copyWeak(&v19, &location);
        [(TRSession *)trSession setRequestHandler:v18 forRequestClass:getTRSetupCompanionAuthenticationRequestClass_0[0]()];
        v10 = *p_trSession;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_2;
        v16[3] = &unk_1E5BBFE80;
        objc_copyWeak(&v17, &location);
        [(TRSession *)v10 setRequestHandler:v16 forRequestClass:getTRSetupProxyDeviceRequestClass_0[0]()];
        objc_super v11 = *p_trSession;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_3;
        v14[3] = &unk_1E5BBFE80;
        objc_copyWeak(&v15, &location);
        [(TRSession *)v11 setRequestHandler:v14 forRequestClass:getTRSetupProxyAuthenticationRequestClass_0[0]()];
        objc_destroyWeak(&v15);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        goto LABEL_23;
      }
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (a4)
      {
LABEL_26:
        NSErrorWithOSStatusF();
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    BOOL v12 = 0;
    goto LABEL_28;
  }
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_23:
  BOOL v12 = 1;
LABEL_28:

  return v12;
}

void __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTRCompanionAuthenticationRequest:v7 responseHandler:v5];
}

void __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTRProxyDeviceRequest:v7 responseHandler:v5];
}

void __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTRProxyAuthenticationRequest:v7 responseHandler:v5];
}

- (void)invalidate
{
  if (([(BSAtomicSignal *)self->_invalidated hasBeenSignalled] & 1) == 0)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 50
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidated = self->_invalidated;
    [(BSAtomicSignal *)invalidated signal];
  }
}

- (void)_handleTRCompanionAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([(BSAtomicSignal *)self->_invalidated hasBeenSignalled])
  {
    uint64_t v8 = NSErrorWithOSStatusF();
    v7[2](v7, v8, 0);
  }
  else
  {
    uint64_t v8 = [v6 account];
    if (v8)
    {
      v9 = [v6 targetedAccountServices];
      if (v9)
      {
        v10 = [v6 companionDevice];
        if (v10)
        {
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            BOOL v12 = [v8 username];
            LogPrintF();
          }
          id location = 0;
          objc_initWeak(&location, self);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke;
          v13[3] = &unk_1E5BBFED0;
          objc_copyWeak(&v18, &location);
          id v17 = v7;
          id v14 = v9;
          id v15 = v8;
          id v16 = v10;
          [(SFTouchRemoteAccountServicesHandler *)self _saveRemoteVerifiedAccount:v15 completion:v13];

          objc_destroyWeak(&v18);
          objc_destroyWeak(&location);
        }
        else
        {
          objc_super v11 = NSErrorWithOSStatusF();
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7[2](v7, v11, 0);
        }
      }
      else
      {
        v10 = NSErrorWithOSStatusF();
        if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
          && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v7[2](v7, v10, 0);
      }
    }
    else
    {
      v9 = NSErrorWithOSStatusF();
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[2](v7, v9, 0);
    }
  }
}

void __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      id v11 = v3;
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
  }
  id v5 = objc_msgSend(WeakRetained, "_nextServiceTypeForTRAccountServices:", *(void *)(a1 + 32), v11);
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = objc_alloc((Class)getTRAnisetteDataProviderClass_0[0]());
  id v7 = [WeakRetained trSession];
  uint64_t v8 = (void *)[v6 initWithSession:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2;
  v12[3] = &unk_1E5BBFEA8;
  objc_copyWeak(v15, (id *)(a1 + 64));
  v15[1] = v5;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 56);
  [WeakRetained _authenticateAccount:v9 serviceType:v5 companionDevice:v10 anisetteDataProvider:v8 completion:v12];

  objc_destroyWeak(v15);
}

void __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v5 || v6)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 60
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v9 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass_0[0]());
    [v9 setUnauthenticatedAccountServices:*(void *)(a1 + 32)];
    [v9 setError:v6];
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3;
    v10[3] = &unk_1E5BBCD68;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [WeakRetained _authenticateWithServiceTypes:v8 authResults:v5 completion:v10];
  }
}

void __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass_0[0]());
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [v3 setUnauthenticatedAccountServices:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_handleTRProxyDeviceRequest:(id)a3 responseHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ([(BSAtomicSignal *)self->_invalidated hasBeenSignalled])
  {
    id v7 = NSErrorWithOSStatusF();
    v6[2](v6, v7, 0);
  }
  else
  {
    id v7 = [(Class)getAKDeviceClass_0[0]() currentDevice];
    [v7 setLinkType:3];
    id v8 = objc_alloc_init((Class)getTRSetupProxyDeviceResponseClass_0[0]());
    [v8 setProxyDevice:v7];
    ((void (**)(id, void *, id))v6)[2](v6, 0, v8);
  }
}

- (void)_handleTRProxyAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([(BSAtomicSignal *)self->_invalidated hasBeenSignalled])
  {
    id v8 = NSErrorWithOSStatusF();
    v7[2](v7, v8, 0);
  }
  else
  {
    id v8 = [v6 account];
    if (v8)
    {
      id v9 = [v6 rawPassword];
      if (v9)
      {
        uint64_t v10 = [v6 targetedAccountServices];
        if (v10)
        {
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            [v8 username];
            v13 = BOOL v12 = v10;
            LogPrintF();
          }
          objc_msgSend(v8, "_aa_setRawPassword:", v9, v12, v13);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke;
          v14[3] = &unk_1E5BBDD28;
          id v18 = v7;
          void v14[4] = self;
          id v15 = v10;
          id v16 = v8;
          id v17 = v9;
          [(SFTouchRemoteAccountServicesHandler *)self _saveRemoteVerifiedAccount:v16 completion:v14];
        }
        else
        {
          id v11 = NSErrorWithOSStatusF();
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7[2](v7, v11, 0);
        }
      }
      else
      {
        uint64_t v10 = NSErrorWithOSStatusF();
        if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
          && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v7[2](v7, v10, 0);
      }
    }
    else
    {
      id v9 = NSErrorWithOSStatusF();
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[2](v7, v9, 0);
    }
  }
}

void __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      id v8 = v3;
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
  }
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_nextServiceTypeForTRAccountServices:", *(void *)(a1 + 40), v8);
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2;
  v9[3] = &unk_1E5BBFEF8;
  objc_copyWeak(v12, &location);
  v12[1] = v4;
  id v11 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 40);
  [v5 _authenticateAccount:v6 serviceType:v4 rawPassword:v7 completion:v9];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v5 || v6)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v6, 0);
    }
    else
    {
      id v10 = NSErrorWithOSStatusF();
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3;
    v11[3] = &unk_1E5BBCD68;
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [WeakRetained _authenticateWithServiceTypes:v8 authResults:v5 completion:v11];
  }
}

void __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass_0[0]());
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [v3 setUnauthenticatedAccountServices:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accountStore = self->_accountStore;
  uint64_t v9 = [v6 accountType];
  id v10 = [v9 identifier];
  id v11 = [(ACAccountStore *)accountStore accountTypeWithAccountTypeIdentifier:v10];

  [v6 setAccountType:v11];
  [v6 _setObjectID:0];
  [v6 markAllPropertiesDirty];
  id v12 = self->_accountStore;
  id v13 = [v6 credential];
  id v19 = 0;
  [(ACAccountStore *)v12 setCredential:v13 forAccount:v6 serviceID:0 error:&v19];
  id v14 = v19;

  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v15 = self->_accountStore;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__SFTouchRemoteAccountServicesHandler__saveRemoteVerifiedAccount_completion___block_invoke;
  v17[3] = &unk_1E5BBDE18;
  id v18 = v7;
  id v16 = v7;
  [(ACAccountStore *)v15 saveVerifiedAccount:v6 withCompletionHandler:v17];
}

void __77__SFTouchRemoteAccountServicesHandler__saveRemoteVerifiedAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (v5) {

    }
    goto LABEL_7;
  }
  id v9 = v5;
  id v6 = [v5 domain];
  if ([v6 isEqual:*MEMORY[0x1E4F178F0]])
  {
    uint64_t v7 = [v9 code];

    uint64_t v8 = (uint64_t)v9;
    if (v7 == 5)
    {

LABEL_7:
      uint64_t v8 = 0;
      goto LABEL_11;
    }
  }
  else
  {

    uint64_t v8 = (uint64_t)v9;
  }
  if (!v8)
  {
    uint64_t v8 = NSErrorWithOSStatusF();
  }
LABEL_11:
  id v10 = (id)v8;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 companionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7
{
  id v11 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass_0[0];
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
  id v17 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass_0[0]());
  [v17 authenticateWithContext:v18 completion:v12];
}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 rawPassword:(id)a5 completion:(id)a6
{
  id v9 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass_0[0];
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
  id v14 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass_0[0]());
  [v14 authenticateWithContext:v15 completion:v10];
}

- (void)_authenticateWithServiceTypes:(id)a3 authResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [(SFTouchRemoteAccountServicesHandler *)self _nextTRServiceTypeForTRAccountServices:v8];
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id location = 0;
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __92__SFTouchRemoteAccountServicesHandler__authenticateWithServiceTypes_authResults_completion___block_invoke;
    v12[3] = &unk_1E5BBFF20;
    objc_copyWeak(v16, &location);
    v16[1] = v11;
    id v15 = v10;
    id v13 = v8;
    id v14 = v9;
    [(SFTouchRemoteAccountServicesHandler *)self _authenticateWithServiceType:v11 authResults:v14 completion:v12];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __92__SFTouchRemoteAccountServicesHandler__authenticateWithServiceTypes_authResults_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = v9;
  id v5 = WeakRetained;
  if (v9)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90)
    {
      if (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || (v8 = _LogCategory_Initialize(), id v4 = v9, v8))
      {
        LogPrintF();
        id v4 = v9;
      }
    }
    (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4);
  }
  else
  {
    id v6 = (void *)[*(id *)(a1 + 32) mutableCopy];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v6 removeObject:v7];

    [v5 _authenticateWithServiceTypes:v6 authResults:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)_authenticateWithServiceType:(unint64_t)a3 authResults:(id)a4 completion:(id)a5
{
  id v13 = a4;
  int v8 = (void (**)(id, void *))a5;
  id v9 = [(SFTouchRemoteAccountServicesHandlerConfiguration *)self->_configuration supportedTRAccountServices];
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  int v11 = [v9 containsObject:v10];

  if (!v11)
  {
LABEL_6:
    id v12 = NSErrorWithOSStatusF();
    v8[2](v8, v12);

    goto LABEL_7;
  }
  switch(a3)
  {
    case 3uLL:
      [(SFTouchRemoteAccountServicesHandler *)self _authenticateGameCenterWithAuthResults:v13 completion:v8];
      break;
    case 2uLL:
      [(SFTouchRemoteAccountServicesHandler *)self _authenticateiTunesWithAuthResults:v13 completion:v8];
      break;
    case 1uLL:
      [(SFTouchRemoteAccountServicesHandler *)self _authenticateiCloudWithAuthResults:v13 completion:v8];
      break;
    default:
      goto LABEL_6;
  }
LABEL_7:
}

- (void)_authenticateiCloudWithAuthResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getAKAuthenticationAlternateDSIDKey_0[0]();
  CFStringGetTypeID();
  int v8 = CFDictionaryGetTypedValue();
  getAKAuthenticationUsernameKey_0[0]();
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  getAKAuthenticationPasswordKey_0[0]();
  CFStringGetTypeID();
  id v10 = CFDictionaryGetTypedValue();
  BOOL v11 = [(SFTouchRemoteAccountServicesHandlerConfiguration *)self->_configuration isPrimaryAppleAccount];
  accountStore = self->_accountStore;
  if (v11) {
    [(ACAccountStore *)accountStore aa_primaryAppleAccount];
  }
  else {
  uint64_t v13 = [(ACAccountStore *)accountStore aa_appleAccountWithAltDSID:v8];
  }
  id v14 = (void *)v13;
  int64_t v15 = 1;
  if (v13) {
    int64_t v15 = 2;
  }
  self->_appleAccountSignInState = v15;
  if (v13)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      v26 = [v14 username];
      v27 = v9;
      LogPrintF();
    }
    objc_msgSend(v14, "setAuthenticated:", 0, v26, v27);
    objc_msgSend(v14, "aa_setPassword:", v10);
    id v16 = self->_accountStore;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke;
    v34[3] = &unk_1E5BBDCD8;
    id v35 = v14;
    id v36 = v9;
    id v37 = v7;
    [(ACAccountStore *)v16 verifyCredentialsForAccount:v35 saveWhenAuthorized:1 withHandler:v34];

    id v17 = v35;
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v18 = objc_alloc(MEMORY[0x1E4F179B0]);
    id v19 = [(ACAccountStore *)self->_accountStore aa_appleAccountType];
    v20 = (void *)[v18 initWithAccountType:v19];

    [v20 setUsername:v9];
    v21 = [MEMORY[0x1E4F179C0] credentialWithPassword:v10];
    [v20 setCredential:v21];

    BOOL v22 = [(SFTouchRemoteAccountServicesHandlerConfiguration *)self->_configuration isPrimaryAppleAccount];
    v23 = &getAAAccountClassPrimary;
    if (!v22) {
      v23 = &getAAAccountClassFull;
    }
    v24 = ((void (*)(BOOL))*v23)(v22);
    objc_msgSend(v20, "aa_setAccountClass:", v24);

    id location = 0;
    objc_initWeak(&location, self);
    v25 = self->_accountStore;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke_2;
    v28[3] = &unk_1E5BBFF48;
    objc_copyWeak(&v32, &location);
    id v29 = v9;
    id v31 = v7;
    id v17 = v20;
    id v30 = v17;
    [(ACAccountStore *)v25 aa_registerAppleAccount:v17 withCompletion:v28];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10 || v5)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      id v6 = [*(id *)(a1 + 32) username];
      LogPrintF();
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    }
    else
    {
      int v8 = NSErrorWithOSStatusF();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      id v9 = [v10 username];
      LogPrintF();
    }
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
  }
}

void __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = v12;
  uint64_t v7 = WeakRetained;
  if (v12 || (a2 & 1) == 0)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90)
    {
      if (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || (v8 = _LogCategory_Initialize(), id v6 = v12, v8))
      {
        LogPrintF();
        id v6 = v12;
      }
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
    else
    {
      id v10 = NSErrorWithOSStatusF();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      BOOL v11 = [*(id *)(a1 + 40) username];
      LogPrintF();
    }
    objc_msgSend(v7, "_saveNewAccount:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), v11);
  }
}

- (void)_saveNewAccount:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 setAuthenticated:0];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend(v6, "aa_isPrimaryEmailVerified"))
  {
    BOOL v22 = self;
    id v23 = v7;
    id v24 = v6;
    uint64_t v9 = [(ACAccountStore *)self->_accountStore dataclassActionsForAccountSave:v6];
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
  v26[2] = __66__SFTouchRemoteAccountServicesHandler__saveNewAccount_completion___block_invoke;
  v26[3] = &unk_1E5BBDE18;
  id v27 = v7;
  id v21 = v7;
  [(ACAccountStore *)accountStore saveAccount:v6 withDataclassActions:v8 completion:v26];
}

void __66__SFTouchRemoteAccountServicesHandler__saveNewAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)_authenticateiTunesWithAuthResults:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  uint64_t v10 = CFDictionaryGetTypedValue();

  uint64_t v11 = [(Class)getSSMutableAuthenticationContextClass_0[0]() contextForSignIn];
  [v11 setAccountName:v9];
  [v11 setAllowsRetry:0];
  [v11 setAltDSID:v8];
  [v11 setCanSetActiveAccount:0];
  [v11 setPasswordEquivalentToken:v10];
  [v11 setPromptStyle:1];
  objc_msgSend(v11, "setShouldSuppressDialogs:", -[SFTouchRemoteAccountServicesHandlerConfiguration shouldSuppressStoreSignInDialogs](self->_configuration, "shouldSuppressStoreSignInDialogs"));
  objc_msgSend(v11, "setShouldIgnoreAccountConversion:", -[SFTouchRemoteAccountServicesHandlerConfiguration shouldIgnoreStoreAccountConversion](self->_configuration, "shouldIgnoreStoreAccountConversion"));
  id v12 = [(Class)getSSAccountStoreClass_0[0]() defaultStore];
  uint64_t v13 = (void *)[objc_alloc((Class)getSSAuthenticateRequestClass_0[0]()) initWithAuthenticationContext:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __85__SFTouchRemoteAccountServicesHandler__authenticateiTunesWithAuthResults_completion___block_invoke;
  v16[3] = &unk_1E5BBFF70;
  id v17 = v12;
  id v18 = v6;
  void v16[4] = self;
  id v14 = v12;
  id v15 = v6;
  [v13 startWithAuthenticateResponseBlock:v16];
}

void __85__SFTouchRemoteAccountServicesHandler__authenticateiTunesWithAuthResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 authenticatedAccount];
  if (v5)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 40) shouldActivateStoreAccount]) {
      [v5 setActive:1];
    }
    [*(id *)(a1 + 40) saveAccount:v5 error:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v8)
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
  if ([v3 containsObject:&unk_1EFA095D8])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsObject:&unk_1EFA095F0])
  {
    int64_t v4 = 2;
  }
  else if ([v3 containsObject:&unk_1EFA09608])
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
  if ([v3 containsObject:&unk_1EFA095D8])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 containsObject:&unk_1EFA095F0])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 containsObject:&unk_1EFA09608])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)appleAccountSignInState
{
  return self->_appleAccountSignInState;
}

- (BSAtomicSignal)activated
{
  return self->_activated;
}

- (void)setActivated:(id)a3
{
}

- (BSAtomicSignal)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(id)a3
{
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
}

- (SFTouchRemoteAccountServicesHandlerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_invalidated, 0);

  objc_storeStrong((id *)&self->_activated, 0);
}

@end