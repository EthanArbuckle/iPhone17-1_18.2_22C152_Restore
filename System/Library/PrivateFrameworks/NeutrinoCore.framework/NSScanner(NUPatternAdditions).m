@interface NSScanner(NUPatternAdditions)
- (id)substringFromScanLocation;
- (uint64_t)scanChoicePattern:()NUPatternAdditions error:;
- (uint64_t)scanGroupPattern:()NUPatternAdditions error:;
- (uint64_t)scanListPattern:()NUPatternAdditions error:;
- (uint64_t)scanPattern:()NUPatternAdditions error:;
- (uint64_t)scanPatterns:()NUPatternAdditions from:to:delimiter:error:;
- (uint64_t)scanRepeatPattern:()NUPatternAdditions error:;
- (uint64_t)scanTokenPattern:()NUPatternAdditions error:;
@end

@implementation NSScanner(NUPatternAdditions)

- (id)substringFromScanLocation
{
  uint64_t v2 = [a1 scanLocation];
  v3 = [a1 string];
  v4 = [v3 substringFromIndex:v2];

  return v4;
}

- (uint64_t)scanRepeatPattern:()NUPatternAdditions error:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a3 || !*a3)
  {
    v20 = NUAssertLogger_4520();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != NULL && *pattern != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_4520();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v27;
        __int16 v54 = 2114;
        v55 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanRepeatPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1102, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"pattern != NULL && *pattern != nil");
  }
  if (!a4)
  {
    v36 = NUAssertLogger_4520();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v39 = NUAssertLogger_4520();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v43;
        __int16 v54 = 2114;
        v55 = v47;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanRepeatPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1103, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  id v7 = *a3;
  uint64_t v8 = [a1 scanLocation];
  if (![a1 scanString:@"?" intoString:0])
  {
    if ([a1 scanString:@"*" intoString:0])
    {
      v12 = [[NURepeatPattern alloc] initWithPattern:v7 minCount:0];
LABEL_8:
      id v13 = *a3;
      *a3 = v12;

LABEL_9:
      uint64_t v9 = 1;
      goto LABEL_21;
    }
    if ([a1 scanString:@"+" intoString:0])
    {
      uint64_t v9 = 1;
      v14 = [[NURepeatPattern alloc] initWithPattern:v7 minCount:1];
      id v15 = *a3;
      *a3 = v14;

      goto LABEL_21;
    }
    if (![a1 scanString:@"<" intoString:0]) {
      goto LABEL_9;
    }
    *(void *)buf = 0;
    if ([a1 scanInteger:buf])
    {
      if ([a1 scanString:@"," intoString:0])
      {
        uint64_t v52 = 0;
        if ([a1 scanInteger:&v52]
          && [a1 scanString:@">" intoString:0])
        {
          v16 = [NURepeatPattern alloc];
          v12 = [(NURepeatPattern *)v16 initWithPattern:v7 minCount:*(void *)buf maxCount:v52];
          goto LABEL_8;
        }
      }
      else if ([a1 scanString:@">" intoString:0])
      {
        v17 = [NURepeatPattern alloc];
        v12 = [(NURepeatPattern *)v17 initWithPattern:v7 count:*(void *)buf];
        goto LABEL_8;
      }
    }
    [a1 setScanLocation:v8];
    v18 = [a1 substringFromScanLocation];
    *a4 = +[NUError invalidError:@"Malformed repeat pattern" object:v18];

    uint64_t v9 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = 1;
  v10 = [[NURepeatPattern alloc] initWithPattern:v7 minCount:0 maxCount:1];
  id v11 = *a3;
  *a3 = v10;

LABEL_21:
  return v9;
}

- (uint64_t)scanPatterns:()NUPatternAdditions from:to:delimiter:error:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!a3 || *a3)
  {
    v30 = NUAssertLogger_4520();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "patterns != NULL && *patterns == nil");
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v33 = NUAssertLogger_4520();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        BOOL v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v37;
        __int16 v70 = 2114;
        v71 = v41;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      uint64_t v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPatterns:from:to:delimiter:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1038, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"patterns != NULL && *patterns == nil");
  }
  if (!a7)
  {
    v46 = NUAssertLogger_4520();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v69 = v47;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v49 = NUAssertLogger_4520();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        uint64_t v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v53;
        __int16 v70 = 2114;
        v71 = v57;
        _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      uint64_t v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v52;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPatterns:from:to:delimiter:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1039, @"Invalid parameter not satisfying: %s", v58, v59, v60, v61, (uint64_t)"error != NULL");
  }
  id v15 = v14;
  uint64_t v16 = [a1 scanLocation];
  if ([a1 scanString:v12 intoString:0])
  {
    uint64_t v63 = v16;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v66 = 0;
    id v67 = 0;
    char v18 = [a1 scanPattern:&v67 error:&v66];
    id v19 = v67;
    id v20 = v66;
    if (v18)
    {
      id v62 = v13;
      if (v19)
      {
        [v17 addObject:v19];
        if ([a1 scanString:v15 intoString:0])
        {
          while (1)
          {
            v21 = v20;
            v22 = v19;
            id v64 = 0;
            id v65 = 0;
            char v23 = [a1 scanPattern:&v65 error:&v64];
            id v19 = v65;

            id v20 = v64;
            if ((v23 & 1) == 0)
            {
              v28 = [a1 substringFromScanLocation];
              *a7 = +[NUError errorWithCode:2 reason:@"Invalid nested pattern" object:v28 underlyingError:v20];

              [a1 setScanLocation:v63];
              goto LABEL_21;
            }
            if (!v19) {
              break;
            }
            [v17 addObject:v19];
            if (([a1 scanString:v15 intoString:0] & 1) == 0) {
              goto LABEL_11;
            }
          }
          id v29 = [a1 substringFromScanLocation];
          *a7 = +[NUError invalidError:@"Missing nested pattern after delimiter" object:v29];

          [a1 setScanLocation:v63];
LABEL_21:
          uint64_t v24 = 0;
          id v13 = v62;
          goto LABEL_17;
        }
      }
LABEL_11:
      id v13 = v62;
      if ([a1 scanString:v62 intoString:0])
      {
        *a3 = v17;

        uint64_t v24 = 1;
LABEL_17:

        goto LABEL_18;
      }
      v25 = [a1 substringFromScanLocation];
      v26 = +[NUError invalidError:@"Missing end delimiter" object:v25];
    }
    else
    {
      v25 = [a1 substringFromScanLocation];
      v26 = +[NUError errorWithCode:2 reason:@"Invalid nested pattern" object:v25 underlyingError:v20];
    }
    *a7 = v26;

    [a1 setScanLocation:v63];
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  uint64_t v24 = 1;
LABEL_18:

  return v24;
}

