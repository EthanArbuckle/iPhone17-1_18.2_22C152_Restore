@interface TLAttentionAwarenessEffectProcessor
- ($8F739DADA627152431EF347AE70D5328)effectParameters;
- (AudioBufferList)render:(AudioBufferList *)a3 numberOfFrames:(unsigned int)a4;
- (BOOL)isStarted;
- (BOOL)start;
- (TLAttentionAwarenessEffectProcessor)initWithProcessingFormat:(id)a3 framesPerRender:(unsigned int)a4 audioSession:(id)a5 effectParameters:(id)a6;
- (float)_currentEffectMix;
- (float)_sanitizeEffectMix:(float)a3;
- (void)_applyEffectMix:(float)a3;
- (void)_applyEffectParameters:(id)a3 includingEffectMix:(BOOL)a4;
- (void)_assertNotRunningOnAccessQueue;
- (void)_assertRunningOnAccessQueue;
- (void)dealloc;
- (void)setEffectParameters:(id)a3;
- (void)setEffectParameters:(id)a3 effectMixFadeDuration:(double)a4;
- (void)setStarted:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation TLAttentionAwarenessEffectProcessor

- (TLAttentionAwarenessEffectProcessor)initWithProcessingFormat:(id)a3 framesPerRender:(unsigned int)a4 audioSession:(id)a5 effectParameters:(id)a6
{
  float var2 = a6.var2;
  uint64_t v64 = *(void *)&a6.var0;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v66 = a5;
  v75.receiver = self;
  v75.super_class = (Class)TLAttentionAwarenessEffectProcessor;
  v9 = [(TLAttentionAwarenessEffectProcessor *)&v75 init];
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSString;
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:v10];
    v13 = [v12 bundleIdentifier];
    v14 = NSStringFromClass(v10);
    uint64_t v15 = [v11 stringWithFormat:@"%@.%@-%@", v13, v14, @"AccessQueue"];
    accessQueueLabel = v9->_accessQueueLabel;
    v9->_accessQueueLabel = (NSString *)v15;

    dispatch_queue_t v17 = dispatch_queue_create([(NSString *)v9->_accessQueueLabel UTF8String], 0);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v9->_audioSession, a5);
    v19 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E4F15380]);
    engine = v9->_engine;
    v9->_engine = v19;

    v21 = v9->_engine;
    id v74 = 0;
    char v22 = [(AVAudioEngine *)v21 enableManualRenderingMode:1 format:v8 maximumFrameCount:a4 error:&v74];
    id v23 = v74;
    if (v23) {
      char v24 = v22;
    }
    else {
      char v24 = 1;
    }
    if (v24)
    {
      uint64_t v25 = [(AVAudioEngine *)v9->_engine inputNode];
      inputNode = v9->_inputNode;
      v9->_inputNode = (AVAudioInputNode *)v25;

      v27 = (AVAudioUnitEQ *)objc_alloc_init(MEMORY[0x1E4F15420]);
      lowPassFilter = v9->_lowPassFilter;
      v9->_lowPassFilter = v27;

      v29 = (AVAudioUnitReverb *)objc_alloc_init(MEMORY[0x1E4F15430]);
      reverb = v9->_reverb;
      v9->_reverb = v29;

      [(AVAudioEngine *)v9->_engine attachNode:v9->_lowPassFilter];
      [(AVAudioEngine *)v9->_engine attachNode:v9->_reverb];
      [(AVAudioEngine *)v9->_engine connect:v9->_lowPassFilter to:v9->_reverb format:v8];
      v31 = v9->_engine;
      v32 = v9->_reverb;
      v33 = [(AVAudioEngine *)v31 mainMixerNode];
      [(AVAudioEngine *)v31 connect:v32 to:v33 fromBus:0 toBus:1 format:v8];

      id v34 = objc_alloc(MEMORY[0x1E4F15368]);
      v35 = [(AVAudioEngine *)v9->_engine mainMixerNode];
      uint64_t v61 = [v34 initWithNode:v35 bus:0];

      v36 = [objc_alloc(MEMORY[0x1E4F15368]) initWithNode:v9->_lowPassFilter bus:0];
      v37 = v9->_engine;
      v38 = v9->_inputNode;
      v76[0] = v61;
      v76[1] = v36;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
      [(AVAudioEngine *)v37 connect:v38 toConnectionPoints:v39 fromBus:0 format:v8];

      v65 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v60 = [v65 URLForResource:@"PearlID_Equalizer" withExtension:@"aupreset"];
      v40 = v9->_lowPassFilter;
      id v73 = v23;
      LOBYTE(v37) = [(AVAudioUnitEQ *)v40 loadAudioUnitPresetAtURL:v60 error:&v73];
      id v41 = v73;

      if ((v37 & 1) == 0)
      {
        v42 = TLLogPlayback();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:]((uint64_t)v9, v41);
        }
      }
      v62 = [(AVAudioUnitEQ *)v9->_lowPassFilter bands];
      v43 = TLLogPlayback();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        int v58 = [(AVAudioUnitEQ *)v9->_lowPassFilter bypass];
        uint64_t v59 = [v62 count];
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v9;
        __int16 v78 = 1024;
        *(_DWORD *)v79 = v58;
        *(_WORD *)&v79[4] = 2048;
        *(void *)&v79[6] = v59;
        _os_log_debug_impl(&dword_1DB936000, v43, OS_LOG_TYPE_DEBUG, "%{public}@: -init. Equalizer bypass: %{BOOL}d. Number of bands: %lu.", location, 0x1Cu);
      }

      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke;
      v71[3] = &unk_1E6C219B0;
      v44 = v9;
      v72 = v44;
      [v62 enumerateObjectsUsingBlock:v71];
      v45 = [v65 URLForResource:@"PearlID_Reverb" withExtension:@"aupreset"];
      v46 = v9->_reverb;
      id v70 = v41;
      char v47 = [(AVAudioUnitReverb *)v46 loadAudioUnitPresetAtURL:v45 error:&v70];
      id v23 = v70;

      if ((v47 & 1) == 0)
      {
        v48 = TLLogPlayback();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:]((uint64_t)v44, v23);
        }
      }
      v49 = TLLogPlayback();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:]((uint64_t)v44, (id *)&v9->_reverb);
      }

      v50 = [(AVAudioEngine *)v9->_engine mainMixerNode];
      LODWORD(v51) = 1.0;
      [v50 setOutputVolume:v51];

      uint64_t v52 = [objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v8 frameCapacity:a4];
      destinationPCMBuffer = v44->_destinationPCMBuffer;
      v44->_destinationPCMBuffer = (AVAudioPCMBuffer *)v52;

      [(AVAudioPCMBuffer *)v44->_destinationPCMBuffer setFrameLength:a4];
      objc_initWeak((id *)location, v44);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke_21;
      v68[3] = &unk_1E6C219D8;
      objc_copyWeak(&v69, (id *)location);
      v54 = (void *)MEMORY[0x1E0195470](v68);
      if ([(AVAudioInputNode *)v9->_inputNode setManualRenderingInputPCMFormat:v8 inputBlock:v54])
      {
        *(void *)&v44->_effectParameters.shouldBypassLowPassFilter = v64;
        v44->_effectParameters.effectMix = var2;
        -[TLAttentionAwarenessEffectProcessor _applyEffectParameters:includingEffectMix:](v44, "_applyEffectParameters:includingEffectMix:");
      }
      else
      {

        v44 = 0;
      }

      objc_destroyWeak(&v69);
      objc_destroyWeak((id *)location);

      v9 = (TLAttentionAwarenessEffectProcessor *)v61;
    }
    else
    {
      v36 = TLLogPlayback();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v56 = objc_msgSend(v23, "tl_nonRedundantDescription");
        v57 = [v8 description];
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v56;
        __int16 v78 = 2114;
        *(void *)v79 = v57;
        *(_WORD *)&v79[8] = 2048;
        *(void *)&v79[10] = a4;
        _os_log_error_impl(&dword_1DB936000, v36, OS_LOG_TYPE_ERROR, "Could not switch engine to offline mode, error %{public}@, format = %{public}@, maximumNumberOfFrames = %ld.", location, 0x20u);
      }
      v44 = 0;
    }
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

