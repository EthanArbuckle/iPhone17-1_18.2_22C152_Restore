@interface NUBufferAdapter
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NSString)description;
- (NUBufferAdapter)init;
- (NUBufferAdapter)initWithBuffer:(id)a3;
- (NUBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 bytes:(const void *)a6;
- (NUPixelFormat)format;
- (const)bytes;
- (const)bytesAtPoint:(id)a3;
- (id)debugQuickLookObject;
- (int64_t)rowBytes;
- (void)invalidate;
- (void)provideBuffer:(id)a3;
@end

@implementation NUBufferAdapter

- (void).cxx_destruct
{
}

- (int64_t)rowBytes
{
  return self->_rowBytes;
}

- (NUPixelFormat)format
{
  return self->_format;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)debugQuickLookObject
{
  int64_t v3 = [(NUBufferAdapter *)self rowBytes];
  [(NUBufferAdapter *)self size];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", -[NUBufferAdapter bytes](self, "bytes"), v4 * v3);
  uint64_t v6 = [(NUBufferAdapter *)self size];
  uint64_t v8 = v7;
  id v9 = objc_alloc(MEMORY[0x1E4F1E050]);
  v10 = [(NUBufferAdapter *)self format];
  v11 = objc_msgSend(v9, "initWithBitmapData:bytesPerRow:size:format:colorSpace:", v5, v3, objc_msgSend(v10, "CIFormat"), 0, (double)v6, (double)v8);

  return v11;
}

- (NSString)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  format = self->_format;
  uint64_t v6 = [NSString stringWithFormat:@"{%ld, %ld}", self->_size.width, self->_size.height];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p> %@ %@ bpr=%ld bytes=%p", v4, self, format, v6, self->_rowBytes, self->_bytes];

  return (NSString *)v7;
}

- (void)provideBuffer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = v4;
  if (!self->_valid)
  {
    v5 = NUAssertLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [NSString stringWithFormat:@"Buffer no longer valid"];
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger();
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
    _NUAssertFailHandler((uint64_t)"-[NUBufferAdapter provideBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 585, @"Buffer no longer valid", v15, v16, v17, v18, v19);
  }
  (*((void (**)(id, NUBufferAdapter *))v4 + 2))(v4, self);
}

- (void)invalidate
{
  self->_valid = 0;
}

- (const)bytesAtPoint:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!self->_valid)
  {
    id v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Buffer no longer valid"];
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
    _NUAssertFailHandler((uint64_t)"-[NUBufferAdapter bytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 570, @"Buffer no longer valid", v21, v22, v23, v24, v32);
  }
  if (a3.var0 < 0 || a3.var0 >= self->_size.width || a3.var1 < 0 || a3.var1 >= self->_size.height)
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
    _NUAssertFailHandler((uint64_t)"-[NUBufferAdapter bytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 572, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  return (char *)self->_bytes
       + self->_rowBytes * a3.var1
       + [(NUPixelFormat *)self->_format bytesPerPixel] * a3.var0;
}

- (const)bytes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_valid)
  {
    int64_t v3 = NUAssertLogger();
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
    _NUAssertFailHandler((uint64_t)"-[NUBufferAdapter bytes]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 565, @"Buffer no longer valid", v13, v14, v15, v16, v17);
  }
  return self->_bytes;
}

- (NUBufferAdapter)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  int64_t v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(a2);
    BOOL v8 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v6, v7];
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    BOOL v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    BOOL v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUBufferAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 561, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

- (NUBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 bytes:(const void *)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v11 = (NUPixelFormat *)a4;
  v15.receiver = self;
  v15.super_class = (Class)NUBufferAdapter;
  v12 = [(NUBufferAdapter *)&v15 init];
  v12->_size.int64_t width = var0;
  v12->_size.int64_t height = var1;
  format = v12->_format;
  v12->_format = v11;

  v12->_rowBytes = a5;
  v12->_bytes = a6;
  v12->_valid = 1;
  return v12;
}

- (NUBufferAdapter)initWithBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 size];
  uint64_t v7 = v6;
  BOOL v8 = [v4 format];
  BOOL v9 = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:](self, "initWithSize:format:rowBytes:bytes:", v5, v7, v8, [v4 rowBytes], objc_msgSend(v4, "bytes"));

  return v9;
}

@end