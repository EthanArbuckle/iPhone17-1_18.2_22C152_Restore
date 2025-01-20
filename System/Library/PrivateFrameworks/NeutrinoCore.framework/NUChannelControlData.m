@interface NUChannelControlData
+ (id)controlDataWithAdjustment:(id)a3;
+ (id)controlDataWithComposition:(id)a3;
+ (id)controlDataWithSetting:(id)a3 value:(id)a4;
+ (id)controlDataWithSource:(id)a3;
- (NUChannelControlData)initWithData:(id)a3 format:(id)a4;
- (NUChannelControlData)initWithData:(id)a3 schema:(id)a4;
- (NUChannelControlData)initWithFormat:(id)a3;
- (NUChannelControlData)initWithSetting:(id)a3 value:(id)a4;
- (id)data;
- (id)debugDescription;
- (id)description;
@end

@implementation NUChannelControlData

- (void).cxx_destruct
{
}

- (id)data
{
  return self->_data;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUChannelControlData *)self data];
  v6 = [(NUChannelData *)self format];
  v7 = [v6 debugDescription];
  v8 = [v3 stringWithFormat:@"<%@:%p data:'%@' format:%@>", v4, self, v5, v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(NUChannelData *)self format];
  v5 = [(NUChannelControlData *)self data];
  v6 = [v3 stringWithFormat:@"%@=%@", v4, v5];

  return v6;
}

- (NUChannelControlData)initWithSetting:(id)a3 value:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_3857();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "setting != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_3857();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannelControlData initWithSetting:value:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 599, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"setting != nil");
  }
  v8 = v7;
  v9 = +[NUChannelControlFormat controlFormatWithSetting:v6];
  v10 = [(NUChannelControlData *)self initWithData:v8 format:v9];

  return v10;
}

- (NUChannelControlData)initWithData:(id)a3 schema:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v12 = NUAssertLogger_3857();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "schema != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_3857();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannelControlData initWithData:schema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 578, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"schema != nil");
  }
  v8 = v7;
  v9 = +[NUChannelControlFormat controlFormatWithSchema:v7];
  v10 = [(NUChannelControlData *)self initWithData:v6 format:v9];

  return v10;
}

- (NUChannelControlData)initWithData:(id)a3 format:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = NUAssertLogger_3857();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_3857();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v20;
        __int16 v32 = 2114;
        v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannelControlData initWithData:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 571, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"data != nil");
  }
  v8 = v7;
  v29.receiver = self;
  v29.super_class = (Class)NUChannelControlData;
  v9 = [(NUChannelData *)&v29 initWithFormat:v7];
  uint64_t v10 = [v6 copy];
  id data = v9->_data;
  v9->_id data = (id)v10;

  return v9;
}

- (NUChannelControlData)initWithFormat:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    v15 = v13;
    BOOL v16 = [v14 callStackSymbols];
    BOOL v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  v15 = v18;
  id v22 = [v20 callStackSymbols];
  v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUChannelControlData initWithFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 567, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

+ (id)controlDataWithSetting:(id)a3 value:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v11 = NUAssertLogger_3857();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "setting != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_3857();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        __int16 v45 = 2114;
        v46 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelControlData controlDataWithSetting:value:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 605, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"setting != nil");
  }
  v8 = v7;
  if (!v7)
  {
    v18 = NUAssertLogger_3857();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "value != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v21 = NUAssertLogger_3857();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2114;
        v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelControlData controlDataWithSetting:value:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 606, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"value != nil");
  }
  v9 = (void *)[objc_alloc((Class)a1) initWithSetting:v6 value:v7];

  return v9;
}

+ (id)controlDataWithSource:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = NUAssertLogger_3857();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_3857();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        id v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelControlData controlDataWithSource:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 594, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"source != nil");
  }
  v5 = v4;
  id v6 = objc_alloc((Class)a1);
  id v7 = [v5 schema];
  v8 = (void *)[v6 initWithData:v5 schema:v7];

  return v8;
}

+ (id)controlDataWithAdjustment:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = NUAssertLogger_3857();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_3857();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        id v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelControlData controlDataWithAdjustment:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 589, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"adjustment != nil");
  }
  v5 = v4;
  id v6 = objc_alloc((Class)a1);
  id v7 = [v5 schema];
  v8 = (void *)[v6 initWithData:v5 schema:v7];

  return v8;
}

+ (id)controlDataWithComposition:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = NUAssertLogger_3857();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_3857();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        id v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelControlData controlDataWithComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 584, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"composition != nil");
  }
  v5 = v4;
  id v6 = objc_alloc((Class)a1);
  id v7 = [v5 schema];
  v8 = (void *)[v6 initWithData:v5 schema:v7];

  return v8;
}

@end