@interface NURepeatPattern
- (BOOL)isEqualToPattern:(id)a3;
- (BOOL)isEqualToRepeatPattern:(id)a3;
- (BOOL)isFixedOrder;
- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5;
- (NUPattern)pattern;
- (NURepeatPattern)init;
- (NURepeatPattern)initWithPattern:(id)a3 count:(int64_t)a4;
- (NURepeatPattern)initWithPattern:(id)a3 minCount:(int64_t)a4;
- (NURepeatPattern)initWithPattern:(id)a3 minCount:(int64_t)a4 maxCount:(int64_t)a5;
- (id)optimizedPattern;
- (id)shortestMatch;
- (id)stringRepresentation;
- (id)tokens;
- (int64_t)maxCount;
- (int64_t)minCount;
@end

@implementation NURepeatPattern

- (void).cxx_destruct
{
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (int64_t)minCount
{
  return self->_minCount;
}

- (NUPattern)pattern
{
  return (NUPattern *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v15 = 0;
  int64_t minCount = self->_minCount;
  if (minCount < 1)
  {
    int64_t i = 0;
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = 0;
    for (int64_t i = 0; i < minCount; ++i)
    {
      BOOL v12 = [(NUPattern *)self->_pattern match:v8 location:a4 count:&v15];
      int64_t minCount = self->_minCount;
      if (!v12) {
        break;
      }
      v10 += v15;
    }
  }
  if (i == minCount)
  {
    if (minCount < self->_maxCount)
    {
      int64_t v13 = minCount;
      do
      {
        if (![(NUPattern *)self->_pattern match:v8 location:a4 count:&v15]) {
          break;
        }
        ++v13;
        v10 += v15;
      }
      while (v13 < self->_maxCount);
    }
    *a5 = v10;
  }

  return i == minCount;
}

- (BOOL)isEqualToRepeatPattern:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NURepeatPattern *)self minCount];
  if (v5 == [v4 minCount]
    && (int64_t v6 = -[NURepeatPattern maxCount](self, "maxCount"), v6 == [v4 maxCount]))
  {
    v7 = [(NURepeatPattern *)self pattern];
    id v8 = [v4 pattern];
    char v9 = [v7 isEqualToPattern:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NURepeatPattern *)self isEqualToRepeatPattern:v4];

  return v5;
}

- (id)stringRepresentation
{
  int64_t minCount = self->_minCount;
  if (minCount)
  {
    if (minCount == 1)
    {
      int64_t maxCount = self->_maxCount;
      if (maxCount == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v5 = NSString;
        int64_t v6 = [(NUPattern *)self->_pattern stringRepresentation];
        [v5 stringWithFormat:@"%@+", v6, v12, v13];
        goto LABEL_13;
      }
    }
    else
    {
      int64_t maxCount = self->_maxCount;
    }
  }
  else
  {
    int64_t maxCount = self->_maxCount;
    if (maxCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      char v9 = NSString;
      int64_t v6 = [(NUPattern *)self->_pattern stringRepresentation];
      [v9 stringWithFormat:@"%@*", v6, v12, v13];
      goto LABEL_13;
    }
    if (maxCount == 1)
    {
      v7 = NSString;
      int64_t v6 = [(NUPattern *)self->_pattern stringRepresentation];
      [v7 stringWithFormat:@"%@?", v6, v12, v13];
      goto LABEL_13;
    }
  }
  id v8 = NSString;
  if (minCount == maxCount)
  {
    int64_t v6 = [(NUPattern *)self->_pattern stringRepresentation];
    [v8 stringWithFormat:@"%@<%d>", v6, self->_minCount, v13];
  }
  else
  {
    int64_t v6 = [(NUPattern *)self->_pattern stringRepresentation];
    [v8 stringWithFormat:@"%@<%d,%d>", v6, self->_minCount, self->_maxCount];
  }
  unint64_t v10 = LABEL_13:;

  return v10;
}

- (id)optimizedPattern
{
  v3 = [(NUPattern *)self->_pattern optimizedPattern];
  if ([v3 isEmpty] || self->_minCount == 1 && self->_maxCount == 1) {
    id v4 = v3;
  }
  else {
    id v4 = [[NURepeatPattern alloc] initWithPattern:v3 minCount:self->_minCount maxCount:self->_maxCount];
  }
  BOOL v5 = v4;

  return v5;
}

- (id)shortestMatch
{
  if (self->_minCount)
  {
    v3 = [(NUPattern *)self->_pattern shortestMatch];
    if (v3)
    {
      id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", LODWORD(self->_minCount) * objc_msgSend(v3, "count"));
      if (self->_minCount >= 1)
      {
        int64_t v5 = 0;
        do
        {
          [v4 addObjectsFromArray:v3];
          ++v5;
        }
        while (v5 < self->_minCount);
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)isFixedOrder
{
  return !self->_minCount || [(NUPattern *)self->_pattern isFixedOrder];
}

- (id)tokens
{
  return [(NUPattern *)self->_pattern tokens];
}

- (NURepeatPattern)initWithPattern:(id)a3 minCount:(int64_t)a4 maxCount:(int64_t)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v14 = NUAssertLogger_4520();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != nil");
      *(_DWORD *)buf = 138543362;
      v80 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_4520();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v42;
        __int16 v81 = 2114;
        v82 = v46;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 766, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"pattern != nil");
  }
  if (a4 < 0)
  {
    v21 = NUAssertLogger_4520();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "min >= 0");
      *(_DWORD *)buf = 138543362;
      v80 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_4520();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v51;
        __int16 v81 = 2114;
        v82 = v55;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 767, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"min >= 0");
  }
  if (a5 < 0)
  {
    v28 = NUAssertLogger_4520();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "max >= 0");
      *(_DWORD *)buf = 138543362;
      v80 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_4520();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        v63 = [v61 callStackSymbols];
        v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v60;
        __int16 v81 = 2114;
        v82 = v64;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 768, @"Invalid parameter not satisfying: %s", v65, v66, v67, v68, (uint64_t)"max >= 0");
  }
  if (a4 > (unint64_t)a5)
  {
    v35 = NUAssertLogger_4520();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "min <= max");
      *(_DWORD *)buf = 138543362;
      v80 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v38 = NUAssertLogger_4520();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v69 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v70 = (void *)MEMORY[0x1E4F29060];
        id v71 = v69;
        v72 = [v70 callStackSymbols];
        v73 = [v72 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v69;
        __int16 v81 = 2114;
        v82 = v73;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 769, @"Invalid parameter not satisfying: %s", v74, v75, v76, v77, (uint64_t)"min <= max");
  }
  unint64_t v10 = v9;
  v78.receiver = self;
  v78.super_class = (Class)NURepeatPattern;
  v11 = [(NURepeatPattern *)&v78 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pattern, a3);
    v12->_int64_t minCount = a4;
    v12->_int64_t maxCount = a5;
  }

  return v12;
}

- (NURepeatPattern)initWithPattern:(id)a3 minCount:(int64_t)a4
{
  return [(NURepeatPattern *)self initWithPattern:a3 minCount:a4 maxCount:0x7FFFFFFFFFFFFFFFLL];
}

- (NURepeatPattern)initWithPattern:(id)a3 count:(int64_t)a4
{
  return [(NURepeatPattern *)self initWithPattern:a3 minCount:a4 maxCount:a4];
}

- (NURepeatPattern)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4534);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    int64_t v5 = v3;
    int64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_4534);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_4534);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURepeatPattern init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 751, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end