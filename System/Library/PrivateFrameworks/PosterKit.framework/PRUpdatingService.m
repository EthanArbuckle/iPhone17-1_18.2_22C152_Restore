@interface PRUpdatingService
+ (NSXPCInterface)interfaceToExtension;
+ (id)updatingServiceWithProcess:(id)a3 auditToken:(id)a4 target:(id)a5;
- (BOOL)_hasActiveSessions;
- (BOOL)isValid;
- (BSAuditToken)auditToken;
- (NSError)invalidationError;
- (NSString)bundleIdentifier;
- (RBSTarget)target;
- (id)_acquireSessionForUUID:(id)a3 errorHandler:(id)a4;
- (id)_initWithProcess:(id)a3 auditToken:(id)a4 target:(id)a5;
- (void)_accessUpdatingService:(id)a3 errorHandler:(id)a4;
- (void)_invalidateSession:(id)a3;
- (void)_updateActiveSessions;
- (void)addUpdatingServiceObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeUpdatingServiceObserver:(id)a3;
- (void)setInvalidationError:(id)a3;
- (void)updateConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)updateDescriptors:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
@end

@implementation PRUpdatingService

- (id)_initWithProcess:(id)a3 auditToken:(id)a4 target:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRUpdatingService _initWithProcess:auditToken:target:](a2);
    }
LABEL_15:
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24AB80);
  }
  if (!v11)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"auditToken"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRUpdatingService _initWithProcess:auditToken:target:](a2);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24ABE4);
  }
  v13 = v12;
  if (!v12)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRUpdatingService _initWithProcess:auditToken:target:](a2);
    }
    goto LABEL_15;
  }
  v28.receiver = self;
  v28.super_class = (Class)PRUpdatingService;
  v14 = [(PRUpdatingService *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    invalidationFlag = v14->_invalidationFlag;
    v14->_invalidationFlag = (BSAtomicSignal *)v15;

    objc_storeStrong((id *)&v14->_process, a3);
    objc_storeStrong((id *)&v14->_auditToken, a4);
    objc_storeStrong((id *)&v14->_target, a5);
    v17 = [v10 configuration];
    v18 = [v17 extensionIdentity];
    uint64_t v19 = [v18 bundleIdentifier];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v19;

    uint64_t v21 = objc_opt_new();
    activeSessions = v14->_activeSessions;
    v14->_activeSessions = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v23;
  }
  return v14;
}

+ (id)updatingServiceWithProcess:(id)a3 auditToken:(id)a4 target:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PRUpdatingService alloc] _initWithProcess:v9 auditToken:v8 target:v7];

  return v10;
}

+ (NSXPCInterface)interfaceToExtension
{
  if (interfaceToExtension_onceToken[0] != -1) {
    dispatch_once(interfaceToExtension_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)interfaceToExtension___interfaceToExtension;
  return (NSXPCInterface *)v2;
}

void __41__PRUpdatingService_interfaceToExtension__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA3E2F0];
  v1 = (void *)interfaceToExtension___interfaceToExtension;
  interfaceToExtension___interfaceToExtension = v0;

  v2 = (void *)interfaceToExtension___interfaceToExtension;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v5 forSelector:sel_updateDescriptors_sessionInfo_completion_ argumentIndex:0 ofReply:0];
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSHashTable *)v2->_observers removeAllObjects];
  objc_sync_exit(v2);

  [(PRUpdatingService *)v2 invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)PRUpdatingService;
  [(PRUpdatingService *)&v3 dealloc];
}

- (void)addUpdatingServiceObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeUpdatingServiceObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (BOOL)isValid
{
  return [(BSAtomicSignal *)self->_invalidationFlag hasBeenSignalled] ^ 1;
}

