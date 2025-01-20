@interface STStatusDomainXPCServerHandle
+ (id)sharedMachServiceServerHandle;
- (NSString)description;
- (STStatusDomainXPCServerHandle)init;
- (STStatusDomainXPCServerHandle)initWithXPCConnectionProvider:(id)a3 serverLaunchObservable:(id)a4;
- (dispatch_queue_t)_internalQueue_dataForDomain:(dispatch_queue_t *)a1;
- (id)dataForDomain:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)serverDataForDomains:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_internalQueue_sendClientsData:(unint64_t)a3 forDomain:(void *)a4 withChangeContext:;
- (void)_internalQueue_setupXPCConnectionIfNecessary;
- (void)_reregisterForDomainsIfNecessary;
- (void)_tearDownXPCConnection;
- (void)dealloc;
- (void)didObserveServerLaunch:(id)a3;
- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5;
- (void)observeDiff:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5;
- (void)registerClient:(id)a3 forDomain:(unint64_t)a4;
- (void)removeClient:(id)a3 forDomain:(unint64_t)a4;
- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5;
@end

@implementation STStatusDomainXPCServerHandle

void __47__STStatusDomainXPCServerHandle_dataForDomain___block_invoke(uint64_t a1)
{
  -[STStatusDomainXPCServerHandle _internalQueue_dataForDomain:](*(dispatch_queue_t **)(a1 + 32), *(void *)(a1 + 48));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (dispatch_queue_t)_internalQueue_dataForDomain:(dispatch_queue_t *)a1
{
  if (a1)
  {
    v4 = a1;
    dispatch_assert_queue_V2(a1[3]);
    a1 = [v4[1] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

void __73__STStatusDomainXPCServerHandle_observeDiff_forDomain_withChangeContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    uint64_t v2 = STSystemStatusLogObservation();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = STSystemStatusDescriptionForDomain(*(void *)(a1 + 56));
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v9 = 138543874;
      v10 = v3;
      __int16 v11 = 2114;
      uint64_t v12 = v4;
      __int16 v13 = 2114;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1D9514000, v2, OS_LOG_TYPE_DEFAULT, "Received diff for %{public}@ domain: %{public}@ -- context: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  v6 = -[STStatusDomainXPCServerHandle _internalQueue_dataForDomain:](*(dispatch_queue_t **)(a1 + 48), *(void *)(a1 + 56));
  v7 = v6;
  if (v6)
  {
    [v6 applyDiff:*(void *)(a1 + 32)];
    v8 = (void *)[v7 copyWithZone:0];
    -[STStatusDomainXPCServerHandle _internalQueue_sendClientsData:forDomain:withChangeContext:](*(void *)(a1 + 48), v8, *(void *)(a1 + 56), *(void **)(a1 + 40));
  }
}

- (void)_internalQueue_sendClientsData:(unint64_t)a3 forDomain:(void *)a4 withChangeContext:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      int v9 = STSystemStatusLogObservation();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = STSystemStatusDescriptionForDomain(a3);
        *(_DWORD *)buf = 138543874;
        v21 = v10;
        __int16 v22 = 2114;
        id v23 = v7;
        __int16 v24 = 2114;
        id v25 = v8;
        _os_log_impl(&dword_1D9514000, v9, OS_LOG_TYPE_DEFAULT, "Sending data to observers for %{public}@ domain: %{public}@ -- context: %{public}@", buf, 0x20u);
      }
    }
    __int16 v11 = [*(id *)(a1 + 16) objectForKey:a3];
    uint64_t v12 = (void *)[v11 copy];

    __int16 v13 = *(NSObject **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__STStatusDomainXPCServerHandle__internalQueue_sendClientsData_forDomain_withChangeContext___block_invoke;
    v15[3] = &unk_1E6B634A8;
    id v16 = v12;
    id v17 = v7;
    unint64_t v19 = a3;
    id v18 = v8;
    id v14 = v12;
    dispatch_async(v13, v15);
  }
}

void __92__STStatusDomainXPCServerHandle__internalQueue_sendClientsData_forDomain_withChangeContext___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "observeData:forDomain:withChangeContext:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)dataForDomain:(unint64_t)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__0;
  __int16 v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__STStatusDomainXPCServerHandle_dataForDomain___block_invoke;
  block[3] = &unk_1E6B63458;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)observeDiff:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (STIsValidDiffForStatusDomain(v8) && ([v8 isEmpty] & 1) == 0)
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__STStatusDomainXPCServerHandle_observeDiff_forDomain_withChangeContext___block_invoke;
    v11[3] = &unk_1E6B634A8;
    unint64_t v15 = a4;
    id v12 = v8;
    id v13 = v9;
    id v14 = self;
    dispatch_async(internalQueue, v11);
  }
}

