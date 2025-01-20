@interface SCWDatabase
- (BOOL)t_flushChangesWithTimeout:(double)a3;
- (NSArray)mergeHandlers;
- (NSMutableDictionary)observersByZoneName;
- (NSMutableDictionary)zoneSnapshotsByZoneName;
- (OS_dispatch_queue)callbackQueue;
- (SCWAsyncSerialQueue)ckSyncQueue;
- (SCWContainerProxying)container;
- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 features:(int64_t)a5 containerProxy:(id)a6;
- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 features:(int64_t)a5 mergeHandlers:(id)a6 containerProxy:(id)a7;
- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 migrationPlan:(id)a5 containerProxy:(id)a6;
- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 migrationPlan:(id)a5 features:(int64_t)a6 containerProxy:(id)a7;
- (SCWDatabaseSchema)schema;
- (SCWDatabaseStoreCoordinator)storeCoordinator;
- (SCWStartupQueue)startupQueue;
- (id)_emptyZonesNeedingFirstSync;
- (id)_sanitizeErrorForClients:(id)a3;
- (id)_zoneWithSchema:(id)a3 zoneStore:(id)a4;
- (id)_zonesNeedingFetch;
- (id)_zonesNeedingSave;
- (int64_t)status;
- (os_unfair_lock_s)observersLock;
- (void)_createZoneInContainerWithSchema:(id)a3 completion:(id)a4;
- (void)_deleteAndRecreateAllZonesWithCompletion:(id)a3;
- (void)_enqueueStartupSequenceWithFeatures:(int64_t)a3;
- (void)_fetchDatabaseAndZoneChangesWithCompletion:(id)a3;
- (void)_fetchDatabaseChangesWithCompletion:(id)a3;
- (void)_fetchZoneChangesForZones:(id)a3 completion:(id)a4;
- (void)_recoverFromIdentityLossWithCompletion:(id)a3;
- (void)_reloadSnapshotOfZone:(id)a3 fromStore:(id)a4;
- (void)_runCKOperation:(id)a3;
- (void)_saveZoneToContainer:(id)a3 allowRecoveryAttempt:(BOOL)a4 completion:(id)a5;
- (void)_saveZonesToContainer:(id)a3 allowRecoveryAttempt:(BOOL)a4 completion:(id)a5;
- (void)_squashZoneForMerge:(id)a3 zoneStore:(id)a4;
- (void)addObserver:(id)a3 forZone:(id)a4;
- (void)checkSyncingEnabledWithCompletion:(id)a3;
- (void)handleRemoteNotification:(id)a3 completion:(id)a4;
- (void)modifyContentsOfZone:(id)a3 withCommand:(id)a4;
- (void)pollForChangesWithCondition:(id)a3 completion:(id)a4;
- (void)readContentsOfZone:(id)a3 withBlock:(id)a4;
- (void)removeObserver:(id)a3 forZone:(id)a4;
- (void)savePendingChangesToServerWithCompletion:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCkSyncQueue:(id)a3;
- (void)setContainer:(id)a3;
- (void)setMergeHandlers:(id)a3;
- (void)setObserversByZoneName:(id)a3;
- (void)setObserversLock:(os_unfair_lock_s)a3;
- (void)setSchema:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStoreCoordinator:(id)a3;
- (void)setZoneSnapshotsByZoneName:(id)a3;
- (void)synchronize;
@end

@implementation SCWDatabase

void __47__SCWDatabase__reloadSnapshotOfZone_fromStore___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        v9 = objc_msgSend(*(id *)(a1 + 48), "zoneName", (void)v10);
        [v7 database:v8 didChangeZone:v9 from:*(void *)(a1 + 56) to:*(void *)(a1 + 64)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoneSnapshotsByZoneName];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) callbackQueue];
  dispatch_async(v6, *(dispatch_block_t *)(a1 + 48));
}

void __42__SCWDatabase__emptyZonesNeedingFirstSync__block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) _zoneWithSchema:*(void *)(a1 + 40) zoneStore:a2];
  if ([v5 needsFirstSync])
  {
    uint64_t v3 = [v5 clientRecords];
    uint64_t v4 = [v3 count];

    if (!v4) {
      [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
    }
  }
}

void __33__SCWDatabase__zonesNeedingFetch__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _zoneWithSchema:*(void *)(a1 + 40) zoneStore:a2];
  if ([v3 isDirty]) {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
  }
}

- (id)_zoneWithSchema:(id)a3 zoneStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SCWZone alloc] initWithSchema:v6 store:v5];

  return v7;
}

void __32__SCWDatabase__zonesNeedingSave__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pendingCommands];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 addObject:v6];
  }
}

- (void)_reloadSnapshotOfZone:(id)a3 fromStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SCWDatabase *)self zoneSnapshotsByZoneName];
  v9 = [v6 zoneName];
  long long v10 = [v8 objectForKeyedSubscript:v9];

  long long v11 = [(SCWDatabase *)self _zoneWithSchema:v6 zoneStore:v7];

  long long v12 = [SCWZoneSnapshot alloc];
  long long v13 = [v11 clientRecords];
  v14 = [(SCWZoneSnapshot *)v12 initWithZoneSchema:v6 records:v13];
  uint64_t v15 = [(SCWDatabase *)self zoneSnapshotsByZoneName];
  v16 = [v6 zoneName];
  [v15 setObject:v14 forKeyedSubscript:v16];

  v17 = [(SCWDatabase *)self zoneSnapshotsByZoneName];
  v18 = [v6 zoneName];
  v19 = [v17 objectForKeyedSubscript:v18];

  if (([v10 isEqualToSnapshot:v19] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_observersLock);
    v20 = [(SCWDatabase *)self observersByZoneName];
    v21 = [v6 zoneName];
    v22 = [v20 objectForKeyedSubscript:v21];
    v23 = (void *)[v22 copy];

    os_unfair_lock_unlock(&self->_observersLock);
    v24 = [(SCWDatabase *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SCWDatabase__reloadSnapshotOfZone_fromStore___block_invoke;
    block[3] = &unk_1E5FA4348;
    id v27 = v23;
    v28 = self;
    id v29 = v6;
    id v30 = v10;
    id v31 = v19;
    id v25 = v23;
    dispatch_async(v24, block);
  }
}

- (NSMutableDictionary)zoneSnapshotsByZoneName
{
  return self->_zoneSnapshotsByZoneName;
}

- (NSMutableDictionary)observersByZoneName
{
  return self->_observersByZoneName;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_56(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v4 = [*(id *)(a1 + 32) schema];
  id v5 = [v4 zoneSchemas];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v25 = *(void *)v31;
    id v26 = v3;
    uint64_t v24 = a1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v11 = *(void **)(a1 + 32);
        long long v12 = [v3 zoneStoreForSchema:v10];
        [v11 _reloadSnapshotOfZone:v10 fromStore:v12];

        long long v13 = [v3 zoneStoreForSchema:v10];
        v14 = [*(id *)(a1 + 32) zoneSnapshotsByZoneName];
        uint64_t v15 = [v10 zoneName];
        v16 = [v14 objectForKeyedSubscript:v15];

        v17 = SCWDatabaseLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v10 zoneName];
          id v29 = [v13 serverRecords];
          uint64_t v28 = [v29 count];
          v19 = [v16 allRecords];
          uint64_t v20 = v7;
          uint64_t v21 = [v19 count];
          v22 = [v13 pendingCommands];
          v23 = [v16 descriptionOfContents];
          *(_DWORD *)buf = 138544386;
          v35 = v18;
          __int16 v36 = 2048;
          uint64_t v37 = v28;
          __int16 v38 = 2048;
          uint64_t v39 = v21;
          uint64_t v7 = v20;
          __int16 v40 = 2114;
          v41 = v22;
          __int16 v42 = 2114;
          v43 = v23;
          _os_log_impl(&dword_1AFD01000, v17, OS_LOG_TYPE_DEFAULT, "loaded zone %{public}@ from disk with %lu server records, %lu client records, pending commands: %{public}@, and client contents: %{public}@", buf, 0x34u);

          a1 = v24;
          id v3 = v26;

          uint64_t v8 = v25;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = [*(id *)(a1 + 32) ckSyncQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2;
  v5[3] = &unk_1E5FA3E68;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v4;
  [v3 enqueueBlock:v5];
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _emptyZonesNeedingFirstSync];
  if ([v4 count])
  {
    id v5 = [*(id *)(a1 + 32) ckSyncQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_5;
    v8[3] = &unk_1E5FA3D00;
    v8[4] = *(void *)(a1 + 32);
    long long v10 = v3;
    id v9 = v4;
    uint64_t v6 = v3;
    [v5 enqueueBlock:v8];

    uint64_t v7 = v10;
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_4;
    v14 = &unk_1E5FA3B00;
    uint64_t v15 = v3;
    v3[2](v3);
    uint64_t v7 = v3;
  }
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2_30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storeCoordinator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_3;
  v5[3] = &unk_1E5FA3B78;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 readZone:v4 withAccessor:v5];
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _zonesNeedingFetch];
  if ([v2 count])
  {
    uint64_t v3 = [*(id *)(a1 + 32) ckSyncQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_10;
    v4[3] = &unk_1E5FA3C40;
    v4[4] = *(void *)(a1 + 32);
    id v5 = v2;
    [v3 enqueueBlock:v4];
  }
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3;
  aBlock[3] = &unk_1E5FA3DF0;
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v4 = _Block_copy(aBlock);
  id v5 = v4;
  if (*(unsigned char *)(a1 + 40))
  {
    id v9 = [*(id *)(a1 + 32) container];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_53;
    v12[3] = &unk_1E5FA3E40;
    uint64_t v10 = *(void *)(a1 + 32);
    id v6 = &v13;
    v12[4] = v10;
    long long v13 = v5;
    id v14 = v3;
    id v11 = v5;
    [v9 accountInfoWithCompletionHandler:v12];

    uint64_t v8 = v14;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_52;
    v15[3] = &unk_1E5FA3E18;
    id v6 = &v16;
    v16 = v4;
    id v17 = v3;
    id v7 = v5;
    __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_52((uint64_t)v15);
    uint64_t v8 = v17;
  }
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_17;
    v8[3] = &unk_1E5FA3C18;
    id v6 = (id *)v9;
    v9[0] = v3;
    id v7 = v3;
    [v5 _saveZonesToContainer:v4 allowRecoveryAttempt:1 completion:v8];
  }
  else
  {
    v9[1] = MEMORY[0x1E4F143A8];
    v9[2] = 3221225472;
    v9[3] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_16;
    v9[4] = &unk_1E5FA3B00;
    id v6 = (id *)&v10;
    uint64_t v10 = v3;
    v3[2](v3);
  }
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_13(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _zonesNeedingSave];
  if ([v2 count])
  {
    id v3 = [*(id *)(a1 + 32) ckSyncQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_15;
    v4[3] = &unk_1E5FA3C40;
    v4[4] = *(void *)(a1 + 32);
    id v5 = v2;
    [v3 enqueueBlock:v4];
  }
}

- (SCWAsyncSerialQueue)ckSyncQueue
{
  return self->_ckSyncQueue;
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_12;
    v8[3] = &unk_1E5FA3C18;
    id v6 = (id *)v9;
    v9[0] = v3;
    id v7 = v3;
    [v5 _fetchZoneChangesForZones:v4 completion:v8];
  }
  else
  {
    v9[1] = MEMORY[0x1E4F143A8];
    v9[2] = 3221225472;
    v9[3] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_11;
    v9[4] = &unk_1E5FA3B00;
    id v6 = (id *)&v10;
    uint64_t v10 = v3;
    v3[2](v3);
  }
}

