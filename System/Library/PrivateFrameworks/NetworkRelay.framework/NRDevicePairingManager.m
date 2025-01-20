@interface NRDevicePairingManager
+ (uint64_t)copyErrorForCode:(uint64_t)a1;
+ (uint64_t)copyXPCError;
+ (void)unpairDevice:(id)a3 withCompletion:(id)a4;
- (NRDevicePairingManager)initWithIdentifier:(id)a3 pairingCriteria:(id)a4 metadata:(id)a5 queue:(id)a6;
- (NSString)fullDescription;
- (id)authRequestHandler;
- (id)candidateDiscoveredHandler;
- (id)candidateLostHandler;
- (id)description;
- (id)invalidationHandler;
- (unint64_t)managerState;
- (void)activateWithCompletion:(id)a3;
- (void)callCompletionBlock:(void *)a3 withError:;
- (void)cancelDiscovery;
- (void)cancelPairing;
- (void)dealloc;
- (void)getDataForAuthMethod:(unint64_t)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)invalidateWithError:(void *)a1;
- (void)pairingFailedWithError:(void *)a1;
- (void)requestAuthMethodForDevice:(id)a3 authMethod:(unint64_t)a4 withCompletion:(id)a5;
- (void)setAuthRequestHandler:(id)a3;
- (void)setCandidateDiscoveredHandler:(id)a3;
- (void)setCandidateLostHandler:(id)a3;
- (void)setInternalManagerState:(void *)a1;
- (void)setInvalidationHandler:(id)a3;
- (void)setManagerState:(unint64_t)a3;
- (void)startDiscoveryWithCompletion:(id)a3;
- (void)startPairingDevice:(id)a3 withCompletion:(id)a4 resultBlock:(id)a5;
@end

@implementation NRDevicePairingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong(&self->_pairingResultBlock, 0);
  objc_storeStrong((id *)&self->_pairingManagerMux, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_authRequestHandler, 0);
  objc_storeStrong(&self->_candidateLostHandler, 0);
  objc_storeStrong(&self->_candidateDiscoveredHandler, 0);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setManagerState:(unint64_t)a3
{
  self->_managerState = a3;
}

- (unint64_t)managerState
{
  return self->_managerState;
}

- (void)setAuthRequestHandler:(id)a3
{
}

- (id)authRequestHandler
{
  return self->_authRequestHandler;
}

- (void)setCandidateLostHandler:(id)a3
{
}

- (id)candidateLostHandler
{
  return self->_candidateLostHandler;
}

- (void)setCandidateDiscoveredHandler:(id)a3
{
}

- (id)candidateDiscoveredHandler
{
  return self->_candidateDiscoveredHandler;
}

- (void)invalidate
{
  v2 = self;
  if (self)
  {
    v3 = self;
    objc_sync_enter(v3);
    unint64_t internalManagerState = v3->_internalManagerState;
    objc_sync_exit(v3);

    if (internalManagerState == 10) {
      return;
    }
    -[NRDevicePairingManager setInternalManagerState:](v3, 10);
    self = (NRDevicePairingManager *)v3->_operationQueue;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NRDevicePairingManager_invalidate__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = v2;
  dispatch_async(&self->super, block);
}

- (void)setInternalManagerState:(void *)a1
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (obj[1] == a2)
    {
      objc_sync_exit(obj);
    }
    else
    {
      obj[1] = a2;
      objc_sync_exit(obj);

      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 0, (uint64_t)"%s%.30s:%-4d Manager state change: %zu -> %zu", v3, v4, v5, v6, v7, (uint64_t)"");
      }
    }
  }
}

void __36__NRDevicePairingManager_invalidate__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[9];
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__NRDevicePairingManager_invalidate__block_invoke_2;
  v5[3] = &unk_263FD1388;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux unregisterPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__NRDevicePairingManager_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;

    if (v3)
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Unregistering pairing manager failed: %@", v7, v8, v9, v10, v11, (uint64_t)"");
      }
    }
    v12 = v5[7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__NRDevicePairingManager_invalidate__block_invoke_3;
    block[3] = &unk_263FD1428;
    v14 = v5;
    id v15 = v3;
    dispatch_async(v12, block);
  }
}

