@interface NULivePhotoSourceContainerNode
- (NULivePhotoSourceContainerNode)initWithAssetIdentifier:(id)a3;
- (NULivePhotoSourceContainerNode)initWithImageContainerNode:(id)a3 videoContainerNode:(id)a4 assetIdentifier:(id)a5;
- (id)containerNodeForPipelineState:(id)a3;
- (id)primarySourceNode;
- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5;
- (id)sourceNodeForPipelineState:(id)a3 error:(id *)a4;
@end

@implementation NULivePhotoSourceContainerNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_video, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (id)sourceNodeForPipelineState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(NULivePhotoSourceContainerNode *)self containerNodeForPipelineState:v6];
  v8 = [v7 sourceNodeForPipelineState:v6 error:a4];

  return v8;
}

- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(NULivePhotoSourceContainerNode *)self containerNodeForPipelineState:v8];
  v10 = [v9 resolveSourceNodeForPipelineState:v8 foundScale:a4 error:a5];

  return v10;
}

- (id)containerNodeForPipelineState:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 mediaComponentType];
  switch(v6)
  {
    case 1:
      v14 = &OBJC_IVAR___NULivePhotoSourceContainerNode__image;
LABEL_11:
      id v3 = *(id *)((char *)&self->super.super.super.isa + *v14);
      break;
    case 2:
      v14 = &OBJC_IVAR___NULivePhotoSourceContainerNode__video;
      goto LABEL_11;
    case 0:
      v7 = NUAssertLogger_7355();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [NSString stringWithFormat:@"%@ asked for NUMediaComponentTypeUnknown", self];
        *(_DWORD *)buf = 138543362;
        v26 = v8;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v10 = NUAssertLogger_7355();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v11)
        {
          v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E4F29060];
          id v18 = v16;
          v19 = [v17 callStackSymbols];
          v20 = [v19 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v26 = v16;
          __int16 v27 = 2114;
          v28 = v20;
          _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v11)
      {
        v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v26 = v13;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode containerNodeForPipelineState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 417, @"%@ asked for NUMediaComponentTypeUnknown", v21, v22, v23, v24, (uint64_t)self);
  }

  return v3;
}

- (id)primarySourceNode
{
  return (id)[(NUSourceContainerNode *)self->_image primarySourceNode];
}

- (NULivePhotoSourceContainerNode)initWithImageContainerNode:(id)a3 videoContainerNode:(id)a4 assetIdentifier:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = (NUSourceContainerNode *)a3;
  v9 = (NUSourceContainerNode *)a4;
  id v10 = a5;
  if (!v8)
  {
    v20 = NUAssertLogger_7355();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      v54 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_7355();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v34;
        __int16 v55 = 2114;
        v56 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode initWithImageContainerNode:videoContainerNode:assetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 386, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"image != nil");
  }
  if (!v9)
  {
    __int16 v27 = NUAssertLogger_7355();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "video != nil");
      *(_DWORD *)buf = 138543362;
      v54 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_7355();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v43;
        __int16 v55 = 2114;
        v56 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode initWithImageContainerNode:videoContainerNode:assetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 387, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"video != nil");
  }
  BOOL v11 = v10;
  v52.receiver = self;
  v52.super_class = (Class)NULivePhotoSourceContainerNode;
  v12 = [(NUSourceContainerNode *)&v52 initWithAssetIdentifier:v10];
  image = v12->_image;
  v12->_image = v8;
  v14 = v8;

  video = v12->_video;
  v12->_video = v9;
  v16 = v9;

  v17 = [(NUSourceContainerNode *)v16 primarySourceNode];

  id v18 = [(NUSourceContainerNode *)v14 primarySourceNode];

  [v17 setOriginalNode:v18];
  return v12;
}

- (NULivePhotoSourceContainerNode)initWithAssetIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSString;
    v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    BOOL v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    v15 = v13;
    v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  v15 = v18;
  uint64_t v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode initWithAssetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 381, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

@end