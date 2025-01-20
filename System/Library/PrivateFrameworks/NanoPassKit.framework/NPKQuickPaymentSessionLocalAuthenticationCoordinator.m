@interface NPKQuickPaymentSessionLocalAuthenticationCoordinator
- (LAContext)completedContext;
- (LAContext)inProgressContext;
- (NPKQuickPaymentSessionLocalAuthenticationCoordinator)initWithCallbackQueue:(id)a3;
- (NPKQuickPaymentSessionLocalAuthenticationCoordinatorCredentialDelegate)credentialDelegate;
- (NSData)completedCredential;
- (NSError)completedError;
- (NSMutableArray)pendingLocalAuthenticationEvents;
- (NSNumber)activeLocalAuthenticationEvent;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)localAuthenticationQueue;
- (id)_nameForLocalAuthenticationEvent:(int64_t)a3;
- (id)completionHandler;
- (int64_t)_credentialTypeForEvent:(int64_t)a3;
- (void)_activateLocalAuthenticationEvent:(int64_t)a3;
- (void)_cancelLocalAuthentication;
- (void)_deactivateLocalAuthenticationEvent:(int64_t)a3;
- (void)_handleLocalAuthenticationPolicyEvaluatedWithContext:(id)a3 error:(id)a4;
- (void)_invokeCompletionHandlerForInvalidationWithError:(id)a3;
- (void)_performDelegateCallback:(id)a3;
- (void)_presentNextLocalAuthenticationEvent;
- (void)beginLocalAuthenticationWithAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 completion:(id)a5;
- (void)beginLocalAuthenticationWithCompletion:(id)a3;
- (void)beginLocalAuthenticationWithPolicy:(int64_t)a3 completion:(id)a4;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)invalidateLocalAuthenticationContexts;
- (void)setActiveLocalAuthenticationEvent:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCompletedContext:(id)a3;
- (void)setCompletedCredential:(id)a3;
- (void)setCompletedError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCredentialDelegate:(id)a3;
- (void)setInProgressContext:(id)a3;
- (void)setLocalAuthenticationQueue:(id)a3;
- (void)setPendingLocalAuthenticationEvents:(id)a3;
@end

@implementation NPKQuickPaymentSessionLocalAuthenticationCoordinator

- (NPKQuickPaymentSessionLocalAuthenticationCoordinator)initWithCallbackQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKQuickPaymentSessionLocalAuthenticationCoordinator;
  v6 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.nanopassbook.lacoordinator", v7);
    localAuthenticationQueue = v6->_localAuthenticationQueue;
    v6->_localAuthenticationQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
  }

  return v6;
}

- (void)beginLocalAuthenticationWithCompletion:(id)a3
{
}

- (void)beginLocalAuthenticationWithPolicy:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  localAuthenticationQueue = self->_localAuthenticationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke;
  block[3] = &unk_2644D40B0;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(localAuthenticationQueue, block);
}

