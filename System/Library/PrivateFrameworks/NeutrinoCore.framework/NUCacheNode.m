@interface NUCacheNode
+ (id)cacheDirectoryURL;
+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
+ (id)registry;
+ (int64_t)_maxCacheDirectorySize;
+ (void)_ensureCacheDirectoryURL:(id)a3;
+ (void)_pruneCacheDirectory:(id)a3 toSize:(int64_t)a4;
+ (void)clearCacheDirectory;
- (BOOL)installTemporaryURL:(id)a3 intoPersistentURL:(id)a4 error:(id *)a5;
- (BOOL)isEqualToRenderNode:(id)a3;
- (BOOL)isResolved;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4;
- (BOOL)wantsDependentJob;
- (NSString)cacheIdentifier;
- (NSString)cachedCacheIdentifier;
- (NUCacheNode)initWithInput:(id)a3 settings:(id)a4;
- (NUCacheNode)initWithInput:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5;
- (NUCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5;
- (NUCacheNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NURenderNode)inputNode;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)descriptionSubClassHook;
- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4;
- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)inputGeometryForPipelineState:(id)a3 error:(id *)a4;
- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)outputGeometryForPipelineState:(id)a3 error:(id *)a4;
- (id)persistentURL;
- (id)persistentURLPrefix;
- (id)resolvedSourceNode:(id *)a3;
- (id)setupDependentJobFromRequest:(id)a3 originalRequest:(id)a4 error:(id *)a5;
- (id)temporaryURLPrefix;
- (int64_t)auxiliaryImageType;
- (int64_t)sampleMode;
- (int64_t)subsampleFactor;
- (int64_t)subsampleFactorForScale:(id)a3;
- (unint64_t)_hash;
- (void)_resolveWithSourceNode:(id)a3 error:(id)a4;
- (void)nu_updateDigest:(id)a3;
- (void)resolveSourceWithResponse:(id)a3;
- (void)resolveWithSourceNode:(id)a3 error:(id)a4;
- (void)setCachedCacheIdentifier:(id)a3;
@end

@implementation NUCacheNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceError, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCachedCacheIdentifier:(id)a3
{
}

- (NSString)cachedCacheIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (int64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (BOOL)requiresVideoComposition
{
  return 0;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  v4 = -[NUCacheNode resolvedSourceNode:](self, "resolvedSourceNode:");
  v5 = [v4 outputVideoComposition:a3];

  return v5;
}

- (id)_evaluateVideo:(id *)a3
{
  v4 = -[NUCacheNode resolvedSourceNode:](self, "resolvedSourceNode:");
  v5 = [v4 outputVideo:a3];

  return v5;
}

- (id)_evaluateImage:(id *)a3
{
  v4 = -[NUCacheNode resolvedSourceNode:](self, "resolvedSourceNode:");
  v5 = [v4 _evaluateImage:a3];

  return v5;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v4 = [(NUCacheNode *)self inputNode];
  v5 = [v4 outputImageGeometry:a3];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (void)resolveSourceWithResponse:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = NUAssertLogger_14000();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "response != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_14000();
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
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode resolveSourceWithResponse:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 531, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"response != nil");
  }
  v5 = v4;
  id v31 = 0;
  v6 = [v4 result:&v31];
  id v7 = v31;
  if (v6)
  {
    v8 = [(NUCacheNode *)self persistentURL];
    v9 = [v6 destinationURL];
    id v30 = 0;
    BOOL v10 = [(NUCacheNode *)self installTemporaryURL:v9 intoPersistentURL:v8 error:&v30];
    id v11 = v30;

    if (v10)
    {
      id v29 = 0;
      BOOL v12 = [(NUCacheNode *)self tryLoadPersistentURL:v8 error:&v29];
      id v7 = v29;

      id v11 = v7;
      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = v11;
    }
    [(NUCacheNode *)self resolveWithSourceNode:0 error:v11];
LABEL_9:

    goto LABEL_10;
  }
  [(NUCacheNode *)self resolveWithSourceNode:0 error:v7];
