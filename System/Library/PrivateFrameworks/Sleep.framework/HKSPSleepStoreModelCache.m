@interface HKSPSleepStoreModelCache
- (BOOL)sleepEventRecordNeedsUpdate;
- (BOOL)sleepModeNeedsUpdate;
- (BOOL)sleepScheduleNeedsUpdate;
- (BOOL)sleepScheduleStateNeedsUpdate;
- (BOOL)sleepSettingsNeedsUpdate;
- (HKSPSleepEventRecord)sleepEventRecord;
- (HKSPSleepSchedule)sleepSchedule;
- (HKSPSleepSettings)sleepSettings;
- (HKSPSleepStoreModelCache)init;
- (id)_locked_cachedSleepEventRecord;
- (id)_locked_cachedSleepSchedule;
- (id)_locked_cachedSleepSettings;
- (id)cachedSleepEventRecord;
- (id)cachedSleepEventRecordWithMissHandler:(id)a3;
- (id)cachedSleepModeWithMissHandler:(id)a3;
- (id)cachedSleepSchedule;
- (id)cachedSleepScheduleModelWithMissHandler:(id)a3;
- (id)cachedSleepScheduleStateWithMissHandler:(id)a3;
- (id)cachedSleepScheduleWithMissHandler:(id)a3;
- (id)cachedSleepSettings;
- (id)cachedSleepSettingsWithMissHandler:(id)a3;
- (int64_t)sleepMode;
- (os_unfair_lock_s)cacheLock;
- (unint64_t)sleepScheduleState;
- (void)_locked_purgeCachedSleepEventRecord;
- (void)_locked_purgeCachedSleepMode;
- (void)_locked_purgeCachedSleepSchedule;
- (void)_locked_purgeCachedSleepScheduleState;
- (void)_locked_purgeCachedSleepSettings;
- (void)_locked_updateCachedSleepEventRecord:(id)a3;
- (void)_locked_updateCachedSleepSchedule:(id)a3;
- (void)_locked_updateCachedSleepSettings:(id)a3;
- (void)_withLock:(id)a3;
- (void)purgeCache;
- (void)purgeCachedSleepEventRecord;
- (void)purgeCachedSleepMode;
- (void)purgeCachedSleepSchedule;
- (void)purgeCachedSleepScheduleState;
- (void)purgeCachedSleepSettings;
- (void)updateCachedSleepEventRecord:(id)a3;
- (void)updateCachedSleepMode:(int64_t)a3;
- (void)updateCachedSleepSchedule:(id)a3;
- (void)updateCachedSleepScheduleModel:(id)a3;
- (void)updateCachedSleepScheduleState:(unint64_t)a3;
- (void)updateCachedSleepSettings:(id)a3;
@end

@implementation HKSPSleepStoreModelCache

- (HKSPSleepStoreModelCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKSPSleepStoreModelCache;
  v2 = [(HKSPSleepStoreModelCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v2->_sleepScheduleNeedsUpdate = 16843009;
    v2->_sleepModeNeedsUpdate = 1;
    v4 = v2;
  }

  return v3;
}

- (id)cachedSleepEventRecordWithMissHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke;
  v10[3] = &unk_1E5D32A68;
  v10[4] = self;
  v10[5] = &v11;
  [(HKSPSleepStoreModelCache *)self _withLock:v10];
  v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = v4[2](v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke_2;
    v9[3] = &unk_1E5D33A40;
    v9[4] = self;
    id v6 = [v7 addSuccessBlock:v9];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_withLock:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_cacheLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_cacheLock);
}

