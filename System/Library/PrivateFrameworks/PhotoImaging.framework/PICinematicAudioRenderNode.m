@interface PICinematicAudioRenderNode
- (BOOL)requiresAudioMix;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)shouldInvalidateCachedAudioMix;
- (PICinematicAudioRenderNode)initWithInput:(id)a3 dialogMixBias:(double)a4 renderingStyle:(id)a5;
- (double)cachedDialogMixBias;
- (double)dialogMixBias;
- (id)_evaluateAudioMix:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)cachedRenderingStyle;
- (int64_t)renderingStyle;
- (void)setCachedDialogMixBias:(double)a3;
- (void)setCachedRenderingStyle:(int64_t)a3;
- (void)setDialogMixBias:(double)a3;
- (void)setRenderingStyle:(int64_t)a3;
@end

@implementation PICinematicAudioRenderNode

- (void)setCachedRenderingStyle:(int64_t)a3
{
  self->_cachedRenderingStyle = a3;
}

- (int64_t)cachedRenderingStyle
{
  return self->_cachedRenderingStyle;
}

- (void)setCachedDialogMixBias:(double)a3
{
  self->_cachedDialogMixBias = a3;
}

- (double)cachedDialogMixBias
{
  return self->_cachedDialogMixBias;
}

- (void)setRenderingStyle:(int64_t)a3
{
  self->_renderingStyle = a3;
}

- (int64_t)renderingStyle
{
  return self->_renderingStyle;
}

- (void)setDialogMixBias:(double)a3
{
  self->_dialogMixBias = a3;
}

- (double)dialogMixBias
{
  return self->_dialogMixBias;
}

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v28 = NUAssertLogger_19911();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v32 = NUAssertLogger_19911();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_32;
  }
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v6 = [v5 outputVideo:a3];
  if (!v6)
  {
    v15 = 0;
    goto LABEL_21;
  }
  v7 = [v5 videoProperties:a3];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 cinematicAudioMixInputParameters];
    v10 = (void *)[v9 mutableCopy];

    if (!v10)
    {
      [MEMORY[0x1E4F7A438] missingError:@"Missing cinematic audio mix input parameters" object:v8];
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    [(PICinematicAudioRenderNode *)self dialogMixBias];
    *(float *)&double v11 = v11;
    *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
    long long v54 = *(_OWORD *)buf;
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v12 = *(void *)&buf[16];
    [v10 setDialogMixBias:buf atTime:v11];
    *(float *)&double v13 = (float)[(PICinematicAudioRenderNode *)self renderingStyle];
    *(_OWORD *)buf = v54;
    *(void *)&buf[16] = v12;
    [v10 setRenderingStyle:buf atTime:v13];
    v14 = [v5 outputAudioMix:a3];
    v15 = (void *)[v14 mutableCopy];
    if (!v14)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_63_19923);
      }
      v16 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        id v17 = *a3;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v17;
        _os_log_impl(&dword_1A9680000, v16, OS_LOG_TYPE_INFO, "Input has no audio mix (%@), creating a new one..", buf, 0xCu);
      }
      uint64_t v18 = [MEMORY[0x1E4F16580] audioMix];

      v15 = (void *)v18;
    }
    v19 = [v15 inputParameters];
    uint64_t v20 = [v19 count];

    if (!v20)
    {
      v59 = v10;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [v15 setInputParameters:v26];
      goto LABEL_18;
    }
    uint64_t v21 = [MEMORY[0x1E4F7A718] cinematicAudioTrackInAsset:v6];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [MEMORY[0x1E4F1CA48] array];
      v24 = [v15 inputParameters];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __48__PICinematicAudioRenderNode__evaluateAudioMix___block_invoke;
      v55[3] = &unk_1E5D80958;
      id v56 = v22;
      v57 = self;
      id v58 = v23;
      id v25 = v23;
      id v26 = v22;
      [v24 enumerateObjectsUsingBlock:v55];

      [v15 setInputParameters:v25];
LABEL_18:

      [(PICinematicAudioRenderNode *)self dialogMixBias];
      -[PICinematicAudioRenderNode setCachedDialogMixBias:](self, "setCachedDialogMixBias:");
      [(PICinematicAudioRenderNode *)self setCachedRenderingStyle:[(PICinematicAudioRenderNode *)self renderingStyle]];

      goto LABEL_19;
    }