LABEL_10:
}

- (BOOL)installTemporaryURL:(id)a3 intoPersistentURL:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    v21 = NUAssertLogger_14000();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      id v41 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_14000();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        id v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v41 = v28;
        __int16 v42 = 2114;
        v43 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v41 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode installTemporaryURL:intoPersistentURL:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 508, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v9 = v8;
  BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = [v10 moveItemAtURL:v7 toURL:v9 error:a5];

  if (v11)
  {
    char v12 = 1;
  }
  else
  {
    id v37 = 0;
    char v12 = [v9 checkResourceIsReachableAndReturnError:&v37];
    id v13 = v37;
    if (v12)
    {
      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v38 = *MEMORY[0x1E4F28310];
      v15 = [MEMORY[0x1E4F1C9C8] date];
      v39 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      BOOL v17 = [v9 path];
      [v14 setAttributes:v16 ofItemAtPath:v17 error:0];
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      v18 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        id v20 = *a5;
        *(_DWORD *)buf = 138412802;
        id v41 = v7;
        __int16 v42 = 2112;
        v43 = v9;
        __int16 v44 = 2112;
        id v45 = v20;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Failed to install %@ -> %@: %@", buf, 0x20u);
      }
    }
  }
  return v12;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    id v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    BOOL v10 = [v6 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v9];
    *(_DWORD *)buf = 138543362;
    id v30 = v10;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
      }
      goto LABEL_8;
    }
    if (v11 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    char v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v13 = (void *)MEMORY[0x1E4F29060];
    v14 = v12;
    v15 = [v13 callStackSymbols];
    v16 = [v15 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    id v30 = v16;
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v19 = (void *)MEMORY[0x1E4F29060];
  id v20 = specific;
  v14 = v17;
  v21 = [v19 callStackSymbols];
  id v22 = [v21 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  id v30 = specific;
  __int16 v31 = 2114;
  v32 = v22;
  _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = NSStringFromClass(v23);
  _NUAssertFailHandler((uint64_t)"-[NUCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 503, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v25, v26, v27, v28, v24);
}

- (id)persistentURL
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    id v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    char v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  id v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUCacheNode persistentURL]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 496, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)temporaryURLPrefix
{
  v3 = +[NUCacheNode cacheDirectoryURL];
  id v4 = NSString;
  v5 = [(NUCacheNode *)self cacheIdentifier];
  v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];
  uint64_t v8 = [v4 stringWithFormat:@"%@.temp.%@", v5, v7];

  v9 = [v3 URLByAppendingPathComponent:v8];

  return v9;
}

- (id)persistentURLPrefix
{
  v3 = +[NUCacheNode cacheDirectoryURL];
  id v4 = [(NUCacheNode *)self cacheIdentifier];
  v5 = [v3 URLByAppendingPathComponent:v4];

  return v5;
}

- (NSString)cacheIdentifier
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (![(NURenderNode *)self isCached])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
    }
    v3 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      v5 = v3;
      v6 = [v4 stringWithFormat:@"evaluating cacheIdentifier on a non-cached node"];
      *(_DWORD *)__int16 v28 = 138543362;
      *(void *)&v28[4] = v6;
      _os_log_impl(&dword_1A9892000, v5, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v28, 0xCu);

      uint64_t v7 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v7 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
        }
LABEL_9:
        uint64_t v8 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v14 = (void *)MEMORY[0x1E4F29060];
          id v15 = specific;
          v16 = v8;
          id v17 = [v14 callStackSymbols];
          v18 = [v17 componentsJoinedByString:@"\n"];
          *(_DWORD *)__int16 v28 = 138543618;
          *(void *)&v28[4] = specific;
          __int16 v29 = 2114;
          uint64_t v30 = v18;
          _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v28, 0x16u);

