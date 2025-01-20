@interface _NUStyleTransferProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyStyleFromInputThumbnail:(id)a3 targetThumbnail:(id)a4 toImage:(id)a5 colorSpace:(id)a6 configuration:(id)a7 tuningParameters:(id)a8 error:(id *)a9;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation _NUStyleTransferProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count] != 3)
  {
    v62 = NUAssertLogger_27648();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs.count == 3");
      *(_DWORD *)buf = 138543362;
      v130 = v63;
      _os_log_error_impl(&dword_1A9892000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v65 = NUAssertLogger_27648();
    BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v66)
      {
        v76 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v76;
        __int16 v131 = 2114;
        v132 = v80;
        _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v66)
    {
      v67 = [MEMORY[0x1E4F29060] callStackSymbols];
      v68 = [v67 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v68;
      _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2024, @"Invalid parameter not satisfying: %s", v81, v82, v83, v84, (uint64_t)"inputs.count == 3");
  }
  v12 = [v9 objectAtIndexedSubscript:0];
  v13 = [v9 objectAtIndexedSubscript:1];
  v14 = [v9 objectAtIndexedSubscript:2];
  uint64_t v15 = [v10 objectForKeyedSubscript:@"thumbExtent"];
  if (!v15)
  {
    v69 = NUAssertLogger_27648();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = [NSString stringWithFormat:@"Missing thumbnail extent!"];
      *(_DWORD *)buf = 138543362;
      v130 = v70;
      _os_log_error_impl(&dword_1A9892000, v69, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v71 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v72 = NUAssertLogger_27648();
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    if (v71)
    {
      if (v73)
      {
        v85 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v86 = (void *)MEMORY[0x1E4F29060];
        id v87 = v85;
        v88 = [v86 callStackSymbols];
        v89 = [v88 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v85;
        __int16 v131 = 2114;
        v132 = v89;
        _os_log_error_impl(&dword_1A9892000, v72, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v73)
    {
      v74 = [MEMORY[0x1E4F29060] callStackSymbols];
      v75 = [v74 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v75;
      _os_log_error_impl(&dword_1A9892000, v72, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2035, @"Missing thumbnail extent!", v90, v91, v92, v93, v110);
  }
  v16 = (void *)v15;
  [v12 region];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v16 CGRectValue];
  v139.origin.CGFloat x = v25;
  v139.origin.CGFloat y = v26;
  v139.size.CGFloat width = v27;
  v139.size.CGFloat height = v28;
  v134.origin.CGFloat x = v18;
  v134.origin.CGFloat y = v20;
  v134.size.CGFloat width = v22;
  v134.size.CGFloat height = v24;
  if (!CGRectEqualToRect(v134, v139))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v59 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138543362;
    v130 = v16;
    v60 = "*** Invalid thumbnail input extent: %{public}@";
    goto LABEL_17;
  }
  [v13 region];
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  [v16 CGRectValue];
  v140.origin.CGFloat x = v37;
  v140.origin.CGFloat y = v38;
  v140.size.CGFloat width = v39;
  v140.size.CGFloat height = v40;
  v135.origin.CGFloat x = v30;
  v135.origin.CGFloat y = v32;
  v135.size.CGFloat width = v34;
  v135.size.CGFloat height = v36;
  if (!CGRectEqualToRect(v135, v140))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v59 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138543362;
    v130 = v16;
    v60 = "*** Invalid target input extent: %{public}@";
LABEL_17:
    _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, v60, buf, 0xCu);
LABEL_14:
    BOOL v58 = 0;
    goto LABEL_15;
  }
  v41 = [v10 objectForKeyedSubscript:@"imageExtent"];
  [v41 CGRectValue];
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;

  v136.origin.CGFloat x = v43;
  v136.origin.CGFloat y = v45;
  v136.size.CGFloat width = v47;
  v136.size.CGFloat height = v49;
  if (CGRectIsEmpty(v136))
  {
    v94 = NUAssertLogger_27648();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      v95 = [NSString stringWithFormat:@"Missing image extent!"];
      *(_DWORD *)buf = 138543362;
      v130 = v95;
      _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v96 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v97 = NUAssertLogger_27648();
    BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_ERROR);
    if (v96)
    {
      if (v98)
      {
        v101 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v102 = (void *)MEMORY[0x1E4F29060];
        id v103 = v101;
        v104 = [v102 callStackSymbols];
        v105 = [v104 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v101;
        __int16 v131 = 2114;
        v132 = v105;
        _os_log_error_impl(&dword_1A9892000, v97, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v98)
    {
      v99 = [MEMORY[0x1E4F29060] callStackSymbols];
      v100 = [v99 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v100;
      _os_log_error_impl(&dword_1A9892000, v97, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2045, @"Missing image extent!", v106, v107, v108, v109, v110);
  }
  [v11 region];
  v141.origin.CGFloat x = v43;
  v141.origin.CGFloat y = v45;
  v141.size.CGFloat width = v47;
  v141.size.CGFloat height = v49;
  CGRect v138 = CGRectIntersection(v137, v141);
  CGFloat x = v138.origin.x;
  CGFloat y = v138.origin.y;
  CGFloat width = v138.size.width;
  CGFloat height = v138.size.height;
  v112 = [v11 metalCommandBuffer];
  v111 = [v112 commandQueue];
  uint64_t v54 = [v10 objectForKeyedSubscript:@"config"];
  [v10 objectForKeyedSubscript:@"tuning"];
  v55 = v113 = v14;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __70___NUStyleTransferProcessor_processWithInputs_arguments_output_error___block_invoke;
  v114[3] = &unk_1E5D95D28;
  id v115 = v16;
  id v116 = v12;
  id v117 = v13;
  CGFloat v120 = v43;
  CGFloat v121 = v45;
  CGFloat v122 = v47;
  CGFloat v123 = v49;
  CGFloat v124 = x;
  CGFloat v125 = y;
  CGFloat v126 = width;
  CGFloat v127 = height;
  id v118 = v113;
  id v119 = v11;
  id v128 = a1;
  id v56 = v11;
  v57 = (void *)v54;
  BOOL v58 = +[_NUStyleEngine usingSharedStyleEngineForUsage:@"learn&apply" withMetalCommandQueue:v111 configuration:v54 tuningParams:v55 perform:v114];

  v14 = v113;
  id v11 = v56;

LABEL_15:
  return v58;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
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
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = v10;
  if (a3 <= 1)
  {
    v12 = [v10 objectForKeyedSubscript:@"thumbExtent"];
    if (!v12)
    {
      CGFloat v22 = NUAssertLogger_27648();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        double v23 = [NSString stringWithFormat:@"Missing thumbnail extent!"];
        *(_DWORD *)CGFloat v38 = 138543362;
        *(void *)&v38[4] = v23;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v38, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      CGFloat v25 = NUAssertLogger_27648();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          double v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          CGFloat v30 = (void *)MEMORY[0x1E4F29060];
          id v31 = v29;
          CGFloat v32 = [v30 callStackSymbols];
          double v33 = [v32 componentsJoinedByString:@"\n"];
          *(_DWORD *)CGFloat v38 = 138543618;
          *(void *)&v38[4] = v29;
          __int16 v39 = 2114;
          CGFloat v40 = v33;
          _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v38, 0x16u);
        }
      }
      else if (v26)
      {
        CGFloat v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        CGFloat v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGFloat v38 = 138543362;
        *(void *)&v38[4] = v28;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v38, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2001, @"Missing thumbnail extent!", v34, v35, v36, v37, *(uint64_t *)v38);
    }
    v13 = v12;
    [v12 CGRectValue];
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E280];
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E280];
}

+ (id)applyStyleFromInputThumbnail:(id)a3 targetThumbnail:(id)a4 toImage:(id)a5 colorSpace:(id)a6 configuration:(id)a7 tuningParameters:(id)a8 error:(id *)a9
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v15)
  {
    CGFloat v47 = NUAssertLogger_27648();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      double v48 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputThumbnail != nil");
      *(_DWORD *)buf = 138543362;
      v149 = v48;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v50 = NUAssertLogger_27648();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v89 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v90 = (void *)MEMORY[0x1E4F29060];
        id v91 = v89;
        uint64_t v92 = [v90 callStackSymbols];
        uint64_t v93 = [v92 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v149 = v89;
        __int16 v150 = 2114;
        v151 = v93;
        _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v51)
    {
      v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v149 = v53;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1942, @"Invalid parameter not satisfying: %s", v94, v95, v96, v97, (uint64_t)"inputThumbnail != nil");
  }
  if (!v16)
  {
    uint64_t v54 = NUAssertLogger_27648();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "targetThumbnail != nil");
      *(_DWORD *)buf = 138543362;
      v149 = v55;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v57 = NUAssertLogger_27648();
    BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (v56)
    {
      if (v58)
      {
        BOOL v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v99 = (void *)MEMORY[0x1E4F29060];
        id v100 = v98;
        v101 = [v99 callStackSymbols];
        v102 = [v101 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v149 = v98;
        __int16 v150 = 2114;
        v151 = v102;
        _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v58)
    {
      v59 = [MEMORY[0x1E4F29060] callStackSymbols];
      v60 = [v59 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v149 = v60;
      _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1943, @"Invalid parameter not satisfying: %s", v103, v104, v105, v106, (uint64_t)"targetThumbnail != nil");
  }
  if (!v17)
  {
    v61 = NUAssertLogger_27648();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      *(_DWORD *)buf = 138543362;
      v149 = v62;
      _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v64 = NUAssertLogger_27648();
    BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (v63)
    {
      if (v65)
      {
        uint64_t v107 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v108 = (void *)MEMORY[0x1E4F29060];
        id v109 = v107;
        uint64_t v110 = [v108 callStackSymbols];
        v111 = [v110 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v149 = v107;
        __int16 v150 = 2114;
        v151 = v111;
        _os_log_error_impl(&dword_1A9892000, v64, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v65)
    {
      BOOL v66 = [MEMORY[0x1E4F29060] callStackSymbols];
      v67 = [v66 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v149 = v67;
      _os_log_error_impl(&dword_1A9892000, v64, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1944, @"Invalid parameter not satisfying: %s", v112, v113, v114, v115, (uint64_t)"inputImage != nil");
  }
  if (!v18)
  {
    v68 = NUAssertLogger_27648();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != nil");
      *(_DWORD *)buf = 138543362;
      v149 = v69;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v71 = NUAssertLogger_27648();
    BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
    if (v70)
    {
      if (v72)
      {
        id v116 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v117 = (void *)MEMORY[0x1E4F29060];
        id v118 = v116;
        id v119 = [v117 callStackSymbols];
        CGFloat v120 = [v119 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v149 = v116;
        __int16 v150 = 2114;
        v151 = v120;
        _os_log_error_impl(&dword_1A9892000, v71, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v72)
    {
      BOOL v73 = [MEMORY[0x1E4F29060] callStackSymbols];
      v74 = [v73 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v149 = v74;
      _os_log_error_impl(&dword_1A9892000, v71, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1945, @"Invalid parameter not satisfying: %s", v121, v122, v123, v124, (uint64_t)"colorSpace != nil");
  }
  if (!v19)
  {
    v75 = NUAssertLogger_27648();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      *(_DWORD *)buf = 138543362;
      v149 = v76;
      _os_log_error_impl(&dword_1A9892000, v75, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v78 = NUAssertLogger_27648();
    BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (v77)
    {
      if (v79)
      {
        CGFloat v125 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGFloat v126 = (void *)MEMORY[0x1E4F29060];
        id v127 = v125;
        id v128 = [v126 callStackSymbols];
        v129 = [v128 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v149 = v125;
        __int16 v150 = 2114;
        v151 = v129;
        _os_log_error_impl(&dword_1A9892000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v79)
    {
      v80 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v81 = [v80 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v149 = v81;
      _os_log_error_impl(&dword_1A9892000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1946, @"Invalid parameter not satisfying: %s", v130, v131, v132, v133, (uint64_t)"config != nil");
  }
  double v21 = v20;
  if (!v20)
  {
    uint64_t v82 = NUAssertLogger_27648();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      uint64_t v83 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tuningParams != nil");
      *(_DWORD *)buf = 138543362;
      v149 = v83;
      _os_log_error_impl(&dword_1A9892000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v84 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v85 = NUAssertLogger_27648();
    BOOL v86 = os_log_type_enabled(v85, OS_LOG_TYPE_ERROR);
    if (v84)
    {
      if (v86)
      {
        CGRect v134 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGRect v135 = (void *)MEMORY[0x1E4F29060];
        id v136 = v134;
        CGRect v137 = [v135 callStackSymbols];
        CGRect v138 = [v137 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v149 = v134;
        __int16 v150 = 2114;
        v151 = v138;
        _os_log_error_impl(&dword_1A9892000, v85, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v86)
    {
      id v87 = [MEMORY[0x1E4F29060] callStackSymbols];
      v88 = [v87 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v149 = v88;
      _os_log_error_impl(&dword_1A9892000, v85, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1947, @"Invalid parameter not satisfying: %s", v139, v140, v141, v142, (uint64_t)"tuningParams != nil");
  }
  [v15 extent];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [v16 extent];
  v155.origin.CGFloat x = v30;
  v155.origin.CGFloat y = v31;
  v155.size.CGFloat width = v32;
  v155.size.CGFloat height = v33;
  v154.origin.CGFloat x = v23;
  v154.origin.CGFloat y = v25;
  v154.size.CGFloat width = v27;
  v154.size.CGFloat height = v29;
  if (CGRectEqualToRect(v154, v155))
  {
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    uint64_t v35 = objc_msgSend(v15, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));
    [v34 addObject:v35];

    uint64_t v36 = objc_msgSend(v16, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));
    [v34 addObject:v36];

    uint64_t v37 = objc_msgSend(v17, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));
    [v34 addObject:v37];

    v145[0] = @"tuning";
    v145[1] = @"config";
    v146[0] = v21;
    v146[1] = v19;
    id v143 = v19;
    v145[2] = @"thumbExtent";
    CGFloat v38 = (void *)MEMORY[0x1E4F1E080];
    [v15 extent];
    __int16 v39 = objc_msgSend(v38, "vectorWithCGRect:");
    v146[2] = v39;
    v145[3] = @"imageExtent";
    CGFloat v40 = (void *)MEMORY[0x1E4F1E080];
    [v17 extent];
    uint64_t v41 = objc_msgSend(v40, "vectorWithCGRect:");
    v146[3] = v41;
    double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:4];

    [v17 extent];
    id v144 = 0;
    CGFloat v43 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v34, v42, &v144);
    id v44 = v144;
    if (v43)
    {
      CGFloat v45 = objc_msgSend(v43, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v18, "CGColorSpace"));
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to apply style" object:a1 underlyingError:v44];
      CGFloat v45 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v19 = v143;
  }
  else
  {
    v147[0] = v15;
    v147[1] = v16;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:2];
    +[NUError mismatchError:@"target size must match thumbnail size" object:v34];
    CGFloat v45 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

@end