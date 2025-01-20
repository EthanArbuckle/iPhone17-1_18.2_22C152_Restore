@interface NUSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (BOOL)isGeometryNode;
- (BOOL)isValid:(id *)a3;
- (BOOL)load:(id *)a3;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NSString)auxiliaryImageTypeString;
- (NURenderNode)originalNode;
- (NUSourceDerivation)sourceDerivation;
- (NUSourceNode)initWithSettings:(id)a3;
- (id)_addOrientationNode:(id)a3 sourceSettings:(id)a4 error:(id *)a5;
- (id)_addResampleNode:(id)a3 subsampleNode:(id)a4;
- (id)_addScaleNode:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6;
- (id)_addStyleReverseNode:(id)a3 pipelineState:(id)a4 sourceSettings:(id)a5;
- (id)_evaluateGeometrySpaceMap:(id *)a3;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageProperties:(id *)a3;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoCompositionWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_evaluateVideoPropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)pipelineOptionsForPipelineState:(id)a3 error:(id *)a4;
- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7;
- (id)preparedNodeWithSourceNode:(id)a3 sourceSettings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4;
- (int64_t)auxiliaryImageType;
- (int64_t)normalizeSubsampleFactor:(int64_t)a3;
- (int64_t)sourceOrientation;
- (void)setOriginalNode:(id)a3;
- (void)setSourceDerivation:(id)a3;
@end

@implementation NUSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDerivation, 0);

  objc_destroyWeak((id *)&self->_originalNode);
}

- (void)setSourceDerivation:(id)a3
{
}

- (NUSourceDerivation)sourceDerivation
{
  return (NUSourceDerivation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOriginalNode:(id)a3
{
}

- (NURenderNode)originalNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalNode);

  return (NURenderNode *)WeakRetained;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  return [(NUSourceNode *)self _evaluateVideoCompositionWithSourceOptions:MEMORY[0x1E4F1CC08] error:a3];
}

- (id)_evaluateVideoProperties:(id *)a3
{
  return [(NUSourceNode *)self _evaluateVideoPropertiesWithSourceOptions:MEMORY[0x1E4F1CC08] error:a3];
}

- (id)_evaluateImageGeometry:(id *)a3
{
  return [(NUSourceNode *)self _evaluateImageGeometryWithSourceOptions:MEMORY[0x1E4F1CC08] error:a3];
}

- (id)_evaluateImageProperties:(id *)a3
{
  return [(NUSourceNode *)self _evaluateImagePropertiesWithSourceOptions:MEMORY[0x1E4F1CC08] error:a3];
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v5 = 1;
  v3 = [(NUSourceNode *)self _evaluateImageWithSourceOptions:MEMORY[0x1E4F1CC08] subsampleFactor:&v5 error:a3];

  return v3;
}

- (id)_evaluateVideoCompositionWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v8 = NUAssertLogger_7355();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_7355();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateVideoCompositionWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 979, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"error != nil");
  }
  v6 = v5;
  *a4 = +[NUError unsupportedError:@"_evaluateVideoCompositionWithSourceOptions not implemented" object:objc_opt_class()];

  return 0;
}

