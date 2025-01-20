@interface PIRetouchCompositeNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURenderNode)inputNode;
- (PIRetouchCacheNode)retouchNode;
- (PIRetouchCompositeNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5 retouch:(id)a6;
- (PIRetouchCompositeNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIRetouchCompositeNode

- (id)_evaluateImage:(id *)a3
{
  v76[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PIRetouchCompositeNode *)self retouchNode];
  id v6 = [v5 outputImage:a3];
  if (v6)
  {
    v7 = [v5 outputImageGeometry:a3];
    if (v7)
    {
      v8 = [(PIRetouchCompositeNode *)self inputNode];
      v9 = [v8 outputImage:a3];
      if (v9)
      {
        v55 = [v8 outputImageGeometry:a3];
        if (v55)
        {
          int64_t numerator = self->_scale.numerator;
          int64_t denominator = self->_scale.denominator;
          NUScaleToDouble();
          CGFloat v13 = v12;
          int64_t v50 = denominator;
          int64_t v51 = numerator;
          if ((NUScaleEqual() & 1) == 0)
          {
            switch(self->_sampleMode)
            {
              case 0:
                v36 = NUAssertLogger_5758();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v37 = [NSString stringWithFormat:@"Unspecified sample mode"];
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = v37;
                  _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
                }
                v38 = (const void **)MEMORY[0x1E4F7A308];
                specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
                v40 = NUAssertLogger_5758();
                BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
                if (specific)
                {
                  if (v41)
                  {
                    v44 = dispatch_get_specific(*v38);
                    v45 = (void *)MEMORY[0x1E4F29060];
                    id v46 = v44;
                    v47 = [v45 callStackSymbols];
                    v48 = [v47 componentsJoinedByString:@"\n"];
                    *(_DWORD *)buf = 138543618;
                    *(void *)&buf[4] = v44;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v48;
                    _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
                  }
                }
                else if (v41)
                {
                  v42 = [MEMORY[0x1E4F29060] callStackSymbols];
                  v43 = [v42 componentsJoinedByString:@"\n"];
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = v43;
                  _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
                }
                _NUAssertFailHandler();
                __break(1u);
                return result;
              case 1:
                uint64_t v15 = [v6 imageBySamplingNearest];

                id v6 = (id)v15;
                goto LABEL_13;
              case 2:
LABEL_13:
                v16 = (void *)MEMORY[0x1E4F1E040];
                uint64_t v73 = *MEMORY[0x1E4F1E508];
                v17 = (void *)MEMORY[0x1E4F28AF0];
                CGAffineTransformMakeScale(&v68, v13, v13);
                v18 = objc_msgSend(v17, "nu_transformWithCGAffineTransform:", &v68);
                v74 = v18;
                v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
                v49 = [v16 filterWithName:@"CIAffineTransform" withInputParameters:v19];
                goto LABEL_15;
              case 3:
                v20 = (void *)MEMORY[0x1E4F1E040];
                uint64_t v75 = *MEMORY[0x1E4F1E4F0];
                v18 = [NSNumber numberWithDouble:v13];
                v76[0] = v18;
                v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
                v49 = [v20 filterWithName:@"CILanczosScaleTransform" withInputParameters:v19];
LABEL_15:

                goto LABEL_16;
              default:
                break;
            }
          }
          v49 = 0;
LABEL_16:
          uint64_t v21 = [v7 scaledSize];
          v53 = v22;
          uint64_t v54 = v21;
          uint64_t v23 = [v55 scaledSize];
          v25 = v24;
          v26 = [v5 outputRegion];
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          *(void *)&buf[16] = v54;
          v70 = v53;
          v52 = [v26 regionByFlippingInRect:buf];

          v27 = objc_msgSend(v52, "regionByScalingBy:withRounding:", 0, v13, v13);
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          *(void *)&buf[16] = v23;
          v70 = v25;
          v28 = [v27 regionByClippingToRect:buf];

          uint64_t v29 = [v5 padding];
          unint64_t v30 = vcvtpd_s64_f64(v13 * (double)v29);
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          *(void *)&buf[16] = v23;
          v70 = v25;
          v31 = objc_msgSend(v28, "regionByShrinkingBy:inRect:", v30, v30, buf);

          v32 = [v31 regionWithSubregionsOfMinimumDensity:0.5];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v70 = __Block_byref_object_copy__5756;
          v71 = __Block_byref_object_dispose__5757;
          id v72 = v9;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __41__PIRetouchCompositeNode__evaluateImage___block_invoke;
          v56[3] = &unk_1E5D7F328;
          int64_t v61 = v51;
          int64_t v62 = v50;
          uint64_t v63 = v29;
          id v6 = v6;
          id v57 = v6;
          id v33 = v49;
          id v58 = v33;
          uint64_t v64 = 0;
          uint64_t v65 = 0;
          uint64_t v66 = v54;
          v67 = v53;
          id v34 = v31;
          id v59 = v34;
          v60 = buf;
          [v32 enumerateRects:v56];
          id v14 = *(id *)(*(void *)&buf[8] + 40);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __41__PIRetouchCompositeNode__evaluateImage___block_invoke(uint64_t a1, long long *a2)
{
  long long v27 = 0u;
  long long v28 = 0u;
  NUScaleInvert();
  long long v4 = a2[1];
  long long v25 = *a2;
  long long v26 = v4;
  NUPixelRectScaleRational();
  long long v23 = 0u;
  long long v24 = 0u;
  NUPixelRectDilate();
  long long v27 = v25;
  long long v28 = v26;
  v5 = *(void **)(a1 + 32);
  NUPixelRectToCGRect();
  objc_msgSend(v5, "imageByCroppingToRect:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (*(void *)(a1 + 40))
  {
    long long v7 = *(_OWORD *)(a1 + 104);
    long long v25 = *(_OWORD *)(a1 + 88);
    long long v26 = v7;
    NUPixelRectToCGRect();
    v8 = objc_msgSend(v6, "imageByClampingToRect:");

    [*(id *)(a1 + 40) setValue:v8 forKey:*MEMORY[0x1E4F1E480]];
    v9 = [*(id *)(a1 + 40) outputImage];

    v10 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__PIRetouchCompositeNode__evaluateImage___block_invoke_2;
    v18[3] = &unk_1E5D804D8;
    long long v11 = a2[1];
    long long v21 = *a2;
    long long v22 = v11;
    id v6 = v9;
    uint64_t v12 = *(void *)(a1 + 56);
    id v19 = v6;
    uint64_t v20 = v12;
    [v10 enumerateRects:v18];
    CGFloat v13 = v19;
  }
  else
  {
    long long v14 = a2[1];
    long long v25 = *a2;
    long long v26 = v14;
    NUPixelRectToCGRect();
    CGFloat v13 = objc_msgSend(v6, "imageByCroppingToRect:");
    uint64_t v15 = [v13 imageByCompositingOverImage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

void __41__PIRetouchCompositeNode__evaluateImage___block_invoke_2(uint64_t a1)
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
  v9.receiver = self;
  v9.super_class = (Class)PIRetouchCompositeNode;
  uint64_t v7 = [(NURenderNode *)&v9 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  *($F9703ADC4DD3124DE91DE417D7636CC9 *)(v7 + 168) = self->_scale;
  *(void *)(v7 + 184) = self->_sampleMode;
  return (id)v7;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (unint64_t)[a3 evaluationMode] < 2;
}

- (PIRetouchCacheNode)retouchNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return (PIRetouchCacheNode *)v3;
}

- (NURenderNode)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E418]];

  return (NURenderNode *)v3;
}

- (PIRetouchCompositeNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5 retouch:(id)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  if ((NUScaleIsValid() & 1) == 0)
  {
    uint64_t v20 = NUAssertLogger_5758();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      long long v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v24 = NUAssertLogger_5758();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        id v33 = dispatch_get_specific(*v22);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        long long v22 = [v34 callStackSymbols];
        v36 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = (const void **)v33;
        __int16 v49 = 2114;
        int64_t v50 = v36;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      long long v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v22 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v22;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v30 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!a4)
  {
    long long v27 = NUAssertLogger_5758();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sampleMode != NUSampleModeDefault");
      long long v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v22 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v29 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v24 = NUAssertLogger_5758();
    int v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v48 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v30)
    {
      v37 = dispatch_get_specific(*v22);
      v38 = (void *)MEMORY[0x1E4F29060];
      id v39 = v37;
      v40 = [v38 callStackSymbols];
      BOOL v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v37;
      __int16 v49 = 2114;
      int64_t v50 = v41;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v45[0] = @"scale";
  CGFloat v13 = NUScaleToString();
  v46[0] = v13;
  v45[1] = @"sampleMode";
  long long v14 = [NSNumber numberWithInteger:a4];
  v45[2] = @"__dominantInputSettingsKey";
  uint64_t v15 = *MEMORY[0x1E4F1E418];
  v46[1] = v14;
  v46[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];

  v43[0] = *MEMORY[0x1E4F1E480];
  v43[1] = v15;
  v44[0] = v12;
  v44[1] = v11;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v42.receiver = self;
  v42.super_class = (Class)PIRetouchCompositeNode;
  v18 = [(NURenderNode *)&v42 initWithSettings:v16 inputs:v17];
  v18->_scale.int64_t numerator = var0;
  v18->_scale.int64_t denominator = var1;
  v18->_sampleMode = a4;

  return v18;
}

- (PIRetouchCompositeNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    objc_super v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSString;
      id v12 = v10;
      CGFloat v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          id v19 = (void *)MEMORY[0x1E4F29060];
          uint64_t v20 = v18;
          long long v21 = [v19 callStackSymbols];
          long long v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
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
      BOOL v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      uint64_t v20 = v23;
      long long v27 = [v25 callStackSymbols];
      long long v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      __int16 v32 = 2114;
      id v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
  }
}

@end