+ (id)sharedMachServiceServerHandle
{
  if (qword_1EB5A3538 != -1) {
    dispatch_once(&qword_1EB5A3538, &__block_literal_global_3);
  }
  id v2 = (void *)_MergedGlobals_5;

  return v2;
}

uint64_t __62__STStatusDomainXPCServerHandle_sharedMachServiceServerHandle__block_invoke()
{
  v0 = objc_alloc_init(STStatusDomainXPCServerHandle);
  uint64_t v1 = _MergedGlobals_5;
  _MergedGlobals_5 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (STStatusDomainXPCServerHandle)init
{
  uint64_t v3 = +[STServerLaunchMonitor sharedInstance];
  id v4 = [(STStatusDomainXPCServerHandle *)self initWithXPCConnectionProvider:&__block_literal_global_3 serverLaunchObservable:v3];

  return v4;
}

id __37__STStatusDomainXPCServerHandle_init__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.systemstatus" options:0];

  return v0;
}

- (STStatusDomainXPCServerHandle)initWithXPCConnectionProvider:(id)a3 serverLaunchObservable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STStatusDomainXPCServerHandle;
  id v8 = [(STStatusDomainXPCServerHandle *)&v22 init];
  if (v8)
  {
    id v9 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    dataByDomain = v8->_dataByDomain;
    v8->_dataByDomain = v9;

    __int16 v11 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    clientsByDomain = v8->_clientsByDomain;
    v8->_clientsByDomain = v11;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v15 = BSDispatchQueueCreateSerial();
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [v6 copy];
    id xpcConnectionProvider = v8->_xpcConnectionProvider;
    v8->_id xpcConnectionProvider = (id)v17;

    objc_storeStrong((id *)&v8->_serverLaunchObservable, a4);
    [(STServerLaunchObservable *)v8->_serverLaunchObservable addObserver:v8];
    v21 = v8;
    id v19 = (id)BSLogAddStateCaptureBlockWithTitle();
  }
  return v8;
}

uint64_t __86__STStatusDomainXPCServerHandle_initWithXPCConnectionProvider_serverLaunchObservable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) description];
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (STStatusDomainXPCServerHandle *)self->_serverLaunchObservable;
  }
  [(STStatusDomainXPCServerHandle *)self removeObserver:v2];
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainXPCServerHandle;
  [(STStatusDomainXPCServerHandle *)&v3 dealloc];
}

- (void)registerClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__STStatusDomainXPCServerHandle_registerClient_forDomain___block_invoke;
  block[3] = &unk_1E6B63480;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __58__STStatusDomainXPCServerHandle_registerClient_forDomain___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[2];
  }
  id v10 = v2;
  objc_super v3 = [v10 objectForKey:*(void *)(a1 + 48)];
  if (!v3)
  {
    objc_super v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [v10 setObject:v3 forKey:*(void *)(a1 + 48)];
  }
  [v3 addObject:*(void *)(a1 + 40)];
  if ([v3 count] == 1)
  {
    -[STStatusDomainXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(void *)(a1 + 32));
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      id v4 = (void *)v4[6];
    }
    uint64_t v5 = NSNumber;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = v4;
    id v8 = [v5 numberWithUnsignedInteger:v6];
    id v9 = [*(id *)(a1 + 40) preferredLocalizations];
    [v7 observeDomain:v8 withPreferredLocalizations:v9];
  }
}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if (!*(void *)(a1 + 40))
    {
      id v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      id v3 = *(id *)(a1 + 56);
      id v4 = v2();

      uint64_t v5 = STStatusDomainXPCServerInterface();
      [v4 setRemoteObjectInterface:v5];

      uint64_t v6 = STStatusDomainXPCClientInterface();
      [v4 setExportedInterface:v6];

      [v4 setExportedObject:a1];
      objc_storeStrong((id *)(a1 + 40), v4);
      objc_initWeak(&location, (id)a1);
      [v4 setInterruptionHandler:&__block_literal_global_31];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_32;
      v11[3] = &unk_1E6B630F8;
      objc_copyWeak(&v12, &location);
      [v4 setInvalidationHandler:v11];
      [v4 resume];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_33;
      v9[3] = &unk_1E6B634F8;
      objc_copyWeak(&v10, &location);
      uint64_t v7 = [v4 remoteObjectProxyWithErrorHandler:v9];
      id v8 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)removeClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__STStatusDomainXPCServerHandle_removeClient_forDomain___block_invoke;
  block[3] = &unk_1E6B63480;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