void __36__NRDevicePairingManager_invalidate__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setManagerState:5];
  v2 = [*(id *)(a1 + 32) invalidationHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) invalidationHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (void)cancelPairing
{
  if (self)
  {
    v2 = self;
    objc_sync_enter(v2);
    unint64_t internalManagerState = v2->_internalManagerState;
    objc_sync_exit(v2);

    if (internalManagerState == 8)
    {
      -[NRDevicePairingManager setInternalManagerState:](v2, 9);
      operationQueue = v2->_operationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__NRDevicePairingManager_cancelPairing__block_invoke;
      block[3] = &unk_263FD1360;
      void block[4] = v2;
      dispatch_async(operationQueue, block);
    }
  }
}

void __39__NRDevicePairingManager_cancelPairing__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[9];
  }
  id v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__NRDevicePairingManager_cancelPairing__block_invoke_2;
  v5[3] = &unk_263FD1388;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux stopPairingForPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__NRDevicePairingManager_cancelPairing__block_invoke_2(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (!WeakRetained)
  {
    v13 = v3;
    goto LABEL_25;
  }
  if (v3)
  {
    if (nrCopyLogObj_onceToken_1261 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Stopping pairing failed: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    int v12 = 0;
    v13 = v3;
  }
  else
  {
    v14 = WeakRetained;
    objc_sync_enter(v14);
    uint64_t v15 = v14[1];
    objc_sync_exit(v14);

    if (v15 == 9)
    {
      id v21 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v33 = *MEMORY[0x263F08320];
      v34 = @"Pairing operation was cancelled";
      int v12 = 1;
      v22 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v13 = (void *)[v21 initWithDomain:@"NRDevicePairingErrorDomain" code:-3002 userInfo:v22];
    }
    else
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d State changed while stopping pairing", v16, v17, v18, v19, v20, (uint64_t)"");
      }
      self;
      id v23 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v35 = *MEMORY[0x263F08320];
      v36[0] = @"Manager is in invalid state for this operation";
      v24 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      v13 = (void *)[v23 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v24];

      int v12 = 0;
    }
  }
  id v25 = objc_getProperty(v10, v11, 80, 1);
  objc_setProperty_atomic_copy(v10, v26, 0, 80);
  if (v12)
  {
    -[NRDevicePairingManager setInternalManagerState:](v10, 3);
LABEL_21:
    v27 = v10[7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__NRDevicePairingManager_cancelPairing__block_invoke_3;
    block[3] = &unk_263FD12E8;
    char v32 = v12;
    v29 = v10;
    id v31 = v25;
    id v30 = v13;
    dispatch_async(v27, block);

    goto LABEL_22;
  }
  if (v25) {
    goto LABEL_21;
  }
LABEL_22:
  if (v3) {
    -[NRDevicePairingManager invalidateWithError:](v10, v13);
  }

LABEL_25:
}

