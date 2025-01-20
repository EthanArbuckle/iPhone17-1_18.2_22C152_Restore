@interface SFSystemSession
- (BOOL)allowUnencrypted;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFSystemSession)init;
- (void)_cleanup;
- (void)_processRequests;
- (void)_processRequestsWithError:(id)a3;
- (void)_run;
- (void)_runPairVerifyStart;
- (void)_runSFSessionStart;
- (void)activate;
- (void)getProfilesResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)getProfilesWithCompletion:(id)a3;
- (void)getSystemInfoWithCompletion:(id)a3;
- (void)installProfileResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)installProfileWithData:(id)a3 completion:(id)a4;
- (void)installProfileWithURL:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)rebootSystemWithCompletion:(id)a3;
- (void)removeProfileWithIdentifier:(id)a3 completion:(id)a4;
- (void)setAllowUnencrypted:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
@end

@implementation SFSystemSession

- (SFSystemSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFSystemSession;
  v2 = [(SFSystemSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)_cleanup
{
  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFSystemSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __27__SFSystemSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SFSystemSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFSystemSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16)
    && gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 40) = 7;
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _run];
}

- (void)_run
{
  uint64_t v3 = &gLogCategory_SFSystemSession;
  uint64_t v4 = "-[SFSystemSession _run]";
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = *MEMORY[0x1E4F28568];
  uint64_t v20 = *MEMORY[0x1E4F28760];
  state = (NSError *)self->_state;
  do
  {
    switch((int)state)
    {
      case 0:
        self->_state = 10;
        break;
      case 3:
        if (!self->_stateError)
        {
          v6 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = v19;
          objc_super v7 = v4;
          v8 = v3;
          uint64_t v9 = [NSString stringWithUTF8String:DebugGetErrorString()];
          v10 = (void *)v9;
          v11 = @"?";
          if (v9) {
            v11 = (__CFString *)v9;
          }
          v22[0] = v11;
          v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v18);
          v13 = [v6 errorWithDomain:v20 code:-6700 userInfo:v12];
          stateError = self->_stateError;
          self->_stateError = v13;

          uint64_t v3 = v8;
          uint64_t v4 = v7;
        }
        if (gLogCategory_SFSystemSession <= 60
          && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
        {
          v18 = self->_stateError;
          LogPrintF();
        }
        -[SFSystemSession _processRequestsWithError:](self, "_processRequestsWithError:", self->_stateError, v18);
        break;
      case 7:
        v15 = NSErrorWithOSStatusF();
        [(SFSystemSession *)self _processRequestsWithError:v15];

        break;
      case 10:
        self->_state = 11;
        [(SFSystemSession *)self _runSFSessionStart];
        break;
      case 11:
        if (self->_stateDone)
        {
          if (self->_stateError) {
            int v16 = 3;
          }
          else {
            int v16 = 12;
          }
          goto LABEL_31;
        }
        break;
      case 12:
        self->_state = 13;
        self->_stateDone = 0;
        [(SFSystemSession *)self _runPairVerifyStart];
        break;
      case 13:
        if (self->_stateDone)
        {
          if (self->_stateError && !self->_allowUnencrypted) {
            int v16 = 3;
          }
          else {
            int v16 = 14;
          }
LABEL_31:
          self->_state = v16;
        }
        break;
      case 14:
        [(SFSystemSession *)self _processRequests];
        break;
      default:
        if (gLogCategory_SFSystemSession <= 60
          && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
        {
          v18 = state;
          LogPrintF();
        }
        break;
    }
    BOOL v17 = self->_state == state;
    state = (NSError *)self->_state;
  }
  while (!v17);
}

- (void)_runSFSessionStart
{
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
  [(SFSession *)self->_sfSession setLabel:@"System"];
  [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
  [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.System"];
  [(SFSession *)self->_sfSession setSessionFlags:33];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SFSystemSession__runSFSessionStart__block_invoke;
  v7[3] = &unk_1E5BBC870;
  v7[4] = self;
  [(SFSession *)self->_sfSession setSessionStartedHandler:v7];
  v5 = self->_sfSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SFSystemSession__runSFSessionStart__block_invoke_2;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFSession *)v5 activateWithCompletion:v6];
}

uint64_t __37__SFSystemSession__runSFSessionStart__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFSystemSession <= 30
      && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 44) = 1;
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

