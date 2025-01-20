@interface SCLInterruptBehaviorResolver
- (BOOL)_isEmergencyBypassEnabledForContact:(id)a3;
- (BOOL)_isEntitledWithClientIdentifier:(id)a3;
- (BOOL)_isRepeatSender:(id)a3 date:(id)a4 clientIdentifier:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CNContactStore)contactStore;
- (NSMutableArray)resolutionRecords;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (SCLInterruptBehaviorResolver)initWithTargetQueue:(id)a3;
- (SCLState)currentState;
- (id)_resolveInterruptBehaviorForEvent:(id)a3 date:(id)a4 clientIdentifier:(id)a5;
- (void)_addResolutionRecord:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)resolveBehaviorForEvent:(id)a3 clientIdentifier:(id)a4 completion:(id)a5;
- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5;
- (void)setContactStore:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResolutionRecords:(id)a3;
@end

@implementation SCLInterruptBehaviorResolver

- (SCLInterruptBehaviorResolver)initWithTargetQueue:(id)a3
{
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLInterruptBehaviorResolver;
  v5 = [(SCLInterruptBehaviorResolver *)&v17 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("SCLInterruptBehaviorResolver", 0, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:0x26DF074D8];
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v8;

    [(NSXPCListener *)v5->_listener _setQueue:v5->_queue];
    [(NSXPCListener *)v5->_listener setDelegate:v5];
    v5->_lock._os_unfair_lock_opaque = 0;
    id v10 = objc_alloc_init(MEMORY[0x263EFEA68]);
    v11 = (void *)tcc_identity_create();
    [v10 setAssumedIdentity:v11];

    uint64_t v12 = [objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v10];
    contactStore = v5->_contactStore;
    v5->_contactStore = (CNContactStore *)v12;

    [(CNContactStore *)v5->_contactStore requestAccessForEntityType:0 completionHandler:&__block_literal_global_6];
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    resolutionRecords = v5->_resolutionRecords;
    v5->_resolutionRecords = v14;
  }
  return v5;
}

void __52__SCLInterruptBehaviorResolver_initWithTargetQueue___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = scl_interrupt_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_DEFAULT, "Access to contacts store: granted=%{BOOL}u, error=%@", (uint8_t *)v6, 0x12u);
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCLInterruptBehaviorResolver;
  [(SCLInterruptBehaviorResolver *)&v3 dealloc];
}

- (void)activate
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_queue_t v6 = scl_interrupt_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = [v5 processIdentifier];
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_INFO, "Accepting new connection from pid %d", (uint8_t *)v10, 8u);
  }

  __int16 v7 = SCLInterruptBehaviorResolutionXPCServerInterface();
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  id v8 = [(SCLInterruptBehaviorResolver *)self queue];
  [v5 _setQueue:v8];

  [v5 resume];
  return 1;
}

- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5
{
  dispatch_queue_t v6 = (SCLState *)a4;
  os_unfair_lock_lock(&self->_lock);
  currentState = self->_currentState;
  self->_currentState = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)resolveBehaviorForEvent:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  uint64_t v11 = [(SCLInterruptBehaviorResolver *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = scl_interrupt_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    id v18 = v8;
    _os_log_impl(&dword_22B7B4000, v12, OS_LOG_TYPE_INFO, "Resolving behavior for event: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  if ([(SCLInterruptBehaviorResolver *)self _isEntitledWithClientIdentifier:v9])
  {
    v13 = [MEMORY[0x263EFF910] date];
    v14 = [(SCLInterruptBehaviorResolver *)self _resolveInterruptBehaviorForEvent:v8 date:v13 clientIdentifier:v9];
    v15 = scl_interrupt_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_22B7B4000, v15, OS_LOG_TYPE_DEFAULT, "Result behavior:%@ for event: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v10[2](v10, v14, 0);
  }
  else
  {
    v16 = scl_interrupt_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SCLInterruptBehaviorResolver resolveBehaviorForEvent:clientIdentifier:completion:](v16);
    }

    v13 = SCLEntitlementError(0x26DF074D8);
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v13);
  }
}