- (int64_t)status
{
  return self->_status;
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) storeCoordinator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_56;
  v6[3] = &unk_1E5FA3E90;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 readWithAccessor:v6];
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_52(uint64_t a1)
{
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "database does not have syncing feature enabled", v4, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SCWDatabaseLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"disabled";
    if (a2) {
      id v5 = @"enabled";
    }
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1AFD01000, v4, OS_LOG_TYPE_DEFAULT, "finished database startup with syncing %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (a2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [*(id *)(a1 + 32) setStatus:v6];
  id v7 = [*(id *)(a1 + 32) storeCoordinator];
  uint64_t v8 = [v7 underlyingStore];
  [v8 setCloudBackupEnabled:a2 ^ 1u];
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (id)_zonesNeedingSave
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(SCWDatabase *)self schema];
  id v5 = [v4 zoneSchemas];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [(SCWDatabase *)self storeCoordinator];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __32__SCWDatabase__zonesNeedingSave__block_invoke;
        v14[3] = &unk_1E5FA4258;
        id v15 = v3;
        uint64_t v16 = v10;
        [v11 readZone:v10 withAccessor:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v3;
}

- (SCWDatabaseStoreCoordinator)storeCoordinator
{
  return self->_storeCoordinator;
}

- (void)readContentsOfZone:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SCWDatabase *)self schema];
  int v9 = [v8 schemaForZoneName:v6];

  if (v9)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy_;
    v22[4] = __Block_byref_object_dispose_;
    v23 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_29;
    block[3] = &unk_1E5FA3B50;
    id v20 = v7;
    uint64_t v21 = v22;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    uint64_t v11 = [(SCWDatabase *)self startupQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2_30;
    v14[3] = &unk_1E5FA3BA0;
    void v14[4] = self;
    id v15 = v9;
    long long v18 = v22;
    id v16 = v6;
    id v12 = v10;
    id v17 = v12;
    [v11 executeAfterStartup:v14];

    _Block_object_dispose(v22, 8);
    long long v13 = v23;
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke;
    v24[3] = &unk_1E5FA3B28;
    v24[4] = self;
    id v25 = v7;
    __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke((uint64_t)v24);
    long long v13 = v25;
  }
}

- (SCWDatabaseSchema)schema
{
  return self->_schema;
}

- (void)addObserver:(id)a3 forZone:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v8 = [(SCWDatabase *)self observersByZoneName];
  int v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    dispatch_block_t v10 = [(SCWDatabase *)self observersByZoneName];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
  [v9 addObject:v11];
  os_unfair_lock_unlock(p_observersLock);
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 features:(int64_t)a5 mergeHandlers:(id)a6 containerProxy:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v58.receiver = self;
  v58.super_class = (Class)SCWDatabase;
  id v17 = [(SCWDatabase *)&v58 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_schema, a3);
    uint64_t v19 = [v15 copy];
    mergeHandlers = v18->_mergeHandlers;
    v18->_mergeHandlers = (NSArray *)v19;

    uint64_t v21 = [[SCWStartupQueue alloc] initWithDeferredStartup:1];
    startupQueue = v18->_startupQueue;
    v18->_startupQueue = v21;

    v23 = [[SCWAsyncSerialQueue alloc] initWithQualityOfService:17];
    ckSyncQueue = v18->_ckSyncQueue;
    v18->_ckSyncQueue = v23;

    id v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create("SCWDatabase.callback", v25);
    callbackQueue = v18->_callbackQueue;
    v18->_callbackQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByZoneName = v18->_observersByZoneName;
    v18->_observersByZoneName = v28;

    v18->_observersLock._os_unfair_lock_opaque = 0;
    long long v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    zoneSnapshotsByZoneName = v18->_zoneSnapshotsByZoneName;
    v18->_zoneSnapshotsByZoneName = v30;

    if ([v14 conformsToProtocol:&unk_1F089C7A8]) {
      long long v32 = (SCWFauxDatabaseStoreCoordinator *)v14;
    }
    else {
      long long v32 = [[SCWFauxDatabaseStoreCoordinator alloc] initWithDatabaseStore:v14];
    }
    storeCoordinator = v18->_storeCoordinator;
    v18->_storeCoordinator = (SCWDatabaseStoreCoordinator *)v32;

    id v52 = v15;
    id v53 = v14;
    id v51 = v16;
    if (v16)
    {
      v34 = (SCWContainerProxying *)v16;
      container = v18->_container;
      v18->_container = v34;
    }
    else
    {
      container = [v13 containerID];
      id v36 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
      [v36 setCaptureResponseHTTPHeaders:1];
      [v36 setUseZoneWidePCS:1];
      uint64_t v37 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:container options:v36];
      __int16 v38 = v18->_container;
      v18->_container = (SCWContainerProxying *)v37;
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v39 = v13;
    __int16 v40 = [v13 zoneSchemas];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v55 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v46 = [[SCWZoneSnapshot alloc] initWithZoneSchema:v45 records:0];
          v47 = [(SCWDatabase *)v18 zoneSnapshotsByZoneName];
          v48 = [v45 zoneName];
          [v47 setObject:v46 forKeyedSubscript:v48];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v42);
    }

    v49 = [(SCWDatabase *)v18 storeCoordinator];
    [v49 addObserver:v18];

    [(SCWDatabase *)v18 _enqueueStartupSequenceWithFeatures:a5];
    id v13 = v39;
    id v15 = v52;
    id v14 = v53;
    id v16 = v51;
  }

  return v18;
}

