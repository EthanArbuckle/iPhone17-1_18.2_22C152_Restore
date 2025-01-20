@interface SUCoreConnectClientPolicy
+ (id)_getAllowlistedClassesForKey:(id)a3;
+ (id)_getSharedClientAccessQueue;
+ (id)_getSharedClientAllowlistedClasses;
+ (id)getAllowlistedClassesForKey:(id)a3;
+ (void)clearAllowlistedClasses;
+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4;
- (BOOL)usesPersistentXPCConnections;
- (NSSet)proxyObjectClasses;
- (NSString)clientID;
- (NSString)clientIDRaw;
- (NSString)description;
- (NSString)serviceName;
- (SUCoreConnectClientDelegate)clientDelegate;
- (id)initForServiceName:(id)a3 delegate:(id)a4;
- (id)initForServiceName:(id)a3 delegate:(id)a4 clientID:(id)a5;
- (int)clientProcessIdentifier;
- (void)setProxyObjectClasses:(id)a3;
- (void)setUsesPersistentXPCConnections:(BOOL)a3;
@end

@implementation SUCoreConnectClientPolicy

- (id)initForServiceName:(id)a3 delegate:(id)a4 clientID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SUCoreConnectClientPolicy;
  v12 = [(SUCoreConnectClientPolicy *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeWeak((id *)&v13->_clientDelegate, v10);
    v14 = NSString;
    v15 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v16 = [v14 stringWithFormat:@"%@.<%d>", v11, objc_msgSend(v15, "processIdentifier")];
    clientID = v13->_clientID;
    v13->_clientID = (NSString *)v16;

    objc_storeStrong((id *)&v13->_clientIDRaw, a5);
    v18 = [MEMORY[0x263F08AB0] processInfo];
    v13->_clientProcessIdentifier = [v18 processIdentifier];

    v13->_usesPersistentXPCConnections = 0;
  }

  return v13;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSSet)proxyObjectClasses
{
  return self->_proxyObjectClasses;
}

- (BOOL)usesPersistentXPCConnections
{
  return self->_usesPersistentXPCConnections;
}

+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [v5 setWithObject:a4];
  +[SUCoreConnectClientPolicy setAllowlistedClasses:v6 forKeys:v7];
}

void __59__SUCoreConnectClientPolicy_setAllowlistedClasses_forKeys___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x216678F30]();
        v8 = (void *)MEMORY[0x263EFFA08];
        id v9 = +[SUCoreConnectConstants defaultClasses];
        id v10 = [v8 setWithArray:v9];

        id v11 = +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:v6];
        if (v11)
        {
          uint64_t v12 = [v10 setByAddingObjectsFromSet:v11];

          id v10 = (void *)v12;
        }
        v13 = [v10 setByAddingObjectsFromSet:*(void *)(a1 + 40)];

        v14 = +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses];
        [v14 setSafeObject:v13 forKey:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

+ (id)_getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    uint64_t v5 = +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses];
    uint64_t v6 = [v5 safeObjectForKey:v3 ofClass:objc_opt_class()];
  }
  else
  {
    id v7 = [MEMORY[0x263F77DE8] sharedLogger];
    v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:](v8);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  dispatch_assert_queue_not_V2(v7);

  if (!v6 || ![v6 count])
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    [v9 trackAnomaly:@"SUCoreConnectClientPolicy" forReason:@"Cannot set allowlisted classes for a nil/empty NSSet of keys" withResult:8102 withError:0];
LABEL_8:

    goto LABEL_9;
  }
  if (!v5 || ![v5 count])
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    id v10 = [NSString stringWithFormat:@"Cannot set nil/empty NSSet of classes for keys %@", v6];
    [v9 trackAnomaly:@"SUCoreConnectClientPolicy" forReason:v10 withResult:8102 withError:0];

    goto LABEL_8;
  }
  v8 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUCoreConnectClientPolicy_setAllowlistedClasses_forKeys___block_invoke;
  block[3] = &unk_2641881E8;
  id v12 = v6;
  id v13 = v5;
  dispatch_sync(v8, block);

LABEL_9:
}

