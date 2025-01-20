@interface NPKPassLibrarySyncState
+ (BOOL)_shouldAddPass:(id)a3 withDeviceIsTinker:(BOOL)a4 supportHealthPass:(BOOL)a5 stateVersion:(unint64_t)a6;
- (NPKPassLibrarySyncState)initWithPasses:(id)a3 device:(id)a4;
- (NPKPassLibrarySyncState)initWithStateVersionSyncStates:(id)a3;
- (id)mergeWithPassLibrarySyncState:(id)a3;
- (id)passSyncStateWithVersion:(unint64_t)a3;
- (id)updateReconcileState:(id)a3 expectedVersion:(unint64_t)a4;
@end

@implementation NPKPassLibrarySyncState

- (NPKPassLibrarySyncState)initWithStateVersionSyncStates:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPassLibrarySyncState;
  v5 = [(NPKPassLibrarySyncState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    syncStates = v5->_syncStates;
    v5->_syncStates = (NSDictionary *)v6;
  }
  return v5;
}

- (NPKPassLibrarySyncState)initWithPasses:(id)a3 device:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  LOBYTE(v6) = NPKIsTinkerDevice(v7);
  char v10 = NPKPairedOrPairingDeviceSupportsHealthPass(v7);

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke;
  v19[3] = &unk_2644D4260;
  id v20 = &unk_26D043778;
  id v21 = v9;
  v11 = self;
  v22 = v11;
  char v23 = (char)v6;
  char v24 = v10;
  id v12 = v9;
  [v8 enumerateObjectsUsingBlock:v19];

  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_3;
  v17[3] = &unk_2644D4288;
  id v18 = v13;
  id v14 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];
  v15 = [(NPKPassLibrarySyncState *)v11 initWithStateVersionSyncStates:v14];

  return v15;
}

void __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[NPKPassSyncStateItem alloc] initWithPass:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_2;
  v8[3] = &unk_2644D4238;
  v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  __int16 v13 = *(_WORD *)(a1 + 56);
  id v12 = v4;
  uint64_t v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  if (objc_msgSend((id)objc_opt_class(), "_shouldAddPass:withDeviceIsTinker:supportHealthPass:stateVersion:", *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), objc_msgSend(v4, "unsignedIntegerValue")))objc_msgSend(v3, "addObject:", *(void *)(a1 + 56)); {
}
  }

void __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = -[NPKPassSyncState initWithSyncStateItems:version:]([NPKPassSyncState alloc], "initWithSyncStateItems:version:", v5, [v6 unsignedIntegerValue]);

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)passSyncStateWithVersion:(unint64_t)a3
{
  syncStates = self->_syncStates;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSDictionary *)syncStates objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [NPKPassSyncState alloc];
    id v10 = [MEMORY[0x263EFFA08] set];
    id v8 = [(NPKPassSyncState *)v9 initWithSyncStateItems:v10 version:a3];
  }
  return v8;
}

- (id)mergeWithPassLibrarySyncState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__NPKPassLibrarySyncState_mergeWithPassLibrarySyncState___block_invoke;
  v10[3] = &unk_2644D42B0;
  v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v4;
  [&unk_26D043778 enumerateObjectsUsingBlock:v10];
  id v8 = [[NPKPassLibrarySyncState alloc] initWithStateVersionSyncStates:v6];

  return v8;
}

void __57__NPKPassLibrarySyncState_mergeWithPassLibrarySyncState___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 unsignedIntegerValue];
  id v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = [a1[4] passSyncStateWithVersion:v4];
  id v7 = [v6 syncStateItems];
  id v8 = [v7 allValues];
  id v13 = [v5 setWithArray:v8];

  id v9 = [a1[5] passSyncStateWithVersion:v4];
  id v10 = [v9 syncStateItems];
  id v11 = [v10 allValues];
  [v13 addObjectsFromArray:v11];

  id v12 = [[NPKPassSyncState alloc] initWithSyncStateItems:v13 version:v4];
  [a1[6] setObject:v12 forKeyedSubscript:v3];
}

+ (BOOL)_shouldAddPass:(id)a3 withDeviceIsTinker:(BOOL)a4 supportHealthPass:(BOOL)a5 stateVersion:(unint64_t)a6
{
  return NPKShouldUseStandaloneSyncForPassWithDevice(a3, a4, a5, a6);
}

- (void).cxx_destruct
{
}

- (id)updateReconcileState:(id)a3 expectedVersion:(unint64_t)a4
{
  id v6 = a3;
  id v7 = -[NPKPassLibrarySyncState passSyncStateWithVersion:](self, "passSyncStateWithVersion:", [v6 version]);
  id v8 = [v7 syncStateItems];

  id v9 = [(NPKPassLibrarySyncState *)self passSyncStateWithVersion:a4];
  id v10 = [v9 syncStateItems];

  id v11 = [v6 syncStateItems];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [v6 syncStateItems];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __81__NPKPassLibrarySyncState_ReconciledState__updateReconcileState_expectedVersion___block_invoke;
  v23[3] = &unk_2644D6828;
  id v24 = v8;
  id v25 = v10;
  id v26 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v8;
  [v13 enumerateKeysAndObjectsUsingBlock:v23];

  v17 = [NPKPassSyncState alloc];
  id v18 = (void *)MEMORY[0x263EFFA08];
  v19 = [v14 allValues];
  id v20 = [v18 setWithArray:v19];
  id v21 = [(NPKPassSyncState *)v17 initWithSyncStateItems:v20 version:a4];

  return v21;
}

void __81__NPKPassLibrarySyncState_ReconciledState__updateReconcileState_expectedVersion___block_invoke(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [a1[5] objectForKeyedSubscript:v6];

    if (!v5) {
      [a1[6] removeObjectForKey:v6];
    }
  }
}

@end