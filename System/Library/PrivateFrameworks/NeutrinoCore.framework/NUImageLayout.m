@interface NUImageLayout
+ (id)contiguousLayoutForImageSize:(id)a3;
+ (id)overlappingTiledLayoutForImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5;
+ (id)stripLayoutForImageSize:(id)a3 stripHeight:(int64_t)a4;
+ (id)tiledLayoutForImageSize:(id)a3 tileSize:(id)a4;
- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRectForTileAtIndex:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayout:(id)a3;
- (NUImageLayout)initWithImageSize:(id)a3;
- (id)tileInfoAtIndex:(int64_t)a3;
- (int64_t)tileCount;
- (int64_t)tileIndexAtPoint:(id)a3;
- (unint64_t)hash;
- (void)enumerateTilesForReadingInRect:(id *)a3 withBlock:(id)a4;
- (void)enumerateTilesForWritingInRect:(id *)a3 withBlock:(id)a4;
@end

@implementation NUImageLayout

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  int64_t height = self->_imageSize.height;
  int64_t width = self->_imageSize.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (BOOL)isEqualToLayout:(id)a3
{
  v4 = (NUImageLayout *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(NUImageLayout *)self imageSize];
    uint64_t v8 = v7;
    BOOL v11 = v6 == [(NUImageLayout *)v5 imageSize] && v8 == v9;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NUImageLayout *)a3;
  BOOL v5 = v4 == self || [(NUImageLayout *)self isEqualToLayout:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = 0x1BB0CD58560A4FLL * [(NUImageLayout *)self imageSize];
  [(NUImageLayout *)self imageSize];
  return (0xF972516339251 * v4) ^ v3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts
{
  int64_t v2 = 1;
  int64_t v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize
{
  int64_t v2 = 0;
  int64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)enumerateTilesForWritingInRect:(id *)a3 withBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, unsigned char *))a4;
  uint64_t v7 = [(NUImageLayout *)self tileCount];
  unsigned __int8 v20 = 0;
  uint64_t v8 = v7 - 1;
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = -[NUImageLayout tileInfoAtIndex:](self, "tileInfoAtIndex:", v9, v18, v19);
      BOOL v11 = v10;
      if (v10)
      {
        [v10 frameRect];
        long long v13 = v18;
        long long v12 = v19;
      }
      else
      {
        long long v12 = 0uLL;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v13 = 0uLL;
      }
      $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
      $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
      v25[0] = v13;
      v25[1] = v12;
      v24[0] = var0;
      v24[1] = var1;
      NU::RectT<long>::Intersection((uint64_t)v21, (uint64_t *)v25, (uint64_t *)v24);
      if (v22 && v23) {
        v6[2](v6, v11, &v20);
      }
      int v16 = v20;

      if (v16) {
        break;
      }
    }
    while (v8 != v9++);
  }
}

- (void)enumerateTilesForReadingInRect:(id *)a3 withBlock:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *, unsigned char *))a4;
  if (!v6)
  {
    long long v19 = NUAssertLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageLayout enumerateTilesForReadingInRect:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 115, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"block != nil");
  }
  uint64_t v7 = [(NUImageLayout *)self tileCount];
  char v35 = 0;
  uint64_t v8 = v7 - 1;
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [(NUImageLayout *)self tileInfoAtIndex:v9];
      BOOL v11 = v10;
      if (v10)
      {
        [v10 contentRect];
        long long v13 = v33;
        long long v12 = v34;
      }
      else
      {
        long long v12 = 0uLL;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v13 = 0uLL;
      }
      $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
      $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
      *(_OWORD *)buf = v13;
      *(_OWORD *)&buf[16] = v12;
      v39[0] = var0;
      v39[1] = var1;
      NU::RectT<long>::Intersection((uint64_t)v36, (uint64_t *)buf, (uint64_t *)v39);
      if (v37 && v38) {
        v6[2](v6, v11, &v35);
      }
      BOOL v16 = v35 != 0;

      char v18 = v8 == v9++ || v16;
    }
    while ((v18 & 1) == 0);
  }
}

