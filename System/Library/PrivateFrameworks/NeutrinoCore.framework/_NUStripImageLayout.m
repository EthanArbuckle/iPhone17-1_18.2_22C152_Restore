@interface _NUStripImageLayout
- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3;
- (BOOL)isEqualToLayout:(id)a3;
- (_NUStripImageLayout)initWithImageSize:(id)a3 stripHeight:(int64_t)a4;
- (id)tileInfoAtIndex:(int64_t)a3;
- (int64_t)tileCount;
@end

@implementation _NUStripImageLayout

- (BOOL)isEqualToLayout:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_NUStripImageLayout;
  BOOL v5 = [(NUImageLayout *)&v7 isEqualToLayout:v4]
    && self->_stripHeight == v4[3]
    && self->_stripCount == v4[4];

  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts
{
  int64_t stripCount = self->_stripCount;
  int64_t v3 = 1;
  result.var1 = stripCount;
  result.var0 = v3;
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

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize
{
  int64_t v3 = [(NUImageLayout *)self imageSize];
  int64_t stripHeight = self->_stripHeight;
  result.var1 = stripHeight;
  result.var0 = v3;
  return result;
}

- (id)tileInfoAtIndex:(int64_t)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  -[_NUStripImageLayout contentRectForTileAtIndex:](self, "contentRectForTileAtIndex:");
  v7[0] = v8;
  v7[1] = v9;
  v6[0] = v8;
  v6[1] = v9;
  v4 = +[NUTileInfo tileInfoWithIndex:a3 size:v9 frameRect:v7 contentRect:v6];

  return v4;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a4 < 0 || [(_NUStripImageLayout *)self tileCount] <= a4)
  {
    v15 = NUAssertLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStripImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 385, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(_NUStripImageLayout *)self tileCount];
  if ((uint64_t)result > a4)
  {
    *(void *)&long long v8 = [(NUImageLayout *)self imageSize];
    *((void *)&v8 + 1) = v9;
    long long v29 = v8;
    int64_t v10 = self->_stripHeight * a4;
    uint64_t v11 = [(NUImageLayout *)self imageSize];
    *(void *)&long long v12 = 0;
    *((void *)&v12 + 1) = v10;
    *(void *)&long long v13 = v11;
    *((void *)&v13 + 1) = self->_stripHeight;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *(_OWORD *)&buf[16] = v29;
    v31[0] = v12;
    v31[1] = v13;
    NU::RectT<long>::Intersection((uint64_t)v30, (uint64_t *)buf, (uint64_t *)v31);
    $0AC6E346AE4835514AAA8AC86D8F4844 v14 = ($0AC6E346AE4835514AAA8AC86D8F4844)v30[1];
    retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v30[0];
    retstr->var1 = v14;
  }
  return result;
}

- (int64_t)tileCount
{
  return self->_stripCount;
}

- (_NUStripImageLayout)initWithImageSize:(id)a3 stripHeight:(int64_t)a4
{
  int64_t var1 = a3.var1;
  v8.receiver = self;
  v8.super_class = (Class)_NUStripImageLayout;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUImageLayout *)&v8 initWithImageSize:a3.var0];
  if (result)
  {
    result->_int64_t stripHeight = a4;
    int64_t v7 = var1 / a4;
    if (var1 != var1 / a4 * a4) {
      ++v7;
    }
    result->_int64_t stripCount = v7;
  }
  return result;
}

@end