- (BOOL)_isEntitledWithClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLInterruptBehaviorResolver *)self queue];
  dispatch_assert_queue_V2(v5);

  dispatch_queue_t v6 = [MEMORY[0x263F08D68] currentConnection];
  __int16 v7 = [v6 valueForEntitlement:0x26DF074D8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [v7 containsObject:v4];
LABEL_5:
    char v9 = v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [v7 isEqualToString:v4];
    goto LABEL_5;
  }
  char v9 = 0;
LABEL_7:
  id v10 = scl_interrupt_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(SCLInterruptBehaviorResolver *)(uint64_t)v4 _isEntitledWithClientIdentifier:v10];
  }

  return v9;
}

- (id)_resolveInterruptBehaviorForEvent:(id)a3 date:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SCLInterruptBehaviorResolver *)self queue];
  dispatch_assert_queue_V2(v11);

  os_unfair_lock_lock(&self->_lock);
  uint64_t v12 = [(SCLInterruptBehaviorResolver *)self currentState];
  os_unfair_lock_unlock(&self->_lock);
  v13 = [v8 sender];
  if (![v12 isActive]
    || ([v8 shouldAlwaysInterrupt] & 1) != 0
    || [v8 urgency] == 1)
  {
    int v14 = 0;
    uint64_t v15 = 1;
  }
  else if (v13)
  {
    BOOL v20 = [(SCLInterruptBehaviorResolver *)self _isEmergencyBypassEnabledForContact:v13];
    int v14 = !v20;
    uint64_t v15 = v20;
  }
  else
  {
    uint64_t v15 = 0;
    int v14 = 1;
  }
  uint64_t v16 = [v8 type];
  if (v14 && v16 == 1 && v13) {
    uint64_t v15 = [(SCLInterruptBehaviorResolver *)self _isRepeatSender:v13 date:v9 clientIdentifier:v10];
  }
  int v17 = [[SCLInterruptEventBehavior alloc] initWithEvent:v8 interruptEligibility:v15];
  if ([v8 type] == 1)
  {
    id v18 = +[SCLInterruptBehaviorResolutionRecord resolutionRecordForDate:v9 eventBehavior:v17 clientIdentifier:v10];
    [(SCLInterruptBehaviorResolver *)self _addResolutionRecord:v18];
  }
  return v17;
}

- (BOOL)_isEmergencyBypassEnabledForContact:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SCLInterruptBehaviorResolver *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(MEMORY[0x263EFEA18]);
  uint64_t v7 = *MEMORY[0x263EFE020];
  v27[0] = *MEMORY[0x263EFDFE0];
  v27[1] = v7;
  v27[2] = *MEMORY[0x263EFDF58];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  id v9 = (void *)[v6 initWithKeysToFetch:v8];

  id v10 = objc_msgSend(MEMORY[0x263EFE9F8], "scl_predicateForContactsMatchingEventSender:", v4);
  [v9 setPredicate:v10];

  [v9 setUnifyResults:1];
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  contactStore = self->_contactStore;
  v17[4] = &v19;
  id v18 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__SCLInterruptBehaviorResolver__isEmergencyBypassEnabledForContact___block_invoke;
  v17[3] = &unk_2648AC810;
  LODWORD(v10) = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v9 error:&v18 usingBlock:v17];
  id v12 = v18;
  if (v10)
  {
    v13 = scl_interrupt_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((unsigned __int8 *)v20 + 24);
      *(_DWORD *)buf = 138543618;
      id v24 = v4;
      __int16 v25 = 1024;
      int v26 = v14;
      _os_log_impl(&dword_22B7B4000, v13, OS_LOG_TYPE_DEFAULT, "sender=%{public}@, isEmergencyBypassEnabled=%{BOOL}u", buf, 0x12u);
    }
  }
  else
  {
    v13 = scl_interrupt_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SCLInterruptBehaviorResolver _isEmergencyBypassEnabledForContact:]((uint64_t)v12, v13);
    }
  }

  BOOL v15 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __68__SCLInterruptBehaviorResolver__isEmergencyBypassEnabledForContact___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([v5 isUnified])
  {
    id v6 = [v5 linkedContacts];
  }
  else
  {
    v8[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  uint64_t v7 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", &__block_literal_global_21);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __68__SCLInterruptBehaviorResolver__isEmergencyBypassEnabledForContact___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 callAlert];
  uint64_t v3 = [v2 ignoreMute];

  return v3;
}

- (BOOL)_isRepeatSender:(id)a3 date:(id)a4 clientIdentifier:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(SCLInterruptBehaviorResolver *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v10 dateByAddingTimeInterval:-180.0];

  resolutionRecords = self->_resolutionRecords;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__SCLInterruptBehaviorResolver__isRepeatSender_date_clientIdentifier___block_invoke;
  v20[3] = &unk_2648AC838;
  id v21 = v12;
  id v22 = v9;
  id v14 = v8;
  id v23 = v14;
  id v15 = v9;
  id v16 = v12;
  int v17 = [(NSMutableArray *)resolutionRecords bs_containsObjectPassingTest:v20];
  id v18 = scl_interrupt_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v14;
    __int16 v26 = 1024;
    int v27 = v17;
    _os_log_impl(&dword_22B7B4000, v18, OS_LOG_TYPE_DEFAULT, "Checked if event sender is a repeat: sender=%{public}@, repeat=%{BOOL}u", buf, 0x12u);
  }

  return v17;
}