LABEL_21:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v7 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v19 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F29060];
      v16 = v19;
      uint64_t v26 = [v25 callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)__int16 v28 = 138543362;
      *(void *)&v28[4] = v27;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v28, 0xCu);

      goto LABEL_21;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUCacheNode cacheIdentifier]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 460, @"evaluating cacheIdentifier on a non-cached node", v9, v10, v11, v12, *(uint64_t *)v28);
  }
  id v20 = [(NUCacheNode *)self cachedCacheIdentifier];
  if (!v20)
  {
    uint64_t v21 = objc_alloc_init(NUDigest);
    uint64_t v22 = +[NUSoftwareVersion currentSoftwareVersion];
    uint64_t v23 = [v22 buildNumber];
    objc_msgSend(v23, "nu_updateDigest:", v21);

    [(NUCacheNode *)self nu_updateDigest:v21];
    [(NUDigest *)v21 finalize];
    id v20 = [(NUDigest *)v21 stringValue];
    [(NUCacheNode *)self setCachedCacheIdentifier:v20];
  }

  return (NSString *)v20;
}

- (id)resolvedSourceNode:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v9 = NUAssertLogger_14000();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_14000();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode resolvedSourceNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 420, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__14054;
  uint64_t v34 = __Block_byref_object_dispose__14055;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__14054;
  queue = self->_queue;
  uint64_t v30 = __Block_byref_object_dispose__14055;
  id v31 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NUCacheNode_resolvedSourceNode___block_invoke;
  block[3] = &unk_1E5D95580;
  block[4] = self;
  block[5] = buf;
  block[6] = &v26;
  dispatch_sync(queue, block);
  v6 = *(void **)(*(void *)&buf[8] + 40);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    if (v27[5]) {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, @"Failed to cache source node", self);
    }
    else {
    *a3 = +[NUError failureError:@"Cache node doesn't have cached contents" object:self];
    }
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(buf, 8);

  return v6;
}

