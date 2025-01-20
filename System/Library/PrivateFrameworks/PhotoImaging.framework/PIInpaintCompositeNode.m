@interface PIInpaintCompositeNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURenderNode)inputNode;
- (PIInpaintCacheNode)inpaintNode;
- (PIInpaintCompositeNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5 retouch:(id)a6;
- (PIInpaintCompositeNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)sampleMode;
@end

@implementation PIInpaintCompositeNode

- (id)_evaluateImage:(id *)a3
{
  v5 = [(PIInpaintCompositeNode *)self inpaintNode];
  uint64_t v6 = [v5 outputImage:a3];
  if (v6)
  {
    id v7 = (id)v6;
    v8 = [v5 outputImageGeometry:a3];
    if (v8)
    {
      v9 = [(PIInpaintCompositeNode *)self inputNode];
      v10 = [v9 outputImage:a3];
      if (v10)
      {
        v11 = [v9 outputImageGeometry:a3];
        if (v11)
        {
          v40 = v9;
          v42 = v10;
          uint64_t v12 = [(PIInpaintCompositeNode *)self scale];
          uint64_t v44 = v13;
          uint64_t v45 = v12;
          NUScaleToDouble();
          double v15 = v14;
          v43 = [(NURenderNode *)self resamplingColorSpace];
          uint64_t v16 = [v8 scaledSize];
          v18 = v17;
          v41 = v11;
          uint64_t v19 = [v11 scaledSize];
          v21 = v20;
          v22 = [v5 outputRegion];
          uint64_t v55 = 0;
          v56 = 0;
          uint64_t v57 = v16;
          v58 = v18;
          v23 = [v22 regionByFlippingInRect:&v55];

          uint64_t v55 = 0;
          v56 = 0;
          uint64_t v57 = v16;
          v58 = v18;
          if ([v23 includesRect:&v55])
          {
            if (NUScaleEqual())
            {
              v11 = v41;
              v24 = v43;
            }
            else
            {
              v34 = v23;
              v35 = (void *)MEMORY[0x1E4F7A610];
              int64_t v36 = [(PIInpaintCompositeNode *)self sampleMode];
              uint64_t v55 = 0;
              v56 = 0;
              uint64_t v57 = v19;
              v58 = v21;
              v24 = v43;
              uint64_t v37 = objc_msgSend(v35, "resampleImage:by:sampleMode:extent:colorSpace:", v7, v45, v44, v36, &v55, v43);

              id v7 = (id)v37;
              v23 = v34;
              v11 = v41;
            }
            v10 = v42;
            v9 = v40;
            id v7 = v7;
            id v25 = v7;
          }
          else
          {
            v39 = v23;
            v26 = objc_msgSend(v23, "regionByScalingBy:withRounding:", 0, v15, v15);
            uint64_t v55 = 0;
            v56 = 0;
            uint64_t v57 = v19;
            v58 = v21;
            v27 = [v26 regionByClippingToRect:&v55];

            uint64_t v28 = [v5 padding];
            unint64_t v29 = vcvtpd_s64_f64(v15 * (double)v28);
            uint64_t v55 = 0;
            v56 = 0;
            uint64_t v57 = v19;
            v58 = v21;
            v30 = objc_msgSend(v27, "regionByShrinkingBy:inRect:", v29, v29, &v55);

            v31 = [v30 regionWithSubregionsOfMinimumDensity:0.5];
            uint64_t v55 = 0;
            v56 = &v55;
            uint64_t v57 = 0x3032000000;
            v58 = __Block_byref_object_copy__15790;
            v59 = __Block_byref_object_dispose__15791;
            v10 = v42;
            id v60 = v42;
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __41__PIInpaintCompositeNode__evaluateImage___block_invoke;
            v46[3] = &unk_1E5D80500;
            uint64_t v52 = v45;
            uint64_t v53 = v44;
            uint64_t v54 = v28;
            v32 = v31;
            id v7 = v7;
            id v47 = v7;
            v48 = self;
            v24 = v43;
            id v49 = v43;
            id v33 = v30;
            id v50 = v33;
            v51 = &v55;
            [v31 enumerateRects:v46];
            id v25 = (id)v56[5];

            _Block_object_dispose(&v55, 8);
            v9 = v40;
            v11 = v41;
            v23 = v39;
          }
        }
        else
        {
          id v25 = 0;
        }
      }
      else
      {
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

void __41__PIInpaintCompositeNode__evaluateImage___block_invoke(uint64_t a1, long long *a2)
{
  long long v30 = 0u;
  long long v31 = 0u;
  NUScaleInvert();
  long long v4 = a2[1];
  long long v28 = *a2;
  long long v29 = v4;
  NUPixelRectScaleRational();
  long long v26 = 0u;
  long long v27 = 0u;
  NUPixelRectDilate();
  long long v30 = v28;
  long long v31 = v29;
  v5 = *(void **)(a1 + 32);
  NUPixelRectToCGRect();
  objc_msgSend(v5, "imageByCroppingToRect:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (NUScaleEqual())
  {
    long long v7 = a2[1];
    long long v28 = *a2;
    long long v29 = v7;
    NUPixelRectToCGRect();
    v8 = objc_msgSend(v6, "imageByCroppingToRect:");
    uint64_t v9 = [v8 imageByCompositingOverImage:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = v30;
    long long v27 = v31;
    NUPixelRectScaleRational();
    uint64_t v12 = (void *)MEMORY[0x1E4F7A610];
    uint64_t v13 = [*(id *)(a1 + 40) sampleMode];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 80);
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = objc_msgSend(v12, "resampleImage:by:sampleMode:extent:colorSpace:", v6, v15, v16, v13, &v26, v14);

    v18 = *(void **)(a1 + 56);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__PIInpaintCompositeNode__evaluateImage___block_invoke_2;
    v21[3] = &unk_1E5D804D8;
    long long v19 = a2[1];
    long long v24 = *a2;
    long long v25 = v19;
    id v6 = v17;
    uint64_t v20 = *(void *)(a1 + 64);
    id v22 = v6;
    uint64_t v23 = v20;
    [v18 enumerateRects:v21];
  }
}

void __41__PIInpaintCompositeNode__evaluateImage___block_invoke_2(uint64_t a1)
{
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 64);
  NUPixelRectIntersection();
  if ((NUPixelRectIsEmpty() & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    NUPixelRectToCGRect();
    v3 = objc_msgSend(v2, "imageByCroppingToRect:", v7, v8, 0, 0, 0, 0);
    uint64_t v4 = [v3 imageByCompositingOverImage:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];
  uint64_t v14 = [v13 outputImageGeometry:a6];

  if (v14)
  {
    [v14 renderScale];
    [v12 scale];
    NUScaleDivide();
    uint64_t v15 = (void *)[v11 mutableCopy];
    uint64_t v16 = NUScaleToString();
    [v15 setObject:v16 forKeyedSubscript:@"scale"];

    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "sampleMode"));
    [v15 setObject:v17 forKeyedSubscript:@"sampleMode"];

    v20.receiver = self;
    v20.super_class = (Class)PIInpaintCompositeNode;
    v18 = [(NURenderNode *)&v20 resolvedNodeWithCachedInputs:v10 settings:v15 pipelineState:v12 error:a6];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (unint64_t)[a3 evaluationMode] < 2;
}

- (PIInpaintCacheNode)inpaintNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return (PIInpaintCacheNode *)v3;
}

- (NURenderNode)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E418]];

  return (NURenderNode *)v3;
}

- (int64_t)sampleMode
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"sampleMode"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"scale"];
  uint64_t v4 = NUScaleFromString();
  int64_t v6 = v5;

  int64_t v7 = v4;
  int64_t v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (PIInpaintCompositeNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5 retouch:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if ((NUScaleIsValid() & 1) == 0)
  {
    v18 = NUAssertLogger_15728();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      long long v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    objc_super v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v22 = NUAssertLogger_15728();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        long long v31 = dispatch_get_specific(*v20);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        objc_super v20 = [v32 callStackSymbols];
        v34 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v31;
        __int16 v47 = 2114;
        v48 = v34;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      long long v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v20 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v20;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v28 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!a4)
  {
    long long v25 = NUAssertLogger_15728();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sampleMode != NUSampleModeDefault");
      long long v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    objc_super v20 = (const void **)MEMORY[0x1E4F7A308];
    long long v27 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v22 = NUAssertLogger_15728();
    int v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v27)
    {
      if (v28)
      {
        long long v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v46 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v28)
    {
      v35 = dispatch_get_specific(*v20);
      int64_t v36 = (void *)MEMORY[0x1E4F29060];
      id v37 = v35;
      v38 = [v36 callStackSymbols];
      v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v35;
      __int16 v47 = 2114;
      v48 = v39;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v43[0] = @"scale";
  id v11 = NUScaleToString();
  v44[0] = v11;
  v43[1] = @"sampleMode";
  id v12 = [NSNumber numberWithInteger:a4];
  v43[2] = @"__dominantInputSettingsKey";
  uint64_t v13 = *MEMORY[0x1E4F1E418];
  v44[1] = v12;
  v44[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

  v41[0] = *MEMORY[0x1E4F1E480];
  v41[1] = v13;
  v42[0] = v10;
  v42[1] = v9;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v40.receiver = self;
  v40.super_class = (Class)PIInpaintCompositeNode;
  uint64_t v16 = [(NURenderNode *)&v40 initWithSettings:v14 inputs:v15];

  return v16;
}

- (PIInpaintCompositeNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSString;
      id v12 = v10;
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      long long v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_274);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          long long v19 = (void *)MEMORY[0x1E4F29060];
          objc_super v20 = v18;
          v21 = [v19 callStackSymbols];
          id v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          long long v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_274);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      long long v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      objc_super v20 = v23;
      long long v27 = [v25 callStackSymbols];
      int v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      long long v31 = specific;
      __int16 v32 = 2114;
      id v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    long long v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_274);
  }
}

@end