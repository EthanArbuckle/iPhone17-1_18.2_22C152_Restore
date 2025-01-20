@interface _NUStyleTransferApplyProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyStyle:(id)a3 toImage:(id)a4 thumbnail:(id)a5 target:(id)a6 deltaMap:(id)a7 colorSpace:(id)a8 configuration:(id)a9 tuningParameters:(id)a10 noiseModel:(id)a11 error:(id *)a12;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4;
+ (int)outputFormat;
@end

@implementation _NUStyleTransferApplyProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 objectForKeyedSubscript:@"imageIndex"];
  v13 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v12, "unsignedIntegerValue"));

  v14 = [v10 objectForKeyedSubscript:@"styleIndex"];
  v15 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v14, "unsignedIntegerValue"));

  v16 = [v10 objectForKeyedSubscript:@"thumbIndex"];

  if (v16)
  {
    v17 = [v10 objectForKeyedSubscript:@"thumbIndex"];
    v18 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v17, "unsignedIntegerValue"));
  }
  else
  {
    v18 = 0;
  }
  id v185 = a1;
  v19 = [v10 objectForKeyedSubscript:@"deltaIndex"];

  if (v19)
  {
    v20 = [v10 objectForKeyedSubscript:@"deltaIndex"];
    v21 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v20, "unsignedIntegerValue"));
  }
  else
  {
    v21 = 0;
  }
  v22 = [v10 objectForKeyedSubscript:@"targetIndex"];

  if (v22)
  {
    v23 = [v10 objectForKeyedSubscript:@"targetIndex"];
    v24 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v23, "unsignedIntegerValue"));
  }
  else
  {
    v24 = 0;
  }
  v186 = v18;
  if (+[NUGlobalSettings debugDumpStyleEngineInputs])
  {
    id v183 = v9;
    v179 = v21;
    v25 = [v10 objectForKeyedSubscript:@"config"];
    uint64_t v26 = [v25 objectForKey:@"usage"];
    v27 = (void *)v26;
    v28 = @"default";
    if (v26) {
      v28 = (__CFString *)v26;
    }
    v29 = v28;

    v30 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", [v13 surface]);
    v31 = [NSString stringWithFormat:@"%@-%@-inputImage", v185, v29];
    [(NUIOSurface *)v30 debugDump:v31];

    v32 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", [v15 surface]);
    uint64_t v172 = (uint64_t)v185;
    v33 = [NSString stringWithFormat:@"%@-%@-inputStyle"];
    [(NUIOSurface *)v32 debugDump:v33];

    if (v18)
    {
      v34 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", [v18 surface]);
      uint64_t v172 = (uint64_t)v185;
      v35 = [NSString stringWithFormat:@"%@-%@-inputThumbnail"];
      [(NUIOSurface *)v34 debugDump:v35];

      v18 = v186;
    }
    if (v24)
    {
      v36 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", [v24 surface]);
      uint64_t v172 = (uint64_t)v185;
      v37 = [NSString stringWithFormat:@"%@-%@-targetThumbnail"];
      [(NUIOSurface *)v36 debugDump:v37];

      v18 = v186;
    }

    v21 = v179;
    id v9 = v183;
  }
  v38 = [v10 objectForKeyedSubscript:@"imageExtent"];
  [v38 CGRectValue];
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;

  v213.origin.CGFloat x = v40;
  v213.origin.CGFloat y = v42;
  v213.size.CGFloat width = v44;
  v213.size.CGFloat height = v46;
  if (CGRectIsEmpty(v213))
  {
    v92 = NUAssertLogger_27648();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      v93 = [NSString stringWithFormat:@"Missing image extent!"];
      *(_DWORD *)buf = 138543362;
      v209 = v93;
      _os_log_error_impl(&dword_1A9892000, v92, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v95 = NUAssertLogger_27648();
    BOOL v96 = os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v96)
      {
        v106 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v107 = (void *)MEMORY[0x1E4F29060];
        id v108 = v106;
        v109 = [v107 callStackSymbols];
        v110 = [v109 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v209 = v106;
        __int16 v210 = 2114;
        v211 = v110;
        _os_log_error_impl(&dword_1A9892000, v95, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v96)
    {
      v97 = [MEMORY[0x1E4F29060] callStackSymbols];
      v98 = [v97 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v209 = v98;
      _os_log_error_impl(&dword_1A9892000, v95, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1847, @"Missing image extent!", v111, v112, v113, v114, v172);
  }
  CGFloat v178 = v46;
  CGFloat v180 = v44;
  CGFloat v181 = v42;
  CGFloat v182 = v40;
  v47 = [v10 objectForKeyedSubscript:@"styleExtent"];
  [v47 CGRectValue];
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  CGFloat v53 = v52;
  CGFloat v55 = v54;

  v214.origin.CGFloat x = v49;
  v214.origin.CGFloat y = v51;
  v214.size.CGFloat width = v53;
  v214.size.CGFloat height = v55;
  if (CGRectIsEmpty(v214))
  {
    v99 = NUAssertLogger_27648();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v100 = [NSString stringWithFormat:@"Missing style extent!"];
      *(_DWORD *)buf = 138543362;
      v209 = v100;
      _os_log_error_impl(&dword_1A9892000, v99, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v101 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v102 = NUAssertLogger_27648();
    BOOL v103 = os_log_type_enabled(v102, OS_LOG_TYPE_ERROR);
    if (v101)
    {
      if (v103)
      {
        v115 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v116 = (void *)MEMORY[0x1E4F29060];
        id v117 = v115;
        v118 = [v116 callStackSymbols];
        v119 = [v118 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v209 = v115;
        __int16 v210 = 2114;
        v211 = v119;
        _os_log_error_impl(&dword_1A9892000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v103)
    {
      v104 = [MEMORY[0x1E4F29060] callStackSymbols];
      v105 = [v104 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v209 = v105;
      _os_log_error_impl(&dword_1A9892000, v102, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1850, @"Missing style extent!", v120, v121, v122, v123, v172);
  }
  [v15 region];
  v223.origin.CGFloat x = v49;
  v223.origin.CGFloat y = v51;
  v223.size.CGFloat width = v53;
  v223.size.CGFloat height = v55;
  if (!CGRectEqualToRect(v215, v223))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v89 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 138543362;
    v209 = v15;
    v90 = "*** Invalid style input extent: %{public}@";
    goto LABEL_42;
  }
  if (v18)
  {
    v56 = [v10 objectForKeyedSubscript:@"thumbExtent"];
    [v56 CGRectValue];
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    CGFloat v64 = v63;

    v216.origin.CGFloat x = v58;
    v216.origin.CGFloat y = v60;
    v216.size.CGFloat width = v62;
    v216.size.CGFloat height = v64;
    if (CGRectIsEmpty(v216))
    {
      v124 = NUAssertLogger_27648();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        v125 = [NSString stringWithFormat:@"Missing thumbnail extent!"];
        *(_DWORD *)buf = 138543362;
        v209 = v125;
        _os_log_error_impl(&dword_1A9892000, v124, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v126 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v127 = NUAssertLogger_27648();
      BOOL v128 = os_log_type_enabled(v127, OS_LOG_TYPE_ERROR);
      if (v126)
      {
        if (v128)
        {
          v145 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v146 = (void *)MEMORY[0x1E4F29060];
          id v147 = v145;
          v148 = [v146 callStackSymbols];
          v149 = [v148 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v209 = v145;
          __int16 v210 = 2114;
          v211 = v149;
          _os_log_error_impl(&dword_1A9892000, v127, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v128)
      {
        v129 = [MEMORY[0x1E4F29060] callStackSymbols];
        v130 = [v129 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v209 = v130;
        _os_log_error_impl(&dword_1A9892000, v127, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1859, @"Missing thumbnail extent!", v150, v151, v152, v153, v172);
    }
    [v18 region];
    v224.origin.CGFloat x = v58;
    v224.origin.CGFloat y = v60;
    v224.size.CGFloat width = v62;
    v224.size.CGFloat height = v64;
    if (!CGRectEqualToRect(v217, v224))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
      }
      v89 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138543362;
      v209 = v18;
      v90 = "*** Invalid thumbnail input extent: %{public}@";
      goto LABEL_42;
    }
  }
  if (v21)
  {
    v65 = [v10 objectForKeyedSubscript:@"deltaExtent"];
    [v65 CGRectValue];
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    CGFloat v73 = v72;

    v218.origin.CGFloat x = v67;
    v218.origin.CGFloat y = v69;
    v218.size.CGFloat width = v71;
    v218.size.CGFloat height = v73;
    if (CGRectIsEmpty(v218))
    {
      v131 = NUAssertLogger_27648();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        v132 = [NSString stringWithFormat:@"Missing delta extent!"];
        *(_DWORD *)buf = 138543362;
        v209 = v132;
        _os_log_error_impl(&dword_1A9892000, v131, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v133 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v134 = NUAssertLogger_27648();
      BOOL v135 = os_log_type_enabled(v134, OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v135)
        {
          v154 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v155 = (void *)MEMORY[0x1E4F29060];
          id v156 = v154;
          v157 = [v155 callStackSymbols];
          v158 = [v157 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v209 = v154;
          __int16 v210 = 2114;
          v211 = v158;
          _os_log_error_impl(&dword_1A9892000, v134, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v135)
      {
        v136 = [MEMORY[0x1E4F29060] callStackSymbols];
        v137 = [v136 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v209 = v137;
        _os_log_error_impl(&dword_1A9892000, v134, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1869, @"Missing delta extent!", v159, v160, v161, v162, v172);
    }
  }
  if (v24)
  {
    v74 = [v10 objectForKeyedSubscript:@"targetExtent"];
    [v74 CGRectValue];
    CGFloat v76 = v75;
    CGFloat v78 = v77;
    CGFloat v80 = v79;
    CGFloat v82 = v81;

    v219.origin.CGFloat x = v76;
    v219.origin.CGFloat y = v78;
    v219.size.CGFloat width = v80;
    v219.size.CGFloat height = v82;
    if (CGRectIsEmpty(v219))
    {
      v138 = NUAssertLogger_27648();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
      {
        v139 = [NSString stringWithFormat:@"Missing target extent!"];
        *(_DWORD *)buf = 138543362;
        v209 = v139;
        _os_log_error_impl(&dword_1A9892000, v138, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v140 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v141 = NUAssertLogger_27648();
      BOOL v142 = os_log_type_enabled(v141, OS_LOG_TYPE_ERROR);
      if (v140)
      {
        if (v142)
        {
          v163 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v164 = (void *)MEMORY[0x1E4F29060];
          id v165 = v163;
          v166 = [v164 callStackSymbols];
          v167 = [v166 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v209 = v163;
          __int16 v210 = 2114;
          v211 = v167;
          _os_log_error_impl(&dword_1A9892000, v141, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v142)
      {
        v143 = [MEMORY[0x1E4F29060] callStackSymbols];
        v144 = [v143 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v209 = v144;
        _os_log_error_impl(&dword_1A9892000, v141, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1875, @"Missing target extent!", v168, v169, v170, v171, v172);
    }
    [v24 region];
    v225.origin.CGFloat x = v76;
    v225.origin.CGFloat y = v78;
    v225.size.CGFloat width = v80;
    v225.size.CGFloat height = v82;
    if (!CGRectEqualToRect(v220, v225))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
      }
      v89 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138543362;
      v209 = v24;
      v90 = "*** Invalid thumbnail input extent: %{public}@";
LABEL_42:
      _os_log_error_impl(&dword_1A9892000, v89, OS_LOG_TYPE_ERROR, v90, buf, 0xCu);
LABEL_43:
      BOOL v88 = 0;
      goto LABEL_44;
    }
  }
  [v11 region];
  v226.origin.CGFloat x = v182;
  v226.origin.CGFloat y = v181;
  v226.size.CGFloat width = v180;
  v226.size.CGFloat height = v178;
  CGRect v222 = CGRectIntersection(v221, v226);
  CGFloat y = v222.origin.y;
  CGFloat x = v222.origin.x;
  CGFloat height = v222.size.height;
  CGFloat width = v222.size.width;
  v177 = [v11 metalCommandBuffer];
  [v177 commandQueue];
  id v184 = v9;
  v84 = v83 = v24;
  [v10 objectForKeyedSubscript:@"config"];
  v86 = v85 = v21;
  v87 = [v10 objectForKeyedSubscript:@"tuning"];
  v187[0] = MEMORY[0x1E4F143A8];
  v187[1] = 3221225472;
  v187[2] = __75___NUStyleTransferApplyProcessor_processWithInputs_arguments_output_error___block_invoke;
  v187[3] = &unk_1E5D95D00;
  CGFloat v195 = v49;
  CGFloat v196 = v51;
  CGFloat v197 = v53;
  CGFloat v198 = v55;
  CGFloat v199 = v182;
  CGFloat v200 = v181;
  CGFloat v201 = v180;
  CGFloat v202 = v178;
  CGFloat v203 = x;
  CGFloat v204 = y;
  CGFloat v205 = width;
  CGFloat v206 = height;
  id v188 = v13;
  id v189 = v15;
  id v190 = v18;
  id v191 = v85;
  id v192 = v83;
  id v193 = v10;
  id v194 = v11;
  id v207 = v185;
  BOOL v88 = +[_NUStyleEngine usingSharedStyleEngineForUsage:@"apply" withMetalCommandQueue:v84 configuration:v86 tuningParams:v87 perform:v187];

  v21 = v85;
  v24 = v83;
  id v9 = v184;

LABEL_44:
  return v88;
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
  id v10 = a4;
  id v11 = [v10 objectForKeyedSubscript:@"styleIndex"];
  int v12 = [v11 intValue];

  if (v12 == a3)
  {
    v13 = @"styleExtent";
LABEL_9:
    v22 = [v10 objectForKeyedSubscript:v13];
    [v22 CGRectValue];
    CGFloat x = v23;
    CGFloat y = v24;
    CGFloat width = v25;
    CGFloat height = v26;

    goto LABEL_10;
  }
  uint64_t v14 = [v10 objectForKeyedSubscript:@"thumbIndex"];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [v10 objectForKeyedSubscript:@"thumbIndex"];
    int v17 = [v16 intValue];

    if (v17 == a3)
    {
      v13 = @"thumbExtent";
      goto LABEL_9;
    }
  }
  uint64_t v18 = [v10 objectForKeyedSubscript:@"targetIndex"];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v10 objectForKeyedSubscript:@"targetIndex"];
    int v21 = [v20 intValue];

    if (v21 == a3)
    {
      v13 = @"targetExtent";
      goto LABEL_9;
    }
  }
LABEL_10:

  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
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

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"styleIndex"];
  int v7 = [v6 intValue];

  if (v7 == a3)
  {
    v8 = [v5 objectForKeyedSubscript:@"config"];
    id v9 = [v8 objectForKeyedSubscript:@"useFloat16"];
    int v10 = [v9 BOOLValue];

    id v11 = (int *)MEMORY[0x1E4F1E318];
    if (!v10) {
      id v11 = (int *)MEMORY[0x1E4F1E310];
    }
    int v12 = *v11;
  }
  else
  {
    uint64_t v13 = [v5 objectForKeyedSubscript:@"deltaIndex"];
    if (v13
      && (uint64_t v14 = (void *)v13,
          [v5 objectForKeyedSubscript:@"deltaIndex"],
          v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 intValue],
          v15,
          v14,
          v16 == a3))
    {
      int v17 = (int *)MEMORY[0x1E4F1E268];
    }
    else
    {
      int v17 = (int *)MEMORY[0x1E4F1E280];
    }
    int v12 = *v17;
  }

  return v12;
}

+ (id)applyStyle:(id)a3 toImage:(id)a4 thumbnail:(id)a5 target:(id)a6 deltaMap:(id)a7 colorSpace:(id)a8 configuration:(id)a9 tuningParameters:(id)a10 noiseModel:(id)a11 error:(id *)a12
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  if (!v17)
  {
    CGFloat v51 = NUAssertLogger_27648();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      double v52 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "styleImage != nil");
      *(_DWORD *)buf = 138543362;
      v154 = v52;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v54 = NUAssertLogger_27648();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v93 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v94 = (void *)MEMORY[0x1E4F29060];
        id v95 = v93;
        BOOL v96 = [v94 callStackSymbols];
        v97 = [v96 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v154 = v93;
        __int16 v155 = 2114;
        id v156 = v97;
        _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      v56 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v154 = v57;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1686, @"Invalid parameter not satisfying: %s", v98, v99, v100, v101, (uint64_t)"styleImage != nil");
  }
  if (!v18)
  {
    CGFloat v58 = NUAssertLogger_27648();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      double v59 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      *(_DWORD *)buf = 138543362;
      v154 = v59;
      _os_log_error_impl(&dword_1A9892000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v61 = NUAssertLogger_27648();
    BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (v60)
    {
      if (v62)
      {
        v102 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v103 = (void *)MEMORY[0x1E4F29060];
        id v104 = v102;
        v105 = [v103 callStackSymbols];
        v106 = [v105 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v154 = v102;
        __int16 v155 = 2114;
        id v156 = v106;
        _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v62)
    {
      double v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v64 = [v63 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v154 = v64;
      _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1687, @"Invalid parameter not satisfying: %s", v107, v108, v109, v110, (uint64_t)"inputImage != nil");
  }
  if (!v19)
  {
    v65 = NUAssertLogger_27648();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      double v66 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputThumbnail != nil");
      *(_DWORD *)buf = 138543362;
      v154 = v66;
      _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v68 = NUAssertLogger_27648();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v67)
    {
      if (v69)
      {
        uint64_t v111 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v112 = (void *)MEMORY[0x1E4F29060];
        id v113 = v111;
        uint64_t v114 = [v112 callStackSymbols];
        v115 = [v114 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v154 = v111;
        __int16 v155 = 2114;
        id v156 = v115;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v69)
    {
      double v70 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v71 = [v70 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v154 = v71;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1689, @"Invalid parameter not satisfying: %s", v116, v117, v118, v119, (uint64_t)"inputThumbnail != nil");
  }
  if (!v22)
  {
    double v72 = NUAssertLogger_27648();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      CGFloat v73 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != nil");
      *(_DWORD *)buf = 138543362;
      v154 = v73;
      _os_log_error_impl(&dword_1A9892000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v75 = NUAssertLogger_27648();
    BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_ERROR);
    if (v74)
    {
      if (v76)
      {
        uint64_t v120 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v121 = (void *)MEMORY[0x1E4F29060];
        id v122 = v120;
        uint64_t v123 = [v121 callStackSymbols];
        v124 = [v123 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v154 = v120;
        __int16 v155 = 2114;
        id v156 = v124;
        _os_log_error_impl(&dword_1A9892000, v75, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v76)
    {
      double v77 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v78 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v154 = v78;
      _os_log_error_impl(&dword_1A9892000, v75, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1691, @"Invalid parameter not satisfying: %s", v125, v126, v127, v128, (uint64_t)"colorSpace != nil");
  }
  if (!v23)
  {
    double v79 = NUAssertLogger_27648();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      CGFloat v80 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      *(_DWORD *)buf = 138543362;
      v154 = v80;
      _os_log_error_impl(&dword_1A9892000, v79, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v81 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGFloat v82 = NUAssertLogger_27648();
    BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_ERROR);
    if (v81)
    {
      if (v83)
      {
        v129 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v130 = (void *)MEMORY[0x1E4F29060];
        id v131 = v129;
        v132 = [v130 callStackSymbols];
        v133 = [v132 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v154 = v129;
        __int16 v155 = 2114;
        id v156 = v133;
        _os_log_error_impl(&dword_1A9892000, v82, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v83)
    {
      v84 = [MEMORY[0x1E4F29060] callStackSymbols];
      v85 = [v84 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v154 = v85;
      _os_log_error_impl(&dword_1A9892000, v82, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1692, @"Invalid parameter not satisfying: %s", v134, v135, v136, v137, (uint64_t)"config != nil");
  }
  if (!v24)
  {
    v86 = NUAssertLogger_27648();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      v87 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tuningParams != nil");
      *(_DWORD *)buf = 138543362;
      v154 = v87;
      _os_log_error_impl(&dword_1A9892000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v89 = NUAssertLogger_27648();
    BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_ERROR);
    if (v88)
    {
      if (v90)
      {
        v138 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v139 = (void *)MEMORY[0x1E4F29060];
        id v140 = v138;
        v141 = [v139 callStackSymbols];
        BOOL v142 = [v141 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v154 = v138;
        __int16 v155 = 2114;
        id v156 = v142;
        _os_log_error_impl(&dword_1A9892000, v89, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v90)
    {
      v91 = [MEMORY[0x1E4F29060] callStackSymbols];
      v92 = [v91 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v154 = v92;
      _os_log_error_impl(&dword_1A9892000, v89, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1693, @"Invalid parameter not satisfying: %s", v143, v144, v145, v146, (uint64_t)"tuningParams != nil");
  }
  id v26 = v25;
  uint64_t v151 = v20;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v148 = v24;
  [v28 setObject:v24 forKeyedSubscript:@"tuning"];
  v149 = v23;
  [v28 setObject:v23 forKeyedSubscript:@"config"];
  id v147 = v26;
  [v28 setObject:v26 forKeyedSubscript:@"noiseModel"];
  double v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  [v28 setObject:v29 forKeyedSubscript:@"imageIndex"];

  double v30 = (void *)MEMORY[0x1E4F1E080];
  [v18 extent];
  v31 = objc_msgSend(v30, "vectorWithCGRect:");
  [v28 setObject:v31 forKeyedSubscript:@"imageExtent"];

  v32 = objc_msgSend(v18, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v22, "CGColorSpace"));
  [v27 addObject:v32];

  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  [v28 setObject:v33 forKeyedSubscript:@"styleIndex"];

  v34 = (void *)MEMORY[0x1E4F1E080];
  [v17 extent];
  v35 = objc_msgSend(v34, "vectorWithCGRect:");
  [v28 setObject:v35 forKeyedSubscript:@"styleExtent"];

  [v27 addObject:v17];
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  [v28 setObject:v36 forKeyedSubscript:@"thumbIndex"];

  v37 = (void *)MEMORY[0x1E4F1E080];
  [v19 extent];
  v38 = objc_msgSend(v37, "vectorWithCGRect:");
  [v28 setObject:v38 forKeyedSubscript:@"thumbExtent"];

  double v39 = objc_msgSend(v19, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v22, "CGColorSpace"));
  [v27 addObject:v39];

  if (v21)
  {
    CGFloat v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    [v28 setObject:v40 forKeyedSubscript:@"deltaIndex"];

    double v41 = (void *)MEMORY[0x1E4F1E080];
    [v21 extent];
    CGFloat v42 = objc_msgSend(v41, "vectorWithCGRect:");
    [v28 setObject:v42 forKeyedSubscript:@"deltaExtent"];

    [v27 addObject:v21];
  }
  if (v151)
  {
    double v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    [v28 setObject:v43 forKeyedSubscript:@"targetIndex"];

    CGFloat v44 = (void *)MEMORY[0x1E4F1E080];
    [v151 extent];
    double v45 = objc_msgSend(v44, "vectorWithCGRect:");
    [v28 setObject:v45 forKeyedSubscript:@"targetExtent"];

    CGFloat v46 = objc_msgSend(v151, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v22, "CGColorSpace"));
    [v27 addObject:v46];
  }
  [v18 extent];
  id v152 = 0;
  v47 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v27, v28, &v152);
  id v48 = v152;
  if (v47)
  {
    CGFloat v49 = objc_msgSend(v47, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v22, "CGColorSpace"));
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to apply style" object:a1 underlyingError:v48];
    CGFloat v49 = 0;
    *a12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v49;
}

@end