uint64_t __39__NRDevicePairingManager_cancelPairing__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) setManagerState:9];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)invalidateWithError:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = v4[1];
    objc_sync_exit(v4);

    if (v5 != 10)
    {
      -[NRDevicePairingManager setInternalManagerState:](v4, 10);
      uint64_t v6 = (void *)v4[9];
      v4[9] = 0;

      uint64_t v7 = v4[7];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __46__NRDevicePairingManager_invalidateWithError___block_invoke;
      v8[3] = &unk_263FD1428;
      v8[4] = v4;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

void __46__NRDevicePairingManager_invalidateWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setManagerState:5];
  v2 = [*(id *)(a1 + 32) invalidationHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) invalidationHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (void)startPairingDevice:(id)a3 withCompletion:(id)a4 resultBlock:(id)a5
{
  v42[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v9)
  {
    id v21 = nrCopyLogObj_1256();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v25 = os_log_type_enabled(v21, OS_LOG_TYPE_FAULT);

      if (!v25) {
        goto LABEL_9;
      }
    }
    id v26 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null completionBlock", v27, v28, v29, v30, v31, (uint64_t)"-[NRDevicePairingManager startPairingDevice:withCompletion:resultBlock:]");
LABEL_18:

    goto LABEL_9;
  }
  if (!v10)
  {
    id v23 = nrCopyLogObj_1256();
    v24 = v23;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v32 = os_log_type_enabled(v23, OS_LOG_TYPE_FAULT);

      if (!v32) {
        goto LABEL_9;
      }
    }
    id v26 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null resultBlock", v33, v34, v35, v36, v37, (uint64_t)"-[NRDevicePairingManager startPairingDevice:withCompletion:resultBlock:]");
    goto LABEL_18;
  }
  if (!self)
  {
    operationQueue = 0;
    goto LABEL_8;
  }
  int v12 = self;
  objc_sync_enter(v12);
  unint64_t internalManagerState = v12->_internalManagerState;
  objc_sync_exit(v12);

  if (internalManagerState != 1)
  {
    v14 = v12;
    objc_sync_enter(v14);
    unint64_t v15 = v12->_internalManagerState;
    objc_sync_exit(v14);

    if (v15 != 10)
    {
      -[NRDevicePairingManager setInternalManagerState:](v14, 7);
      objc_setProperty_atomic_copy(v14, v19, v11, 80);
      operationQueue = v14->_operationQueue;
LABEL_8:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke;
      block[3] = &unk_263FD1478;
      void block[4] = self;
      id v39 = v8;
      id v40 = v9;
      dispatch_async(operationQueue, block);

      goto LABEL_9;
    }
  }
  self;
  id v16 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v41 = *MEMORY[0x263F08320];
  v42[0] = @"Manager is in invalid state for this operation";
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
  uint64_t v18 = (void *)[v16 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v17];

  -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)v12, v9, v18);
LABEL_9:
}

- (void)callCompletionBlock:(void *)a3 withError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 56);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__NRDevicePairingManager_callCompletionBlock_withError___block_invoke;
    v8[3] = &unk_263FD1338;
    id v10 = v5;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

void __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[9];
  }
  id v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_2;
  v6[3] = &unk_263FD1310;
  objc_copyWeak(&v8, &location);
  id v7 = *(id *)(a1 + 48);
  -[NRDevicePairingManagerMux startPairingForPairingManager:pairingTarget:withCompletion:](v3, v4, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Starting pairing failed: %@", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      objc_setProperty_atomic_copy(v10, v11, 0, 80);
      char v12 = 0;
      v13 = v3;
    }
    else
    {
      unint64_t v15 = WeakRetained;
      objc_sync_enter(v15);
      uint64_t v16 = v15[1];
      objc_sync_exit(v15);

      if (v16 == 7)
      {
        -[NRDevicePairingManager setInternalManagerState:](v15, 8);
        v13 = 0;
        char v12 = 1;
      }
      else
      {
        if (nrCopyLogObj_onceToken_1261 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d State changed while starting pairing", v17, v18, v19, v20, v21, (uint64_t)"");
        }
        self;
        id v22 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v32 = *MEMORY[0x263F08320];
        v33[0] = @"Manager is in invalid state for this operation";
        id v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
        v13 = (void *)[v22 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v23];

        objc_setProperty_atomic_copy(v15, v24, 0, 80);
        char v12 = 0;
      }
    }
    BOOL v25 = v10[7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_3;
    block[3] = &unk_263FD12E8;
    char v31 = v12;
    id v26 = v10;
    id v28 = v26;
    id v30 = *(id *)(a1 + 32);
    id v14 = v13;
    id v29 = v14;
    dispatch_async(v25, block);
    if (v3) {
      -[NRDevicePairingManager invalidateWithError:](v26, v14);
    }
  }
  else
  {
    id v14 = v3;
  }
}