void __34__NUCacheNode_resolvedSourceNode___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 192));
  v2 = *(void **)(a1[4] + 200);
  v3 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (void)_resolveWithSourceNode:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!self->_sourceNode)
  {
    if (v7)
    {
      [v7 setOriginalNode:self];
      uint64_t v9 = [[NUCacheNodeSourceDerivation alloc] initWithSubsampleFactor:[(NUCacheNode *)self subsampleFactor]];
      [v7 setSourceDerivation:v9];

      [(NURenderContext *)self->_renderContext cancelAllJobs];
      objc_storeStrong((id *)&self->_sourceNode, a3);
      sourceError = self->_sourceError;
      self->_sourceError = 0;
    }
    else if (!self->_sourceError)
    {
      self->_sourceNode = 0;
      objc_storeStrong((id *)&self->_sourceError, a4);
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      uint64_t v11 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v11;
        BOOL v13 = [(NUCacheNode *)self persistentURL];
        int v14 = 138412546;
        id v15 = v13;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Error preparing cache node %@: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)resolveWithSourceNode:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NUCacheNode_resolveWithSourceNode_error___block_invoke;
  block[3] = &unk_1E5D95878;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __43__NUCacheNode_resolveWithSourceNode_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveWithSourceNode:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (BOOL)isResolved
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__NUCacheNode_isResolved__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__NUCacheNode_isResolved__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 192) || *(void *)(v1 + 200)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)setupDependentJobFromRequest:(id)a3 originalRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  char v9 = [a4 priority];
  [v8 setPriority:v9];

  [v8 setSubmitTime:NUAbsoluteTime()];
  id v10 = (void *)[v8 newRenderJob];

  [v10 setReplyGroup:self->_group];
  uint64_t v11 = [NUPipelineOutputNode alloc];
  id v12 = [(NUCacheNode *)self inputNode];
  id v13 = [(NUPipelineOutputNode *)v11 initWithInput:v12];
  [v10 setPrepareNode:v13];

  int v14 = [(NURenderNode *)self outputImageGeometry:a5];
  if (v14)
  {
    [v10 setOutputGeometry:v14];
    uint64_t v15 = [v14 renderScale];
    objc_msgSend(v10, "setRenderScale:", v15, v16);
    [(NURenderContext *)self->_renderContext addJob:v10];
    id v17 = v10;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NUCacheNode *)self wantsDependentJob])
  {
    if ([(NUCacheNode *)self subsampleFactor] <= 0)
    {
      uint64_t v27 = NUAssertLogger_14000();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = [NSString stringWithFormat:@"Node hasn't been evaluated for render"];
        *(_DWORD *)buf = 138543362;
        uint64_t v50 = (uint64_t)v28;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v30 = NUAssertLogger_14000();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v31)
        {
          uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          id v35 = (void *)MEMORY[0x1E4F29060];
          id v36 = v34;
          id v37 = [v35 callStackSymbols];
          uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v50 = (uint64_t)v34;
          __int16 v51 = 2114;
          v52 = v38;
          _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v50 = (uint64_t)v33;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUCacheNode evaluateRenderDependenciesWithRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 305, @"Node hasn't been evaluated for render", v39, v40, v41, v42, v43);
    }
    if ([(NUCacheNode *)self isResolved])
    {
      id v7 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_25;
    }
    id v8 = [(NUCacheNode *)self persistentURL];
    id v44 = 0;
    BOOL v9 = [(NUCacheNode *)self tryLoadPersistentURL:v8 error:&v44];
    id v10 = v44;
    if (v9)
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v47 = *MEMORY[0x1E4F28310];
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      v48 = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      int v14 = [v8 path];
      [v11 setAttributes:v13 ofItemAtPath:v14 error:0];

      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      uint64_t v15 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v15;
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = [v8 path];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v17;
        __int16 v51 = 2114;
        v52 = v18;
        _os_log_impl(&dword_1A9892000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ cache hit: %{public}@", buf, 0x16u);
      }
      id v7 = (void *)MEMORY[0x1E4F1CC08];
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      v19 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v19;
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = [v8 path];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v21;
        __int16 v51 = 2114;
        v52 = v22;
        _os_log_impl(&dword_1A9892000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ cache miss: %{public}@", buf, 0x16u);
      }
      id v23 = [(NUCacheNode *)self newRenderRequestWithOriginalRequest:v6 error:a4];
      if (v23)
      {
        uint64_t v24 = [(NUCacheNode *)self setupDependentJobFromRequest:v23 originalRequest:v6 error:a4];
        if (v24)
        {
          uint64_t v25 = [(NUCacheNode *)self cacheIdentifier];
          id v45 = v25;
          uint64_t v46 = v24;
          id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        }
        else
        {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    id v8 = [(NUCacheNode *)self inputNode];
    id v7 = [v8 evaluateRenderDependenciesWithRequest:v6 error:a4];
  }

LABEL_25:

  return v7;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)wantsDependentJob
{
  return 1;
}

- (int64_t)sampleMode
{
  v2 = +[NUPlatform currentPlatform];
  char v3 = [v2 mainDevice];
  int64_t v4 = [v3 defaultSampleMode];

  return v4;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  v4[0] = 0;
  v4[1] = 0;
  return +[NUSubsampleNode subsampleFactorForScale:additionalScale:](NUSubsampleNode, "subsampleFactorForScale:additionalScale:", a3.var0, a3.var1, v4);
}