- (id)tileInfoAtIndex:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
  }
  int64_t v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    BOOL v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [v4 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v8 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      long long v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      __int16 v22 = 2114;
      BOOL v23 = v13;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v8 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  _NUAssertFailHandler((uint64_t)"-[NUImageLayout tileInfoAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 110, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v16, v17, v18, v19, v15);
}

- (int64_t)tileIndexAtPoint:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = a3;
  v6[1] = ($0AC6E346AE4835514AAA8AC86D8F4844)vdupq_n_s64(1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__NUImageLayout_tileIndexAtPoint___block_invoke;
  v5[3] = &unk_1E5D94520;
  v5[4] = &v7;
  [(NUImageLayout *)self enumerateTilesForReadingInRect:v6 withBlock:v5];
  int64_t v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __34__NUImageLayout_tileIndexAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 index];
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
  }
  uint64_t v4 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v7];
    *(_DWORD *)buf = 138543362;
    __int16 v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      long long v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  _NUAssertFailHandler((uint64_t)"-[NUImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 97, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v17, v18, v19, v20, v16);
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRectForTileAtIndex:(SEL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
  }
  uint64_t v4 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v7];
    *(_DWORD *)buf = 138543362;
    __int16 v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      long long v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  _NUAssertFailHandler((uint64_t)"-[NUImageLayout frameRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 93, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v17, v18, v19, v20, v16);
}

- (int64_t)tileCount
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
  }
  int64_t v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    uint64_t v6 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v5];
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v6;
    _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v10;
      __int16 v21 = 2114;
      __int16 v22 = v12;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
    }
    uint64_t v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v9;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  long long v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  _NUAssertFailHandler((uint64_t)"-[NUImageLayout tileCount]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 89, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v15, v16, v17, v18, v14);
}

- (NUImageLayout)initWithImageSize:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3.var0 || (int64_t var1 = a3.var1) == 0)
  {
    uint64_t v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [NSString stringWithFormat:@"Image size must not be empty"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        long long v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        uint64_t v25 = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageLayout initWithImageSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 80, @"Image size must not be empty", v16, v17, v18, v19, v20);
  }
  int64_t var0 = a3.var0;
  v21.receiver = self;
  v21.super_class = (Class)NUImageLayout;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUImageLayout *)&v21 init];
  if (result)
  {
    result->_imageSize.int64_t width = var0;
    result->_imageSize.int64_t height = var1;
  }
  return result;
}

+ (id)stripLayoutForImageSize:(id)a3 stripHeight:(int64_t)a4
{
  uint64_t v4 = -[_NUStripImageLayout initWithImageSize:stripHeight:]([_NUStripImageLayout alloc], "initWithImageSize:stripHeight:", a3.var0, a3.var1, a4);

  return v4;
}

+ (id)overlappingTiledLayoutForImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5
{
  BOOL v5 = -[_NUFixedTileSizeImageLayout initWithImageSize:tileSize:borderSize:]([_NUFixedTileSizeImageLayout alloc], "initWithImageSize:tileSize:borderSize:", a3.var0, a3.var1, a4.var0, a4.var1, a5.var0, a5.var1);

  return v5;
}

+ (id)tiledLayoutForImageSize:(id)a3 tileSize:(id)a4
{
  uint64_t v4 = -[_NUFixedTileSizeImageLayout initWithImageSize:tileSize:borderSize:]([_NUFixedTileSizeImageLayout alloc], "initWithImageSize:tileSize:borderSize:", a3.var0, a3.var1, a4.var0, a4.var1, 0, 0);

  return v4;
}

+ (id)contiguousLayoutForImageSize:(id)a3
{
  id v3 = -[NUImageLayout initWithImageSize:]([_NUContiguousImageLayout alloc], "initWithImageSize:", a3.var0, a3.var1);

  return v3;
}

@end