uint64_t __70__SCLInterruptBehaviorResolver__isRepeatSender_date_clientIdentifier___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v4 date];
  uint64_t v6 = [v3 compare:v5];

  uint64_t v7 = [v4 clientIdentifier];
  int v8 = [v7 isEqualToString:a1[5]];

  id v9 = [v4 eventBehavior];

  id v10 = [v9 event];
  uint64_t v11 = [v10 sender];
  unsigned int v12 = [v11 isEqual:a1[6]];

  if (v6 == 1) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  return v13 & v12;
}

- (void)_addResolutionRecord:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SCLInterruptBehaviorResolver *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    [(NSMutableArray *)self->_resolutionRecords addObject:v4];
    uint64_t v6 = scl_interrupt_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = (uint64_t)v4;
      _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_INFO, "New record added %{public}@", buf, 0xCu);
    }

    if ((unint64_t)[(NSMutableArray *)self->_resolutionRecords count] >= 0x15)
    {
      uint64_t v7 = [(NSMutableArray *)self->_resolutionRecords count];
      int v8 = [v4 date];
      id v9 = [v8 dateByAddingTimeInterval:-180.0];

      id v10 = (void *)MEMORY[0x263F08A98];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53__SCLInterruptBehaviorResolver__addResolutionRecord___block_invoke;
      v15[3] = &unk_2648AC860;
      id v11 = v9;
      id v16 = v11;
      unsigned int v12 = [v10 predicateWithBlock:v15];
      [(NSMutableArray *)self->_resolutionRecords filterUsingPredicate:v12];
      uint64_t v13 = v7 - [(NSMutableArray *)self->_resolutionRecords count];
      if (v13)
      {
        id v14 = scl_interrupt_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v18 = v13;
          _os_log_impl(&dword_22B7B4000, v14, OS_LOG_TYPE_DEFAULT, "Pruned %lu resolution records", buf, 0xCu);
        }
      }
    }
  }
}

BOOL __53__SCLInterruptBehaviorResolver__addResolutionRecord___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 date];
  BOOL v4 = [v2 compare:v3] != 1;

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (SCLState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (NSMutableArray)resolutionRecords
{
  return self->_resolutionRecords;
}

- (void)setResolutionRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionRecords, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)resolveBehaviorForEvent:(os_log_t)log clientIdentifier:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Missing entitlement for resolving behavior", v1, 2u);
}

- (void)_isEntitledWithClientIdentifier:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_22B7B4000, log, OS_LOG_TYPE_DEBUG, "Client %@ entitled %{BOOL}u", (uint8_t *)&v3, 0x12u);
}

- (void)_isEmergencyBypassEnabledForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "Error checking emergency bypass contacts: error=%@", (uint8_t *)&v2, 0xCu);
}

@end