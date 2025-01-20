@interface SFSystemService
- (OS_dispatch_queue)dispatchQueue;
- (SFSystemService)init;
- (id)description;
- (void)_handleGetSystemInfoRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleProfileInstallForSession:(id)a3 request:(id)a4 responseHandler:(id)a5;
- (void)_handleProfileRemoveForSession:(id)a3 request:(id)a4 responseHandler:(id)a5;
- (void)_handleProfilesGetForSession:(id)a3 request:(id)a4 responseHandler:(id)a5;
- (void)_handleRebootSystemForSession:(id)a3 request:(id)a4 responseHandler:(id)a5;
- (void)_handleSessionStarted:(id)a3;
- (void)_sfServiceStart;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SFSystemService

- (SFSystemService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFSystemService;
  v2 = [(SFSystemService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFSystemService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__SFSystemService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v2 = *(void **)(a1 + 32);

  return [v2 _sfServiceStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SFSystemService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__SFSystemService_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.System"];
  [(SFService *)self->_sfService setLabel:@"System"];
  [(SFService *)self->_sfService setPairSetupDisabled:1];
  [(SFService *)self->_sfService setSessionFlags:33];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SFSystemService__sfServiceStart__block_invoke;
  v6[3] = &unk_1E5BBE028;
  v6[4] = self;
  [(SFService *)self->_sfService setSessionStartedHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SFSystemService__sfServiceStart__block_invoke_2;
  v5[3] = &unk_1E5BBE050;
  v5[4] = self;
  [(SFService *)self->_sfService setSessionEndedHandler:v5];
  [(SFService *)self->_sfService activateWithCompletion:&__block_literal_global_68];
}

uint64_t __34__SFSystemService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionStarted:a2];
}

uint64_t __34__SFSystemService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionEnded:a2];
}

void __34__SFSystemService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_SFSystemService <= 60)
    {
      id v6 = v2;
      if (gLogCategory_SFSystemService != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v6;
      }
    }
  }
  else if (gLogCategory_SFSystemService <= 30)
  {
    id v6 = 0;
    if (gLogCategory_SFSystemService != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__SFSystemService__handleSessionStarted___block_invoke;
  v17[3] = &unk_1E5BBCBA8;
  v17[4] = self;
  [v4 registerRequestID:@"_getSysInfo" options:&unk_1EFA09F80 handler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__SFSystemService__handleSessionStarted___block_invoke_2;
  v15[3] = &unk_1E5BC1DD0;
  v15[4] = self;
  id v5 = v4;
  id v16 = v5;
  [v5 registerRequestID:@"_rebootSystem" options:&unk_1EFA09FA8 handler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__SFSystemService__handleSessionStarted___block_invoke_3;
  v13[3] = &unk_1E5BC1DD0;
  v13[4] = self;
  id v6 = v5;
  id v14 = v6;
  [v6 registerRequestID:@"_profilesGet" options:&unk_1EFA09FA8 handler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__SFSystemService__handleSessionStarted___block_invoke_4;
  v11[3] = &unk_1E5BC1DD0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v7 registerRequestID:@"_profileInstall" options:&unk_1EFA09FA8 handler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__SFSystemService__handleSessionStarted___block_invoke_5;
  v9[3] = &unk_1E5BC1DD0;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [v8 registerRequestID:@"_profileRemove" options:&unk_1EFA09FA8 handler:v9];
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetSystemInfoRequest:responseHandler:");
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleRebootSystemForSession:*(void *)(a1 + 40) request:a3 responseHandler:a4];
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleProfilesGetForSession:*(void *)(a1 + 40) request:a3 responseHandler:a4];
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleProfileInstallForSession:*(void *)(a1 + 40) request:a3 responseHandler:a4];
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleProfileRemoveForSession:*(void *)(a1 + 40) request:a3 responseHandler:a4];
}

- (void)_handleGetSystemInfoRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = (void *)GestaltCopyAnswer();
  if (v8)
  {
    [v7 setObject:v8 forKeyedSubscript:@"model"];
  }
  else if (gLogCategory_SFSystemService <= 60 {
         && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v9 = (void *)GestaltCopyAnswer();

  if (v9)
  {
    [v7 setObject:v9 forKeyedSubscript:@"name"];
  }
  else if (gLogCategory_SFSystemService <= 60 {
         && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v10 = (void *)GestaltCopyAnswer();

  if (v10)
  {
    [v7 setObject:v10 forKeyedSubscript:@"osBuild"];
  }
  else if (gLogCategory_SFSystemService <= 60 {
         && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v7);
}

- (void)_handleRebootSystemForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    id v12 = v8;
    LogPrintF();
  }
  if (((objc_msgSend(v13, "sessionFlags", v12) & 0x40) != 0
     || ([v13 pairingContainsACL:@"com.apple.admin"] & 1) != 0)
    && !reboot3())
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, MEMORY[0x1E4F1CC08]);
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    dispatch_after(v10, (dispatch_queue_t)self->_dispatchQueue, &__block_literal_global_190);
  }
  else
  {
    v11 = NSErrorWithOSStatusF();
    if (gLogCategory_SFSystemService <= 60
      && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v11, 0, 0);
  }
}