void __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = TLLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v5 filterType];
    [v5 gain];
    double v10 = v9;
    [v5 frequency];
    int v12 = 138544642;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    double v19 = v10;
    __int16 v20 = 2048;
    double v21 = v11;
    __int16 v22 = 1024;
    int v23 = [v5 bypass];
    _os_log_debug_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: -init. Equalizer band #%lu: filterType = %ld, gain = %f, frequency = %f, bypass = %{BOOL}d.", (uint8_t *)&v12, 0x3Au);
  }
}

uint64_t __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke_21(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = WeakRetained[7];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  dispatch_sync(v4, &__block_literal_global_4);
  v5.receiver = self;
  v5.super_class = (Class)TLAttentionAwarenessEffectProcessor;
  [(TLAttentionAwarenessEffectProcessor *)&v5 dealloc];
}

- ($8F739DADA627152431EF347AE70D5328)effectParameters
{
  uint64_t v8 = 0;
  float v9 = (float *)&v8;
  uint64_t v10 = 0x3010000000;
  float v11 = &unk_1DB997F15;
  uint64_t v12 = 0;
  int v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__TLAttentionAwarenessEffectProcessor_effectParameters__block_invoke;
  v7[3] = &unk_1E6C20D10;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  uint64_t v3 = *((void *)v9 + 4);
  float v4 = v9[10];
  _Block_object_dispose(&v8, 8);
  BOOL v5 = v3;
  float v6 = v4;
  result.var0 = v5;
  result.var1 = *((float *)&v5 + 1);
  result.float var2 = v6;
  return result;
}

