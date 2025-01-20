@interface SSRVoiceActivityDetector
- (BOOL)endpointReported;
- (BOOL)startpointReported;
- (EARCaesuraSilencePosteriorGenerator)earSpg;
- (OS_dispatch_queue)spgQueue;
- (SSRSpeakerRecognitionContext)context;
- (SSRVoiceActivityDetector)initWithContext:(id)a3 delegate:(id)a4;
- (SSRVoiceActivityDetectorDelegate)delegate;
- (_EARDefaultServerEndpointFeatures)defSepFeats;
- (_EAREndpointer)hybridClassifier;
- (int64_t)segmentStartPointSampleCount;
- (unint64_t)numSamplesProcessed;
- (void)_initializeSPGWithContext:(id)a3;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)endAudio;
- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4;
- (void)resetWithContext:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefSepFeats:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEarSpg:(id)a3;
- (void)setEndpointReported:(BOOL)a3;
- (void)setHybridClassifier:(id)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setSegmentStartPointSampleCount:(int64_t)a3;
- (void)setSpgQueue:(id)a3;
- (void)setStartpointReported:(BOOL)a3;
@end

@implementation SSRVoiceActivityDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spgQueue, 0);
  objc_storeStrong((id *)&self->_defSepFeats, 0);
  objc_storeStrong((id *)&self->_hybridClassifier, 0);
  objc_storeStrong((id *)&self->_earSpg, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setSpgQueue:(id)a3
{
}

- (OS_dispatch_queue)spgQueue
{
  return self->_spgQueue;
}

- (void)setStartpointReported:(BOOL)a3
{
  self->_startpointReported = a3;
}

- (BOOL)startpointReported
{
  return self->_startpointReported;
}

- (void)setEndpointReported:(BOOL)a3
{
  self->_endpointReported = a3;
}

- (BOOL)endpointReported
{
  return self->_endpointReported;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setSegmentStartPointSampleCount:(int64_t)a3
{
  self->_segmentStartPointSampleCount = a3;
}

- (int64_t)segmentStartPointSampleCount
{
  return self->_segmentStartPointSampleCount;
}

- (void)setDefSepFeats:(id)a3
{
}

- (_EARDefaultServerEndpointFeatures)defSepFeats
{
  return self->_defSepFeats;
}

- (void)setHybridClassifier:(id)a3
{
}

- (_EAREndpointer)hybridClassifier
{
  return self->_hybridClassifier;
}

- (void)setEarSpg:(id)a3
{
}

- (EARCaesuraSilencePosteriorGenerator)earSpg
{
  return self->_earSpg;
}

- (void)setDelegate:(id)a3
{
}

- (SSRVoiceActivityDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRVoiceActivityDetectorDelegate *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_endpointReported)
  {
    v5 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v61 = "-[SSRVoiceActivityDetector clientSilenceFeaturesAvailable:]";
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Endpoint already reported. Not scheduling", buf, 0xCu);
    }
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F3B3E8]);
    uint64_t v7 = [(_EARDefaultServerEndpointFeatures *)self->_defSepFeats wordCount];
    uint64_t v8 = [(_EARDefaultServerEndpointFeatures *)self->_defSepFeats trailingSilenceDuration];
    [(_EARDefaultServerEndpointFeatures *)self->_defSepFeats endOfSentenceLikelihood];
    double v10 = v9;
    [(_EARDefaultServerEndpointFeatures *)self->_defSepFeats acousticEndpointerScore];
    double v12 = v11;
    [(_EARDefaultServerEndpointFeatures *)self->_defSepFeats silencePosterior];
    double v14 = v13;
    [v4 silenceFramesCountMs];
    double v16 = v15;
    [v4 silenceProbability];
    double v18 = v17;
    [v4 silenceDurationMs];
    float v20 = v19;
    [v4 processedAudioMs];
    *(float *)&double v22 = v21;
    *(float *)&double v23 = v20;
    v24 = (void *)[v6 initWithWordCount:v7 trailingSilenceDuration:v8 endOfSentenceLikelihood:MEMORY[0x263EFFA68] acousticEndpointerScore:0 pauseCounts:v10 silencePosterior:v12 clientSilenceFramesCountMs:v14 clientSilenceProbability:v16 silencePosteriorNF:v18 serverFeaturesLatency:v23 eagerResultEndTime:v22];
    uint64_t v59 = 0;
    hybridClassifier = self->_hybridClassifier;
    [v4 processedAudioMs];
    id v58 = 0;
    int v26 = -[_EAREndpointer didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:](hybridClassifier, "didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:", v24, &v58, (char *)&v59 + 4, &v59);
    id v27 = v58;
    [v4 processedAudioMs];
    double v29 = v28;
    *(float *)&double v12 = (float)(1000 * self->_segmentStartPointSampleCount);
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    unint64_t v31 = (unint64_t)(v29 + (float)(*(float *)&v12 / v30));
    if (v26)
    {
      self->_endpointReported = 1;
      v32 = (void *)*MEMORY[0x263F37FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        [v4 silenceFramesCountMs];
        uint64_t v35 = v34;
        [v4 silenceDurationMs];
        uint64_t v37 = v36;
        [v4 silenceProbability];
        uint64_t v39 = v38;
        [v4 processedAudioMs];
        *(_DWORD *)buf = 136316162;
        v61 = "-[SSRVoiceActivityDetector clientSilenceFeaturesAvailable:]";
        __int16 v62 = 2048;
        uint64_t v63 = v35;
        __int16 v64 = 2048;
        uint64_t v65 = v37;
        __int16 v66 = 2048;
        uint64_t v67 = v39;
        __int16 v68 = 2048;
        uint64_t v69 = v40;
        _os_log_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_DEFAULT, "%s Found Endpoint at: [%f %f %f %f]", buf, 0x34u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v42 = objc_opt_respondsToSelector();

      if (v42)
      {
        id v43 = objc_loadWeakRetained((id *)&self->_delegate);
        [v43 SSRVoiceActivityDetector:self didDetectEndPointAt:v31];
      }
    }
    else if (!self->_startpointReported)
    {
      [v4 silenceProbability];
      if (v44 >= 0.5)
      {
        self->_numConsecutiveNonSilenceFrames = 0;
      }
      else
      {
        unint64_t v45 = self->_numConsecutiveNonSilenceFrames + 1;
        self->_numConsecutiveNonSilenceFrames = v45;
        if (v45 >= 0xA)
        {
          v46 = (void *)*MEMORY[0x263F37FA0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
          {
            v47 = v46;
            [v4 silenceFramesCountMs];
            uint64_t v49 = v48;
            [v4 silenceDurationMs];
            uint64_t v51 = v50;
            [v4 silenceProbability];
            uint64_t v53 = v52;
            [v4 processedAudioMs];
            *(_DWORD *)buf = 136316162;
            v61 = "-[SSRVoiceActivityDetector clientSilenceFeaturesAvailable:]";
            __int16 v62 = 2048;
            uint64_t v63 = v49;
            __int16 v64 = 2048;
            uint64_t v65 = v51;
            __int16 v66 = 2048;
            uint64_t v67 = v53;
            __int16 v68 = 2048;
            uint64_t v69 = v54;
            _os_log_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_DEFAULT, "%s Found startpoint at: [%f %f %f %f]", buf, 0x34u);
          }
          id v55 = objc_loadWeakRetained((id *)&self->_delegate);
          char v56 = objc_opt_respondsToSelector();

          if (v56)
          {
            id v57 = objc_loadWeakRetained((id *)&self->_delegate);
            [v57 SSRVoiceActivityDetector:self didDetectStartPointAt:v31];
          }
          self->_startpointReported = 1;
        }
      }
    }
  }
}