void __37__SFSystemSession__runSFSessionStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    if (v4)
    {
      id v7 = v4;
      if (gLogCategory_SFSystemSession <= 60
        && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
      *(unsigned char *)(*(void *)(a1 + 32) + 44) = 1;
      [*(id *)(a1 + 32) _run];
      goto LABEL_11;
    }
    if (gLogCategory_SFSystemSession <= 30)
    {
      id v7 = 0;
      if (gLogCategory_SFSystemSession != -1 || (int v6 = _LogCategory_Initialize(), v5 = 0, v6))
      {
        LogPrintF();
LABEL_11:
        v5 = v7;
      }
    }
  }
}

- (void)_runPairVerifyStart
{
  sfSession = self->_sfSession;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SFSystemSession__runPairVerifyStart__block_invoke;
  v3[3] = &unk_1E5BBC8E8;
  v3[4] = self;
  [(SFSession *)sfSession pairVerifyWithFlags:8 completion:v3];
}

void __38__SFSystemSession__runPairVerifyStart__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v5 = v4;
    if (v4)
    {
      if (gLogCategory_SFSystemSession > 60
        || gLogCategory_SFSystemSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_12;
      }
    }
    else if (gLogCategory_SFSystemSession > 30 {
           || gLogCategory_SFSystemSession == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_12;
    }
    LogPrintF();
LABEL_12:
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
    *(unsigned char *)(*(void *)(a1 + 32) + 44) = 1;
    [*(id *)(a1 + 32) _run];
    id v4 = v5;
  }
}

- (void)_processRequests
{
  p_currentRequest = &self->_currentRequest;
  if (!self->_currentRequest)
  {
    id v4 = [(NSMutableArray *)self->_requests firstObject];
    if (v4)
    {
      objc_storeStrong((id *)p_currentRequest, v4);
      [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
      sfSession = self->_sfSession;
      int v6 = [v4 requestID];
      id v7 = [v4 options];
      uint64_t v8 = [v4 request];
      uint64_t v9 = (void *)v8;
      if (v8) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = MEMORY[0x1E4F1CC08];
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __35__SFSystemSession__processRequests__block_invoke;
      v11[3] = &unk_1E5BC1DF8;
      id v12 = v4;
      v13 = self;
      [(SFSession *)sfSession sendRequestID:v6 options:v7 request:v10 responseHandler:v11];
    }
  }
}

uint64_t __35__SFSystemSession__processRequests__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  v11 = [v7 responseHandler];
  ((void (**)(void, id, id, id))v11)[2](v11, v10, v9, v8);

  v13 = *(void **)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  if (v13 == (void *)v12[1])
  {
    v12[1] = 0;

    id v12 = *(void **)(a1 + 40);
  }

  return [v12 _run];
}

- (void)_processRequestsWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_requests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "responseHandler", (void)v11);
        id v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id, void, void))v10)[2](v10, v4, 0, 0);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_requests removeAllObjects];
}

- (void)getSystemInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = objc_alloc_init(SFSessionRequestInfo);
  [(SFSessionRequestInfo *)v5 setRequestID:@"_getSysInfo"];
  if (self->_allowUnencrypted) {
    [(SFSessionRequestInfo *)v5 setOptions:&unk_1EFA09FD0];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke;
  v11[3] = &unk_1E5BC1850;
  id v12 = v4;
  id v6 = v4;
  [(SFSessionRequestInfo *)v5 setResponseHandler:v11];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke_2;
  block[3] = &unk_1E5BBBD18;
  block[4] = self;
  id v10 = v5;
  uint64_t v8 = v5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)getProfilesWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = objc_alloc_init(SFSessionRequestInfo);
  [(SFSessionRequestInfo *)v5 setRequestID:@"_profilesGet"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SFSystemSession_getProfilesWithCompletion___block_invoke;
  v11[3] = &unk_1E5BBDDA0;
  void v11[4] = self;
  id v12 = v4;
  id v6 = v4;
  [(SFSessionRequestInfo *)v5 setResponseHandler:v11];
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SFSystemSession_getProfilesWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5BBBD18;
  v9[4] = self;
  id v10 = v5;
  uint64_t v8 = v5;
  dispatch_async(dispatchQueue, v9);
}

uint64_t __45__SFSystemSession_getProfilesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) getProfilesResponse:a4 error:a2 completion:*(void *)(a1 + 40)];
}

