@interface SSRSpeakerAnalyzerPSR
- (BOOL)_isSpeakerVectorValid:(id)a3 speakerVectorSize:(unint64_t)a4 fromPsrAudioProcessor:(id)a5;
- (EARSyncPSRAudioProcessor)psrAudioProcessor;
- (NSArray)psrScorers;
- (NSDictionary)voiceProfilesExpModelFilePaths;
- (NSDictionary)voiceProfilesModelFilePaths;
- (NSURL)configFilePath;
- (NSURL)resourceFilePath;
- (OS_dispatch_queue)desRecordQueue;
- (SSRSpeakerAnalyzerPSR)initWithVoiceRecognitionContext:(id)a3 delegate:(id)a4;
- (SSRSpeakerAnalyzerPSRDelegate)delegate;
- (SSRSpeakerRecognitionContext)context;
- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 processedAudioDurationMs:(unint64_t)a5;
- (id)getVoiceRecognizerResults;
- (id)resetForNewRequest;
- (unint64_t)getEARSyncPSRAudioProcessorProcessingTime;
- (void)dealloc;
- (void)endAudio;
- (void)processAudioData:(id)a3;
- (void)psrAudioProcessor:(id)a3 finishedWithFinalSpeakerVector:(id)a4 speakerVectorSize:(unint64_t)a5 processedAudioDurationMs:(unint64_t)a6;
- (void)psrAudioProcessor:(id)a3 hasSpeakerVector:(id)a4 speakerVectorSize:(unint64_t)a5 processedAudioDurationMs:(unint64_t)a6;
- (void)setConfigFilePath:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesRecordQueue:(id)a3;
- (void)setPsrAudioProcessor:(id)a3;
- (void)setPsrScorers:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)setVoiceProfilesExpModelFilePaths:(id)a3;
- (void)setVoiceProfilesModelFilePaths:(id)a3;
@end

@implementation SSRSpeakerAnalyzerPSR

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desRecordQueue, 0);
  objc_storeStrong((id *)&self->_psrScorers, 0);
  objc_storeStrong((id *)&self->_voiceProfilesExpModelFilePaths, 0);
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_psrAudioProcessor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDesRecordQueue:(id)a3
{
}

- (OS_dispatch_queue)desRecordQueue
{
  return self->_desRecordQueue;
}

- (void)setPsrScorers:(id)a3
{
}

- (NSArray)psrScorers
{
  return self->_psrScorers;
}

- (void)setVoiceProfilesExpModelFilePaths:(id)a3
{
}

- (NSDictionary)voiceProfilesExpModelFilePaths
{
  return self->_voiceProfilesExpModelFilePaths;
}

- (void)setVoiceProfilesModelFilePaths:(id)a3
{
}

- (NSDictionary)voiceProfilesModelFilePaths
{
  return self->_voiceProfilesModelFilePaths;
}

- (void)setContext:(id)a3
{
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)setResourceFilePath:(id)a3
{
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (void)setConfigFilePath:(id)a3
{
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (void)setPsrAudioProcessor:(id)a3
{
}

- (EARSyncPSRAudioProcessor)psrAudioProcessor
{
  return self->_psrAudioProcessor;
}

- (void)setDelegate:(id)a3
{
}

- (SSRSpeakerAnalyzerPSRDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRSpeakerAnalyzerPSRDelegate *)WeakRetained;
}

- (void)psrAudioProcessor:(id)a3 finishedWithFinalSpeakerVector:(id)a4 speakerVectorSize:(unint64_t)a5 processedAudioDurationMs:(unint64_t)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if ([(SSRSpeakerAnalyzerPSR *)self _isSpeakerVectorValid:v11 speakerVectorSize:a5 fromPsrAudioProcessor:v10])
  {
    v12 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numSamplesProecssed = self->_numSamplesProecssed;
      int v19 = 136316162;
      v20 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:finishedWithFinalSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      __int16 v21 = 2114;
      id v22 = v10;
      __int16 v23 = 2050;
      unint64_t v24 = a5;
      __int16 v25 = 2050;
      unint64_t v26 = a6;
      __int16 v27 = 2050;
      unint64_t v28 = numSamplesProecssed;
      _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s FINISHED processing: psrAudioProcessor:%{public}@ finishedWithFinalSpeakerVector: speakerVectorSize:%{public}lu processedAudioDurationMs: %{public}lu %{public}lu", (uint8_t *)&v19, 0x34u);
    }
    v14 = [(SSRSpeakerAnalyzerPSR *)self _processSpeakerVector:v11 withSize:a5 processedAudioDurationMs:a6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 voiceRecognitionPSRAnalyzerFinishedProcessing:self withVoiceRecognitionInfo:v14];
    }
  }
  else
  {
    v18 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:finishedWithFinalSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      __int16 v21 = 1024;
      LODWORD(v22) = a5;
      _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s Invalid speaker vector with size %d - Skipping", (uint8_t *)&v19, 0x12u);
    }
  }
}