- (id)_zonesNeedingFetch
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(SCWDatabase *)self schema];
  id v5 = [v4 zoneSchemas];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [(SCWDatabase *)self storeCoordinator];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __33__SCWDatabase__zonesNeedingFetch__block_invoke;
        v14[3] = &unk_1E5FA3BF0;
        void v14[4] = self;
        void v14[5] = v10;
        id v15 = v3;
        [v11 readZone:v10 withAccessor:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_enqueueStartupSequenceWithFeatures:(int64_t)a3
{
  id v5 = [(SCWDatabase *)self startupQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke;
  v18[3] = &unk_1E5FA3E68;
  v18[4] = self;
  v18[5] = a3;
  [v5 enqueueStartupBlock:v18];

  uint64_t v6 = [(SCWDatabase *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_55;
  v17[3] = &unk_1E5FA3DC8;
  v17[4] = self;
  [v6 enqueueStartupBlock:v17];

  if ((a3 & 4) != 0)
  {
    uint64_t v7 = [(SCWDatabase *)self startupQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_57;
    v16[3] = &unk_1E5FA3DC8;
    v16[4] = self;
    [v7 enqueueStartupBlock:v16];
  }
  uint64_t v8 = [(SCWDatabase *)self startupQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3_59;
  v15[3] = &unk_1E5FA3DC8;
  void v15[4] = self;
  [v8 enqueueStartupBlock:v15];

  int v9 = [(SCWDatabase *)self startupQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_8;
  v14[3] = &unk_1E5FA3BC8;
  void v14[4] = self;
  [v9 executeAfterStartup:v14];

  uint64_t v10 = [(SCWDatabase *)self startupQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_13;
  v13[3] = &unk_1E5FA3BC8;
  v13[4] = self;
  [v10 executeAfterStartup:v13];

  if ((a3 & 2) != 0)
  {
    id v11 = [(SCWDatabase *)self startupQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_18;
    v12[3] = &unk_1E5FA3BC8;
    v12[4] = self;
    [v11 executeAfterStartup:v12];
  }
}

- (SCWStartupQueue)startupQueue
{
  return self->_startupQueue;
}

- (id)_emptyZonesNeedingFirstSync
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(SCWDatabase *)self schema];
  id v5 = [v4 zoneSchemas];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [(SCWDatabase *)self storeCoordinator];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __42__SCWDatabase__emptyZonesNeedingFirstSync__block_invoke;
        v14[3] = &unk_1E5FA3BF0;
        void v14[4] = self;
        void v14[5] = v10;
        id v15 = v3;
        [v11 readZone:v10 withAccessor:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 features:(int64_t)a5 containerProxy:(id)a6
{
  return [(SCWDatabase *)self initWithSchema:a3 store:a4 features:a5 mergeHandlers:MEMORY[0x1E4F1CBF0] containerProxy:a6];
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 migrationPlan:(id)a5 containerProxy:(id)a6
{
  return [(SCWDatabase *)self initWithSchema:a3 store:a4 features:0 mergeHandlers:MEMORY[0x1E4F1CBF0] containerProxy:a6];
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 migrationPlan:(id)a5 features:(int64_t)a6 containerProxy:(id)a7
{
  return [(SCWDatabase *)self initWithSchema:a3 store:a4 features:0 mergeHandlers:MEMORY[0x1E4F1CBF0] containerProxy:a7];
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v4 = *(id *)(a1 + 40);
    dispatch_async(v2, block);
  }
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SCWErrorDomain" code:2 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)modifyContentsOfZone:(id)a3 withCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SCWDatabase *)self schema];
  int v9 = [v8 schemaForZoneName:v6];

  if (v9)
  {
    uint64_t v10 = [(SCWDatabase *)self startupQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_32;
    v12[3] = &unk_1E5FA3C68;
    v12[4] = self;
    id v13 = v9;
    id v14 = v7;
    [v10 executeAfterStartup:v12];

    id v11 = v13;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke;
    v15[3] = &unk_1E5FA3BC8;
    id v16 = v6;
    __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke((uint64_t)v15);
    id v11 = v16;
  }
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke(uint64_t a1)
{
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_32(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storeCoordinator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_2;
  v11[3] = &unk_1E5FA3BF0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v12 = v4;
  uint64_t v13 = v5;
  id v14 = v6;
  [v2 writeZone:v3 withAccessor:v11];

  uint64_t v7 = [*(id *)(a1 + 32) ckSyncQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_3;
  v9[3] = &unk_1E5FA3C40;
  uint64_t v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v7 enqueueBlock:v9];
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "addPendingCommands:", v5, v6, v7);

  [*(id *)(a1 + 40) _reloadSnapshotOfZone:*(void *)(a1 + 48) fromStore:v4];
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_5;
    v8[3] = &unk_1E5FA3C18;
    uint64_t v6 = (id *)v9;
    v9[0] = v3;
    uint64_t v7 = v3;
    [v5 _saveZoneToContainer:v4 allowRecoveryAttempt:1 completion:v8];
  }
  else
  {
    v9[1] = MEMORY[0x1E4F143A8];
    v9[2] = 3221225472;
    v9[3] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_4;
    v9[4] = &unk_1E5FA3B00;
    uint64_t v6 = (id *)&v10;
    id v10 = v3;
    v3[2](v3);
  }
}

uint64_t __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeObserver:(id)a3 forZone:(id)a4
{
  p_observersLock = &self->_observersLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_observersLock);
  int v9 = [(SCWDatabase *)self observersByZoneName];
  id v10 = [v9 objectForKeyedSubscript:v7];

  [v10 removeObject:v8];
  os_unfair_lock_unlock(p_observersLock);
}

- (void)handleRemoteNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWDatabase *)self startupQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke;
  v11[3] = &unk_1E5FA3D28;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 executeAfterStartup:v11];
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] ckSyncQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_2;
  v3[3] = &unk_1E5FA3D00;
  v3[4] = a1[4];
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 enqueueBlock:v3];
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    id v4 = [MEMORY[0x1E4F1A1D0] notificationFromRemoteNotificationDictionary:*(void *)(a1 + 40)];
    if ([v4 notificationType] == 4
      && ([v4 subscriptionID],
          id v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 isEqualToString:@"DatabaseSubscription"],
          v5,
          (v6 & 1) != 0))
    {
      id v7 = [*(id *)(a1 + 32) storeCoordinator];
      [v7 writeWithAccessor:&__block_literal_global_40];

      id v8 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_8;
      v17[3] = &unk_1E5FA3CD8;
      id v9 = &v18;
      id v18 = v3;
      id v10 = &v19;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      id v19 = v11;
      v17[4] = v12;
      [v8 _fetchDatabaseAndZoneChangesWithCompletion:v17];
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_5;
      v20[3] = &unk_1E5FA3C90;
      id v9 = &v21;
      id v21 = v3;
      id v10 = &v22;
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      id v22 = v15;
      v20[4] = v16;
      __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_5((uint64_t)v20);
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_3;
    v23[3] = &unk_1E5FA3C90;
    id v24 = v3;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 32);
    id v25 = v13;
    v23[4] = v14;
    __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_3((uint64_t)v23);

    id v4 = v24;
  }
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_4;
    block[3] = &unk_1E5FA3B00;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);
  }
}

uint64_t __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_6;
    block[3] = &unk_1E5FA3B00;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);
  }
}

