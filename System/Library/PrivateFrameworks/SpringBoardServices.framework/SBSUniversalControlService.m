@interface SBSUniversalControlService
+ (id)new;
+ (id)sharedInstance;
- (NSString)description;
- (SBSUniversalControlService)init;
- (id)_ownedRectEdgeMaskAsNumber;
- (id)acquireScreenEdgeOwnershipForPointerEvents:(unint64_t)a3 forReason:(id)a4;
- (id)disableKeyboardFocusOnCurrentDeviceForReason:(id)a3;
- (uint64_t)screenEdgeOwnershipAssertion;
- (uint64_t)serverConnection;
- (void)_connectToServer;
- (void)_init;
- (void)setDisableKeyboardFocusAssertion:(uint64_t)a1;
- (void)setScreenEdgeOwnershipAssertion:(uint64_t)a1;
- (void)setServerConnection:(uint64_t)a1;
@end

@implementation SBSUniversalControlService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance_service_2;
  return v2;
}

uint64_t __44__SBSUniversalControlService_sharedInstance__block_invoke()
{
  sharedInstance_service_2 = (uint64_t)-[SBSUniversalControlService _init]([SBSUniversalControlService alloc]);
  return MEMORY[0x1F41817F8]();
}

- (void)_init
{
  if (!a1) {
    return 0;
  }
  v23.receiver = a1;
  v23.super_class = (Class)SBSUniversalControlService;
  v1 = [super init];
  if (v1)
  {
    objc_initWeak(&location, v1);
    v2 = (void *)MEMORY[0x1E4F4F6E8];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__SBSUniversalControlService__init__block_invoke;
    v20[3] = &unk_1E566BAB8;
    objc_copyWeak(&v21, &location);
    uint64_t v3 = [v2 assertionWithIdentifier:@"DisableDeviceKeyboardFocus" stateDidChangeHandler:v20];
    v4 = (void *)v1[3];
    v1[3] = v3;

    v5 = (void *)v1[3];
    v6 = SBLogKeyboardFocus();
    [v5 setLog:v6];

    v7 = (void *)MEMORY[0x1E4F4F6E8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35__SBSUniversalControlService__init__block_invoke_2;
    v17[3] = &unk_1E566D9D8;
    objc_copyWeak(&v19, &location);
    v1 = v1;
    id v18 = v1;
    uint64_t v8 = [v7 assertionWithIdentifier:@"ScreenEdgeOwnership" stateDidChangeHandler:v17];
    v9 = (void *)v1[4];
    v1[4] = v8;

    v10 = (void *)v1[4];
    v11 = SBLogKeyboardFocus();
    [v10 setLog:v11];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.springboard.universal-control-client-queue", 0);
    v13 = (void *)v1[2];
    v1[2] = v12;

    objc_copyWeak(&v16, &location);
    id v14 = (id)BSLogAddStateCaptureBlockWithTitle();
    -[SBSUniversalControlService _connectToServer]((uint64_t)v1);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v1;
}

+ (id)new
{
  v4 = [NSString stringWithFormat:@"cannot +new SBSUniversalControlService -- use +sharedInstance"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    dispatch_queue_t v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    id v16 = @"SBSUniversalControlService.m";
    __int16 v17 = 1024;
    int v18 = 51;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18FBC5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (SBSUniversalControlService)init
{
  v4 = [NSString stringWithFormat:@"cannot -init SBSUniversalControlService -- use +sharedInstance"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    dispatch_queue_t v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"SBSUniversalControlService.m";
    __int16 v17 = 1024;
    int v18 = 56;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18FBC5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (SBSUniversalControlService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __35__SBSUniversalControlService__init__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained[5] remoteTarget];
    v6 = [MEMORY[0x1E4F28ED0] numberWithBool:[v7 isActive]];
    [v5 setKeyboardFocusDisabled:v6 reason:@"wants it"];
  }
}

void __35__SBSUniversalControlService__init__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = -[SBSUniversalControlService _ownedRectEdgeMaskAsNumber](*(void *)(a1 + 32));
    uint64_t v3 = [WeakRetained[5] remoteTarget];
    [v3 setScreenEdgesOwned:v2 reason:@"wants it"];
  }
}

- (id)_ownedRectEdgeMaskAsNumber
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 32) context];
    v2 = [v1 bs_reduce:&unk_1EDF59498 block:&__block_literal_global_38];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __35__SBSUniversalControlService__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)_connectToServer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F50BB8];
    uint64_t v3 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v4 = +[SBSUniversalControlInterfaceSpecification identifier];
    v5 = [v2 endpointForMachName:v3 service:v4 instance:0];

    uint64_t v6 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
    id v7 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v6;

    uint64_t v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__SBSUniversalControlService__connectToServer__block_invoke;
    v11[3] = &unk_1E566B118;
    v11[4] = a1;
    [v8 configureConnection:v11];
    int v9 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) activate];
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [v3 appendProem:self block:&__block_literal_global_28];
  id v4 = (id)[v3 appendObject:self->_disableKeyboardFocusAssertion withName:@"disableKeyboardFocusAssertion"];
  id v5 = (id)[v3 appendObject:self->_screenEdgeOwnershipAssertion withName:@"screenEdgeOwnershipAssertion"];
  uint64_t v6 = [v3 description];

  return (NSString *)v6;
}

- (id)disableKeyboardFocusOnCurrentDeviceForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_disableKeyboardFocusAssertion acquireForReason:a3];
}

- (id)acquireScreenEdgeOwnershipForPointerEvents:(unint64_t)a3 forReason:(id)a4
{
  screenEdgeOwnershipAssertion = self->_screenEdgeOwnershipAssertion;
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  uint64_t v8 = [v6 numberWithUnsignedInteger:a3];
  int v9 = [(BSCompoundAssertion *)screenEdgeOwnershipAssertion acquireForReason:v7 withContext:v8];

  return v9;
}

uint64_t __56__SBSUniversalControlService__ownedRectEdgeMaskAsNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  unsigned int v6 = [a2 unsignedIntValue];
  int v7 = [v5 unsignedIntValue];

  return [v4 numberWithUnsignedInt:v7 | v6];
}

void __46__SBSUniversalControlService__connectToServer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSUniversalControlInterfaceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[SBSUniversalControlInterfaceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v3 setActivationHandler:&__block_literal_global_44];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SBSUniversalControlService__connectToServer__block_invoke_45;
  v6[3] = &unk_1E566C9D8;
  v6[4] = *(void *)(a1 + 32);
  [v3 setInterruptionHandler:v6];
  [v3 setInvalidationHandler:&__block_literal_global_48_0];
}

void __46__SBSUniversalControlService__connectToServer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __46__SBSUniversalControlService__connectToServer__block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [v3 activate];
  id v5 = [v3 remoteTarget];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:[*(id *)(*(void *)(a1 + 32) + 24) isActive]];
  [v5 setKeyboardFocusDisabled:v6 reason:@"wants it"];

  int v7 = -[SBSUniversalControlService _ownedRectEdgeMaskAsNumber](*(void *)(a1 + 32));
  [v5 setScreenEdgesOwned:v7 reason:@"wants it"];
}

void __46__SBSUniversalControlService__connectToServer__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setDisableKeyboardFocusAssertion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (uint64_t)screenEdgeOwnershipAssertion
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setScreenEdgeOwnershipAssertion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)serverConnection
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)setServerConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_screenEdgeOwnershipAssertion, 0);
  objc_storeStrong((id *)&self->_disableKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end