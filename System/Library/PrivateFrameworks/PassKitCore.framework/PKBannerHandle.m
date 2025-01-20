@interface PKBannerHandle
+ (id)createHandleForRequest:(id)a3 queue:(id)a4;
- (BOOL)isInvalidated;
- (PKBannerHandle)init;
- (PKBannerHandleState)state;
- (void)_accessTrackedRemoteTargetWithHandler:(uint64_t)a1;
- (void)_invalidateFromRemote:(uint64_t)a1;
- (void)detachWithFinished:(id)a3 reply:(id)a4;
- (void)displayWithCompletion:(id)a3;
- (void)invalidate;
- (void)setState:(id)a3;
@end

@implementation PKBannerHandle

+ (id)createHandleForRequest:(id)a3 queue:(id)a4
{
  v4 = (PKBannerHandle *)a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [PKBannerHandle alloc];
  id v9 = v7;
  v10 = (PKBannerHandle *)v6;
  v11 = v10;
  if (!v8)
  {
    v18 = 0;
    goto LABEL_16;
  }
  if (v9 && v10)
  {
    v34.receiver = v8;
    v34.super_class = (Class)PKBannerHandle;
    v12 = objc_msgSendSuper2(&v34, sel_init);
    if (!v12)
    {
      PKLogFacilityTypeGetObject(0);
      v8 = (PKBannerHandle *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_FAULT))
      {
        uint64_t v27 = [v9 type];
        LODWORD(v42) = 134217984;
        *(void *)((char *)&v42 + 4) = v27;
        _os_log_fault_impl(&dword_190E10000, &v8->super, OS_LOG_TYPE_FAULT, "PKBannerHandle: failed to create handle for %ld - no handle.", (uint8_t *)&v42, 0xCu);
      }

      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [v9 type];
        LODWORD(v42) = 134217984;
        *(void *)((char *)&v42 + 4) = v25;
        _os_log_impl(&dword_190E10000, &v8->super, OS_LOG_TYPE_DEFAULT, "PKBannerHandle: failed to create handle for %ld - no handle.", (uint8_t *)&v42, 0xCu);
      }
      goto LABEL_14;
    }
    v8 = (PKBannerHandle *)v12;
    objc_storeStrong(v12 + 1, a3);
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_queue, v4);
    dispatch_group_t v13 = dispatch_group_create();
    messageTracker = v8->_messageTracker;
    v8->_messageTracker = (OS_dispatch_group *)v13;

    v10 = [MEMORY[0x1E4F50BB8] endpointForSystemMachName:@"com.apple.PassbookUISceneService.remote-ui" service:@"com.apple.wallet.banner" instance:0];
    v4 = v10;
    if (v10)
    {
      uint64_t v15 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v10];
      connection = v8->_connection;
      v8->_connection = (BSServiceConnectionClient *)v15;

      v17 = v8->_connection;
      if (v17)
      {
        *(void *)&long long v42 = MEMORY[0x1E4F143A8];
        *((void *)&v42 + 1) = 3221225472;
        v43 = __40__PKBannerHandle__initForRequest_queue___block_invoke;
        v44 = &unk_1E56E1580;
        v45 = v11;
        v18 = v8;
        v46 = v18;
        [(BSServiceConnectionClient *)v17 configureConnection:&v42];
        v19 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
        v41 = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
        attributes = v18->_attributes;
        v18->_attributes = (NSArray *)v20;

        v22 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v9 type];
          v24 = v8->_connection;
          *(_DWORD *)buf = 134218496;
          v36 = v18;
          __int16 v37 = 2048;
          uint64_t v38 = v23;
          __int16 v39 = 2048;
          v40 = v24;
          _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): created handle for %ld with connection %p.", buf, 0x20u);
        }

        [(BSServiceConnectionClient *)v8->_connection activate];
        v8 = v4;
        goto LABEL_15;
      }
      v28 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        uint64_t v33 = [v9 type];
        LODWORD(v42) = 134217984;
        *(void *)((char *)&v42 + 4) = v33;
        _os_log_fault_impl(&dword_190E10000, v28, OS_LOG_TYPE_FAULT, "PKBannerHandle: failed to create handle for %ld - no connection.", (uint8_t *)&v42, 0xCu);
      }

      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      uint64_t v31 = [v9 type];
      LODWORD(v42) = 134217984;
      *(void *)((char *)&v42 + 4) = v31;
      v30 = "PKBannerHandle: failed to create handle for %ld - no connection.";
      goto LABEL_26;
    }
  }
  else
  {
    __break(1u);
  }
  v28 = PKLogFacilityTypeGetObject((unint64_t)v10);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    uint64_t v32 = [v9 type];
    LODWORD(v42) = 134217984;
    *(void *)((char *)&v42 + 4) = v32;
    _os_log_fault_impl(&dword_190E10000, v28, OS_LOG_TYPE_FAULT, "PKBannerHandle: failed to create handle for %ld - no endpoint.", (uint8_t *)&v42, 0xCu);
  }

  if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_27;
  }
  uint64_t v29 = [v9 type];
  LODWORD(v42) = 134217984;
  *(void *)((char *)&v42 + 4) = v29;
  v30 = "PKBannerHandle: failed to create handle for %ld - no endpoint.";