uint64_t __56__STStatusDomainXPCServerHandle_removeClient_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    id v3 = *(void **)(v2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v12 = [v3 objectForKey:a1[6]];
  [v12 removeObject:a1[5]];
  uint64_t v4 = [v12 count];
  uint64_t v5 = v12;
  if (!v4)
  {
    id v6 = (void *)a1[4];
    if (v6) {
      id v6 = (void *)v6[6];
    }
    uint64_t v7 = NSNumber;
    uint64_t v8 = a1[6];
    id v9 = v6;
    id v10 = [v7 numberWithUnsignedInteger:v8];
    [v9 stopObservingDomain:v10];

    uint64_t v5 = v12;
  }

  return MEMORY[0x1F41817F8](v4, v5);
}

- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (STIsValidUserInteractionForStatusDomain(v8))
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__STStatusDomainXPCServerHandle_reportUserInteraction_forClient_domain___block_invoke;
    v11[3] = &unk_1E6B634A8;
    void v11[4] = self;
    unint64_t v14 = a5;
    id v12 = v9;
    id v13 = v8;
    dispatch_async(internalQueue, v11);
  }
}

void __72__STStatusDomainXPCServerHandle_reportUserInteraction_forClient_domain___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[2];
  }
  uint64_t v3 = a1[7];
  uint64_t v4 = v2;
  uint64_t v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:a1[5]];

  if (v6)
  {
    uint64_t v7 = a1[4];
    if (v7) {
      id v8 = *(void **)(v7 + 48);
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[7];
    [v8 reportUserInteraction:v9 forDomain:v10];
  }
}

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8 || STIsValidDataForStatusDomain(v8))
  {
    if (v9)
    {
      if (STIsValidDataChangeContextForStatusDomain(v9)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__STStatusDomainXPCServerHandle_observeData_forDomain_withChangeContext___block_invoke;
    block[3] = &unk_1E6B634D0;
    unint64_t v17 = a4;
    id v14 = v8;
    id v9 = v11;
    id v15 = v9;
    id v16 = self;
    BOOL v18 = v8 == 0;
    dispatch_async(internalQueue, block);
  }
}

void __73__STStatusDomainXPCServerHandle_observeData_forDomain_withChangeContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    uint64_t v2 = STSystemStatusLogObservation();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = STSystemStatusDescriptionForDomain(*(void *)(a1 + 56));
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v12 = 138543874;
      id v13 = v3;
      __int16 v14 = 2114;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1D9514000, v2, OS_LOG_TYPE_DEFAULT, "Received data for %{public}@ domain: %{public}@ -- context: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  int v6 = -[STStatusDomainXPCServerHandle _internalQueue_dataForDomain:](*(dispatch_queue_t **)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v7 = *(void **)(a1 + 48);
  if (*(unsigned char *)(a1 + 64))
  {
    if (v7) {
      id v8 = (void *)v7[1];
    }
    else {
      id v8 = 0;
    }
    [v8 removeObjectForKey:*(void *)(a1 + 56)];
    if (!v6) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v7) {
      uint64_t v7 = (void *)v7[1];
    }
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = v7;
    id v11 = (void *)[v9 mutableCopyWithZone:0];
    [v10 setObject:v11 forKey:*(void *)(a1 + 56)];

    if (!v6)
    {
LABEL_15:
      if (*(unsigned char *)(a1 + 64)) {
        goto LABEL_18;
      }
    }
  }
  if (([v6 isEqual:*(void *)(a1 + 32)] & 1) == 0) {
    -[STStatusDomainXPCServerHandle _internalQueue_sendClientsData:forDomain:withChangeContext:](*(void *)(a1 + 48), *(void **)(a1 + 32), *(void *)(a1 + 56), *(void **)(a1 + 40));
  }
LABEL_18:
}

- (void)didObserveServerLaunch:(id)a3
{
  uint64_t v4 = STSystemStatusLogObservation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D9514000, v4, OS_LOG_TYPE_DEFAULT, "Server launched, re-registering to observe domains if necessary", v5, 2u);
  }

  -[STStatusDomainXPCServerHandle _reregisterForDomainsIfNecessary]((uint64_t)self);
}

