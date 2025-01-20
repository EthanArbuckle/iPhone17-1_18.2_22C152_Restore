@interface _NUContiguousImageLayout
- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3;
- (id)tileInfoAtIndex:(int64_t)a3;
- (int64_t)tileCount;
- (int64_t)tileIndexAtPoint:(id)a3;
- (void)enumerateTilesForReadingInRect:(id *)a3 withBlock:(id)a4;
- (void)enumerateTilesForWritingInRect:(id *)a3 withBlock:(id)a4;
@end

@implementation _NUContiguousImageLayout

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
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  [(_NUContiguousImageLayout *)self enumerateTilesForReadingInRect:v5 withBlock:a4];
}

- (void)enumerateTilesForReadingInRect:(id *)a3 withBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *, unsigned char *))a4;
  if (!v6)
  {
    v12 = NUAssertLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUContiguousImageLayout enumerateTilesForReadingInRect:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 232, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"block != nil");
  }
  *(void *)&long long v7 = [(NUImageLayout *)self imageSize];
  *((void *)&v7 + 1) = v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  *(_OWORD *)&buf[16] = v7;
  v29[0] = var0;
  v29[1] = var1;
  NU::RectT<long>::Intersection((uint64_t)v26, (uint64_t *)buf, (uint64_t *)v29);
  if (v27 && v28)
  {
    buf[0] = 0;
    v11 = [(_NUContiguousImageLayout *)self tileInfoAtIndex:0];
    v6[2](v6, v11, buf);
  }
}

- (int64_t)tileIndexAtPoint:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v5 = [(NUImageLayout *)self imageSize];
  if (var1 >= v6) {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v7 = 0;
  }
  if (var1 < 0 || var0 >= v5 || var0 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v7;
  }
}

- (id)tileInfoAtIndex:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 < 0 || [(_NUContiguousImageLayout *)self tileCount] <= a3)
  {
    int64_t v7 = NUAssertLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUContiguousImageLayout tileInfoAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 218, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  memset(buf, 0, 32);
  [(_NUContiguousImageLayout *)self contentRectForTileAtIndex:a3];
  v22[0] = *(_OWORD *)buf;
  v22[1] = *(_OWORD *)&buf[16];
  v21[0] = *(_OWORD *)buf;
  v21[1] = *(_OWORD *)&buf[16];
  uint64_t v5 = +[NUTileInfo tileInfoWithIndex:a3 size:*(_OWORD *)&buf[16] frameRect:v22 contentRect:v21];

  return v5;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRectForTileAtIndex:(SEL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a4 < 0 || [(_NUContiguousImageLayout *)self tileCount] <= a4)
  {
    uint64_t v8 = NUAssertLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v11 = NUAssertLogger();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v15;
        __int16 v24 = 2114;
        uint64_t v25 = v17;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUContiguousImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 213, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  retstr->var0.int64_t var0 = 0;
  retstr->var0.int64_t var1 = 0;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = ($8D19A3D7F6B32A57CF9B882F3E1C418F *)[(NUImageLayout *)self imageSize];
  retstr->var1.int64_t var0 = (int64_t)result;
  retstr->var1.int64_t var1 = v7;
  return result;
}

- (int64_t)tileCount
{
  return 1;
}

@end