uint64_t __55__TLAttentionAwarenessEffectProcessor_effectParameters__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v3 = *(void *)(v1 + 80);
  *(_DWORD *)(v2 + 40) = *(_DWORD *)(v1 + 88);
  *(void *)(v2 + 32) = v3;
  return result;
}

- (void)setEffectParameters:(id)a3
{
}

- (void)setEffectParameters:(id)a3 effectMixFadeDuration:(double)a4
{
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke;
  v5[3] = &unk_1E6C21A28;
  v5[4] = self;
  $8F739DADA627152431EF347AE70D5328 v6 = a3;
  *(double *)&v5[5] = a4;
  dispatch_sync(accessQueue, v5);
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_cold_1(a1);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 88);
  int v5 = *(_DWORD *)(a1 + 56);
  *(void *)(v3 + 80) = *(void *)(a1 + 48);
  *(_DWORD *)(v3 + 88) = v5;
  objc_msgSend(*(id *)(a1 + 32), "_applyEffectParameters:includingEffectMix:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 56), 0);
  LODWORD(v6) = v4;
  [*(id *)(a1 + 32) _sanitizeEffectMix:v6];
  float v8 = v7;
  LODWORD(v9) = *(_DWORD *)(a1 + 56);
  [*(id *)(a1 + 32) _sanitizeEffectMix:v9];
  float v11 = v10;
  if (llroundf(v8 * 8388600.0) != llroundf(v10 * 8388600.0))
  {
    double v12 = *(double *)(a1 + 40);
    int v13 = *(void **)(a1 + 32);
    if (v12 >= 0.00000011920929)
    {
      [v13 _currentEffectMix];
      float v15 = v14;
      float v16 = v11 - v14;
      float v17 = *(double *)(a1 + 40) / 0.00499999989;
      __int16 v18 = (void *)llroundf(ceilf(v17));
      double v19 = *(NSObject **)(*(void *)(a1 + 32) + 96);
      if (v19) {
        dispatch_source_cancel(v19);
      }
      __int16 v20 = dispatch_get_global_queue(2, 0);
      dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v20);
      uint64_t v22 = *(void *)(a1 + 32);
      int v23 = *(void **)(v22 + 96);
      *(void *)(v22 + 96) = v21;

      dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 96), 0, 0x4C4B40uLL, 0xC350uLL);
      objc_initWeak(&location, *(id *)(a1 + 32));
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      v29[3] = 0;
      uint64_t v24 = *(NSObject **)(*(void *)(a1 + 32) + 96);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_26;
      handler[3] = &unk_1E6C21A00;
      objc_copyWeak(v26, &location);
      handler[4] = v29;
      v26[1] = v18;
      float v27 = v15;
      float v28 = v16;
      dispatch_source_set_event_handler(v24, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 96));
      objc_destroyWeak(v26);
      _Block_object_dispose(v29, 8);
      objc_destroyWeak(&location);
    }
    else
    {
      *(float *)&double v12 = v11;
      [v13 _applyEffectMix:v12];
    }
  }
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_26(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    *(float *)&double v3 = *(float *)(a1 + 56)
                  + (float)((float)((float)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 1)
                                  / (float)*(uint64_t *)(a1 + 48))
                          * *(float *)(a1 + 60));
    [WeakRetained _applyEffectMix:v3];
    if (++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == *(void *)(a1 + 48))
    {
      uint64_t v7 = 0;
      float v8 = &v7;
      uint64_t v9 = 0x3032000000;
      float v10 = __Block_byref_object_copy__2;
      float v11 = __Block_byref_object_dispose__2;
      id v12 = 0;
      int v5 = v4[1];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_27;
      v6[3] = &unk_1E6C20D10;
      v6[4] = v4;
      v6[5] = &v7;
      dispatch_sync(v5, v6);
      dispatch_source_cancel((dispatch_source_t)v8[5]);
      _Block_object_dispose(&v7, 8);
    }
  }
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_27(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;
}