LABEL_26:
  _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v42, 0xCu);
LABEL_27:

LABEL_14:
  v18 = 0;
LABEL_15:

LABEL_16:
  return v18;
}

- (PKBannerHandle)init
{
  return 0;
}

void __40__PKBannerHandle__initForRequest_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PKBannerServiceInterface();
  [v3 setInterface:v4];

  v5 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v5];

  [v3 setTargetQueue:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PKBannerHandle__initForRequest_queue___block_invoke_2;
  v8[3] = &unk_1E56E1558;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PKBannerHandle__initForRequest_queue___block_invoke_14;
  v6[3] = &unk_1E56E1558;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__PKBannerHandle__initForRequest_queue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 invalidate];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      id v7 = WeakRetained;
      __int16 v8 = 2048;
      id v9 = v3;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_INFO, "PKBannerHandle (%p): connection %p interrupted.", (uint8_t *)&v6, 0x16u);
    }

    os_unfair_lock_lock(WeakRetained + 4);
    -[PKBannerHandle _invalidateFromRemote:]((uint64_t)WeakRetained, 1);
    os_unfair_lock_unlock(WeakRetained + 4);
  }
}

- (void)_invalidateFromRemote:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = 2 * *(unsigned __int8 *)(a1 + 52);
    if (!*(unsigned char *)(a1 + 52) && (a2 & 1) == 0) {
      uint64_t v4 = *(unsigned __int8 *)(a1 + 50);
    }
    char v5 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)(a1 + 48), (unsigned __int8 *)&v5, 1u);
    if (v5) {
      goto LABEL_27;
    }
    if ((a2 & 1) == 0)
    {
      int v6 = PKLogFacilityTypeGetObject(4uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 134218240;
        uint64_t v35 = a1;
        __int16 v36 = 2048;
        uint64_t v37 = v7;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): starting local invalidation of connection %p.", buf, 0x16u);
      }
    }
    if ((_BYTE)v4)
    {
      if (v4 == 1)
      {
        __int16 v8 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v35 = a1;
          id v9 = "PKBannerHandle (%p): banner detached.";
          goto LABEL_19;
        }
      }
      else
      {
        if (v4 != 2) {
          goto LABEL_21;
        }
        __int16 v8 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v35 = a1;
          id v9 = "PKBannerHandle (%p): banner finished.";
LABEL_19:
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
        }
      }
    }
    else
    {
      __int16 v8 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v35 = a1;
        id v9 = "PKBannerHandle (%p): banner interrupted.";
        goto LABEL_19;
      }
    }

LABEL_21:
    uint64_t v10 = *(void **)(a1 + 72);
    if (v10)
    {
      id v11 = v10;
      v12 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      if ((a2 & 1) == 0)
      {
        if (*(unsigned char *)(a1 + 51) || !*(unsigned char *)(a1 + 50))
        {
          id v13 = 0;
        }
        else
        {
          id v13 = [v11 remoteTargetWithLaunchingAssertionAttributes:*(void *)(a1 + 80)];
          if (v13)
          {
            v21 = *(id *)(a1 + 32);
            dispatch_group_enter(v21);
            objc_initWeak((id *)buf, (id)a1);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke;
            aBlock[3] = &unk_1E56E15D0;
            id v13 = v13;
            id v31 = v13;
            objc_copyWeak(&v33, (id *)buf);
            v22 = v21;
            uint64_t v32 = v22;
            uint64_t v23 = (void (**)(void))_Block_copy(aBlock);
            if (PKRunningInLockScreenPlugin())
            {
              v24 = dispatch_get_global_queue(0, 0);
              dispatch_async(v24, v23);
            }
            else
            {
              v23[2](v23);
            }

            objc_destroyWeak(&v33);
            objc_destroyWeak((id *)buf);
          }
        }
        uint64_t v15 = *(NSObject **)(a1 + 24);
        v14 = *(NSObject **)(a1 + 32);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke_26;
        block[3] = &unk_1E56D8AE0;
        id v29 = v11;
        dispatch_group_notify(v14, v15, block);
      }
    }
