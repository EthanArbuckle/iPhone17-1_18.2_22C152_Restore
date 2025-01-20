@interface _NUFixedTileSizeImageLayout
- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRectForTileAtIndex:(SEL)a3;
- (BOOL)isEqualToLayout:(id)a3;
- (_NUFixedTileSizeImageLayout)initWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5;
- (id)tileInfoAtIndex:(int64_t)a3;
- (int64_t)tileCount;
@end

@implementation _NUFixedTileSizeImageLayout

- (BOOL)isEqualToLayout:(id)a3
{
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NUFixedTileSizeImageLayout;
  BOOL v7 = [(NUImageLayout *)&v10 isEqualToLayout:v4]
    && (self->_tileSize.width == v4[3] ? (BOOL v5 = self->_tileSize.height == v4[4]) : (BOOL v5 = 0),
        v5 && (self->_borderSize.width == v4[5] ? (BOOL v6 = self->_borderSize.height == v4[6]) : (BOOL v6 = 0), v6))
    && self->_tileCounts.width == v4[7]
    && self->_tileCounts.height == v4[8];

  return v7;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts
{
  p_tileCounts = &self->_tileCounts;
  int64_t width = self->_tileCounts.width;
  int64_t height = p_tileCounts->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize
{
  p_borderSize = &self->_borderSize;
  int64_t width = self->_borderSize.width;
  int64_t height = p_borderSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize
{
  p_tileSize = &self->_tileSize;
  int64_t width = self->_tileSize.width;
  int64_t height = p_tileSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)tileInfoAtIndex:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 < 0 || [(_NUFixedTileSizeImageLayout *)self tileCount] <= a3)
  {
    v8 = NUAssertLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = [MEMORY[0x1E4F29060] callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout tileInfoAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 331, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  memset(buf, 0, 32);
  [(_NUFixedTileSizeImageLayout *)self frameRectForTileAtIndex:a3];
  long long v5 = *(_OWORD *)&buf[16];
  v23[0] = *(_OWORD *)buf;
  v23[1] = *(_OWORD *)&buf[16];
  [(_NUFixedTileSizeImageLayout *)self contentRectForTileAtIndex:a3];
  BOOL v6 = +[NUTileInfo tileInfoWithIndex:a3 size:v5 frameRect:v23 contentRect:v22];

  return v6;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a4 < 0 || [(_NUFixedTileSizeImageLayout *)self tileCount] <= a4)
  {
    v27 = NUAssertLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      *(_DWORD *)buf = 138543362;
      v45 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v34;
        __int16 v46 = 2114;
        v47 = v36;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 301, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  int64_t width = self->_tileCounts.width;
  int64_t v8 = a4 / width;
  int64_t v9 = a4 / width * width;
  int64_t v10 = a4 % width;
  int64_t v12 = self->_borderSize.width;
  int64_t height = self->_borderSize.height;
  int64_t v13 = self->_tileSize.width - 2 * v12;
  int64_t v14 = a4 % width + 1;
  int64_t v15 = self->_tileSize.height - 2 * height;
  int64_t v16 = a4 / width + 1;
  int64_t v17 = height + v15 * v16;
  if (v14 == width)
  {
    int64_t v42 = a4 % width;
    int64_t v43 = a4 / width * width;
    int64_t v41 = self->_tileSize.width - 2 * v12;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = ($8D19A3D7F6B32A57CF9B882F3E1C418F *)[(NUImageLayout *)self imageSize];
    int64_t v13 = v41;
    int64_t v10 = v42;
    int64_t v9 = v43;
  }
  else
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = ($8D19A3D7F6B32A57CF9B882F3E1C418F *)(v12 + v13 * v14);
  }
  if (v16 == self->_tileCounts.height)
  {
    uint64_t v19 = result;
    uint64_t v20 = self;
    int64_t v21 = v9;
    int64_t v22 = v10;
    int64_t v23 = v13;
    [(NUImageLayout *)v20 imageSize];
    $0AC6E346AE4835514AAA8AC86D8F4844 result = v19;
    int64_t v13 = v23;
    int64_t v10 = v22;
    int64_t v9 = v21;
    int64_t v17 = v24;
  }
  int64_t v25 = height + v15 * v8;
  if (!v8) {
    int64_t v25 = 0;
  }
  int64_t v26 = v12 + v13 * v10;
  if (a4 == v9) {
    int64_t v26 = 0;
  }
  retstr->var0.var0 = v26;
  retstr->var0.var1 = v25;
  retstr->var1.var0 = (int64_t)result - v26;
  retstr->var1.var1 = v17 - v25;
  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRectForTileAtIndex:(SEL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a4 < 0 || [(_NUFixedTileSizeImageLayout *)self tileCount] <= a4)
  {
    int64_t v21 = NUAssertLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v24 = NUAssertLogger();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        __int16 v37 = 2114;
        uint64_t v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      int64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout frameRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 286, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  int64_t width = self->_tileCounts.width;
  int64_t v8 = a4 / width;
  int64_t v9 = self->_tileSize.width;
  int64_t v10 = (v9 - 2 * self->_borderSize.width) * (a4 % width);
  int64_t v11 = v10 & ~(v10 >> 63);
  int64_t v12 = v11 + v9;
  uint64_t v13 = [(NUImageLayout *)self imageSize];
  if (v13 < v12) {
    int64_t v12 = v13;
  }
  int64_t height = self->_tileSize.height;
  int64_t v15 = (height - 2 * self->_borderSize.height) * v8;
  int64_t v16 = v15 & ~(v15 >> 63);
  int64_t v17 = v16 + height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = ($8D19A3D7F6B32A57CF9B882F3E1C418F *)[(NUImageLayout *)self imageSize];
  if (v19 >= v17) {
    int64_t v20 = v17;
  }
  else {
    int64_t v20 = v19;
  }
  retstr->var0.var0 = v11;
  retstr->var0.var1 = v16;
  retstr->var1.var0 = v12 - v11;
  retstr->var1.var1 = v20 - v16;
  return result;
}

- (int64_t)tileCount
{
  return self->_tileCounts.height * self->_tileCounts.width;
}

- (_NUFixedTileSizeImageLayout)initWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a4.var0 || (int64_t var1 = a4.var1) == 0)
  {
    int64_t v20 = NUAssertLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(tileSize)");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v23 = NUAssertLogger();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v33;
        __int16 v49 = 2114;
        v50 = v35;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      BOOL v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v36 = "!NUPixelSizeIsEmpty(tileSize)";
    uint64_t v37 = 269;
LABEL_24:

    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout initWithImageSize:tileSize:borderSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", v37, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)v36);
  }
  uint64_t var0 = a5.var0;
  int64_t v7 = a4.var0;
  if (a4.var0 <= 2 * a5.var0 || (int64_t v8 = a5.var1, v9 = (double)a5.var1, v9 + v9 >= (double)a4.var1))
  {
    v27 = NUAssertLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tileSize.width > (2 * borderSize.width) && tileSize.height > (2.0 * borderSize.height)");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v23 = NUAssertLogger();
    BOOL v30 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v30)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v38;
        __int16 v49 = 2114;
        v50 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v32;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v36 = "tileSize.width > (2 * borderSize.width) && tileSize.height > (2.0 * borderSize.height)";
    uint64_t v37 = 270;
    goto LABEL_24;
  }
  int64_t v10 = a3.var1;
  int64_t v11 = a3.var0;
  double v45 = (double)a5.var1;
  v46.receiver = self;
  v46.super_class = (Class)_NUFixedTileSizeImageLayout;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = -[NUImageLayout initWithImageSize:](&v46, sel_initWithImageSize_, (double)a4.var1, v9 + v9);
  if (result)
  {
    result->_tileSize.int64_t width = v7;
    result->_tileSize.int64_t height = var1;
    result->_borderSize.int64_t width = var0;
    result->_borderSize.int64_t height = v8;
    v13.i64[0] = v11;
    v13.i64[1] = v10;
    v14.f64[0] = (double)var0;
    v14.f64[1] = v45;
    __asm { FMOV            V3.2D, #-2.0 }
    result->_tileCounts = ($5BB7312FFE32F1AB3F1F5957C99A58B3)vcvtq_s64_f64(vrndpq_f64(vdivq_f64(vmaxnmq_f64(vmlaq_f64(vcvtq_f64_s64(v13), _Q3, v14), (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL)), vmlaq_f64(vcvtq_f64_s64((int64x2_t)result->_tileSize), _Q3, v14))));
  }
  return result;
}

@end