- (BOOL)start
{
  if ([(AVAudioEngine *)self->_engine isInManualRenderingMode])
  {
    engine = self->_engine;
    id v9 = 0;
    BOOL v4 = [(AVAudioEngine *)engine startAndReturnError:&v9];
    id v5 = v9;
    double v6 = v5;
    if (!v4 && v5)
    {
      uint64_t v7 = TLLogPlayback();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(TLAttentionAwarenessEffectProcessor *)v6 start];
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  self->_started = 1;
  return v4;
}

- (AudioBufferList)render:(AudioBufferList *)a3 numberOfFrames:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(AVAudioPCMBuffer *)self->_destinationPCMBuffer frameCapacity] < a4) {
    return 0;
  }
  int v10 = 0;
  self->_inputNodeInputBufferList = a3;
  float v8 = [(AVAudioEngine *)self->_engine manualRenderingBlock];
  ((void (**)(void, uint64_t, uint64_t, int *))v8)[2](v8, v4, [(AVAudioPCMBuffer *)self->_destinationPCMBuffer mutableAudioBufferList], &v10);
  uint64_t v7 = (AudioBufferList *)[(AVAudioPCMBuffer *)self->_destinationPCMBuffer mutableAudioBufferList];

  return v7;
}

- (void)stop
{
  self->_started = 0;
}

- (void)_applyEffectMix:(float)a3
{
  inputNode = self->_inputNode;
  double v6 = [(AVAudioEngine *)self->_engine mainMixerNode];
  id v12 = [(AVAudioInputNode *)inputNode destinationForMixer:v6 bus:1];

  *(float *)&double v7 = a3;
  [v12 setVolume:v7];
  float v8 = self->_inputNode;
  id v9 = [(AVAudioEngine *)self->_engine mainMixerNode];
  int v10 = [(AVAudioInputNode *)v8 destinationForMixer:v9 bus:0];

  *(float *)&double v11 = 1.0 - a3;
  [v10 setVolume:v11];
}

- (float)_currentEffectMix
{
  inputNode = self->_inputNode;
  double v3 = [(AVAudioEngine *)self->_engine mainMixerNode];
  uint64_t v4 = [(AVAudioInputNode *)inputNode destinationForMixer:v3 bus:1];

  [v4 volume];
  float v6 = v5;

  return v6;
}

- (float)_sanitizeEffectMix:(float)a3
{
  double v3 = a3;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  return fmin(v3, 1.0);
}

