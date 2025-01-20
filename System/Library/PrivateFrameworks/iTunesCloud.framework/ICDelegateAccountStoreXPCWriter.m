@interface ICDelegateAccountStoreXPCWriter
- (ICDelegateAccountStoreXPCWriter)initWithAccountStoreOptions:(id)a3;
- (id)_onceWithCompletionHandler:(id)a3;
- (id)externalChangeHandler;
- (void)_getXPCConnectionWithCompletion:(id)a3;
- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)delegateAccountStoreDidChange;
- (void)invalidate;
- (void)openWithCompletionHandler:(id)a3;
- (void)recreateWithCompletionHandler:(id)a3;
- (void)removeAllTokensWithCompletionHandler:(id)a3;
- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)setExternalChangeHandler:(id)a3;
- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation ICDelegateAccountStoreXPCWriter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_externalChangeHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountStoreOptions, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_getXPCConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    id v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v11 = *(id *)(a1 + 40);
    id v10 = v2;
    dispatch_async(v4, block);

    v5 = v11;
  }
  else
  {
    id v6 = *(NSObject **)(v3 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_3;
    v7[3] = &unk_1E5ACD2F0;
    v7[4] = v3;
    id v8 = *(id *)(a1 + 40);
    dispatch_barrier_async(v6, v7);
    v5 = v8;
  }
}

uint64_t __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    if (*(unsigned char *)(v2 + 48))
    {
      uint64_t v3 = 0;
      goto LABEL_10;
    }
    id v4 = [*(id *)(v2 + 16) XPCEndpoint];
    v5 = [*(id *)(*(void *)(a1 + 32) + 16) XPCServiceName];
    id v6 = v5;
    if (v4)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    }
    else
    {
      if (![v5 length])
      {
LABEL_9:
        id v10 = *(void **)(*(void *)(a1 + 32) + 32);
        id v11 = ICDelegateAccountStoreServiceGetInterface();
        [v10 setRemoteObjectInterface:v11];

        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setExportedObject:");
        v12 = *(void **)(*(void *)(a1 + 32) + 32);
        v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF65AD10];
        [v12 setExportedInterface:v13];

        objc_initWeak(location, *(id *)(a1 + 32));
        objc_initWeak(&from, *(id *)(*(void *)(a1 + 32) + 32));
        v14 = *(void **)(*(void *)(a1 + 32) + 32);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_4;
        v26[3] = &unk_1E5ACA2F0;
        objc_copyWeak(&v27, location);
        objc_copyWeak(&v28, &from);
        [v14 setInvalidationHandler:v26];
        v15 = *(void **)(*(void *)(a1 + 32) + 32);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_6;
        v23[3] = &unk_1E5ACA2F0;
        objc_copyWeak(&v24, location);
        objc_copyWeak(&v25, &from);
        [v15 setInterruptionHandler:v23];
        [*(id *)(*(void *)(a1 + 32) + 32) resume];
        objc_destroyWeak(&v25);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&from);
        objc_destroyWeak(location);

        uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
        goto LABEL_10;
      }
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v6 options:0];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    goto LABEL_9;
  }
LABEL_10:
  id v16 = v3;
  v17 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_8;
  block[3] = &unk_1E5ACD2F0;
  id v18 = *(id *)(a1 + 40);
  id v21 = v16;
  id v22 = v18;
  id v19 = v16;
  dispatch_async(v17, block);
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_4(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_5;
    v6[3] = &unk_1E5ACD4C8;
    uint64_t v7 = WeakRetained;
    id v8 = v4;
    dispatch_barrier_async(v5, v6);
  }
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_6(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_7;
    v6[3] = &unk_1E5ACD4C8;
    uint64_t v7 = WeakRetained;
    id v8 = v4;
    dispatch_barrier_async(v5, v6);
  }
}

uint64_t __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v3 == v2)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;
  }
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v3 == v2)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  }
}

- (id)_onceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [ICDispatchOnce alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__ICDelegateAccountStoreXPCWriter__onceWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5ACB920;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(ICDispatchOnce *)v5 initWithBooleanHandler:v9];
  [(ICDispatchOnce *)v7 startWithTimeout:self->_callbackQueue queue:10.0];

  return v7;
}

uint64_t __62__ICDelegateAccountStoreXPCWriter__onceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recreateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AC99D8;
  id v7 = v4;
  id v5 = v4;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v6];
}

void __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 remoteObjectProxy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5ACB920;
    id v8 = *(id *)(a1 + 32);
    [v5 recreateWithCompletionHandler:v7];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v5);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AC9960;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v6];
}