uint64_t __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 setLastDirtyDate:v4];
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_9;
    v5[3] = &unk_1E5FA3B28;
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)pollForChangesWithCondition:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWDatabase *)self startupQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke;
  v11[3] = &unk_1E5FA3D28;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 executeAfterStartup:v11];
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] ckSyncQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_2;
  v3[3] = &unk_1E5FA3D00;
  v3[4] = a1[4];
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 enqueueBlock:v3];
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] status] == 1)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v4 = [a1[4] storeCoordinator];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_5;
    v17[3] = &unk_1E5FA3D50;
    id v18 = a1[5];
    id v19 = &v20;
    [v4 readWithAccessor:v17];

    if (*((unsigned char *)v21 + 24))
    {
      id v5 = a1[4];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_6;
      v14[3] = &unk_1E5FA3CD8;
      id v15 = v3;
      id v6 = a1[6];
      id v7 = a1[4];
      uint64_t v16 = v6;
      void v14[4] = v7;
      [v5 _fetchDatabaseAndZoneChangesWithCompletion:v14];
      id v8 = (id *)&v15;
      id v9 = v16;
    }
    else
    {
      v3[2](v3);
      if (!a1[6])
      {
LABEL_8:

        _Block_object_dispose(&v20, 8);
        goto LABEL_9;
      }
      id v9 = [a1[4] callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_8;
      block[3] = &unk_1E5FA3B00;
      id v8 = &v13;
      id v13 = a1[6];
      dispatch_async(v9, block);
    }

    goto LABEL_8;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_3;
  v24[3] = &unk_1E5FA3C90;
  id v25 = v3;
  id v10 = a1[6];
  id v11 = a1[4];
  id v26 = v10;
  v24[4] = v11;
  __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_3((uint64_t)v24);

LABEL_9:
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_4;
    block[3] = &unk_1E5FA3B00;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);
  }
}

uint64_t __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 lastSyncDate];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = (void *)v3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v11 lastSyncDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;
  [*(id *)(a1 + 32) minIntervalSinceLastSync];
  double v10 = v9;

  if (v8 >= v10) {
LABEL_3:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_7;
    v5[3] = &unk_1E5FA3B28;
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkSyncingEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabase *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E5FA3A68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ckSyncQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5FA3A90;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 enqueueBlock:v4];
}

void __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  if (*(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_3;
    v5[3] = &unk_1E5FA3B28;
    id v4 = *(id *)(a1 + 40);
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    dispatch_async(v3, v5);
  }
}

uint64_t __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  BOOL v2 = [*(id *)(a1 + 32) status] == 1;
  id v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);

  return v3(v1, v2);
}

- (void)savePendingChangesToServerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabase *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke;
  v7[3] = &unk_1E5FA3A68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) ckSyncQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5FA3D78;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 enqueueBlock:v4];
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 schema];
    id v6 = [v5 zoneSchemas];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_5;
    v15[3] = &unk_1E5FA3CD8;
    id v7 = &v16;
    id v16 = v3;
    id v8 = &v17;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v17 = v9;
    void v15[4] = v10;
    id v11 = v3;
    [v4 _saveZonesToContainer:v6 allowRecoveryAttempt:1 completion:v15];
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_3;
    v18[3] = &unk_1E5FA3C90;
    id v7 = &v19;
    id v19 = v3;
    id v8 = &v20;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v20 = v12;
    v18[4] = v13;
    id v14 = v3;
    __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_3((uint64_t)v18);
  }
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    BOOL v2 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_4;
    block[3] = &unk_1E5FA3B00;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);
  }
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SCWErrorDomain" code:3 userInfo:MEMORY[0x1E4F1CC08]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_6;
    v5[3] = &unk_1E5FA3B28;
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)synchronize
{
  id v3 = [(SCWDatabase *)self storeCoordinator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__SCWDatabase_synchronize__block_invoke;
  v4[3] = &unk_1E5FA3DA0;
  v4[4] = self;
  [v3 reloadWithAccessor:v4];
}

void __26__SCWDatabase_synchronize__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "schema", 0);
    id v7 = [v6 zoneSchemas];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = *(void **)(a1 + 32);
          id v14 = [v5 zoneStoreForSchema:v12];
          [v13 _reloadSnapshotOfZone:v12 fromStore:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)t_flushChangesWithTimeout:(double)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(SCWDatabase *)self startupQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke;
  v10[3] = &unk_1E5FA39D0;
  v10[4] = self;
  dispatch_semaphore_t v11 = v5;
  id v7 = v5;
  [v6 executeAfterStartup:v10];

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  LOBYTE(v5) = dispatch_semaphore_wait(v7, v8) == 0;

  return (char)v5;
}

void __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ckSyncQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke_2;
  v3[3] = &unk_1E5FA3DC8;
  id v4 = *(id *)(a1 + 40);
  [v2 enqueueBlock:v3];
}

void __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(NSObject **)(a1 + 32);
  id v3 = a2;
  dispatch_semaphore_signal(v2);
  v3[2]();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SCWDatabaseLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_53_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    dispatch_time_t v8 = [*(id *)(a1 + 32) schema];
    int v9 = [v8 requiresDeviceToDeviceEncryption];

    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [v5 accountStatus];
    if (v9)
    {
      if (v11 == 1) {
        uint64_t v12 = [v5 supportsDeviceToDeviceEncryption];
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = v11 == 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v12);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 storeCoordinator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_58;
  v6[3] = &unk_1E5FA3EB8;
  v6[4] = *(void *)(a1 + 32);
  [v5 writeWithAccessor:v6];

  v4[2](v4);
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_58(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "schema", 0);
  id v5 = [v4 zoneSchemas];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = [v3 zoneStoreForSchema:v10];
        [v11 _squashZoneForMerge:v10 zoneStore:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_7;
    v10[3] = &unk_1E5FA3EE0;
    uint64_t v6 = &v11;
    id v11 = v3;
    uint64_t v7 = &v12;
    id v12 = *(id *)(a1 + 48);
    id v8 = v3;
    [v4 _fetchZoneChangesForZones:v5 completion:v10];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_6;
    v13[3] = &unk_1E5FA3E18;
    uint64_t v6 = &v14;
    id v14 = v3;
    uint64_t v7 = &v15;
    id v15 = *(id *)(a1 + 48);
    id v9 = v3;
    __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_6((uint64_t)v13);
  }
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ckSyncQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_19;
  v3[3] = &unk_1E5FA3DC8;
  void v3[4] = *(void *)(a1 + 32);
  [v2 enqueueBlock:v3];
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_19(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) status] == 1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
    [v4 setShouldSendContentAvailable:1];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F19F50]) initWithSubscriptionID:@"DatabaseSubscription"];
    [v5 setNotificationInfo:v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1A1B8]);
    v9[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 setSubscriptionsToSave:v7];

    [v6 setModifySubscriptionsCompletionBlock:&__block_literal_global_69];
    [*(id *)(a1 + 32) _runCKOperation:v6];
    v3[2](v3);
  }
  else
  {
    id v8 = v3;
    ((void (*)(void))v3[2])();
    id v4 = v8;
  }
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  if (v4)
  {
    uint64_t v5 = SCWDatabaseLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_21_cold_1();
    }
  }
}

- (void)_fetchDatabaseAndZoneChangesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke;
  v6[3] = &unk_1E5FA3F28;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SCWDatabase *)self _fetchDatabaseChangesWithCompletion:v6];
}

void __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5FA3B28;
    id v4 = &v11;
    id v11 = *(id *)(a1 + 40);
    id v10 = v3;
    __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_2((uint64_t)v9);
    id v5 = v10;
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = [v6 _zonesNeedingFetch];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_3;
    v7[3] = &unk_1E5FA3C18;
    id v4 = &v8;
    id v8 = *(id *)(a1 + 40);
    [v6 _fetchZoneChangesForZones:v5 completion:v7];
  }
}

uint64_t __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchDatabaseChangesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = SCWDatabaseLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AFD01000, v5, OS_LOG_TYPE_DEFAULT, "will fetch database changes", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  char v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  id v6 = [(SCWDatabase *)self storeCoordinator];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke;
  v18[3] = &unk_1E5FA3F50;
  v18[4] = buf;
  [v6 readWithAccessor:v18];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1A038]);
  [v7 setPreviousServerChangeToken:*((void *)v20 + 5)];
  [v7 setFetchAllChanges:1];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2;
  v16[3] = &unk_1E5FA3F78;
  v16[4] = self;
  id v9 = v8;
  id v17 = v9;
  [v7 setRecordZoneWithIDChangedBlock:v16];
  [v7 setRecordZoneWithIDWasPurgedBlock:&__block_literal_global_76];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_77;
  v12[3] = &unk_1E5FA4010;
  v12[4] = self;
  id v15 = buf;
  id v10 = v9;
  id v13 = v10;
  id v11 = v4;
  id v14 = v11;
  [v7 setFetchDatabaseChangesCompletionBlock:v12];
  [(SCWDatabase *)self _runCKOperation:v7];

  _Block_object_dispose(buf, 8);
}

