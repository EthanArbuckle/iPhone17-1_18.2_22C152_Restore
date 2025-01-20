@interface NUScaleNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)effectiveScale;
- ($0AC6E346AE4835514AAA8AC86D8F4844)targetScale;
- (NUScaleNode)initWithInput:(id)a3 settings:(id)a4;
- (NUScaleNode)initWithPipelineState:(id)a3 input:(id)a4;
- (NUScaleNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5;
- (NUScaleNode)initWithTargetScale:(id)a3 effectiveScale:(id)a4 sampleMode:(int64_t)a5 input:(id)a6;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_settingsWithTargetScale:(id)a3 effectiveScale:(id)a4 sampleMode:(int64_t)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUScaleNode

- ($0AC6E346AE4835514AAA8AC86D8F4844)effectiveScale
{
  objc_copyStruct(v4, &self->_effectiveScale, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)targetScale
{
  objc_copyStruct(v4, &self->_targetScale, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NUScaleNode;
  v4 = [(NURenderNode *)&v13 _evaluateImageGeometry:a3];
  v5 = v4;
  if (v4)
  {
    p_targetScale = &self->_targetScale;
    if (self->_targetScale.numerator < 1 || self->_targetScale.denominator <= 0)
    {
      v10 = v4;
    }
    else
    {
      v9 = [NUImageGeometry alloc];
      [v5 extent];
      v10 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v9, "initWithExtent:renderScale:orientation:", &v12, p_targetScale->numerator, p_targetScale->denominator, [v5 orientation]);
    }
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  p_effectiveScale = &self->_effectiveScale;
  if (self->_effectiveScale.numerator < 1 || self->_effectiveScale.denominator <= 0)
  {
    v14 = NUAssertLogger_11920();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [NSString stringWithFormat:@"%@: invalid scale", self];
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_11920();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        __int16 v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 174, @"%@: invalid scale", v26, v27, v28, v29, (uint64_t)self);
  }
  v7 = [(NURenderNode *)self outputImageGeometry:"outputImageGeometry:"];
  if (v7)
  {
    v8 = [(NUAbstractScaleNode *)self inputNode];
    v9 = [v8 outputImage:a3];

    if (v9)
    {
      id v10 = v9;
      if (!NUScaleEqual(p_effectiveScale->numerator, p_effectiveScale->denominator, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
      {
        int64_t sampleMode = self->_sampleMode;
        [v7 physicalScaledExtent];
        uint64_t v12 = +[NURenderNode resampleImage:by:sampleMode:extent:colorSpace:](NURenderNode, "resampleImage:by:sampleMode:extent:colorSpace:", v10, p_effectiveScale->numerator, p_effectiveScale->denominator, sampleMode, v30, 0);

        id v10 = (id)v12;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    v37 = NUAssertLogger_11920();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v74 = v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v40 = NUAssertLogger_11920();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = v51;
        __int16 v75 = 2114;
        v76 = v55;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 118, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"error != nil");
  }
  objc_super v13 = v12;
  if ([v12 scale] < 1 || v14 <= 0)
  {
    v44 = NUAssertLogger_11920();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = [NSString stringWithFormat:@"Invalid render scale"];
      *(_DWORD *)buf = 138543362;
      v74 = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v47 = NUAssertLogger_11920();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        v63 = [v61 callStackSymbols];
        v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = v60;
        __int16 v75 = 2114;
        v76 = v64;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 119, @"Invalid render scale", v65, v66, v67, v68, v69);
  }
  id v15 = v11;
  v16 = [v10 objectForKey:*MEMORY[0x1E4F1E480]];
  v17 = [v16 outputImageGeometry:a6];
  BOOL v18 = v17;
  if (!v17)
  {
    v21 = 0;
    goto LABEL_12;
  }
  if ([v17 renderScale] < 1 || v19 <= 0)
  {
    +[NUError invalidError:@"invalid scale" object:v18];
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v22 = v15;
    goto LABEL_24;
  }
  uint64_t v23 = [(NUScaleNode *)self targetScale];
  uint64_t v25 = v24;
  uint64_t v26 = [(NUScaleNode *)self effectiveScale];
  uint64_t v71 = v27;
  uint64_t v28 = [(NUScaleNode *)self effectiveScale];
  if (v28 < 1 || v29 <= 0)
  {
    if ([v13 scale] >= 1 && v30 >= 1)
    {
      uint64_t v23 = [v13 scale];
      uint64_t v25 = v31;
    }
    if (v23 >= 1 && v25 >= 1 && [v13 evaluationMode])
    {
      uint64_t v32 = [v18 renderScale];
      uint64_t v26 = NUScaleDivide(v23, v25, v32, v33);
      uint64_t v71 = v34;
    }
  }
  uint64_t v70 = v23;
  v22 = -[NUScaleNode _settingsWithTargetScale:effectiveScale:sampleMode:](self, "_settingsWithTargetScale:effectiveScale:sampleMode:", v23, v25, v26, v71, [v13 sampleMode]);

  v72.receiver = self;
  v72.super_class = (Class)NUScaleNode;
  uint64_t v35 = [(NURenderNode *)&v72 resolvedNodeWithCachedInputs:v10 settings:v22 pipelineState:v13 error:a6];
  v21 = v35;
  if (v35)
  {
    v35[22] = v70;
    v35[23] = v25;
    v35[24] = v26;
    v35[25] = v71;
    v35[21] = [v13 sampleMode];
  }
LABEL_24:

  return v21;
}

- (id)_settingsWithTargetScale:(id)a3 effectiveScale:(id)a4 sampleMode:(int64_t)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v18[3] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 1 && a4.var1 >= 1)
  {
    v17[0] = @"effectiveScale";
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", a4.var0, a4.var1);
    v18[0] = v8;
    v17[1] = @"targetScale";
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", var0, var1);
    v18[1] = v9;
    v17[2] = @"sampleMode";
    id v10 = [NSNumber numberWithInteger:a5];
    v18[2] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

LABEL_7:
    goto LABEL_9;
  }
  if (a3.var0 >= 1 && a3.var1 >= 1)
  {
    v15[0] = @"targetScale";
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", a3.var0, a3.var1);
    v15[1] = @"sampleMode";
    v16[0] = v8;
    v9 = [NSNumber numberWithInteger:a5];
    v16[1] = v9;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    goto LABEL_7;
  }
  objc_super v13 = @"sampleMode";
  v8 = [NSNumber numberWithInteger:a5];
  uint64_t v14 = v8;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
LABEL_9:

  return v11;
}

- (NUScaleNode)initWithPipelineState:(id)a3 input:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 scale];
  uint64_t v10 = v9;
  uint64_t v11 = [v7 sampleMode];

  id v12 = -[NUScaleNode initWithScale:sampleMode:input:](self, "initWithScale:sampleMode:input:", v8, v10, v11, v6);
  return v12;
}

