@interface TLAttentionAwarenessEffectCoordinator
- ($8F739DADA627152431EF347AE70D5328)effectParameters;
- (AVAudioSession)audioSession;
- (TLAttentionAwarenessEffectCoordinator)initWithEffectParameters:(id)a3 audioSession:(id)a4;
- (id)audioMixForAsset:(id)a3;
- (void)_finalizeAudioProcessingWithEffectAudioTapContext:(id)a3;
- (void)_prepareAudioProcessingWithEffectAudioTapContext:(id)a3 maximumNumberOfFrames:(unsigned int)a4 processingFormat:(const AudioStreamBasicDescription *)a5;
- (void)_processAudioWithEffectAudioTapContext:(id)a3 bufferList:(AudioBufferList *)a4 numberOfFramesRequested:(unsigned int)a5 numberOfFramesToProcess:(unsigned int)a6;
- (void)_unprepareAudioProcessingWithEffectAudioTapContext:(id)a3;
- (void)dealloc;
- (void)setEffectParameters:(id)a3;
- (void)setEffectParameters:(id)a3 effectMixFadeDuration:(double)a4;
@end

@implementation TLAttentionAwarenessEffectCoordinator

- (TLAttentionAwarenessEffectCoordinator)initWithEffectParameters:(id)a3 audioSession:(id)a4
{
  float var2 = a3.var2;
  uint64_t v6 = *(void *)&a3.var0;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLAttentionAwarenessEffectCoordinator;
  v9 = [(TLAttentionAwarenessEffectCoordinator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_audioSession, a4);
    os_unfair_lock_lock(&v10->_lock);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    effectAudioTapContexts = v10->_effectAudioTapContexts;
    v10->_effectAudioTapContexts = v11;

    *(void *)&v10->_effectParameters.shouldBypassLowPassFilter = v6;
    v10->_effectParameters.effectMix = var2;
    os_unfair_lock_unlock(&v10->_lock);
  }

  return v10;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  effectAudioTapContexts = self->_effectAudioTapContexts;
  self->_effectAudioTapContexts = 0;

  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)TLAttentionAwarenessEffectCoordinator;
  [(TLAttentionAwarenessEffectCoordinator *)&v5 dealloc];
}

- (id)audioMixForAsset:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v22 = v4;
  [v4 tracks];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v32;
    uint64_t v8 = *MEMORY[0x1E4F15BA8];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v32 != v7) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      v11 = [v10 mediaType];
      char v12 = [v11 isEqualToString:v8];

      if (v12) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = (id)[v5 countByEnumeratingWithState:&v31 objects:v45 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v6 = v10;

    if (!v6)
    {
      v13 = 0;
      goto LABEL_21;
    }
    v13 = [MEMORY[0x1E4F16580] audioMix];
    if (!v13) {
      goto LABEL_21;
    }
    objc_super v14 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:v6];
    if (v14)
    {
      v15 = objc_alloc_init(TLAttentionAwarenessEffectAudioTapContext);
      [(TLAttentionAwarenessEffectAudioTapContext *)v15 setEffectCoordinator:self];
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableSet *)self->_effectAudioTapContexts addObject:v15];
      os_unfair_lock_unlock(&self->_lock);
      int v24 = 0;
      v25 = v15;
      v26 = _TLAttentionAwarenessEffectAudioTapInitialize;
      v27 = _TLAttentionAwarenessEffectAudioTapFinalize;
      v28 = _TLAttentionAwarenessEffectAudioTapPrepare;
      v29 = _TLAttentionAwarenessEffectAudioTapUnprepare;
      v30 = _TLAttentionAwarenessEffectAudioTapProcess;
      CFTypeRef cf = 0;
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      v16 = (unsigned int (*)(void, int *, uint64_t, CFTypeRef *))getMTAudioProcessingTapCreateSymbolLoc(void)::ptr;
      v43 = getMTAudioProcessingTapCreateSymbolLoc(void)::ptr;
      if (!getMTAudioProcessingTapCreateSymbolLoc(void)::ptr)
      {
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        v37 = ___ZL38getMTAudioProcessingTapCreateSymbolLocv_block_invoke;
        v38 = &unk_1E6C21170;
        v39 = &v40;
        v17 = (void *)MediaToolboxLibrary();
        v18 = dlsym(v17, "MTAudioProcessingTapCreate");
        *(void *)(v39[1] + 24) = v18;
        getMTAudioProcessingTapCreateSymbolLoc(void)::ptr = *(_UNKNOWN **)(v39[1] + 24);
        v16 = (unsigned int (*)(void, int *, uint64_t, CFTypeRef *))v41[3];
      }
      _Block_object_dispose(&v40, 8);
      if (!v16)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      if (!v16(*MEMORY[0x1E4F1CF80], &v24, 1, &cf))
      {
        [v14 setAudioTapProcessor:cf];
        CFRelease(cf);
        v44 = v14;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        [v13 setInputParameters:v19];
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
    objc_super v14 = v5;
  }

LABEL_21:
  id v20 = v13;

  return v20;
}

- ($8F739DADA627152431EF347AE70D5328)effectParameters
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = *(void *)&v2->_effectParameters.shouldBypassLowPassFilter;
  *(float *)&v2 = v2->_effectParameters.effectMix;
  os_unfair_lock_unlock(p_lock);
  BOOL v5 = v4;
  float v6 = *(float *)&v2;
  result.var0 = v5;
  result.var1 = *((float *)&v5 + 1);
  result.float var2 = v6;
  return result;
}