uint64_t __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 serverChangeToken];

  return MEMORY[0x1F41817F8]();
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SCWDatabaseLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 zoneName];
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1AFD01000, v4, OS_LOG_TYPE_DEFAULT, "fetching database changes reported a change to zone %{public}@", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) schema];
  id v7 = [v3 zoneName];
  id v8 = [v6 schemaForZoneName:v7];

  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_72;
    v9[3] = &unk_1E5FA3BC8;
    id v10 = v3;
    __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_72((uint64_t)v9);
  }
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_72(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) zoneName];
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "ignoring change to unknown zone: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_77(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (v7)
  {
    int v9 = objc_msgSend(v7, "sc_hasUnderlyingErrorCode:", 21);
    id v10 = SCWDatabaseLog();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFD01000, v11, OS_LOG_TYPE_DEFAULT, "encountered expired change token for database", buf, 2u);
      }

      id v11 = [*(id *)(a1 + 32) storeCoordinator];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_80;
      v14[3] = &unk_1E5FA3FE8;
      void v14[4] = *(void *)(a1 + 56);
      void v14[5] = &v21;
      [v11 writeWithAccessor:v14];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_77_cold_1();
    }
  }
  else
  {
    id v12 = SCWDatabaseLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFD01000, v12, OS_LOG_TYPE_DEFAULT, "successfully fetched database changes", buf, 2u);
    }

    uint64_t v13 = [*(id *)(a1 + 32) storeCoordinator];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_78;
    v15[3] = &unk_1E5FA3FC0;
    uint64_t v18 = *(void *)(a1 + 56);
    long long v16 = v6;
    id v17 = *(id *)(a1 + 40);
    id v19 = &v21;
    [v13 writeWithAccessor:v15];

    id v11 = v16;
  }

  if (*((unsigned char *)v22 + 24)) {
    [*(id *)(a1 + 32) _fetchDatabaseChangesWithCompletion:*(void *)(a1 + 48)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  _Block_object_dispose(&v21, 8);
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = [v3 serverChangeToken];
  LODWORD(v4) = objc_msgSend(v4, "scw_object:isEqualToObject:", v5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

  if (v4)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v3 setLastSyncDate:v6];

    [v3 setServerChangeToken:*(void *)(a1 + 32)];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(v3, "zoneStoreForSchema:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
          uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
          [v12 setLastDirtyDate:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v6 = v3;
  id v5 = [v3 serverChangeToken];
  LODWORD(v4) = objc_msgSend(v4, "scw_object:isEqualToObject:", v5, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));

  if (v4)
  {
    [v6 setServerChangeToken:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_fetchZoneChangesForZones:(id)a3 completion:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v11 = [(SCWDatabase *)self storeCoordinator];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2;
    v46[3] = &unk_1E5FA4038;
    id v29 = v6;
    id v47 = v6;
    id v48 = v8;
    id v12 = v9;
    id v49 = v12;
    id v13 = v10;
    id v50 = v13;
    long long v14 = v8;
    [v11 readWithAccessor:v46];

    long long v15 = SCWDatabaseLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v57 = v12;
      _os_log_impl(&dword_1AFD01000, v15, OS_LOG_TYPE_DEFAULT, "will fetch changes for zones: %{public}@", buf, 0xCu);
    }

    id v16 = objc_alloc_init(MEMORY[0x1E4F1A070]);
    [v16 setRecordZoneIDs:v14];
    [v16 setConfigurationsByRecordZoneID:v13];
    [v16 setFetchAllChanges:1];
    long long v17 = [MEMORY[0x1E4F1CA60] dictionary];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_84;
    v44[3] = &unk_1E5FA4060;
    id v18 = v17;
    id v45 = v18;
    [v16 setRecordWasChangedBlock:v44];
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2_86;
    v42[3] = &unk_1E5FA4088;
    id v20 = v19;
    id v43 = v20;
    [v16 setRecordWithIDWasDeletedBlock:v42];
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_3;
    v35[3] = &unk_1E5FA4100;
    id v36 = v18;
    id v37 = v20;
    __int16 v38 = self;
    id v39 = v13;
    id v22 = v21;
    id v40 = v22;
    id v23 = v7;
    id v41 = v23;
    id v7 = v13;
    id v24 = v18;
    id v25 = v20;
    [v16 setRecordZoneFetchCompletionBlock:v35];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_94;
    v30[3] = &unk_1E5FA4128;
    id v31 = v22;
    long long v32 = self;
    id v33 = v12;
    id v34 = v23;
    id v26 = v22;
    id v27 = v23;
    id v28 = v12;
    [v16 setFetchRecordZoneChangesCompletionBlock:v30];
    [(SCWDatabase *)self _runCKOperation:v16];

    id v6 = v29;
  }
  else
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    id v53 = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke;
    long long v54 = &unk_1E5FA3B00;
    id v55 = v7;
    long long v14 = (void (**)(id, void))v7;
    v14[2](v14, 0);
  }
}

uint64_t __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v3 zoneStoreForSchema:v8];
        uint64_t v10 = *(void **)(a1 + 40);
        uint64_t v11 = [v8 zoneID];
        [v10 addObject:v11];

        id v12 = *(void **)(a1 + 48);
        id v13 = [v8 zoneName];
        [v12 addObject:v13];

        id v14 = objc_alloc_init(MEMORY[0x1E4F1A060]);
        long long v15 = [v9 serverChangeToken];
        [v14 setPreviousServerChangeToken:v15];

        id v16 = [v8 allRecordFieldNames];
        [v14 setDesiredKeys:v16];

        long long v17 = *(void **)(a1 + 56);
        id v18 = [v8 zoneID];
        [v17 setObject:v14 forKeyedSubscript:v18];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_84(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v17 = v4;
    uint64_t v6 = [v4 recordID];
    id v7 = [v6 zoneID];
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    uint64_t v9 = v8;
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v17 recordID];
    id v12 = [v11 zoneID];
    [v10 setObject:v9 forKeyedSubscript:v12];

    if (!v8) {
    id v13 = *(void **)(a1 + 32);
    }
    id v14 = [v17 recordID];
    long long v15 = [v14 zoneID];
    id v16 = [v13 objectForKeyedSubscript:v15];
    [v16 addObject:v17];

    id v4 = v17;
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v13 = v3;
  uint64_t v5 = [v3 zoneID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v13 zoneID];
  [v8 setObject:v7 forKeyedSubscript:v9];

  if (!v6) {
  uint64_t v10 = *(void **)(a1 + 32);
  }
  uint64_t v11 = [v13 zoneID];
  id v12 = [v10 objectForKeyedSubscript:v11];
  [v12 addObject:v13];
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  if (v13 && !objc_msgSend(v13, "sc_hasUnderlyingErrorCode:", 26))
  {
    if (objc_msgSend(v14, "sc_hasUnderlyingErrorCode:", 21))
    {
      long long v30 = SCWDatabaseLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v10 zoneName];
        *(_DWORD *)buf = 138543362;
        uint64_t v59 = (uint64_t)v31;
        _os_log_impl(&dword_1AFD01000, v30, OS_LOG_TYPE_DEFAULT, "encountered expired change token for zone %{public}@", buf, 0xCu);
      }
      long long v32 = [*(id *)(a1 + 48) schema];
      id v33 = [v10 zoneName];
      id v34 = [v32 schemaForZoneName:v33];

      if (v34)
      {
        v35 = [*(id *)(a1 + 48) storeCoordinator];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_92;
        v41[3] = &unk_1E5FA40D8;
        id v36 = &v42;
        id v42 = *(id *)(a1 + 56);
        id v43 = v10;
        id v44 = *(id *)(a1 + 64);
        id v45 = v34;
        [v35 writeZone:v45 withAccessor:v41];
      }
      else
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_91;
        v46[3] = &unk_1E5FA3BC8;
        id v36 = &v47;
        id v47 = v10;
        __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_91((uint64_t)v46);
      }
    }
    else if (objc_msgSend(v14, "sc_hasUnderlyingErrorCode:", 112))
    {
      id v37 = SCWDatabaseLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v38 = [v10 zoneName];
        *(_DWORD *)buf = 138543362;
        uint64_t v59 = (uint64_t)v38;
        _os_log_impl(&dword_1AFD01000, v37, OS_LOG_TYPE_DEFAULT, "encountered missing identity error fetching changes for zone %{public}@, so attempting to recover", buf, 0xCu);
      }
      [*(id *)(a1 + 48) _recoverFromIdentityLossWithCompletion:*(void *)(a1 + 72)];
    }
  }
  else
  {
    id v39 = v12;
    id v40 = v11;
    long long v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    id v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
    id v17 = [[SCWZoneDiff alloc] initWithModifiedRecords:v15 deletedRecordIDs:v16];
    id v18 = SCWDatabaseLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v15 count];
      uint64_t v20 = [v16 count];
      long long v21 = [v10 zoneName];
      *(_DWORD *)buf = 134218498;
      uint64_t v59 = v19;
      __int16 v60 = 2048;
      uint64_t v61 = v20;
      __int16 v62 = 2114;
      v63 = v21;
      _os_log_impl(&dword_1AFD01000, v18, OS_LOG_TYPE_DEFAULT, "fetched %lu changed records and %lu deleted records for zone %{public}@", buf, 0x20u);
    }
    long long v22 = [*(id *)(a1 + 48) schema];
    long long v23 = [v10 zoneName];
    id v24 = [v22 schemaForZoneName:v23];

    if (v24)
    {
      uint64_t v25 = [*(id *)(a1 + 48) storeCoordinator];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_90;
      v48[3] = &unk_1E5FA40B0;
      id v26 = &v49;
      id v49 = *(id *)(a1 + 56);
      id v50 = v10;
      id v51 = v40;
      id v27 = v17;
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v52 = v27;
      uint64_t v53 = v28;
      id v29 = v24;
      id v54 = v29;
      id v55 = *(id *)(a1 + 64);
      [v25 writeZone:v29 withAccessor:v48];
    }
    else
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_89;
      v56[3] = &unk_1E5FA3BC8;
      id v26 = &v57;
      id v57 = v10;
      __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_89((uint64_t)v56);
    }

    id v12 = v39;
    id v11 = v40;
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_89(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) zoneName];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "ignoring changes to unknown zone %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 previousServerChangeToken];

  uint64_t v6 = (void *)MEMORY[0x1E4FBA8A8];
  id v7 = [v3 serverChangeToken];
  LODWORD(v6) = objc_msgSend(v6, "scw_object:isEqualToObject:", v7, v5);

  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    [v3 setLastSyncDate:v8];

    [v3 setServerChangeToken:*(void *)(a1 + 48)];
    if ([*(id *)(a1 + 56) isEmpty])
    {
      uint64_t v9 = SCWDatabaseLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [*(id *)(a1 + 40) zoneName];
        *(_DWORD *)buf = 138543362;
        long long v22 = v10;
        _os_log_impl(&dword_1AFD01000, v9, OS_LOG_TYPE_DEFAULT, "no changes to process for zone %{public}@", buf, 0xCu);
      }
    }
    else
    {
      [v3 applyServerRecordsDiff:*(void *)(a1 + 56)];
      [*(id *)(a1 + 64) _reloadSnapshotOfZone:*(void *)(a1 + 72) fromStore:v3];
      id v11 = [*(id *)(a1 + 64) zoneSnapshotsByZoneName];
      id v12 = [*(id *)(a1 + 72) zoneName];
      uint64_t v9 = [v11 objectForKeyedSubscript:v12];

      id v13 = SCWDatabaseLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 72) zoneName];
        uint64_t v20 = [v3 serverRecords];
        uint64_t v15 = [v20 count];
        id v16 = [v9 allRecords];
        uint64_t v17 = [v16 count];
        id v18 = [v3 pendingCommands];
        uint64_t v19 = [v9 descriptionOfContents];
        *(_DWORD *)buf = 138544386;
        long long v22 = v14;
        __int16 v23 = 2048;
        uint64_t v24 = v15;
        __int16 v25 = 2048;
        uint64_t v26 = v17;
        __int16 v27 = 2114;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        long long v30 = v19;
        _os_log_impl(&dword_1AFD01000, v13, OS_LOG_TYPE_DEFAULT, "fetched changes for zone %{public}@ from server resulting in %lu server records, %lu client records, pending commands: %{public}@, and client contents: %{public}@", buf, 0x34u);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 80) addObject:*(void *)(a1 + 72)];
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_91(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) zoneName];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "ignoring expired change token for unknown zone %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_92(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v4 = [v3 previousServerChangeToken];

  uint64_t v5 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v6 = [v7 serverChangeToken];
  LODWORD(v5) = objc_msgSend(v5, "scw_object:isEqualToObject:", v6, v4);

  if (v5)
  {
    [v7 setServerChangeToken:0];
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_94(id *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([a1[4] count])
  {
    int v4 = SCWDatabaseLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1AFD01000, v4, OS_LOG_TYPE_DEFAULT, "retrying fetch changes for zones: %{public}@", buf, 0xCu);
    }

    [a1[5] _fetchZoneChangesForZones:a1[4] completion:a1[7]];
  }
  else if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_95;
    v8[3] = &unk_1E5FA3958;
    id v9 = a1[6];
    id v10 = v3;
    id v11 = a1[7];
    __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_95((uint64_t)v8);
  }
  else
  {
    uint64_t v6 = SCWDatabaseLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = a1[6];
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1AFD01000, v6, OS_LOG_TYPE_DEFAULT, "successfully fetched changes for zones: %{public}@", buf, 0xCu);
    }

    (*((void (**)(void))a1[7] + 2))();
  }
}

