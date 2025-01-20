@interface _NUAbstractStorage
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (BOOL)isDirty;
- (BOOL)isValidInRect:(id *)a3;
- (BOOL)isValidInRegion:(id)a3;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)format;
- (NURegion)validRegion;
- (_NUAbstractStorage)init;
- (int64_t)copyFromStorage:(id)a3 region:(id)a4;
- (int64_t)fillBufferWithPattern4:(unsigned int)a3;
- (int64_t)fillBufferWithPattern8:(unint64_t)a3;
- (int64_t)readBufferInRegion:(id)a3 block:(id)a4;
- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5;
- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4;
- (int64_t)useAsCVPixelBufferWithBlock:(id)a3;
- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4;
- (void)_resetSize:(id)a3 format:(id)a4;
- (void)assertIsValidInRect:(id *)a3;
- (void)assertIsValidInRegion:(id)a3;
- (void)invalidate;
- (void)provideBuffer:(id)a3;
- (void)provideMutableBuffer:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setFormat:(id)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setSize:(id)a3;
- (void)validateRect:(id *)a3;
- (void)validateRegion:(id)a3;
@end

@implementation _NUAbstractStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->colorSpace, 0);

  objc_storeStrong((id *)&self->_validRegion, 0);
}

- (void)setFormat:(id)a3
{
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setIsDirty:(BOOL)a3
{
  self->isDirty = a3;
}

- (BOOL)isDirty
{
  return self->isDirty;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 24, 1);
}

- (void)provideMutableBuffer:(id)a3
{
  id v4 = a3;
  v7[0] = 0;
  v7[1] = 0;
  v7[2] = [(_NUAbstractStorage *)self size];
  v7[3] = v5;
  v6 = +[NURegion regionWithRect:v7];
  [(_NUAbstractStorage *)self writeBufferInRegion:v6 block:v4];
}

- (void)provideBuffer:(id)a3
{
  id v5 = a3;
  id v4 = [(_NUAbstractStorage *)self validRegion];
  [(_NUAbstractStorage *)self readBufferInRegion:v4 block:v5];
}

- (int64_t)useAsCVPixelBufferWithBlock:(id)a3
{
  return 0;
}

- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4
{
  return 0;
}

- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5
{
  return 0;
}

- (int64_t)fillBufferWithPattern8:(unint64_t)a3
{
  uint64_t v5 = [(_NUAbstractStorage *)self size];
  uint64_t v7 = v6;
  uint64_t v8 = [(_NUAbstractStorage *)self sizeInBytes];
  v13[0] = 0;
  v13[1] = 0;
  v13[2] = v5;
  v13[3] = v7;
  v9 = +[NURegion regionWithRect:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45___NUAbstractStorage_fillBufferWithPattern8___block_invoke;
  v12[3] = &__block_descriptor_48_e27_v16__0___NUMutableBuffer__8l;
  v12[4] = a3;
  v12[5] = v8;
  int64_t v10 = [(_NUAbstractStorage *)self writeBufferInRegion:v9 block:v12];

  return v10;
}

- (int64_t)fillBufferWithPattern4:(unsigned int)a3
{
  uint64_t v5 = [(_NUAbstractStorage *)self size];
  uint64_t v7 = v6;
  uint64_t v8 = [(_NUAbstractStorage *)self sizeInBytes];
  v14[0] = 0;
  v14[1] = 0;
  v14[2] = v5;
  v14[3] = v7;
  v9 = +[NURegion regionWithRect:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45___NUAbstractStorage_fillBufferWithPattern4___block_invoke;
  v12[3] = &__block_descriptor_44_e27_v16__0___NUMutableBuffer__8l;
  unsigned int v13 = a3;
  v12[4] = v8;
  int64_t v10 = [(_NUAbstractStorage *)self writeBufferInRegion:v9 block:v12];

  return v10;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  return 0;
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  return 0;
}

- (int64_t)copyFromStorage:(id)a3 region:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16007);
  }
  uint64_t v7 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    int64_t v10 = NSStringFromClass(v9);
    v11 = [v8 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16007);
    }
    v12 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      __int16 v26 = 2114;
      v27 = v17;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16007);
    }
    v12 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 100, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v20, v21, v22, v23, v19);
}

- (void)assertIsValidInRegion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if (!-[_NUAbstractStorage isValidInRegion:](self, "isValidInRegion:"))
  {
    id v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [NSString stringWithFormat:@"%@ is not valid in %@: %@", self, v18, self->_validRegion];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v7 = NUAssertLogger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        unsigned int v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v11;
        __int16 v21 = 2114;
        uint64_t v22 = v13;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage assertIsValidInRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 95, @"%@ is not valid in %@: %@", v14, v15, v16, v17, (uint64_t)self);
  }
}

- (void)assertIsValidInRect:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v22[0] = a3->var0;
  v22[1] = var1;
  if (![(_NUAbstractStorage *)self isValidInRect:v22])
  {
    id v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSString;
      BOOL v8 = [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", a3->var0.var0, a3->var0.var1, a3->var1.var0, a3->var1.var1];
      v9 = [v7 stringWithFormat:@"%@ is not valid in %@: %@", self, v8, self->_validRegion];
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        __int16 v25 = 2114;
        __int16 v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      unsigned int v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", a3->var0.var0, a3->var0.var1, a3->var1.var0, a3->var1.var1];
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage assertIsValidInRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 89, @"%@ is not valid in %@: %@", v18, v19, v20, v21, (uint64_t)self);
  }
}

- (BOOL)isValidInRegion:(id)a3
{
  id v4 = a3;
  validRegion = self->_validRegion;
  if (validRegion) {
    char v6 = [(NURegion *)validRegion includesRegion:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isValidInRect:(id *)a3
{
  validRegion = self->_validRegion;
  if (!validRegion) {
    return 1;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  return [(NURegion *)validRegion includesRect:v6];
}

- (void)invalidate
{
}

- (NURegion)validRegion
{
  int64_t v2 = (void *)[(NUMutableRegion *)self->_validRegion copy];

  return (NURegion *)v2;
}

- (void)validateRegion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if ([(_NUAbstractStorage *)self isDirty])
  {
    id v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [NSString stringWithFormat:@"Storage was left dirty!"];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v7 = NUAssertLogger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        unsigned int v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v11;
        __int16 v22 = 2114;
        uint64_t v23 = v13;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage validateRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 60, @"Storage was left dirty!", v14, v15, v16, v17, v18);
  }
  [(NUMutableRegion *)self->_validRegion addRegion:v19];
}

- (void)validateRect:(id *)a3
{
  validRegion = self->_validRegion;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  [(NUMutableRegion *)validRegion addRect:v5];
}

- (void)_resetSize:(id)a3 format:(id)a4
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
  objc_storeStrong((id *)&self->_format, a4);
}

- (_NUAbstractStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)_NUAbstractStorage;
  return [(_NUAbstractStorage *)&v3 init];
}

@end