@interface _NUStyleEngine
+ (BOOL)usingSharedStyleEngineForUsage:(id)a3 withMetalCommandQueue:(id)a4 configuration:(id)a5 tuningParams:(id)a6 perform:(id)a7;
- (BOOL)matchesTuningParameters:(id)a3;
- (BOOL)matchesUsage:(id)a3 metalCommandQueue:(id)a4 configuration:(id)a5 tuning:(id)a6;
- (BOOL)setupProcessor;
- (CMIStyleEngineProcessor)processor;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)tuningParams;
- (NSString)usage;
- (_NUStyleEngine)init;
- (_NUStyleEngine)initWithUsage:(id)a3 metalCommandQueue:(id)a4 configuration:(id)a5 tuningParams:(id)a6;
- (_NUStyleEngineConfiguration)configuration;
- (id)memoryDescriptor;
- (unsigned)processingType;
- (void)dealloc;
- (void)resetProcessor;
@end

@implementation _NUStyleEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);

  objc_storeStrong((id *)&self->_usage, 0);
}

- (CMIStyleEngineProcessor)processor
{
  return self->_processor;
}

- (NSDictionary)tuningParams
{
  return self->_tuningParams;
}

- (_NUStyleEngineConfiguration)configuration
{
  return self->_configuration;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (NSString)usage
{
  return self->_usage;
}

- (BOOL)matchesTuningParameters:(id)a3
{
  id v4 = a3;
  v5 = [(_NUStyleEngine *)self tuningParams];
  v6 = [v5 objectForKeyedSubscript:@"WeightPlaneCount"];
  int v7 = [v6 unsignedIntValue];
  v8 = [v4 objectForKeyedSubscript:@"WeightPlaneCount"];
  int v9 = [v8 unsignedIntValue];

  if (v7 != v9) {
    goto LABEL_5;
  }
  v10 = [(_NUStyleEngine *)self tuningParams];
  v11 = [v10 objectForKeyedSubscript:@"SpotlightCount_X"];
  int v12 = [v11 unsignedIntValue];
  v13 = [v4 objectForKeyedSubscript:@"SpotlightCount_X"];
  int v14 = [v13 unsignedIntValue];

  if (v12 != v14) {
    goto LABEL_5;
  }
  v15 = [(_NUStyleEngine *)self tuningParams];
  v16 = [v15 objectForKeyedSubscript:@"SpotlightCount_Y"];
  int v17 = [v16 unsignedIntValue];
  v18 = [v4 objectForKeyedSubscript:@"SpotlightCount_Y"];
  int v19 = [v18 unsignedIntValue];

  if (v17 == v19)
  {
    v20 = [(_NUStyleEngine *)self tuningParams];
    char v21 = [v20 isEqualToDictionary:v4];
  }
  else
  {
LABEL_5:
    char v21 = 0;
  }

  return v21;
}

- (BOOL)matchesUsage:(id)a3 metalCommandQueue:(id)a4 configuration:(id)a5 tuning:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(_NUStyleEngine *)self usage];

  BOOL v18 = v14 == v13
     && ([(_NUStyleEngine *)self metalCommandQueue],
         id v15 = (id)objc_claimAutoreleasedReturnValue(),
         v15,
         v15 == v10)
     && ([(_NUStyleEngine *)self configuration],
         v16 = objc_claimAutoreleasedReturnValue(),
         int v17 = [v16 matchesConfiguration:v11],
         v16,
         v17)
     && [(_NUStyleEngine *)self matchesTuningParameters:v12];

  return v18;
}

- (void)resetProcessor
{
  [(CMIStyleEngineProcessor *)self->_processor resetState];
  [(CMIStyleEngineProcessor *)self->_processor purgeResources];
  processor = self->_processor;

  [(CMIStyleEngineProcessor *)processor setExternalMemoryResource:0];
}

