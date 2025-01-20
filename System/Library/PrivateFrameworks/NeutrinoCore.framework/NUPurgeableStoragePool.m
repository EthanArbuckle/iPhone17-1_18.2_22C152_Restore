@interface NUPurgeableStoragePool
+ (void)initialize;
+ (void)purge:(BOOL)a3;
+ (void)reapAllPurged;
+ (void)reapAllVolatile;
- (Class)storageClass;
- (NSMutableArray)nonPurgeableList;
- (NSMutableArray)volatileList;
- (NUPurgeableStoragePool)init;
- (NUPurgeableStoragePool)initWithStorageClass:(Class)a3;
- (NUStoragePoolStats)stats;
- (OS_dispatch_queue)migrationQueue;
- (OS_dispatch_queue)stateQueue;
- (double)migrationDelay;
- (id)_allocateStorageWithSize:(id)a3 format:(id)a4;
- (id)_popOldestNonPurgeableStorage;
- (id)_storageFromPoolWithSize:(id)a3 format:(id)a4 exactMatch:(BOOL)a5;
- (id)debugDescription;
- (id)newStorageWithMinimumSize:(id)a3 format:(id)a4;
- (id)newStorageWithSize:(id)a3 format:(id)a4;
- (id)newStorageWithSize:(id)a3 format:(id)a4 exactMatch:(BOOL)a5;
- (id)reapPurged;
- (id)reapVolatile;
- (int64_t)nonPurgeableLimit;
- (int64_t)purgeableLimit;
- (void)_enforcePurgableLimit;
- (void)_migrateAllNonPurgeableStorageIfNoRecentActivity:(unint64_t)a3;
- (void)_migrateOldestNonPurgeableStorageToPurgeable;
- (void)_migrateStorageToPurgeable:(id)a3;
- (void)_migrationTimer:(unint64_t)a3;
- (void)_reapPurged;
- (void)_reapVolatile;
- (void)_reclaimSharedStorages;
- (void)_resetNonPurgeableStorageMigrationTimer;
- (void)_returnNonPurgeableStorage:(id)a3;
- (void)_returnPurgedStorage:(id)a3;
- (void)_returnStorage:(id)a3;
- (void)_returnVolatileStorage:(id)a3;
- (void)_scheduleMigrationTimer;
- (void)migrateAllNonPurgeableStorage;
- (void)purge:(BOOL)a3;
- (void)returnStorage:(id)a3;
- (void)waitForMigration;
@end

@implementation NUPurgeableStoragePool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageClass, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_nonPurgeableList, 0);
  objc_storeStrong((id *)&self->_volatileList, 0);
  objc_storeStrong((id *)&self->_sharedStoragesToBeReclaimedList, 0);

  objc_storeStrong((id *)&self->_stats, 0);
}

- (Class)storageClass
{
  return self->_storageClass;
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NSMutableArray)nonPurgeableList
{
  return self->_nonPurgeableList;
}

- (NSMutableArray)volatileList
{
  return self->_volatileList;
}

- (double)migrationDelay
{
  return self->_migrationDelay;
}

- (int64_t)purgeableLimit
{
  return self->_purgeableLimit;
}

- (int64_t)nonPurgeableLimit
{
  return self->_nonPurgeableLimit;
}

- (id)debugDescription
{
  v3 = [(NUPurgeableStoragePool *)self reapPurged];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [(NUPurgeableStoragePool *)self storageClass];
  v7 = [v3 description];
  v8 = [v4 stringWithFormat:@"%@<%@>:%p stats:\n%@", v5, v6, self, v7];

  return v8;
}

- (void)waitForMigration
{
}

- (void)_migrateStorageToPurgeable:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v9 = NUAssertLogger_1597();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "storage != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_1597();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v16;
        __int16 v30 = 2114;
        v31 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool _migrateStorageToPurgeable:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 652, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"storage != nil");
  }
  uint64_t v5 = v4;
  [v4 makePurgeable];
  uint64_t v6 = [v5 sizeInBytes];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NUPurgeableStoragePool__migrateStorageToPurgeable___block_invoke;
  block[3] = &unk_1E5D95C28;
  block[4] = self;
  id v26 = v5;
  uint64_t v27 = v6;
  id v8 = v5;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__NUPurgeableStoragePool__migrateStorageToPurgeable___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 64) addObject:a1[5]];
  objc_msgSend(*(id *)(a1[4] + 8), "setVolatileCount:", objc_msgSend(*(id *)(a1[4] + 8), "volatileCount") + 1);
  objc_msgSend(*(id *)(a1[4] + 8), "setVolatileBytes:", a1[6] + objc_msgSend(*(id *)(a1[4] + 8), "volatileBytes"));
  objc_msgSend(*(id *)(a1[4] + 8), "setMigrationCount:", objc_msgSend(*(id *)(a1[4] + 8), "migrationCount") + 1);
  objc_msgSend(*(id *)(a1[4] + 8), "setMigrationBytes:", a1[6] + objc_msgSend(*(id *)(a1[4] + 8), "migrationBytes"));
  v2 = (void *)a1[4];

  return [v2 _enforcePurgableLimit];
}