- (NUScaleNode)initWithTargetScale:(id)a3 effectiveScale:(id)a4 sampleMode:(int64_t)a5 input:(id)a6
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  int64_t v9 = a3.var1;
  int64_t v10 = a3.var0;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  if (!a5)
  {
    v17 = NUAssertLogger_11920();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sampleMode != NUSampleModeDefault");
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_11920();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v24;
        __int16 v52 = 2114;
        id v53 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 74, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"sampleMode != NUSampleModeDefault");
  }
  objc_super v13 = v12;
  if ((v10 < 1 || v9 < 1) && var0 >= 1 && var1 >= 1)
  {
    uint64_t v33 = NUAssertLogger_11920();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(targetScale) || !NUScaleIsValid(effectiveScale)");
      *(_DWORD *)buf = 138543362;
      v51 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_11920();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v40;
        __int16 v52 = 2114;
        id v53 = v44;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 76, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"NUScaleIsValid(targetScale) || !NUScaleIsValid(effectiveScale)");
  }
  uint64_t v14 = -[NUScaleNode _settingsWithTargetScale:effectiveScale:sampleMode:](self, "_settingsWithTargetScale:effectiveScale:sampleMode:", v10, v9, var0, var1, a5);
  v49.receiver = self;
  v49.super_class = (Class)NUScaleNode;
  id v15 = [(NUAbstractScaleNode *)&v49 initWithInput:v13 settings:v14];
  v15->_targetScale.numerator = v10;
  v15->_targetScale.denominator = v9;
  v15->_effectiveScale.numerator = var0;
  v15->_effectiveScale.denominator = var1;
  v15->_int64_t sampleMode = a5;

  return v15;
}

- (NUScaleNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5
{
  return -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](self, "initWithTargetScale:effectiveScale:sampleMode:input:", a3.var0, a3.var1, NUScaleUnknown, a4, a5);
}

- (NUScaleNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
  }
  uint64_t v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v9 = NSString;
    int64_t v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    objc_super v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x1E4F29060];
    BOOL v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
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
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  BOOL v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  id v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUScaleNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 63, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end