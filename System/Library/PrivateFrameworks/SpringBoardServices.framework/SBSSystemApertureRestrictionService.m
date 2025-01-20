@interface SBSSystemApertureRestrictionService
- (SBSSystemApertureRestrictionService)init;
- (id)acquireRestrictSystemApertureLayoutToInertAssertionWithReason:(id)a3;
- (id)acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithReason:(id)a3;
- (id)acquireSystemApertureCompleteSuppressionAssertionWithReason:(id)a3;
- (void)invalidate;
@end

@implementation SBSSystemApertureRestrictionService

- (SBSSystemApertureRestrictionService)init
{
  v21.receiver = self;
  v21.super_class = (Class)SBSSystemApertureRestrictionService;
  v3 = [(SBSSystemApertureRestrictionService *)&v21 init];
  if (v3)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.springboard"];

    if (v6)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v3, @"SBSSystemApertureRestrictionService.m", 42, @"Within SpringBoard, use SBSystemApertureController API directly." object file lineNumber description];
    }
    v3->_isValid = 1;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v8;

    v10 = (void *)MEMORY[0x1E4F50BB8];
    v11 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v12 = +[SBSSystemApertureRestrictionServiceSpecification identifier];
    v13 = [v10 endpointForMachName:v11 service:v12 instance:0];

    uint64_t v14 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v13];
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v14;

    v16 = v3->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__SBSSystemApertureRestrictionService_init__block_invoke;
    v19[3] = &unk_1E566B118;
    v20 = v3;
    [(BSServiceConnection *)v16 configureConnection:v19];
    [(BSServiceConnection *)v3->_connection activate];
  }
  return v3;
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[SBSSystemApertureRestrictionServiceSpecification interface];
  [v5 setInterface:v3];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  v4 = +[SBSSystemApertureRestrictionServiceSpecification serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v5 setInvalidationHandler:&__block_literal_global_9];
  [v5 setInterruptionHandler:&__block_literal_global_15];
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_2()
{
  v0 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__SBSSystemApertureRestrictionService_init__block_invoke_2_cold_1(v0);
  }
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __43__SBSSystemApertureRestrictionService_init__block_invoke_13_cold_1(v3);
  }

  [v2 activate];
}

- (void)invalidate
{
  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_restrictToInertAssertion);
  [WeakRetained invalidate];

  id v5 = objc_loadWeakRetained((id *)&self->_completeSuppressionAssertion);
  [v5 invalidate];

  self->_isValid = 0;
}

- (id)acquireRestrictSystemApertureLayoutToInertAssertionWithReason:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSSystemApertureRestrictionService.m", 79, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  if (!self->_isValid)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSSystemApertureRestrictionService.m" lineNumber:80 description:@"Attempted to use restriction service after invalidation."];
  }
  p_restrictToInertAssertion = &self->_restrictToInertAssertion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restrictToInertAssertion);
  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [(BSServiceConnection *)self->_connection remoteTarget];
    v9 = [v8 acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason:v5];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
      v11 = [v9 UUIDString];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __101__SBSSystemApertureRestrictionService_acquireRestrictSystemApertureLayoutToInertAssertionWithReason___block_invoke;
      v15[3] = &unk_1E566B608;
      objc_copyWeak(&v16, &location);
      id WeakRetained = (id)[v10 initWithIdentifier:v11 forReason:v5 invalidationBlock:v15];

      objc_storeWeak((id *)p_restrictToInertAssertion, WeakRetained);
      objc_destroyWeak(&v16);
    }
    else
    {
      id WeakRetained = 0;
    }

    objc_destroyWeak(&location);
  }

  return WeakRetained;
}

void __101__SBSSystemApertureRestrictionService_acquireRestrictSystemApertureLayoutToInertAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __101__SBSSystemApertureRestrictionService_acquireRestrictSystemApertureLayoutToInertAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 3;
    uint64_t v8 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 3);
    id v5 = *(id *)(a1 + 32);

    id WeakRetained = v8;
    if (v4 == v5)
    {
      int v6 = [v8[1] remoteTarget];
      v7 = [*(id *)(a1 + 32) identifier];
      [v6 invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier:v7];

      objc_storeWeak(v3, 0);
      id WeakRetained = v8;
    }
  }
}