- (id)_popOldestNonPurgeableStorage
{
  if ([(NSMutableArray *)self->_nonPurgeableList count])
  {
    v3 = [(NSMutableArray *)self->_nonPurgeableList objectAtIndex:0];
    [(NSMutableArray *)self->_nonPurgeableList removeObjectAtIndex:0];
    [(NUStoragePoolStats *)self->_stats setNonPurgeableCount:[(NUStoragePoolStats *)self->_stats nonPurgeableCount] - 1];
    -[NUStoragePoolStats setNonPurgeableBytes:](self->_stats, "setNonPurgeableBytes:", -[NUStoragePoolStats nonPurgeableBytes](self->_stats, "nonPurgeableBytes") - [v3 sizeInBytes]);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_migrateOldestNonPurgeableStorageToPurgeable
{
  v3 = [(NUPurgeableStoragePool *)self _popOldestNonPurgeableStorage];
  id v4 = v3;
  if (v3)
  {
    migrationQueue = self->_migrationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__NUPurgeableStoragePool__migrateOldestNonPurgeableStorageToPurgeable__block_invoke;
    v6[3] = &unk_1E5D95E18;
    v6[4] = self;
    id v7 = v3;
    dispatch_async(migrationQueue, v6);
  }
}

uint64_t __70__NUPurgeableStoragePool__migrateOldestNonPurgeableStorageToPurgeable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _migrateStorageToPurgeable:*(void *)(a1 + 40)];
}

- (void)_migrateAllNonPurgeableStorageIfNoRecentActivity:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v14;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1613;
  BOOL v13 = __Block_byref_object_dispose__1614;
  id v14 = 0;
  do
  {
    id *v6 = 0;

    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__NUPurgeableStoragePool__migrateAllNonPurgeableStorageIfNoRecentActivity___block_invoke;
    block[3] = &unk_1E5D958C0;
    void block[5] = &v9;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(stateQueue, block);
    if (v10[5]) {
      -[NUPurgeableStoragePool _migrateStorageToPurgeable:](self, "_migrateStorageToPurgeable:");
    }
    uint64_t v6 = (id *)(v10 + 5);
    uint64_t v5 = (void *)v10[5];
  }
  while (v5);
  _Block_object_dispose(&v9, 8);
}

void *__75__NUPurgeableStoragePool__migrateAllNonPurgeableStorageIfNoRecentActivity___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  result = (void *)a1[4];
  if (v2 == result[2])
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = [result _popOldestNonPurgeableStorage];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)migrateAllNonPurgeableStorage
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke;
  block[3] = &unk_1E5D95E40;
  block[4] = self;
  void block[5] = v7;
  dispatch_sync(stateQueue, block);
  migrationQueue = self->_migrationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke_2;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = v7;
  dispatch_sync(migrationQueue, v5);
  _Block_object_dispose(v7, 8);
}

uint64_t __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _migrateAllNonPurgeableStorageIfNoRecentActivity:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)_migrationTimer:(unint64_t)a3
{
  self->_migrationTimerScheduled = 0;
  if (self->_nonPurgeableActivityCounter == a3)
  {
    [(NUPurgeableStoragePool *)self _reclaimSharedStorages];
    migrationQueue = self->_migrationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__NUPurgeableStoragePool__migrationTimer___block_invoke;
    v6[3] = &unk_1E5D95558;
    v6[4] = self;
    void v6[5] = a3;
    dispatch_async(migrationQueue, v6);
  }
  else
  {
    [(NUPurgeableStoragePool *)self _scheduleMigrationTimer];
  }
}

uint64_t __42__NUPurgeableStoragePool__migrationTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _migrateAllNonPurgeableStorageIfNoRecentActivity:*(void *)(a1 + 40)];
}

- (void)_scheduleMigrationTimer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_migrationTimerScheduled)
  {
    uint64_t v6 = NUAssertLogger_1597();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"migration timer already scheduled!"];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger_1597();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        BOOL v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v13;
        __int16 v25 = 2114;
        id v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool _scheduleMigrationTimer]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 541, @"migration timer already scheduled!", v18, v19, v20, v21, v22[0]);
  }
  unint64_t nonPurgeableActivityCounter = self->_nonPurgeableActivityCounter;
  dispatch_time_t v4 = NUDispatchSeconds(self->_migrationDelay);
  stateQueue = self->_stateQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__49__NUPurgeableStoragePool__scheduleMigrationTimer__block_invoke;
  v22[3] = (uint64_t)&unk_1E5D95558;
  v22[4] = (uint64_t)self;
  v22[5] = nonPurgeableActivityCounter;
  dispatch_after(v4, stateQueue, v22);
  self->_migrationTimerScheduled = 1;
}