void __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    v3 = (void *)MEMORY[0x1E4F7A0D8];
    HKSPNullify(*(void **)(v1 + 32));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 futureWithResult:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 10))
  {
    v3 = (void *)MEMORY[0x1E4F7A0D8];
    HKSPNullify(*(void **)(v1 + 40));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 futureWithResult:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)cachedSleepSettingsWithMissHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke;
  v10[3] = &unk_1E5D32A68;
  v10[4] = self;
  v10[5] = &v11;
  [(HKSPSleepStoreModelCache *)self _withLock:v10];
  uint64_t v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = v4[2](v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke_2;
    v9[3] = &unk_1E5D33A18;
    v9[4] = self;
    id v6 = [v7 addSuccessBlock:v9];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __57__HKSPSleepStoreModelCache_updateCachedSleepEventRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateCachedSleepEventRecord:", *(void *)(a1 + 40));
}

- (void)_locked_updateCachedSleepEventRecord:(id)a3
{
  uint64_t v4 = (HKSPSleepEventRecord *)[a3 copy];
  sleepEventRecord = self->_sleepEventRecord;
  self->_sleepEventRecord = v4;

  self->_sleepEventRecordNeedsUpdate = 0;
}

uint64_t __54__HKSPSleepStoreModelCache_updateCachedSleepSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateCachedSleepSettings:", *(void *)(a1 + 40));
}

- (void)_locked_updateCachedSleepSettings:(id)a3
{
  uint64_t v4 = (HKSPSleepSettings *)[a3 copy];
  sleepSettings = self->_sleepSettings;
  self->_sleepSettings = v4;

  self->_sleepSettingsNeedsUpdate = 0;
}

void __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateCachedSleepSettings:v3];
}

- (void)updateCachedSleepSettings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HKSPSleepStoreModelCache_updateCachedSleepSettings___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKSPSleepStoreModelCache *)self _withLock:v6];
}

void __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateCachedSleepEventRecord:v3];
}

- (void)updateCachedSleepEventRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HKSPSleepStoreModelCache_updateCachedSleepEventRecord___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKSPSleepStoreModelCache *)self _withLock:v6];
}

- (void)_locked_updateCachedSleepSchedule:(id)a3
{
  id v4 = (HKSPSleepSchedule *)[a3 copy];
  sleepSchedule = self->_sleepSchedule;
  self->_sleepSchedule = v4;

  self->_sleepScheduleNeedsUpdate = 0;
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateCachedSleepScheduleModel:v3];
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8) && !*(unsigned char *)(v1 + 9) && !*(unsigned char *)(v1 + 10))
  {
    id v8 = +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:*(void *)(v1 + 24) sleepSettings:*(void *)(v1 + 32) sleepEventRecord:*(void *)(v1 + 40)];
    id v3 = (void *)MEMORY[0x1E4F7A0D8];
    id v4 = HKSPNullify(v8);
    uint64_t v5 = [v3 futureWithResult:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateCachedSleepSchedule:v3];
}

void __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    id v3 = (void *)MEMORY[0x1E4F7A0D8];
    HKSPNullify(*(void **)(v1 + 24));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 futureWithResult:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleModel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) sleepSchedule];
  objc_msgSend(v2, "_locked_updateCachedSleepSchedule:", v3);

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) sleepSettings];
  objc_msgSend(v4, "_locked_updateCachedSleepSettings:", v5);

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) sleepEventRecord];
  objc_msgSend(v6, "_locked_updateCachedSleepEventRecord:", v7);
}

uint64_t __54__HKSPSleepStoreModelCache_updateCachedSleepSchedule___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateCachedSleepSchedule:", *(void *)(a1 + 40));
}

- (void)updateCachedSleepScheduleModel:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleModel___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKSPSleepStoreModelCache *)self _withLock:v6];
}

- (void)updateCachedSleepSchedule:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HKSPSleepStoreModelCache_updateCachedSleepSchedule___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKSPSleepStoreModelCache *)self _withLock:v6];
}

- (id)cachedSleepScheduleWithMissHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke;
  v10[3] = &unk_1E5D32A68;
  v10[4] = self;
  v10[5] = &v11;
  [(HKSPSleepStoreModelCache *)self _withLock:v10];
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = v4[2](v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke_2;
    v9[3] = &unk_1E5D339F0;
    v9[4] = self;
    id v6 = [v7 addSuccessBlock:v9];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)cachedSleepScheduleModelWithMissHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke;
  v10[3] = &unk_1E5D32A68;
  v10[4] = self;
  v10[5] = &v11;
  [(HKSPSleepStoreModelCache *)self _withLock:v10];
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = v4[2](v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke_2;
    v9[3] = &unk_1E5D33A68;
    v9[4] = self;
    id v6 = [v7 addSuccessBlock:v9];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)cachedSleepSchedule
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HKSPSleepStoreModelCache_cachedSleepSchedule__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPSleepStoreModelCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __47__HKSPSleepStoreModelCache_cachedSleepSchedule__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_locked_cachedSleepSchedule");
  return MEMORY[0x1F41817F8]();
}

- (id)_locked_cachedSleepSchedule
{
  if (self->_sleepScheduleNeedsUpdate) {
    return 0;
  }
  else {
    return self->_sleepSchedule;
  }
}

- (void)purgeCachedSleepSchedule
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__HKSPSleepStoreModelCache_purgeCachedSleepSchedule__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPSleepStoreModelCache *)self _withLock:v2];
}

uint64_t __52__HKSPSleepStoreModelCache_purgeCachedSleepSchedule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSchedule");
}

- (void)_locked_purgeCachedSleepSchedule
{
  self->_sleepScheduleNeedsUpdate = 1;
}

- (id)cachedSleepSettings
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HKSPSleepStoreModelCache_cachedSleepSettings__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPSleepStoreModelCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __47__HKSPSleepStoreModelCache_cachedSleepSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_locked_cachedSleepSettings");
  return MEMORY[0x1F41817F8]();
}

- (id)_locked_cachedSleepSettings
{
  if (self->_sleepSettingsNeedsUpdate) {
    return 0;
  }
  else {
    return self->_sleepSettings;
  }
}

- (void)purgeCachedSleepSettings
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__HKSPSleepStoreModelCache_purgeCachedSleepSettings__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPSleepStoreModelCache *)self _withLock:v2];
}

uint64_t __52__HKSPSleepStoreModelCache_purgeCachedSleepSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSettings");
}

- (void)_locked_purgeCachedSleepSettings
{
  self->_sleepSettingsNeedsUpdate = 1;
}

- (id)cachedSleepEventRecord
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HKSPSleepStoreModelCache_cachedSleepEventRecord__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPSleepStoreModelCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __50__HKSPSleepStoreModelCache_cachedSleepEventRecord__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_locked_cachedSleepEventRecord");
  return MEMORY[0x1F41817F8]();
}

- (id)_locked_cachedSleepEventRecord
{
  if (self->_sleepEventRecordNeedsUpdate) {
    return 0;
  }
  else {
    return self->_sleepEventRecord;
  }
}

- (void)purgeCachedSleepEventRecord
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__HKSPSleepStoreModelCache_purgeCachedSleepEventRecord__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPSleepStoreModelCache *)self _withLock:v2];
}

uint64_t __55__HKSPSleepStoreModelCache_purgeCachedSleepEventRecord__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepEventRecord");
}

- (void)_locked_purgeCachedSleepEventRecord
{
  self->_sleepEventRecordNeedsUpdate = 1;
}

- (id)cachedSleepModeWithMissHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke;
  v10[3] = &unk_1E5D32A68;
  v10[4] = self;
  v10[5] = &v11;
  [(HKSPSleepStoreModelCache *)self _withLock:v10];
  uint64_t v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = v4[2](v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke_2;
    v9[3] = &unk_1E5D31F08;
    v9[4] = self;
    id v6 = [v7 addSuccessBlock:v9];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 12))
  {
    id v3 = (void *)MEMORY[0x1E4F7A0D8];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v1 + 56)];
    id v4 = HKSPNullify(v8);
    uint64_t v5 = [v3 futureWithResult:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepMode:", objc_msgSend(v3, "integerValue"));
}