void __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138412290;
      v62 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: begin local authentication with completion:%@", buf, 0xCu);
    }
  }
  id v6 = (void *)MEMORY[0x263F5BD40];
  uint64_t v7 = *MEMORY[0x263F5C4C8];
  v60[0] = *MEMORY[0x263F5C4A8];
  v60[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  uint64_t v58 = *MEMORY[0x263F5C378];
  uint64_t v59 = *MEMORY[0x263F5C400];
  v9 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  [v6 subjects:v8 sendEvent:v9];

  id v10 = *(void **)(a1 + 32);
  if (v10[4])
  {
    int64_t v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: existing completion handler", buf, 2u);
      }
    }
    v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10440] code:-9 userInfo:0];
    [*(id *)(a1 + 32) _invokeCompletionHandlerForInvalidationWithError:v14];

    id v10 = *(void **)(a1 + 32);
  }
  if (v10[5])
  {
    v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: already-completed context", buf, 2u);
      }
    }
    if (*(void *)(a1 + 40))
    {
      id v18 = *(id *)(*(void *)(a1 + 32) + 40);
      id v19 = *(id *)(*(void *)(a1 + 32) + 48);
      id v20 = *(id *)(*(void *)(a1 + 32) + 56);
      uint64_t v21 = *(void *)(a1 + 32);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;

      uint64_t v23 = *(void *)(a1 + 32);
      v24 = *(void **)(v23 + 48);
      *(void *)(v23 + 48) = 0;

      uint64_t v25 = *(void *)(a1 + 32);
      v26 = *(void **)(v25 + 56);
      *(void *)(v25 + 56) = 0;

      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_50;
      v53[3] = &unk_2644D6358;
      v27 = *(void **)(a1 + 32);
      id v28 = *(id *)(a1 + 40);
      id v54 = v18;
      id v55 = v19;
      id v56 = v20;
      id v57 = v28;
      id v29 = v20;
      v30 = v19;
      v31 = v18;
      [v27 _performDelegateCallback:v53];

LABEL_18:
LABEL_19:
    }
  }
  else
  {
    [v10 setCompletionHandler:*(void *)(a1 + 40)];
    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      kdebug_trace();
      v31 = objc_alloc_init(MEMORY[0x263F10468]);
      v34 = pk_Payment_log();
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        v36 = pk_Payment_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v36, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: created new context", buf, 2u);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

      v38 = pk_Payment_log();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);

      if (WeakRetained)
      {
        if (v39)
        {
          v40 = pk_Payment_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E92F000, v40, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: evaluating asynchronously", buf, 2u);
          }
        }
        [v31 setUiDelegate:*(void *)(a1 + 32)];
        v41 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_53;
        block[3] = &unk_2644D3288;
        v42 = v31;
        uint64_t v43 = *(void *)(a1 + 48);
        uint64_t v44 = *(void *)(a1 + 32);
        v50 = v42;
        uint64_t v51 = v44;
        uint64_t v52 = v43;
        dispatch_async(v41, block);

        objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v31);
        v30 = v50;
      }
      else
      {
        if (v39)
        {
          v45 = pk_Payment_log();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E92F000, v45, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: evaluating synchronously", buf, 2u);
          }
        }
        [v31 setUiDelegate:*(void *)(a1 + 32)];
        uint64_t v46 = *(void *)(a1 + 48);
        id v48 = 0;
        id v47 = (id)[v31 evaluatePolicy:v46 options:0 error:&v48];
        v30 = v48;
        [*(id *)(a1 + 32) _handleLocalAuthenticationPolicyEvaluatedWithContext:v31 error:v30];
      }
      goto LABEL_18;
    }
    v32 = pk_Payment_log();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      v31 = pk_Payment_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: in-progress context", buf, 2u);
      }
      goto LABEL_19;
    }
  }
}

uint64_t __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_50(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_53(int8x16_t *a1)
{
  uint64_t v1 = a1[3].i64[0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_2;
  v3[3] = &unk_2644D6380;
  int8x16_t v2 = a1[2];
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  [(id)v2.i64[0] evaluatePolicy:v1 options:0 reply:v3];
}

void __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_3;
  block[3] = &unk_2644D31B0;
  void block[4] = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

uint64_t __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLocalAuthenticationPolicyEvaluatedWithContext:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)beginLocalAuthenticationWithAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  localAuthenticationQueue = self->_localAuthenticationQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke;
  v11[3] = &unk_2644D63D0;
  v11[4] = self;
  id v12 = v8;
  v13 = a3;
  int64_t v14 = a4;
  id v10 = v8;
  dispatch_async(localAuthenticationQueue, v11);
}