+ (id)_getSharedClientAllowlistedClasses
{
  uint64_t v2 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  dispatch_assert_queue_V2(v2);

  if (_getSharedClientAllowlistedClasses_sharedClientAllowlistedClassesOnceToken != -1) {
    dispatch_once(&_getSharedClientAllowlistedClasses_sharedClientAllowlistedClassesOnceToken, &__block_literal_global_16);
  }
  id v3 = (void *)_getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses;
  return v3;
}

+ (id)_getSharedClientAccessQueue
{
  if (_getSharedClientAccessQueue_sharedClientAccessQueueOnceToken != -1) {
    dispatch_once(&_getSharedClientAccessQueue_sharedClientAccessQueueOnceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)_getSharedClientAccessQueue_sharedClientAccessQueue;
  return v2;
}

uint64_t __63__SUCoreConnectClientPolicy__getSharedClientAllowlistedClasses__block_invoke()
{
  _getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

- (void)setProxyObjectClasses:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSSet *)a3;
  id v5 = [MEMORY[0x263F77DE8] sharedLogger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_210A6A000, v6, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectClientPolicy] Setting proxy object classes: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  proxyObjectClasses = self->_proxyObjectClasses;
  self->_proxyObjectClasses = v4;
}

void __56__SUCoreConnectClientPolicy__getSharedClientAccessQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.SUCoreConnect.ClientAllowlistAccessQueue" UTF8String];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)_getSharedClientAccessQueue_sharedClientAccessQueue;
  _getSharedClientAccessQueue_sharedClientAccessQueue = (uint64_t)v1;
}

- (id)initForServiceName:(id)a3 delegate:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F77DA8], "sharedDiag", a3, a4);
  [v5 trackAnomaly:@"SUCoreConnectClientPolicy", @"initForServiceName:delegate: is deprecated, use initForServiceName:delegate:clientID instead", 8123, 0 forReason withResult withError];

  return 0;
}

+ (id)getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  long long v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SUCoreConnectClientPolicy_getAllowlistedClassesForKey___block_invoke;
  v9[3] = &unk_2641881C0;
  id v10 = v3;
  id v11 = &v12;
  id v6 = v3;
  dispatch_sync(v5, v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __57__SUCoreConnectClientPolicy_getAllowlistedClassesForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a4;
  id v8 = [v5 setWithObject:a3];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

  +[SUCoreConnectClientPolicy setAllowlistedClasses:v8 forKeys:v7];
}

+ (void)clearAllowlistedClasses
{
  uint64_t v2 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  dispatch_assert_queue_not_V2(v2);

  id v3 = +[SUCoreConnectClientPolicy _getSharedClientAccessQueue];
  dispatch_sync(v3, &__block_literal_global_27);
}

void __52__SUCoreConnectClientPolicy_clearAllowlistedClasses__block_invoke()
{
  v0 = +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses];
  [v0 removeAllObjects];

  dispatch_queue_t v1 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v2 = [v1 oslog];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_210A6A000, v2, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectClientPolicy] All entries removed from allowlisted classes dictionary", v3, 2u);
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = [(SUCoreConnectClientPolicy *)self serviceName];
  id v5 = [(SUCoreConnectClientPolicy *)self clientID];
  id v6 = [v3 stringWithFormat:@"SUCoreConnectClientPolicy(serviceName:%@|clientID:%@)", v4, v5];

  return (NSString *)v6;
}

- (SUCoreConnectClientDelegate)clientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientDelegate);
  return (SUCoreConnectClientDelegate *)WeakRetained;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (void)setUsesPersistentXPCConnections:(BOOL)a3
{
  self->_usesPersistentXPCConnections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyObjectClasses, 0);
  objc_storeStrong((id *)&self->_clientIDRaw, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_destroyWeak((id *)&self->_clientDelegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

+ (void)_getAllowlistedClassesForKey:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_error_impl(&dword_210A6A000, log, OS_LOG_TYPE_ERROR, "[SUCoreConnectClientPolicy] Cannot get allowlisted for a nil key, returning no allowlisted classes", v1, 2u);
}

@end