- (id)_evaluateVideoPropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v8 = NUAssertLogger_7355();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_7355();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateVideoPropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 972, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"error != nil");
  }
  v6 = v5;
  *a4 = +[NUError unsupportedError:@"_evaluateVideoPropertiesWithSourceOptions not implemented" object:objc_opt_class()];

  return 0;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v8 = NUAssertLogger_7355();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_7355();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 965, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"error != nil");
  }
  v6 = v5;
  *a4 = +[NUError unsupportedError:@"_evaluateImagePropertiesWithSourceOptions not implemented" object:objc_opt_class()];

  return 0;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a5)
  {
    v9 = NUAssertLogger_7355();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_7355();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 958, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != nil");
  }
  v7 = v6;
  *a5 = +[NUError unsupportedError:@"_evaluateImageWithSourceOptions not implemented" object:objc_opt_class()];

  return 0;
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  v4 = objc_alloc_init(NUGeometrySpaceMap);
  id v5 = objc_alloc_init(NUSpace);
  id v6 = [(NURenderNode *)self spaceMapKey];
  [(NUGeometrySpaceMap *)v4 setSpace:v5 forKey:v6];

  return v4;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(NUSourceNode *)self originalNode];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 outputImageGeometry:a4];
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = [v9 orientation];
      BOOL v12 = [(NUSourceNode *)self sourceDerivation];
      uint64_t v13 = objc_msgSend(v12, "orientationFromOriginal:derivativeOrientation:", v11, -[NUSourceNode sourceOrientation](self, "sourceOrientation"));

      uint64_t v14 = 6;
      if (v13 != 8) {
        uint64_t v14 = v13;
      }
      if (v13 == 6) {
        uint64_t v15 = 8;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v16 = NUOrientationConcat(v11, v15);
      [v10 extent];
      uint64_t v44 = NUOrientationTransformImageSize(v16, v45, v46);
      uint64_t v18 = v17;
      uint64_t v19 = [v10 scaledSize];
      uint64_t v21 = NUOrientationTransformImageSize(v16, v19, v20);
      uint64_t v23 = v22;
      uint64_t v24 = [(NUSourceNode *)self pixelSizeWithSourceOptions:v6];
      uint64_t v26 = v25;
      __int16 v27 = [(NUSourceNode *)self sourceDerivation];
      uint64_t v28 = objc_msgSend(v27, "scaleFromOriginalSize:derivativeSize:", v21, v23, v24, v26);
      uint64_t v30 = v29;

      uint64_t v31 = [v10 renderScale];
      uint64_t v33 = NUScaleMultiply(v31, v32, v28, v30);
      uint64_t v35 = v34;
      v36 = [NUImageGeometry alloc];
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = v44;
      uint64_t v50 = v18;
      v37 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v36, "initWithExtent:renderScale:orientation:", &v47, v33, v35, v13);
    }
    else
    {
      v37 = 0;
    }
  }
  else
  {
    uint64_t v38 = [(NUSourceNode *)self pixelSizeWithSourceOptions:v6];
    uint64_t v40 = v39;
    v41 = [NUImageGeometry alloc];
    int64_t v42 = [(NUSourceNode *)self sourceOrientation];
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = v38;
    uint64_t v50 = v40;
    v37 = [(NUImageGeometry *)v41 initWithExtent:&v47 renderScale:NUScaleOne orientation:v42];
  }

  return v37;
}

