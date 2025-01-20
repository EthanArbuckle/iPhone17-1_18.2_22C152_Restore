@interface _NUStyleTransferLearnProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)learnStyleFromInputThumbnail:(id)a3 targetThumbnail:(id)a4 colorSpace:(id)a5 configuration:(id)a6 tuningParameters:(id)a7 error:(id *)a8;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormatWithArguments:(id)a3;
@end

@implementation _NUStyleTransferLearnProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] != 2)
  {
    v56 = NUAssertLogger_27648();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs.count == 2");
      *(_DWORD *)buf = 138543362;
      v98 = v57;
      _os_log_error_impl(&dword_1A9892000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v59 = NUAssertLogger_27648();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v60)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E4F29060];
        id v72 = v70;
        v73 = [v71 callStackSymbols];
        v74 = [v73 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v98 = v70;
        __int16 v99 = 2114;
        v100 = v74;
        _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v60)
    {
      v61 = [MEMORY[0x1E4F29060] callStackSymbols];
      v62 = [v61 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v98 = v62;
      _os_log_error_impl(&dword_1A9892000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1624, @"Invalid parameter not satisfying: %s", v75, v76, v77, v78, (uint64_t)"inputs.count == 2");
  }
  v11 = [v8 objectAtIndexedSubscript:0];
  v12 = [v8 objectAtIndexedSubscript:1];
  if (+[NUGlobalSettings debugDumpStyleEngineInputs])
  {
    v13 = [v9 objectForKeyedSubscript:@"config"];
    uint64_t v14 = [v13 objectForKey:@"usage"];
    id v89 = v10;
    v15 = (void *)v14;
    v16 = @"default";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v17 = v16;

    v18 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", [v11 surface]);
    v19 = [NSString stringWithFormat:@"%@-%@-inputThumbnail", a1, v17];
    [(NUIOSurface *)v18 debugDump:v19];

    v20 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", [v12 surface]);
    id v88 = a1;
    v21 = [NSString stringWithFormat:@"%@-%@-targetThumbnail"];

    [(NUIOSurface *)v20 debugDump:v21];
    id v10 = v89;
  }
  uint64_t v22 = [v9 objectForKeyedSubscript:@"thumbExtent"];
  if (!v22)
  {
    v63 = NUAssertLogger_27648();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = [NSString stringWithFormat:@"Missing thumbnail extent!"];
      *(_DWORD *)buf = 138543362;
      v98 = v64;
      _os_log_error_impl(&dword_1A9892000, v63, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v66 = NUAssertLogger_27648();
    BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (v65)
    {
      if (v67)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E4F29060];
        id v81 = v79;
        v82 = [v80 callStackSymbols];
        v83 = [v82 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v98 = v79;
        __int16 v99 = 2114;
        v100 = v83;
        _os_log_error_impl(&dword_1A9892000, v66, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v67)
    {
      v68 = [MEMORY[0x1E4F29060] callStackSymbols];
      v69 = [v68 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v98 = v69;
      _os_log_error_impl(&dword_1A9892000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1639, @"Missing thumbnail extent!", v84, v85, v86, v87, (uint64_t)v88);
  }
  v23 = (void *)v22;
  [v11 region];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  [v23 CGRectValue];
  v104.origin.x = v32;
  v104.origin.y = v33;
  v104.size.width = v34;
  v104.size.height = v35;
  v102.origin.x = v25;
  v102.origin.y = v27;
  v102.size.width = v29;
  v102.size.height = v31;
  if (!CGRectEqualToRect(v102, v104))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v53 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    v98 = v23;
    v54 = "*** Invalid thumbnail input extent: %{public}@";
    goto LABEL_20;
  }
  [v12 region];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [v23 CGRectValue];
  v105.origin.x = v44;
  v105.origin.y = v45;
  v105.size.width = v46;
  v105.size.height = v47;
  v103.origin.x = v37;
  v103.origin.y = v39;
  v103.size.width = v41;
  v103.size.height = v43;
  if (!CGRectEqualToRect(v103, v105))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v53 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    v98 = v23;
    v54 = "*** Invalid target input extent: %{public}@";
LABEL_20:
    _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);
LABEL_17:
    BOOL v52 = 0;
    goto LABEL_18;
  }
  [v10 metalCommandBuffer];
  v48 = v90 = v10;
  v49 = [v48 commandQueue];
  v50 = [v9 objectForKeyedSubscript:@"config"];
  v51 = [v9 objectForKeyedSubscript:@"tuning"];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __75___NUStyleTransferLearnProcessor_processWithInputs_arguments_output_error___block_invoke;
  v92[3] = &unk_1E5D95CD8;
  id v93 = v90;
  id v94 = v11;
  id v95 = v12;
  id v96 = a1;
  BOOL v52 = +[_NUStyleEngine usingSharedStyleEngineForUsage:@"learn" withMetalCommandQueue:v49 configuration:v50 tuningParams:v51 perform:v92];

  id v10 = v90;
LABEL_18:

  return v52;
}

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"thumbExtent"];
  if (!v6)
  {
    id v10 = NUAssertLogger_27648();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Missing thumbnail extent!"];
      *(_DWORD *)buf = 138543362;
      CGFloat v29 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_27648();
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
        CGFloat v29 = v17;
        __int16 v30 = 2114;
        CGFloat v31 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGFloat v29 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor roiTileArrayForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1618, @"Missing thumbnail extent!", v22, v23, v24, v25, v26);
  }
  v7 = (void *)v6;
  uint64_t v27 = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];

  return v8;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"thumbExtent"];
  if (!v6)
  {
    v20 = NUAssertLogger_27648();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [NSString stringWithFormat:@"Missing thumbnail extent!"];
      *(_DWORD *)double v36 = 138543362;
      *(void *)&v36[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v36, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_27648();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        __int16 v30 = [v28 callStackSymbols];
        CGFloat v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)double v36 = 138543618;
        *(void *)&v36[4] = v27;
        __int16 v37 = 2114;
        double v38 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)double v36 = 138543362;
      *(void *)&v36[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1611, @"Missing thumbnail extent!", v32, v33, v34, v35, *(uint64_t *)v36);
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

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormatWithArguments:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"config"];
  v4 = [v3 objectForKeyedSubscript:@"useFloat16"];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = (int *)MEMORY[0x1E4F1E318];
  if (!v5) {
    uint64_t v6 = (int *)MEMORY[0x1E4F1E310];
  }
  int v7 = *v6;

  return v7;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E280];
}

