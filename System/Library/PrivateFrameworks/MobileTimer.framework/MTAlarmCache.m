@interface MTAlarmCache
- (BOOL)_isUpdateNeeded;
- (BOOL)needsUpdate;
- (MTAlarm)nextAlarm;
- (MTAlarmCache)initWithUpdateBlock:(id)a3;
- (NSMutableArray)orderedAlarms;
- (NSMutableArray)sleepAlarms;
- (id)updateBlock;
- (os_unfair_lock_s)cacheLock;
- (void)_getCachedAlarmsWithCompletion:(id)a3 doSynchronous:(BOOL)a4;
- (void)_withLock:(id)a3;
- (void)getCachedAlarmsSyncWithCompletion:(id)a3;
- (void)getCachedAlarmsWithCompletion:(id)a3;
- (void)markNeedsUpdate;
- (void)setCacheLock:(os_unfair_lock_s)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setNextAlarm:(id)a3;
- (void)setOrderedAlarms:(id)a3;
- (void)setSleepAlarms:(id)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation MTAlarmCache

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    v13 = MTLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_cold_1(a1, (uint64_t)v12, v13);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, void, void, void, id))(v14 + 16))(v14, 0, 0, 0, v12);
    }
  }
  else
  {
    v15 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2;
    v17[3] = &unk_1E5916540;
    v17[4] = v15;
    id v18 = v9;
    id v19 = v10;
    id v20 = v11;
    long long v21 = *(_OWORD *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 64);
    [v15 _withLock:v17];
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, void, void, void))(v16 + 16))(v16, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), 0);
    }
  }
}

- (MTAlarmCache)initWithUpdateBlock:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTAlarmCache;
  v5 = [(MTAlarmCache *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    orderedAlarms = v5->_orderedAlarms;
    v5->_orderedAlarms = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    sleepAlarms = v5->_sleepAlarms;
    v5->_sleepAlarms = (NSMutableArray *)v8;

    nextAlarm = v5->_nextAlarm;
    v5->_nextAlarm = 0;

    v5->_needsUpdate = 1;
    uint64_t v11 = [v4 copy];
    id updateBlock = v5->_updateBlock;
    v5->_id updateBlock = (id)v11;

    v5->_cacheLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)getCachedAlarmsWithCompletion:(id)a3
{
}

- (void)_getCachedAlarmsWithCompletion:(id)a3 doSynchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6;
  id v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  if ([(MTAlarmCache *)self _isUpdateNeeded])
  {
    v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MTAlarmCache _getCachedAlarmsWithCompletion:doSynchronous:]((uint64_t)self, v7);
    }

    id updateBlock = (void (**)(id, void *, BOOL))self->_updateBlock;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke;
    v10[3] = &unk_1E5916568;
    v10[4] = self;
    id v12 = &v27;
    v13 = &v21;
    objc_super v14 = &v15;
    id v11 = v6;
    updateBlock[2](updateBlock, v10, v4);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2;
    v9[3] = &unk_1E5916590;
    v9[4] = self;
    v9[5] = &v27;
    v9[6] = &v21;
    v9[7] = &v15;
    [(MTAlarmCache *)self _withLock:v9];
    if (v6) {
      (*((void (**)(id, uint64_t, uint64_t, uint64_t, void))v6 + 2))(v6, v28[5], v22[5], v16[5], 0);
    }
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

- (BOOL)_isUpdateNeeded
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__MTAlarmCache__isUpdateNeeded__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTAlarmCache *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_withLock:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  BOOL v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_cacheLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_cacheLock);
}

uint64_t __31__MTAlarmCache__isUpdateNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_getCachedAlarmsWithCompletion:(uint64_t)a1 doSynchronous:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19CC95000, a2, OS_LOG_TYPE_DEBUG, "%@ - Cache Miss", (uint8_t *)&v2, 0xCu);
}

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  uint64_t v8 = [*(id *)(a1 + 56) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  id v11 = *(void **)(*(void *)(a1 + 32) + 40);
  id v12 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  objc_storeStrong(v12, v11);
}

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  uint64_t v2 = *(void **)(a1[4] + 40);
  uint64_t v3 = (id *)(*(void *)(a1[7] + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)markNeedsUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__MTAlarmCache_markNeedsUpdate__block_invoke;
  v2[3] = &unk_1E59150A8;
  v2[4] = self;
  [(MTAlarmCache *)self _withLock:v2];
}

uint64_t __31__MTAlarmCache_markNeedsUpdate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

- (void)getCachedAlarmsSyncWithCompletion:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (NSMutableArray)orderedAlarms
{
  return self->_orderedAlarms;
}

- (void)setOrderedAlarms:(id)a3
{
}

- (NSMutableArray)sleepAlarms
{
  return self->_sleepAlarms;
}

- (void)setSleepAlarms:(id)a3
{
}

- (MTAlarm)nextAlarm
{
  return self->_nextAlarm;
}

- (void)setNextAlarm:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextAlarm, 0);
  objc_storeStrong((id *)&self->_sleepAlarms, 0);
  objc_storeStrong((id *)&self->_orderedAlarms, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ - Error getting alarms: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end