uint64_t __45__SFSystemSession_getProfilesWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)getProfilesResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (a4)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, a4);
  }
  else
  {
    CFArrayGetTypeID();
    uint64_t v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      ((void (**)(void, void *, void))v8)[2](v8, v9, 0);
    }
    else
    {
      id v10 = NSErrorWithOSStatusF();
      ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
    }
  }
}

- (void)installProfileWithData:(id)a3 completion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v8 = NSDataCompress();
  id v9 = 0;
  if (v8)
  {
    if (gLogCategory_SFSystemSession <= 30
      && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
    {
      [v6 length];
      [v8 length];
      LogPrintF();
    }
    id v12 = objc_alloc_init(SFSessionRequestInfo);
    [(SFSessionRequestInfo *)v12 setRequestID:@"_profileInstall"];
    v23 = @"profileData";
    v24[0] = v8;
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [(SFSessionRequestInfo *)v12 setRequest:v13];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__SFSystemSession_installProfileWithData_completion___block_invoke_2;
    v17[3] = &unk_1E5BBDDA0;
    v17[4] = self;
    id v18 = v7;
    [(SFSessionRequestInfo *)v12 setResponseHandler:v17];
    dispatchQueue = self->_dispatchQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__SFSystemSession_installProfileWithData_completion___block_invoke_3;
    v15[3] = &unk_1E5BBBD18;
    v15[4] = self;
    uint64_t v16 = v12;
    id v11 = v12;
    dispatch_async(dispatchQueue, v15);
  }
  else
  {
    id v10 = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SFSystemSession_installProfileWithData_completion___block_invoke;
    block[3] = &unk_1E5BBC9C8;
    uint64_t v21 = (SFSessionRequestInfo *)v7;
    id v20 = v9;
    dispatch_async(v10, block);

    id v11 = v21;
  }
}

uint64_t __53__SFSystemSession_installProfileWithData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __53__SFSystemSession_installProfileWithData_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) installProfileResponse:a4 error:a2 completion:*(void *)(a1 + 40)];
}

uint64_t __53__SFSystemSession_installProfileWithData_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)installProfileWithURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:&v13];
  id v8 = v13;
  if (v7)
  {
    [(SFSystemSession *)self installProfileWithData:v7 completion:v6];
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SFSystemSession_installProfileWithURL_completion___block_invoke;
    block[3] = &unk_1E5BBC9C8;
    id v12 = v6;
    id v11 = v8;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __52__SFSystemSession_installProfileWithURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)installProfileResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  id v8 = (void (**)(void, void, void))v7;
  if (a4)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, a4);
  }
  else
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      ((void (**)(void, void *, void))v8)[2](v8, v9, 0);
    }
    else
    {
      id v10 = NSErrorWithOSStatusF();
      ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
    }
  }
}

- (void)removeProfileWithIdentifier:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = objc_alloc_init(SFSessionRequestInfo);
  [(SFSessionRequestInfo *)v8 setRequestID:@"_profileRemove"];
  BOOL v17 = @"id";
  v18[0] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [(SFSessionRequestInfo *)v8 setRequest:v9];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5BC1850;
  id v16 = v7;
  id v10 = v7;
  [(SFSessionRequestInfo *)v8 setResponseHandler:v15];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5BBBD18;
  void block[4] = self;
  long long v14 = v8;
  id v12 = v8;
  dispatch_async(dispatchQueue, block);
}

uint64_t __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)rebootSystemWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = objc_alloc_init(SFSessionRequestInfo);
  [(SFSessionRequestInfo *)v5 setRequestID:@"_rebootSystem"];
  [(SFSessionRequestInfo *)v5 setRequest:MEMORY[0x1E4F1CC08]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__SFSystemSession_rebootSystemWithCompletion___block_invoke;
  v9[3] = &unk_1E5BC1850;
  id v10 = v4;
  id v6 = v4;
  [(SFSessionRequestInfo *)v5 setResponseHandler:v9];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFSystemSession_rebootSystemWithCompletion___block_invoke_2;
  block[3] = &unk_1E5BBBD18;
  void block[4] = self;
  void block[5] = v5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__SFSystemSession_rebootSystemWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__SFSystemSession_rebootSystemWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (BOOL)allowUnencrypted
{
  return self->_allowUnencrypted;
}

- (void)setAllowUnencrypted:(BOOL)a3
{
  self->_allowUnencrypted = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_stateError, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end