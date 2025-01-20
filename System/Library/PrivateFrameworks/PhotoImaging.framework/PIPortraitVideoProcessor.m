@interface PIPortraitVideoProcessor
+ (BOOL)allowCompressedInputsAndOutputs;
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyWithInputImage:(id)a3 disparityImage:(id)a4 inputPixelBuffer:(id)a5 disparityPixelBuffer:(id)a6 globalMetadata:(id)a7 timedMetadata:(id)a8 aperture:(id)a9 focusedDisparity:(id)a10 quality:(id)a11 debugMode:(id)a12 isHDR:(BOOL)a13 error:(id *)a14;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)_configureRGBColorTexture:(id)a3 format:(int)a4 isHDR:(BOOL)a5;
@end

@implementation PIPortraitVideoProcessor

+ (id)applyWithInputImage:(id)a3 disparityImage:(id)a4 inputPixelBuffer:(id)a5 disparityPixelBuffer:(id)a6 globalMetadata:(id)a7 timedMetadata:(id)a8 aperture:(id)a9 focusedDisparity:(id)a10 quality:(id)a11 debugMode:(id)a12 isHDR:(BOOL)a13 error:(id *)a14
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  unint64_t v19 = (unint64_t)a3;
  unint64_t v96 = (unint64_t)a4;
  unint64_t v20 = (unint64_t)a5;
  unint64_t v21 = (unint64_t)a6;
  id v22 = a7;
  id v95 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  if (!a14)
  {
    v58 = NUAssertLogger_2370();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v59 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v59;
      _os_log_error_impl(&dword_1A9680000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v60 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v62 = NUAssertLogger_2370();
    BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        v76 = dispatch_get_specific(*v60);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        v60 = [v77 callStackSymbols];
        v79 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v100 = (const void **)v76;
        __int16 v101 = 2114;
        v102 = v79;
        _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v63)
    {
      v64 = [MEMORY[0x1E4F29060] callStackSymbols];
      v60 = [v64 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v100 = v60;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v68 = _NUAssertFailHandler();
    goto LABEL_33;
  }
  if (!(v19 | v20))
  {
    v65 = NUAssertLogger_2370();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil || inputPixelBuffer != nil");
      v66 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v66;
      _os_log_error_impl(&dword_1A9680000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v60 = (const void **)MEMORY[0x1E4F7A308];
    v67 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v62 = NUAssertLogger_2370();
    int v68 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (!v67)
    {
      if (v68)
      {
        v69 = [MEMORY[0x1E4F29060] callStackSymbols];
        v60 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v100 = v60;
        _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_35:

      int v73 = _NUAssertFailHandler();
      goto LABEL_36;
    }
LABEL_33:
    if (v68)
    {
      v80 = dispatch_get_specific(*v60);
      v81 = (void *)MEMORY[0x1E4F29060];
      id v82 = v80;
      v60 = [v81 callStackSymbols];
      v83 = [v60 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v100 = (const void **)v80;
      __int16 v101 = 2114;
      v102 = v83;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  unint64_t v27 = v19;
  if (!(v96 | v21))
  {
    v70 = NUAssertLogger_2370();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "disparityImage != nil || disparityPixelBuffer != nil");
      v71 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v71;
      _os_log_error_impl(&dword_1A9680000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v60 = (const void **)MEMORY[0x1E4F7A308];
    v72 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v62 = NUAssertLogger_2370();
    int v73 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (!v72)
    {
      if (v73)
      {
        v74 = [MEMORY[0x1E4F29060] callStackSymbols];
        v75 = [v74 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v100 = v75;
        _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_38;
    }
LABEL_36:
    if (v73)
    {
      v84 = dispatch_get_specific(*v60);
      v85 = (void *)MEMORY[0x1E4F29060];
      id v86 = v84;
      v87 = [v85 callStackSymbols];
      v88 = [v87 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v100 = (const void **)v84;
      __int16 v101 = 2114;
      v102 = v88;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_38:

    _NUAssertFailHandler();
  }
  v92 = v26;
  v93 = v25;
  v91 = (void *)v19;
  if (v19)
  {
    [(id)v19 extent];
    double v29 = v28;
    double v31 = v30;
    double Width = v32;
    double Height = v34;
    v36 = (void *)v20;
    if (v96)
    {
      v37 = v24;
      v38 = v23;
      [(id)v96 extent];
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      v98[0] = v27;
      v98[1] = v96;
      v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
LABEL_9:
      v51 = (void *)v21;
      goto LABEL_12;
    }
  }
  else
  {
    double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[(id)v20 CVPixelBuffer]);
    double Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)[(id)v20 CVPixelBuffer]);
    double v29 = 0.0;
    v36 = (void *)v20;
    if (v96)
    {
      v37 = v24;
      v38 = v23;
      [(id)v96 extent];
      double v40 = v47;
      double v42 = v48;
      double v44 = v49;
      double v46 = v50;
      double v31 = 0.0;
      v89 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
    double v31 = 0.0;
  }
  v37 = v24;
  v38 = v23;
  double v44 = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[(id)v21 CVPixelBuffer]);
  v51 = (void *)v21;
  double v46 = (double)CVPixelBufferGetHeight((CVPixelBufferRef)[(id)v21 CVPixelBuffer]);
  double v40 = 0.0;
  v89 = (void *)MEMORY[0x1E4F1CBF0];
  double v42 = 0.0;
LABEL_12:
  v52 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v29, v31, Width, Height);
  v97[0] = v52;
  v53 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v40, v42, v44, v46);
  v97[1] = v53;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];

  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v54 setObject:v90 forKeyedSubscript:@"imageExtents"];
  [v54 setObject:v22 forKeyedSubscript:@"globalMetadata"];
  [v54 setObject:v95 forKeyedSubscript:@"timedMetadata"];
  [v54 setObject:v38 forKeyedSubscript:@"aperture"];
  [v54 setObject:v37 forKeyedSubscript:@"focusDistance"];
  [v54 setObject:v93 forKeyedSubscript:@"quality"];
  [v54 setObject:v92 forKeyedSubscript:@"debug"];
  v55 = [NSNumber numberWithBool:a13];
  [v54 setObject:v55 forKeyedSubscript:@"isHDR"];

  [v54 setObject:v36 forKeyedSubscript:@"colorPixelBuffer"];
  [v54 setObject:v51 forKeyedSubscript:@"disparityPixelBuffer"];
  v56 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v89, v54, a14, v29, v31, Width, Height);

  return v56;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v6 = objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v7 = [v6 objectAtIndexedSubscript:a3];
  [v7 CGRectValue];
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

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E300];
}

+ (int)formatForInputAtIndex:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v3 = (int *)MEMORY[0x1E4F1E300];
    return *v3;
  }
  if (a3 == 1)
  {
    v3 = (int *)MEMORY[0x1E4F1E318];
    return *v3;
  }
  v5 = NUAssertLogger_2370();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = [NSString stringWithFormat:@"Invalid index"];
    int v24 = 138543362;
    id v25 = v6;
    _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v24, 0xCu);
  }
  v7 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  double v9 = NUAssertLogger_2370();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v10)
    {
      double v13 = dispatch_get_specific(*v7);
      double v14 = (void *)MEMORY[0x1E4F29060];
      id v15 = v13;
      double v16 = [v14 callStackSymbols];
      double v17 = [v16 componentsJoinedByString:@"\n"];
      int v24 = 138543618;
      id v25 = v13;
      __int16 v26 = 2114;
      unint64_t v27 = v17;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v24, 0x16u);
    }
  }
  else if (v10)
  {
    double v11 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v12 = [v11 componentsJoinedByString:@"\n"];
    int v24 = 138543362;
    id v25 = v12;
    _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v24, 0xCu);
  }
  double v18 = (void *)_NUAssertFailHandler();
  return +[PIPortraitVideoProcessor processWithInputs:v20 arguments:v21 output:v22 error:v23];
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v145 = a4;
  id v9 = a5;
  if ([v8 count] != 2 && objc_msgSend(v8, "count"))
  {
    v66 = NUAssertLogger_2370();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v67 = [NSString stringWithFormat:@"unexpected inputs"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v67;
      _os_log_error_impl(&dword_1A9680000, v66, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
    }
    int v68 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v59 = NUAssertLogger_2370();
    BOOL v70 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v70)
      {
        v106 = dispatch_get_specific(*v68);
        v107 = (void *)MEMORY[0x1E4F29060];
        id v108 = v106;
        v109 = [v107 callStackSymbols];
        v110 = [v109 componentsJoinedByString:@"\n"];
        *(_DWORD *)v151 = 138543618;
        *(void *)&v151[4] = v106;
        *(_WORD *)&v151[12] = 2114;
        *(void *)&v151[14] = v110;
        _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
      }
      goto LABEL_85;
    }
    if (!v70) {
      goto LABEL_85;
    }
    goto LABEL_68;
  }
  v144 = v8;
  BOOL v10 = [v9 metalCommandBuffer];
  double v11 = [v10 device];

  if (!v11)
  {
    v55 = NUAssertLogger_2370();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = [NSString stringWithFormat:@"expected a device"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v56;
      _os_log_error_impl(&dword_1A9680000, v55, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
    }
    v57 = (const void **)MEMORY[0x1E4F7A308];
    v58 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v59 = NUAssertLogger_2370();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v58)
    {
      if (v60)
      {
        v71 = dispatch_get_specific(*v57);
        v72 = (void *)MEMORY[0x1E4F29060];
        id v73 = v71;
        v74 = [v72 callStackSymbols];
        v75 = [v74 componentsJoinedByString:@"\n"];
        *(_DWORD *)v151 = 138543618;
        *(void *)&v151[4] = v71;
        *(_WORD *)&v151[12] = 2114;
        *(void *)&v151[14] = v75;
        _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
      }
      goto LABEL_85;
    }
    if (!v60) {
      goto LABEL_85;
    }
    goto LABEL_68;
  }
  double v12 = [v9 metalTexture];

  if (!v12)
  {
    v61 = NUAssertLogger_2370();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = [NSString stringWithFormat:@"expected a texture"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v62;
      _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
    }
    BOOL v63 = (const void **)MEMORY[0x1E4F7A308];
    v64 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v59 = NUAssertLogger_2370();
    BOOL v65 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v64)
    {
      if (v65)
      {
        v76 = dispatch_get_specific(*v63);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        *(_DWORD *)v151 = 138543618;
        *(void *)&v151[4] = v76;
        *(_WORD *)&v151[12] = 2114;
        *(void *)&v151[14] = v80;
        _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
      }
      goto LABEL_85;
    }
    if (!v65) {
      goto LABEL_85;
    }
    goto LABEL_68;
  }
  v138 = [v145 objectForKeyedSubscript:@"aperture"];
  double v13 = [v145 objectForKeyedSubscript:@"focusDistance"];
  v136 = [v145 objectForKeyedSubscript:@"quality"];
  v135 = [v145 objectForKeyedSubscript:@"debug"];
  v142 = [v145 objectForKeyedSubscript:@"isHDR"];
  v140 = [v145 objectForKeyedSubscript:@"globalMetadata"];
  v137 = [v145 objectForKeyedSubscript:@"timedMetadata"];
  double v14 = [v9 metalCommandBuffer];
  v141 = [v14 device];

  if ([v8 count] == 2)
  {
    id v15 = [v8 objectAtIndexedSubscript:0];
    double v16 = [v15 metalTexture];

    if (v16)
    {
      double v17 = [v8 objectAtIndexedSubscript:0];
      double v18 = [v17 metalTexture];

      v143 = [MEMORY[0x1E4F92270] createRGBA:v18];
      SEL v19 = [v8 objectAtIndexedSubscript:0];
      objc_msgSend(a1, "_configureRGBColorTexture:format:isHDR:", v143, objc_msgSend(v19, "format"), objc_msgSend(v142, "BOOLValue"));

      id v20 = [v8 objectAtIndexedSubscript:0];
      [v20 region];
      uint64_t v21 = NUPixelSizeFromCGSize();
      uint64_t v23 = v22;

      int v24 = [v144 objectAtIndexedSubscript:1];
      id v25 = [v24 metalTexture];

      if (v25)
      {
        __int16 v26 = [v144 objectAtIndexedSubscript:1];
        v134 = [v26 metalTexture];

        unint64_t v27 = [v144 objectAtIndexedSubscript:1];
        [v27 region];
        uint64_t v28 = NUPixelSizeFromCGSize();
        uint64_t v30 = v29;

        goto LABEL_21;
      }
      v91 = NUAssertLogger_2370();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v92 = [NSString stringWithFormat:@"Expected an input disparity texture"];
        *(_DWORD *)v151 = 138543362;
        *(void *)&v151[4] = v92;
        _os_log_error_impl(&dword_1A9680000, v91, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
      }
      v93 = (const void **)MEMORY[0x1E4F7A308];
      v94 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v59 = NUAssertLogger_2370();
      BOOL v95 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
      if (v94)
      {
        if (v95)
        {
          v121 = dispatch_get_specific(*v93);
          v122 = (void *)MEMORY[0x1E4F29060];
          id v123 = v121;
          v124 = [v122 callStackSymbols];
          v125 = [v124 componentsJoinedByString:@"\n"];
          *(_DWORD *)v151 = 138543618;
          *(void *)&v151[4] = v121;
          *(_WORD *)&v151[12] = 2114;
          *(void *)&v151[14] = v125;
          _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
        }
        goto LABEL_85;
      }
      if (v95) {
        goto LABEL_68;
      }
LABEL_85:

      _NUAssertFailHandler();
      goto LABEL_89;
    }
    id v86 = NUAssertLogger_2370();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      v87 = [NSString stringWithFormat:@"Expected an input color texture"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v87;
      _os_log_error_impl(&dword_1A9680000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
    }
    v88 = (const void **)MEMORY[0x1E4F7A308];
    v89 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v59 = NUAssertLogger_2370();
    BOOL v90 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v89)
    {
      if (v90)
      {
        v116 = dispatch_get_specific(*v88);
        v117 = (void *)MEMORY[0x1E4F29060];
        id v118 = v116;
        v119 = [v117 callStackSymbols];
        v120 = [v119 componentsJoinedByString:@"\n"];
        *(_DWORD *)v151 = 138543618;
        *(void *)&v151[4] = v116;
        *(_WORD *)&v151[12] = 2114;
        *(void *)&v151[14] = v120;
        _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
      }
      goto LABEL_85;
    }
    if (!v90) {
      goto LABEL_85;
    }
LABEL_68:
    unint64_t v96 = [MEMORY[0x1E4F29060] callStackSymbols];
    v97 = [v96 componentsJoinedByString:@"\n"];
    *(_DWORD *)v151 = 138543362;
    *(void *)&v151[4] = v97;
    _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v151, 0xCu);

    goto LABEL_85;
  }
  double v31 = [v145 objectForKeyedSubscript:@"colorPixelBuffer"];
  uint64_t v32 = [v31 CVPixelBuffer];
  if (!v32)
  {
    v81 = NUAssertLogger_2370();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      id v82 = [NSString stringWithFormat:@"missing direct source color pixel buffer"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v82;
      _os_log_error_impl(&dword_1A9680000, v81, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
    }
    v83 = (const void **)MEMORY[0x1E4F7A308];
    v84 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v59 = NUAssertLogger_2370();
    BOOL v85 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v84)
    {
      if (v85)
      {
        v111 = dispatch_get_specific(*v83);
        v112 = (void *)MEMORY[0x1E4F29060];
        id v113 = v111;
        v114 = [v112 callStackSymbols];
        v115 = [v114 componentsJoinedByString:@"\n"];
        *(_DWORD *)v151 = 138543618;
        *(void *)&v151[4] = v111;
        *(_WORD *)&v151[12] = 2114;
        *(void *)&v151[14] = v115;
        _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
      }
      goto LABEL_85;
    }
    if (!v85) {
      goto LABEL_85;
    }
    goto LABEL_68;
  }
  *(void *)buf = 0;
  id v150 = 0;
  [MEMORY[0x1E4F92228] pixelBufferToLumaChroma:v141 pixelBuffer:v32 outLuma:buf outChroma:&v150 read:1 write:1];
  v143 = [MEMORY[0x1E4F92270] createYUV420:*(void *)buf chroma:v150];
  int v33 = [v142 BOOLValue];
  int v34 = v33;
  if (v33) {
    uint64_t v35 = 10;
  }
  else {
    uint64_t v35 = 8;
  }
  v36 = (void *)MEMORY[0x1E4F24BD8];
  if (!v33) {
    v36 = (void *)MEMORY[0x1E4F24BE0];
  }
  [v143 setTransferFunction:*v36];
  v37 = (void *)MEMORY[0x1E4F1ECE8];
  if (!v34) {
    v37 = (void *)MEMORY[0x1E4F24AB0];
  }
  [v143 setColorPrimaries:*v37];
  v38 = (void *)MEMORY[0x1E4F24C30];
  if (!v34) {
    v38 = (void *)MEMORY[0x1E4F24C48];
  }
  [v143 setYCbCrMatrix:*v38];
  [v143 setYCbCrColorDepth:v35];
  [v143 setYCbCrFullRange:0];
  uint64_t v21 = [v31 size];
  uint64_t v23 = v39;
  double v40 = [v145 objectForKeyedSubscript:@"disparityPixelBuffer"];
  uint64_t v41 = [v40 CVPixelBuffer];
  if (!v41)
  {
    v98 = NUAssertLogger_2370();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      v99 = [NSString stringWithFormat:@"missing direct source disparity pixel buffer"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v99;
      _os_log_error_impl(&dword_1A9680000, v98, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);
    }
    v100 = (const void **)MEMORY[0x1E4F7A308];
    __int16 v101 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v102 = NUAssertLogger_2370();
    BOOL v103 = os_log_type_enabled(v102, OS_LOG_TYPE_ERROR);
    if (v101)
    {
      if (v103)
      {
        v126 = dispatch_get_specific(*v100);
        v127 = (void *)MEMORY[0x1E4F29060];
        id v128 = v126;
        v129 = [v127 callStackSymbols];
        v130 = [v129 componentsJoinedByString:@"\n"];
        *(_DWORD *)v151 = 138543618;
        *(void *)&v151[4] = v126;
        *(_WORD *)&v151[12] = 2114;
        *(void *)&v151[14] = v130;
        _os_log_error_impl(&dword_1A9680000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);
      }
    }
    else if (v103)
    {
      v104 = [MEMORY[0x1E4F29060] callStackSymbols];
      v105 = [v104 componentsJoinedByString:@"\n"];
      *(_DWORD *)v151 = 138543362;
      *(void *)&v151[4] = v105;
      _os_log_error_impl(&dword_1A9680000, v102, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v151, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_89:
    __break(1u);
  }
  v134 = [MEMORY[0x1E4F92228] getMTLTextureFromPixelBuffer:v41 device:v141];
  uint64_t v28 = [v40 size];
  uint64_t v30 = v42;

LABEL_21:
  double v43 = (void *)MEMORY[0x1E4F92270];
  double v44 = [v9 metalTexture];
  v139 = [v43 createRGBA:v44];

  objc_msgSend(a1, "_configureRGBColorTexture:format:isHDR:", v139, objc_msgSend(v9, "format"), objc_msgSend(v142, "BOOLValue"));
  id v45 = objc_alloc_init(MEMORY[0x1E4F92258]);
  [v45 setSourceColor:v143];
  [v45 setSourceDisparity:v134];
  [v45 setDestinationColor:v139];
  [v140 applyToRenderRequest:v45];
  [v137 applyToRenderRequest:v45];
  if (v138)
  {
    [v138 floatValue];
    objc_msgSend(v45, "setFNumber:");
  }
  if (v13)
  {
    [v13 floatValue];
    objc_msgSend(v45, "setFocusDisparity:");
  }
  v133 = v13;
  *(void *)v151 = 0;
  *(void *)&v151[8] = v151;
  *(void *)&v151[16] = 0x2020000000;
  int v152 = 0;
  uint64_t v46 = [v136 intValue];
  uint64_t v47 = [v135 integerValue];
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __69__PIPortraitVideoProcessor_processWithInputs_arguments_output_error___block_invoke;
  v146[3] = &unk_1E5D7EFA8;
  id v48 = v45;
  id v147 = v48;
  v149 = v151;
  id v49 = v9;
  id v148 = v49;
  +[PIPortraitVideoRenderer renderOnDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:usingBlock:](PIPortraitVideoRenderer, "renderOnDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:usingBlock:", v141, v21, v23, v28, v30, v46, v47, v140, v146);
  int v50 = *(_DWORD *)(*(void *)&v151[8] + 24);
  v51 = v133;
  if (v50)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_200);
    }
    v52 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      int v54 = *(_DWORD *)(*(void *)&v151[8] + 24);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v54;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "CPV rendering failure, returned status %d", buf, 8u);
    }
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)&v151[8] + 24) userInfo:0];
      v51 = v133;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  _Block_object_dispose(v151, 8);
  return v50 == 0;
}