- (void)_initializeSPGWithContext:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F3B3B8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 vadResourcePath];

  uint64_t v8 = [v7 path];
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  double v10 = (EARCaesuraSilencePosteriorGenerator *)[v6 initWithConfigFile:v8 samplingRate:(unint64_t)v9 queue:self->_spgQueue];
  earSpg = self->_earSpg;
  self->_earSpg = v10;

  double v12 = self->_earSpg;

  [(EARCaesuraSilencePosteriorGenerator *)v12 setDelegate:self];
}

- (void)resetWithContext:(id)a3
{
  id v4 = (SSRSpeakerRecognitionContext *)a3;
  [(EARCaesuraSilencePosteriorGenerator *)self->_earSpg endAudio];
  context = self->_context;
  self->_context = v4;
  id v6 = v4;

  self->_segmentStartPointSampleCount = self->_numSamplesProcessed;
  self->_numConsecutiveNonSilenceFrames = 0;
  [(SSRVoiceActivityDetector *)self _initializeSPGWithContext:v6];

  *(_WORD *)&self->_endpointReported = 0;
}

- (void)endAudio
{
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[EARCaesuraSilencePosteriorGenerator addAudio:numSamples:](self->_earSpg, "addAudio:numSamples:", a3);
  unint64_t v6 = self->_numSamplesProcessed + a4;
  self->_numSamplesProcessed = v6;
  if (__ROR8__(0x1CAC083126E978D5 * v6, 7) <= 0x4189374BC6A7EuLL)
  {
    uint64_t v7 = (void *)*MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)MEMORY[0x263F38018];
      float v9 = v7;
      [v8 inputRecordingSampleRate];
      int v11 = 136315394;
      double v12 = "-[SSRVoiceActivityDetector processAudioData:numSamples:]";
      __int16 v13 = 2048;
      double v14 = (double)v6 / v10;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s VAD processed %f secs of audio", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (SSRVoiceActivityDetector)initWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SSRVoiceActivityDetector;
  float v9 = [(SSRVoiceActivityDetector *)&v26 init];
  float v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    uint64_t v11 = [MEMORY[0x263F380D0] getSerialQueueWithQOS:33 name:@"com.apple.ssr.vad.spg" fixedPriority:*MEMORY[0x263F38110]];
    spgQueue = v10->_spgQueue;
    v10->_spgQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_context, a3);
    v10->_numConsecutiveNonSilenceFrames = 0;
    v10->_segmentStartPointSampleCount = 0;
    v10->_numSamplesProcessed = 0;
    [(SSRVoiceActivityDetector *)v10 _initializeSPGWithContext:v7];
    id v13 = objc_alloc(MEMORY[0x263F3B400]);
    double v14 = [v7 vadResourcePath];
    uint64_t v15 = [v14 path];
    id v25 = 0;
    uint64_t v16 = [v13 initWithConfiguration:v15 modelVersion:&v25];
    id v17 = v25;
    hybridClassifier = v10->_hybridClassifier;
    v10->_hybridClassifier = (_EAREndpointer *)v16;

    double v19 = v10->_hybridClassifier;
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    if (([(_EAREndpointer *)v19 requestSupportedWithSamplingRate:(unint64_t)v20] & 1) == 0)
    {
      double v21 = *MEMORY[0x263F37FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v28 = "-[SSRVoiceActivityDetector initWithContext:delegate:]";
        _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s ERR: Hybrid endpointer not ready for processing request", buf, 0xCu);
      }
    }
    uint64_t v22 = [(_EAREndpointer *)v10->_hybridClassifier defaultServerEndpointFeatures];
    defSepFeats = v10->_defSepFeats;
    v10->_defSepFeats = (_EARDefaultServerEndpointFeatures *)v22;

    v10->_endpointReported = 0;
  }

  return v10;
}

@end