- (void)psrAudioProcessor:(id)a3 hasSpeakerVector:(id)a4 speakerVectorSize:(unint64_t)a5 processedAudioDurationMs:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if ([(SSRSpeakerAnalyzerPSR *)self _isSpeakerVectorValid:v11 speakerVectorSize:a5 fromPsrAudioProcessor:v10])
  {
    v12 = [(SSRSpeakerAnalyzerPSR *)self _processSpeakerVector:v11 withSize:a5 processedAudioDurationMs:a6];
    v13 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315906;
      int v19 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:hasSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2050;
      unint64_t v23 = a5;
      __int16 v24 = 2050;
      unint64_t v25 = a6;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s processing: psrAudioProcessor:%{public}@ speakerVectorSize:%{public}lu processedAudioDurationMs: %{public}lu", (uint8_t *)&v18, 0x2Au);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 voiceRecognitionPSRAnalyzer:self hasVoiceRecognitionInfo:v12];
    }
  }
  else
  {
    id v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      int v19 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:hasSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      __int16 v20 = 1024;
      LODWORD(v21) = a5;
      _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s Invalid speaker vector with size %d - Skipping", (uint8_t *)&v18, 0x12u);
    }
  }
}

- (BOOL)_isSpeakerVectorValid:(id)a3 speakerVectorSize:(unint64_t)a4 fromPsrAudioProcessor:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (EARSyncPSRAudioProcessor *)a5;
  psrAudioProcessor = self->_psrAudioProcessor;
  if (psrAudioProcessor == v9)
  {
    if (v8)
    {
      if (a4)
      {
        BOOL v12 = 1;
        goto LABEL_12;
      }
      id v17 = *MEMORY[0x263F37FA0];
      BOOL v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v19 = 136315394;
      __int16 v20 = "-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:]";
      __int16 v21 = 2050;
      __int16 v22 = 0;
      v13 = "%s Invalid speakerVectorSize=%{public}lu";
      v14 = v17;
      uint32_t v15 = 22;
    }
    else
    {
      id v16 = *MEMORY[0x263F37FA0];
      BOOL v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v19 = 136315138;
      __int16 v20 = "-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:]";
      v13 = "%s ERR: psrResult is nil";
      v14 = v16;
      uint32_t v15 = 12;
    }
    goto LABEL_4;
  }
  id v11 = *MEMORY[0x263F37FA0];
  BOOL v12 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    __int16 v20 = "-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:]";
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2112;
    __int16 v24 = psrAudioProcessor;
    v13 = "%s ERR: Reporting psrAudioProcessor(%@) != _psrAudioProcessor(%@)";
    v14 = v11;
    uint32_t v15 = 32;
LABEL_4:
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    BOOL v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 processedAudioDurationMs:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_psrScorers, "count"));
  BOOL v9 = [(SSRSpeakerRecognitionContext *)self->_context recognitionStyle] == 1
    && !self->_triggerPhraseDetectedOnTap;
  unint64_t v23 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = self->_psrScorers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v14 scoreSpeakerVector:v24 withDimensions:a4 withThresholdType:v9];
        uint32_t v15 = objc_msgSend(NSNumber, "numberWithFloat:");
        id v16 = [v14 profileID];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v11);
  }

  v31 = @"configPath";
  id v17 = [(NSURL *)self->_configFilePath path];
  v32 = v17;
  int v18 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

  v30[0] = v8;
  v29[0] = @"spIdKnownUserPSRScores";
  v29[1] = @"spIdUnknownUserScore";
  int v19 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  v30[1] = v19;
  v29[2] = @"spIdAudioProcessedDuration";
  __int16 v20 = [NSNumber numberWithUnsignedInteger:v23];
  v29[3] = @"psrContext";
  v30[2] = v20;
  v30[3] = v18;
  __int16 v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];

  return v21;
}

- (unint64_t)getEARSyncPSRAudioProcessorProcessingTime
{
  return [(EARSyncPSRAudioProcessor *)self->_psrAudioProcessor getAccmulatedProcessingTime];
}