uint64_t __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) setManagerState:4];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __56__NRDevicePairingManager_callCompletionBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getDataForAuthMethod:(unint64_t)a3 withCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v7 = nrCopyLogObj_1256();
    uint64_t v8 = v7;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);

      if (!v9) {
        goto LABEL_5;
      }
    }
    id v10 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v10, 17, (uint64_t)"%s called with null completionBlock", v11, v12, v13, v14, v15, (uint64_t)"-[NRDevicePairingManager getDataForAuthMethod:withCompletion:]");

    goto LABEL_5;
  }
  if (self) {
    self = (NRDevicePairingManager *)self->_callbackQueue;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NRDevicePairingManager_getDataForAuthMethod_withCompletion___block_invoke;
  block[3] = &unk_263FD19F0;
  id v17 = v5;
  dispatch_async(&self->super, block);

LABEL_5:
}

void __62__NRDevicePairingManager_getDataForAuthMethod_withCompletion___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  self;
  id v2 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = @"Unimplemented method";
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = (void *)[v2 initWithDomain:@"NRDevicePairingErrorDomain" code:-9999 userInfo:v3];

  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v4, 0);
}

- (void)requestAuthMethodForDevice:(id)a3 authMethod:(unint64_t)a4 withCompletion:(id)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v8)
  {
    uint64_t v19 = nrCopyLogObj_1256();
    uint64_t v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v23 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

      if (!v23) {
        goto LABEL_8;
      }
    }
    id v24 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v24, 17, (uint64_t)"%s called with null device", v25, v26, v27, v28, v29, (uint64_t)"-[NRDevicePairingManager requestAuthMethodForDevice:authMethod:withCompletion:]");
LABEL_17:

    goto LABEL_8;
  }
  if (!v9)
  {
    uint64_t v21 = nrCopyLogObj_1256();
    id v22 = v21;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v30 = os_log_type_enabled(v21, OS_LOG_TYPE_FAULT);

      if (!v30) {
        goto LABEL_8;
      }
    }
    id v24 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v24, 17, (uint64_t)"%s called with null completionBlock", v31, v32, v33, v34, v35, (uint64_t)"-[NRDevicePairingManager requestAuthMethodForDevice:authMethod:withCompletion:]");
    goto LABEL_17;
  }
  if (!self) {
    goto LABEL_6;
  }
  uint64_t v11 = self;
  objc_sync_enter(v11);
  unint64_t internalManagerState = v11->_internalManagerState;
  objc_sync_exit(v11);

  if (internalManagerState < 3) {
    goto LABEL_6;
  }
  uint64_t v13 = v11;
  objc_sync_enter(v13);
  unint64_t v14 = v11->_internalManagerState;
  objc_sync_exit(v13);

  if (v14 < 7)
  {
    operationQueue = v13->_operationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke;
    block[3] = &unk_263FD13D8;
    void block[4] = v13;
    id v37 = v8;
    unint64_t v39 = a4;
    id v38 = v10;
    dispatch_async(operationQueue, block);
  }
  else
  {
LABEL_6:
    self;
    id v15 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v40 = *MEMORY[0x263F08320];
    v41[0] = @"Manager is in invalid state for this operation";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v17 = (void *)[v15 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v16];

    -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)self, v10, v17);
  }
LABEL_8:
}

void __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[9];
  }
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_2;
  v7[3] = &unk_263FD13B0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  -[NRDevicePairingManagerMux sendAuthMethodRequestForDevice:authMethod:pairingManager:withCompletion:]((uint64_t)v3, v5, v4, v6, v7);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Requesting auth method %zu for %@ failed: %@", v4, v5, v6, v7, v8, (uint64_t)"");
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_INFO)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 1, (uint64_t)"%s%.30s:%-4d Requesting auth method %zu for %@ succeeded", v4, v5, v6, v7, v8, (uint64_t)"");
      }
    }
    id v10 = WeakRetained[7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_3;
    block[3] = &unk_263FD1338;
    id v13 = *(id *)(a1 + 40);
    id v12 = v3;
    dispatch_async(v10, block);
  }
}