- (BOOL)setupProcessor
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (self->_processor)
  {
    int v19 = NUAssertLogger_27648();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"Already prepared!"];
      *(_DWORD *)v36 = 138543362;
      *(void *)&v36[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v36, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_27648();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)v36 = 138543618;
        *(void *)&v36[4] = v26;
        __int16 v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)v36 = 138543362;
      *(void *)&v36[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine setupProcessor]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2278, @"Already prepared!", v31, v32, v33, v34, *(uint64_t *)v36);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F55F28]);
  id v4 = [(_NUStyleEngine *)self metalCommandQueue];
  v5 = (CMIStyleEngineProcessor *)[v3 initWithOptionalMetalCommandQueue:v4];
  processor = self->_processor;
  self->_processor = v5;

  int v7 = [(_NUStyleEngine *)self configuration];
  v8 = [v7 styleEngineConfiguration];
  [(CMIStyleEngineProcessor *)self->_processor setConfiguration:v8];

  int v9 = [(_NUStyleEngine *)self tuningParams];
  [(CMIStyleEngineProcessor *)self->_processor setTuningParameters:v9];

  int v10 = [(CMIStyleEngineProcessor *)self->_processor setup];
  if (v10)
  {
    int v11 = v10;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v12 = _NULogger;
    BOOL v13 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      *(_DWORD *)v36 = 67109120;
      *(_DWORD *)&v36[4] = v11;
      id v14 = "*** Failed to setup StyleEngine: %d";
      id v15 = v12;
LABEL_12:
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, v14, v36, 8u);
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    int v16 = [(CMIStyleEngineProcessor *)self->_processor prewarm];
    if (!v16)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    int v17 = v16;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v18 = _NULogger;
    BOOL v13 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      *(_DWORD *)v36 = 67109120;
      *(_DWORD *)&v36[4] = v17;
      id v14 = "*** Failed to prewarm StyleEngine: %d";
      id v15 = v18;
      goto LABEL_12;
    }
  }
  return v13;
}

- (id)memoryDescriptor
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"ProcessingType";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_NUStyleEngine processingType](self, "processingType"));
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F55EB8]) initWithMaxInputDimensions:0 inputPixelFormat:0 maxOutputDimensions:0 cmiResourceEnabled:0 processorSpecificOptions:v4];
  [(CMIStyleEngineProcessor *)self->_processor setUseLiveMetalAllocations:1];
  v6 = [(CMIStyleEngineProcessor *)self->_processor externalMemoryDescriptorForConfiguration:v5];

  return v6;
}

- (unsigned)processingType
{
  id v3 = [(_NUStyleEngine *)self usage];
  char v4 = [v3 isEqualToString:@"learn"];

  if (v4) {
    return 1;
  }
  v6 = [(_NUStyleEngine *)self usage];
  char v7 = [v6 isEqualToString:@"apply"];

  if (v7) {
    return 6;
  }
  v8 = [(_NUStyleEngine *)self usage];
  int v9 = [v8 isEqualToString:@"learn&apply"];

  if (v9) {
    return 5;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  id v3 = (id)_NULogger;
  char v4 = v3;
  os_signpost_id_t sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    usage = self->_usage;
    metalCommandQueue = self->_metalCommandQueue;
    *(_DWORD *)buf = 134218498;
    int v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = usage;
    __int16 v13 = 2048;
    id v14 = metalCommandQueue;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v4, OS_SIGNPOST_INTERVAL_END, sid, "_NUStyleEngine", "%p usage:%@ q:%p", buf, 0x20u);
  }

  v8.receiver = self;
  v8.super_class = (Class)_NUStyleEngine;
  [(_NUStyleEngine *)&v8 dealloc];
}

- (_NUStyleEngine)initWithUsage:(id)a3 metalCommandQueue:(id)a4 configuration:(id)a5 tuningParams:(id)a6
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v27 = NUAssertLogger_27648();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandQueue != nil");
      id v28 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_27648();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v48 = (_NUStyleEngine *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v77 = v48;
        __int16 v78 = 2114;
        v79 = v52;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v77 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2203, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"commandQueue != nil");
  }
  if (!v13)
  {
    uint64_t v34 = NUAssertLogger_27648();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      v35 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v35;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v37 = NUAssertLogger_27648();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v57 = (_NUStyleEngine *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v77 = v57;
        __int16 v78 = 2114;
        v79 = v61;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      uint64_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v77 = v40;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2204, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"config != nil");
  }
  uint64_t v15 = v14;
  if (!v14)
  {
    v41 = NUAssertLogger_27648();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "params != nil");
      v42 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v42;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v44 = NUAssertLogger_27648();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (v43)
    {
      if (v45)
      {
        v66 = (_NUStyleEngine *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E4F29060];
        v68 = v66;
        v69 = [v67 callStackSymbols];
        v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v77 = v66;
        __int16 v78 = 2114;
        v79 = v70;
        _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v77 = v47;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2205, @"Invalid parameter not satisfying: %s", v71, v72, v73, v74, (uint64_t)"params != nil");
  }
  v75.receiver = self;
  v75.super_class = (Class)_NUStyleEngine;
  int v16 = [(_NUStyleEngine *)&v75 init];
  objc_storeStrong((id *)&v16->_usage, a3);
  objc_storeStrong((id *)&v16->_metalCommandQueue, a4);
  objc_storeStrong((id *)&v16->_configuration, a5);
  uint64_t v17 = [v15 copy];
  tuningParams = v16->_tuningParams;
  v16->_tuningParams = (NSDictionary *)v17;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  int v19 = (id)_NULogger;
  v16->_os_signpost_id_t sid = os_signpost_id_make_with_pointer(v19, v16);

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  v20 = (id)_NULogger;
  char v21 = v20;
  os_signpost_id_t sid = v16->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    usage = v16->_usage;
    metalCommandQueue = v16->_metalCommandQueue;
    v25 = [(_NUStyleEngineConfiguration *)v16->_configuration configurationDictionary];
    *(_DWORD *)buf = 134218754;
    v77 = v16;
    __int16 v78 = 2112;
    v79 = usage;
    __int16 v80 = 2048;
    v81 = metalCommandQueue;
    __int16 v82 = 2112;
    v83 = v25;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v21, OS_SIGNPOST_INTERVAL_BEGIN, sid, "_NUStyleEngine", "%p usage:%@ q:%p config:%@", buf, 0x2Au);
  }
  return v16;
}