- (void)updateDescriptors:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([(BSAtomicSignal *)self->_invalidationFlag hasBeenSignalled])
  {
    id v11 = [(PRUpdatingService *)self invalidationError];
    v10[2](v10, 0, v11);
  }
  else
  {
    id v12 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke;
    v22[3] = &unk_1E54DC198;
    id v23 = v12;
    v24 = self;
    v25 = v10;
    id v13 = v12;
    v14 = (void *)MEMORY[0x192F91830](v22);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_2;
    v18[3] = &unk_1E54DC1E8;
    id v19 = v8;
    id v20 = v9;
    id v21 = v14;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_4;
    v16[3] = &unk_1E54DC210;
    id v17 = v21;
    id v15 = v21;
    [(PRUpdatingService *)self _accessUpdatingService:v18 errorHandler:v16];
  }
}

void __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
    }
  }
  [*(id *)(a1 + 40) _updateActiveSessions];
}

void __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
        id v22 = 0;
        v14 = [v13 extendContentsReadAccessToAuditToken:0 error:&v22];
        id v15 = v22;
        v16 = v15;
        if (!v14)
        {
          if (!v15)
          {
            v16 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 4);
          }
          [v6 fireError:v16];

          goto LABEL_13;
        }
        [v7 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = (void *)[v7 copy];
  uint64_t v18 = *(void *)(a1 + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_3;
  v19[3] = &unk_1E54DC1C0;
  id v20 = v6;
  id v21 = *(id *)(a1 + 48);
  [v5 updateDescriptors:v17 sessionInfo:v18 completion:v19];

  id v8 = v20;
LABEL_13:
}

uint64_t __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "fireError:");
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = *(void **)(a1 + 32);
    return [v6 noteSessionIsComplete];
  }
}

uint64_t __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  if ([(BSAtomicSignal *)self->_invalidationFlag hasBeenSignalled])
  {
    uint64_t v11 = [(PRUpdatingService *)self invalidationError];
    v10[2](v10, 0, v11);
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke;
    v22[3] = &unk_1E54DC198;
    id v23 = v12;
    long long v24 = self;
    long long v25 = v10;
    id v13 = v12;
    v14 = (void *)MEMORY[0x192F91830](v22);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_2;
    v18[3] = &unk_1E54DC1E8;
    id v19 = v8;
    id v20 = v9;
    id v21 = v14;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_4;
    v16[3] = &unk_1E54DC210;
    id v17 = v21;
    id v15 = v21;
    [(PRUpdatingService *)self _accessUpdatingService:v18 errorHandler:v16];
  }
}

void __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
    }
  }
  [*(id *)(a1 + 40) _updateActiveSessions];
}

void __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v16 = 0;
  id v8 = [v7 extendContentsReadAccessToAuditToken:0 error:&v16];
  id v9 = v16;
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_3;
    v13[3] = &unk_1E54DC238;
    uint64_t v12 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v14 = v6;
    [v5 updateConfiguration:v8 sessionInfo:v12 completion:v13];

    uint64_t v11 = v15;
  }
  else
  {
    uint64_t v11 = v9;
    if (!v9)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 4);
    }
    [v6 fireError:v11];
  }
}

uint64_t __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 noteSessionIsComplete];
}

uint64_t __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_accessUpdatingService:(id)a3 errorHandler:(id)a4
{
  id v6 = (void (**)(id, PRUpdater_toExtension *, void *))a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PRUpdatingService__accessUpdatingService_errorHandler___block_invoke;
  v12[3] = &unk_1E54DC210;
  id v8 = v7;
  id v13 = v8;
  id v9 = (void *)MEMORY[0x192F91830](v12);
  BOOL v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [(PRUpdatingService *)self _acquireSessionForUUID:v10 errorHandler:v9];
  if (v11) {
    v6[2](v6, self->_proxy, v11);
  }
}