uint64_t __49__NUPurgeableStoragePool__scheduleMigrationTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _migrationTimer:*(void *)(a1 + 40)];
}

- (void)_resetNonPurgeableStorageMigrationTimer
{
  if (!self->_migrationTimerScheduled) {
    [(NUPurgeableStoragePool *)self _scheduleMigrationTimer];
  }
}

- (void)_reapVolatile
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v4 = 0;
  if ([(NSMutableArray *)self->_volatileList count])
  {
    unint64_t v5 = 0;
    p_vtable = NUStoragePoolStats.vtable;
    do
    {
      id v7 = [(NSMutableArray *)self->_volatileList objectAtIndex:v5];
      if ([v7 isInUse])
      {
        if (p_vtable[253] != (void *)-1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
        }
        id v8 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = NSString;
          BOOL v10 = v8;
          uint64_t v11 = [v9 stringWithFormat:@"Volatile storage is still in use"];
          *(_DWORD *)buf = 138543362;
          v31 = v11;
          _os_log_impl(&dword_1A9892000, v10, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v12 = (uint64_t)p_vtable[253];
        }
        else
        {
          uint64_t v12 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v12 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          BOOL v13 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            uint64_t v19 = (void *)MEMORY[0x1E4F29060];
            id v29 = specific;
            uint64_t v20 = v13;
            uint64_t v21 = [v19 callStackSymbols];
            uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v31 = specific;
            __int16 v32 = 2114;
            v33 = v22;
            _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            p_vtable = (void **)(NUStoragePoolStats + 24);
          }
        }
        else
        {
          if (v12 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          uint64_t v23 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = (void *)MEMORY[0x1E4F29060];
            __int16 v25 = v23;
            id v26 = [v24 callStackSymbols];
            uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            v31 = v27;
            _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _reapVolatile]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 501, @"Volatile storage is still in use", v14, v15, v16, v17, v28);
      }
      if (([v7 isInUse] & 1) == 0)
      {
        v4 += [v7 sizeInBytes];
        [v3 addIndex:v5];
      }

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_volatileList count]);
  }
  if ([v3 count])
  {
    [(NSMutableArray *)self->_volatileList removeObjectsAtIndexes:v3];
    -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") - [v3 count]);
    [(NUStoragePoolStats *)self->_stats setVolatileBytes:[(NUStoragePoolStats *)self->_stats volatileBytes] - v4];
    -[NUStoragePoolStats setPurgedCount:](self->_stats, "setPurgedCount:", -[NUStoragePoolStats purgedCount](self->_stats, "purgedCount") + [v3 count]);
    [(NUStoragePoolStats *)self->_stats setPurgedBytes:[(NUStoragePoolStats *)self->_stats purgedBytes] + v4];
  }
}

- (void)_reapPurged
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v3 = 0;
  if ([(NSMutableArray *)self->_volatileList count])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = [(NSMutableArray *)self->_volatileList objectAtIndex:v4];
      if ([v5 isPurged])
      {
        v3 += [v5 sizeInBytes];
        [v6 addIndex:v4];
      }

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_volatileList count]);
  }
  if ([v6 count])
  {
    [(NSMutableArray *)self->_volatileList removeObjectsAtIndexes:v6];
    -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") - [v6 count]);
    [(NUStoragePoolStats *)self->_stats setVolatileBytes:[(NUStoragePoolStats *)self->_stats volatileBytes] - v3];
    -[NUStoragePoolStats setPurgedCount:](self->_stats, "setPurgedCount:", -[NUStoragePoolStats purgedCount](self->_stats, "purgedCount") + [v6 count]);
    [(NUStoragePoolStats *)self->_stats setPurgedBytes:[(NUStoragePoolStats *)self->_stats purgedBytes] + v3];
  }
}

- (id)reapVolatile
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1613;
  BOOL v10 = __Block_byref_object_dispose__1614;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__NUPurgeableStoragePool_reapVolatile__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__NUPurgeableStoragePool_reapVolatile__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reapVolatile];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)reapPurged
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1613;
  BOOL v10 = __Block_byref_object_dispose__1614;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__NUPurgeableStoragePool_reapPurged__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __36__NUPurgeableStoragePool_reapPurged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reapPurged];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)purge:(BOOL)a3
{
  BOOL v3 = a3;
  [(NUPurgeableStoragePool *)self migrateAllNonPurgeableStorage];
  if (v3) {
    id v5 = [(NUPurgeableStoragePool *)self reapVolatile];
  }
}