- (id)acquireSystemApertureCompleteSuppressionAssertionWithReason:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSSystemApertureRestrictionService.m", 103, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  if (!self->_isValid)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSSystemApertureRestrictionService.m" lineNumber:104 description:@"Attempted to use restriction service after invalidation."];
  }
  p_completeSuppressionAssertion = &self->_completeSuppressionAssertion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_completeSuppressionAssertion);
  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [(BSServiceConnection *)self->_connection remoteTarget];
    v9 = [v8 acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason:v5];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
      v11 = [v9 UUIDString];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __99__SBSSystemApertureRestrictionService_acquireSystemApertureCompleteSuppressionAssertionWithReason___block_invoke;
      v15[3] = &unk_1E566B608;
      objc_copyWeak(&v16, &location);
      id WeakRetained = (id)[v10 initWithIdentifier:v11 forReason:v5 invalidationBlock:v15];

      objc_storeWeak((id *)p_completeSuppressionAssertion, WeakRetained);
      objc_destroyWeak(&v16);
    }
    else
    {
      id WeakRetained = 0;
    }

    objc_destroyWeak(&location);
  }

  return WeakRetained;
}

void __99__SBSSystemApertureRestrictionService_acquireSystemApertureCompleteSuppressionAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __99__SBSSystemApertureRestrictionService_acquireSystemApertureCompleteSuppressionAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 4;
    uint64_t v8 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 4);
    id v5 = *(id *)(a1 + 32);

    id WeakRetained = v8;
    if (v4 == v5)
    {
      int v6 = [v8[1] remoteTarget];
      v7 = [*(id *)(a1 + 32) identifier];
      [v6 invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier:v7];

      objc_storeWeak(v3, 0);
      id WeakRetained = v8;
    }
  }
}

- (id)acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithReason:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSSystemApertureRestrictionService.m", 127, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  if (!self->_isValid)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSSystemApertureRestrictionService.m" lineNumber:128 description:@"Attempted to use restriction service after invalidation."];
  }
  p_emptyHidingSuppressionAssertion = &self->_emptyHidingSuppressionAssertion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emptyHidingSuppressionAssertion);
  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [(BSServiceConnection *)self->_connection remoteTarget];
    v9 = [v8 acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason:v5];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
      v11 = [v9 UUIDString];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __115__SBSSystemApertureRestrictionService_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithReason___block_invoke;
      v15[3] = &unk_1E566B608;
      objc_copyWeak(&v16, &location);
      id WeakRetained = (id)[v10 initWithIdentifier:v11 forReason:v5 invalidationBlock:v15];

      objc_storeWeak((id *)p_emptyHidingSuppressionAssertion, WeakRetained);
      objc_destroyWeak(&v16);
    }
    else
    {
      id WeakRetained = 0;
    }

    objc_destroyWeak(&location);
  }

  return WeakRetained;
}

void __115__SBSSystemApertureRestrictionService_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __115__SBSSystemApertureRestrictionService_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 5;
    uint64_t v8 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 5);
    id v5 = *(id *)(a1 + 32);

    id WeakRetained = v8;
    if (v4 == v5)
    {
      int v6 = [v8[1] remoteTarget];
      v7 = [*(id *)(a1 + 32) identifier];
      [v6 invalidateSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithIdentifier:v7];

      objc_storeWeak(v3, 0);
      id WeakRetained = v8;
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_emptyHidingSuppressionAssertion);
  objc_destroyWeak((id *)&self->_completeSuppressionAssertion);
  objc_destroyWeak((id *)&self->_restrictToInertAssertion);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSSystemApertureRestrictionService connection invalidated remotely; Restriction service terminated. (Do you have th"
    "e required entitlement?)",
    v1,
    2u);
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_13_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSSystemApertureRestrictionService connection interrupted. Reactivating connection.", v1, 2u);
}

@end