- (_NUStyleEngine)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
  }
  id v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    char v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    objc_super v8 = NSStringFromSelector(a2);
    int v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
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
    id v13 = v11;
    id v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  int v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  id v13 = v16;
  v20 = [v18 callStackSymbols];
  char v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  BOOL v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2199, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (BOOL)usingSharedStyleEngineForUsage:(id)a3 withMetalCommandQueue:(id)a4 configuration:(id)a5 tuningParams:(id)a6 perform:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  uint64_t v18 = [[_NUStyleEngineConfiguration alloc] initWithConfigurationDictionary:v13];
  id v19 = +[NURenderResourcePool shared];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke;
  v46[3] = &unk_1E5D95D78;
  id v20 = v11;
  id v47 = v20;
  id v21 = v12;
  id v48 = v21;
  v22 = v18;
  v49 = v22;
  id v23 = v14;
  id v50 = v23;
  v42 = (void *)v17;
  uint64_t v24 = [v19 checkOutResourceForKey:v17 matching:v46];

  id v40 = v21;
  if (v24)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v25 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      v52 = v24;
      __int16 v53 = 2048;
      id v54 = v21;
      __int16 v55 = 2112;
      id v56 = v20;
      __int16 v57 = 2112;
      id v58 = v13;
      __int16 v59 = 2112;
      id v60 = v23;
      _os_log_debug_impl(&dword_1A9892000, v25, OS_LOG_TYPE_DEBUG, "Reusing _NUStyleEngine instance: %p, queue:%p usage:%@ config:%@ params:%@", buf, 0x34u);
    }
    id v26 = v20;
    uint64_t v27 = v15;
    id v28 = v13;
    v29 = [(_NUStyleEngineConfiguration *)v22 styleEngineConfiguration];
    __int16 v30 = [(_NUStyleEngine *)v24 processor];
    [v30 setConfiguration:v29];

    BOOL v31 = [(_NUStyleEngine *)v24 processor];
    [v31 setTuningParameters:v23];
  }
  else
  {
    uint64_t v24 = -[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]([_NUStyleEngine alloc], "initWithUsage:metalCommandQueue:configuration:tuningParams:", v20, v21, v22, v23, v21);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v32 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      v52 = v24;
      __int16 v53 = 2048;
      id v54 = v21;
      __int16 v55 = 2112;
      id v56 = v20;
      __int16 v57 = 2112;
      id v58 = v13;
      __int16 v59 = 2112;
      id v60 = v23;
      _os_log_debug_impl(&dword_1A9892000, v32, OS_LOG_TYPE_DEBUG, "Using new _NUStyleEngine instance: %p, queue:%p usage:%@ config:%@ params:%@", buf, 0x34u);
    }
    if (![(_NUStyleEngine *)v24 setupProcessor])
    {
      BOOL v36 = 0;
      BOOL v38 = (void *)v17;
      goto LABEL_14;
    }
    id v26 = v20;
    uint64_t v27 = v15;
    id v28 = v13;
  }
  uint64_t v33 = [(_NUStyleEngine *)v24 metalCommandQueue];
  uint64_t v34 = [v33 device];
  v35 = [(_NUStyleEngine *)v24 memoryDescriptor];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke_658;
  v43[3] = &unk_1E5D95DA0;
  uint64_t v24 = v24;
  v44 = v24;
  id v45 = v27;
  BOOL v36 = +[_NUStyleEngineMemoryResource usingSharedMemoryResourceForDevice:v34 withDescriptor:v35 perform:v43];

  id v15 = v27;
  [(_NUStyleEngine *)v24 resetProcessor];
  __int16 v37 = +[NURenderResourcePool shared];
  BOOL v38 = v42;
  [v37 checkInResource:v24 forKey:v42];

  id v13 = v28;
  id v20 = v26;
LABEL_14:

  return v36;
}

@end