- (int64_t)auxiliaryImageType
{
  v2 = [(NURenderNode *)self settings];
  char v3 = [v2 objectForKeyedSubscript:@"auxiliaryImageType"];

  if (v3) {
    int64_t v4 = NUAuxiliaryImageTypeFromString(v3);
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NUCacheNode;
  BOOL v9 = [(NURenderNode *)&v15 evaluateSettings:a3 pipelineState:v8 error:a5];
  if ([v8 auxiliaryImageType] == 1)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = (void *)[v9 mutableCopy];
    unint64_t v11 = [v8 auxiliaryImageType];
    if (v11 > 0xB) {
      id v12 = @"Invalid";
    }
    else {
      id v12 = off_1E5D94190[v11];
    }
    id v13 = v12;
    [v10 setObject:v13 forKeyedSubscript:@"auxiliaryImageType"];
  }

  return v10;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v8 = a4;
  if (!a5)
  {
    uint64_t v41 = NUAssertLogger_14000();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v72 = v42;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v44 = NUAssertLogger_14000();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        __int16 v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v72 = v48;
        __int16 v73 = 2114;
        v74 = v52;
        _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      uint64_t v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v72 = v47;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 183, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"error != NULL");
  }
  BOOL v9 = v8;
  if ([(NURenderNode *)self isCached])
  {
    -[NURenderNode setEvaluatedForMode:](self, "setEvaluatedForMode:", [v9 evaluationMode]);
    id v10 = self;
  }
  else
  {
    id v69 = 0;
    unint64_t v11 = [(NUCacheNode *)self outputGeometryForPipelineState:v9 error:&v69];
    id v12 = v69;
    if (v11)
    {
      uint64_t v13 = [v9 scale];
      uint64_t v15 = v14;
      uint64_t v16 = [v11 renderScale];
      uint64_t v18 = NUScaleDivide(v13, v15, v16, v17);
      uint64_t v20 = -[NUCacheNode subsampleFactorForScale:](self, "subsampleFactorForScale:", v18, v19);
      id v68 = 0;
      uint64_t v21 = [(NUCacheNode *)self inputGeometryForPipelineState:v9 error:&v68];
      id v22 = v68;

      if (v21)
      {
        id v59 = v22;
        v60 = v11;
        v61 = v9;
        id v23 = (void *)[v9 copy];
        if ([(NUCacheNode *)self wantsDependentJob])
        {
          [v23 setEvaluationMode:0];
          [v23 setAuxiliaryImageType:1];
        }
        v58 = v21;
        uint64_t v24 = [v21 renderScale];
        uint64_t v57 = v20;
        uint64_t v26 = NUScaleMultiply(1, v20, v24, v25);
        objc_msgSend(v23, "setScale:", v26, v27);
        uint64_t v28 = v23;
        objc_msgSend(v23, "setSampleMode:", -[NUCacheNode sampleMode](self, "sampleMode"));
        v62 = objc_opt_new();
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        __int16 v29 = [(NURenderNode *)self inputs];
        uint64_t v30 = [v29 allKeys];

        uint64_t v31 = [v30 countByEnumeratingWithState:&v64 objects:v70 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v65;
          while (2)
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v65 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              id v36 = [(NURenderNode *)self inputForKey:v35];
              id v37 = [v36 nodeByReplayingAgainstCache:v63 pipelineState:v28 error:a5];

              if (!v37)
              {
                +[NUError errorWithCode:1 reason:@"[NUCacheNode nodeByReplayingAgainstCache] could not get cached input node." object:0 underlyingError:*a5];
                id v10 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                BOOL v9 = v61;
                goto LABEL_20;
              }
              [v62 setObject:v37 forKeyedSubscript:v35];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v64 objects:v70 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }

        uint64_t v38 = [(NURenderNode *)self settings];
        BOOL v9 = v61;
        uint64_t v30 = [(NUCacheNode *)self evaluateSettings:v38 pipelineState:v61 error:a5];

        if (v30)
        {
          uint64_t v39 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputs:v62 settings:v30 subsampleFactor:v57];
          id v10 = +[NURenderNode nodeFromCache:v39 cache:v63];

          -[NURenderNode setEvaluatedForMode:](v10, "setEvaluatedForMode:", [v61 evaluationMode]);
        }
        else
        {
          +[NUError errorWithCode:1 reason:@"[NUCacheNode nodeByReplayingAgainstCache] could not get resolve settings" object:0 underlyingError:*a5];
          id v10 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_20:
        id v22 = v59;
        unint64_t v11 = v60;
        uint64_t v21 = v58;
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"[NUCacheNode nodeByReplayingAgainstCache] could not get input geometry" object:v9 underlyingError:v22];
        id v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"[NUCacheNode nodeByReplayingAgainstCache] could not get output geometry" object:v9 underlyingError:v12];
      id v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = v12;
    }
  }

  return v10;
}