LABEL_27:
    v16 = *(const void **)(a1 + 64);
    if (v16)
    {
      v17 = _Block_copy(v16);
      v18 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      v19 = *(NSObject **)(a1 + 24);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke_27;
      v25[3] = &unk_1E56DC4C0;
      id v26 = v17;
      uint64_t v27 = v4;
      id v20 = v17;
      dispatch_async(v19, v25);
    }
  }
}

void __40__PKBannerHandle__initForRequest_queue___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v5 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      uint64_t v7 = WeakRetained;
      __int16 v8 = 2048;
      id v9 = v3;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_INFO, "PKBannerHandle (%p): connection %p remotely invalidated.", (uint8_t *)&v6, 0x16u);
    }

    os_unfair_lock_lock(WeakRetained + 4);
    -[PKBannerHandle _invalidateFromRemote:]((uint64_t)WeakRetained, 1);
    os_unfair_lock_unlock(WeakRetained + 4);
  }
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKBannerHandle _invalidateFromRemote:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_lock);
}

void __40__PKBannerHandle__invalidateFromRemote___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke_2;
  v3[3] = &unk_1E56E15A8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 detachWithReply:v3];

  objc_destroyWeak(&v5);
}

void __40__PKBannerHandle__invalidateFromRemote___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = PKLogFacilityTypeGetObject(0);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v6)
      {
        int v10 = 134218242;
        id v11 = WeakRetained;
        __int16 v12 = 2112;
        id v13 = v3;
        uint64_t v7 = "PKBannerHandle (%p): failed to notify remote of local invalidation - %@.";
        __int16 v8 = v5;
        uint32_t v9 = 22;
LABEL_7:
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
      }
    }
    else if (v6)
    {
      int v10 = 138412290;
      id v11 = v3;
      uint64_t v7 = "PKBannerHandle (?): failed to notify remote of local invalidation - %@.";
      __int16 v8 = v5;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __40__PKBannerHandle__invalidateFromRemote___block_invoke_26(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKBannerHandle: connection %p locally invalidated.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void __40__PKBannerHandle__invalidateFromRemote___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned __int8 v2 = +[PKBannerHandleResponse createWithResult:]((uint64_t)PKBannerHandleResponse, *(void *)(a1 + 40));
  (*(void (**)(uint64_t, PKBannerHandleResponse *))(v1 + 16))(v1, v2);
}

- (void)displayWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started) {
    __break(1u);
  }
  int v5 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): starting...", (uint8_t *)&buf, 0xCu);
  }

  self->_started = 1;
  uint64_t v6 = _Block_copy(v4);
  id completion = self->_completion;
  self->_id completion = v6;

  __int16 v8 = self->_state;
  uint32_t v9 = (OS_dispatch_group *)dispatch_group_create();
  initialStateUpdateTracker = self->_initialStateUpdateTracker;
  self->_initialStateUpdateTracker = v9;

  dispatch_group_enter((dispatch_group_t)self->_initialStateUpdateTracker);
  os_unfair_lock_unlock(&self->_lock);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke;
  v13[3] = &unk_1E56E1670;
  v13[4] = self;
  id v11 = v8;
  uint64_t v14 = v11;
  p_long long buf = &buf;
  -[PKBannerHandle _accessTrackedRemoteTargetWithHandler:]((uint64_t)self, v13);
  os_unfair_lock_lock(&self->_lock);
  dispatch_group_leave((dispatch_group_t)self->_initialStateUpdateTracker);
  __int16 v12 = self->_initialStateUpdateTracker;
  self->_initialStateUpdateTracker = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(PKBannerHandle *)self invalidate];
  }

  _Block_object_dispose(&buf, 8);
}

void __40__PKBannerHandle_displayWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_2;
  v20[3] = &unk_1E56E15F8;
  objc_copyWeak(&v21, &location);
  [v5 configureForRequest:v8 withState:v7 didStartReply:v20];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_29;
  aBlock[3] = &unk_1E56E1648;
  id v9 = v5;
  id v17 = v9;
  objc_copyWeak(&v19, &location);
  id v10 = v6;
  id v18 = v10;
  id v11 = (uint64_t (**)(void))_Block_copy(aBlock);
  if (PKRunningInLockScreenPlugin())
  {
    __int16 v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_32;
    block[3] = &unk_1E56DD5C8;
    uint64_t v14 = v11;
    objc_copyWeak(&v15, &location);
    dispatch_async(v12, block);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v15);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11[2](v11);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __40__PKBannerHandle_displayWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v6 = 134218242;
      id v7 = WeakRetained;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): detached before start or failed to configure - %@.", (uint8_t *)&v6, 0x16u);
    }
  }
}

