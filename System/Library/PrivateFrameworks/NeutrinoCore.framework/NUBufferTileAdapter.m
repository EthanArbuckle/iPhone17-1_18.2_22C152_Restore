@interface NUBufferTileAdapter
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect;
- (NUBuffer)buffer;
- (NUBufferTileAdapter)init;
- (NUBufferTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 buffer:(id)a5;
@end

@implementation NUBufferTileAdapter

- (void).cxx_destruct
{
}

- (NUBuffer)buffer
{
  return self->_buffer;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var1 = v3;
  return self;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self->var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self->var0.var1;
  retstr->var1 = v3;
  return self;
}

- (NUBufferTileAdapter)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(a2);
    v8 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v6, v7];
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      __int16 v23 = 2114;
      v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUBufferTileAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 355, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

- (NUBufferTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 buffer:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!v8)
  {
    v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)buf = 138543362;
      v30 = v15;
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
        __int16 v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferTileAdapter initWithFrameRect:contentRect:buffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 346, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"buffer != nil");
  }
  v28.receiver = self;
  v28.super_class = (Class)NUBufferTileAdapter;
  v9 = [(NUBufferTileAdapter *)&v28 init];
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 24) = a3->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 8) = var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 40) = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 56) = var1;
  v12 = (void *)*((void *)v9 + 9);
  *((void *)v9 + 9) = v8;

  return (NUBufferTileAdapter *)v9;
}

@end