- (NUStoragePoolStats)stats
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1613;
  BOOL v10 = __Block_byref_object_dispose__1614;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__NUPurgeableStoragePool_stats__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NUStoragePoolStats *)v3;
}

uint64_t __31__NUPurgeableStoragePool_stats__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)_returnNonPurgeableStorage:(id)a3
{
  id v5 = a3;
  -[NSMutableArray addObject:](self->_nonPurgeableList, "addObject:");
  if ((unint64_t)[(NSMutableArray *)self->_nonPurgeableList count] > self->_nonPurgeableLimit) {
    [(NUPurgeableStoragePool *)self _migrateOldestNonPurgeableStorageToPurgeable];
  }
  uint64_t v4 = [v5 sizeInBytes];
  [(NUStoragePoolStats *)self->_stats setUsedCount:[(NUStoragePoolStats *)self->_stats usedCount] - 1];
  [(NUStoragePoolStats *)self->_stats setUsedBytes:[(NUStoragePoolStats *)self->_stats usedBytes] - v4];
  [(NUStoragePoolStats *)self->_stats setNonPurgeableCount:[(NUStoragePoolStats *)self->_stats nonPurgeableCount] + 1];
  [(NUStoragePoolStats *)self->_stats setNonPurgeableBytes:[(NUStoragePoolStats *)self->_stats nonPurgeableBytes] + v4];
  [(NUPurgeableStoragePool *)self _resetNonPurgeableStorageMigrationTimer];
}

- (void)_returnPurgedStorage:(id)a3
{
  uint64_t v4 = [a3 sizeInBytes];
  [(NUStoragePoolStats *)self->_stats setUsedCount:[(NUStoragePoolStats *)self->_stats usedCount] - 1];
  [(NUStoragePoolStats *)self->_stats setUsedBytes:[(NUStoragePoolStats *)self->_stats usedBytes] - v4];
  [(NUStoragePoolStats *)self->_stats setPurgedCount:[(NUStoragePoolStats *)self->_stats purgedCount] + 1];
  stats = self->_stats;
  int64_t v6 = [(NUStoragePoolStats *)stats purgedBytes] + v4;

  [(NUStoragePoolStats *)stats setPurgedBytes:v6];
}

- (void)_returnVolatileStorage:(id)a3
{
  volatileList = self->_volatileList;
  id v5 = a3;
  [(NSMutableArray *)volatileList addObject:v5];
  uint64_t v6 = [v5 sizeInBytes];

  [(NUStoragePoolStats *)self->_stats setUsedCount:[(NUStoragePoolStats *)self->_stats usedCount] - 1];
  [(NUStoragePoolStats *)self->_stats setUsedBytes:[(NUStoragePoolStats *)self->_stats usedBytes] - v6];
  [(NUStoragePoolStats *)self->_stats setVolatileCount:[(NUStoragePoolStats *)self->_stats volatileCount] + 1];
  [(NUStoragePoolStats *)self->_stats setVolatileBytes:[(NUStoragePoolStats *)self->_stats volatileBytes] + v6];

  [(NUPurgeableStoragePool *)self _enforcePurgableLimit];
}

- (void)_enforcePurgableLimit
{
  for (i = self->_volatileList;
        (unint64_t)[(NSMutableArray *)i count] > self->_purgeableLimit;
        i = self->_volatileList)
  {
    uint64_t v4 = [(NSMutableArray *)self->_volatileList firstObject];
    [(NSMutableArray *)self->_volatileList removeObjectAtIndex:0];
    [(NUStoragePoolStats *)self->_stats setVolatileCount:[(NUStoragePoolStats *)self->_stats volatileCount] - 1];
    -[NUStoragePoolStats setVolatileBytes:](self->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](self->_stats, "volatileBytes") - [v4 sizeInBytes]);
    [(NUStoragePoolStats *)self->_stats setDiscardedCount:[(NUStoragePoolStats *)self->_stats discardedCount] + 1];
  }
}

- (void)returnStorage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((Class)objc_opt_class() != self->_storageClass)
  {
    id v7 = NUAssertLogger_1597();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "storage.class == _storageClass");
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v10 = NUAssertLogger_1597();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        uint64_t v17 = [v15 callStackSymbols];
        uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        id v29 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool returnStorage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 280, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"storage.class == _storageClass");
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NUPurgeableStoragePool_returnStorage___block_invoke;
  block[3] = &unk_1E5D95E18;
  id v24 = v4;
  __int16 v25 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