- (id)outputGeometryForPipelineState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 auxiliaryImageType] == 1) {
    [(NURenderNode *)self outputImageGeometry:a4];
  }
  else {
  id v7 = [(NUCacheNode *)self inputGeometryForPipelineState:v6 error:a4];
  }

  return v7;
}

- (id)inputGeometryForPipelineState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NUCacheNode *)self inputNode];
  id v8 = [v7 outputImageGeometry:a4];

  if (v8 && [v6 auxiliaryImageType] != 1)
  {
    BOOL v9 = [(NUCacheNode *)self inputNode];
    id v10 = [v9 imageProperties:a4];

    if (v10)
    {
      unint64_t v11 = objc_msgSend(v10, "auxiliaryImagePropertiesForType:", objc_msgSend(v6, "auxiliaryImageType"));
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = [v11 size];
        uint64_t v14 = [v10 size];
        uint64_t v15 = [NUImageGeometry alloc];
        [v8 extent];
        uint64_t v16 = -[NUImageGeometry initWithExtent:renderScale:](v15, "initWithExtent:renderScale:", &v21, v13, v14);

        id v8 = v10;
LABEL_11:

        id v8 = (void *)v16;
        goto LABEL_12;
      }
      unint64_t v17 = [v6 auxiliaryImageType];
      if (v17 > 0xB) {
        uint64_t v18 = @"Invalid";
      }
      else {
        uint64_t v18 = off_1E5D94190[v17];
      }
      uint64_t v19 = v18;
      *a4 = +[NUError missingError:@"Auxiliary image properties not found" object:v19];
    }
    uint64_t v16 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (BOOL)isEqualToRenderNode:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUCacheNode;
  if ([(NURenderNode *)&v8 isEqualToRenderNode:v4])
  {
    int64_t subsampleFactor = self->_subsampleFactor;
    BOOL v6 = subsampleFactor == [v4 subsampleFactor];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)nu_updateDigest:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUCacheNode;
  id v4 = a3;
  [(NURenderNode *)&v5 nu_updateDigest:v4];
  objc_msgSend(v4, "addCString:", "subsample", v5.receiver, v5.super_class);
  [v4 addBytes:&self->_subsampleFactor length:8];
}

- (unint64_t)_hash
{
  v3.receiver = self;
  v3.super_class = (Class)NUCacheNode;
  return self->_subsampleFactor ^ [(NURenderNode *)&v3 _hash];
}

- (NURenderNode)inputNode
{
  return (NURenderNode *)[(NURenderNode *)self inputForKey:@"input"];
}

- (id)descriptionSubClassHook
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14054;
  unint64_t v11 = __Block_byref_object_dispose__14055;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NUCacheNode_descriptionSubClassHook__block_invoke;
  block[3] = &unk_1E5D95E40;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(queue, block);
  id v4 = [NSString stringWithFormat:@" sourceNode : %@ %lu", v8[5], self->_subsampleFactor];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__NUCacheNode_descriptionSubClassHook__block_invoke(uint64_t a1)
{
}

- (NUCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 objectForKeyedSubscript:@"input"];

  if (!v10)
  {
    uint64_t v20 = NUAssertLogger_14000();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs[NUCacheNodeInputKey] != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v23 = NUAssertLogger_14000();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        id v37 = [v35 callStackSymbols];
        uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v54 = v34;
        __int16 v55 = 2114;
        uint64_t v56 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode initWithInputs:settings:subsampleFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 95, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"inputs[NUCacheNodeInputKey] != nil");
  }
  if (a5 < 0)
  {
    uint64_t v27 = NUAssertLogger_14000();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor >= 0");
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v30 = NUAssertLogger_14000();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        uint64_t v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        uint64_t v46 = [v44 callStackSymbols];
        uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v54 = v43;
        __int16 v55 = 2114;
        uint64_t v56 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode initWithInputs:settings:subsampleFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 96, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"subsampleFactor >= 0");
  }
  v52.receiver = self;
  v52.super_class = (Class)NUCacheNode;
  unint64_t v11 = [(NURenderNode *)&v52 initWithSettings:v9 inputs:v8];
  v11->_int64_t subsampleFactor = a5;
  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("NUCacheNode", v12);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v13;

  dispatch_group_t v15 = dispatch_group_create();
  group = v11->_group;
  v11->_group = (OS_dispatch_group *)v15;

  unint64_t v17 = objc_alloc_init(NURenderContext);
  renderContext = v11->_renderContext;
  v11->_renderContext = v17;

  return v11;
}

