@interface NUMutableBufferAdapter
- (NUMutableBufferAdapter)initWithMutableBuffer:(id)a3;
- (NUMutableBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 bytes:(const void *)a6;
- (NUMutableBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 mutableBytes:(void *)a6;
- (id)newRenderDestination;
- (void)mutableBytes;
- (void)mutableBytesAtPoint:(id)a3;
- (void)provideMutableBuffer:(id)a3;
@end

@implementation NUMutableBufferAdapter

- (void)provideMutableBuffer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = v4;
  if (!self->super._valid)
  {
    v5 = NUAssertLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [NSString stringWithFormat:@"Buffer no longer valid"];
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = [MEMORY[0x1E4F29060] callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        __int16 v23 = 2114;
        v24 = v14;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter provideMutableBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 651, @"Buffer no longer valid", v15, v16, v17, v18, v19);
  }
  (*((void (**)(id, NUMutableBufferAdapter *))v4 + 2))(v4, self);
}

- (id)newRenderDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E070]);
  id v4 = [(NUMutableBufferAdapter *)self mutableBytes];
  uint64_t v5 = [(NUBufferAdapter *)self size];
  [(NUBufferAdapter *)self size];
  uint64_t v7 = v6;
  int64_t v8 = [(NUBufferAdapter *)self rowBytes];
  BOOL v9 = [(NUBufferAdapter *)self format];
  v10 = objc_msgSend(v3, "initWithBitmapData:width:height:bytesPerRow:format:", v4, v5, v7, v8, objc_msgSend(v9, "CIFormat"));

  [v10 setLabel:@"NUMutableBufferAdapter-new"];
  return v10;
}

- (void)mutableBytesAtPoint:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!self->super._valid)
  {
    id v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [NSString stringWithFormat:@"Buffer no longer valid"];
      *(_DWORD *)buf = 138543362;
      v34 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v7 = NUAssertLogger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v18;
        __int16 v35 = 2114;
        v36 = v20;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      BOOL v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter mutableBytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 633, @"Buffer no longer valid", v21, v22, v23, v24, v32);
  }
  if (a3.var0 < 0 || a3.var0 >= self->super._size.width || a3.var1 < 0 || a3.var1 >= self->super._size.height)
  {
    v11 = NUAssertLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelPointInRect(point, extent)");
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        __int16 v35 = 2114;
        v36 = v27;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter mutableBytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 635, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  return (char *)self->_mutableBytes
       + self->super._rowBytes * a3.var1
       + [(NUPixelFormat *)self->super._format bytesPerPixel] * a3.var0;
}

- (void)mutableBytes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->super._valid)
  {
    id v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"Buffer no longer valid"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v10;
        __int16 v20 = 2114;
        uint64_t v21 = v12;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      BOOL v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter mutableBytes]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 628, @"Buffer no longer valid", v13, v14, v15, v16, v17);
  }
  return self->_mutableBytes;
}

- (NUMutableBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 bytes:(const void *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  BOOL v8 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    BOOL v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = NSStringFromSelector(a2);
    uint64_t v13 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    uint64_t v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      __int16 v28 = 2114;
      uint64_t v29 = v19;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    uint64_t v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  __int16 v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter initWithSize:format:rowBytes:bytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 624, @"Initializer not available: -[%@ %@], use designated initializer instead.", v22, v23, v24, v25, v21);
}

- (NUMutableBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 mutableBytes:(void *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUMutableBufferAdapter;
  result = [(NUBufferAdapter *)&v8 initWithSize:a3.var0 format:a3.var1 rowBytes:a4 bytes:a5];
  result->_mutableBytes = a6;
  return result;
}

- (NUMutableBufferAdapter)initWithMutableBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 size];
  uint64_t v7 = v6;
  objc_super v8 = [v4 format];
  BOOL v9 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:](self, "initWithSize:format:rowBytes:mutableBytes:", v5, v7, v8, [v4 rowBytes], objc_msgSend(v4, "mutableBytes"));

  return v9;
}

@end