uint64_t __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cancelDiscovery
{
  if (self)
  {
    id v2 = self;
    objc_sync_enter(v2);
    unint64_t internalManagerState = v2->_internalManagerState;
    objc_sync_exit(v2);

    if (internalManagerState == 5)
    {
      -[NRDevicePairingManager setInternalManagerState:](v2, 6);
      operationQueue = v2->_operationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__NRDevicePairingManager_cancelDiscovery__block_invoke;
      block[3] = &unk_263FD1360;
      void block[4] = v2;
      dispatch_async(operationQueue, block);
    }
  }
}

void __41__NRDevicePairingManager_cancelDiscovery__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[9];
  }
  id v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__NRDevicePairingManager_cancelDiscovery__block_invoke_2;
  v5[3] = &unk_263FD1388;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux stopDiscoveryForPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__NRDevicePairingManager_cancelDiscovery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Stopping pairing discovery failed: %@", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      -[NRDevicePairingManager invalidateWithError:](v10, v3);
    }
    else
    {
      uint64_t v11 = WeakRetained;
      objc_sync_enter(v11);
      uint64_t v12 = v11[1];
      objc_sync_exit(v11);

      if (v12 == 6)
      {
        -[NRDevicePairingManager setInternalManagerState:](v11, 3);
        uint64_t v18 = v11[7];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__NRDevicePairingManager_cancelDiscovery__block_invoke_3;
        block[3] = &unk_263FD1360;
        uint64_t v20 = v11;
        dispatch_async(v18, block);
      }
      else
      {
        if (nrCopyLogObj_onceToken_1261 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d State changed while stopping pairing discovery", v13, v14, v15, v16, v17, (uint64_t)"");
        }
      }
    }
  }
}

uint64_t __41__NRDevicePairingManager_cancelDiscovery__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setManagerState:2];
}

- (void)startDiscoveryWithCompletion:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v11 = nrCopyLogObj_1256();
    uint64_t v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v13) {
        goto LABEL_6;
      }
    }
    id v14 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null completionBlock", v15, v16, v17, v18, v19, (uint64_t)"-[NRDevicePairingManager startDiscoveryWithCompletion:]");

    goto LABEL_6;
  }
  if (self
    && (uint64_t v5 = self,
        objc_sync_enter(v5),
        unint64_t internalManagerState = v5->_internalManagerState,
        objc_sync_exit(v5),
        v5,
        internalManagerState == 3))
  {
    -[NRDevicePairingManager setInternalManagerState:](v5, 4);
    operationQueue = v5->_operationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke;
    block[3] = &unk_263FD1360;
    void block[4] = v5;
    dispatch_async(operationQueue, block);
  }
  else
  {
    self;
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = @"Manager is in invalid state for this operation";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v10 = (void *)[v8 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v9];

    -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)self, v4, v10);
  }
LABEL_6:
}

void __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[9];
  }
  id v3 = v2;
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_2;
  v5[3] = &unk_263FD1388;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux startDiscoveryForPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Starting pairing discovery failed: %@", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      -[NRDevicePairingManager invalidateWithError:](v10, v3);
    }
    else
    {
      uint64_t v11 = WeakRetained;
      objc_sync_enter(v11);
      uint64_t v12 = v11[1];
      objc_sync_exit(v11);

      if (v12 == 4)
      {
        -[NRDevicePairingManager setInternalManagerState:](v11, 5);
        uint64_t v18 = v11[7];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_3;
        block[3] = &unk_263FD1360;
        id v22 = v11;
        dispatch_async(v18, block);

        id v3 = 0;
      }
      else
      {
        if (nrCopyLogObj_onceToken_1261 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d State changed while starting pairing discovery", v13, v14, v15, v16, v17, (uint64_t)"");
        }
        self;
        id v19 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v23 = *MEMORY[0x263F08320];
        v24[0] = @"Manager is in invalid state for this operation";
        uint64_t v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        id v3 = (id)[v19 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v20];
      }
    }
  }
}