- (uint64_t)scanChoicePattern:()NUPatternAdditions error:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a3 || *a3)
  {
    id v12 = NUAssertLogger_4520();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != NULL && *pattern == nil");
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_4520();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        char v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        __int16 v48 = 2114;
        uint64_t v49 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanChoicePattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1016, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    v28 = NUAssertLogger_4520();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_4520();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        id v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        __int16 v48 = 2114;
        uint64_t v49 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanChoicePattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1017, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v44 = 0;
  id v45 = 0;
  uint64_t v7 = [a1 scanPatterns:&v45 from:@"{" to:@"}" delimiter:@"," error:&v44];
  id v8 = v45;
  id v9 = v44;
  if (v7)
  {
    if (v8) {
      *a3 = [[NUChoicePattern alloc] initWithChoices:v8];
    }
  }
  else
  {
    v10 = [a1 substringFromScanLocation];
    *a4 = +[NUError errorWithCode:2 reason:@"Invalid choice pattern" object:v10 underlyingError:v9];
  }
  return v7;
}

- (uint64_t)scanGroupPattern:()NUPatternAdditions error:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a3 || *a3)
  {
    id v12 = NUAssertLogger_4520();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != NULL && *pattern == nil");
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_4520();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        char v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        __int16 v48 = 2114;
        uint64_t v49 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanGroupPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 994, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    v28 = NUAssertLogger_4520();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_4520();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        id v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        __int16 v48 = 2114;
        uint64_t v49 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanGroupPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 995, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v44 = 0;
  id v45 = 0;
  uint64_t v7 = [a1 scanPatterns:&v45 from:@"(" to:@")" delimiter:@"," error:&v44];
  id v8 = v45;
  id v9 = v44;
  if (v7)
  {
    if (v8) {
      *a3 = [[NUGroupPattern alloc] initWithGroup:v8];
    }
  }
  else
  {
    v10 = [a1 substringFromScanLocation];
    *a4 = +[NUError errorWithCode:2 reason:@"Invalid group pattern" object:v10 underlyingError:v9];
  }
  return v7;
}

