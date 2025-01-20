@interface OSDAnalyzer
- (BOOL)endOfSpeechDetected;
- (BOOL)startOfSpeechDetected;
- (EARCaesuraSilencePosteriorGenerator)caesuraSPG;
- (NSDictionary)osdContext;
- (OSDAnalyzer)initWithConfigFile:(id)a3 sampleRate:(unint64_t)a4 context:(id)a5 queue:(id)a6 delegate:(id)a7;
- (OSDAnalyzerDelegate)delegate;
- (OSDFeatures)osdFeatures;
- (OS_dispatch_queue)lipMovementQueue;
- (OS_dispatch_queue)queue;
- (SDLipMovementVAD)lipMovementVAD;
- (id)getCurrentOSDFeatures;
- (int64_t)getFrameDurationMs;
- (void)addAudio:(id)a3 numSamples:(unint64_t)a4;
- (void)addFaceTrackingData:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)didUpdateVisualSpeechProbability:(double)a3 from:(unint64_t)a4 to:(unint64_t)a5;
- (void)endAudio;
- (void)setCaesuraSPG:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndOfSpeechDetected:(BOOL)a3;
- (void)setLipMovementQueue:(id)a3;
- (void)setLipMovementVAD:(id)a3;
- (void)setOsdContext:(id)a3;
- (void)setOsdFeatures:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartOfSpeechDetected:(BOOL)a3;
- (void)setupLipMovementVADWithModelPath:(id)a3;
@end

@implementation OSDAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lipMovementVAD, 0);
  objc_storeStrong((id *)&self->_lipMovementQueue, 0);
  objc_storeStrong((id *)&self->_osdFeatures, 0);
  objc_storeStrong((id *)&self->_osdContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_caesuraSPG, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLipMovementVAD:(id)a3
{
}

- (SDLipMovementVAD)lipMovementVAD
{
  return self->_lipMovementVAD;
}

- (void)setLipMovementQueue:(id)a3
{
}

- (OS_dispatch_queue)lipMovementQueue
{
  return self->_lipMovementQueue;
}

- (void)setStartOfSpeechDetected:(BOOL)a3
{
  self->_startOfSpeechDetected = a3;
}

- (BOOL)startOfSpeechDetected
{
  return self->_startOfSpeechDetected;
}

- (void)setEndOfSpeechDetected:(BOOL)a3
{
  self->_endOfSpeechDetected = a3;
}

- (BOOL)endOfSpeechDetected
{
  return self->_endOfSpeechDetected;
}

- (void)setOsdFeatures:(id)a3
{
}

- (OSDFeatures)osdFeatures
{
  return self->_osdFeatures;
}

- (void)setOsdContext:(id)a3
{
}

- (NSDictionary)osdContext
{
  return self->_osdContext;
}

- (void)setDelegate:(id)a3
{
}

- (OSDAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OSDAnalyzerDelegate *)WeakRetained;
}

- (void)setCaesuraSPG:(id)a3
{
}

- (EARCaesuraSilencePosteriorGenerator)caesuraSPG
{
  return self->_caesuraSPG;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4 = a3;
  v5 = [OSDFeatures alloc];
  [v4 silenceFramesCountMs];
  double v7 = v6;
  [v4 silenceProbability];
  double v9 = v8;
  [v4 silenceDurationMs];
  double v11 = v10;
  [v4 processedAudioMs];
  double v13 = v12;
  uint64_t v14 = [v4 inferenceTime];

  v15 = [(OSDFeatures *)v5 initWithSilenceFramesCountMs:v14 silenceProbability:v7 silenceDurationMs:v9 processedAudioMs:v11 inferenceTime:v13];
  osdFeatures = self->_osdFeatures;
  self->_osdFeatures = v15;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      [v21 osdAnalyzer:self didUpdateOSDFeatures:self->_osdFeatures];
    }
  }
  if (!self->_startOfSpeechDetected)
  {
    [(OSDFeatures *)self->_osdFeatures silenceProbability];
    if (v22 >= 0.6)
    {
      self->_numConsecutiveNonSilenceFrames = 0;
    }
    else
    {
      unint64_t v23 = self->_numConsecutiveNonSilenceFrames + 1;
      self->_numConsecutiveNonSilenceFrames = v23;
      if (v23 >= 0xA)
      {
        id v24 = objc_loadWeakRetained((id *)&self->_delegate);
        char v25 = objc_opt_respondsToSelector();

        if (v25)
        {
          id v26 = objc_loadWeakRetained((id *)&self->_delegate);
          [(OSDFeatures *)self->_osdFeatures processedAudioMs];
          objc_msgSend(v26, "osdAnalyzer:didDetectStartOfSpeechAt:", self);
        }
        self->_startOfSpeechDetected = 1;
      }
    }
  }
  if (!self->_endOfSpeechDetected && self->_startOfSpeechDetected)
  {
    [(OSDFeatures *)self->_osdFeatures silenceDurationMs];
    if (v27 >= 0.975)
    {
      id v28 = objc_loadWeakRetained((id *)&self->_delegate);
      if (v28)
      {
        v29 = v28;
        id v30 = objc_loadWeakRetained((id *)&self->_delegate);
        char v31 = objc_opt_respondsToSelector();

        if (v31)
        {
          id v32 = objc_loadWeakRetained((id *)&self->_delegate);
          [(OSDFeatures *)self->_osdFeatures processedAudioMs];
          objc_msgSend(v32, "osdAnalyzer:didDetectEndOfSpeechAt:", self);
        }
      }
      self->_endOfSpeechDetected = 1;
    }
  }
}