uint64_t __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setManagerState:3];
}

- (void)activateWithCompletion:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v11 = nrCopyLogObj_1256();
    uint64_t v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v13) {
        goto LABEL_6;
      }
    }
    id v14 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null completionBlock", v15, v16, v17, v18, v19, (uint64_t)"-[NRDevicePairingManager activateWithCompletion:]");

    goto LABEL_6;
  }
  if (self
    && (uint64_t v5 = self,
        objc_sync_enter(v5),
        unint64_t internalManagerState = v5->_internalManagerState,
        objc_sync_exit(v5),
        v5,
        internalManagerState == 1))
  {
    -[NRDevicePairingManager setInternalManagerState:](v5, 2);
    operationQueue = v5->_operationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__NRDevicePairingManager_activateWithCompletion___block_invoke;
    block[3] = &unk_263FD1338;
    void block[4] = v5;
    id v21 = v4;
    dispatch_async(operationQueue, block);
  }
  else
  {
    self;
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Manager is in invalid state for this operation";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v10 = (void *)[v8 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v9];

    -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)self, v4, v10);
  }
LABEL_6:
}

void __49__NRDevicePairingManager_activateWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[9];
  }
  id v3 = v2;
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__NRDevicePairingManager_activateWithCompletion___block_invoke_2;
  v5[3] = &unk_263FD1310;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  -[NRDevicePairingManagerMux registerPairingManager:withCompletion:]((uint64_t)v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__NRDevicePairingManager_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1261 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d Registering pairing manager failed: %@", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      char v11 = 0;
      uint64_t v12 = v3;
    }
    else
    {
      id v14 = WeakRetained;
      objc_sync_enter(v14);
      uint64_t v15 = v14[1];
      objc_sync_exit(v14);

      if (v15 == 2)
      {
        -[NRDevicePairingManager setInternalManagerState:](v14, 3);
        uint64_t v12 = 0;
        char v11 = 1;
      }
      else
      {
        if (nrCopyLogObj_onceToken_1261 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 16, (uint64_t)"%s%.30s:%-4d State changed while registering pairing manager", v16, v17, v18, v19, v20, (uint64_t)"");
        }
        self;
        id v21 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v30 = *MEMORY[0x263F08320];
        v31[0] = @"Manager is in invalid state for this operation";
        uint64_t v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
        uint64_t v12 = (void *)[v21 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v22];

        char v11 = 0;
      }
    }
    uint64_t v23 = v10[7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__NRDevicePairingManager_activateWithCompletion___block_invoke_3;
    block[3] = &unk_263FD12E8;
    char v29 = v11;
    id v24 = v10;
    id v26 = v24;
    id v28 = *(id *)(a1 + 32);
    id v13 = v12;
    id v27 = v13;
    dispatch_async(v23, block);
    if (v3) {
      -[NRDevicePairingManager invalidateWithError:](v24, v13);
    }
  }
  else
  {
    id v13 = v3;
  }
}

uint64_t __49__NRDevicePairingManager_activateWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) setManagerState:2];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (NSString)fullDescription
{
  id v2 = self;
  if (self) {
    self = (NRDevicePairingManager *)self->_managerInfo;
  }
  id v3 = [(NRDevicePairingManager *)self fullDescription];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @" State %zu", -[NRDevicePairingManager managerState](v2, "managerState"));
  return (NSString *)v4;
}

- (id)description
{
  if (self) {
    self = (NRDevicePairingManager *)self->_managerInfo;
  }
  return [(NRDevicePairingManager *)self description];
}

- (void)dealloc
{
  if (nrCopyLogObj_onceToken_1261 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1263, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1263, 0, (uint64_t)"%s%.30s:%-4d Dealloc %@", v2, v3, v4, v5, v6, (uint64_t)"");
  }
  v8.receiver = self;
  v8.super_class = (Class)NRDevicePairingManager;
  [(NRDevicePairingManager *)&v8 dealloc];
}

