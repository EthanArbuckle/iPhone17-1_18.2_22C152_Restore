@interface NUSurfaceTileAdapter
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect;
- (NUIOSurface)surface;
- (NUSurfaceTileAdapter)init;
- (NUSurfaceTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 surface:(id)a5;
@end

@implementation NUSurfaceTileAdapter

- (void).cxx_destruct
{
}

- (NUIOSurface)surface
{
  return self->_surface;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = self[2].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = self[1].var1;
  retstr->var1 = var0;
  return self;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = self[1].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = self->var1;
  retstr->var1 = var0;
  return self;
}

- (NUSurfaceTileAdapter)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
  }
  v3 = (id)_NUAssertLogger;
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
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
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
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
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
  _NUAssertFailHandler((uint64_t)"-[NUSurfaceTileAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 1060, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

- (NUSurfaceTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 surface:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v8 = (NUIOSurface *)a5;
  if (!v8)
  {
    v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
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
    _NUAssertFailHandler((uint64_t)"-[NUSurfaceTileAdapter initWithFrameRect:contentRect:surface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 1050, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"surface != nil");
  }
  v28.receiver = self;
  v28.super_class = (Class)NUSurfaceTileAdapter;
  v9 = [(NUSurfaceTileAdapter *)&v28 init];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v9->_frameRect.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  v9->_frameRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v11 = a4->var1;
  v9->_contentRect.origin = ($86B46DF249C2B4242DBB096758D29184)a4->var0;
  v9->_contentRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v11;
  surface = v9->_surface;
  v9->_surface = v8;

  return v9;
}

@end