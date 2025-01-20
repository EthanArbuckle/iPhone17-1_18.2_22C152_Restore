@interface PKApplicationAuthorizationHandle
+ (id)createForRequest:(id)a3;
- (BOOL)isInvalidated;
- (PKApplicationAuthorizationHandle)init;
- (void)_invalidateFromSource:(void *)a3 withCompletion:;
- (void)_resolveInvalidation;
- (void)dealloc;
- (void)detachWithReply:(id)a3;
- (void)displayForPresentationTarget:(id)a3 withAction:(id)a4 completion:(id)a5;
- (void)invalidateWithCompletion:(id)a3;
- (void)performActionWithReply:(id)a3;
@end

@implementation PKApplicationAuthorizationHandle

+ (id)createForRequest:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [PKApplicationAuthorizationHandle alloc];
  id v6 = v4;
  v7 = v6;
  if (!v5) {
    goto LABEL_9;
  }
  if (!v6)
  {
    __break(1u);
    goto LABEL_12;
  }
  v35.receiver = v5;
  v35.super_class = (Class)PKApplicationAuthorizationHandle;
  v8 = objc_msgSendSuper2(&v35, sel_init);
  if (!v8)
  {
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  v5 = (PKApplicationAuthorizationHandle *)v8;
  objc_storeStrong(v8 + 1, a3);
  v5->_lock._os_unfair_lock_opaque = 0;
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.wallet.application-authorization" options:0];
  connection = v5->_connection;
  v5->_connection = (NSXPCConnection *)v9;

  v11 = v5->_connection;
  if (!v11)
  {
LABEL_12:
    v22 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      uint64_t v28 = [v7 type];
      LODWORD(v42) = 134217984;
      *(void *)((char *)&v42 + 4) = v28;
      _os_log_fault_impl(&dword_190E10000, v22, OS_LOG_TYPE_FAULT, "PKApplicationAuthorizationHandle: failed to create handle for %ld - no connection.", (uint8_t *)&v42, 0xCu);
    }

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v7 type];
      LODWORD(v42) = 134217984;
      *(void *)((char *)&v42 + 4) = v27;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle: failed to create handle for %ld - no connection.", (uint8_t *)&v42, 0xCu);
    }
    v21 = 0;
    goto LABEL_8;
  }
  id v12 = PKApplicationAuthorizationServiceInterface_Client();
  [(NSXPCConnection *)v11 setExportedInterface:v12];

  v13 = v5->_connection;
  id v14 = PKApplicationAuthorizationServiceInterface_Server();
  [(NSXPCConnection *)v13 setRemoteObjectInterface:v14];

  [(NSXPCConnection *)v5->_connection setExportedObject:v5];
  v15 = v5;
  v16 = v5->_connection;
  v17 = v5->_connection;
  *(void *)&long long v42 = MEMORY[0x1E4F143A8];
  *((void *)&v42 + 1) = 3221225472;
  v43 = __53__PKApplicationAuthorizationHandle__initWithRequest___block_invoke;
  v44 = &unk_1E56D8A90;
  v18 = v15;
  v45 = v18;
  v19 = v16;
  v46 = v19;
  [(NSXPCConnection *)v17 setInterruptionHandler:&v42];
  v20 = v5->_connection;
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __53__PKApplicationAuthorizationHandle__initWithRequest___block_invoke_2;
  v32 = &unk_1E56D8A90;
  v21 = v18;
  v33 = v21;
  v22 = v19;
  v34 = v22;
  [(NSXPCConnection *)v20 setInvalidationHandler:&v29];
  v23 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = objc_msgSend(v7, "type", v29, v30, v31, v32, v33);
    v25 = v5->_connection;
    *(_DWORD *)buf = 134218496;
    v37 = v21;
    __int16 v38 = 2048;
    uint64_t v39 = v24;
    __int16 v40 = 2048;
    v41 = v25;
    _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): created handle for %ld with connection %p.", buf, 0x20u);
  }

  [(NSXPCConnection *)v5->_connection activate];
LABEL_8:

LABEL_10:
  return v21;
}

- (PKApplicationAuthorizationHandle)init
{
  return 0;
}

void __53__PKApplicationAuthorizationHandle__initWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "PKApplicationAuthorizationHandle (%p): connection %p interrupted.", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 40) invalidate];
  -[PKApplicationAuthorizationHandle _invalidateFromSource:withCompletion:](*(void *)(a1 + 32), 1, 0);
}