- (uint64_t)scanListPattern:()NUPatternAdditions error:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a3 || *a3)
  {
    id v12 = NUAssertLogger_4520();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != NULL && *pattern == nil");
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_4520();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        char v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        __int16 v48 = 2114;
        uint64_t v49 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanListPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 973, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    v28 = NUAssertLogger_4520();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_4520();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        id v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        __int16 v48 = 2114;
        uint64_t v49 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanListPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 974, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v44 = 0;
  id v45 = 0;
  uint64_t v7 = [a1 scanPatterns:&v45 from:@"[" to:@"]" delimiter:@"," error:&v44];
  id v8 = v45;
  id v9 = v44;
  if (v7)
  {
    if (v8) {
      *a3 = [[NUListPattern alloc] initWithList:v8];
    }
  }
  else
  {
    v10 = [a1 substringFromScanLocation];
    *a4 = +[NUError errorWithCode:2 reason:@"Invalid list pattern" object:v10 underlyingError:v9];
  }
  return v7;
}

- (uint64_t)scanTokenPattern:()NUPatternAdditions error:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a3 || *a3)
  {
    v10 = NUAssertLogger_4520();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != NULL && *pattern == nil");
      *(_DWORD *)buf = 138543362;
      id v44 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v13 = NUAssertLogger_4520();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        id v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        char v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        id v20 = [v18 callStackSymbols];
        id v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v44 = v17;
        __int16 v45 = 2114;
        v46 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v44 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanTokenPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 959, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    uint64_t v26 = NUAssertLogger_4520();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v44 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v29 = NUAssertLogger_4520();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        id v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v44 = v33;
        __int16 v45 = 2114;
        v46 = v37;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v44 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanTokenPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 960, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v6 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  id v42 = 0;
  int v7 = [a1 scanCharactersFromSet:v6 intoString:&v42];
  id v8 = v42;

  if (v7) {
    *a3 = [[NUTokenPattern alloc] initWithToken:v8];
  }

  return 1;
}

- (uint64_t)scanPattern:()NUPatternAdditions error:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a3 || *a3)
  {
    id v15 = NUAssertLogger_4520();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != NULL && *pattern == nil");
      *(_DWORD *)uint64_t v51 = 138543362;
      *(void *)&v51[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v51, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v18 = NUAssertLogger_4520();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v51 = 138543618;
        *(void *)&v51[4] = v22;
        __int16 v52 = 2114;
        v53 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v51, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v51 = 138543362;
      *(void *)&v51[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v51, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 921, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    v31 = NUAssertLogger_4520();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      BOOL v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)uint64_t v51 = 138543362;
      *(void *)&v51[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v51, 0xCu);
    }
    uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v34 = NUAssertLogger_4520();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        id v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v51 = 138543618;
        *(void *)&v51[4] = v38;
        __int16 v52 = 2114;
        v53 = v42;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v51, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v51 = 138543362;
      *(void *)&v51[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v51, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 922, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v50 = 0;
  int v7 = [a1 scanListPattern:&v50 error:a4];
  id v8 = v50;
  *(void *)uint64_t v51 = v8;
  if (!v7) {
    goto LABEL_15;
  }
  if (!v8)
  {
    id v49 = 0;
    int v11 = [a1 scanGroupPattern:&v49 error:a4];
    id v8 = v49;
    *(void *)uint64_t v51 = v8;
    if (!v11) {
      goto LABEL_15;
    }
    if (!v8)
    {
      id v48 = 0;
      int v12 = [a1 scanChoicePattern:&v48 error:a4];
      id v8 = v48;
      *(void *)uint64_t v51 = v8;
      if (!v12) {
        goto LABEL_15;
      }
      if (!v8)
      {
        id v47 = 0;
        int v13 = [a1 scanTokenPattern:&v47 error:a4];
        id v8 = v47;
        *(void *)uint64_t v51 = v8;
        if (!v13) {
          goto LABEL_15;
        }
        if (!v8) {
          goto LABEL_7;
        }
      }
    }
  }
  int v9 = [a1 scanRepeatPattern:v51 error:a4];
  id v8 = *(id *)v51;
  if (!v9)
  {
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
LABEL_7:
  *a3 = v8;
  uint64_t v10 = 1;
  id v8 = *(id *)v51;
LABEL_16:

  return v10;
}

@end