void __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke(uint64_t a1)
{
  int8x16_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: begin local authentication with access control", buf, 2u);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[4])
  {
    id v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: existing completion handler", buf, 2u);
      }
    }
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10440] code:-9 userInfo:0];
    [*(id *)(a1 + 32) _invokeCompletionHandlerForInvalidationWithError:v9];

    uint64_t v5 = *(void **)(a1 + 32);
  }
  if (!v5[5])
  {
    [v5 setCompletionHandler:*(void *)(a1 + 40)];
    if (*(void *)(*(void *)(a1 + 32) + 64))
    {
      v27 = pk_Payment_log();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (!v28) {
        return;
      }
      v26 = pk_Payment_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: in-progress context", buf, 2u);
      }
    }
    else
    {
      kdebug_trace();
      id v29 = objc_alloc_init(MEMORY[0x263F10468]);
      v30 = pk_Payment_log();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        v32 = pk_Payment_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v32, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: created new context", buf, 2u);
        }
      }
      BOOL v33 = pk_Payment_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        BOOL v35 = pk_Payment_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: evaluating asynchronously", buf, 2u);
        }
      }
      [v29 setUiDelegate:*(void *)(a1 + 32)];
      v36 = dispatch_get_global_queue(0, 0);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_56;
      v42[3] = &unk_2644D63A8;
      id v37 = v29;
      uint64_t v38 = *(void *)(a1 + 56);
      uint64_t v45 = *(void *)(a1 + 48);
      uint64_t v46 = v38;
      uint64_t v39 = *(void *)(a1 + 32);
      id v43 = v37;
      uint64_t v44 = v39;
      dispatch_async(v36, v42);

      uint64_t v40 = *(void *)(a1 + 32);
      v41 = *(void **)(v40 + 64);
      *(void *)(v40 + 64) = v37;
      v26 = v37;
    }
    goto LABEL_31;
  }
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: already-completed context", buf, 2u);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v13 = *(id *)(*(void *)(a1 + 32) + 40);
    id v14 = *(id *)(*(void *)(a1 + 32) + 48);
    id v15 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(void **)(v18 + 48);
    *(void *)(v18 + 48) = 0;

    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(v20 + 56);
    *(void *)(v20 + 56) = 0;

    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_55;
    v47[3] = &unk_2644D6358;
    v22 = *(void **)(a1 + 32);
    id v23 = *(id *)(a1 + 40);
    id v48 = v13;
    id v49 = v14;
    id v50 = v15;
    id v51 = v23;
    id v24 = v15;
    id v25 = v14;
    v26 = v13;
    [v22 _performDelegateCallback:v47];

LABEL_31:
  }
}

uint64_t __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_55(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_56(int8x16_t *a1)
{
  uint64_t v1 = a1[3].i64[0];
  uint64_t v2 = a1[3].i64[1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_2;
  v4[3] = &unk_2644D6380;
  int8x16_t v3 = a1[2];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  [(id)v3.i64[0] evaluateAccessControl:v1 operation:v2 options:0 reply:v4];
}

void __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_3;
  block[3] = &unk_2644D31B0;
  void block[4] = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

uint64_t __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLocalAuthenticationPolicyEvaluatedWithContext:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)invalidateLocalAuthenticationContexts
{
  int8x16_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: requested invalidate context", buf, 2u);
    }
  }
  localAuthenticationQueue = self->_localAuthenticationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NPKQuickPaymentSessionLocalAuthenticationCoordinator_invalidateLocalAuthenticationContexts__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(localAuthenticationQueue, block);
}

void __93__NPKQuickPaymentSessionLocalAuthenticationCoordinator_invalidateLocalAuthenticationContexts__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 40);
      uint64_t v7 = *(void *)(v5 + 64);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: invalidating context completed:%@ inProgress:%@", (uint8_t *)&v12, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = 0;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:&unk_26D043910];
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _nameForLocalAuthenticationEvent:a3];
      if (v8)
      {
        if ([v8 BOOLValue]) {
          uint64_t v13 = @"activated";
        }
        else {
          uint64_t v13 = @"deactivated";
        }
      }
      else
      {
        uint64_t v13 = @"received";
      }
      __int16 v14 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138413058;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v14;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: LocalAuthentication UI ***** %@ %@ ***** - event: %@ params: %@", buf, 0x2Au);
    }
  }
  if (a3)
  {
    localAuthenticationQueue = self->_localAuthenticationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__NPKQuickPaymentSessionLocalAuthenticationCoordinator_event_params_reply___block_invoke;
    block[3] = &unk_2644D3288;
    id v17 = v8;
    uint64_t v18 = self;
    int64_t v19 = a3;
    dispatch_async(localAuthenticationQueue, block);
  }
}

uint64_t __75__NPKQuickPaymentSessionLocalAuthenticationCoordinator_event_params_reply___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) BOOLValue];
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v2)
  {
    return [v3 _activateLocalAuthenticationEvent:v4];
  }
  else
  {
    return [v3 _deactivateLocalAuthenticationEvent:v4];
  }
}