- (void)_applyEffectParameters:(id)a3 includingEffectMix:(BOOL)a4
{
  BOOL v4 = a4;
  float var2 = a3.var2;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  float var1 = a3.var1;
  BOOL var0 = a3.var0;
  if ([(AVAudioUnitEQ *)self->_lowPassFilter bypass] != a3.var0) {
    [(AVAudioUnitEQ *)self->_lowPassFilter setBypass:var0];
  }
  id v9 = TLLogPlayback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TLAttentionAwarenessEffectProcessor _applyEffectParameters:includingEffectMix:]((uint64_t)self);
  }

  int v10 = [(AVAudioSession *)self->_audioSession category];
  if ([v10 isEqualToString:*MEMORY[0x1E4F14FB0]])
  {
    if (var1 > 1.0 || (float v11 = -20.0, var1 <= 0.875))
    {
      if (var1 > 0.875 || (float v11 = -16.0, var1 <= 0.75))
      {
        if (var1 > 0.75 || (float v11 = -14.0, var1 <= 0.625))
        {
          if (var1 > 0.625 || (float v11 = -11.0, var1 <= 0.5))
          {
            BOOL v12 = var1 <= 0.25 || var1 > 0.5;
            float v13 = -3.0;
            float v14 = -6.0;
LABEL_31:
            if (v12) {
              float v11 = v13;
            }
            else {
              float v11 = v14;
            }
          }
        }
      }
    }
  }
  else
  {
    float v11 = 0.0;
    if ([v10 isEqualToString:*MEMORY[0x1E4F14F60]])
    {
      if (var1 > 1.0 || (float v11 = -28.0, var1 <= 0.875))
      {
        if (var1 > 0.875 || (float v11 = -24.0, var1 <= 0.75))
        {
          if (var1 > 0.75 || (float v11 = -22.0, var1 <= 0.625))
          {
            if (var1 > 0.625 || (float v11 = -20.0, var1 <= 0.5))
            {
              BOOL v12 = var1 <= 0.25 || var1 > 0.5;
              float v13 = -12.0;
              float v14 = -16.0;
              goto LABEL_31;
            }
          }
        }
      }
    }
  }
  [(AVAudioUnitEQ *)self->_lowPassFilter globalGain];
  if (llroundf(*(float *)&v15 * 8388600.0) == llroundf(v11 * 8388600.0))
  {
    float v16 = TLLogPlayback();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[TLAttentionAwarenessEffectProcessor _applyEffectParameters:includingEffectMix:]((uint64_t)self);
    }
  }
  else
  {
    *(float *)&double v15 = v11;
    [(AVAudioUnitEQ *)self->_lowPassFilter setGlobalGain:v15];
    float v16 = TLLogPlayback();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138543874;
      double v19 = self;
      __int16 v20 = 2048;
      double v21 = v11;
      __int16 v22 = 2114;
      int v23 = v10;
      _os_log_debug_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: -_applyEffectParameters:. Set low pass filter global gain to %0.2f for audio session category %{public}@.", (uint8_t *)&v18, 0x20u);
    }
  }

  if (v4)
  {
    *(float *)&double v17 = var2;
    [(TLAttentionAwarenessEffectProcessor *)self _applyEffectMix:v17];
  }
}

- (void)_assertRunningOnAccessQueue
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "Expected to be running in access queue.", v2, v3, v4, v5, v6);
}

- (void)_assertNotRunningOnAccessQueue
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "Expected not to be running in access queue.", v2, v3, v4, v5, v6);
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectMixFadingTimer, 0);
  objc_storeStrong((id *)&self->_reverb, 0);
  objc_storeStrong((id *)&self->_lowPassFilter, 0);
  objc_storeStrong((id *)&self->_inputNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_destinationPCMBuffer, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)initWithProcessingFormat:(uint64_t)a1 framesPerRender:(id *)a2 audioSession:effectParameters:.cold.1(uint64_t a1, id *a2)
{
  [*a2 wetDryMix];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_0(&dword_1DB936000, v2, v3, "%{public}@: -init. Reverb wet dry mix: %f.", v4, v5, v6, v7, 2u);
}

- (void)initWithProcessingFormat:(uint64_t)a1 framesPerRender:(void *)a2 audioSession:effectParameters:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1DB936000, v3, v4, "%{public}@: -init. Error loading reverb preset: %{public}@.", v5, v6, v7, v8, v9);
}

- (void)initWithProcessingFormat:(uint64_t)a1 framesPerRender:(void *)a2 audioSession:effectParameters:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1DB936000, v3, v4, "%{public}@: -init. Error loading equalizer preset: %{public}@.", v5, v6, v7, v8, v9);
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) globalGain];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_0(&dword_1DB936000, v1, v2, "%{public}@: -setEffectParameters:. Current low pass filter global gain: %0.2f.", v3, v4, v5, v6, 2u);
}

- (void)start
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "tl_nonRedundantDescription");
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DB936000, a2, OS_LOG_TYPE_ERROR, "Could not start engine: %{public}@.", (uint8_t *)&v4, 0xCu);
}

- (void)_applyEffectParameters:(uint64_t)a1 includingEffectMix:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1DB936000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: -_applyEffectParameters:. Low pass filter global gain is already set to %0.2f.", (uint8_t *)&v2, 0x16u);
}

- (void)_applyEffectParameters:(uint64_t)a1 includingEffectMix:.cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1DB936000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: -_applyEffectParameters:. Volume for low pass filter global gain: %0.2f.", (uint8_t *)&v2, 0x16u);
}

@end