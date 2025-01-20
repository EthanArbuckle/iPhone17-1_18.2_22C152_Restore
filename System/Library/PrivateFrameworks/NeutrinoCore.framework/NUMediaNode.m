@interface NUMediaNode
- (BOOL)bindTo:(id)a3 error:(id *)a4;
- (id)evaluateDataWithFormat:(id)a3 error:(id *)a4;
- (int64_t)channelType;
- (void)setInputNode:(id)a3;
@end

@implementation NUMediaNode

- (id)evaluateDataWithFormat:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 channelType] == 1)
  {
    v7 = objc_alloc_init(NURenderPipelineState);
    [(NURenderPipelineState *)v7 setEvaluationMode:0];
    [(NURenderPipelineState *)v7 setMediaComponentType:1];
    id v14 = 0;
    v8 = [(NURenderNode *)self nodeByReplayingAgainstCache:v7 error:&v14];
    id v9 = v14;
    if (v8)
    {
      id v10 = v6;
      v11 = [[NUChannelMediaData alloc] initWithNode:v8 format:v10];
      if ([(NUChannelMediaData *)v11 evaluate:a4]) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to prepare render pipeline" object:self underlyingError:v9];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError mismatchError:@"Incompatible channel format" object:v6];
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)bindTo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v8 = [v6 node];
    [(NUMediaNode *)self setInputNode:v8];
  }
  else
  {
    *a4 = +[NUError mismatchError:@"Expected media data" object:v6];
  }

  return isKindOfClass & 1;
}

- (void)setInputNode:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = NUAssertLogger_5149();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Bad input node: %@", v20];
      *(_DWORD *)buf = 138543362;
      v22 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v7 = NUAssertLogger_5149();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        id v14 = [v12 callStackSymbols];
        v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        __int16 v23 = 2114;
        v24 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      id v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMediaNode setInputNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1144, @"Bad input node: %@", v16, v17, v18, v19, (uint64_t)v20);
  }
  [(NURenderTagNode *)self setInput:v20];
}

- (int64_t)channelType
{
  return 1;
}

@end