LABEL_32:
    v41 = NUAssertLogger_19911();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = [NSString stringWithFormat:@"Missing ambisonic track"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v43 = (const void **)MEMORY[0x1E4F7A308];
    v44 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v45 = NUAssertLogger_19911();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        v49 = dispatch_get_specific(*v43);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v48;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v15 = 0;
LABEL_20:

LABEL_21:
  return v15;
}

void __48__PICinematicAudioRenderNode__evaluateAudioMix___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 trackID];
  if (v4 == [a1[4] trackID])
  {
    v5 = (void *)[v3 mutableCopy];

    [a1[5] dialogMixBias];
    *(float *)&double v6 = v6;
    long long v10 = *MEMORY[0x1E4F1FA48];
    long long v9 = v10;
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v7 = v11;
    [v5 setDialogMixBias:&v10 atTime:v6];
    *(float *)&double v8 = (float)[a1[5] renderingStyle];
    long long v10 = v9;
    uint64_t v11 = v7;
    [v5 setRenderingStyle:&v10 atTime:v8];
    [a1[6] addObject:v5];
    id v3 = v5;
  }
  else
  {
    [a1[6] addObject:v3];
  }
}

- (BOOL)shouldInvalidateCachedAudioMix
{
  [(PICinematicAudioRenderNode *)self dialogMixBias];
  double v4 = v3;
  [(PICinematicAudioRenderNode *)self cachedDialogMixBias];
  double v6 = vabdd_f64(v4, v5);
  int64_t v7 = [(PICinematicAudioRenderNode *)self renderingStyle];
  int64_t v8 = [(PICinematicAudioRenderNode *)self cachedRenderingStyle];
  return v6 > 0.01 || v7 != v8;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  double v4 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  double v5 = [v4 outputVideoComposition:a3];

  return v5;
}

- (id)_evaluateVideo:(id *)a3
{
  double v4 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  double v5 = [v4 outputVideo:a3];

  return v5;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PICinematicAudioRenderNode;
  double v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  if ([v8 evaluationMode] == 2)
  {
    v13.receiver = self;
    v13.super_class = (Class)PICinematicAudioRenderNode;
    long long v10 = [(NURenderNode *)&v13 nodeByReplayingAgainstCache:v9 pipelineState:v8 error:a5];

    [(PICinematicAudioRenderNode *)self dialogMixBias];
    objc_msgSend(v10, "setDialogMixBias:");
    objc_msgSend(v10, "setRenderingStyle:", -[PICinematicAudioRenderNode renderingStyle](self, "renderingStyle"));
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PICinematicAudioRenderNode;
    long long v10 = [(NURenderNode *)&v12 nodeByReplayingAgainstCache:v9 pipelineState:v8 error:a5];
  }
  return v10;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 evaluationMode] == 2;
}

- (PICinematicAudioRenderNode)initWithInput:(id)a3 dialogMixBias:(double)a4 renderingStyle:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v18 = *MEMORY[0x1E4F1E480];
  id v19 = v8;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v17.receiver = self;
  v17.super_class = (Class)PICinematicAudioRenderNode;
  uint64_t v11 = [(NURenderNode *)&v17 initWithSettings:MEMORY[0x1E4F1CC08] inputs:v10];
  objc_super v12 = v11;
  if (v11)
  {
    [(PICinematicAudioRenderNode *)v11 setDialogMixBias:a4];
    id v13 = v9;
    if (([v13 isEqualToString:@"original"] & 1) == 0)
    {
      if ([v13 isEqualToString:@"voice"])
      {
        uint64_t v14 = 0;
        goto LABEL_10;
      }
      if ([v13 isEqualToString:@"studioVoice"])
      {
        uint64_t v14 = 1;
        goto LABEL_10;
      }
      if ([v13 isEqualToString:@"onCameraVoice"])
      {
        uint64_t v14 = 2;
        goto LABEL_10;
      }
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_63_19923);
      }
      v16 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v13;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Unexpected rendering style string %@ - defaulting to standard", buf, 0xCu);
      }
    }
    uint64_t v14 = 7;
LABEL_10:

    [(PICinematicAudioRenderNode *)v12 setRenderingStyle:v14];
  }

  return v12;
}

@end