- (id)getVoiceRecognizerResults
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  p_psrScorers = &self->_psrScorers;
  v39 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_psrScorers, "count"));
  v36 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](*p_psrScorers, "count"));
  v38 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_psrScorers, "count"));
  BOOL v4 = [(SSRSpeakerRecognitionContext *)self->_context recognitionStyle] == 1
    && !self->_triggerPhraseDetectedOnTap;
  v5 = [(EARSyncPSRAudioProcessor *)self->_psrAudioProcessor getLatestSuperVector];
  unint64_t v6 = [v5 length];
  if (v6 > 3)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obj = self->_psrScorers;
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v9)
    {
      unint64_t v10 = v6 >> 2;
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v13 scoreSpeakerVector:v5 withDimensions:v10 withThresholdType:v4];
          v14 = objc_msgSend(NSNumber, "numberWithFloat:");
          uint32_t v15 = [v13 profileID];
          [v39 setObject:v14 forKeyedSubscript:v15];

          id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "getSATVectorCount"));
          id v17 = [v13 profileID];
          [v38 setObject:v16 forKeyedSubscript:v17];

          voiceProfilesExpModelFilePaths = self->_voiceProfilesExpModelFilePaths;
          if (voiceProfilesExpModelFilePaths)
          {
            int v19 = [v13 profileID];
            __int16 v20 = [(NSDictionary *)voiceProfilesExpModelFilePaths objectForKeyedSubscript:v19];
            BOOL v21 = v20 == 0;

            if (!v21)
            {
              __int16 v22 = self->_voiceProfilesExpModelFilePaths;
              unint64_t v23 = [v13 profileID];
              id v24 = [(NSDictionary *)v22 objectForKeyedSubscript:v23];
              [v13 resetScorerWithModelFilePath:v24];

              [v13 scoreSpeakerVector:v5 withDimensions:v10 withThresholdType:v4];
              long long v25 = objc_msgSend(NSNumber, "numberWithFloat:");
              long long v26 = [v13 profileID];
              [v36 setObject:v25 forKeyedSubscript:v26];
            }
          }
          voiceProfilesModelFilePaths = self->_voiceProfilesModelFilePaths;
          long long v28 = [v13 profileID];
          uint64_t v29 = [(NSDictionary *)voiceProfilesModelFilePaths objectForKeyedSubscript:v28];
          [v13 resetScorerWithModelFilePath:v29];
        }
        uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v9);
    }

    desRecordQueue = self->_desRecordQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__SSRSpeakerAnalyzerPSR_getVoiceRecognizerResults__block_invoke;
    block[3] = &unk_26442A310;
    id v31 = v39;
    id v41 = v31;
    v42 = self;
    id v43 = v5;
    dispatch_async(desRecordQueue, block);
    v50[0] = @"configPath";
    v32 = [(NSURL *)self->_configFilePath path];
    v50[1] = @"numSpeakerVectors";
    v51[0] = v32;
    v51[1] = v38;
    v33 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

    v48[0] = @"spIdKnownUserPSRScores";
    v48[1] = @"spIdKnownUserPSRExpScores";
    v49[0] = v31;
    v49[1] = v36;
    v48[2] = @"spIdUnknownUserScore";
    uint64_t v34 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    v48[3] = @"psrContext";
    v49[2] = v34;
    v49[3] = v33;
    id v8 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
  }
  else
  {
    v7 = [(SSRSpeakerRecognitionContext *)self->_context logAggregator];
    [v7 setSpeakerRecognitionPSRProcessingStatus:743];

    id v8 = 0;
  }

  return v8;
}

void __50__SSRSpeakerAnalyzerPSR_getVoiceRecognizerResults__block_invoke(void *a1)
{
  v13[3] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = [v2 allValues];
    BOOL v4 = [v3 firstObject];
    [v4 floatValue];
    int v6 = v5;
  }
  else
  {
    int v6 = -998637568;
  }
  v12[0] = @"assetConfigVersion";
  v7 = [*(id *)(a1[5] + 56) configVersion];
  v13[0] = v7;
  v12[1] = @"satScore";
  LODWORD(v8) = v6;
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  v13[1] = v9;
  v12[2] = @"modelType";
  unint64_t v10 = +[SSRUtils stringForSpeakerRecognizerType:1];
  v13[2] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  +[SSRDESRecordWriter createDESRecordWithSuperVector:a1[6] withMetaInfo:v11];
}

- (id)resetForNewRequest
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  [(EARSyncPSRAudioProcessor *)self->_psrAudioProcessor resetForNewRequest];
  BOOL v4 = [MEMORY[0x263EFF910] date];
  int v5 = (id)*MEMORY[0x263F37FA0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    psrAudioProcessor = self->_psrAudioProcessor;
    [v4 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 136315650;
    unint64_t v10 = "-[SSRSpeakerAnalyzerPSR resetForNewRequest]";
    __int16 v11 = 2114;
    uint64_t v12 = psrAudioProcessor;
    __int16 v13 = 2050;
    double v14 = v7 * 1000.0;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Successfully reset psrAnalyzer: %{public}@ in %{public}fms", buf, 0x20u);
  }

  return 0;
}