- (void)_invalidateFromSource:(void *)a3 withCompletion:
{
  id v5 = a3;
  if (!a1) {
    goto LABEL_20;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v6 = *(void **)(a1 + 64);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    uint64_t v9 = _Block_copy(*(const void **)(a1 + 48));
    v10 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    v11 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v12;

    if (v9)
    {
      id v14 = *(void **)(a1 + 24);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke;
      aBlock[3] = &unk_1E56F4BF0;
      id v36 = v9;
      v15 = _Block_copy(aBlock);
      [v14 addObject:v15];
    }
    if (v5)
    {
      v16 = *(void **)(a1 + 24);
      v17 = _Block_copy(v5);
      [v16 addObject:v17];
    }
    if (a2 == 1)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_2_11;
      v28[3] = &unk_1E56F4C18;
      v18 = &v29;
      id v29 = v7;
      id v19 = v7;
      v20 = (void (**)(void *, id))_Block_copy(v28);
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_2;
      v33[3] = &unk_1E56F4C18;
      v18 = &v34;
      id v23 = v7;
      id v34 = v23;
      uint64_t v24 = _Block_copy(v33);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_7;
      v30[3] = &unk_1E56F4C40;
      id v31 = v23;
      id v32 = v24;
      id v25 = v24;
      id v26 = v23;
      v20 = (void (**)(void *, id))_Block_copy(v30);
    }
  }
  else
  {
    v20 = 0;
    if (!v5) {
      goto LABEL_15;
    }
    v21 = *(void **)(a1 + 24);
    if (!v21) {
      goto LABEL_15;
    }
    v22 = _Block_copy(v5);
    [v21 addObject:v22];

    v20 = 0;
  }
  id v5 = 0;
LABEL_15:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  id v27 = (id)a1;
  if (v5) {
    (*((void (**)(id, id))v5 + 2))(v5, v27);
  }
  if (v20) {
    v20[2](v20, v27);
  }

LABEL_20:
}

void __53__PKApplicationAuthorizationHandle__initWithRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "PKApplicationAuthorizationHandle (%p): connection %p remotely invalidated.", (uint8_t *)&v5, 0x16u);
  }

  -[PKApplicationAuthorizationHandle _invalidateFromSource:withCompletion:](*(void *)(a1 + 32), 1, 0);
}

- (void)dealloc
{
  if (self->_invalidationCompletions)
  {
    __break(1u);
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)PKApplicationAuthorizationHandle;
    [(PKApplicationAuthorizationHandle *)&v2 dealloc];
  }
}

- (BOOL)isInvalidated
{
  objc_super v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_connection == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidateWithCompletion:(id)a3
{
}

uint64_t __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134218240;
    id v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_INFO, "PKApplicationAuthorizationHandle (%p): connection %p locally invalidated.", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) invalidate];
  id v6 = v3;
  -[PKApplicationAuthorizationHandle _resolveInvalidation]((uint64_t)v6);
}

- (void)_resolveInvalidation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_super v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v3 = (void *)[*(id *)(a1 + 24) copy];
    uint64_t v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    os_unfair_lock_unlock(v2);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

void __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_7(uint64_t a1, atomic_uchar *a2)
{
  if (atomic_exchange(a2 + 56, 1u))
  {
    (*(void (**)(void, atomic_uchar *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_2_8;
    v10[3] = &unk_1E56D9528;
    v10[4] = a2;
    uint64_t v4 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v5 = a2;
    uint64_t v6 = [v4 remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_10;
    v8[3] = &unk_1E56D83D8;
    id v7 = *(id *)(a1 + 40);
    v8[4] = v5;
    id v9 = v7;
    [v6 detachWithReply:v8];
  }
}

void __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_2_8(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_INFO, "PKApplicationAuthorizationHandle (%p): failed to notify remote of local invalidation - %@.", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __73__PKApplicationAuthorizationHandle__invalidateFromSource_withCompletion___block_invoke_2_11(uint64_t a1, uint64_t a2)
{
}

- (void)displayForPresentationTarget:(id)a3 withAction:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 || !v9 || (id v11 = v10) == 0 || (p_lock = &self->_lock, os_unfair_lock_lock(&self->_lock), self->_started)) {
    __break(1u);
  }
  long long v13 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = self;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): starting...", buf, 0xCu);
  }

  self->_started = 1;
  if (self->_connection)
  {
    id v14 = _Block_copy(v9);
    id action = self->_action;
    self->_id action = v14;

    v16 = _Block_copy(v11);
    id completion = self->_completion;
    self->_id completion = v16;

    connection = self->_connection;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke;
    v28[3] = &unk_1E56DB8E8;
    void v28[4] = self;
    id v19 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke_12;
    aBlock[3] = &unk_1E56D8AB8;
    id v25 = v19;
    id v26 = self;
    id v27 = v8;
    id v20 = v19;
    v21 = (void (**)(void))_Block_copy(aBlock);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke_13;
    v22[3] = &unk_1E56D8A18;
    v22[4] = self;
    id v23 = v11;
    v21 = (void (**)(void))_Block_copy(v22);
    id v20 = v23;
  }

  os_unfair_lock_unlock(p_lock);
  v21[2](v21);
}

uint64_t __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): failed to start.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) invalidateWithCompletion:0];
}

