@interface NUTransformNode
+ (id)transformNodeWithInput:(id)a3 transform:(id)a4 error:(id *)a5;
- (BOOL)canPropagateOriginalLivePhotoMetadataTrack;
- (BOOL)isGeometryNode;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (id)_evaluateGeometrySpaceMap:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)descriptionSubClassHook;
@end

@implementation NUTransformNode

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v3 = [(NUTransformNode *)self _transformWithError:&v9];
  id v4 = v9;
  if (!v3)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_128);
    }
    v6 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "[NUTransformNode] could not evaluate transform: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v3 isIdentityImageTransform])
  {
LABEL_9:
    BOOL v5 = 0;
    goto LABEL_10;
  }
  v8.receiver = self;
  v8.super_class = (Class)NUTransformNode;
  BOOL v5 = [(NURenderNode *)&v8 canPropagateOriginalLivePhotoMetadataTrack];
LABEL_10:

  return v5;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)descriptionSubClassHook
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v7 = 0;
  uint64_t v4 = [(NUTransformNode *)self _transformWithError:&v7];
  BOOL v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@"%@ (T : %@)", *MEMORY[0x1E4F1E480], v4];
  }

  return v3;
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v13 = NUAssertLogger_24871();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_24871();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v20;
        __int16 v34 = 2114;
        v35 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTransformNode _evaluateGeometrySpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 84, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != nil");
  }
  v30.receiver = self;
  v30.super_class = (Class)NUTransformNode;
  id v31 = 0;
  BOOL v5 = [(NURenderNode *)&v30 _evaluateGeometrySpaceMap:&v31];
  id v6 = v31;
  if (v5)
  {
    id v29 = 0;
    uint64_t v7 = [(NUTransformNode *)self _transformWithError:&v29];
    id v8 = v29;

    if (v7)
    {
      [v5 applyTransform:v7];
      id v9 = objc_opt_new();
      v10 = [(NURenderNode *)self spaceMapKey];
      [v5 setSpace:v9 forKey:v10];

      id v11 = v5;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Cannot get geometry transform" object:self underlyingError:v8];
      id v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Cannot get geometry map for inputs" object:self underlyingError:v6];
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v6;
  }

  return v11;
}

- (id)_transformWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
  }
  id v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    BOOL v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = [v4 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v7];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v8;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
      }
      goto LABEL_8;
    }
    if (v9 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v11 = (void *)MEMORY[0x1E4F29060];
    uint64_t v12 = v10;
    v13 = [v11 callStackSymbols];
    v14 = [v13 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v14;
    _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v17 = (void *)MEMORY[0x1E4F29060];
  id v18 = specific;
  uint64_t v12 = v15;
  v19 = [v17 callStackSymbols];
  v20 = [v19 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v28 = specific;
  __int16 v29 = 2114;
  objc_super v30 = v20;
  _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  uint64_t v22 = NSStringFromClass(v21);
  _NUAssertFailHandler((uint64_t)"-[NUTransformNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 79, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v23, v24, v25, v26, v22);
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (BOOL)isGeometryNode
{
  return 1;
}

+ (id)transformNodeWithInput:(id)a3 transform:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = NUAssertLogger_24871();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v63 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v17 = NUAssertLogger_24871();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v35;
        __int16 v64 = 2114;
        v65 = v39;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUTransformNode transformNodeWithInput:transform:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 25, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"input != nil");
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    v21 = NUAssertLogger_24871();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "transform != nil");
      *(_DWORD *)buf = 138543362;
      v63 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_24871();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v44;
        __int16 v64 = 2114;
        v65 = v48;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUTransformNode transformNodeWithInput:transform:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 26, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"transform != nil");
  }
  if (!a5)
  {
    uint64_t v28 = NUAssertLogger_24871();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v63 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    objc_super v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_24871();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v53;
        __int16 v64 = 2114;
        v65 = v57;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUTransformNode transformNodeWithInput:transform:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 27, @"Invalid parameter not satisfying: %s", v58, v59, v60, v61, (uint64_t)"error != nil");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    id v11 = [[NUAffineTransformNode alloc] initWithAffineTransform:v10 input:v7];
LABEL_8:
    uint64_t v12 = v11;

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    id v11 = [[NUTransform3DNode alloc] initWithTransform3D:v10 input:v7];
    goto LABEL_8;
  }
  +[NUError invalidError:@"unsupported image transform type" object:v9];
  uint64_t v12 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

@end