uint64_t __40__NUPurgeableStoragePool_returnStorage___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) decrementUseCount];
  int v3 = [*(id *)(*(void *)(a1 + 40) + 32) containsObject:*(void *)(a1 + 32)];
  id v4 = *(id **)(a1 + 40);
  if (v3)
  {
    if (v2)
    {
      [v4[4] removeObject:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _reclaimSharedStorages];
LABEL_5:
      uint64_t v6 = *(void *)(a1 + 32);
      id v5 = *(void **)(a1 + 40);
      return [v5 _returnStorage:v6];
    }
    return [v4 _resetNonPurgeableStorageMigrationTimer];
  }
  else
  {
    [v4 _reclaimSharedStorages];
    if (v2) {
      goto LABEL_5;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 32);
    return [v9 addObject:v8];
  }
}

- (void)_returnStorage:(id)a3
{
  id v4 = a3;
  [v4 invalidate];
  if ([v4 isPurgeable])
  {
    if ([v4 isPurged]) {
      [(NUPurgeableStoragePool *)self _returnPurgedStorage:v4];
    }
    else {
      [(NUPurgeableStoragePool *)self _returnVolatileStorage:v4];
    }
  }
  else
  {
    [(NUPurgeableStoragePool *)self _returnNonPurgeableStorage:v4];
  }
}

