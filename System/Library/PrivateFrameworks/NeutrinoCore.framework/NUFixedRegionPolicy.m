@interface NUFixedRegionPolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- (NSString)debugDescription;
- (NSString)description;
- (NUFixedRegionPolicy)init;
- (NUFixedRegionPolicy)initWithRect:(id *)a3;
- (NUFixedRegionPolicy)initWithRegion:(id)a3;
- (NURegion)region;
- (id)regionForGeometry:(id)a3;
- (void)setScale:(id)a3;
@end

@implementation NUFixedRegionPolicy

- (void).cxx_destruct
{
}

- (NURegion)region
{
  return (NURegion *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScale:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_scale, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  objc_copyStruct(v4, &self->_scale, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)description
{
  int64_t v2 = NSString;
  int64_t v3 = [(NUFixedRegionPolicy *)self region];
  v4 = [v2 stringWithFormat:@"{region=%@}", v3];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUFixedRegionPolicy *)self region];
  v6 = [v3 stringWithFormat:@"<%@:%p> region=%@", v4, self, v5];

  return (NSString *)v6;
}

- (id)regionForGeometry:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_scale.numerator < 1 || self->_scale.denominator <= 0)
  {
    v16 = NUAssertLogger_13838();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = NSString;
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", self->_scale.numerator, self->_scale.denominator);
      v19 = [v17 stringWithFormat:@"Invalid scale: %@", v18];
      *(_DWORD *)buf = 138543362;
      v36 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_13838();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v25;
        __int16 v37 = 2114;
        v38 = v29;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v30 = NUScaleToString(self->_scale.numerator, self->_scale.denominator);
    _NUAssertFailHandler((uint64_t)"-[NUFixedRegionPolicy regionForGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURegionPolicy.m", 51, @"Invalid scale: %@", v31, v32, v33, v34, v30);
  }
  v6 = v4;
  uint64_t v7 = [v4 renderScale];
  uint64_t v9 = v8;
  if (NUScaleEqual(v7, v8, self->_scale.numerator, self->_scale.denominator))
  {
    v10 = self->_region;
  }
  else
  {
    uint64_t v11 = NUScaleDivide(v7, v9, self->_scale.numerator, self->_scale.denominator);
    double v13 = NUScaleToDouble(v11, v12);
    -[NURegion regionByScalingBy:withRounding:](self->_region, "regionByScalingBy:withRounding:", [v6 roundingPolicy], v13, v13);
    v10 = (NURegion *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v10;

  return v14;
}

- (NUFixedRegionPolicy)initWithRegion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = NUAssertLogger_13838();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "region != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v13 = NUAssertLogger_13838();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        __int16 v29 = 2114;
        uint64_t v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFixedRegionPolicy initWithRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURegionPolicy.m", 39, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"region != nil");
  }
  v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)NUFixedRegionPolicy;
  v6 = [(NUFixedRegionPolicy *)&v26 init];
  uint64_t v7 = [v5 copy];
  region = v6->_region;
  v6->_region = (NURegion *)v7;

  v6->_scale = ($F9703ADC4DD3124DE91DE417D7636CC9)NUScaleOne;
  return v6;
}

- (NUFixedRegionPolicy)initWithRect:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v8[0] = a3->var0;
  v8[1] = var1;
  v5 = +[NURegion regionWithRect:v8];
  v6 = [(NUFixedRegionPolicy *)self initWithRegion:v5];

  return v6;
}

- (NUFixedRegionPolicy)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13850);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13850);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13850);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    double v13 = v11;
    BOOL v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  double v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  __int16 v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFixedRegionPolicy init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURegionPolicy.m", 29, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end