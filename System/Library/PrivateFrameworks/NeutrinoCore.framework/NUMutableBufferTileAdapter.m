@interface NUMutableBufferTileAdapter
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect;
- (NUMutableBuffer)mutableBuffer;
- (NUMutableBufferTileAdapter)init;
- (NUMutableBufferTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 buffer:(id)a5;
@end

@implementation NUMutableBufferTileAdapter

- (void).cxx_destruct
{
}

- (NUMutableBuffer)mutableBuffer
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

- (NUMutableBufferTileAdapter)init
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
  _NUAssertFailHandler((uint64_t)"-[NUMutableBufferTileAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 382, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

- (NUMutableBufferTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 buffer:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NUMutableBufferTileAdapter;
  v9 = [(NUMutableBufferTileAdapter *)&v14 init];
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 24) = a3->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 8) = var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 40) = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 56) = var1;
  v12 = (void *)*((void *)v9 + 9);
  *((void *)v9 + 9) = v8;

  return (NUMutableBufferTileAdapter *)v9;
}

@end