- (id)_storageFromPoolWithSize:(id)a3 format:(id)a4 exactMatch:(BOOL)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(NUPurgeableStoragePool *)self _reclaimSharedStorages];
  uint64_t v9 = [(NSMutableArray *)self->_nonPurgeableList count];
  v123 = v8;
  v119 = self;
  if (!v9) {
    goto LABEL_51;
  }
  uint64_t v10 = v9;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = [(NSMutableArray *)self->_nonPurgeableList reverseObjectEnumerator];
  uint64_t v11 = [obj countByEnumeratingWithState:&v133 objects:v142 count:16];
  if (!v11) {
    goto LABEL_33;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v134;
  while (2)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v10 - 1;
    uint64_t v124 = v10 - v12;
    do
    {
      if (*(void *)v134 != v13) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v133 + 1) + 8 * v14);
      if ([v16 isInUse])
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
        }
        uint64_t v17 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = NSString;
          uint64_t v19 = v17;
          uint64_t v20 = [v18 stringWithFormat:@"No item in the non purgeable list should be in use"];
          *(_DWORD *)buf = 138543362;
          v139 = v20;
          _os_log_impl(&dword_1A9892000, v19, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v21 = _NULogOnceToken;
        }
        else
        {
          uint64_t v21 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v21 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          uint64_t v22 = (void *)_NUAssertLogger;
          if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          __int16 v28 = (void *)MEMORY[0x1E4F29060];
          id v122 = specific;
          loga = v22;
          id v29 = [v28 callStackSymbols];
          uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v139 = specific;
          __int16 v140 = 2114;
          v141 = v30;
          v31 = loga;
          _os_log_error_impl(&dword_1A9892000, loga, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
        else
        {
          if (v21 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          __int16 v32 = (void *)_NUAssertLogger;
          if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          v37 = (void *)MEMORY[0x1E4F29060];
          v31 = v32;
          v38 = [v37 callStackSymbols];
          v39 = [v38 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v139 = v39;
          _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
LABEL_21:
        _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 169, @"No item in the non purgeable list should be in use", v23, v24, v25, v26, v115);
      }
      if ([v16 size] == var0 && v33 == var1)
      {
        v35 = [v16 format];
        int v36 = [v123 isEqualToPixelFormat:v35];

        if (v36)
        {
          self = v119;
          if ([v16 isPurgeable])
          {
            if (_NULogOnceToken != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
            }
            v41 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
            {
              v42 = NSString;
              v43 = v41;
              v44 = [v42 stringWithFormat:@"Purgeable storage found in non-purgeable list!"];
              *(_DWORD *)buf = 138543362;
              v139 = v44;
              _os_log_impl(&dword_1A9892000, v43, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

              uint64_t v45 = _NULogOnceToken;
            }
            else
            {
              uint64_t v45 = -1;
            }
            if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
            {
              if (v45 != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
              }
              v46 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v52 = (void *)MEMORY[0x1E4F29060];
                id v53 = v51;
                v54 = v46;
                v55 = [v52 callStackSymbols];
                v56 = [v55 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543618;
                v139 = v51;
                __int16 v140 = 2114;
                v141 = v56;
                _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

                self = v119;
              }
            }
            else
            {
              if (v45 != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
              }
              v57 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v107 = (void *)MEMORY[0x1E4F29060];
                v108 = v57;
                v109 = [v107 callStackSymbols];
                v110 = [v109 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543362;
                v139 = v110;
                _os_log_error_impl(&dword_1A9892000, v108, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
              }
            }
            _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 172, @"Purgeable storage found in non-purgeable list!", v47, v48, v49, v50, v115);
          }
          v58 = v16;
          [(NSMutableArray *)self->_nonPurgeableList removeObjectAtIndex:v15];
          [(NUStoragePoolStats *)self->_stats setNonPurgeableCount:[(NUStoragePoolStats *)self->_stats nonPurgeableCount] - 1];
          -[NUStoragePoolStats setNonPurgeableBytes:](self->_stats, "setNonPurgeableBytes:", -[NUStoragePoolStats nonPurgeableBytes](self->_stats, "nonPurgeableBytes")- [v58 sizeInBytes]);
          [(NUStoragePoolStats *)self->_stats setReusedNonPurgeableCount:[(NUStoragePoolStats *)self->_stats reusedNonPurgeableCount] + 1];
          [(NUPurgeableStoragePool *)self _resetNonPurgeableStorageMigrationTimer];

          id v8 = v123;
          if (v58) {
            goto LABEL_106;
          }
          goto LABEL_51;
        }
      }
      ++v14;
      --v15;
    }
    while (v12 != v14);
    uint64_t v40 = [obj countByEnumeratingWithState:&v133 objects:v142 count:16];
    uint64_t v12 = v40;
    uint64_t v10 = v124;
    if (v40) {
      continue;
    }
    break;
  }
LABEL_33:

  id v8 = v123;
  self = v119;
LABEL_51:
  v58 = (char *)[(NSMutableArray *)self->_volatileList count];
  if (!v58) {
    goto LABEL_106;
  }
  v59 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id obja = [(NSMutableArray *)self->_volatileList reverseObjectEnumerator];
  uint64_t v60 = [obja countByEnumeratingWithState:&v129 objects:v137 count:16];
  if (!v60)
  {
    uint64_t v88 = 0;
    v58 = 0;
    goto LABEL_101;
  }
  os_log_t log = v59;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  uint64_t v61 = *(void *)v130;
  uint64_t v116 = 138543618;
  while (2)
  {
    uint64_t v62 = 0;
    while (2)
    {
      if (*(void *)v130 != v61) {
        objc_enumerationMutation(obja);
      }
      v63 = *(void **)(*((void *)&v129 + 1) + 8 * v62);
      if (objc_msgSend(v63, "isInUse", v116))
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
        }
        v64 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v65 = NSString;
          v66 = v64;
          v67 = [v65 stringWithFormat:@"No item in the purgeable list should be in use"];
          *(_DWORD *)buf = 138543362;
          v139 = v67;
          _os_log_impl(&dword_1A9892000, v66, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v68 = _NULogOnceToken;
        }
        else
        {
          uint64_t v68 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v68 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          v69 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v75 = (void *)MEMORY[0x1E4F29060];
            id v118 = v74;
            v117 = v69;
            v76 = [v75 callStackSymbols];
            v77 = [v76 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = v116;
            v139 = v74;
            __int16 v140 = 2114;
            v141 = v77;
            _os_log_error_impl(&dword_1A9892000, v117, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            id v8 = v123;
          }
        }
        else
        {
          if (v68 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          v78 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v84 = (void *)MEMORY[0x1E4F29060];
            v85 = v78;
            v86 = [v84 callStackSymbols];
            v87 = [v86 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            v139 = v87;
            _os_log_error_impl(&dword_1A9892000, v85, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            id v8 = v123;
          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 197, @"No item in the purgeable list should be in use", v70, v71, v72, v73, v116);
      }
      --v58;
      if ([v63 size] == var0 && v79 == var1)
      {
        v81 = [v63 format];
        int v82 = [v8 isEqualToPixelFormat:v81];

        if (v82)
        {
          int v83 = [v63 makeNonPurgeable];
          [log addIndex:v58];
          if (!v83)
          {
            v125 += [v63 sizeInBytes];
            ++v126;
            goto LABEL_81;
          }
          v58 = v63;
          self = v119;
          [(NUStoragePoolStats *)v119->_stats setVolatileCount:[(NUStoragePoolStats *)v119->_stats volatileCount] - 1];
          v59 = log;
          uint64_t v60 = v125;
          uint64_t v88 = v126;
          if (([(NUStoragePoolStats *)v119->_stats volatileCount] & 0x8000000000000000) == 0) {
            goto LABEL_100;
          }
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
          }
          v89 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
          {
            v90 = NSString;
            v91 = v89;
            v92 = [v90 stringWithFormat:@"volatileCount count should not be negative"];
            *(_DWORD *)buf = 138543362;
            v139 = v92;
            _os_log_impl(&dword_1A9892000, v91, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

            uint64_t v93 = _NULogOnceToken;
            if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
            {
              if (v93 != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
              }
LABEL_93:
              v94 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v99 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v100 = (void *)MEMORY[0x1E4F29060];
                id v101 = v99;
                v102 = v94;
                v103 = [v100 callStackSymbols];
                v104 = [v103 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = v116;
                v139 = v99;
                __int16 v140 = 2114;
                v141 = v104;
                _os_log_error_impl(&dword_1A9892000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

                v59 = log;
                uint64_t v88 = v126;
              }
LABEL_99:
              _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 211, @"volatileCount count should not be negative", v95, v96, v97, v98, v116);
LABEL_100:
              -[NUStoragePoolStats setVolatileBytes:](v119->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](v119->_stats, "volatileBytes") - [v58 sizeInBytes]);
              [(NUStoragePoolStats *)v119->_stats setReusedVolatileCount:[(NUStoragePoolStats *)v119->_stats reusedVolatileCount] + 1];
              goto LABEL_101;
            }
            if (v93 != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
            }
          }
          else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            goto LABEL_93;
          }
          v105 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v111 = (void *)MEMORY[0x1E4F29060];
            v112 = v105;
            v113 = [v111 callStackSymbols];
            v114 = [v113 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            v139 = v114;
            _os_log_error_impl(&dword_1A9892000, v112, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
          goto LABEL_99;
        }
      }
LABEL_81:
      if (v60 != ++v62) {
        continue;
      }
      break;
    }
    uint64_t v60 = [obja countByEnumeratingWithState:&v129 objects:v137 count:16];
    if (v60) {
      continue;
    }
    break;
  }
  v58 = 0;
  self = v119;
  v59 = log;
  uint64_t v60 = v125;
  uint64_t v88 = v126;
LABEL_101:

  if ([v59 count]) {
    [(NSMutableArray *)self->_volatileList removeObjectsAtIndexes:v59];
  }
  if (v88)
  {
    [(NUStoragePoolStats *)self->_stats setVolatileCount:[(NUStoragePoolStats *)self->_stats volatileCount] - v88];
    [(NUStoragePoolStats *)self->_stats setVolatileBytes:[(NUStoragePoolStats *)self->_stats volatileBytes] - v60];
    [(NUStoragePoolStats *)self->_stats setPurgedCount:[(NUStoragePoolStats *)self->_stats purgedCount] + v88];
    [(NUStoragePoolStats *)self->_stats setPurgedBytes:[(NUStoragePoolStats *)self->_stats purgedBytes] + v60];
  }

LABEL_106:
  [v58 setIsDirty:1];

  return v58;
}

- (void)_reclaimSharedStorages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_sharedStoragesToBeReclaimedList count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    int v3 = self->_sharedStoragesToBeReclaimedList;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (!v4)
    {
      uint64_t v6 = v3;
      goto LABEL_16;
    }
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isInUse", (void)v10) & 1) == 0)
        {
          [(NUPurgeableStoragePool *)self _returnStorage:v9];
          if (!v6) {
            uint64_t v6 = objc_opt_new();
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);

    if (v6)
    {
      [(NSMutableArray *)self->_sharedStoragesToBeReclaimedList removeObjectsInArray:v6];
LABEL_16:
    }
  }
}

- (id)_allocateStorageWithSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(self->_storageClass), "initWithSize:format:", var0, var1, v7);
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_138);
  }
  uint64_t v9 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109634;
    v11[1] = var0;
    __int16 v12 = 1024;
    int v13 = var1;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl(&dword_1A9892000, v9, OS_LOG_TYPE_DEBUG, "Allocating new storage of size: %dx%d, format: %@", (uint8_t *)v11, 0x18u);
  }

  return v8;
}