- (void)endAudio
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[SSRSpeakerAnalyzerPSR endAudio]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Calling endAudio on EARSyncPSRAudioProcessor", (uint8_t *)&v5, 0xCu);
  }
  [(EARSyncPSRAudioProcessor *)self->_psrAudioProcessor endAudio];
  id v4 = (id)[(EARSyncPSRAudioProcessor *)self->_psrAudioProcessor getLatestSuperVector];
}

- (void)processAudioData:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if ([v6 bytes])
    {
      if ([v6 length])
      {
        [(EARSyncPSRAudioProcessor *)self->_psrAudioProcessor addAudio:v6];
        self->_numSamplesProecssed += (unint64_t)[v6 length] >> 1;
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[SSRSpeakerAnalyzerPSR dealloc]";
    __int16 v7 = 2112;
    double v8 = self;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %@: dealloc", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerAnalyzerPSR;
  [(SSRSpeakerAnalyzerPSR *)&v4 dealloc];
}

- (SSRSpeakerAnalyzerPSR)initWithVoiceRecognitionContext:(id)a3 delegate:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)SSRSpeakerAnalyzerPSR;
  uint64_t v9 = [(SSRSpeakerAnalyzerPSR *)&v44 init];
  if (!v9) {
    goto LABEL_6;
  }
  unint64_t v10 = [v7 modelsContext];
  __int16 v11 = +[SSRUtils stringForSpeakerRecognizerType:1];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  __int16 v13 = [v7 expModelsContext];
  double v14 = +[SSRUtils stringForSpeakerRecognizerType:1];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];

  if (!v12)
  {
    id v41 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v46 = "-[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_DEFAULT, "%s modelContext is nil! - Bailing out", buf, 0xCu);
    }
    goto LABEL_12;
  }
  objc_storeWeak((id *)&v9->_delegate, v8);
  uint64_t v16 = [v12 configFilePath];
  configFilePath = v9->_configFilePath;
  v9->_configFilePath = (NSURL *)v16;

  uint64_t v18 = [v7 resourceFilePath];
  resourceFilePath = v9->_resourceFilePath;
  v9->_resourceFilePath = (NSURL *)v18;

  uint64_t v20 = [v12 voiceProfilesModelFilePaths];
  voiceProfilesModelFilePaths = v9->_voiceProfilesModelFilePaths;
  v9->_voiceProfilesModelFilePaths = (NSDictionary *)v20;

  uint64_t v22 = [v15 voiceProfilesModelFilePaths];
  voiceProfilesExpModelFilePaths = v9->_voiceProfilesExpModelFilePaths;
  v9->_voiceProfilesExpModelFilePaths = (NSDictionary *)v22;

  objc_storeStrong((id *)&v9->_context, a3);
  uint64_t v24 = +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", v9->_voiceProfilesModelFilePaths, v9->_configFilePath, v9->_resourceFilePath, [v7 recognitionStyle] != 0, 0);
  psrScorers = v9->_psrScorers;
  v9->_psrScorers = (NSArray *)v24;

  long long v26 = v9->_psrScorers;
  if (!v26 || ![(NSArray *)v26 count])
  {
    v39 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v46 = "-[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s ERR: Cannot create SAT analyzers", buf, 0xCu);
    }
    v40 = [v7 logAggregator];
    [v40 setSpeakerRecognitionPSRProcessingStatus:106];

LABEL_12:
    v38 = 0;
    goto LABEL_13;
  }
  id v43 = [MEMORY[0x263F380D0] getSerialQueueWithQOS:33 name:@"com.apple.ssr.psrq" fixedPriority:*MEMORY[0x263F38110]];
  dispatch_queue_t v27 = dispatch_queue_create("com.apple.ssr.satq.desrecordq", 0);
  desRecordQueue = v9->_desRecordQueue;
  v9->_desRecordQueue = (OS_dispatch_queue *)v27;

  id v29 = objc_alloc(MEMORY[0x263F3B3C8]);
  v30 = [(NSArray *)v9->_psrScorers objectAtIndexedSubscript:0];
  id v31 = [v30 psrConfigFilePath];
  v32 = [(NSArray *)v9->_psrScorers objectAtIndexedSubscript:0];
  v33 = [v32 psrConfigRoot];
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  uint64_t v35 = [v29 initWithConfigFile:v31 configRoot:v33 sampleRate:(unint64_t)v34 delegate:v9 queue:v43 outputLastRowOnly:1];
  psrAudioProcessor = v9->_psrAudioProcessor;
  v9->_psrAudioProcessor = (EARSyncPSRAudioProcessor *)v35;

  id v37 = [(SSRSpeakerAnalyzerPSR *)v9 resetForNewRequest];
LABEL_6:
  v38 = v9;
LABEL_13:

  return v38;
}

@end