- (void)updateCachedSleepMode:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__HKSPSleepStoreModelCache_updateCachedSleepMode___block_invoke;
  v3[3] = &unk_1E5D31FD0;
  v3[4] = self;
  v3[5] = a3;
  [(HKSPSleepStoreModelCache *)self _withLock:v3];
}

uint64_t __50__HKSPSleepStoreModelCache_updateCachedSleepMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 12) = 0;
  return result;
}

- (void)purgeCachedSleepMode
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__HKSPSleepStoreModelCache_purgeCachedSleepMode__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPSleepStoreModelCache *)self _withLock:v2];
}

uint64_t __48__HKSPSleepStoreModelCache_purgeCachedSleepMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepMode");
}

- (void)_locked_purgeCachedSleepMode
{
  self->_sleepModeNeedsUpdate = 1;
}

- (id)cachedSleepScheduleStateWithMissHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke;
  v10[3] = &unk_1E5D32A68;
  v10[4] = self;
  v10[5] = &v11;
  [(HKSPSleepStoreModelCache *)self _withLock:v10];
  uint64_t v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = v4[2](v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke_2;
    v9[3] = &unk_1E5D31F08;
    v9[4] = self;
    id v6 = [v7 addSuccessBlock:v9];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 11))
  {
    id v3 = (void *)MEMORY[0x1E4F7A0D8];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(v1 + 48)];
    id v4 = HKSPNullify(v8);
    uint64_t v5 = [v3 futureWithResult:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepScheduleState:", objc_msgSend(v3, "integerValue"));
}

- (void)updateCachedSleepScheduleState:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleState___block_invoke;
  v3[3] = &unk_1E5D31FD0;
  v3[4] = self;
  v3[5] = a3;
  [(HKSPSleepStoreModelCache *)self _withLock:v3];
}

uint64_t __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 11) = 0;
  return result;
}

- (void)purgeCachedSleepScheduleState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__HKSPSleepStoreModelCache_purgeCachedSleepScheduleState__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPSleepStoreModelCache *)self _withLock:v2];
}

uint64_t __57__HKSPSleepStoreModelCache_purgeCachedSleepScheduleState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepScheduleState");
}

- (void)_locked_purgeCachedSleepScheduleState
{
  self->_sleepScheduleStateNeedsUpdate = 1;
}

- (void)purgeCache
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__HKSPSleepStoreModelCache_purgeCache__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPSleepStoreModelCache *)self _withLock:v2];
}

uint64_t __38__HKSPSleepStoreModelCache_purgeCache__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSchedule");
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSettings");
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepEventRecord");
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepMode");
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_locked_purgeCachedSleepScheduleState");
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (HKSPSleepSchedule)sleepSchedule
{
  return self->_sleepSchedule;
}

- (BOOL)sleepScheduleNeedsUpdate
{
  return self->_sleepScheduleNeedsUpdate;
}

- (HKSPSleepSettings)sleepSettings
{
  return self->_sleepSettings;
}

- (BOOL)sleepSettingsNeedsUpdate
{
  return self->_sleepSettingsNeedsUpdate;
}

- (HKSPSleepEventRecord)sleepEventRecord
{
  return self->_sleepEventRecord;
}

- (BOOL)sleepEventRecordNeedsUpdate
{
  return self->_sleepEventRecordNeedsUpdate;
}

- (unint64_t)sleepScheduleState
{
  return self->_sleepScheduleState;
}

- (BOOL)sleepScheduleStateNeedsUpdate
{
  return self->_sleepScheduleStateNeedsUpdate;
}

- (int64_t)sleepMode
{
  return self->_sleepMode;
}

- (BOOL)sleepModeNeedsUpdate
{
  return self->_sleepModeNeedsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepEventRecord, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepSchedule, 0);
}

@end