uint64_t __57__PRUpdatingService__accessUpdatingService_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicSignal *)self->_invalidationFlag signal])
  {
    objc_super v3 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 5);
    uint64_t v4 = self;
    objc_sync_enter(v4);
    [(NSMutableDictionary *)v4->_activeSessions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_79];
    [(NSMutableDictionary *)v4->_activeSessions removeAllObjects];
    [(NSXPCConnection *)v4->_connection invalidate];
    connection = v4->_connection;
    v4->_connection = 0;

    process = v4->_process;
    v4->_process = 0;

    auditToken = v4->_auditToken;
    v4->_auditToken = 0;

    target = v4->_target;
    v4->_target = 0;

    id v9 = [(NSHashTable *)v4->_observers allObjects];
    BOOL v10 = [v9 objectEnumerator];

    [(PRUpdatingService *)v4 setInvalidationError:v3];
    objc_sync_exit(v4);

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "updatingService:didInvalidateWithError:", v4, v3, (void)v16);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    [(PRUpdatingService *)v4 _updateActiveSessions];
  }
}

uint64_t __31__PRUpdatingService_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (BOOL)_hasActiveSessions
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableDictionary *)v2->_activeSessions count] && v2->_connection && v2->_proxy != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)_acquireSessionForUUID:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  objc_initWeak(&location, self);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_proxy) {
    goto LABEL_2;
  }
  process = v8->_process;
  id v30 = 0;
  uint64_t v17 = [(_EXExtensionProcess *)process newXPCConnectionWithError:&v30];
  id v18 = v30;
  connection = v8->_connection;
  v8->_connection = (NSXPCConnection *)v17;

  if (!v18)
  {
    uint64_t v21 = v8->_connection;
    id v22 = +[PRUpdatingService interfaceToExtension];
    [(NSXPCConnection *)v21 setRemoteObjectInterface:v22];

    id v23 = v8->_connection;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke;
    v29[3] = &unk_1E54DC280;
    v29[4] = &v31;
    uint64_t v24 = [(NSXPCConnection *)v23 synchronousRemoteObjectProxyWithErrorHandler:v29];
    proxy = v8->_proxy;
    v8->_proxy = (PRUpdater_toExtension *)v24;

    [(NSXPCConnection *)v8->_connection resume];
LABEL_2:
    id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
    BOOL v10 = [v6 UUIDString];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke_2;
    v26[3] = &unk_1E54DC2A8;
    objc_copyWeak(&v28, &location);
    id v11 = v6;
    id v27 = v11;
    uint64_t v12 = (void *)[v9 initWithIdentifier:v10 forReason:@"accessUpdatingService" invalidationBlock:v26];

    uint64_t v13 = [[_PRUpdatingSession alloc] initWithConnectionAssertion:v12 errorHandler:v7];
    uint64_t v14 = (void *)v32[5];
    v32[5] = (uint64_t)v13;

    [(NSMutableDictionary *)v8->_activeSessions setObject:v32[5] forKey:v11];
    objc_destroyWeak(&v28);
    objc_sync_exit(v8);

    id v15 = (id)v32[5];
    goto LABEL_5;
  }
  v7[2](v7, v18);

  objc_sync_exit(v8);
  id v15 = 0;
LABEL_5:
  _Block_object_dispose(&v31, 8);

  objc_destroyWeak(&location);
  return v15;
}

uint64_t __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) fireError:a2];
}

void __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _invalidateSession:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_invalidateSession:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_activeSessions removeObjectForKey:v5];
  [(PRUpdatingService *)v4 _updateActiveSessions];
  objc_sync_exit(v4);
}

- (void)_updateActiveSessions
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [(NSMutableDictionary *)obj->_activeSessions count];
  id v3 = obj;
  if (!v2)
  {
    connection = obj->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection invalidate];
      id v5 = obj->_connection;
      obj->_connection = 0;

      id v3 = obj;
    }
    proxy = v3->_proxy;
    if (proxy)
    {
      v3->_proxy = 0;

      id v3 = obj;
    }
  }
  objc_sync_exit(v3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (RBSTarget)target
{
  return self->_target;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInvalidationError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)_initWithProcess:(const char *)a1 auditToken:target:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithProcess:(const char *)a1 auditToken:target:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithProcess:(const char *)a1 auditToken:target:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end