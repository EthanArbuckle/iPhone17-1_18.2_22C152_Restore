@interface MTTimerCache
- (BOOL)_isUpdateNeeded;
- (BOOL)needsUpdate;
- (MTTimer)nextTimer;
- (MTTimerCache)initWithUpdateBlock:(id)a3;
- (NSMutableArray)orderedTimers;
- (id)updateBlock;
- (os_unfair_lock_s)cacheLock;
- (void)_getCachedTimersWithCompletion:(id)a3 doSynchronous:(BOOL)a4;
- (void)_withLock:(id)a3;
- (void)getCachedTimersSyncWithCompletion:(id)a3;
- (void)getCachedTimersWithCompletion:(id)a3;
- (void)markNeedsUpdate;
- (void)setCacheLock:(os_unfair_lock_s)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setNextTimer:(id)a3;
- (void)setOrderedTimers:(id)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation MTTimerCache

- (MTTimerCache)initWithUpdateBlock:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTTimerCache;
  v5 = [(MTTimerCache *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    orderedTimers = v5->_orderedTimers;
    v5->_orderedTimers = (NSMutableArray *)v6;

    nextTimer = v5->_nextTimer;
    v5->_nextTimer = 0;

    v5->_needsUpdate = 1;
    uint64_t v9 = [v4 copy];
    id updateBlock = v5->_updateBlock;
    v5->_id updateBlock = (id)v9;

    v5->_cacheLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = MTLogForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_cold_1(a1, (uint64_t)v9, v10);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v9);
    }
  }
  else
  {
    objc_super v12 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2;
    v14[3] = &unk_1E5917208;
    v14[4] = v12;
    id v15 = v7;
    id v16 = v8;
    long long v17 = *(_OWORD *)(a1 + 48);
    [v12 _withLock:v14];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void, void, void))(v13 + 16))(v13, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
    }
  }
}

- (void)getCachedTimersWithCompletion:(id)a3
{
}

- (void)_getCachedTimersWithCompletion:(id)a3 doSynchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__9;
  v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  if ([(MTTimerCache *)self _isUpdateNeeded])
  {
    id v7 = MTLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MTAlarmCache _getCachedAlarmsWithCompletion:doSynchronous:]((uint64_t)self, v7);
    }

    id updateBlock = (void (**)(id, void *, BOOL))self->_updateBlock;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke;
    v10[3] = &unk_1E5917230;
    v10[4] = self;
    objc_super v12 = &v20;
    uint64_t v13 = &v14;
    id v11 = v6;
    updateBlock[2](updateBlock, v10, v4);
  }
  else if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2;
    v9[3] = &unk_1E5917258;
    v9[4] = self;
    v9[5] = &v20;
    v9[6] = &v14;
    [(MTTimerCache *)self _withLock:v9];
    (*((void (**)(id, uint64_t, uint64_t, void))v6 + 2))(v6, v21[5], v15[5], 0);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)_isUpdateNeeded
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__MTTimerCache__isUpdateNeeded__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTTimerCache *)self _withLock:v4];
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

uint64_t __31__MTTimerCache__isUpdateNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  char v8 = *(void **)(*(void *)(a1 + 32) + 32);
  id v9 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  objc_storeStrong(v9, v8);
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  uint64_t v2 = *(void **)(a1[4] + 32);
  uint64_t v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)markNeedsUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__MTTimerCache_markNeedsUpdate__block_invoke;
  v2[3] = &unk_1E59150A8;
  v2[4] = self;
  [(MTTimerCache *)self _withLock:v2];
}

uint64_t __31__MTTimerCache_markNeedsUpdate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

- (void)getCachedTimersSyncWithCompletion:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (NSMutableArray)orderedTimers
{
  return self->_orderedTimers;
}

- (void)setOrderedTimers:(id)a3
{
}

- (MTTimer)nextTimer
{
  return self->_nextTimer;
}

- (void)setNextTimer:(id)a3
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
  objc_storeStrong((id *)&self->_nextTimer, 0);
  objc_storeStrong((id *)&self->_orderedTimers, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ - Error getting timers: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end