uint64_t __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_95(uint64_t a1)
{
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_95_cold_1(a1, v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_saveZoneToContainer:(id)a3 allowRecoveryAttempt:(BOOL)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy_;
  id v44 = __Block_byref_object_dispose_;
  id v45 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  id v10 = [(SCWDatabase *)self storeCoordinator];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke;
  v30[3] = &unk_1E5FA4170;
  void v30[4] = self;
  id v11 = v8;
  id v31 = v11;
  long long v32 = &v40;
  id v33 = v39;
  id v34 = &v35;
  [v10 readZone:v11 withAccessor:v30];

  if (*((unsigned char *)v36 + 24) && ![(id)v41[5] isEmpty])
  {
    id v13 = SCWDatabaseLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v11 zoneName];
      *(_DWORD *)buf = 138543362;
      id v47 = v14;
      _os_log_impl(&dword_1AFD01000, v13, OS_LOG_TYPE_DEFAULT, "will save zone %{public}@", buf, 0xCu);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1A198]);
    [v12 setSavePolicy:0];
    objc_msgSend(v12, "setAtomic:", objc_msgSend(v11, "isAtomic"));
    [(id)v41[5] applyToModifyRecordsOperation:v12];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_102;
    v18[3] = &unk_1E5FA4280;
    BOOL v24 = a4;
    id v21 = v9;
    id v15 = v11;
    id v19 = v15;
    uint64_t v20 = self;
    long long v22 = &v40;
    __int16 v23 = v39;
    [v12 setModifyRecordsCompletionBlock:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_115;
    v16[3] = &unk_1E5FA42A8;
    id v17 = v15;
    [v12 setRequestCompletedBlock:v16];
    [(SCWDatabase *)self _runCKOperation:v12];
  }
  else
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    __int16 v27 = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3;
    uint64_t v28 = &unk_1E5FA3B00;
    __int16 v29 = (void (**)(id, void))v9;
    v29[2](v29, 0);
    id v12 = v29;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v11 = [v3 _zoneWithSchema:v4 zoneStore:v5];
  uint64_t v6 = [v11 clientDiff];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 pendingCommands];
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v9 count];

  id v10 = [v5 pendingCommands];

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = objc_msgSend(v10, "scw_containsObjectPassingTest:", &__block_literal_global_98);
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [v2 shouldDeferUpload] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_102(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      if (objc_msgSend(v9, "sc_hasUnderlyingErrorCode:", 26))
      {
        id v11 = SCWDatabaseLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [*(id *)(a1 + 32) zoneName];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1AFD01000, v11, OS_LOG_TYPE_DEFAULT, "failed to save zone %{public}@ because the zone does not exist, so creating it before trying again", (uint8_t *)&buf, 0xCu);
        }
        id v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void **)(a1 + 40);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_105;
        v46[3] = &unk_1E5FA41C0;
        id v47 = v13;
        id v15 = *(id *)(a1 + 48);
        uint64_t v48 = *(void *)(a1 + 40);
        id v49 = v15;
        [v14 _createZoneInContainerWithSchema:v47 completion:v46];
      }
      else if (objc_msgSend(v10, "sc_hasUnderlyingErrorCode:", 14))
      {
        long long v22 = SCWDatabaseLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = [*(id *)(a1 + 32) zoneName];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v23;
          _os_log_impl(&dword_1AFD01000, v22, OS_LOG_TYPE_DEFAULT, "encountered merge conflicts saving zone %{public}@, so fetching server changes before trying again", (uint8_t *)&buf, 0xCu);
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v61 = 0x3032000000;
        __int16 v62 = __Block_byref_object_copy_;
        v63 = __Block_byref_object_dispose_;
        id v64 = 0;
        BOOL v24 = [*(id *)(a1 + 40) storeCoordinator];
        uint64_t v25 = *(void *)(a1 + 32);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_107;
        v45[3] = &unk_1E5FA41E8;
        v45[4] = &buf;
        [v24 readZone:v25 withAccessor:v45];

        uint64_t v26 = *(void **)(a1 + 40);
        uint64_t v59 = *(void *)(a1 + 32);
        __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_108;
        v40[3] = &unk_1E5FA4230;
        id v41 = *(id *)(a1 + 32);
        id v28 = *(id *)(a1 + 48);
        uint64_t v42 = *(void *)(a1 + 40);
        id v43 = v28;
        p_long long buf = &buf;
        [v26 _fetchZoneChangesForZones:v27 completion:v40];

        _Block_object_dispose(&buf, 8);
      }
      else if (objc_msgSend(v10, "sc_hasUnderlyingErrorCode:", 11))
      {
        __int16 v29 = SCWDatabaseLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          long long v30 = [*(id *)(a1 + 32) zoneName];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v30;
          _os_log_impl(&dword_1AFD01000, v29, OS_LOG_TYPE_DEFAULT, "encountered unknown item saving zone %{public}@, so staging the zone for merge before trying again", (uint8_t *)&buf, 0xCu);
        }
        id v31 = [*(id *)(a1 + 40) storeCoordinator];
        int8x16_t v37 = *(int8x16_t *)(a1 + 32);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_114;
        v38[3] = &unk_1E5FA4258;
        int8x16_t v39 = vextq_s8(v37, v37, 8uLL);
        [v31 writeZone:(id)v37.i64[0] withAccessor:v38];

        [*(id *)(a1 + 40) _saveZoneToContainer:*(void *)(a1 + 32) allowRecoveryAttempt:1 completion:*(void *)(a1 + 48)];
      }
      else
      {
        int v32 = objc_msgSend(v10, "sc_hasUnderlyingErrorCode:", 112);
        id v33 = SCWDatabaseLog();
        id v34 = v33;
        if (v32)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = [*(id *)(a1 + 32) zoneName];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v35;
            _os_log_impl(&dword_1AFD01000, v34, OS_LOG_TYPE_DEFAULT, "encountered missing identity error saving zone %{public}@, so attempting to recover", (uint8_t *)&buf, 0xCu);
          }
          [*(id *)(a1 + 40) _recoverFromIdentityLossWithCompletion:*(void *)(a1 + 48)];
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_102_cold_1(a1);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
    }
    else
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_103;
      v56[3] = &unk_1E5FA3B28;
      id v58 = *(id *)(a1 + 48);
      id v57 = v10;
      __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_103((uint64_t)v56);
    }
  }
  else
  {
    id v16 = SCWDatabaseLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [*(id *)(a1 + 32) zoneName];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1AFD01000, v16, OS_LOG_TYPE_DEFAULT, "successfully saved zone %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v18 = [*(id *)(a1 + 40) storeCoordinator];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_104;
    v50[3] = &unk_1E5FA4198;
    int8x16_t v36 = *(int8x16_t *)(a1 + 32);
    id v19 = (id)v36.i64[0];
    int8x16_t v51 = vextq_s8(v36, v36, 8uLL);
    uint64_t v54 = *(void *)(a1 + 56);
    id v52 = v7;
    id v20 = v8;
    uint64_t v21 = *(void *)(a1 + 64);
    id v53 = v20;
    uint64_t v55 = v21;
    [v18 writeZone:v19 withAccessor:v50];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_103(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _zoneWithSchema:*(void *)(a1 + 40) zoneStore:v3];
  id v5 = [v4 clientDiff];
  if ([v5 hasSameBaseAsDiff:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])
  {
    uint64_t v6 = [[SCWZoneDiff alloc] initWithModifiedRecords:*(void *)(a1 + 48) deletedRecordIDs:*(void *)(a1 + 56)];
    [v3 applyServerRecordsDiff:v6];
    [v3 clearPendingCommandsUpToCount:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  }
  else
  {
    SCWDatabaseLog();
    uint64_t v6 = (SCWZoneDiff *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) zoneName];
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1AFD01000, &v6->super, OS_LOG_TYPE_DEFAULT, "not committing save for zone %{public}@ because it was modified in the interim", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_105(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_106;
    v4[3] = &unk_1E5FA3958;
    id v5 = a1[4];
    id v6 = v3;
    id v7 = a1[6];
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_106((uint64_t)v4);
  }
  else
  {
    [a1[5] _saveZoneToContainer:a1[4] allowRecoveryAttempt:1 completion:a1[6]];
  }
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_106(uint64_t a1)
{
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_106_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_107(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 serverChangeToken];

  return MEMORY[0x1F41817F8]();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_108(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_109;
    v16[3] = &unk_1E5FA3958;
    id v17 = *(id *)(a1 + 32);
    id v18 = v3;
    id v19 = *(id *)(a1 + 48);
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_109((uint64_t)v16);
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    uint64_t v4 = [*(id *)(a1 + 40) storeCoordinator];
    uint64_t v5 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_110;
    v9[3] = &unk_1E5FA41E8;
    void v9[4] = &v10;
    [v4 readZone:v5 withAccessor:v9];

    if ([(id)v11[5] isEqual:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
    {
      id v6 = SCWDatabaseLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [*(id *)(a1 + 32) zoneName];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v21 = v7;
        _os_log_impl(&dword_1AFD01000, v6, OS_LOG_TYPE_DEFAULT, "resetting change token for zone %{public}@ because it's missing server changes but didn't get any when fetching", buf, 0xCu);
      }
      int v8 = [*(id *)(a1 + 40) storeCoordinator];
      [v8 writeZone:*(void *)(a1 + 32) withAccessor:&__block_literal_global_113];
    }
    [*(id *)(a1 + 40) _saveZoneToContainer:*(void *)(a1 + 32) allowRecoveryAttempt:1 completion:*(void *)(a1 + 48)];
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_109(uint64_t a1)
{
  id v2 = SCWDatabaseLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_109_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_110(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 serverChangeToken];

  return MEMORY[0x1F41817F8]();
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_111(uint64_t a1, void *a2)
{
  return [a2 setServerChangeToken:0];
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_114(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _squashZoneForMerge:*(void *)(a1 + 40) zoneStore:a2];
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SCWDatabaseLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) zoneName];
    id v6 = [v3 requestUUID];
    int v7 = 138543618;
    int v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1AFD01000, v4, OS_LOG_TYPE_DEFAULT, "issued request for zone %{public}@ with UUID %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_saveZonesToContainer:(id)a3 allowRecoveryAttempt:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    uint64_t v10 = [v8 firstObject];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_2;
    v13[3] = &unk_1E5FA42D0;
    uint64_t v11 = &v16;
    id v16 = v9;
    id v14 = v8;
    id v15 = self;
    BOOL v17 = v6;
    id v12 = v9;
    [(SCWDatabase *)self _saveZoneToContainer:v10 allowRecoveryAttempt:v6 completion:v13];
  }
  else
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke;
    uint64_t v21 = &unk_1E5FA3B00;
    uint64_t v11 = &v22;
    id v22 = v9;
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_3;
    v5[3] = &unk_1E5FA3B28;
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_3((uint64_t)v5);
  }
  else
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) mutableCopy];
    [v4 removeObjectAtIndex:0];
    [*(id *)(a1 + 40) _saveZonesToContainer:v4 allowRecoveryAttempt:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_squashZoneForMerge:(id)a3 zoneStore:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  -[SCWDatabase _reloadSnapshotOfZone:fromStore:](self, "_reloadSnapshotOfZone:fromStore:", v6);
  id v7 = [MEMORY[0x1E4F1CA48] array];
  char v38 = self;
  id v8 = [(SCWDatabase *)self zoneSnapshotsByZoneName];
  int8x16_t v36 = v6;
  id v9 = [v6 zoneName];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v34 = v10;
  id obj = [v10 allRecords];
  uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v59 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v16 = [(SCWDatabase *)v38 mergeHandlers];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v58 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v41 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [*(id *)(*((void *)&v40 + 1) + 8 * j) commandsToMergeRecordWithServer:v15];
              [v7 addObjectsFromArray:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v58 count:16];
          }
          while (v18);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v59 count:16];
    }
    while (v12);
  }

  id v22 = v35;
  [v35 setServerRecords:MEMORY[0x1E4F1CBF0]];
  [v35 setServerChangeToken:0];
  [v35 setLastSyncDate:0];
  [v35 setLastDirtyDate:0];
  [v35 setPendingCommands:v7];
  __int16 v23 = v36;
  [(SCWDatabase *)v38 _reloadSnapshotOfZone:v36 fromStore:v35];
  BOOL v24 = [(SCWDatabase *)v38 zoneSnapshotsByZoneName];
  uint64_t v25 = [v36 zoneName];
  uint64_t v26 = [v24 objectForKeyedSubscript:v25];

  __int16 v27 = SCWDatabaseLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v36 zoneName];
    int8x16_t v39 = [v35 serverRecords];
    uint64_t v29 = [v39 count];
    long long v30 = [v26 allRecords];
    uint64_t v31 = [v30 count];
    int v32 = [v35 pendingCommands];
    id v33 = [v26 descriptionOfContents];
    *(_DWORD *)long long buf = 138544386;
    id v49 = v28;
    __int16 v50 = 2048;
    uint64_t v51 = v29;
    __int16 v52 = 2048;
    uint64_t v53 = v31;
    __int16 v54 = 2114;
    uint64_t v55 = v32;
    __int16 v56 = 2114;
    id v57 = v33;
    _os_log_impl(&dword_1AFD01000, v27, OS_LOG_TYPE_DEFAULT, "finished staging zone %{public}@ for merge resulting in %lu server records, %lu client records, pending commands: %{public}@, and client contents: %{public}@", buf, 0x34u);

    __int16 v23 = v36;
    id v22 = v35;
  }
}

