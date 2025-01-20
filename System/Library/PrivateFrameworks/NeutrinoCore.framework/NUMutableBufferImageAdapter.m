@interface NUMutableBufferImageAdapter
- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5;
- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6;
- (NUMutableBufferImageAdapter)initWithBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5;
- (NUMutableBufferImageAdapter)initWithMutableBuffer:(id)a3 colorSpace:(id)a4 validRegion:(id)a5;
- (NUMutableBufferImageAdapter)initWithMutableBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5;
- (void)writeBufferRegion:(id)a3 withBlock:(id)a4;
@end

@implementation NUMutableBufferImageAdapter

- (void).cxx_destruct
{
}

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v9 = a3;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = a4->var1;
  v18[0] = a4->var0;
  v18[1] = v10;
  v11 = +[NURegion regionWithRect:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17 = v12;
  v15[2] = __66__NUMutableBufferImageAdapter_copyBufferStorage_fromRect_toPoint___block_invoke;
  v15[3] = &unk_1E5D95AA0;
  v15[4] = self;
  v15[5] = var0;
  v15[6] = var1;
  uint64_t v13 = [v9 readBufferInRegion:v11 block:v15];

  return v13 == 1;
}

uint64_t __66__NUMutableBufferImageAdapter_copyBufferStorage_fromRect_toPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  return +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v2, v3, v4, a2, v7);
}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  v8[0] = a4->var0;
  v8[1] = var1;
  return -[NUMutableBufferImageAdapter copyBufferStorage:fromRect:toPoint:](self, "copyBufferStorage:fromRect:toPoint:", a3, v8, a5.var0, a5.var1, a6);
}

- (void)writeBufferRegion:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NUBufferImageAdapter *)self size];
  mutableBufferProvider = self->_mutableBufferProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__NUMutableBufferImageAdapter_writeBufferRegion_withBlock___block_invoke;
  v14[3] = &unk_1E5D94960;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = v8;
  uint64_t v19 = v10;
  id v11 = v7;
  id v15 = v11;
  [(NUMutableBufferProvider *)mutableBufferProvider provideMutableBuffer:v14];
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = [(NURegion *)self->super._validRegion regionByAddingRegion:v6];
  validRegion = self->super._validRegion;
  self->super._validRegion = v12;
}

void __59__NUMutableBufferImageAdapter_writeBufferRegion_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v9 = 0;
  uint64_t v4 = [NUMutableBufferTileAdapter alloc];
  long long v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  v7[0] = v8[0];
  v7[1] = v5;
  id v6 = [(NUMutableBufferTileAdapter *)v4 initWithFrameRect:v8 contentRect:v7 buffer:v3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NUMutableBufferImageAdapter)initWithBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  a3;
  id v8 = a4;
  id v9 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  uint64_t v10 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = NSString;
    $0AC6E346AE4835514AAA8AC86D8F4844 v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(a2);
    id v15 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v13, v14];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    uint64_t v16 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      __int16 v30 = 2114;
      v31 = v21;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    uint64_t v16 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMutableBufferImageAdapter initWithBufferProvider:colorSpace:validRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 499, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NUMutableBufferImageAdapter)initWithMutableBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  id v8 = (NUMutableBufferProvider *)a3;
  v12.receiver = self;
  v12.super_class = (Class)NUMutableBufferImageAdapter;
  id v9 = [(NUBufferImageAdapter *)&v12 initWithBufferProvider:v8 colorSpace:a4 validRegion:a5];
  mutableBufferProvider = v9->_mutableBufferProvider;
  v9->_mutableBufferProvider = v8;

  return v9;
}

- (NUMutableBufferImageAdapter)initWithMutableBuffer:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v21;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferImageAdapter initWithMutableBuffer:colorSpace:validRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 484, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"buffer != nil");
  }
  id v11 = [[NUMutableBufferAdapter alloc] initWithMutableBuffer:v8];
  objc_super v12 = [(NUMutableBufferImageAdapter *)self initWithMutableBufferProvider:v11 colorSpace:v9 validRegion:v10];

  return v12;
}

@end