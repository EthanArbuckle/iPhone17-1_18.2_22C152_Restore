@interface REDuetContextStore
- (id)_init;
- (id)isConnectedToAudioBluetoothDeviceQuery;
- (id)isConnectedToCarQuery;
- (void)registerForQuery:(id)a3 updateBlock:(id)a4;
- (void)unregisterForQuery:(id)a3;
@end

@implementation REDuetContextStore

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)REDuetContextStore;
  v2 = [(RESingleton *)&v10 _init];
  if (v2 && CoreDuetContextLibraryCore())
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v3 = (void *)get_CDClientContextClass_softClass;
    uint64_t v15 = get_CDClientContextClass_softClass;
    if (!get_CDClientContextClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __get_CDClientContextClass_block_invoke;
      v11[3] = &unk_2644BC768;
      v11[4] = &v12;
      __get_CDClientContextClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v12, 8);
    uint64_t v5 = [v4 userContext];
    v6 = (void *)v2[1];
    v2[1] = v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    v8 = (void *)v2[2];
    v2[2] = v7;
  }
  return v2;
}

- (id)isConnectedToCarQuery
{
  v17[2] = *MEMORY[0x263EF8340];
  if (CoreDuetContextLibraryCore())
  {
    v2 = [get_CDContextQueriesClass() keyPathForCarConnectedStatus];
    v3 = [get_CDContextQueriesClass() keyPathForCarplayConnectedStatus];
    id v4 = [get_CDContextualPredicateClass() predicateForChangeAtKeyPath:v2];
    uint64_t v5 = [get_CDContextualPredicateClass() predicateForChangeAtKeyPath:v3];
    v17[0] = v4;
    v17[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    uint64_t v7 = [get_CDContextualPredicateClass() orPredicateWithSubpredicates:v6];

    v8 = [get_CDMDCSContextualPredicateClass() predicateForIsConnectedToCar];
    v9 = [REDuetContextQuery alloc];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __43__REDuetContextStore_isConnectedToCarQuery__block_invoke;
    v14[3] = &unk_2644BD868;
    id v15 = v2;
    id v16 = v3;
    id v10 = v3;
    id v11 = v2;
    uint64_t v12 = [(REDuetContextQuery *)v9 initWithPredicate:v7 remotePredicate:v8 name:@"connectedToCar" evaluationBlock:v14];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

uint64_t __43__REDuetContextStore_isConnectedToCarQuery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v6 BOOLValue] & 1) != 0)
  {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else
  {
    uint64_t v7 = MEMORY[0x263EFFA80];
  }

  return v7;
}

- (id)isConnectedToAudioBluetoothDeviceQuery
{
  v16[2] = *MEMORY[0x263EF8340];
  if (CoreDuetContextLibraryCore())
  {
    v2 = [get_CDContextQueriesClass() keyPathForBluetoothDataDictionary];
    uint64_t v3 = [get_CDContextQueriesClass() bluetoothDeviceTypeKey];
    id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"self.%@.value.%@ in %@", v2, v3, &unk_26CFCD6E0];
    uint64_t v5 = [get_CDContextualPredicateClass() predicateForKeyPath:v2 withPredicate:v4];
    id v6 = [get_CDContextQueriesClass() predicateForBluetoothConnectionStatus:1];
    uint64_t v7 = [get_CDContextQueriesClass() predicateForBluetoothConnectionStatus:0];
    v16[0] = v6;
    v16[1] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    v9 = [get_CDContextualPredicateClass() orPredicateWithSubpredicates:v8];

    v15[0] = v5;
    v15[1] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    id v11 = [get_CDContextualPredicateClass() andPredicateWithSubpredicates:v10];

    uint64_t v12 = [get_CDMDCSContextualPredicateClass() predicateForIsConnectedToAudioBluetoothDevice];
    v13 = [[REDuetContextQuery alloc] initWithPredicate:v11 remotePredicate:v12 name:@"connectedToAudioBluetooth" evaluationBlock:&__block_literal_global_16];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

uint64_t __60__REDuetContextStore_isConnectedToAudioBluetoothDeviceQuery__block_invoke()
{
  return MEMORY[0x263EFFA88];
}

- (void)registerForQuery:(id)a3 updateBlock:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    v9 = [[_REContextRegistration alloc] initWithQuery:v7];

    [(_REContextRegistration *)v9 setCallback:v6];
    [(_REContextRegistration *)v9 setContext:self->_context];
    id v8 = [(_REContextRegistration *)v9 uuid];
    [(NSMutableDictionary *)self->_registrations setObject:v9 forKeyedSubscript:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
    [(_REContextRegistration *)v9 registerWithContext];
    [(_REContextRegistration *)v9 evaluateQuery];
  }
}

- (void)unregisterForQuery:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    id v6 = [v4 uuid];

    uint64_t v5 = [(NSMutableDictionary *)self->_registrations objectForKeyedSubscript:v6];
    if (v5) {
      [(NSMutableDictionary *)self->_registrations removeObjectForKey:v6];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
    [v5 deregisterWithContext];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end