- (void)_createZoneInContainerWithSchema:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1A310];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = [v8 zoneName];

  uint64_t v11 = (void *)[v9 initWithZoneName:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1A180]);
  v17[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v12 setRecordZonesToSave:v13];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__SCWDatabase__createZoneInContainerWithSchema_completion___block_invoke;
  v15[3] = &unk_1E5FA42F8;
  id v16 = v6;
  id v14 = v6;
  [v12 setModifyRecordZonesCompletionBlock:v15];
  [(SCWDatabase *)self _runCKOperation:v12];
}

uint64_t __59__SCWDatabase__createZoneInContainerWithSchema_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_deleteAndRecreateAllZonesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A180]);
  id v6 = [(SCWDatabase *)self schema];
  id v7 = [v6 zoneIDs];
  [v5 setRecordZoneIDsToDelete:v7];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke;
  id v12 = &unk_1E5FA4320;
  uint64_t v13 = self;
  id v14 = v4;
  id v8 = v4;
  [v5 setModifyRecordZonesCompletionBlock:&v9];
  -[SCWDatabase _runCKOperation:](self, "_runCKOperation:", v5, v9, v10, v11, v12, v13);
}

void __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9 && (objc_msgSend(v9, "sc_hasUnderlyingErrorCode:", 26) & 1) == 0)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_2;
    v31[3] = &unk_1E5FA3B28;
    id v33 = *(id *)(a1 + 40);
    id v32 = v10;
    __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_2((uint64_t)v31);

    uint64_t v11 = v33;
  }
  else
  {
    id v23 = v8;
    id v24 = v7;
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = [*(id *)(a1 + 32) schema];
    uint64_t v13 = [v12 zoneSchemas];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
          id v19 = objc_alloc(MEMORY[0x1E4F1A310]);
          id v20 = [v18 zoneName];
          uint64_t v21 = (void *)[v19 initWithZoneName:v20];

          [v11 addObject:v21];
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v15);
    }

    id v22 = objc_alloc_init(MEMORY[0x1E4F1A180]);
    [v22 setRecordZonesToSave:v11];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_3;
    v25[3] = &unk_1E5FA42F8;
    id v26 = *(id *)(a1 + 40);
    [v22 setModifyRecordZonesCompletionBlock:v25];
    [*(id *)(a1 + 32) _runCKOperation:v22];

    id v8 = v23;
    id v7 = v24;
  }
}

