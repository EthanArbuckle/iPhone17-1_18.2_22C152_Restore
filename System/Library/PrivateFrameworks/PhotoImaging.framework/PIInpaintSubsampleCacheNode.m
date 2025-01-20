@interface PIInpaintSubsampleCacheNode
- (BOOL)_tryLoad:(id *)a3;
- (BOOL)shouldCacheIntermediates;
- (id)_modifyEvaluatedGeometry:(id)a3;
- (id)compositeNode;
- (id)inpaintInputNode;
- (id)inpaintNode;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (int64_t)subsampleFactorForScale:(id)a3;
@end

@implementation PIInpaintSubsampleCacheNode

- (BOOL)_tryLoad:(id *)a3
{
  if (self->super._outputRegion) {
    return 1;
  }
  v6 = [(NUCacheNode *)self inputNode];
  v7 = [v6 outputImageGeometry:a3];

  if (v7)
  {
    v8 = [(NURenderNode *)self imageProperties:a3];
    BOOL v3 = v8 != 0;
    if (v8)
    {
      v9 = [(PIInpaintSubsampleCacheNode *)self inpaintNode];
      v10 = [v9 outputRegion];

      id v11 = objc_alloc_init(MEMORY[0x1E4F7A5A0]);
      v12 = [v8 rawProperties];

      if (v12)
      {
        v30[0] = 0;
        v30[1] = 0;
        v30[2] = [v7 scaledSize];
        v30[3] = v13;
        [v11 addRect:v30];
      }
      else
      {
        [(NUCacheNode *)self subsampleFactor];
        uint64_t v14 = NUScaleMake();
        uint64_t v16 = v15;
        uint64_t v17 = [v7 scaledSize];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __40__PIInpaintSubsampleCacheNode__tryLoad___block_invoke;
        v31[3] = &unk_1E5D804B0;
        uint64_t v33 = v14;
        uint64_t v34 = v16;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        uint64_t v37 = v17;
        uint64_t v38 = v18;
        id v32 = v11;
        [v10 enumerateRects:v31];
      }
      v19 = (NURegion *)[v11 copy];
      outputRegion = self->super._outputRegion;
      self->super._outputRegion = v19;

      v21 = (NURegion *)[v11 copy];
      inputRegion = self->super._inputRegion;
      self->super._inputRegion = v21;

      uint64_t v23 = [v7 scaledSize];
      uint64_t v25 = v24;
      v26 = [v8 colorSpace];
      v27 = -[PIInpaintCacheNode newImageOfSize:colorSpace:](self, "newImageOfSize:colorSpace:", v23, v25, v26);
      inputImage = self->super._inputImage;
      self->super._inputImage = v27;

      self->super._sourceIsHDR = [v8 isHDR];
      self->super._sourceOrientation = [v8 orientation];
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t __40__PIInpaintSubsampleCacheNode__tryLoad___block_invoke(uint64_t a1, long long *a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v3 = a2[1];
  long long v7 = *a2;
  long long v8 = v3;
  NUPixelRectScaleRational();
  NUAlignPixelRectToPixelGrid();
  long long v9 = v7;
  long long v10 = v8;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 72);
  NUPixelRectIntersection();
  long long v9 = v7;
  long long v10 = v8;
  return objc_msgSend(*(id *)(a1 + 32), "addRect:", &v7, v5, v6, v7, v8);
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  v4[0] = 0;
  v4[1] = 0;
  return objc_msgSend(MEMORY[0x1E4F7A6C0], "subsampleFactorForScale:additionalScale:", a3.var0, a3.var1, v4);
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v9 evaluationMode] == 1 || !objc_msgSend(v9, "evaluationMode"))
    && (uint64_t v10 = [v9 scale],
        -[PIInpaintSubsampleCacheNode subsampleFactorForScale:](self, "subsampleFactorForScale:", v10, v11) == 1))
  {
    v12 = [(NUCacheNode *)self inputNode];
    uint64_t v13 = [v12 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PIInpaintSubsampleCacheNode;
    uint64_t v13 = [(PIInpaintCacheNode *)&v15 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v13;
}

- (id)inpaintInputNode
{
  v2 = [(PIInpaintSubsampleCacheNode *)self inpaintNode];
  long long v3 = [v2 inputNode];

  return v3;
}

- (id)inpaintNode
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(NURenderNode *)self isCached])
  {
    long long v3 = [(PIInpaintSubsampleCacheNode *)self compositeNode];
    v4 = [v3 inpaintNode];
  }
  else
  {
    v4 = [(NUCacheNode *)self inputNode];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v6 = NUAssertLogger_15728();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = [NSString stringWithFormat:@"Unexpected input node: %@", v4];
        *(_DWORD *)buf = 138543362;
        v20 = v7;
        _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      id v8 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v10 = NUAssertLogger_15728();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v11)
        {
          uint64_t v14 = dispatch_get_specific(*v8);
          objc_super v15 = (void *)MEMORY[0x1E4F29060];
          id v16 = v14;
          uint64_t v17 = [v15 callStackSymbols];
          uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v20 = v14;
          __int16 v21 = 2114;
          v22 = v18;
          _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v11)
      {
        v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
  }
  return v4;
}

- (id)compositeNode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NUCacheNode *)self inputNode];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = NUAssertLogger_15728();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v5 = [NSString stringWithFormat:@"Unexpected input node: %@", v2];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v5;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v6 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v8 = NUAssertLogger_15728();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific(*v6);
        uint64_t v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        objc_super v15 = [v13 callStackSymbols];
        id v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v12;
        __int16 v19 = 2114;
        v20 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  return v2;
}

- (id)_modifyEvaluatedGeometry:(id)a3
{
  return a3;
}

- (BOOL)shouldCacheIntermediates
{
  return 0;
}

@end