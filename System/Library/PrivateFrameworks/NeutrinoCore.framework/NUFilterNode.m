@interface NUFilterNode
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)isEqualToRenderNode:(id)a3;
- (BOOL)isGeometryNode;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NSString)filterName;
- (NUFilterNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5;
- (NUFilterNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageProperties:(id *)a3;
- (id)aliasDescription;
- (id)debugQuickLookObject;
- (id)descriptionSubClassHook;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)gainMapMode;
- (unint64_t)hash;
- (void)nu_updateDigest:(id)a3;
@end

@implementation NUFilterNode

- (void).cxx_destruct
{
}

- (int64_t)gainMapMode
{
  return self->_gainMapMode;
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (void)nu_updateDigest:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUFilterNode;
  id v4 = a3;
  [(NURenderNode *)&v5 nu_updateDigest:v4];
  objc_msgSend(v4, "addCString:", "filterName", v5.receiver, v5.super_class);
  [v4 addString:self->_filterName];
  [v4 addCString:"gainMapMode"];
  [v4 addBytes:&self->_gainMapMode length:8];
}

- (id)aliasDescription
{
  return self->_filterName;
}

- (id)descriptionSubClassHook
{
  v3 = self->_filterName;
  int64_t v4 = [(NUFilterNode *)self gainMapMode];
  if ((unint64_t)(v4 - 1) >= 3)
  {
    objc_super v5 = v3;
  }
  else
  {
    objc_super v5 = [(NSString *)v3 stringByAppendingFormat:@"[gm:%@]", off_1E5D950D0[v4 - 1]];
  }
  v6 = v5;

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)NUFilterNode;
  uint64_t v3 = 0x2312EF99DDCBC5 * [(NURenderNode *)&v5 hash];
  return (0x41359F86079F7 * [(NSString *)self->_filterName hash]) ^ v3;
}

