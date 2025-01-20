@interface NUHDRGainMapHeadroomNode
+ (double)_updateContentHeadroom:(double)a3 withOffset:(double)a4;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUHDRGainMapHeadroomNode)initWithInput:(id)a3 settings:(id)a4;
- (NUHDRGainMapHeadroomNode)initWithSettings:(id)a3 inputs:(id)a4;
- (double)headroomOffset;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageProperties:(id *)a3;
- (id)inputNode;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUHDRGainMapHeadroomNode

- (id)_evaluateImage:(id *)a3
{
  v4 = [(NUHDRGainMapHeadroomNode *)self inputNode];
  v5 = [v4 outputImage:a3];

  return v5;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUHDRGainMapHeadroomNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)NUHDRGainMapHeadroomNode;
  v6 = [(NURenderNode *)&v16 _evaluateAuxiliaryImageForType:a3 error:a4];
  v7 = v6;
  if (v6)
  {
    if (a3 == 7)
    {
      objc_super v8 = (const CGImageMetadata *)[v6 metadata];
      uint64_t v15 = 0x3FF0000000000000;
      if (+[_NUImageProperties getGainMapHeadroom:&v15 fromMetadata:v8])
      {
        CGMutableImageMetadataRef MutableCopy = CGImageMetadataCreateMutableCopy(v8);
        +[_NUImageProperties getGainMapHeadroom:&v15 fromMetadata:v8];
        v10 = objc_opt_class();
        double v11 = *(double *)&v15;
        [(NUHDRGainMapHeadroomNode *)self headroomOffset];
        [v10 _updateContentHeadroom:v11 withOffset:v12];
        +[_NUImageProperties setGainMapHeadroom:toMetadata:](_NUImageProperties, "setGainMapHeadroom:toMetadata:", MutableCopy);
        uint64_t v13 = [v7 auxiliaryImageByUpdatingMetadata:MutableCopy];

        v7 = (void *)v13;
      }
    }
  }

  return v7;
}

- (id)_evaluateImageProperties:(id *)a3
{
  v5 = [(NUHDRGainMapHeadroomNode *)self inputNode];
  v6 = [v5 imageProperties:a3];
  v7 = (void *)[v6 copy];

  if (v7)
  {
    objc_super v8 = objc_opt_class();
    [v7 gainMapHeadroom];
    double v10 = v9;
    [(NUHDRGainMapHeadroomNode *)self headroomOffset];
    [v8 _updateContentHeadroom:v10 withOffset:v11];
    objc_msgSend(v7, "setGainMapHeadroom:");
    id v12 = v7;
  }

  return v7;
}

- (double)headroomOffset
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"headroomOffset"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return v3;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 evaluationMode] == 1 && objc_msgSend(v3, "auxiliaryImageType") == 1;

  return v4;
}

- (NUHDRGainMapHeadroomNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v17 = NUAssertLogger_9740();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v39 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_9740();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v24;
        __int16 v40 = 2114;
        v41 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapHeadroomNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 1036, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"input != nil");
  }
  objc_super v8 = v7;
  double v9 = [v7 objectForKeyedSubscript:@"headroomOffset"];
  [v9 doubleValue];
  double v11 = v10;

  v36 = @"headroomOffset";
  id v12 = [NSNumber numberWithDouble:v11];
  v37 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  uint64_t v34 = *MEMORY[0x1E4F1E480];
  id v35 = v6;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v33.receiver = self;
  v33.super_class = (Class)NUHDRGainMapHeadroomNode;
  uint64_t v15 = [(NURenderNode *)&v33 initWithSettings:v13 inputs:v14];

  return v15;
}

- (NUHDRGainMapHeadroomNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
  }
  objc_super v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    double v9 = NSString;
    double v10 = v8;
    double v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    objc_super v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x1E4F29060];
    v18 = v16;
    v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  v18 = v21;
  v25 = [v23 callStackSymbols];
  id v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapHeadroomNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 1032, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

+ (double)_updateContentHeadroom:(double)a3 withOffset:(double)a4
{
  double v5 = a3;
  if (a4 >= 0.0)
  {
    if (a4 > 0.0)
    {
      +[NUGlobalSettings maxGainMapHeadroom];
      return v5 + a4 * (v6 - v5);
    }
  }
  else if (a3 + a4 * (a3 + -1.0) >= 1.0)
  {
    return a3 + a4 * (a3 + -1.0);
  }
  else
  {
    return 1.0;
  }
  return v5;
}

@end