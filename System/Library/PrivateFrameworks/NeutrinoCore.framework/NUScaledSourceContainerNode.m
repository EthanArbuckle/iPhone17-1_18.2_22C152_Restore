@interface NUScaledSourceContainerNode
- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5;
@end

@implementation NUScaledSourceContainerNode

- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(NUMultipleSourceContainerNode *)self sources];
  v10 = [v9 objectAtIndexedSubscript:0];

  v33.receiver = self;
  v33.super_class = (Class)NUScaledSourceContainerNode;
  v11 = [(NUMultipleSourceContainerNode *)&v33 resolveSourceNodeForPipelineState:v8 foundScale:a4 error:a5];
  if (v11 && [v8 evaluationMode] == 1 && v11 == v10)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
    v12 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSString;
      v14 = v12;
      v15 = [v13 stringWithFormat:@"Trying to render using a dummy node. Note: You cannot use a NUScaledSourceContainerNodefor 1-1 rendering. You must specify the renderRequest.scalePolicy to match [NUScaledSourceDefiniton scale] or lower."];
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_1A9892000, v14, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v16 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v16 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
        }
LABEL_11:
        v17 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v23 = (void *)MEMORY[0x1E4F29060];
          id v24 = specific;
          v25 = v17;
          v26 = [v23 callStackSymbols];
          v27 = [v26 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v35 = specific;
          __int16 v36 = 2114;
          v37 = v27;
          _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_21:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v16 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_11;
    }
    v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)MEMORY[0x1E4F29060];
      v25 = v28;
      v31 = [v30 callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v32;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_21;
    }
LABEL_16:
    _NUAssertContinueHandler((uint64_t)"-[NUScaledSourceContainerNode resolveSourceNodeForPipelineState:foundScale:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 366, @"Trying to render using a dummy node. Note: You cannot use a NUScaledSourceContainerNodefor 1-1 rendering. You must specify the renderRequest.scalePolicy to match [NUScaledSourceDefiniton scale] or lower.", v18, v19, v20, v21, (uint64_t)v33.receiver);
  }

  return v11;
}

@end