@interface NURenderer
+ (BOOL)allowClampToAlpha;
+ (BOOL)defaultUseHalfFloat;
+ (CGColorSpace)workingColorSpace;
+ (NURenderer)rendererWithMetalDevice:(id)a3 options:(id)a4;
+ (id)_renderContextOptionsWithOptions:(id)a3 nameSuffix:(id)a4;
+ (id)defaultRenderContextOptions;
+ (int)workingFormat;
- (CIContext)context;
- (NSString)description;
- (NSString)name;
- (NURenderer)init;
- (NURenderer)initWithCIContext:(id)a3 priority:(int64_t)a4;
- (id)imageForSurface:(id)a3 options:(id)a4;
- (id)renderDestinationForSurface:(id)a3;
- (id)renderImage:(id)a3 rect:(id *)a4 toDestination:(id)a5 atPoint:(id)a6 error:(id *)a7;
@end

@implementation NURenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (CIContext)context
{
  return self->_context;
}

- (id)renderDestinationForSurface:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v7 = NUAssertLogger_21148();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_21148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderDestinationForSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 205, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"surface != nil");
  }
  v4 = v3;
  v5 = (void *)[v3 newRenderDestination];
  [v5 setLabel:@"NURenderer-surface"];

  return v5;
}

- (id)imageForSurface:(id)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v10 = NUAssertLogger_21148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_21148();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v17;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer imageForSurface:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 195, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"surface != nil");
  }
  v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithIOSurface:options:", objc_msgSend(v5, "IOSurfaceRef"), v6);

  return v8;
}