uint64_t __40__PKBannerHandle_displayWithCompletion___block_invoke_29(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  unsigned __int8 v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_2_30;
  v5[3] = &unk_1E56E1620;
  id v7 = &v9;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  [v2 displayWithReply:v5];
  uint64_t v3 = *((unsigned __int8 *)v10 + 24);

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v9, 8);
  return v3;
}

void __40__PKBannerHandle_displayWithCompletion___block_invoke_2_30(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (!WeakRetained) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v6 = PKLogFacilityTypeGetObject(0);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v3;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): failed to start - %@.", (uint8_t *)&v8, 0x16u);
    }

LABEL_8:
    os_unfair_lock_lock(v5 + 4);
    BYTE2(v5[12]._os_unfair_lock_opaque) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    os_unfair_lock_unlock(v5 + 4);
    goto LABEL_9;
  }
  if (v7)
  {
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (?): failed to start - %@.", (uint8_t *)&v8, 0xCu);
  }

LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__PKBannerHandle_displayWithCompletion___block_invoke_32(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained invalidate];
  }
}

- (void)_accessTrackedRemoteTargetWithHandler:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3) {
      __break(1u);
    }
    id v5 = (void *)MEMORY[0x192FDC630]();
    id v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    BOOL v7 = *(void **)(a1 + 72);
    if (v7)
    {
      uint64_t v8 = [v7 remoteTargetWithLaunchingAssertionAttributes:*(void *)(a1 + 80)];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        __int16 v10 = *(id *)(a1 + 32);
        dispatch_group_enter(v10);
        os_unfair_lock_unlock(v6);
        uint64_t v11 = [[PKDeallocationGuard alloc] initWithBlock:&__block_literal_global_50];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __56__PKBannerHandle__accessTrackedRemoteTargetWithHandler___block_invoke_2;
        v17[3] = &unk_1E56D8A90;
        id v18 = v11;
        id v19 = v10;
        uint64_t v12 = (void (*)(void *, void *, void *))v4[2];
        id v13 = v10;
        uint64_t v14 = v11;
        v12(v4, v9, v17);

LABEL_12:
        goto LABEL_13;
      }
      id v15 = PKLogFacilityTypeGetObject(4uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v21 = a1;
        v16 = "PKBannerHandle (%p): attempting to message inactive connection.";
        goto LABEL_10;
      }
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject(4uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v21 = a1;
        v16 = "PKBannerHandle (%p): attempting to message invalidated connection.";
LABEL_10:
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    goto LABEL_12;
  }
LABEL_13:
}

- (PKBannerHandleState)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_state;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setState:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && (uint64_t v7 = [v5 type], v7 != -[PKBannerHandleRequest type](self->_request, "type")))
  {
    __break(1u);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_state, a3);
    BOOL started = self->_started;
    uint64_t v9 = self->_initialStateUpdateTracker;
    os_unfair_lock_unlock(&self->_lock);
    if (started)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __27__PKBannerHandle_setState___block_invoke;
      v10[3] = &unk_1E56E1698;
      uint64_t v11 = v9;
      uint64_t v12 = self;
      id v13 = v6;
      -[PKBannerHandle _accessTrackedRemoteTargetWithHandler:]((uint64_t)self, v10);
    }
  }
}

void __27__PKBannerHandle_setState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PKBannerHandle_setState___block_invoke_2;
    block[3] = &unk_1E56D89F0;
    __int16 v10 = &v15;
    id v15 = v5;
    id v16 = *(id *)(a1 + 48);
    id v17 = v7;
    dispatch_group_notify(v8, v9, block);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__PKBannerHandle_setState___block_invoke_4;
    v12[3] = &unk_1E56D8388;
    __int16 v10 = &v13;
    id v13 = v6;
    [v5 updateState:v11 withReply:v12];
  }
}

void __27__PKBannerHandle_setState___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__PKBannerHandle_setState___block_invoke_3;
  v3[3] = &unk_1E56D8388;
  id v4 = *(id *)(a1 + 48);
  [v1 updateState:v2 withReply:v3];
}

uint64_t __27__PKBannerHandle_setState___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __27__PKBannerHandle_setState___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__PKBannerHandle__accessTrackedRemoteTargetWithHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) invalidate])
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v2);
  }
}

- (void)detachWithFinished:(id)a3 reply:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    __int16 v10 = self;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): received remote detach.", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_detached = 1;
  self->_finished = [v6 BOOLValue];
  os_unfair_lock_unlock(&self->_lock);
  v7[2](v7, 0);
  [(PKBannerHandle *)self invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_initialStateUpdateTracker, 0);
  objc_storeStrong((id *)&self->_messageTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end