uint64_t __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke_12(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(v2 + 8);
  uint64_t v4 = a1[6];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke_2;
  v6[3] = &unk_1E56D8AE0;
  v6[4] = v2;
  return [v1 displayForRequest:v3 target:v4 withReply:v6];
}

void __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): started.", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __87__PKApplicationAuthorizationHandle_displayForPresentationTarget_withAction_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): could not start - already invalidated.", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performActionWithReply:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_19;
    v13[3] = &unk_1E56D8A18;
    v13[4] = self;
    id v14 = v4;
    id v10 = (void (**)(void))_Block_copy(v13);
    id v11 = v14;
LABEL_8:

    goto LABEL_9;
  }
  if (!self->_started)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_18;
    v15[3] = &unk_1E56D8A18;
    v15[4] = self;
    id v16 = v4;
    id v10 = (void (**)(void))_Block_copy(v15);
    id v11 = v16;
    goto LABEL_8;
  }
  id action = self->_action;
  if (!action)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_17;
    v17[3] = &unk_1E56D8A18;
    v17[4] = self;
    id v18 = v4;
    id v10 = (void (**)(void))_Block_copy(v17);
    id v11 = v18;
    goto LABEL_8;
  }
  uint64_t v7 = _Block_copy(action);
  id v8 = self->_action;
  self->_id action = 0;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke;
  aBlock[3] = &unk_1E56F4C68;
  void aBlock[4] = self;
  id v20 = v7;
  id v21 = v4;
  id v9 = v7;
  id v10 = (void (**)(void))_Block_copy(aBlock);

LABEL_9:
  os_unfair_lock_unlock(p_lock);
  long long v12 = (void *)MEMORY[0x192FDC630]();
  v10[2](v10);
}

void __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): performing action...", buf, 0xCu);
  }

  id v4 = [[PKDeallocationGuard alloc] initWithBlock:&__block_literal_global_210];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_2;
  v8[3] = &unk_1E56E3F10;
  uint64_t v5 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  uint64_t v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  uint64_t v7 = v4;
  v6(v5, v8);
}

uint64_t __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 40) invalidate]) {
    __break(1u);
  }
  id v4 = PKLogFacilityTypeGetObject(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 134217984;
      uint64_t v11 = v6;
      uint64_t v7 = "PKApplicationAuthorizationHandle (%p): action committed.";
LABEL_7:
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 134217984;
    uint64_t v11 = v8;
    uint64_t v7 = "PKApplicationAuthorizationHandle (%p): action failed.";
    goto LABEL_7;
  }

  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2);
}

uint64_t __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_17(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): cannot perform action - already performed - invalidating.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) invalidateWithCompletion:0];
}

uint64_t __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_18(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): cannot perform action - handle not started - invalidating.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) invalidateWithCompletion:0];
}

uint64_t __59__PKApplicationAuthorizationHandle_performActionWithReply___block_invoke_19(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKApplicationAuthorizationHandle (%p): cannot perform action - already invalidated.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)detachWithReply:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  int v5 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_INFO, "PKApplicationAuthorizationHandle (%p): received remote detach.", (uint8_t *)&v6, 0xCu);
  }

  atomic_exchange(&self->_detached._Value, 1u);
  v4[2](v4);
  [(PKApplicationAuthorizationHandle *)self invalidateWithCompletion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_invalidationCompletions, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end