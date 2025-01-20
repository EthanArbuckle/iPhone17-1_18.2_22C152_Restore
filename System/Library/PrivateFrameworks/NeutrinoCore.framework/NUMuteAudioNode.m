@interface NUMuteAudioNode
- (BOOL)requiresAudioMix;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUMuteAudioNode)initWithInput:(id)a3;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUMuteAudioNode

- (BOOL)requiresAudioMix
{
  return 0;
}

- (id)_evaluateImage:(id *)a3
{
  v4 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v5 = [v4 _evaluateImage:a3];

  return v5;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v15 = NUAssertLogger_28796();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_28796();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v22;
        __int16 v39 = 2114;
        v40 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMuteAudioNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Audio.m", 47, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"error != nil");
  }
  v35.receiver = self;
  v35.super_class = (Class)NUMuteAudioNode;
  v4 = -[NURenderNode _evaluateVideo:](&v35, sel__evaluateVideo_);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[v4 mutableCopy];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            [v7 removeTrack:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v10);
      }
      id v13 = v7;
    }
    else
    {
      *a3 = +[NUError errorWithCode:1 reason:@"[NUMuteAudioNode _evaluateVideo] failed to get mutableCopy" object:v5];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUMuteAudioNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return ([a3 evaluationMode] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NUMuteAudioNode)initWithInput:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F1E480];
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)NUMuteAudioNode;
  v7 = [(NURenderNode *)&v9 initWithSettings:MEMORY[0x1E4F1CC08] inputs:v6];

  return v7;
}

@end