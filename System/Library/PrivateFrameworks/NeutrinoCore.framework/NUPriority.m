@interface NUPriority
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPriority:(id)a3;
- (BOOL)isHigh;
- (BOOL)isLow;
- (NUPriority)init;
- (NUPriority)initWithLevel:(int64_t)a3;
- (NUPriority)initWithLevel:(int64_t)a3 order:(double)a4;
- (double)order;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)level;
- (unint64_t)hash;
@end

@implementation NUPriority

- (double)order
{
  return self->_order;
}

- (int64_t)level
{
  return self->_level;
}

- (BOOL)isLow
{
  return [(NUPriority *)self level] > 1;
}

- (BOOL)isHigh
{
  return [(NUPriority *)self level] < 2;
}

- (BOOL)isEqualToPriority:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v8 = NUAssertLogger_3686();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_3686();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPriority isEqualToPriority:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUPriority.m", 91, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"other != nil");
  }
  v5 = v4;
  BOOL v6 = [(NUPriority *)self compare:v4] == 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUPriority *)self isEqualToPriority:v4];

  return v5;
}

- (unint64_t)hash
{
  return 0x1B5FAAED197D91 * [(NUPriority *)self level];
}

- (int64_t)compare:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v16 = NUAssertLogger_3686();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_3686();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        __int16 v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        __int16 v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPriority compare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUPriority.m", 39, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"other != nil");
  }
  BOOL v5 = v4;
  uint64_t v6 = [(NUPriority *)self level];
  if (v6 < [v5 level]) {
    goto LABEL_3;
  }
  uint64_t v8 = [(NUPriority *)self level];
  if (v8 > [v5 level])
  {
    int64_t v7 = -1;
    goto LABEL_10;
  }
  [(NUPriority *)self order];
  double v10 = v9;
  [v5 order];
  if (v10 < v11)
  {
LABEL_3:
    int64_t v7 = 1;
  }
  else
  {
    [(NUPriority *)self order];
    double v13 = v12;
    [v5 order];
    if (v13 <= v14) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
LABEL_10:

  return v7;
}

- (id)description
{
  unint64_t level = self->_level;
  if (level > 3) {
    v3 = 0;
  }
  else {
    v3 = off_1E5D94210[level];
  }
  return (id)[NSString stringWithFormat:@"<%@:%p - level:%@ order:%.4f>", objc_opt_class(), self, v3, *(void *)&self->_order];
}

- (NUPriority)initWithLevel:(int64_t)a3 order:(double)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a4 < 0.0)
  {
    double v12 = NUAssertLogger_3686();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "order >= 0.f");
      *(_DWORD *)buf = 138543362;
      v38 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_3686();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        __int16 v39 = 2114;
        v40 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPriority initWithLevel:order:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUPriority.m", 22, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"order >= 0.f");
  }
  double v4 = fabs(a4);
  if (v4 >= INFINITY && v4 <= INFINITY)
  {
    BOOL v5 = NUAssertLogger_3686();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "isfinite(order)");
      *(_DWORD *)buf = 138543362;
      v38 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int64_t v7 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger_3686();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        __int16 v39 = 2114;
        v40 = v32;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      double v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPriority initWithLevel:order:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUPriority.m", 24, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"isfinite(order)");
  }
  self->_unint64_t level = a3;
  self->_order = a4;
  return self;
}

- (NUPriority)initWithLevel:(int64_t)a3
{
  return [(NUPriority *)self initWithLevel:a3 order:0.0];
}

- (NUPriority)init
{
  return [(NUPriority *)self initWithLevel:2];
}

@end