- (id)newStorageWithSize:(id)a3 format:(id)a4 exactMatch:(BOOL)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__1613;
  uint64_t v49 = __Block_byref_object_dispose__1614;
  id v50 = 0;
  if (var1 < 1 || var0 <= 0)
  {
    __int16 v14 = NUAssertLogger_1597();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "size.height > 0 && size.width > 0");
      *(_DWORD *)buf = 138543362;
      v52 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_1597();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v27;
        __int16 v53 = 2114;
        v54 = v29;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v30 = "size.height > 0 && size.width > 0";
    uint64_t v31 = 88;
LABEL_21:

    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool newStorageWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", v31, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)v30);
  }
  if (!v9)
  {
    uint64_t v21 = NUAssertLogger_1597();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelFormat != nil");
      *(_DWORD *)buf = 138543362;
      v52 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_1597();
    BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v24)
      {
        __int16 v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        __int16 v53 = 2114;
        v54 = v34;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v26;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v30 = "pixelFormat != nil";
    uint64_t v31 = 89;
    goto LABEL_21;
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NUPurgeableStoragePool_newStorageWithSize_format_exactMatch___block_invoke;
  block[3] = &unk_1E5D93F18;
  v41 = &v45;
  int64_t v42 = var0;
  int64_t v43 = var1;
  void block[4] = self;
  id v40 = v9;
  BOOL v44 = a5;
  id v11 = v9;
  dispatch_sync(stateQueue, block);
  id v12 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  return v12;
}