- (NRDevicePairingManager)initWithIdentifier:(id)a3 pairingCriteria:(id)a4 metadata:(id)a5 queue:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!v11)
  {
    id v26 = nrCopyLogObj_1256();
    id v27 = v26;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v43 = os_log_type_enabled(v26, OS_LOG_TYPE_FAULT);

      if (!v43) {
        goto LABEL_29;
      }
    }
    id v44 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v44, 17, (uint64_t)"%s called with null pairingCriteria", v45, v46, v47, v48, v49, (uint64_t)"-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]");
LABEL_28:

    id v24 = 0;
    goto LABEL_11;
  }
  if (!v13)
  {
    id v28 = nrCopyLogObj_1256();
    char v29 = v28;
    if (sNRCopyLogToStdErr)
    {

LABEL_27:
      id v44 = nrCopyLogObj_1256();
      _NRLogWithArgs((uint64_t)v44, 17, (uint64_t)"%s called with null queue", v51, v52, v53, v54, v55, (uint64_t)"-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]");
      goto LABEL_28;
    }
    BOOL v50 = os_log_type_enabled(v28, OS_LOG_TYPE_FAULT);

    if (v50) {
      goto LABEL_27;
    }
LABEL_29:
    id v24 = 0;
    goto LABEL_11;
  }
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
  id WeakRetained = (NRDevicePairingManagerMux *)objc_loadWeakRetained(&copySharedInstance_gSharedInstance);
  if (WeakRetained)
  {
    uint64_t v16 = WeakRetained;
    os_unfair_lock_unlock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
    goto LABEL_6;
  }
  uint64_t v16 = objc_alloc_init(NRDevicePairingManagerMux);
  objc_storeWeak(&copySharedInstance_gSharedInstance, v16);
  os_unfair_lock_unlock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
  if (v16)
  {
LABEL_6:
    v63.receiver = self;
    v63.super_class = (Class)NRDevicePairingManager;
    uint64_t v17 = [(NRDevicePairingManager *)&v63 init];
    if (v17)
    {
      p_isa = (id *)&v17->super.isa;
      uint64_t v19 = objc_alloc_init(NRDevicePairingManagerInfo);
      id v20 = p_isa[11];
      p_isa[11] = v19;

      id v21 = (void *)[v10 copy];
      [p_isa[11] setIdentifier:v21];

      uint64_t v22 = (void *)[v11 copy];
      [p_isa[11] setPairingCriteria:v22];

      uint64_t v23 = (void *)[v12 copy];
      [p_isa[11] setMetadata:v23];

      objc_storeStrong(p_isa + 7, a6);
      if (nrXPCCopyQueue_onceToken != -1) {
        dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
      }
      objc_storeStrong(p_isa + 8, (id)nrXPCCopyQueue_nrXPCQueue);
      -[NRDevicePairingManager setInternalManagerState:](p_isa, 1);
      [p_isa setManagerState:1];
      objc_storeStrong(p_isa + 9, v16);
      self = p_isa;
      id v24 = self;
      goto LABEL_10;
    }
    uint64_t v30 = nrCopyLogObj_1256();
    uint64_t v31 = v30;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (!v32)
      {
LABEL_23:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v41 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v41 = 136446210;
        *(void *)(v41 + 4) = "-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]";
        id v42 = nrCopyLogObj_1256();
        _NRLogAbortWithPack(v42);
      }
    }
    id v35 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v35, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v36, v37, v38, v39, v40, (uint64_t)"");

    goto LABEL_23;
  }
  uint64_t v33 = nrCopyLogObj_1256();
  uint64_t v34 = v33;
  if (sNRCopyLogToStdErr)
  {

LABEL_31:
    id v57 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v57, 17, (uint64_t)"%s called with null pairingManagerMux", v58, v59, v60, v61, v62, (uint64_t)"-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]");

    goto LABEL_32;
  }
  BOOL v56 = os_log_type_enabled(v33, OS_LOG_TYPE_FAULT);

  if (v56) {
    goto LABEL_31;
  }
