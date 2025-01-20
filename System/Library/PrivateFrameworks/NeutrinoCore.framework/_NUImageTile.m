@interface _NUImageTile
- (BOOL)_decrementAccessCount;
- (BOOL)_incrementAccessCount;
- (BOOL)_markAsUnpurgeable;
- (BOOL)decrementAccessCount;
- (BOOL)decrementUseCount;
- (BOOL)incrementAccessCount;
- (BOOL)isInUse;
- (BOOL)isShared;
- (BOOL)isValid;
- (NSString)description;
- (_NUImageTile)initWithStorage:(id)a3;
- (int)useCount;
- (int64_t)copyFromTile:(id)a3 region:(id)a4;
- (int64_t)readStorageInRegion:(id)a3 block:(id)a4;
- (int64_t)writeStorageInRegion:(id)a3 block:(id)a4;
- (unint64_t)accessCount;
- (void)_markAsPurgeable;
- (void)_visitRead:(id)a3;
- (void)dealloc;
- (void)decrementAccessCountButLeaveAccessedIfLastUse;
- (void)incrementUseCount;
- (void)returnToStorageFactory:(id)a3;
@end

@implementation _NUImageTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23___NUImageTile_isValid__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)copyFromTile:(id)a3 region:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = NUAssertLogger_28945();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "otherTile != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_28945();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile copyFromTile:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 252, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"otherTile != nil");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___NUImageTile_copyFromTile_region___block_invoke;
  block[3] = &unk_1E5D95EE0;
  block[4] = self;
  id v30 = v6;
  id v31 = v7;
  v32 = buf;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(queue, block);
  int64_t v11 = *(void *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (int64_t)writeStorageInRegion:(id)a3 block:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (!v7)
  {
    v12 = NUAssertLogger_28945();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_28945();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v19;
        __int16 v35 = 2114;
        v36 = v21;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile writeStorageInRegion:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 227, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"block != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___NUImageTile_writeStorageInRegion_block___block_invoke;
  block[3] = &unk_1E5D95E90;
  id v27 = v7;
  uint64_t v28 = &v29;
  block[4] = self;
  id v9 = v7;
  dispatch_barrier_sync(queue, block);
  int64_t v10 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v10;
}

- (int64_t)readStorageInRegion:(id)a3 block:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (!v7)
  {
    v12 = NUAssertLogger_28945();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_28945();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v19;
        __int16 v35 = 2114;
        v36 = v21;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile readStorageInRegion:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 207, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"block != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___NUImageTile_readStorageInRegion_block___block_invoke;
  block[3] = &unk_1E5D95E90;
  id v27 = v7;
  uint64_t v28 = &v29;
  block[4] = self;
  id v9 = v7;
  dispatch_sync(queue, block);
  int64_t v10 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v10;
}

- (void)_visitRead:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27___NUImageTile__visitRead___block_invoke;
  v7[3] = &unk_1E5D95F30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)_markAsUnpurgeable
{
  return [(NUPurgeableStorage *)self->_storage makeNonPurgeable] ^ 1;
}

- (void)_markAsPurgeable
{
}

- (BOOL)_decrementAccessCount
{
  unint64_t v3 = self->_accessCount - 1;
  self->_accessCount = v3;
  if (!v3) {
    [(_NUImageTile *)self _markAsPurgeable];
  }
  return !self->_wasPurged;
}

- (BOOL)_incrementAccessCount
{
  unint64_t accessCount = self->_accessCount;
  self->_unint64_t accessCount = accessCount + 1;
  if (!accessCount && [(_NUImageTile *)self _markAsUnpurgeable]) {
    self->_wasPurged = 1;
  }
  return !self->_wasPurged;
}

- (void)decrementAccessCountButLeaveAccessedIfLastUse
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___NUImageTile_decrementAccessCountButLeaveAccessedIfLastUse__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_barrier_sync(queue, block);
}

- (BOOL)decrementAccessCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___NUImageTile_decrementAccessCount__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)incrementAccessCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___NUImageTile_incrementAccessCount__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)useCount
{
  return [(NUPurgeableStorage *)self->_storage useCount];
}

- (BOOL)decrementUseCount
{
  return [(NUPurgeableStorage *)self->_storage decrementUseCount];
}

- (void)incrementUseCount
{
}

- (BOOL)isInUse
{
  return [(NUPurgeableStorage *)self->_storage isInUse];
}

- (BOOL)isShared
{
  return [(NUPurgeableStorage *)self->_storage isShared];
}

- (unint64_t)accessCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27___NUImageTile_accessCount__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)returnToStorageFactory:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v7 = NUAssertLogger_28945();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "storageFactory != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v10 = NUAssertLogger_28945();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        BOOL v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v14;
        __int16 v28 = 2114;
        uint64_t v29 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile returnToStorageFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 56, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"storageFactory != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___NUImageTile_returnToStorageFactory___block_invoke;
  block[3] = &unk_1E5D95E18;
  id v24 = v4;
  uint64_t v25 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p> use=%lu access=%lu %@", objc_opt_class(), self, -[_NUImageTile useCount](self, "useCount"), self->_accessCount, self->_storage];
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_accessCount >= 2)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_28972);
    }
    unint64_t v3 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      unint64_t accessCount = self->_accessCount;
      id v6 = v3;
      id v7 = objc_msgSend(v4, "stringWithFormat:", @"bad access count: %lu", accessCount);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1A9892000, v6, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v8 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v8 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_28972);
        }
LABEL_9:
        uint64_t v9 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v15 = (void *)MEMORY[0x1E4F29060];
          id v16 = specific;
          BOOL v17 = v9;
          v18 = [v15 callStackSymbols];
          uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v26 = specific;
          __int16 v27 = 2114;
          __int16 v28 = v19;
          _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_28972);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    uint64_t v20 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F29060];
      BOOL v17 = v20;
      uint64_t v22 = [v21 callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v23;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[_NUImageTile dealloc]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 46, @"bad access count: %lu", v10, v11, v12, v13, self->_accessCount);
  }
  v24.receiver = self;
  v24.super_class = (Class)_NUImageTile;
  [(_NUImageTile *)&v24 dealloc];
}

- (_NUImageTile)initWithStorage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = NUAssertLogger_28945();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "storage != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_28945();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v19;
        __int16 v31 = 2114;
        uint64_t v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile initWithStorage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 25, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"storage != nil");
  }
  id v6 = v5;
  v28.receiver = self;
  v28.super_class = (Class)_NUImageTile;
  id v7 = [(_NUImageTile *)&v28 init];
  if (v7)
  {
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("NUImageTile", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v7->_storage, a3);
    v7->_unint64_t accessCount = 1;
    v7->_wasPurged = 0;
  }

  return v7;
}

@end