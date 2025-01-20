@interface NUImageHistogram
+ (Class)_histogramClass;
- ($F24F406B2B787EFB06265DBA3D28CBD5)range;
- (NUHistogram)blue;
- (NUHistogram)green;
- (NUHistogram)luminance;
- (NUHistogram)red;
- (NUImageHistogram)init;
- (NUImageHistogram)initWithBinCount:(int64_t)a3 range:(id)a4;
- (id)description;
- (id)immutableCopyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)binCount;
- (int64_t)sampleCount;
@end

@implementation NUImageHistogram

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminance, 0);
  objc_storeStrong((id *)&self->_blue, 0);
  objc_storeStrong((id *)&self->_green, 0);

  objc_storeStrong((id *)&self->_red, 0);
}

- (NUHistogram)luminance
{
  return self->_luminance;
}

- (NUHistogram)blue
{
  return self->_blue;
}

- (NUHistogram)green
{
  return self->_green;
}

- (NUHistogram)red
{
  return self->_red;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  double min = self->_range.min;
  double max = self->_range.max;
  result.var1 = max;
  result.var0 = min;
  return result;
}

- (int64_t)binCount
{
  return self->_binCount;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(NUImageHistogram *)self binCount];
  [(NUImageHistogram *)self range];
  uint64_t v7 = v6;
  [(NUImageHistogram *)self range];
  uint64_t v9 = v8;
  v10 = [(NUImageHistogram *)self red];
  v11 = [(NUImageHistogram *)self green];
  v12 = [(NUImageHistogram *)self blue];
  v13 = [(NUImageHistogram *)self luminance];
  v14 = [v3 stringWithFormat:@"<%@:%p> count=%ld, range: [%0.3f..%0.3f], red=%@, green=%@, blue=%@, luminance=%@", v4, self, v5, v7, v9, v10, v11, v12, v13];

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v5 = +[NUMutableImageHistogram allocWithZone:](NUMutableImageHistogram, "allocWithZone:");
  uint64_t v6 = [(NUHistogram *)self->_red mutableCopyWithZone:a3];
  red = v5->super._red;
  v5->super._red = v6;

  uint64_t v8 = [(NUHistogram *)self->_green mutableCopyWithZone:a3];
  green = v5->super._green;
  v5->super._green = v8;

  v10 = [(NUHistogram *)self->_blue mutableCopyWithZone:a3];
  blue = v5->super._blue;
  v5->super._blue = v10;

  v12 = [(NUHistogram *)self->_luminance mutableCopyWithZone:a3];
  luminance = v5->super._luminance;
  v5->super._luminance = v12;

  v5->super._binCount = self->_binCount;
  v5->super._range = self->_range;
  return v5;
}

+ (Class)_histogramClass
{
  return (Class)objc_opt_class();
}

- (id)immutableCopyWithZone:(_NSZone *)a3
{
  int64_t v5 = +[NUImageHistogram allocWithZone:](NUImageHistogram, "allocWithZone:");
  uint64_t v6 = [(NUHistogram *)self->_red copyWithZone:a3];
  red = v5->_red;
  v5->_red = v6;

  uint64_t v8 = [(NUHistogram *)self->_green copyWithZone:a3];
  green = v5->_green;
  v5->_green = v8;

  v10 = [(NUHistogram *)self->_blue copyWithZone:a3];
  blue = v5->_blue;
  v5->_blue = v10;

  v12 = [(NUHistogram *)self->_luminance copyWithZone:a3];
  luminance = v5->_luminance;
  v5->_luminance = v12;

  v5->_binCount = self->_binCount;
  v5->_range = self->_range;

  return v5;
}

- (NUImageHistogram)initWithBinCount:(int64_t)a3 range:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    v18 = NUAssertLogger_18966();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "count > 0");
      *(_DWORD *)buf = 138543362;
      v68 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_18966();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v39;
        __int16 v69 = 2114;
        v70 = v43;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUImageHistogram.m", 54, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"count > 0");
  }
  double var0 = a4.var0;
  if (a4.var0 > 0.0)
  {
    v25 = NUAssertLogger_18966();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "range.min <= 0.0");
      *(_DWORD *)buf = 138543362;
      v68 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_18966();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v48;
        __int16 v69 = 2114;
        v70 = v52;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUImageHistogram.m", 55, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"range.min <= 0.0");
  }
  double var1 = a4.var1;
  if (a4.var1 < 1.0)
  {
    v32 = NUAssertLogger_18966();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "range.max >= 1.0");
      *(_DWORD *)buf = 138543362;
      v68 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_18966();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        __int16 v69 = 2114;
        v70 = v61;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUImageHistogram.m", 56, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"range.max >= 1.0");
  }
  v66.receiver = self;
  v66.super_class = (Class)NUImageHistogram;
  uint64_t v7 = [(NUImageHistogram *)&v66 init];
  v7->_binCount = a3;
  v7->_range.double min = var0;
  v7->_range.double max = var1;
  uint64_t v8 = (objc_class *)[(id)objc_opt_class() _histogramClass];
  uint64_t v9 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  red = v7->_red;
  v7->_red = (NUHistogram *)v9;

  uint64_t v11 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  green = v7->_green;
  v7->_green = (NUHistogram *)v11;

  uint64_t v13 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  blue = v7->_blue;
  v7->_blue = (NUHistogram *)v13;

  uint64_t v15 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  luminance = v7->_luminance;
  v7->_luminance = (NUHistogram *)v15;

  return v7;
}

- (NUImageHistogram)init
{
  return -[NUImageHistogram initWithBinCount:range:](self, "initWithBinCount:range:", 256, 0.0, 1.0);
}

@end