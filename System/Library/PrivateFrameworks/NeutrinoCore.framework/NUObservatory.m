@interface NUObservatory
- (NUObservatory)init;
- (id)addObserverForKey:(int64_t)a3 queue:(id)a4 block:(id)a5;
- (void)_addObservation:(id)a3;
- (void)_notifyAllObserversForKey:(int64_t)a3 withBlock:(id)a4;
- (void)_removeObserver:(id)a3;
- (void)_removeObserver:(id)a3 forKey:(int64_t)a4;
- (void)addObserver:(id)a3 forKey:(int64_t)a4 queue:(id)a5 block:(id)a6;
- (void)notifyAllObserversForKey:(int64_t)a3 withBlock:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forKey:(int64_t)a4;
@end

@implementation NUObservatory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);

  objc_storeStrong((id *)&self->_serializer, 0);
}

- (void)_notifyAllObserversForKey:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  observations = self->_observations;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __53__NUObservatory__notifyAllObserversForKey_withBlock___block_invoke;
  v13 = &unk_1E5D95828;
  id v14 = v6;
  int64_t v15 = a3;
  id v8 = v6;
  v9 = [(NSMutableArray *)observations indexesOfObjectsPassingTest:&v10];
  -[NSMutableArray removeObjectsAtIndexes:](self->_observations, "removeObjectsAtIndexes:", v9, v10, v11, v12, v13);
}

BOOL __53__NUObservatory__notifyAllObserversForKey_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 observer];
  if (v4 && [v3 key] == *(void *)(a1 + 40)) {
    [v3 notifyWithBlock:*(void *)(a1 + 32)];
  }

  return v4 == 0;
}

- (void)notifyAllObserversForKey:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NUObservatory_notifyAllObserversForKey_withBlock___block_invoke;
  block[3] = &unk_1E5D95800;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(serializer, block);
}

uint64_t __52__NUObservatory_notifyAllObserversForKey_withBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyAllObserversForKey:*(void *)(a1 + 48) withBlock:*(void *)(a1 + 40)];
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  observations = self->_observations;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__NUObservatory__removeObserver___block_invoke;
  v8[3] = &unk_1E5D957D8;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSMutableArray *)observations indexesOfObjectsPassingTest:v8];
  [(NSMutableArray *)self->_observations removeObjectsAtIndexes:v7];
}

BOOL __33__NUObservatory__removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 observer];
  if (v3) {
    BOOL v4 = v3 == *(void **)(a1 + 32);
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)removeObserver:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v7 = NUAssertLogger_25120();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "observer != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v10 = NUAssertLogger_25120();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        id v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int64_t v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v14;
        __int16 v27 = 2114;
        v28 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory removeObserver:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 130, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"observer != nil");
  }
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NUObservatory_removeObserver___block_invoke;
  block[3] = &unk_1E5D95E18;
  block[4] = self;
  id v24 = v4;
  id v6 = v4;
  dispatch_sync(serializer, block);
}

uint64_t __32__NUObservatory_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (void)_removeObserver:(id)a3 forKey:(int64_t)a4
{
  id v6 = a3;
  observations = self->_observations;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __40__NUObservatory__removeObserver_forKey___block_invoke;
  v13 = &unk_1E5D957B0;
  id v14 = v6;
  int64_t v15 = a4;
  id v8 = v6;
  id v9 = [(NSMutableArray *)observations indexesOfObjectsPassingTest:&v10];
  -[NSMutableArray removeObjectsAtIndexes:](self->_observations, "removeObjectsAtIndexes:", v9, v10, v11, v12, v13);
}

BOOL __40__NUObservatory__removeObserver_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 observer];
  v5 = (void *)v4;
  if (v4) {
    BOOL v6 = v4 == *(void *)(a1 + 32) && [v3 key] == *(void *)(a1 + 40);
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)removeObserver:(id)a3 forKey:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v9 = NUAssertLogger_25120();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "observer != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_25120();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v16;
        __int16 v30 = 2114;
        v31 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory removeObserver:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 107, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"observer != nil");
  }
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NUObservatory_removeObserver_forKey___block_invoke;
  block[3] = &unk_1E5D95C28;
  block[4] = self;
  id v26 = v6;
  int64_t v27 = a4;
  id v8 = v6;
  dispatch_sync(serializer, block);
}

uint64_t __39__NUObservatory_removeObserver_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)_addObservation:(id)a3
{
}

- (void)addObserver:(id)a3 forKey:(int64_t)a4 queue:(id)a5 block:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    v17 = NUAssertLogger_25120();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "observer != nil");
      *(_DWORD *)buf = 138543362;
      v52 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_25120();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v31;
        __int16 v53 = 2114;
        v54 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory addObserver:forKey:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 89, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"observer != nil");
  }
  BOOL v13 = v12;
  if (!v12)
  {
    uint64_t v24 = NUAssertLogger_25120();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v52 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v27 = NUAssertLogger_25120();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v40;
        __int16 v53 = 2114;
        v54 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory addObserver:forKey:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 90, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"block != nil");
  }
  id v14 = [[_NUObservation alloc] initWithObserver:v10 key:a4 queue:v11 block:v12];
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NUObservatory_addObserver_forKey_queue_block___block_invoke;
  block[3] = &unk_1E5D95E18;
  block[4] = self;
  v50 = v14;
  id v16 = v14;
  dispatch_sync(serializer, block);
}

uint64_t __48__NUObservatory_addObserver_forKey_queue_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObservation:*(void *)(a1 + 40)];
}

- (id)addObserverForKey:(int64_t)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(_NUObserver);
  [(NUObservatory *)self addObserver:v10 forKey:a3 queue:v9 block:v8];

  return v10;
}

- (NUObservatory)init
{
  v8.receiver = self;
  v8.super_class = (Class)NUObservatory;
  v2 = [(NUObservatory *)&v8 init];
  dispatch_queue_t v3 = dispatch_queue_create("NUObservatory", 0);
  serializer = v2->_serializer;
  v2->_serializer = (OS_dispatch_queue *)v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  observations = v2->_observations;
  v2->_observations = v5;

  return v2;
}

@end