- (id)preparedNodeWithSourceNode:(id)a3 sourceSettings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  return [(NUSourceNode *)self _addOrientationNode:a3 sourceSettings:a4 error:a6];
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!a7)
  {
    uint64_t v29 = NUAssertLogger_7355();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v79 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger_7355();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        uint64_t v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v53 = [v51 callStackSymbols];
        v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v79 = v50;
        __int16 v80 = 2114;
        v81 = v54;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v79 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 839, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"error != nil");
  }
  if (!v13)
  {
    v36 = NUAssertLogger_7355();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineState != nil");
      *(_DWORD *)buf = 138543362;
      v79 = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v39 = NUAssertLogger_7355();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v79 = v59;
        __int16 v80 = 2114;
        v81 = v63;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v79 = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 840, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"pipelineState != nil");
  }
  if (!v12)
  {
    v43 = NUAssertLogger_7355();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceContainer != nil");
      *(_DWORD *)buf = 138543362;
      v79 = v44;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v46 = NUAssertLogger_7355();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        v71 = [v69 callStackSymbols];
        v72 = [v71 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v79 = v68;
        __int16 v80 = 2114;
        v81 = v72;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      uint64_t v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v79 = v49;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 841, @"Invalid parameter not satisfying: %s", v73, v74, v75, v76, (uint64_t)"sourceContainer != nil");
  }
  uint64_t v16 = v15;
  if ([(NUSourceNode *)self load:a7])
  {
    uint64_t v17 = [(NUSourceNode *)self originalNode];
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v17 load:a7]
      || ![(NUSourceNode *)self supportsPipelineState:v13 error:a7])
    {
      __int16 v27 = 0;
    }
    else
    {
      uint64_t v18 = [(NUSourceNode *)self sourceOptionsForSettings:v16 error:a7];
      if (v18)
      {
        uint64_t v19 = [v16 objectForKeyedSubscript:@"__addTags"];
        int v20 = [v19 BOOLValue];

        if (v20)
        {
          uint64_t v21 = [v13 currentGroup];
          id v22 = (id)[v21 addTag:@"__SourceOrigin" forNode:self];
        }
        uint64_t v23 = [[NUSubsampleNode alloc] initWithPreparedSource:self container:v12 pipelineSettings:v14 sourceOptions:v18];
        uint64_t v24 = [(NUSourceNode *)self _addResampleNode:v23 subsampleNode:v23];
        [(NUSourceNode *)self _addStyleReverseNode:v24 pipelineState:v13 sourceSettings:v16];
        uint64_t v25 = v77 = v18;

        uint64_t v26 = [(NUSourceNode *)self _addScaleNode:v25 pipelineState:v13 pipelineSettings:v14 sourceSettings:v16];

        uint64_t v18 = v77;
        __int16 v27 = [(NUSourceNode *)self preparedNodeWithSourceNode:v26 sourceSettings:v16 pipelineState:v13 error:a7];
      }
      else
      {
        __int16 v27 = 0;
      }
    }
  }
  else
  {
    __int16 v27 = 0;
  }

  return v27;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)_addStyleReverseNode:(id)a3 pipelineState:(id)a4 sourceSettings:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 mediaComponentType];
  id v12 = [v10 objectForKeyedSubscript:@"revertToOriginalStyle"];

  LODWORD(v10) = [v12 BOOLValue];
  if (!v10)
  {
    uint64_t v17 = (NUStyleTransferReverseNode *)v8;
    goto LABEL_34;
  }
  if (v11 != 1)
  {
    id v36 = 0;
    id v13 = [(NURenderNode *)self videoProperties:&v36];
    id v14 = v36;
    if (!v13)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_319);
      }
      id v22 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v14;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "*** failed to load video properties: %@", buf, 0xCu);
      }
      id v13 = 0;
      goto LABEL_30;
    }
    uint64_t v18 = [v13 metadataItemForKey:NUQuicktimeMetadataKey_SmartStyleRenderingBypassed];
    uint64_t v19 = [v18 numberValue];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_319);
      }
      uint64_t v21 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9892000, v21, OS_LOG_TYPE_INFO, "Bypassing revert for video frame", buf, 2u);
      }
    }
    else
    {
      uint64_t v23 = [v13 videoCorruptionInfo];
      int v24 = PFExists();

      if (!v24)
      {

        goto LABEL_30;
      }
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_319);
      }
      uint64_t v25 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Bypassing revert due to corrupted video track", buf, 2u);
      }
    }
    uint64_t v17 = (NUStyleTransferReverseNode *)v8;

    goto LABEL_28;
  }
  id v37 = 0;
  id v13 = [(NURenderNode *)self imageProperties:&v37];
  id v14 = v37;
  if (!v13)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_319);
    }
    id v15 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v14;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "*** failed to load image properties: %@", buf, 0xCu);
    }
  }
  uint64_t v16 = [v13 rawProperties];

  if (v16)
  {
    uint64_t v17 = (NUStyleTransferReverseNode *)v8;
LABEL_28:

    goto LABEL_34;
  }
LABEL_30:

  uint64_t v26 = [NUStyleTransferReverseNode alloc];
  uint64_t v17 = [(NUStyleTransferReverseNode *)v26 initWithInput:v8 settings:MEMORY[0x1E4F1CC08]];
  if (v11 == 1)
  {
    __int16 v27 = [NUProviderCacheNode alloc];
    v38[0] = @"auxiliaryImageType";
    uint64_t v28 = @"None";
    v39[0] = @"None";
    v38[1] = @"pixelFormat";
    uint64_t v29 = +[NUPixelFormat A2RGB10];
    v39[1] = v29;
    v38[2] = @"colorSpace";
    uint64_t v30 = +[NUColorSpace displayP3ColorSpace];
    v39[2] = v30;
    v38[3] = @"onlyCacheWhenAtOneToOne";
    int v31 = [v9 lowMemoryMode];
    uint64_t v32 = MEMORY[0x1E4F1CC28];
    if (!v31) {
      uint64_t v32 = MEMORY[0x1E4F1CC38];
    }
    v38[4] = @"keepCacheWhenAtOneToOne";
    v39[3] = v32;
    v39[4] = MEMORY[0x1E4F1CC38];
    BOOL v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:5];
    uint64_t v34 = [(NUCacheNode *)v27 initWithInput:v17 settings:v33];

    uint64_t v17 = (NUStyleTransferReverseNode *)v34;
  }
LABEL_34:

  return v17;
}

BOOL __66__NUSourceNode__addStyleReverseNode_pipelineState_sourceSettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (id)_addOrientationNode:(id)a3 sourceSettings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 objectForKeyedSubscript:@"skipOrientation"];
  uint64_t v11 = [v10 BOOLValue];

  int64_t v12 = +[NUSourceOrientationNode originalOrientationToApplyToSource:self skipOrientation:v11 error:a5];
  if ((unint64_t)(v12 - 1) > 7) {
    id v13 = 0;
  }
  else {
    id v13 = [[NUSourceOrientationNode alloc] initWithInput:v8 source:self settings:v9 orientation:v12];
  }

  return v13;
}

