@interface NUImageGeometry
- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale;
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaledSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extent;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)physicalScaledExtent;
- (CGRect)scaledExtent;
- (NUImageGeometry)init;
- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4;
- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5;
- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5 spaceMap:(id)a6;
- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5 spaceMap:(id)a6 roundingPolicy:(int64_t)a7;
- (NUTaggedSpaceMapping)spaceMap;
- (id)description;
- (id)transformWithSourceSpace:(id)a3 destinationSpace:(id)a4 error:(id *)a5;
- (int64_t)orientation;
- (int64_t)roundingPolicy;
@end

@implementation NUImageGeometry

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (void).cxx_destruct
{
}

- (int64_t)roundingPolicy
{
  return self->_roundingPolicy;
}

- (NUTaggedSpaceMapping)spaceMap
{
  return self->_spaceMap;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  int64_t denominator = self->_renderScale.denominator;
  int64_t numerator = self->_renderScale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = self[2].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = self[1].var1;
  retstr->var1 = var0;
  return self;
}

- (id)description
{
  [(NUImageGeometry *)self scaledExtent];
  v7 = [NSString stringWithFormat:@"%f, %f  %f, %f", v3, v4, v5, v6];
  v8 = [NSString stringWithFormat:@"%ld, %ld  %ld, %ld", self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height];
  int64_t v9 = [(NUImageGeometry *)self orientation];
  if ((unint64_t)(v9 - 9) >= 0xFFFFFFFFFFFFFFF8) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }
  v11 = *(&NUOrientationName_names + v10);
  int64_t v12 = [(NUImageGeometry *)self roundingPolicy];
  if ((unint64_t)(v12 - 1) > 3) {
    v13 = @"Out";
  }
  else {
    v13 = *(&off_1E5D94038 + v12 - 1);
  }
  v14 = v13;
  v15 = NSString;
  uint64_t v16 = [(NUImageGeometry *)self scaledSize];
  v18 = [NSString stringWithFormat:@"{%ld, %ld}", v16, v17];
  v19 = [v15 stringWithFormat:@"scaledImageSize : %@   scaledExtent : %@   extent, : %@   scale : %f   orientation : %@   rounding: %@", v18, v7, v8, NUScaleToDouble(self->_renderScale.numerator, self->_renderScale.denominator), v11, v14];

  return v19;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_extent.size.height;
  int64_t width = self->_extent.size.width;
  result.var1 = height;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaledSize
{
  long long v4 = 0u;
  [(NUImageGeometry *)self physicalScaledExtent];
  int64_t v3 = *((void *)&v4 + 1);
  int64_t v2 = v4;
  result.var1 = v3;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var0 = v2;
  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)physicalScaledExtent
{
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = 0u;
  retstr->var1 = 0u;
  [(NUImageGeometry *)self scaledExtent];
  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.int64_t width = v7;
  v12.size.int64_t height = v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = ($8D19A3D7F6B32A57CF9B882F3E1C418F *)NU::RectT<long>::RectT(v11, &v12, [(NUImageGeometry *)self roundingPolicy]);
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = ($0AC6E346AE4835514AAA8AC86D8F4844)v11[1];
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v11[0];
  retstr->var1 = v10;
  return result;
}

- (CGRect)scaledExtent
{
  uint64_t v3 = [(NUImageGeometry *)self renderScale];
  double v5 = NUScaleToDouble(v3, v4);
  [(NUImageGeometry *)self extent];
  v10.origin.x = v5 * (double)v6;
  v10.origin.y = v5 * (double)v7;
  v10.size.int64_t width = v5 * (double)v8;
  v10.size.int64_t height = v5 * (double)v9;
  return CGRectStandardize(v10);
}

- (id)transformWithSourceSpace:(id)a3 destinationSpace:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v14 = NUAssertLogger_19531();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_19531();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageGeometry transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUImageGeometry.m", 64, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  CGRect v10 = v9;
  spaceMap = self->_spaceMap;
  if (spaceMap)
  {
    CGRect v12 = [(NUTaggedSpaceMapping *)spaceMap transformWithSourceSpace:v8 destinationSpace:v10 error:a5];
  }
  else
  {
    +[NUError errorWithCode:3 reason:@"no space map present" object:0];
    CGRect v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5 spaceMap:(id)a6 roundingPolicy:(int64_t)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  if (var0 < 1 || var1 <= 0)
  {
    v20 = NUAssertLogger_19531();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(renderScale)");
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v23 = NUAssertLogger_19531();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        __int16 v39 = 2114;
        v40 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUImageGeometry.m", 49, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"NUScaleIsValid(renderScale)");
  }
  v15 = v14;
  v36.receiver = self;
  v36.super_class = (Class)NUImageGeometry;
  uint64_t v16 = [(NUImageGeometry *)&v36 init];
  uint64_t v17 = v16;
  if (v16)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = a3->var1;
    v16->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
    v16->_extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v18;
    v16->_renderScale.int64_t numerator = var0;
    v16->_renderScale.int64_t denominator = var1;
    objc_storeStrong((id *)&v16->_spaceMap, a6);
    v17->_orientation = a5;
    v17->_roundingPolicy = a7;
  }

  return v17;
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5 spaceMap:(id)a6
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v8[0] = a3->var0;
  v8[1] = var1;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](self, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v8, a4.var0, a4.var1, a5, a6, 0);
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](self, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v7, a4.var0, a4.var1, a5, 0, 0);
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](self, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v6, a4.var0, a4.var1, 1, 0, 0);
}

- (NUImageGeometry)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19548);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    double v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    id v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19548);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19548);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    CGRect v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    id v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    id v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  $0AC6E346AE4835514AAA8AC86D8F4844 v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  id v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageGeometry init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUImageGeometry.m", 29, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end