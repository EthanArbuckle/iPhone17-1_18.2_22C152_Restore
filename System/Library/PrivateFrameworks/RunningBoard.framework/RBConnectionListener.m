@interface RBConnectionListener
+ (id)sharedConnectionWorkloop;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBConnectionListener)init;
- (id)initWithContext:(id)a1;
- (os_unfair_lock_s)readyClients;
- (void)connectionIsReady:(uint64_t)a1;
- (void)start;
@end

@implementation RBConnectionListener

void __29__RBConnectionListener_start__block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x22A661A50]();
  if (v4 == MEMORY[0x263EF8708])
  {
    v9 = (void *)MEMORY[0x22A660FC0]();
    -[RBConnectionClient handleMessage:](*(void *)(a1 + 32), v3);
  }
  else if (v4 == MEMORY[0x263EF8720])
  {
    xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &__block_literal_global_34);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
    -[RBConnectionClient invalidate](*(void *)(a1 + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 8));
    [*(id *)(*(void *)(a1 + 48) + 32) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 48) + 40) removeObjectForKey:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 48) + 48) removeObject:*(void *)(a1 + 32)];
    v5 = [*(id *)(*(void *)(a1 + 48) + 56) historicalStatistics];
    objc_msgSend(v5, "notifyClientCount:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 40), "count"));

    if (![*(id *)(*(void *)(a1 + 48) + 32) count])
    {
      v6 = rbs_connection_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_DEFAULT, "Releasing Transaction as now without clients", v10, 2u);
      }

      uint64_t v7 = *(void *)(a1 + 48);
      v8 = *(void **)(v7 + 64);
      *(void *)(v7 + 64) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 8));
  }
}

- (os_unfair_lock_s)readyClients
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (os_unfair_lock_s *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:*(void *)&v1[12]._os_unfair_lock_opaque];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)connectionIsReady:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(a1 + 48) addObject:v4];

    os_unfair_lock_unlock(v3);
  }
}

void __29__RBConnectionListener_start__block_invoke_2(id *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  memset(&v29, 0, sizeof(v29));
  RBSInvalidRealAuditToken();
  xpc_connection_get_audit_token();
  memset(&atoken, 0, sizeof(atoken));
  if (RBSRealAuditTokenValid())
  {
    audit_token_t atoken = v29;
    uid_t v3 = audit_token_to_euid(&atoken);
    audit_token_t atoken = v29;
    uid_t v4 = audit_token_to_auid(&atoken);
    if (v4 + 1 >= 2) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = v3;
    }
  }
  else
  {
    unsigned int v5 = 0;
    uid_t v3 = 0;
  }
  audit_token_t atoken = v29;
  v6 = [MEMORY[0x263F64428] tokenFromAuditToken:&atoken];
  uint64_t v7 = rbs_connection_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v6 pid];
    atoken.val[0] = 67109632;
    atoken.val[1] = v8;
    LOWORD(atoken.val[2]) = 1024;
    *(unsigned int *)((char *)&atoken.val[2] + 2) = v3;
    HIWORD(atoken.val[3]) = 1024;
    atoken.val[4] = v5;
    _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "Incoming connection from %d, user %d/%d", (uint8_t *)&atoken, 0x14u);
  }

  v9 = [a1[5] processManager];
  v10 = [v9 processForAuditToken:v6];

  if (v10)
  {
    v11 = [v10 identifier];
    os_unfair_lock_lock((os_unfair_lock_t)a1[6] + 2);
    if (![*((id *)a1[6] + 4) count])
    {
      uint64_t v12 = os_transaction_create();
      v13 = a1[6];
      v14 = (void *)v13[8];
      v13[8] = v12;

      v15 = rbs_connection_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(atoken.val[0]) = 0;
        _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "Taking Transaction as now busy with client", (uint8_t *)&atoken, 2u);
      }
    }
    v16 = [*((id *)a1[6] + 5) objectForKey:v11];
    if (!v16)
    {
      v16 = -[RBConnectionClient initWithContext:listener:process:connection:]((id *)[RBConnectionClient alloc], a1[5], a1[6], v10, v2);
      [*((id *)a1[6] + 5) setObject:v16 forKey:v11];
      v17 = [*((id *)a1[6] + 7) historicalStatistics];
      objc_msgSend(v17, "notifyClientCount:", objc_msgSend(*((id *)a1[6] + 5), "count"));
    }
    [*((id *)a1[6] + 4) setObject:v16 forKey:v2];
    os_unfair_lock_unlock((os_unfair_lock_t)a1[6] + 2);
    v18 = +[RBConnectionListener sharedConnectionWorkloop]();
    xpc_connection_set_target_queue((xpc_connection_t)v2, v18);

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __29__RBConnectionListener_start__block_invoke_30;
    v24[3] = &unk_2647C86C8;
    id v25 = v16;
    id v19 = v2;
    id v20 = a1[6];
    id v26 = v19;
    id v27 = v20;
    id v28 = v11;
    id v21 = v11;
    id v22 = v16;
    xpc_connection_set_event_handler((xpc_connection_t)v19, v24);
    xpc_connection_activate((xpc_connection_t)v19);
  }
  else
  {
    v23 = rbs_connection_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __29__RBConnectionListener_start__block_invoke_2_cold_1(v6, v23);
    }

    xpc_connection_set_event_handler((xpc_connection_t)v2, &__block_literal_global_37);
    xpc_connection_activate((xpc_connection_t)v2);
    xpc_connection_cancel((xpc_connection_t)v2);
  }
}