+ (id)learnStyleFromInputThumbnail:(id)a3 targetThumbnail:(id)a4 colorSpace:(id)a5 configuration:(id)a6 tuningParameters:(id)a7 error:(id *)a8
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14)
  {
    CGFloat v44 = NUAssertLogger_27648();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      CGFloat v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputThumbnail != nil");
      *(_DWORD *)buf = 138543362;
      v130 = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGFloat v47 = NUAssertLogger_27648();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E4F29060];
        id v81 = v79;
        v82 = [v80 callStackSymbols];
        v83 = [v82 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v79;
        __int16 v131 = 2114;
        v132 = v83;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1546, @"Invalid parameter not satisfying: %s", v84, v85, v86, v87, (uint64_t)"inputThumbnail != nil");
  }
  if (!v15)
  {
    v51 = NUAssertLogger_27648();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      BOOL v52 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "targetThumbnail != nil");
      *(_DWORD *)buf = 138543362;
      v130 = v52;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v54 = NUAssertLogger_27648();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (v53)
    {
      if (v55)
      {
        id v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v89 = (void *)MEMORY[0x1E4F29060];
        id v90 = v88;
        v91 = [v89 callStackSymbols];
        v92 = [v91 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v88;
        __int16 v131 = 2114;
        v132 = v92;
        _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      v56 = [MEMORY[0x1E4F29060] callStackSymbols];
      v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v57;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1547, @"Invalid parameter not satisfying: %s", v93, v94, v95, v96, (uint64_t)"targetThumbnail != nil");
  }
  if (!v16)
  {
    v58 = NUAssertLogger_27648();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != nil");
      *(_DWORD *)buf = 138543362;
      v130 = v59;
      _os_log_error_impl(&dword_1A9892000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v61 = NUAssertLogger_27648();
    BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (v60)
    {
      if (v62)
      {
        v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v98 = (void *)MEMORY[0x1E4F29060];
        id v99 = v97;
        v100 = [v98 callStackSymbols];
        uint64_t v101 = [v100 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v97;
        __int16 v131 = 2114;
        v132 = v101;
        _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v62)
    {
      v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      v64 = [v63 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v64;
      _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1548, @"Invalid parameter not satisfying: %s", v102, v103, v104, v105, (uint64_t)"colorSpace != nil");
  }
  if (!v17)
  {
    v65 = NUAssertLogger_27648();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      *(_DWORD *)buf = 138543362;
      v130 = v66;
      _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v68 = NUAssertLogger_27648();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v67)
    {
      if (v69)
      {
        v106 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v107 = (void *)MEMORY[0x1E4F29060];
        id v108 = v106;
        v109 = [v107 callStackSymbols];
        v110 = [v109 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v106;
        __int16 v131 = 2114;
        v132 = v110;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v69)
    {
      v70 = [MEMORY[0x1E4F29060] callStackSymbols];
      v71 = [v70 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v71;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1549, @"Invalid parameter not satisfying: %s", v111, v112, v113, v114, (uint64_t)"config != nil");
  }
  double v19 = v18;
  if (!v18)
  {
    id v72 = NUAssertLogger_27648();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tuningParams != nil");
      *(_DWORD *)buf = 138543362;
      v130 = v73;
      _os_log_error_impl(&dword_1A9892000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v75 = NUAssertLogger_27648();
    BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_ERROR);
    if (v74)
    {
      if (v76)
      {
        v115 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v116 = (void *)MEMORY[0x1E4F29060];
        id v117 = v115;
        v118 = [v116 callStackSymbols];
        v119 = [v118 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v130 = v115;
        __int16 v131 = 2114;
        v132 = v119;
        _os_log_error_impl(&dword_1A9892000, v75, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v76)
    {
      uint64_t v77 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v78 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v130 = v78;
      _os_log_error_impl(&dword_1A9892000, v75, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1550, @"Invalid parameter not satisfying: %s", v120, v121, v122, v123, (uint64_t)"tuningParams != nil");
  }
  [v14 extent];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [v15 extent];
  v136.origin.x = v28;
  v136.origin.y = v29;
  v136.size.width = v30;
  v136.size.height = v31;
  v135.origin.x = v21;
  v135.origin.y = v23;
  v135.size.width = v25;
  v135.size.height = v27;
  if (CGRectEqualToRect(v135, v136))
  {
    v124 = a8;
    uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v33 = objc_msgSend(v14, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v16, "CGColorSpace"));
    [v32 addObject:v33];

    uint64_t v34 = objc_msgSend(v15, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v16, "CGColorSpace"));
    [v32 addObject:v34];

    v126[0] = @"tuning";
    v126[1] = @"config";
    v127[0] = v19;
    v127[1] = v17;
    v126[2] = @"thumbExtent";
    uint64_t v35 = (void *)MEMORY[0x1E4F1E080];
    [v14 extent];
    double v36 = objc_msgSend(v35, "vectorWithCGRect:");
    v127[2] = v36;
    __int16 v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:3];

    +[_NUStyleEngineConfiguration coefficientTextureSizeForConfigurationDictionary:v17];
    id v125 = 0;
    double v40 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v32, v37, &v125, 0.0, 0.0, v38, v39);
    id v41 = v125;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      id *v124 = +[NUError errorWithCode:1 reason:@"Failed to generate style image" object:a1 underlyingError:v41];
    }
  }
  else
  {
    v128[0] = v14;
    v128[1] = v15;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
    +[NUError mismatchError:@"target size must match thumbnail size" object:v32];
    double v40 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v40;
}

@end