- (id)_addScaleNode:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 objectForKeyedSubscript:@"nativeScale"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    id v15 = [[NUNativeScaleNode alloc] initWithInput:v9];
  }
  else
  {
    uint64_t v16 = [v10 sampleMode];
    uint64_t v18 = *((void *)&NUScaleUnknown + 1);
    uint64_t v17 = NUScaleUnknown;
    long long v41 = NUScaleUnknown;
    uint64_t v19 = [v11 objectForKeyedSubscript:@"scale"];

    if (v19)
    {
      if ([v10 scale] < 1 || v20 <= 0)
      {
        uint64_t v25 = NUAssertLogger_7355();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = [NSString stringWithFormat:@"Invalid pipelineState scale when applying override: %@", v11];
          *(_DWORD *)buf = 138543362;
          v43 = v26;
          _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = NUAssertLogger_7355();
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v29)
          {
            uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            BOOL v33 = (void *)MEMORY[0x1E4F29060];
            id v34 = v32;
            uint64_t v35 = [v33 callStackSymbols];
            id v36 = [v35 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v43 = v32;
            __int16 v44 = 2114;
            uint64_t v45 = v36;
            _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v29)
        {
          uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v31 = [v30 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v43 = v31;
          _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUSourceNode _addScaleNode:pipelineState:pipelineSettings:sourceSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 738, @"Invalid pipelineState scale when applying override: %@", v37, v38, v39, v40, (uint64_t)v11);
      }
      uint64_t v17 = [v10 scale];
      uint64_t v18 = v21;
      +[NUSubsampleNode subsampleFactorForScale:additionalScale:](NUSubsampleNode, "subsampleFactorForScale:additionalScale:", v17, v21, &v41);
    }
    id v22 = [NUScaleNode alloc];
    id v15 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v22, "initWithTargetScale:effectiveScale:sampleMode:input:", v17, v18, v41, v16, v9);
  }
  uint64_t v23 = v15;

  return v23;
}

- (id)_addResampleNode:(id)a3 subsampleNode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NUResampleNode alloc] initWithPreparedInput:v6 subsampleNode:v5];

  return v7;
}

- (id)pipelineOptionsForPipelineState:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (int64_t)normalizeSubsampleFactor:(int64_t)a3
{
  return a3;
}

- (NSString)auxiliaryImageTypeString
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"auxiliaryImageType"];

  return (NSString *)v3;
}

- (int64_t)auxiliaryImageType
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"auxiliaryImageType"];
  int64_t v4 = NUAuxiliaryImageTypeFromString(v3);

  return v4;
}

- (int64_t)sourceOrientation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    int64_t v4 = v2;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v10 = (void *)MEMORY[0x1E4F29060];
    id v11 = v9;
    id v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  int v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  id v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  __int16 v27 = specific;
  __int16 v28 = 2114;
  BOOL v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUSourceNode sourceOrientation]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 684, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (BOOL)load:(id *)a3
{
  return 1;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v9 = NUAssertLogger_7355();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v12 = NUAssertLogger_7355();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v16;
        __int16 v28 = 2114;
        BOOL v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      int v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 661, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != nil");
  }
  BOOL v5 = -[NUSourceNode load:](self, "load:");
  if (v5)
  {
    if ([(NUSourceNode *)self pixelSizeWithSourceOptions:MEMORY[0x1E4F1CC08]]) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      id v8 = +[NUError invalidError:@"Invalid size" object:self];
      LOBYTE(v5) = 0;
      *a3 = v8;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  int64_t v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = NSString;
    uint64_t v6 = v4;
    BOOL v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v12 = (void *)MEMORY[0x1E4F29060];
    BOOL v13 = v11;
    int v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v29 = specific;
  __int16 v30 = 2114;
  int v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NUSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 656, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (BOOL)isGeometryNode
{
  return 1;
}

- (NUSourceNode)initWithSettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUSourceNode;
  id v3 = [(NURenderNode *)&v7 initWithSettings:a3 inputs:MEMORY[0x1E4F1CC08]];
  int64_t v4 = objc_alloc_init(NUDefaultSourceDerivation);
  sourceDerivation = v3->_sourceDerivation;
  v3->_sourceDerivation = (NUSourceDerivation *)v4;

  return v3;
}

@end