- (id)renderImage:(id)a3 rect:(id *)a4 toDestination:(id)a5 atPoint:(id)a6 error:(id *)a7
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  if (!a7)
  {
    uint64_t v25 = NUAssertLogger_21148();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v28 = NUAssertLogger_21148();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v68 = (void *)MEMORY[0x1E4F29060];
        id v69 = v67;
        v70 = [v68 callStackSymbols];
        v71 = [v70 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v67;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v71;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 148, @"Invalid parameter not satisfying: %s", v72, v73, v74, v75, (uint64_t)"error != NULL");
  }
  if (!v13)
  {
    v32 = NUAssertLogger_21148();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_21148();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v76 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v76;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v80;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 149, @"Invalid parameter not satisfying: %s", v81, v82, v83, v84, (uint64_t)"image != nil");
  }
  if (var0 < 0)
  {
    v39 = NUAssertLogger_21148();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.x >= 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v42 = NUAssertLogger_21148();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v85 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v86 = (void *)MEMORY[0x1E4F29060];
        id v87 = v85;
        v88 = [v86 callStackSymbols];
        v89 = [v88 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v85;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v89;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 150, @"Invalid parameter not satisfying: %s", v90, v91, v92, v93, (uint64_t)"point.x >= 0");
  }
  if (var1 < 0)
  {
    v46 = NUAssertLogger_21148();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.y >= 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v47;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v49 = NUAssertLogger_21148();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v94 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v95 = (void *)MEMORY[0x1E4F29060];
        id v96 = v94;
        v97 = [v95 callStackSymbols];
        v98 = [v97 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v94;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v98;
        _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 151, @"Invalid parameter not satisfying: %s", v99, v100, v101, v102, (uint64_t)"point.y >= 0");
  }
  v15 = v14;
  uint64_t v16 = a4->var1.var0 + var0;
  if (v16 > [v14 width])
  {
    v53 = NUAssertLogger_21148();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.x + rect.size.width <= (NSInteger)destination.width");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v54;
      _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v56 = NUAssertLogger_21148();
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
    if (v55)
    {
      if (v57)
      {
        v103 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v104 = (void *)MEMORY[0x1E4F29060];
        id v105 = v103;
        v106 = [v104 callStackSymbols];
        v107 = [v106 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v103;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v107;
        _os_log_error_impl(&dword_1A9892000, v56, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v57)
    {
      v58 = [MEMORY[0x1E4F29060] callStackSymbols];
      v59 = [v58 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v59;
      _os_log_error_impl(&dword_1A9892000, v56, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 152, @"Invalid parameter not satisfying: %s", v108, v109, v110, v111, (uint64_t)"point.x + rect.size.width <= (NSInteger)destination.width");
  }
  uint64_t v17 = a4->var1.var1 + var1;
  if (v17 > [v15 height])
  {
    v60 = NUAssertLogger_21148();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.y + rect.size.height <= (NSInteger)destination.height");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_error_impl(&dword_1A9892000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v63 = NUAssertLogger_21148();
    BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
    if (v62)
    {
      if (v64)
      {
        v112 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v113 = (void *)MEMORY[0x1E4F29060];
        id v114 = v112;
        v115 = [v113 callStackSymbols];
        v116 = [v115 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v112;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v116;
        _os_log_error_impl(&dword_1A9892000, v63, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v64)
    {
      v65 = [MEMORY[0x1E4F29060] callStackSymbols];
      v66 = [v65 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v66;
      _os_log_error_impl(&dword_1A9892000, v63, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 153, @"Invalid parameter not satisfying: %s", v117, v118, v119, v120, (uint64_t)"point.y + rect.size.height <= (NSInteger)destination.height");
  }
  if (v15)
  {
    v18 = [v15 label];
    uint64_t v19 = [v18 length];

    if (!v19) {
      [v15 setLabel:@"NURenderer-unnamed"];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v137 = __Block_byref_object_copy__21255;
    v138 = __Block_byref_object_dispose__21256;
    id v139 = 0;
    uint64_t v130 = 0;
    v131 = &v130;
    uint64_t v132 = 0x3032000000;
    v133 = __Block_byref_object_copy__21255;
    v134 = __Block_byref_object_dispose__21256;
    id v135 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NURenderer_renderImage_rect_toDestination_atPoint_error___block_invoke;
    block[3] = &unk_1E5D95530;
    v124 = buf;
    block[4] = self;
    id v122 = v13;
    $0AC6E346AE4835514AAA8AC86D8F4844 v21 = a4->var1;
    $0AC6E346AE4835514AAA8AC86D8F4844 v126 = a4->var0;
    $0AC6E346AE4835514AAA8AC86D8F4844 v127 = v21;
    int64_t v128 = var0;
    int64_t v129 = var1;
    id v123 = v15;
    v125 = &v130;
    dispatch_sync(queue, block);
    uint64_t v22 = (void *)v131[5];
    if (v22) {
      *a7 = v22;
    }
    id v23 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(&v130, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[NUError failureError:@"nil CIRenderDestination" object:0];
    id v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

void __59__NURenderer_renderImage_rect_toDestination_atPoint_error___block_invoke(void *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!+[NUGlobalSettings logPeakRenderCIUsuage])
  {
    uint64_t v20 = a1[5];
    $0AC6E346AE4835514AAA8AC86D8F4844 v21 = *(void **)(a1[4] + 16);
    double v22 = (double)(uint64_t)a1[9];
    double v23 = (double)(uint64_t)a1[10];
    double v24 = (double)(uint64_t)a1[11];
    double v25 = (double)(uint64_t)a1[12];
    uint64_t v26 = a1[6];
    double v27 = (double)(uint64_t)a1[13];
    double v28 = (double)(uint64_t)a1[14];
    uint64_t v29 = *(void *)(a1[8] + 8);
    id v34 = *(id *)(v29 + 40);
    uint64_t v30 = objc_msgSend(v21, "startTaskToRender:fromRect:toDestination:atPoint:error:", v20, v26, &v34, v22, v23, v24, v25, v27, v28);
    objc_storeStrong((id *)(v29 + 40), v34);
    uint64_t v31 = *(void *)(a1[7] + 8);
    v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
LABEL_9:

    return;
  }
  [MEMORY[0x1E4F1E020] resetStatistics];
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 16);
  double v4 = (double)(uint64_t)a1[9];
  double v5 = (double)(uint64_t)a1[10];
  double v6 = (double)(uint64_t)a1[11];
  double v7 = (double)(uint64_t)a1[12];
  uint64_t v8 = a1[6];
  double v9 = (double)(uint64_t)a1[13];
  double v10 = (double)(uint64_t)a1[14];
  uint64_t v11 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v11 + 40);
  uint64_t v12 = objc_msgSend(v3, "startTaskToRender:fromRect:toDestination:atPoint:error:", v2, v8, &obj, v4, v5, v6, v7, v9, v10);
  objc_storeStrong((id *)(v11 + 40), obj);
  uint64_t v13 = *(void *)(a1[7] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  v15 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (!v15) {
    return;
  }
  uint64_t v16 = *(void *)(a1[8] + 8);
  id v35 = *(id *)(v16 + 40);
  uint64_t v17 = [v15 waitUntilCompletedAndReturnError:&v35];
  objc_storeStrong((id *)(v16 + 40), v35);

  if (!v17)
  {
    uint64_t v33 = *(void *)(a1[7] + 8);
    v32 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = 0;
    goto LABEL_9;
  }
  uint64_t v18 = [MEMORY[0x1E4F1E020] peakNonVolatileSize];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_193);
  }
  uint64_t v19 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v38 = (double)v18 * 0.0009765625 * 0.0009765625;
    _os_log_impl(&dword_1A9892000, v19, OS_LOG_TYPE_INFO, "++++ PEAK +++ %f Mb", buf, 0xCu);
  }
}

- (NSString)name
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
  }
  uint64_t v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    double v4 = v2;
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    double v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    double v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    double v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    double v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    uint64_t v12 = [v10 callStackSymbols];
    uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    double v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  double v27 = specific;
  __int16 v28 = 2114;
  uint64_t v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderer name]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 143, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (NSString)description
{
  id v3 = NSString;
  double v4 = [(NURenderer *)self name];
  double v5 = [(NURenderer *)self context];
  uint64_t v6 = [v5 workingFormat];
  double v7 = [(NURenderer *)self context];
  uint64_t v8 = [v3 stringWithFormat:@"%@ - fmt=%d, spc=%@", v4, v6, objc_msgSend(v7, "workingColorSpace")];

  return (NSString *)v8;
}

- (NURenderer)initWithCIContext:(id)a3 priority:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (CIContext *)a3;
  if (!v6)
  {
    uint64_t v23 = NUAssertLogger_21148();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "context != nil");
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v26 = NUAssertLogger_21148();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        uint64_t v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v33 = [v31 callStackSymbols];
        id v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = v30;
        __int16 v42 = 2114;
        BOOL v43 = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      __int16 v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer initWithCIContext:priority:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 121, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"context != nil");
  }
  double v7 = v6;
  v39.receiver = self;
  v39.super_class = (Class)NURenderer;
  uint64_t v8 = [(NURenderer *)&v39 init];
  context = v8->_context;
  v8->_context = v7;
  double v10 = v7;

  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v12 = v11;
  if ((unint64_t)a4 > 3) {
    dispatch_qos_class_t v13 = QOS_CLASS_UNSPECIFIED;
  }
  else {
    dispatch_qos_class_t v13 = dword_1A9A72ED0[a4];
  }
  id v14 = dispatch_queue_attr_make_with_qos_class(v11, v13, 0);

  v15 = NSString;
  if ((unint64_t)a4 > 3) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = off_1E5D94210[a4];
  }
  id v17 = v16;
  uint64_t v18 = [v15 stringWithFormat:@"NURendererQueue-%@", v17];

  id v19 = v18;
  dispatch_queue_t v20 = dispatch_queue_create((const char *)[v19 UTF8String], v14);
  queue = v8->_queue;
  v8->_queue = (OS_dispatch_queue *)v20;

  return v8;
}

- (NURenderer)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
  }
  id v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    double v4 = NSString;
    double v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    double v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
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
    dispatch_qos_class_t v13 = v11;
    id v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  dispatch_qos_class_t v13 = v16;
  dispatch_queue_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderer init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 116, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)_renderContextOptionsWithOptions:(id)a3 nameSuffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 defaultRenderContextOptions];
  double v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = [0 objectForKeyedSubscript:*MEMORY[0x1E4F1E228]];

  if (v10) {
    uint64_t v11 = @"NULow%@";
  }
  else {
    uint64_t v11 = @"NUHigh%@";
  }
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v7);

  [v9 setObject:v12 forKeyedSubscript:@"kCIContextName"];
  if (v6) {
    [v9 addEntriesFromDictionary:v6];
  }

  return v9;
}

