@interface NUCGImageDepthSourceNode
- (NUCGImageDepthSourceNode)initWithSourceNode:(id)a3 auxiliaryImageType:(int64_t)a4 auxiliaryImageProperties:(id)a5;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUCGImageDepthSourceNode

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    v22 = NUAssertLogger_9299();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_9299();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 76, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != nil");
  }
  if (!a4)
  {
    v29 = NUAssertLogger_9299();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v32 = NUAssertLogger_9299();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 78, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  v10 = [(NUCGAuxiliaryImageSourceNode *)self _evaluateAuxiliaryImageForType:[(NUCGAuxiliaryImageSourceNode *)self auxiliaryImageType] error:a5];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 underlyingAVDepthData];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
      v15 = (void *)[v14 depthDataMap];
      if (v15)
      {
        v56[0] = *MEMORY[0x1E4F1E390];
        v16 = [MEMORY[0x1E4F1CA98] null];
        v56[1] = *MEMORY[0x1E4F1E320];
        v57[0] = v16;
        v57[1] = v14;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

        v18 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v15 options:v17];
        v15 = v18;
        if (self->_needsAspectRatioCorrection)
        {
          long long v19 = *(_OWORD *)&self->_aspectTransform.c;
          *(_OWORD *)buf = *(_OWORD *)&self->_aspectTransform.a;
          *(_OWORD *)&buf[16] = v19;
          long long v55 = *(_OWORD *)&self->_aspectTransform.tx;
          uint64_t v20 = [v18 imageByApplyingTransform:buf];

          v15 = (void *)v20;
        }
      }
      else
      {
        *a5 = +[NUError unknownError:@"Unable to convert AVDepthData to disparity" object:self];
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUCGImageDepthSourceNode;
  v6 = [(NUCGAuxiliaryImageSourceNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (NUCGImageDepthSourceNode)initWithSourceNode:(id)a3 auxiliaryImageType:(int64_t)a4 auxiliaryImageProperties:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    v30 = NUAssertLogger_9299();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceNode != nil");
      LODWORD(v63.a) = 138543362;
      *(void *)((char *)&v63.a + 4) = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v63, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v33 = NUAssertLogger_9299();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        id v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        LODWORD(v63.a) = 138543618;
        *(void *)((char *)&v63.a + 4) = v44;
        WORD2(v63.b) = 2114;
        *(void *)((char *)&v63.b + 6) = v48;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v63, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      LODWORD(v63.a) = 138543362;
      *(void *)((char *)&v63.a + 4) = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v63, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 33, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"sourceNode != nil");
  }
  v10 = v9;
  if (!v9)
  {
    v37 = NUAssertLogger_9299();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "auxiliaryImageProperties != nil");
      LODWORD(v63.a) = 138543362;
      *(void *)((char *)&v63.a + 4) = v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v63, 0xCu);
    }
    v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v40 = NUAssertLogger_9299();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v41)
      {
        uint64_t v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        LODWORD(v63.a) = 138543618;
        *(void *)((char *)&v63.a + 4) = v53;
        WORD2(v63.b) = 2114;
        *(void *)((char *)&v63.b + 6) = v57;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v63, 0x16u);
      }
    }
    else if (v41)
    {
      uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
      LODWORD(v63.a) = 138543362;
      *(void *)((char *)&v63.a + 4) = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v63, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 34, @"Invalid parameter not satisfying: %s", v58, v59, v60, v61, (uint64_t)"auxiliaryImageProperties != nil");
  }
  v62.receiver = self;
  v62.super_class = (Class)NUCGImageDepthSourceNode;
  v11 = [(NUCGAuxiliaryImageSourceNode *)&v62 initWithSourceNode:v8 auxiliaryImageType:a4 auxiliaryImageProperties:v9];
  *((void *)v11 + 33) = [v10 size];
  *((void *)v11 + 34) = v12;
  v13 = v11 + 272;
  uint64_t v14 = [v8 pixelSizeWithSourceOptions:MEMORY[0x1E4F1CC08]];
  double v16 = (double)*((uint64_t *)v11 + 33);
  double v17 = (double)*((uint64_t *)v11 + 34);
  double v18 = (double)v15 * v16 / (double)v14;
  double v19 = (double)v14 * v17 / (double)v15;
  double v20 = vabdd_f64(v19, v16);
  if (vabdd_f64(v18, v17) > 1.0 || v20 > 1.0)
  {
    v11[208] = 1;
    double v22 = (double)v14 / (double)v15;
    double v23 = v16 / v17;
    v24 = v11 + 216;
    if (v16 / v17 <= v22)
    {
      CGAffineTransformMakeScale(&v63, v22 / v23, 1.0);
      long long v27 = *(_OWORD *)&v63.a;
      long long v28 = *(_OWORD *)&v63.tx;
      *(_OWORD *)(v11 + 232) = *(_OWORD *)&v63.c;
      *(_OWORD *)(v11 + 248) = v28;
      _OWORD *v24 = v27;
      double v18 = v19;
      v13 = v11 + 264;
    }
    else
    {
      CGAffineTransformMakeScale(&v63, 1.0, v23 / v22);
      long long v25 = *(_OWORD *)&v63.a;
      long long v26 = *(_OWORD *)&v63.tx;
      *(_OWORD *)(v11 + 232) = *(_OWORD *)&v63.c;
      *(_OWORD *)(v11 + 248) = v26;
      _OWORD *v24 = v25;
    }
    void *v13 = llround(v18);
  }

  return (NUCGImageDepthSourceNode *)v11;
}

@end