+ (id)sharedConnectionWorkloop
{
  self;
  if (sharedConnectionWorkloop_onceToken != -1) {
    dispatch_once(&sharedConnectionWorkloop_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)sharedConnectionWorkloop__workloop;
  return v0;
}

void __29__RBConnectionListener_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x22A661A50]();
  if (v4 == MEMORY[0x263EF86F0])
  {
    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __29__RBConnectionListener_start__block_invoke_2;
    activity_block[3] = &unk_2647C7A08;
    id v9 = v3;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = v6;
    uint64_t v11 = v7;
    _os_activity_initiate(&dword_226AB3000, "incoming connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else if (v4 == MEMORY[0x263EF8720])
  {
    unsigned int v5 = rbs_connection_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __29__RBConnectionListener_start__block_invoke_cold_1(v3, v5);
    }

    exit(0);
  }
}

void __48__RBConnectionListener_sharedConnectionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.runningboard.client-workloop");
  v1 = (void *)sharedConnectionWorkloop__workloop;
  sharedConnectionWorkloop__workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  id v2 = sharedConnectionWorkloop__workloop;
  dispatch_activate(v2);
}

- (RBConnectionListener)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBConnectionListener.m" lineNumber:63 description:@"-init is not allowed on RBConnectionListener"];

  return 0;
}

- (id)initWithContext:(id)a1
{
  id v4 = a2;
  unsigned int v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      id v19 = [MEMORY[0x263F08690] currentHandler];
      [v19 handleFailureInMethod:sel_initWithContext_, a1, @"RBConnectionListener.m", 68, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
    }
    v20.receiver = a1;
    v20.super_class = (Class)RBConnectionListener;
    id v6 = objc_msgSendSuper2(&v20, sel_init);
    a1 = v6;
    if (v6)
    {
      v6[2] = 0;
      uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.runningboard.listener", v7);
      id v9 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v8;

      xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[(id)*MEMORY[0x263F64680] UTF8String], *((dispatch_queue_t *)a1 + 2), 1uLL);
      uint64_t v11 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = mach_service;

      uint64_t v12 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v13 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v12;

      uint64_t v14 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v15 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v14;

      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      v17 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v16;

      objc_storeStrong((id *)a1 + 7, a2);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(NSMapTable *)self->_lock_connectionToClientMap objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v10 = -[RBConnectionClient processIdentity](v9);
        uint64_t v11 = [v10 description];
        uint64_t v12 = -[RBConnectionClient processIdentifier](v9);
        [v3 appendFormat:@"%@:%d\n\t", v11, objc_msgSend(v12, "pid")];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v13 = [NSString alloc];
  uint64_t v14 = [(id)objc_opt_class() description];
  v15 = (void *)[v13 initWithFormat:@"<%@|  clients:[\n\t%@]>", v14, v3];

  return (NSString *)v15;
}

- (void)start
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 56);
    id v3 = *(_xpc_connection_s **)(a1 + 24);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__RBConnectionListener_start__block_invoke;
    v5[3] = &unk_2647C7A30;
    id v6 = v2;
    uint64_t v7 = a1;
    id v4 = v2;
    xpc_connection_set_event_handler(v3, v5);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 24));
  }
}

- (NSString)stateCaptureTitle
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lock_readyClients, 0);
  objc_storeStrong((id *)&self->_lock_identifierToClientMap, 0);
  objc_storeStrong((id *)&self->_lock_connectionToClientMap, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __29__RBConnectionListener_start__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v4 = 136315138;
  uint64_t v5 = string;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Error on xpc listener connection: %s", (uint8_t *)&v4, 0xCu);
}

void __29__RBConnectionListener_start__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 pid];
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Unable to create a reference to incoming connection from %d", (uint8_t *)v3, 8u);
}

@end