void __69__PIPortraitVideoProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setRenderState:a3];
  v7 = [*(id *)(a1 + 40) metalCommandBuffer];
  LODWORD(v5) = [v6 encodeRenderTo:v7 withRenderRequest:*(void *)(a1 + 32)];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  id v8 = [*(id *)(a1 + 40) metalCommandBuffer];
  [v8 addCompletedHandler:&__block_literal_global_2470];
}

void __69__PIPortraitVideoProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 status] == 5)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_200);
    }
    v3 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = [v2 label];
      id v6 = [v2 error];
      int v7 = 138543618;
      id v8 = v5;
      __int16 v9 = 2114;
      BOOL v10 = v6;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Error executing command buffer '%{public}@': %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (void)_configureRGBColorTexture:(id)a3 format:(int)a4 isHDR:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (*MEMORY[0x1E4F1E268] != a4 && *MEMORY[0x1E4F1E300] != a4)
  {
    double v12 = NUAssertLogger_2370();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v14 = [NSString stringWithFormat:@"Unexpected input pixel format"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v14;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v17 = NUAssertLogger_2370();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v21 = dispatch_get_specific(*v15);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        int v24 = [v22 callStackSymbols];
        id v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v21;
        __int16 v29 = 2114;
        uint64_t v30 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      SEL v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  __int16 v9 = (void *)MEMORY[0x1E4F92290];
  if (!v5) {
    __int16 v9 = (void *)MEMORY[0x1E4F24BE8];
  }
  BOOL v10 = (void *)MEMORY[0x1E4F24BD8];
  if (!v5) {
    BOOL v10 = (void *)MEMORY[0x1E4F24BE0];
  }
  if (*MEMORY[0x1E4F1E268] == a4) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  id v26 = v7;
  [v7 setTransferFunction:*v11];
}

@end