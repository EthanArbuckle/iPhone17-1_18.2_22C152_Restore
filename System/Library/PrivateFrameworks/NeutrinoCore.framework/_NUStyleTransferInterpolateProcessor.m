@interface _NUStyleTransferInterpolateProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)interpolateStyles:(id)a3 weights:(id)a4 error:(id *)a5;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation _NUStyleTransferInterpolateProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"extent"];
  if (!v11)
  {
    v42 = NUAssertLogger_27648();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = [NSString stringWithFormat:@"Missing style extent!"];
      *(_DWORD *)buf = 138543362;
      v113 = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v45 = NUAssertLogger_27648();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v46)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E4F29060];
        id v72 = v70;
        v73 = [v71 callStackSymbols];
        v74 = [v73 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v113 = v70;
        __int16 v114 = 2114;
        v115 = v74;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v113 = v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2633, @"Missing style extent!", v75, v76, v77, v78, v106);
  }
  v12 = (void *)v11;
  v111 = v10;
  uint64_t v13 = [v9 objectForKeyedSubscript:@"weights"];
  if (!v13)
  {
    v49 = NUAssertLogger_27648();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = [NSString stringWithFormat:@"Missing weights!"];
      *(_DWORD *)buf = 138543362;
      v113 = v50;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v52 = NUAssertLogger_27648();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (v51)
    {
      if (v53)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E4F29060];
        id v81 = v79;
        v82 = [v80 callStackSymbols];
        v83 = [v82 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v113 = v79;
        __int16 v114 = 2114;
        v115 = v83;
        _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v53)
    {
      v54 = [MEMORY[0x1E4F29060] callStackSymbols];
      v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v113 = v55;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2636, @"Missing weights!", v84, v85, v86, v87, v106);
  }
  v14 = (void *)v13;
  if (![v8 count])
  {
    v56 = NUAssertLogger_27648();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = [NSString stringWithFormat:@"Empty inputs"];
      *(_DWORD *)buf = 138543362;
      v113 = v57;
      _os_log_error_impl(&dword_1A9892000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v59 = NUAssertLogger_27648();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v58)
    {
      if (v60)
      {
        v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v89 = (void *)MEMORY[0x1E4F29060];
        id v90 = v88;
        v91 = [v89 callStackSymbols];
        v92 = [v91 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v113 = v88;
        __int16 v114 = 2114;
        v115 = v92;
        _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v60)
    {
      v61 = [MEMORY[0x1E4F29060] callStackSymbols];
      v62 = [v61 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v113 = v62;
      _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2638, @"Empty inputs", v93, v94, v95, v96, v106);
  }
  uint64_t v15 = [v8 count];
  if (v15 != [v14 count])
  {
    v63 = NUAssertLogger_27648();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = [NSString stringWithFormat:@"Style weights mismatch"];
      *(_DWORD *)buf = 138543362;
      v113 = v64;
      _os_log_error_impl(&dword_1A9892000, v63, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v66 = NUAssertLogger_27648();
    BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (v65)
    {
      if (v67)
      {
        v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v98 = (void *)MEMORY[0x1E4F29060];
        id v99 = v97;
        v100 = [v98 callStackSymbols];
        v101 = [v100 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v113 = v97;
        __int16 v114 = 2114;
        v115 = v101;
        _os_log_error_impl(&dword_1A9892000, v66, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v67)
    {
      v68 = [MEMORY[0x1E4F29060] callStackSymbols];
      v69 = [v68 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v113 = v69;
      _os_log_error_impl(&dword_1A9892000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2639, @"Style weights mismatch", v102, v103, v104, v105, v106);
  }
  unint64_t v16 = [v8 count];
  v109 = v12;
  v110 = v9;
  v107 = v14;
  if (v16)
  {
    uint64_t v17 = 0;
    double v18 = 0.0;
    do
    {
      v19 = objc_msgSend(v14, "objectAtIndexedSubscript:", v17, v107, v109, v110);
      [v19 doubleValue];
      double v18 = v18 + v20;

      ++v17;
    }
    while (v16 != v17);
    v21 = (double *)malloc_type_malloc(8 * v16, 0x100004000313F17uLL);
    unint64_t v22 = v16 - 1;
    double v23 = 1.0;
    do
    {
      v24 = [v14 objectAtIndexedSubscript:v22];
      [v24 doubleValue];
      double v26 = v25 / v18;

      v21[v22] = v26 / v23;
      double v23 = v23 - v26;
      --v22;
    }
    while (v22 != -1);
  }
  else
  {
    v21 = (double *)malloc_type_malloc(0, 0x100004000313F17uLL);
  }
  v27 = objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v107);
  v28 = [v27 metalTexture];
  v29 = v111;
  v30 = [v111 metalTexture];
  v31 = [v111 metalCommandBuffer];
  +[NUCopyKernel copyFromTexture:v28 toTexture:v30 withCommandBuffer:v31];

  if (v16 >= 2)
  {
    for (uint64_t i = 1; i != v16; ++i)
    {
      v33 = [v29 metalTexture];
      v34 = [v8 objectAtIndexedSubscript:i];
      v35 = [v34 metalTexture];
      float v36 = v21[i];
      [v29 metalTexture];
      v38 = id v37 = v8;
      v39 = [v29 metalCommandBuffer];
      *(float *)&double v40 = v36;
      +[NUMixKernel mixTexture:v33 withTexture:v35 factor:v38 intoTexture:v39 withCommandBuffer:v40];

      v29 = v111;
      id v8 = v37;
    }
  }
  free(v21);

  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "roiForInput:arguments:outputRect:", *(void *)&a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v5 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:");
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"extent"];
  if (!v6)
  {
    double v20 = NUAssertLogger_27648();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [NSString stringWithFormat:@"Missing style extent!"];
      *(_DWORD *)float v36 = 138543362;
      *(void *)&v36[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v36, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v23 = NUAssertLogger_27648();
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
        *(_DWORD *)float v36 = 138543618;
        *(void *)&v36[4] = v27;
        __int16 v37 = 2114;
        v38 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);
      }
    }
    else if (v24)
    {
      double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)float v36 = 138543362;
      *(void *)&v36[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2611, @"Missing style extent!", v32, v33, v34, v35, *(uint64_t *)v36);
  }
  v7 = v6;
  [v6 CGRectValue];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E318];
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E318];
}

+ (id)interpolateStyles:(id)a3 weights:(id)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    v31 = NUAssertLogger_27648();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputStyles.count >= 1");
      *(_DWORD *)buf = 138543362;
      id v72 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v34 = NUAssertLogger_27648();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v72 = v45;
        __int16 v73 = 2114;
        v74 = v49;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      float v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v72 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor interpolateStyles:weights:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2563, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"inputStyles.count >= 1");
  }
  uint64_t v10 = [v8 count];
  if (v10 != [v9 count])
  {
    v38 = NUAssertLogger_27648();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputStyles.count == weights.count");
      *(_DWORD *)buf = 138543362;
      id v72 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v41 = NUAssertLogger_27648();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v72 = v54;
        __int16 v73 = 2114;
        v74 = v58;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v72 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor interpolateStyles:weights:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2564, @"Invalid parameter not satisfying: %s", v59, v60, v61, v62, (uint64_t)"inputStyles.count == weights.count");
  }
  double v11 = [v8 firstObject];
  [v11 extent];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v65;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v65 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * i) extent];
        v78.origin.x = v13;
        v78.origin.y = v15;
        v78.size.width = v17;
        v78.size.height = v19;
        if (!CGRectEqualToRect(v77, v78))
        {
          +[NUError mismatchError:@"Style size must be consistent" object:v20];
          v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          id v28 = v20;
          goto LABEL_16;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  v68[0] = @"extent";
  double v25 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v13, v15, v17, v19);
  v68[1] = @"weights";
  v69[0] = v25;
  v69[1] = v9;
  double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];

  id v63 = 0;
  v27 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v20, v26, &v63, v13, v15, v17, v19);
  id v28 = v63;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    *a5 = +[NUError errorWithCode:1 reason:@"Failed to interpolate style" object:a1 underlyingError:v28];
  }

LABEL_16:

  return v27;
}

@end