- (NUCacheNode)initWithInput:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = @"input";
  v15[0] = a3;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  id v12 = [(NUCacheNode *)self initWithInputs:v11 settings:v9 subsampleFactor:a5];
  return v12;
}

- (NUCacheNode)initWithInput:(id)a3 settings:(id)a4
{
  return [(NUCacheNode *)self initWithInput:a3 settings:a4 subsampleFactor:0];
}

- (NUCacheNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    unint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    dispatch_queue_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    unint64_t v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
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
  id v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  uint64_t v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  id v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCacheNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 80, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

+ (void)clearCacheDirectory
{
  id v6 = +[NUGlobalSettings cacheNodeDirectoryURL];
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v6 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5) {
    [a1 _pruneCacheDirectory:v6 toSize:0];
  }
}

+ (int64_t)_maxCacheDirectorySize
{
  return +[NUGlobalSettings cacheNodeCacheSizeLimit];
}

+ (void)_pruneCacheDirectory:(id)a3 toSize:(int64_t)a4
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v6 = *MEMORY[0x1E4F1C5F8];
  uint64_t v7 = *MEMORY[0x1E4F1C540];
  v47[0] = *MEMORY[0x1E4F1C5F8];
  v47[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  uint64_t v33 = v5;
  uint64_t v32 = v4;
  id v9 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:v8 options:1 errorHandler:0];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int64_t v14 = 0;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v11);
        }
        unint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v37 = 0;
        [v17 getResourceValue:&v37 forKey:v6 error:0];
        id v18 = v37;
        objc_msgSend(v10, "insertObject:atIndex:", v17, objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v17, 0, objc_msgSend(v10, "count"), 1024, &__block_literal_global_95));
        uint64_t v19 = [v18 integerValue];

        v14 += v19;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v13);
  }
  else
  {
    int64_t v14 = 0;
  }

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
  }
  uint64_t v20 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v43 = v14;
    __int16 v44 = 2048;
    int64_t v45 = a4;
    _os_log_impl(&dword_1A9892000, v20, OS_LOG_TYPE_DEFAULT, "Current cache size: %{iec-bytes}ld, max: %{iec-bytes}ld", buf, 0x16u);
  }
  while (v14 > a4)
  {
    uint64_t v21 = [v10 lastObject];
    id v36 = 0;
    [v21 getResourceValue:&v36 forKey:v6 error:0];
    id v22 = v36;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
    }
    id v23 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = v23;
      uint64_t v25 = [v21 path];
      uint64_t v26 = [v22 longValue];
      *(_DWORD *)buf = 138412546;
      int64_t v43 = (int64_t)v25;
      __int16 v44 = 2048;
      int64_t v45 = v26;
      _os_log_impl(&dword_1A9892000, v24, OS_LOG_TYPE_DEFAULT, "Deleting file %@, size: %{iec-bytes}ld", buf, 0x16u);
    }
    id v35 = 0;
    char v27 = [v33 removeItemAtURL:v21 error:&v35];
    id v28 = v35;
    if ((v27 & 1) == 0)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      uint64_t v29 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = v29;
        uint64_t v31 = [v21 path];
        *(_DWORD *)buf = 138543618;
        int64_t v43 = (int64_t)v31;
        __int16 v44 = 2114;
        int64_t v45 = (int64_t)v28;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Failed to delete file at path: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
    [v10 removeLastObject];
    v14 -= [v22 integerValue];
  }
}