LABEL_32:
  uint64_t v16 = 0;
  id v24 = 0;
LABEL_10:

LABEL_11:
  return v24;
}

+ (void)unpairDevice:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    self;
    os_unfair_lock_lock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
    id WeakRetained = (NRDevicePairingManagerMux *)objc_loadWeakRetained(&copySharedInstance_gSharedInstance);
    if (!WeakRetained)
    {
      id WeakRetained = objc_alloc_init(NRDevicePairingManagerMux);
      objc_storeWeak(&copySharedInstance_gSharedInstance, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__NRDevicePairingManager_unpairDevice_withCompletion___block_invoke;
    v16[3] = &unk_263FD1400;
    id v17 = v5;
    id v18 = v6;
    -[NRDevicePairingManagerMux unpairDevice:withCompletion:]((uint64_t)WeakRetained, v17, v16);
  }
  else
  {
    objc_super v8 = nrCopyLogObj_1256();
    uint64_t v9 = v8;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

      if (!v10) {
        goto LABEL_6;
      }
    }
    id WeakRetained = (NRDevicePairingManagerMux *)nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)WeakRetained, 17, (uint64_t)"%s called with null nrDeviceIdentifier", v11, v12, v13, v14, v15, (uint64_t)"+[NRDevicePairingManager unpairDevice:withCompletion:]");
  }

LABEL_6:
}

uint64_t __54__NRDevicePairingManager_unpairDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (v17)
  {
    uint64_t v3 = [*(id *)(a1 + 32) nrDeviceIdentifier];
    os_log_t v4 = _NRCopyLogObjectForNRUUID(v3);
    os_log_t v5 = v4;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

      if (!v6) {
        goto LABEL_6;
      }
    }
    uint64_t v7 = [*(id *)(a1 + 32) nrDeviceIdentifier];
    os_log_t v8 = _NRCopyLogObjectForNRUUID(v7);
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d unpairing failed: %@", v9, v10, v11, v12, v13, (uint64_t)"");
  }
LABEL_6:
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v17;
  if (v14)
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t, id))(v14 + 16))(v14, v17);
    id v15 = v17;
  }
  return MEMORY[0x270F9A758](v14, v15);
}

+ (uint64_t)copyXPCError
{
  v5[1] = *MEMORY[0x263EF8340];
  self;
  id v0 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v4 = *MEMORY[0x263F08320];
  v5[0] = @"An XPC connection error occurred";
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = [v0 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v1];

  return v2;
}

+ (uint64_t)copyErrorForCode:(uint64_t)a1
{
  self;
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  return [v3 initWithDomain:@"NRDevicePairingErrorDomain" code:a2 userInfo:0];
}

void __46__NRDevicePairingManager_discoveredCandidate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) candidateDiscoveredHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

void __40__NRDevicePairingManager_lostCandidate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) candidateLostHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

void __64__NRDevicePairingManager_receivedRequestForAuthMethod_authData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authRequestHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __59__NRDevicePairingManager_pairingSucceededWithPairedDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setManagerState:2];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)pairingFailedWithError:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = v4[1];
    objc_sync_exit(v4);

    if (v5 == 8)
    {
      id v7 = objc_getProperty(v4, v6, 80, 1);
      objc_setProperty_atomic_copy(v4, v8, 0, 80);
      -[NRDevicePairingManager setInternalManagerState:](v4, 3);
      uint64_t v9 = v4[7];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__NRDevicePairingManager_pairingFailedWithError___block_invoke;
      block[3] = &unk_263FD1478;
      void block[4] = v4;
      id v13 = v7;
      id v12 = v3;
      id v10 = v7;
      dispatch_async(v9, block);
    }
  }
}

uint64_t __49__NRDevicePairingManager_pairingFailedWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setManagerState:2];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end