- (void)_handleLocalAuthenticationPolicyEvaluatedWithContext:(id)a3 error:(id)a4
{
  v43[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = (LAContext *)a3;
  id v7 = (NSError *)a4;
  kdebug_trace();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F5BD40];
    uint64_t v9 = *MEMORY[0x263F5C4C8];
    v40[0] = *MEMORY[0x263F5C4A8];
    v40[1] = v9;
    BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    uint64_t v38 = *MEMORY[0x263F5C378];
    uint64_t v39 = *MEMORY[0x263F5C388];
    BOOL v11 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [v8 subjects:v10 sendEvent:v11];
    int v12 = 0;
  }
  else
  {
    int v12 = [(LAContext *)v6 externalizedContext];
    uint64_t v13 = (void *)MEMORY[0x263F5BD40];
    uint64_t v14 = *MEMORY[0x263F5C4C8];
    v43[0] = *MEMORY[0x263F5C4A8];
    v43[1] = v14;
    BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    uint64_t v41 = *MEMORY[0x263F5C378];
    uint64_t v42 = *MEMORY[0x263F5C3A0];
    BOOL v11 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    [v13 subjects:v10 sendEvent:v11];
  }

  uint64_t v15 = (void *)MEMORY[0x223C37380](self->_completionHandler);
  uint64_t v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    if (v17)
    {
      uint64_t v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v7;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: have completion handler for evaluate policy with error:%@", buf, 0xCu);
      }
    }
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __115__NPKQuickPaymentSessionLocalAuthenticationCoordinator__handleLocalAuthenticationPolicyEvaluatedWithContext_error___block_invoke;
    v31[3] = &unk_2644D6358;
    v32 = v6;
    BOOL v33 = v12;
    BOOL v34 = v7;
    BOOL v35 = v15;
    uint64_t v20 = v7;
    uint64_t v21 = v12;
    __int16 v22 = v6;
    [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _performDelegateCallback:v31];

    completedError = v35;
  }
  else
  {
    if (v17)
    {
      __int16 v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v7;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: no completion handler for evaluate policy with error:%@", buf, 0xCu);
      }
    }
    completedContext = self->_completedContext;
    self->_completedContext = v6;
    __int16 v26 = v6;

    completedCredential = self->_completedCredential;
    self->_completedCredential = v12;
    uint64_t v28 = v12;

    completedError = self->_completedError;
    self->_completedError = v7;
    id v29 = v7;
  }

  inProgressContext = self->_inProgressContext;
  self->_inProgressContext = 0;
}

uint64_t __115__NPKQuickPaymentSessionLocalAuthenticationCoordinator__handleLocalAuthenticationPolicyEvaluatedWithContext_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_activateLocalAuthenticationEvent:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      int64_t v13 = a3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Activating local authentication event %ld", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v8 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self pendingLocalAuthenticationEvents];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self setPendingLocalAuthenticationEvents:v9];
  }
  BOOL v10 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self pendingLocalAuthenticationEvents];
  BOOL v11 = [NSNumber numberWithInteger:a3];
  [v10 addObject:v11];

  [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _presentNextLocalAuthenticationEvent];
}

- (void)_deactivateLocalAuthenticationEvent:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v14 = a3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: Deactivating local authentication with event %ld", buf, 0xCu);
    }
  }
  uint64_t v8 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self activeLocalAuthenticationEvent];
  uint64_t v9 = v8;
  if (v8 && [v8 integerValue] == a3)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__deactivateLocalAuthenticationEvent___block_invoke;
    v12[3] = &unk_2644D3160;
    v12[4] = self;
    v12[5] = a3;
    [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _performDelegateCallback:v12];
    [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self setActiveLocalAuthenticationEvent:0];
  }
  BOOL v10 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self pendingLocalAuthenticationEvents];
  BOOL v11 = [NSNumber numberWithInteger:a3];
  [v10 removeObject:v11];

  [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _presentNextLocalAuthenticationEvent];
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__deactivateLocalAuthenticationEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) credentialDelegate];
  objc_msgSend(v2, "localAuthenticationCoordinator:cancelRequestForCredentialOfType:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_credentialTypeForEvent:", *(void *)(a1 + 40)));
}

- (void)_presentNextLocalAuthenticationEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  id v9 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self pendingLocalAuthenticationEvents];
  if ([v9 count])
  {
    BOOL v3 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self activeLocalAuthenticationEvent];

    if (!v3)
    {
      uint64_t v4 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self pendingLocalAuthenticationEvents];
      uint64_t v5 = [v4 firstObject];
      uint64_t v6 = [v5 integerValue];

      id v7 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self pendingLocalAuthenticationEvents];
      [v7 removeObjectAtIndex:0];

      if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v8 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _credentialTypeForEvent:v6];
        objc_initWeak(&location, self);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke;
        v10[3] = &unk_2644D6448;
        v10[4] = self;
        v11[1] = v8;
        objc_copyWeak(v11, &location);
        v11[2] = (id)v6;
        [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _performDelegateCallback:v10];
        objc_destroyWeak(v11);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
  }
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) credentialDelegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_2;
  v5[3] = &unk_2644D6420;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  [v2 localAuthenticationCoordinator:v3 requestsCredentialOfType:v4 completion:v5];

  objc_destroyWeak(&v6);
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int8x16_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v8 = [v5 dataUsingEncoding:4];
      id v9 = [v7 inProgressContext];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_3;
      v12[3] = &unk_2644D63F8;
      objc_copyWeak(v13, (id *)(a1 + 32));
      v13[1] = *(id *)(a1 + 40);
      [v9 setCredential:v8 forProcessedEvent:v10 credentialType:v11 reply:v12];

      objc_destroyWeak(v13);
    }
    else
    {
      [WeakRetained _cancelLocalAuthentication];
    }
  }
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int8x16_t v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [WeakRetained _nameForLocalAuthenticationEvent:*(void *)(a1 + 40)];
      if (a2)
      {
        uint64_t v11 = @"success";
      }
      else
      {
        uint64_t v11 = [v5 description];
      }
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: setCredential for %@ returned %@", (uint8_t *)&v12, 0x16u);
      if ((a2 & 1) == 0) {
    }
      }
  }
}

- (void)_cancelLocalAuthentication
{
  uint64_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int8x16_t v7 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: Cancelling authentication", v7, 2u);
    }
  }
  id v6 = [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self inProgressContext];
  [v6 invalidate];

  [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self setInProgressContext:0];
}

- (void)_invokeCompletionHandlerForInvalidationWithError:(id)a3
{
  id v4 = a3;
  if (self->_completionHandler)
  {
    id v5 = (void *)MEMORY[0x223C37380]();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __105__NPKQuickPaymentSessionLocalAuthenticationCoordinator__invokeCompletionHandlerForInvalidationWithError___block_invoke;
    v8[3] = &unk_2644D3FF0;
    id v10 = v5;
    id v9 = v4;
    id v7 = v5;
    [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self _performDelegateCallback:v8];
  }
}

uint64_t __105__NPKQuickPaymentSessionLocalAuthenticationCoordinator__invokeCompletionHandlerForInvalidationWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_performDelegateCallback:(id)a3
{
}

- (int64_t)_credentialTypeForEvent:(int64_t)a3
{
  int64_t v3 = -2;
  if (a3 != 3) {
    int64_t v3 = 0;
  }
  if (a3 == 2) {
    return -1;
  }
  else {
    return v3;
  }
}

- (id)_nameForLocalAuthenticationEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 0;
  }
  else {
    return *(&off_2644D6468 + a3);
  }
}

- (NPKQuickPaymentSessionLocalAuthenticationCoordinatorCredentialDelegate)credentialDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_credentialDelegate);
  return (NPKQuickPaymentSessionLocalAuthenticationCoordinatorCredentialDelegate *)WeakRetained;
}

- (void)setCredentialDelegate:(id)a3
{
}

- (OS_dispatch_queue)localAuthenticationQueue
{
  return self->_localAuthenticationQueue;
}

- (void)setLocalAuthenticationQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (LAContext)completedContext
{
  return self->_completedContext;
}

- (void)setCompletedContext:(id)a3
{
}

- (NSData)completedCredential
{
  return self->_completedCredential;
}

- (void)setCompletedCredential:(id)a3
{
}

- (NSError)completedError
{
  return self->_completedError;
}

- (void)setCompletedError:(id)a3
{
}

- (LAContext)inProgressContext
{
  return self->_inProgressContext;
}

- (void)setInProgressContext:(id)a3
{
}

- (NSMutableArray)pendingLocalAuthenticationEvents
{
  return self->_pendingLocalAuthenticationEvents;
}

- (void)setPendingLocalAuthenticationEvents:(id)a3
{
}

- (NSNumber)activeLocalAuthenticationEvent
{
  return self->_activeLocalAuthenticationEvent;
}

- (void)setActiveLocalAuthenticationEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLocalAuthenticationEvent, 0);
  objc_storeStrong((id *)&self->_pendingLocalAuthenticationEvents, 0);
  objc_storeStrong((id *)&self->_inProgressContext, 0);
  objc_storeStrong((id *)&self->_completedError, 0);
  objc_storeStrong((id *)&self->_completedCredential, 0);
  objc_storeStrong((id *)&self->_completedContext, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_localAuthenticationQueue, 0);
  objc_destroyWeak((id *)&self->_credentialDelegate);
}

@end