uint64_t __73__SFSystemService__handleRebootSystemForSession_request_responseHandler___block_invoke()
{
  uint64_t result = reboot3();
  if (gLogCategory_SFSystemService <= 60)
  {
    if (gLogCategory_SFSystemService != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (void)_handleProfilesGetForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    id v24 = v8;
    LogPrintF();
  }
  if ((objc_msgSend(v7, "sessionFlags", v24) & 0x40) != 0
    || [v7 pairingContainsACL:@"com.apple.admin"])
  {
    id v26 = v8;
    id v27 = v7;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = [MEMORY[0x1E4F74230] sharedConnection];
    id v12 = [v11 installedProfilesWithFilterFlags:3];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v14) {
      goto LABEL_30;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        v19 = [v18 identifier];
        if (!v19
          && gLogCategory_SFSystemService <= 60
          && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v20 = [v18 friendlyName];
        if (v20 || ([v18 displayName], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v21 setObject:v20 forKeyedSubscript:@"name"];

          if (!v19) {
            goto LABEL_21;
          }
LABEL_20:
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, @"id", v25);
          goto LABEL_21;
        }
        if (gLogCategory_SFSystemService <= 60
          && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
        {
          v25 = v19;
          LogPrintF();
        }
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        if (v19) {
          goto LABEL_20;
        }
LABEL_21:
        objc_msgSend(v10, "addObject:", v21, v25);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v22 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v15 = v22;
      if (!v22)
      {
LABEL_30:

        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v23 setObject:v10 forKeyedSubscript:@"profiles"];
        id v8 = v26;
        id v7 = v27;
LABEL_31:
        if (gLogCategory_SFSystemService <= 30
          && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v23);

        goto LABEL_36;
      }
    }
  }
  NSErrorWithOSStatusF();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    id v23 = 0;
    id v13 = 0;
    goto LABEL_31;
  }
  if (gLogCategory_SFSystemService <= 60
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, id, void, void))v9 + 2))(v9, v10, 0, 0);
LABEL_36:
}

- (void)_handleProfileInstallForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    id v17 = v8;
    LogPrintF();
  }
  int v19 = 0;
  if ((objc_msgSend(v7, "sessionFlags", v17) & 0x40) == 0
    && ([v7 pairingContainsACL:@"com.apple.admin"] & 1) == 0)
  {
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
    goto LABEL_21;
  }
  CFDataGetTypeID();
  id v10 = CFDictionaryGetTypedValue();
  if (!v10)
  {
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v11 = 0;
    goto LABEL_23;
  }
  v18[1] = 0;
  v11 = NSDataDecompress();
  id v12 = 0;
  if (!v11) {
    goto LABEL_23;
  }
  id v13 = [MEMORY[0x1E4F74230] sharedConnection];
  v18[0] = v12;
  uint64_t v14 = [v13 installProfileData:v11 options:0 outError:v18];
  id v15 = v18[0];

  if (!v14)
  {
    if (v15)
    {
      id v16 = 0;
      uint64_t v14 = 0;
LABEL_12:
      if (gLogCategory_SFSystemService <= 60
        && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, id, void, void))v9 + 2))(v9, v15, 0, 0);

      goto LABEL_29;
    }
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    uint64_t v14 = 0;
    id v16 = 0;
    if (v12) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:v14 forKeyedSubscript:@"id"];
  id v12 = v15;
  if (v15)
  {
LABEL_11:
    id v15 = v12;
    goto LABEL_12;
  }
LABEL_24:
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v16);
LABEL_29:
}

- (void)_handleProfileRemoveForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    id v13 = v8;
    LogPrintF();
  }
  if ((objc_msgSend(v7, "sessionFlags", v13) & 0x40) != 0
    || ([v7 pairingContainsACL:@"com.apple.admin"] & 1) != 0)
  {
    CFStringGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      v11 = (void *)v10;
      id v12 = [MEMORY[0x1E4F74230] sharedConnection];
      [v12 removeProfileWithIdentifier:v11];

      goto LABEL_9;
    }
  }
  v11 = NSErrorWithOSStatusF();
  if (!v11)
  {
LABEL_9:
    if (gLogCategory_SFSystemService <= 30
      && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, MEMORY[0x1E4F1CC08]);
    goto LABEL_14;
  }
  if (gLogCategory_SFSystemService <= 60
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *, void, void))v9 + 2))(v9, v11, 0, 0);
LABEL_14:
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

  objc_storeStrong((id *)&self->_sfService, 0);
}

@end