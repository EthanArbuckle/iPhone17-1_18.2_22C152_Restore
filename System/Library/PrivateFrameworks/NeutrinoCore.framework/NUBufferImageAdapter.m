@interface NUBufferImageAdapter
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NUBufferImageAdapter)init;
- (NUBufferImageAdapter)initWithBuffer:(id)a3 colorSpace:(id)a4 validRegion:(id)a5;
- (NUBufferImageAdapter)initWithBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5;
- (NUColorSpace)colorSpace;
- (NUImageLayout)layout;
- (NUPixelFormat)format;
- (NURegion)validRegion;
- (id)debugQuickLookObject;
- (id)mutableImageCopy;
- (id)mutablePurgeableImageCopy;
- (id)purgeableImageCopy;
- (void)readBufferRegion:(id)a3 withBlock:(id)a4;
@end

@implementation NUBufferImageAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_validRegion, 0);
  objc_storeStrong((id *)&self->_bufferProvider, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

- (NURegion)validRegion
{
  return (NURegion *)objc_getProperty(self, a2, 24, 1);
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 32, 1);
}

- (NUImageLayout)layout
{
  return (NUImageLayout *)objc_getProperty(self, a2, 8, 1);
}

- (id)debugQuickLookObject
{
  v2 = +[NUImageFactory newCGImageFromBufferImage:self];
  v3 = [MEMORY[0x1E4F1E050] imageWithCGImage:v2];
  CGImageRelease(v2);

  return v3;
}

- (id)mutablePurgeableImageCopy
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v5];
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  _NUAssertFailHandler((uint64_t)"-[NUBufferImageAdapter mutablePurgeableImageCopy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 462, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v15, v16, v17, v18, v14);
}

- (id)purgeableImageCopy
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v5];
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  _NUAssertFailHandler((uint64_t)"-[NUBufferImageAdapter purgeableImageCopy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 458, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v15, v16, v17, v18, v14);
}

- (id)mutableImageCopy
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v5];
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  _NUAssertFailHandler((uint64_t)"-[NUBufferImageAdapter mutableImageCopy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 454, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v15, v16, v17, v18, v14);
}

- (void)readBufferRegion:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NUBufferImageAdapter *)self size];
  bufferProvider = self->_bufferProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__NUBufferImageAdapter_readBufferRegion_withBlock___block_invoke;
  v10[3] = &unk_1E5D94938;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = v6;
  uint64_t v15 = v8;
  id v9 = v5;
  id v11 = v9;
  [(NUBufferProvider *)bufferProvider provideBuffer:v10];
}

void __51__NUBufferImageAdapter_readBufferRegion_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v9 = 0;
  v4 = [NUBufferTileAdapter alloc];
  long long v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  v7[0] = v8[0];
  v7[1] = v5;
  uint64_t v6 = [(NUBufferTileAdapter *)v4 initWithFrameRect:v8 contentRect:v7 buffer:v3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)[(NUBufferProvider *)self->_bufferProvider format];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2 = [(NUBufferProvider *)self->_bufferProvider size];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUBufferImageAdapter)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  int64_t v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    long long v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v6, v7];
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    char v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
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
    char v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUBufferImageAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 429, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

- (NUBufferImageAdapter)initWithBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (NURegion *)a5;
  uint64_t v12 = v11;
  if (!v9)
  {
    uint64_t v20 = NUAssertLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "provider != nil");
      *(_DWORD *)buf = 138543362;
      v56 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v23 = NUAssertLogger();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v56 = v39;
        __int16 v57 = 2114;
        v58 = v41;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v56 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v42 = "provider != nil";
    uint64_t v43 = 414;
LABEL_29:

    _NUAssertFailHandler((uint64_t)"-[NUBufferImageAdapter initWithBufferProvider:colorSpace:validRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v43, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)v42);
  }
  if (!v10)
  {
    v27 = NUAssertLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != nil");
      *(_DWORD *)buf = 138543362;
      v56 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v23 = NUAssertLogger();
    BOOL v30 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v30)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v56 = v44;
        __int16 v57 = 2114;
        v58 = v46;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v56 = v32;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v42 = "colorSpace != nil";
    uint64_t v43 = 415;
    goto LABEL_29;
  }
  if (!v11)
  {
    v33 = NUAssertLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "validRegion != nil");
      *(_DWORD *)buf = 138543362;
      v56 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v23 = NUAssertLogger();
    BOOL v36 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v36)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = [MEMORY[0x1E4F29060] callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v56 = v47;
        __int16 v57 = 2114;
        v58 = v49;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v56 = v38;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v42 = "validRegion != nil";
    uint64_t v43 = 416;
    goto LABEL_29;
  }
  v54.receiver = self;
  v54.super_class = (Class)NUBufferImageAdapter;
  uint64_t v13 = [(NUBufferImageAdapter *)&v54 init];
  objc_storeStrong((id *)&v13->_bufferProvider, a3);
  objc_storeStrong((id *)&v13->_colorSpace, a4);
  uint64_t v14 = [v9 size];
  uint64_t v16 = +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v14, v15);
  layout = v13->_layout;
  v13->_layout = (NUImageLayout *)v16;

  validRegion = v13->_validRegion;
  v13->_validRegion = v12;

  return v13;
}

- (NUBufferImageAdapter)initWithBuffer:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
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
        __int16 v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v23 = [v22 componentsJoinedByString:@"\n"];
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
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferImageAdapter initWithBuffer:colorSpace:validRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 407, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"buffer != nil");
  }
  id v11 = [[NUBufferAdapter alloc] initWithBuffer:v8];
  uint64_t v12 = [(NUBufferImageAdapter *)self initWithBufferProvider:v11 colorSpace:v9 validRegion:v10];

  return v12;
}

@end