uint64_t __43__NUCacheNode__pruneCacheDirectory_toSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C528];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  id v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v9 compare:v6];
  return v7;
}

+ (void)_ensureCacheDirectoryURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v32 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v32];

  if (v6) {
    BOOL v7 = v32 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v31 = 0;
    char v10 = [v9 removeItemAtURL:v3 error:&v31];
    id v8 = v31;

    if (v10)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      id v11 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        char v27 = v11;
        id v28 = [v3 path];
        *(_DWORD *)buf = 138412546;
        id v36 = v28;
        __int16 v37 = 2112;
        id v38 = v8;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Failed to delete file at path: %@, error: %@", buf, 0x16u);
      }
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    id v8 = 0;
  }
  v33[0] = *MEMORY[0x1E4F28318];
  uint64_t v12 = [NSNumber numberWithUnsignedInt:getuid()];
  v34[0] = v12;
  v33[1] = *MEMORY[0x1E4F282D8];
  uint64_t v13 = [NSNumber numberWithUnsignedInt:getgid()];
  v34[1] = v13;
  v33[2] = *MEMORY[0x1E4F28330];
  int64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", +[NUGlobalSettings cacheNodeFilePermissions](NUGlobalSettings, "cacheNodeFilePermissions"));
  v34[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v17 = v16;
  if (v6)
  {
    id v18 = [v3 path];
    id v29 = v8;
    char v19 = [v17 setAttributes:v15 ofItemAtPath:v18 error:&v29];
    id v20 = v29;

    if ((v19 & 1) == 0)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      uint64_t v21 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        id v22 = v21;
        id v23 = [v3 path];
        *(_DWORD *)buf = 138412546;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v20;
        id v24 = "Failed to set directory attributes at path: %@, error: %@";
LABEL_25:
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);
      }
    }
  }
  else
  {
    id v30 = v8;
    char v25 = [v16 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:v15 error:&v30];
    id v20 = v30;

    if ((v25 & 1) == 0)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_310);
      }
      uint64_t v26 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        id v22 = v26;
        id v23 = [v3 path];
        *(_DWORD *)buf = 138412546;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v20;
        id v24 = "Failed to create temporary directory at path: %@, error: %@";
        goto LABEL_25;
      }
    }
  }
}

+ (id)cacheDirectoryURL
{
  if (cacheDirectoryURL_onceToken != -1) {
    dispatch_once(&cacheDirectoryURL_onceToken, &__block_literal_global_14160);
  }
  id v3 = +[NUGlobalSettings cacheNodeDirectoryURL];
  [a1 _ensureCacheDirectoryURL:v3];
  uint64_t v4 = (void *)cacheDirectoryURL_pruneCoalescer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__NUCacheNode_cacheDirectoryURL__block_invoke_2;
  v7[3] = &unk_1E5D95558;
  id v9 = a1;
  id v5 = v3;
  id v8 = v5;
  [v4 coalesceBlock:v7];

  return v5;
}

uint64_t __32__NUCacheNode_cacheDirectoryURL__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v3 = [v1 _maxCacheDirectorySize];

  return [v1 _pruneCacheDirectory:v2 toSize:v3];
}

void __32__NUCacheNode_cacheDirectoryURL__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("NUCacheNode.prune", v0);

  uint64_t v1 = [[NUCoalescer alloc] initWithDelay:v3 queue:0.5];
  uint64_t v2 = (void *)cacheDirectoryURL_pruneCoalescer;
  cacheDirectoryURL_pruneCoalescer = (uint64_t)v1;
}

+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a3;
  char v10 = (void *)[objc_alloc((Class)a1) initWithInput:v9 settings:v8];

  return v10;
}

+ (id)registry
{
  uint64_t v2 = +[NUFactory sharedFactory];
  dispatch_queue_t v3 = [v2 cacheNodeRegistry];

  return v3;
}

@end