- (void)_reregisterForDomainsIfNecessary
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
    uint64_t v3 = [v2 valueForEntitlement:@"com.apple.systemstatus.domains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_6:
      uint64_t v5 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke;
      block[3] = &unk_1E6B633E8;
      void block[4] = a1;
      dispatch_async(v5, block);
      return;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 count];

      if (v4) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    int v6 = STSystemStatusLogObservation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_1D9514000, v6, OS_LOG_TYPE_FAULT, "Server connection rejected due to missing entitlement", v7, 2u);
    }
  }
}

- (id)serverDataForDomains:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  __int16 v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke;
  block[3] = &unk_1E6B63590;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke(uint64_t *a1)
{
  -[STStatusDomainXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1[4]);
  objc_initWeak(&location, (id)a1[4]);
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[5];
  }
  uint64_t v3 = v2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2;
  v10[3] = &unk_1E6B634F8;
  objc_copyWeak(&v11, &location);
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_3;
  v7[3] = &unk_1E6B63568;
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v8 = &__block_literal_global_23;
  uint64_t v9 = v6;
  [v4 serverDataForDomains:v5 reply:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = STSystemStatusLogObservation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 localizedDescription];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy in serverDataForDomains: -- error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[STStatusDomainXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);
}

- (void)_tearDownXPCConnection
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__STStatusDomainXPCServerHandle__tearDownXPCConnection__block_invoke;
    block[3] = &unk_1E6B633E8;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

id __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    id v3 = STValidStatusDomainDataTypes();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2_25;
    v7[3] = &unk_1E6B63540;
    id v4 = v3;
    id v8 = v4;
    uint64_t v9 = &v10;
    [v2 enumerateKeysAndObjectsUsingBlock:v7];
    if (*((unsigned char *)v11 + 24)) {
      id v5 = v2;
    }
    else {
      id v5 = 0;
    }

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2_25(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || ([*(id *)(a1 + 32) containsObject:objc_opt_class()] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)description
{
  return (NSString *)[(STStatusDomainXPCServerHandle *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STStatusDomainXPCServerHandle *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STStatusDomainXPCServerHandle *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STStatusDomainXPCServerHandle *)self succinctDescriptionBuilder];
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E6B635E0;
  id v7 = v5;
  id v12 = v7;
  id v13 = v4;
  uint64_t v14 = self;
  id v8 = v4;
  dispatch_sync(internalQueue, block);
  id v9 = v7;

  return v9;
}

void __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E6B63080;
  v3[4] = a1[6];
  id v4 = v1;
  [v4 appendBodySectionWithName:0 multilinePrefix:v2 block:v3];
}

void __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v4[3] = &unk_1E6B635B8;
  id v5 = *(id *)(a1 + 40);
  id v3 = v2;
  [v3 enumerateWithBlock:v4];
}

void __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = STSystemStatusDescriptionForDomain(a2);
  id v7 = (id)[v5 appendObject:v8 withName:v6];
}

void __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke()
{
  v0 = STSystemStatusLogObservation();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D9514000, v0, OS_LOG_TYPE_DEFAULT, "Server connection interrupted", v1, 2u);
  }
}

void __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_32(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = STSystemStatusLogObservation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1D9514000, v2, OS_LOG_TYPE_DEFAULT, "Server connection invalidated", v3, 2u);
  }

  -[STStatusDomainXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);
}

void __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = STSystemStatusLogObservation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 localizedDescription];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "Server proxy error, re-registering if necessary: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[STStatusDomainXPCServerHandle _reregisterForDomainsIfNecessary]((uint64_t)WeakRetained);
}

void __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke(uint64_t a1)
{
  -[STStatusDomainXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(void *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[2];
  }
  id v3 = v2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      id v4 = (void *)v4[6];
    }
    id v5 = v4;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke_2;
    v7[3] = &unk_1E6B63608;
    id v8 = v5;
    uint64_t v6 = v5;
    [v3 enumerateWithBlock:v7];
  }
}

void __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 anyObject];
  if (v8)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithInteger:a2];
    int v7 = [v8 preferredLocalizations];
    [v5 observeDomain:v6 withPreferredLocalizations:v7];
  }
}

void __55__STStatusDomainXPCServerHandle__tearDownXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_storeStrong((id *)(v1 + 40), 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong(&self->_xpcConnectionProvider, 0);
  objc_storeStrong(&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_clientsByDomain, 0);

  objc_storeStrong((id *)&self->_dataByDomain, 0);
}

@end