uint64_t __63__NUPurgeableStoragePool_newStorageWithSize_format_exactMatch___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_storageFromPoolWithSize:format:exactMatch:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v5)
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_allocateStorageWithSize:format:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40));
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  [v5 incrementUseCount];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setUsedCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "usedCount") + 1);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setUsedBytes:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "usedBytes")+ objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "sizeInBytes"));
  id v9 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = [v9 requestCount] + 1;

  return [v9 setRequestCount:v10];
}

- (id)newStorageWithMinimumSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = a4;
  uint64_t v8 = NUPixelSizeAlignToGrid(var0, var1, 256, 256, 0);
  id v10 = -[NUPurgeableStoragePool newStorageWithSize:format:exactMatch:](self, "newStorageWithSize:format:exactMatch:", v8, v9, v7, 0);

  return v10;
}

- (id)newStorageWithSize:(id)a3 format:(id)a4
{
  return -[NUPurgeableStoragePool newStorageWithSize:format:exactMatch:](self, "newStorageWithSize:format:exactMatch:", a3.var0, a3.var1, a4, 1);
}

- (NUPurgeableStoragePool)initWithStorageClass:(Class)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v22 = NUAssertLogger_1597();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "storageClass != nil");
      *(_DWORD *)buf = 138543362;
      id v40 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger_1597();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        id v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        __int16 v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v40 = v29;
        __int16 v41 = 2114;
        int64_t v42 = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v40 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool initWithStorageClass:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 46, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"storageClass != nil");
  }
  v38.receiver = self;
  v38.super_class = (Class)NUPurgeableStoragePool;
  uint64_t v4 = [(NUPurgeableStoragePool *)&v38 init];
  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("NUPurgeableStoragePool.stateQueue", v5);
  stateQueue = v4->_stateQueue;
  v4->_stateQueue = (OS_dispatch_queue *)v6;

  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("NUPurgeableStoragePool.migrationQueue", v8);
  migrationQueue = v4->_migrationQueue;
  v4->_migrationQueue = (OS_dispatch_queue *)v9;

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:256];
  volatileList = v4->_volatileList;
  v4->_volatileList = (NSMutableArray *)v11;

  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:256];
  nonPurgeableList = v4->_nonPurgeableList;
  v4->_nonPurgeableList = (NSMutableArray *)v13;

  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:256];
  sharedStoragesToBeReclaimedList = v4->_sharedStoragesToBeReclaimedList;
  v4->_sharedStoragesToBeReclaimedList = (NSMutableArray *)v15;

  objc_storeStrong((id *)&v4->_storageClass, a3);
  uint64_t v17 = objc_alloc_init(NUStoragePoolStats);
  stats = v4->_stats;
  v4->_stats = v17;

  v4->_nonPurgeableLimit = +[NUGlobalSettings storagePoolNonPurgeableLimit];
  v4->_purgeableLimit = +[NUGlobalSettings storagePoolPurgeableLimit];
  +[NUGlobalSettings storagePoolMigrationDelay];
  v4->_migrationDelay = v19;
  id v20 = (id)s_pools;
  objc_sync_enter(v20);
  [(id)s_pools compact];
  [(id)s_pools addPointer:v4];
  objc_sync_exit(v20);

  return v4;
}

- (NUPurgeableStoragePool)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    uint64_t v5 = v3;
    dispatch_queue_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    dispatch_queue_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    id v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    __int16 v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    id v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  id v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  id v29 = specific;
  __int16 v30 = 2114;
  id v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 41, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (void)purge:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (id)s_pools;
  objc_sync_enter(v4);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)s_pools;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "purge:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

+ (void)reapAllVolatile
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (id)s_pools;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)s_pools;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (v7) {
          id v8 = (id)objc_msgSend(v7, "reapVolatile", (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

+ (void)reapAllPurged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (id)s_pools;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)s_pools;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (v7) {
          id v8 = (id)objc_msgSend(v7, "reapPurged", (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_1684);
  }
}

uint64_t __36__NUPurgeableStoragePool_initialize__block_invoke()
{
  s_pools = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];

  return MEMORY[0x1F41817F8]();
}

@end