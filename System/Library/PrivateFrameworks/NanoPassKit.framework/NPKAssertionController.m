@interface NPKAssertionController
- (NPKAssertionController)initWithAssertionFactory:(id)a3 invalidator:(id)a4;
- (void)_inQueue_releaseAssertionWithOwner:(id)a3;
- (void)_releaseAssertionFromOwnerObject:(id)a3 withDelay:(double)a4 completion:(id)a5;
- (void)createAssertionForOwnerObject:(id)a3 withReason:(id)a4;
- (void)releaseAssertionFromOwnerObject:(id)a3;
- (void)releaseAssertionFromOwnerObject:(id)a3 withDelay:(double)a4;
@end

@implementation NPKAssertionController

- (NPKAssertionController)initWithAssertionFactory:(id)a3 invalidator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPKAssertionController;
  v8 = [(NPKAssertionController *)&v18 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x223C37380](v6);
    id assertionFactory = v8->_assertionFactory;
    v8->_id assertionFactory = (id)v9;

    uint64_t v11 = MEMORY[0x223C37380](v7);
    id assertionInvalidator = v8->_assertionInvalidator;
    v8->_id assertionInvalidator = (id)v11;

    uint64_t v13 = objc_msgSend(MEMORY[0x263F08968], "pk_weakPointerPersonalityToStrongObjectsMapTable");
    assertionMaps = v8->_assertionMaps;
    v8->_assertionMaps = (NSMapTable *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.NanoPassbook.alert.assertionManager", 0);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v15;
  }
  return v8;
}

- (void)createAssertionForOwnerObject:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NPKAssertionController_createAssertionForOwnerObject_withReason___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __67__NPKAssertionController_createAssertionForOwnerObject_withReason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  v3 = [[NPKAssertionWrapper alloc] initWithAssertion:v2 invalidator:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_msgSend(*(id *)(a1 + 32), "_inQueue_releaseAssertionWithOwner:", *(void *)(a1 + 48));
  v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Obtained assertion:%@ for Owner:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v3 forKey:*(void *)(a1 + 48)];
}

- (void)releaseAssertionFromOwnerObject:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__NPKAssertionController_releaseAssertionFromOwnerObject___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __58__NPKAssertionController_releaseAssertionFromOwnerObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_releaseAssertionWithOwner:", *(void *)(a1 + 40));
}

- (void)releaseAssertionFromOwnerObject:(id)a3 withDelay:(double)a4
{
}

- (void)_releaseAssertionFromOwnerObject:(id)a3 withDelay:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke;
  v13[3] = &unk_2644D6850;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      BOOL v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412802;
        double v16 = v2;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v7;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Scheduled to invalidate assertion:%@ for owner:%@ with delay:%f", buf, 0x20u);
      }
    }
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(NSObject **)(v9 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke_49;
    v11[3] = &unk_2644D3540;
    v11[4] = v9;
    id v12 = *(id *)(a1 + 40);
    id v13 = v2;
    id v14 = *(id *)(a1 + 48);
    dispatch_after(v8, v10, v11);
  }
}

void __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke_49(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  int v2 = [*(id *)(a1 + 48) invalidateAssertionExpected:1];
  v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      BOOL v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        int v10 = 138412290;
        uint64_t v11 = v6;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Invalidated assertion:%@", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
  else if (v4)
  {
    dispatch_time_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Fail scheduled invalidation assertion:%@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_inQueue_releaseAssertionWithOwner:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v5 = [(NSMapTable *)self->_assertionMaps objectForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 invalidateAssertionExpected:1];
    dispatch_time_t v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      if (v9)
      {
        int v10 = pk_General_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412546;
          id v13 = v6;
          __int16 v14 = 2112;
          id v15 = v4;
          uint64_t v11 = "Notice: Invalidated assertion:%@ for owner:%@";
LABEL_9:
          _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      int v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        id v13 = v6;
        __int16 v14 = 2112;
        id v15 = v4;
        uint64_t v11 = "Notice: Fail scheduled invalidation assertion:%@ for owner:%@";
        goto LABEL_9;
      }
LABEL_10:
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assertionMaps, 0);
  objc_storeStrong(&self->_assertionInvalidator, 0);
  objc_storeStrong(&self->_assertionFactory, 0);
}

@end