- (void)setEffectParameters:(id)a3
{
  float var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(void *)&self->_effectParameters.shouldBypassLowPassFilter = v4;
  self->_effectParameters.effectMix = var2;
  uint64_t v7 = (void *)[(NSMutableSet *)self->_effectAudioTapContexts copy];
  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        char v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "effectProcessor", (void)v13);
        objc_msgSend(v12, "setEffectParameters:", v4, LODWORD(var2));
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setEffectParameters:(id)a3 effectMixFadeDuration:(double)a4
{
  float var2 = a3.var2;
  uint64_t v6 = *(void *)&a3.var0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(void *)&self->_effectParameters.shouldBypassLowPassFilter = v6;
  self->_effectParameters.effectMix = var2;
  uint64_t v9 = (void *)[(NSMutableSet *)self->_effectAudioTapContexts copy];
  os_unfair_lock_unlock(p_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "effectProcessor", (void)v15);
        objc_msgSend(v14, "setEffectParameters:effectMixFadeDuration:", v6, LODWORD(var2), a4);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_prepareAudioProcessingWithEffectAudioTapContext:(id)a3 maximumNumberOfFrames:(unsigned int)a4 processingFormat:(const AudioStreamBasicDescription *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  effectProcessor = self->_effectProcessor;
  if (!effectProcessor)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:a5];
    uint64_t v11 = [TLAttentionAwarenessEffectProcessor alloc];
    audioSession = self->_audioSession;
    uint64_t v13 = [(TLAttentionAwarenessEffectCoordinator *)self effectParameters];
    long long v15 = -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:](v11, "initWithProcessingFormat:framesPerRender:audioSession:effectParameters:", v10, v6, audioSession, v13, v14);
    long long v16 = self->_effectProcessor;
    self->_effectProcessor = v15;

    [v8 setEffectProcessor:self->_effectProcessor];
    effectProcessor = self->_effectProcessor;
  }
  if (![(TLAttentionAwarenessEffectProcessor *)effectProcessor isStarted])
  {
    long long v17 = TLLogPlayback();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[TLAttentionAwarenessEffectCoordinator _prepareAudioProcessingWithEffectAudioTapContext:maximumNumberOfFrames:processingFormat:]((uint64_t)self, v17);
    }

    [(TLAttentionAwarenessEffectProcessor *)self->_effectProcessor start];
  }
}

- (void)_unprepareAudioProcessingWithEffectAudioTapContext:(id)a3
{
  id v4 = a3;
  effectProcessor = self->_effectProcessor;
  if (effectProcessor && [(TLAttentionAwarenessEffectProcessor *)effectProcessor isStarted])
  {
    uint64_t v6 = TLLogPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TLAttentionAwarenessEffectCoordinator _unprepareAudioProcessingWithEffectAudioTapContext:]((uint64_t)self, v6);
    }

    uint64_t v7 = [v4 effectProcessor];
    [v7 stop];
  }
}

- (void)_finalizeAudioProcessingWithEffectAudioTapContext:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [v6 setEffectProcessor:0];
  BOOL v5 = self;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)v5->_effectAudioTapContexts removeObject:v6];
  os_unfair_lock_unlock(p_lock);
}

- (void)_processAudioWithEffectAudioTapContext:(id)a3 bufferList:(AudioBufferList *)a4 numberOfFramesRequested:(unsigned int)a5 numberOfFramesToProcess:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [v10 effectProcessor];
  uint64_t v12 = (unsigned int *)[v11 render:a4 numberOfFrames:v6];
  uint64_t v13 = v12;
  if (v12)
  {
    if (*v12)
    {
      unint64_t v14 = 0;
      unint64_t v15 = 0;
      size_t v16 = 4 * a5;
      uint64_t v21 = a5;
      p_mData = &a4->mBuffers[0].mData;
      do
      {
        size_t v18 = v13[v14 / 4 + 3];
        if (v16 <= v18)
        {
          memcpy(p_mData[v14 / 8], *(const void **)&v13[v14 / 4 + 4], v16);
        }
        else
        {
          v19 = TLLogPlayback();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v23 = self;
            __int16 v24 = 2048;
            uint64_t v25 = v21;
            __int16 v26 = 2048;
            size_t v27 = v16;
            __int16 v28 = 2048;
            size_t v29 = v18;
            _os_log_error_impl(&dword_1DB936000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Requested more frames (%lu, with size %zu) than available in the buffer (of size %zu).", buf, 0x2Au);
          }
        }
        ++v15;
        v14 += 16;
      }
      while (v15 < *v13);
    }
  }
  else
  {
    uint64_t v20 = TLLogPlayback();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[TLAttentionAwarenessEffectCoordinator _processAudioWithEffectAudioTapContext:bufferList:numberOfFramesRequested:numberOfFramesToProcess:](a5, v6, v20);
    }
  }
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_effectProcessor, 0);

  objc_storeStrong((id *)&self->_effectAudioTapContexts, 0);
}

- (void)_prepareAudioProcessingWithEffectAudioTapContext:(uint64_t)a1 maximumNumberOfFrames:(NSObject *)a2 processingFormat:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB936000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: starting TLAttentionAwarenessEffectProcessor", (uint8_t *)&v2, 0xCu);
}

- (void)_unprepareAudioProcessingWithEffectAudioTapContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB936000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: stopping TLAttentionAwarenessEffectProcessor", (uint8_t *)&v2, 0xCu);
}

- (void)_processAudioWithEffectAudioTapContext:(os_log_t)log bufferList:numberOfFramesRequested:numberOfFramesToProcess:.cold.1(unsigned int a1, unsigned int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DB936000, log, OS_LOG_TYPE_ERROR, "{public}@: Failed to process and render AudioBufferList. { requestedFrames=%lu, framesToProcess=%lu }", (uint8_t *)&v3, 0x16u);
}

@end