@interface SBSKeyboardFocusService
+ (BKSHIDEventDeferringEnvironment)systemKeyCommandOverlayEnvironment;
- (id)_connection;
- (id)applyAdditionalDeferringRules:(id)a3 whenSceneHasKeyboardFocus:(id)a4 processID:(int)a5;
- (id)setExternalSceneIdentities:(id)a3 forReason:(id)a4;
- (void)dealloc;
- (void)removeKeyboardFocusFromSceneIdentity:(id)a3 processID:(int)a4;
- (void)requestKeyboardFocusForSceneIdentity:(id)a3 processID:(int)a4 completion:(id)a5;
@end

@implementation SBSKeyboardFocusService

+ (BKSHIDEventDeferringEnvironment)systemKeyCommandOverlayEnvironment
{
  if (systemKeyCommandOverlayEnvironment_onceToken != -1) {
    dispatch_once(&systemKeyCommandOverlayEnvironment_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)systemKeyCommandOverlayEnvironment___keyCommandOverlayEnvironment;
  return (BKSHIDEventDeferringEnvironment *)v2;
}

uint64_t __61__SBSKeyboardFocusService_systemKeyCommandOverlayEnvironment__block_invoke()
{
  systemKeyCommandOverlayEnvironment___keyCommandOverlayEnvironment = [MEMORY[0x1E4F4F280] environmentWithIdentifier:@"systemKeyCommandOverlay"];
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSKeyboardFocusService;
  [(SBSKeyboardFocusService *)&v5 dealloc];
}

- (void)requestKeyboardFocusForSceneIdentity:(id)a3 processID:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (v8 && v6)
  {
    v10 = [(SBSKeyboardFocusService *)self _connection];
    v11 = [v10 remoteTarget];
    v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke;
    v13[3] = &unk_1E566C578;
    id v14 = v8;
    id v15 = v9;
    [v11 requestKeyboardFocusForSceneIdentity:v14 pid:v12 completion:v13];
  }
}

void __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 BOOLValue]);
}

- (void)removeKeyboardFocusFromSceneIdentity:(id)a3 processID:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    if (a4)
    {
      id v6 = a3;
      id v9 = [(SBSKeyboardFocusService *)self _connection];
      v7 = [v9 remoteTarget];
      id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
      [v7 removeKeyboardFocusFromSceneIdentity:v6 pid:v8];
    }
  }
}

- (id)applyAdditionalDeferringRules:(id)a3 whenSceneHasKeyboardFocus:(id)a4 processID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
  int v11 = [v10 hasEntitlement:@"com.apple.springboard.keyboardfocusservice"];
  if (!v9 || !v11)
  {

    goto LABEL_9;
  }

  if (!v5)
  {
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  id v30 = 0;
  v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v30];
  id v13 = v30;
  if (v13)
  {
    id v14 = v13;
    id v15 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBSKeyboardFocusService applyAdditionalDeferringRules:whenSceneHasKeyboardFocus:processID:]((uint64_t)v8, v15);
    }

    goto LABEL_9;
  }
  objc_initWeak(&location, self);
  id v18 = objc_alloc(MEMORY[0x1E4F4F838]);
  v19 = [MEMORY[0x1E4F29128] UUID];
  v20 = [v19 UUIDString];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__SBSKeyboardFocusService_applyAdditionalDeferringRules_whenSceneHasKeyboardFocus_processID___block_invoke;
  v25[3] = &unk_1E566C5A0;
  objc_copyWeak(&v27, &location);
  id v21 = v9;
  id v26 = v21;
  int v28 = v5;
  v16 = (void *)[v18 initWithIdentifier:v20 forReason:@"SBSKeyboardFocusService" invalidationBlock:v25];

  v22 = [(SBSKeyboardFocusService *)self _connection];
  v23 = [v22 remoteTarget];
  v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
  [v23 deferAdditionalEnvironments:v12 whenSceneHasKeyboardFocus:v21 pid:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

LABEL_10:
  return v16;
}

void __93__SBSKeyboardFocusService_applyAdditionalDeferringRules_whenSceneHasKeyboardFocus_processID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _connection];
  v3 = [v2 remoteTarget];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
  [v3 stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:v4 pid:v5];
}

- (id)setExternalSceneIdentities:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  externalSceneIdentitiesAssertion = self->_externalSceneIdentitiesAssertion;
  if (!externalSceneIdentitiesAssertion)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__SBSKeyboardFocusService_setExternalSceneIdentities_forReason___block_invoke;
    v15[3] = &unk_1E566B528;
    v15[4] = self;
    id v9 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"SBSKeyboardFocusService-externalSceneIdentities" stateDidChangeHandler:v15];
    v10 = self->_externalSceneIdentitiesAssertion;
    self->_externalSceneIdentitiesAssertion = v9;

    int v11 = self->_externalSceneIdentitiesAssertion;
    v12 = SBLogKeyboardFocus();
    [(BSCompoundAssertion *)v11 setLog:v12];

    externalSceneIdentitiesAssertion = self->_externalSceneIdentitiesAssertion;
  }
  id v13 = [(BSCompoundAssertion *)externalSceneIdentitiesAssertion acquireForReason:v7 withContext:v6];

  return v13;
}

void __64__SBSKeyboardFocusService_setExternalSceneIdentities_forReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v3 context];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 unionSet:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [*(id *)(a1 + 32) _connection];
  int v11 = [v10 remoteTarget];
  [v11 setExternalSceneIdentities:v4];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (void *)MEMORY[0x1E4F50BB8];
    uint64_t v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    uint64_t v6 = +[SBSKeyboardFocusServiceSpecification identifier];
    uint64_t v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

    uint64_t v8 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v8;

    v10 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
    int v11 = self->_connection;
    self->_connection = v10;

    long long v12 = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__SBSKeyboardFocusService__connection__block_invoke;
    v14[3] = &unk_1E566B118;
    v14[4] = self;
    [(BSServiceConnection *)v12 configureConnection:v14];
    [(BSServiceConnection *)self->_connection activate];

    connection = self->_connection;
  }
  return connection;
}

void __38__SBSKeyboardFocusService__connection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSKeyboardFocusServiceSpecification interface];
  [v3 setInterface:v4];

  uint64_t v5 = +[SBSKeyboardFocusServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __38__SBSKeyboardFocusService__connection__block_invoke_2;
  uint64_t v9 = &unk_1E566B0F0;
  objc_copyWeak(&v10, &location);
  [v3 setInvalidationHandler:&v6];
  [v3 setInterruptionHandler:^(void) {
    __block_literal_global_25(v6, v7, v8, v9);
}];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__SBSKeyboardFocusService__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __38__SBSKeyboardFocusService__connection__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__SBSKeyboardFocusService__connection__block_invoke_3_cold_1(v3);
  }

  [v2 activate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalSceneIdentitiesAssertion, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSKeyboardFocusService: error requesting focus for sceneIdentity %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)applyAdditionalDeferringRules:(uint64_t)a1 whenSceneHasKeyboardFocus:(NSObject *)a2 processID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "SBSKeyboardFocusService failed to encode deferring environments: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __38__SBSKeyboardFocusService__connection__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSKeyboardFocusService: connection interrupted, attempting to reactivate", v1, 2u);
}

@end