+ (BOOL)allowClampToAlpha
{
  return +[NUGlobalSettings rendererClampToAlpha];
}

+ (BOOL)defaultUseHalfFloat
{
  return 1;
}

+ (int)workingFormat
{
  BOOL v2 = +[NUGlobalSettings rendererUseHalfFloat];
  id v3 = (int *)MEMORY[0x1E4F1E300];
  if (!v2) {
    id v3 = (int *)MEMORY[0x1E4F1E280];
  }
  return *v3;
}

+ (CGColorSpace)workingColorSpace
{
  if (+[NUGlobalSettings rendererUseP3Linear]) {
    +[NUColorSpace displayP3LinearColorSpace];
  }
  else {
  BOOL v2 = +[NUColorSpace sRGBLinearColorSpace];
  }
  id v3 = (CGColorSpace *)[v2 CGColorSpace];

  return v3;
}

+ (id)defaultRenderContextOptions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F1E240];
  v8[0] = [a1 workingColorSpace];
  v7[1] = *MEMORY[0x1E4F1E248];
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "workingFormat"));
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E4F1E1D0];
  double v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "allowClampToAlpha"));
  v8[2] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (NURenderer)rendererWithMetalDevice:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NUMetalRenderer alloc] initWithMetalDevice:v6 options:v5];

  return (NURenderer *)v7;
}

@end