- (void)endAudio
{
}

- (void)addFaceTrackingData:(id)a3 atMachAbsTime:(unint64_t)a4
{
  id v6 = a3;
  lipMovementQueue = self->_lipMovementQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__OSDAnalyzer_addFaceTrackingData_atMachAbsTime___block_invoke;
  block[3] = &unk_2644CCA08;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(lipMovementQueue, block);
}

uint64_t __49__OSDAnalyzer_addFaceTrackingData_atMachAbsTime___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 72) addFaceTrackingData:a1[5] atMachAbsTime:a1[6]];
}

- (void)didUpdateVisualSpeechProbability:(double)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    unint64_t v11 = WeakRetained;
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_delegate);
      [v14 osdAnalyzer:self didUpdateVisualSpeechProbability:a4 from:a5 to:a3];
    }
  }
}

- (void)setupLipMovementVADWithModelPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SDLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    double v9 = "-[OSDAnalyzer setupLipMovementVADWithModelPath:]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_21E886000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating lipmovementvad with model path of: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [[SDLipMovementVAD alloc] initWithModelFile:v4];
  lipMovementVAD = self->_lipMovementVAD;
  self->_lipMovementVAD = v6;

  [(SDLipMovementVAD *)self->_lipMovementVAD setDelegate:self];
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
}

- (int64_t)getFrameDurationMs
{
  return [(EARCaesuraSilencePosteriorGenerator *)self->_caesuraSPG getFrameDurationMs];
}

- (id)getCurrentOSDFeatures
{
  return self->_osdFeatures;
}

- (OSDAnalyzer)initWithConfigFile:(id)a3 sampleRate:(unint64_t)a4 context:(id)a5 queue:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)OSDAnalyzer;
  v16 = [(OSDAnalyzer *)&v30 init];
  if (v16)
  {
    if (SDLogInitIfNeeded_once != -1) {
      dispatch_once(&SDLogInitIfNeeded_once, &__block_literal_global);
    }
    objc_storeWeak((id *)&v16->_delegate, v15);
    uint64_t v17 = [v13 copy];
    osdContext = v16->_osdContext;
    v16->_osdContext = (NSDictionary *)v17;

    if (v14) {
      dispatch_queue_t v19 = (dispatch_queue_t)v14;
    }
    else {
      dispatch_queue_t v19 = dispatch_queue_create("OSD queue", 0);
    }
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F3B3B8]) initWithConfigFile:v12 samplingRate:a4 queue:v16->_queue];
    caesuraSPG = v16->_caesuraSPG;
    v16->_caesuraSPG = (EARCaesuraSilencePosteriorGenerator *)v21;

    unint64_t v23 = v16->_caesuraSPG;
    if (!v23)
    {
      id v28 = 0;
      goto LABEL_11;
    }
    [(EARCaesuraSilencePosteriorGenerator *)v23 setDelegate:v16];
    id v24 = [[OSDFeatures alloc] initWithSilenceFramesCountMs:0 silenceProbability:0.0 silenceDurationMs:0.0 processedAudioMs:0.0 inferenceTime:0.0];
    osdFeatures = v16->_osdFeatures;
    v16->_osdFeatures = v24;

    dispatch_queue_t v26 = dispatch_queue_create("LipMovementVAD queue", 0);
    lipMovementQueue = v16->_lipMovementQueue;
    v16->_lipMovementQueue = (OS_dispatch_queue *)v26;
  }
  id v28 = v16;
LABEL_11:

  return v28;
}

@end