uint64_t __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_recoverFromIdentityLossWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabase *)self storeCoordinator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke;
  v9[3] = &unk_1E5FA3EB8;
  void v9[4] = self;
  [v5 writeWithAccessor:v9];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5FA3F28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SCWDatabase *)self _deleteAndRecreateAllZonesWithCompletion:v7];
}

void __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "schema", 0);
  id v5 = [v4 zoneSchemas];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 32);
        id v12 = [v3 zoneStoreForSchema:v10];
        [v11 _squashZoneForMerge:v10 zoneStore:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_3;
    v10[3] = &unk_1E5FA3B28;
    id v4 = &v12;
    id v12 = *(id *)(a1 + 40);
    id v11 = v3;
    __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_3((uint64_t)v10);
    id v5 = v11;
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v5 = [v6 schema];
    uint64_t v7 = [v5 zoneSchemas];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_4;
    v8[3] = &unk_1E5FA3C18;
    id v4 = &v9;
    id v9 = *(id *)(a1 + 40);
    [v6 _saveZonesToContainer:v7 allowRecoveryAttempt:0 completion:v8];
  }
}

uint64_t __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_runCKOperation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 configuration];
  uint64_t v6 = (void *)[v5 copy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v10 = v8;

  [v10 setAutomaticallyRetryNetworkFailures:0];
  [v10 setDiscretionaryNetworkBehavior:0];
  [v4 setConfiguration:v10];
  id v9 = [(SCWDatabase *)self container];
  [v9 addDatabaseOperation:v4];
}

- (id)_sanitizeErrorForClients:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"SCWErrorDomain" code:1 userInfo:v6];

  return v7;
}

- (void)setSchema:(id)a3
{
}

- (void)setStoreCoordinator:(id)a3
{
}

- (SCWContainerProxying)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSArray)mergeHandlers
{
  return self->_mergeHandlers;
}

- (void)setMergeHandlers:(id)a3
{
}

- (void)setStartupQueue:(id)a3
{
}

- (void)setCkSyncQueue:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setObserversByZoneName:(id)a3
{
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (void)setZoneSnapshotsByZoneName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSnapshotsByZoneName, 0);
  objc_storeStrong((id *)&self->_observersByZoneName, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_ckSyncQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_mergeHandlers, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_storeCoordinator, 0);

  objc_storeStrong((id *)&self->_schema, 0);
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1AFD01000, v0, v1, "failed to fetch account info with error: %{public}@", v2, v3, v4, v5, v6);
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1AFD01000, v0, v1, "failed to save database subscription with error: %{public}@", v2, v3, v4, v5, v6);
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_77_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1AFD01000, v0, v1, "failed to fetch database changes with error: %{public}@", v2, v3, v4, v5, v6);
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_95_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1AFD01000, a2, OS_LOG_TYPE_ERROR, "failed to fetch changes for zones: %{public}@ with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_102_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) zoneName];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1AFD01000, v2, v3, "failed to save zone %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_106_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) zoneName];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1AFD01000, v2, v3, "failed to create zone %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_109_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) zoneName];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1AFD01000, v2, v3, "failed to save zone %{public}@ because we couldn't fetch changes due to error: %{public}@", v4, v5, v6, v7, v8);
}

@end