- (BOOL)isEqualToRenderNode:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUFilterNode;
  if ([(NURenderNode *)&v11 isEqualToRenderNode:v4]
    && ([(NUFilterNode *)self filterName],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        [v4 filterName],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    int64_t v8 = [(NUFilterNode *)self gainMapMode];
    BOOL v9 = v8 == [v4 gainMapMode];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)debugQuickLookObject
{
  if ([(NURenderNode *)self isCached])
  {
    v5.receiver = self;
    v5.super_class = (Class)NUFilterNode;
    uint64_t v3 = [(NURenderNode *)&v5 debugQuickLookObject];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v3 = [(NUFilterNode *)self _evaluateImage:&v6];
  }

  return v3;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v21 = NUAssertLogger_17835();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v45 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_17835();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v28;
        __int16 v46 = 2114;
        v47 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFilterNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 233, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != NULL");
  }
  objc_super v5 = (void *)MEMORY[0x1E4F1E040];
  filterName = self->_filterName;
  int v7 = [(NURenderNode *)self settings];
  int64_t v8 = [v5 filterWithName:filterName withInputParameters:v7];
  v37 = a3;

  if (!v8)
  {
    +[NUError errorWithCode:1 reason:@"Cannot create filter with name" object:self->_filterName];
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  BOOL v9 = [(NURenderNode *)self inputs];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v14 = [(NURenderNode *)self inputForKey:v13];
        id v38 = 0;
        v15 = [v14 outputImage:&v38];
        id v16 = v38;
        if (!v15)
        {
          id *v37 = +[NUError errorWithCode:2 reason:@"Cannot evaluate input" object:v14 underlyingError:v16];

          v19 = 0;
          goto LABEL_20;
        }
        [v8 setValue:v15 forKey:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v17 = [v8 outputImage];
  if (!v17)
  {
    v18 = +[NUError invalidError:@"Filter produced a nil output image" object:v8];
LABEL_18:
    +[NUError errorWithCode:1 reason:@"Failed to produce valid output image for CIFilter" object:v8 underlyingError:v18];
    v19 = 0;
    id *v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = +[NUError invalidError:@"Output image is not a CIImage" object:v17];

    goto LABEL_18;
  }
  v18 = 0;
  v19 = v17;
LABEL_19:

LABEL_20:

  return v19;
}

- (id)_evaluateImageProperties:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUFilterNode;
  id v4 = [(NURenderNode *)&v7 _evaluateImageProperties:a3];
  if (v4 && [(NUFilterNode *)self gainMapMode] == 3)
  {
    objc_super v5 = [[_NUImageProperties alloc] initWithProperties:v4];
    [(_NUImageProperties *)v5 setAuxiliaryImageProperties:0 forType:7];

    id v4 = v5;
  }

  return v4;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)NUFilterNode;
  objc_super v5 = -[NURenderNode _evaluateImageGeometry:](&v26, sel__evaluateImageGeometry_);
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 extent];
    if (v24) {
      BOOL v7 = v25 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      uint64_t v8 = [v6 renderScale];
      uint64_t v10 = v9;
      uint64_t v11 = [(NURenderNode *)self outputImage:a3];
      v12 = v11;
      if (v11)
      {
        [v11 extent];
        CGFloat x = v30.origin.x;
        CGFloat y = v30.origin.y;
        CGFloat width = v30.size.width;
        CGFloat height = v30.size.height;
        if (CGRectIsInfinite(v30))
        {
          CGSize v17 = *(CGSize *)(MEMORY[0x1E4F1DB10] + 16);
          v28.origin = (CGPoint)*MEMORY[0x1E4F1DB10];
          v28.size = v17;
          uint64_t v18 = 3;
        }
        else
        {
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.CGFloat width = width;
          v28.size.CGFloat height = height;
          uint64_t v18 = 0;
        }
        NU::RectT<long>::RectT(v27, &v28, v18);
        v23.origin = (CGPoint)v27[0];
        v23.size = (CGSize)v27[1];
        v20 = [NUImageGeometry alloc];
        uint64_t v21 = [v6 orientation];
        CGRect v28 = v23;
        v19 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v20, "initWithExtent:renderScale:orientation:", &v28, v8, v10, v21);
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = v6;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isGeometryNode
{
  v2 = [(NURenderNode *)self inputs];
  uint64_t v3 = [v2 count];

  return v3 != 1;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  if (a3 == 7 && [(NUFilterNode *)self gainMapMode])
  {
    BOOL v7 = @"HDRGainMap";
    *a4 = +[NUError failureError:@"Filter node cannot propagate original auxiliary data" object:@"HDRGainMap"];

    uint64_t v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NUFilterNode;
    uint64_t v8 = [(NURenderNode *)&v10 _evaluateAuxiliaryImageForType:a3 error:a4];
  }

  return v8;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  if (a3 == 7 && [(NUFilterNode *)self gainMapMode]) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NUFilterNode;
  return [(NURenderNode *)&v6 canPropagateOriginalAuxiliaryData:a3];
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v4 = a3;
  if ([v4 auxiliaryImageType] == 1 || !objc_msgSend(v4, "auxiliaryImageType"))
  {
    unint64_t v9 = [v4 evaluationMode];
    BOOL v6 = v9 >= 4;
    char v7 = v9 & 0xF;
    unsigned int v8 = 11;
  }
  else
  {
    if ([v4 auxiliaryImageType] != 7)
    {
      BOOL v11 = 0;
      goto LABEL_9;
    }
    unint64_t v5 = [(NUFilterNode *)self gainMapMode];
    BOOL v6 = v5 >= 4;
    char v7 = v5 & 0xF;
    unsigned int v8 = 6;
  }
  int v10 = (v8 >> v7) & 1;
  if (v6) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10;
  }
LABEL_9:

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NUFilterNode;
  uint64_t v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  unsigned int v8 = (void *)v7;
  if (v7)
  {
    objc_storeStrong((id *)(v7 + 168), self->_filterName);
    v8[22] = self->_gainMapMode;
  }

  return v8;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    uint64_t v24 = NUAssertLogger_17835();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_17835();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v31;
        __int16 v46 = 2114;
        v47 = v35;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGRect v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFilterNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 59, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"error != nil");
  }
  objc_super v10 = v9;
  BOOL v11 = [(NURenderNode *)self inputs];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    id v13 = v10;
    if ([v13 evaluationMode] == 3)
    {
      v20 = (void *)[v13 copy];

      [v20 setEvaluationMode:1];
      id v13 = v20;
    }
    v43.receiver = self;
    v43.super_class = (Class)NUFilterNode;
    [(NURenderNode *)&v43 nodeByReplayingAgainstCache:v8 pipelineState:v13 error:a5];
    goto LABEL_17;
  }
  id v13 = [(NURenderNode *)self dominantInputKey];
  uint64_t v14 = [v10 auxiliaryImageType];
  if (v14 == 7)
  {
    int64_t v15 = [(NUFilterNode *)self gainMapMode];
    switch(v15)
    {
      case 3:
        v22 = [(NUFilterNode *)self filterName];
        *a5 = +[NUError unsupportedError:@"Gain map is disabled" object:v22];

        uint64_t v21 = 0;
        goto LABEL_23;
      case 2:
        uint64_t v18 = (void *)[v10 copy];
        [v18 setAuxiliaryImageType:1];
        v41.receiver = self;
        v41.super_class = (Class)NUFilterNode;
        uint64_t v19 = [(NURenderNode *)&v41 nodeByReplayingAgainstCache:v8 pipelineState:v18 error:a5];
        goto LABEL_20;
      case 1:
        v42[0] = self;
        v42[1] = NUFilterNode;
        id v16 = (objc_super *)v42;
LABEL_16:
        [(objc_super *)v16 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
        uint64_t v21 = LABEL_17:;
        goto LABEL_23;
    }
  }
  if (v14 == 1 || !v13)
  {
    v40.receiver = self;
    v40.super_class = (Class)NUFilterNode;
    id v16 = &v40;
    goto LABEL_16;
  }
  CGSize v17 = [(NURenderNode *)self inputForKey:v13];
  uint64_t v18 = v17;
  if (!v17)
  {
    +[NUError missingError:@"missing dominant input" object:self];
    uint64_t v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  uint64_t v19 = [v17 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
LABEL_20:
  uint64_t v21 = (void *)v19;
LABEL_22:

LABEL_23:

  return v21;
}

- (NUFilterNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v20 = NUAssertLogger_17835();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "filterName != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGRect v23 = NUAssertLogger_17835();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        CGRect v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v27;
        __int16 v39 = 2114;
        objc_super v40 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFilterNode initWithFilterName:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 37, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"filterName != nil");
  }
  BOOL v11 = v10;
  uint64_t v12 = [v9 objectForKeyedSubscript:@"__gainMapMode"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = [v9 objectForKeyedSubscript:@"__gainMapMode"];
    self->_gainMapMode = [v14 integerValue];

    int64_t v15 = (void *)[v9 mutableCopy];
    [v15 setObject:0 forKeyedSubscript:@"__gainMapMode"];

    id v9 = v15;
  }
  v36.receiver = self;
  v36.super_class = (Class)NUFilterNode;
  id v16 = [(NURenderNode *)&v36 initWithSettings:v9 inputs:v11];
  uint64_t v17 = [v8 copy];
  filterName = v16->_filterName;
  v16->_filterName = (NSString *)v17;

  return v16;
}

- (NUFilterNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17882);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    BOOL v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17882);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17882);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  CGRect v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  uint64_t v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  objc_super v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  objc_super v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFilterNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 30, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end