void __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 16) XPCServiceName];
    uint64_t v5 = [v4 length];

    uint64_t v6 = [ICDispatchOnce alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E5AC9E60;
    id v16 = *(id *)(a1 + 40);
    id v7 = [(ICDispatchOnce *)v6 initWithObjectHandler:v15];
    id v8 = v7;
    double v9 = 10.0;
    if (!v5) {
      double v9 = 2.0;
    }
    [(ICDispatchOnce *)v7 startWithTimeout:*(void *)(*(void *)(a1 + 32) + 24) queue:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E5ACC7B0;
    v14[4] = v8;
    id v10 = [v3 remoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_4;
    v13[3] = &unk_1E5AC99B0;
    v13[4] = v8;
    [v10 openWithCompletionHandler:v13];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v11 + 16))(v11, 0, 0, v12);
    }
  }
}

void __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = a2;
    (*(void (**)(uint64_t, BOOL, id, id))(v3 + 16))(v3, [v6 length] != 0, v6, v5);
  }
}

uint64_t __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id v4 = *(void **)(a1 + 32);
  if (a2) {
    return [v4 finishWithObjectResult:a3 error:0];
  }
  else {
    return [v4 failWithError:a4];
  }
}

- (void)invalidate
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICDelegateAccountStoreXPCWriter_invalidate__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

void __45__ICDelegateAccountStoreXPCWriter_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)setExternalChangeHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ICDelegateAccountStoreXPCWriter_setExternalChangeHandler___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __60__ICDelegateAccountStoreXPCWriter_setExternalChangeHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = MEMORY[0x1A6240BF0](*(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)externalChangeHandler
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__20393;
  id v10 = __Block_byref_object_dispose__20394;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ICDelegateAccountStoreXPCWriter_externalChangeHandler__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  uint64_t v3 = (void *)MEMORY[0x1A6240BF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __56__ICDelegateAccountStoreXPCWriter_externalChangeHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x1A6240BF0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 40));

  return MEMORY[0x1F41817F8]();
}

- (void)delegateAccountStoreDidChange
{
  uint64_t v3 = [(ICDelegateAccountStoreXPCWriter *)self externalChangeHandler];
  id v4 = v3;
  if (v3)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICDelegateAccountStoreXPCWriter_delegateAccountStoreDidChange__block_invoke;
    block[3] = &unk_1E5ACD170;
    id v7 = v3;
    dispatch_async(callbackQueue, block);
  }
}

uint64_t __64__ICDelegateAccountStoreXPCWriter_delegateAccountStoreDidChange__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC9938;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v14];
}

void __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 56)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5ACC7B0;
    v10[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACAE28;
    void v9[4] = v4;
    [v5 setToken:v6 forUserIdentity:v7 completionHandler:v9];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC9938;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v14];
}

void __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 56)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5ACC7B0;
    v10[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACAE28;
    void v9[4] = v4;
    [v5 setIdentityProperties:v6 forUserIdentity:v7 completionHandler:v9];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC9988;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v10];
}

void __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 48)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5ACC7B0;
    void v9[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v9];
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5ACAE28;
    v8[4] = v4;
    [v5 removeTokensExpiringBeforeDate:v6 completionHandler:v8];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC9988;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v10];
}

void __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 48)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5ACC7B0;
    void v9[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v9];
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5ACAE28;
    v8[4] = v4;
    [v5 removeTokenForUserIdentity:v6 completionHandler:v8];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC9988;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v10];
}

void __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 48)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5ACC7B0;
    void v9[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v9];
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5ACAE28;
    v8[4] = v4;
    [v5 removeIdentityPropertiesForUserIdentity:v6 completionHandler:v8];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC9938;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v14];
}

void __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 56)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5ACC7B0;
    v10[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACAE28;
    void v9[4] = v4;
    [v5 removeDelegationUUIDs:v6 forUserIdentity:v7 completionHandler:v9];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AC9960;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v6];
}

void __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 40)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E5ACC7B0;
    void v9[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E5ACAE28;
    v8[4] = v4;
    [v5 removeAllTokensWithCompletionHandler:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

uint64_t __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC9938;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(ICDelegateAccountStoreXPCWriter *)self _getXPCConnectionWithCompletion:v14];
}

void __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _onceWithCompletionHandler:*(void *)(a1 + 56)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5ACC7B0;
    v10[4] = v4;
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACAE28;
    void v9[4] = v4;
    [v5 addDelegationUUIDs:v6 forUserIdentity:v7 completionHandler:v9];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithBooleanResult:a2 error:a3];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICDelegateAccountStoreXPCWriter;
  [(ICDelegateAccountStoreXPCWriter *)&v3 dealloc];
}

- (ICDelegateAccountStoreXPCWriter)initWithAccountStoreOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 XPCEndpoint];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [v4 XPCServiceName];

    if (!v6) {
      goto LABEL_7;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)ICDelegateAccountStoreXPCWriter;
  uint64_t v7 = [(ICDelegateAccountStoreXPCWriter *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v4 copy];
    accountStoreOptions = v7->_accountStoreOptions;
    v7->_accountStoreOptions = (ICDelegateAccountStoreOptions *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreXPCWriter.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreXPCWriter.callbackQueue", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;
  }
  self = v7;
  uint64_t v6 = self;
LABEL_7:

  return v6;
}

@end