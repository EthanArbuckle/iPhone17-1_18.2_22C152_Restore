@interface NUStorageImageBuffer
+ (NUStorageImageBuffer)imageBufferWithSize:(id)a3 format:(id)a4 fromPool:(id)a5;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)format;
- (NUPurgeableStorage)storage;
- (NUPurgeableStoragePool)pool;
- (NUStorageImageBuffer)init;
- (NUStorageImageBuffer)initWithStorage:(id)a3 fromPool:(id)a4;
- (__CVBuffer)CVPixelBuffer;
- (void)dealloc;
@end

@implementation NUStorageImageBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

- (NUPurgeableStoragePool)pool
{
  return self->_pool;
}

- (NUPurgeableStorage)storage
{
  return self->_storage;
}

- (__CVBuffer)CVPixelBuffer
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  storage = self->_storage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__NUStorageImageBuffer_CVPixelBuffer__block_invoke;
  v5[3] = &unk_1E5D95BB8;
  v5[4] = &v6;
  [(NUPurgeableStorage *)storage useAsCVPixelBufferWithBlock:v5];
  v3 = (__CVBuffer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__NUStorageImageBuffer_CVPixelBuffer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 CVPixelBuffer];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)[(NUPurgeableStorage *)self->_storage colorSpace];
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)[(NUPurgeableStorage *)self->_storage format];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2 = [(NUPurgeableStorage *)self->_storage size];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)dealloc
{
  [(NUPurgeableStoragePool *)self->_pool returnStorage:self->_storage];
  v3.receiver = self;
  v3.super_class = (Class)NUStorageImageBuffer;
  [(NUStorageImageBuffer *)&v3 dealloc];
}

- (NUStorageImageBuffer)initWithStorage:(id)a3 fromPool:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NUPurgeableStorage *)a3;
  v7 = (NUPurgeableStoragePool *)a4;
  if (!v6)
  {
    v14 = NUAssertLogger_26987();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "storage != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_26987();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        __int16 v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStorageImageBuffer initWithStorage:fromPool:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUStorageImageBuffer.m", 28, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"storage != nil");
  }
  uint64_t v8 = v7;
  v30.receiver = self;
  v30.super_class = (Class)NUStorageImageBuffer;
  uint64_t v9 = [(NUStorageImageBuffer *)&v30 init];
  storage = v9->_storage;
  v9->_storage = v6;
  v11 = v6;

  pool = v9->_pool;
  v9->_pool = v8;

  return v9;
}

- (NUStorageImageBuffer)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27002);
  }
  objc_super v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27002);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27002);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUStorageImageBuffer init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUStorageImageBuffer.m", 24, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (NUStorageImageBuffer)imageBufferWithSize:(id)a3 format:(id)a4 fromPool:(id)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v15 = NUAssertLogger_26987();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pool != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_26987();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v22;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUStorageImageBuffer imageBufferWithSize:format:fromPool:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUStorageImageBuffer.m", 15, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"pool != nil");
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "newStorageWithSize:format:", var0, var1, v9);
  if (v12) {
    v13 = (void *)[objc_alloc((Class)a1) initWithStorage:v12 fromPool:v11];
  }
  else {
    v13 = 0;
  }

  return (NUStorageImageBuffer *)v13;
}

@end