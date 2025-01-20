@interface SSRSpeakerRecognizerPSR
- (BOOL)processingEnded;
- (NSDictionary)lastScoreCard;
- (NSDictionary)lastSpeakerInfo;
- (NSString)invocationStyleStr;
- (NSString)sessionId;
- (SSRSpeakerAnalyzerPSR)psrAnalyzer;
- (SSRSpeakerRecognitionContext)spIdCtx;
- (SSRSpeakerRecognizerDelegate)delegate;
- (SSRSpeakerRecognizerPSR)initWithContext:(id)a3 delegate:(id)a4;
- (unint64_t)endInSampleCount;
- (unint64_t)extraSamplesAtStart;
- (unint64_t)getSpeakerRecognizerProcessingTime;
- (unint64_t)numSamplesProcessed;
- (unint64_t)totalNumSamplesReceived;
- (unint64_t)vtEndInSampleCount;
- (void)_initializeWithContext:(id)a3;
- (void)dealloc;
- (void)endAudio;
- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4;
- (void)resetWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndInSampleCount:(unint64_t)a3;
- (void)setExtraSamplesAtStart:(unint64_t)a3;
- (void)setInvocationStyleStr:(id)a3;
- (void)setLastSpeakerInfo:(id)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setProcessingEnded:(BOOL)a3;
- (void)setPsrAnalyzer:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSpIdCtx:(id)a3;
- (void)setTotalNumSamplesReceived:(unint64_t)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)voiceRecognitionPSRAnalyzer:(id)a3 hasVoiceRecognitionInfo:(id)a4;
- (void)voiceRecognitionPSRAnalyzerFinishedProcessing:(id)a3 withVoiceRecognitionInfo:(id)a4;
@end

@implementation SSRSpeakerRecognizerPSR

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psrAnalyzer, 0);
  objc_storeStrong((id *)&self->_invocationStyleStr, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_storeStrong((id *)&self->_spIdCtx, 0);
}

- (void)setPsrAnalyzer:(id)a3
{
}

- (SSRSpeakerAnalyzerPSR)psrAnalyzer
{
  return self->_psrAnalyzer;
}

- (void)setTotalNumSamplesReceived:(unint64_t)a3
{
  self->_totalNumSamplesReceived = a3;
}

- (unint64_t)totalNumSamplesReceived
{
  return self->_totalNumSamplesReceived;
}

- (void)setProcessingEnded:(BOOL)a3
{
  self->_processingEnded = a3;
}

- (BOOL)processingEnded
{
  return self->_processingEnded;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setEndInSampleCount:(unint64_t)a3
{
  self->_endInSampleCount = a3;
}

- (unint64_t)endInSampleCount
{
  return self->_endInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  self->_extraSamplesAtStart = a3;
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (void)setInvocationStyleStr:(id)a3
{
}

- (NSString)invocationStyleStr
{
  return self->_invocationStyleStr;
}

- (void)setDelegate:(id)a3
{
}

- (SSRSpeakerRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRSpeakerRecognizerDelegate *)WeakRetained;
}

- (void)setLastSpeakerInfo:(id)a3
{
}

- (NSDictionary)lastSpeakerInfo
{
  return self->_lastSpeakerInfo;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSpIdCtx:(id)a3
{
}

- (SSRSpeakerRecognitionContext)spIdCtx
{
  return self->_spIdCtx;
}

- (void)voiceRecognitionPSRAnalyzerFinishedProcessing:(id)a3 withVoiceRecognitionInfo:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"sessionId"];
  if (v6 && ![(NSString *)self->_sessionId isEqualToString:v6])
  {
    v23 = (void *)*MEMORY[0x263F37FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    spIdCtx = self->_spIdCtx;
    v8 = v23;
    v25 = [(SSRSpeakerRecognitionContext *)spIdCtx sessionId];
    int v26 = 136315650;
    v27 = "-[SSRSpeakerRecognizerPSR voiceRecognitionPSRAnalyzerFinishedProcessing:withVoiceRecognitionInfo:]";
    __int16 v28 = 2114;
    v29 = v25;
    __int16 v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v26, 0x20u);
  }
  else
  {
    v7 = [v5 objectForKeyedSubscript:@"psrContext"];
    v8 = [v7 mutableCopy];

    float extraSamplesAtStart = (float)self->_extraSamplesAtStart;
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    float v11 = (float)(extraSamplesAtStart / v10) * 1000.0;
    float vtEndInSampleCount = (float)self->_vtEndInSampleCount;
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    float v14 = (float)(vtEndInSampleCount / v13) * 1000.0;
    *(float *)&double v15 = v11;
    v16 = [NSNumber numberWithFloat:v15];
    [v8 setObject:v16 forKey:@"extraAudioAtStartInMs"];

    *(float *)&double v17 = v14;
    v18 = [NSNumber numberWithFloat:v17];
    [v8 setObject:v18 forKey:@"tdEndInMs"];

    v19 = (NSDictionary *)[v5 mutableCopy];
    [(NSDictionary *)v19 setObject:v8 forKey:@"psrContext"];
    lastSpeakerInfo = self->_lastSpeakerInfo;
    self->_lastSpeakerInfo = v19;
    v21 = v19;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speakerRecognizerFinishedProcessing:self withFinalSpeakerIdInfo:v21];
  }
LABEL_5:
}

- (void)voiceRecognitionPSRAnalyzer:(id)a3 hasVoiceRecognitionInfo:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"sessionId"];
  if (v6 && ![(NSString *)self->_sessionId isEqualToString:v6])
  {
    v23 = (void *)*MEMORY[0x263F37FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    spIdCtx = self->_spIdCtx;
    v8 = v23;
    v25 = [(SSRSpeakerRecognitionContext *)spIdCtx sessionId];
    int v26 = 136315650;
    v27 = "-[SSRSpeakerRecognizerPSR voiceRecognitionPSRAnalyzer:hasVoiceRecognitionInfo:]";
    __int16 v28 = 2114;
    v29 = v25;
    __int16 v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v26, 0x20u);
  }
  else
  {
    v7 = [v5 objectForKeyedSubscript:@"psrContext"];
    v8 = [v7 mutableCopy];

    float extraSamplesAtStart = (float)self->_extraSamplesAtStart;
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    float v11 = (float)(extraSamplesAtStart / v10) * 1000.0;
    float vtEndInSampleCount = (float)self->_vtEndInSampleCount;
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    float v14 = (float)(vtEndInSampleCount / v13) * 1000.0;
    *(float *)&double v15 = v11;
    v16 = [NSNumber numberWithFloat:v15];
    [v8 setObject:v16 forKey:@"extraAudioAtStartInMs"];

    *(float *)&double v17 = v14;
    v18 = [NSNumber numberWithFloat:v17];
    [v8 setObject:v18 forKey:@"tdEndInMs"];

    v19 = (NSDictionary *)[v5 mutableCopy];
    [(NSDictionary *)v19 setObject:v8 forKey:@"psrContext"];
    lastSpeakerInfo = self->_lastSpeakerInfo;
    self->_lastSpeakerInfo = v19;
    v21 = v19;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speakerRecognizer:self hasSpeakerIdInfo:v21];
  }
LABEL_5:
}

- (unint64_t)getSpeakerRecognizerProcessingTime
{
  return [(SSRSpeakerAnalyzerPSR *)self->_psrAnalyzer getEARSyncPSRAudioProcessorProcessingTime];
}

- (NSDictionary)lastScoreCard
{
  v3 = [(SSRSpeakerAnalyzerPSR *)self->_psrAnalyzer getVoiceRecognizerResults];
  lastSpeakerInfo = self->_lastSpeakerInfo;
  self->_lastSpeakerInfo = v3;

  id v5 = self->_lastSpeakerInfo;

  return v5;
}

- (void)resetWithContext:(id)a3
{
  [(SSRSpeakerRecognizerPSR *)self _initializeWithContext:a3];
  id v4 = [(SSRSpeakerAnalyzerPSR *)self->_psrAnalyzer resetForNewRequest];
}

- (void)endAudio
{
  self->_processingEnded = 1;
  [(SSRSpeakerAnalyzerPSR *)self->_psrAnalyzer endAudio];
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  self->_numSamplesProcessed += a4;
  [(SSRSpeakerAnalyzerPSR *)self->_psrAnalyzer processAudioData:a3];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SSRSpeakerRecognizerPSR dealloc]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSSpIdVTSpeakerRecognizer dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognizerPSR;
  [(SSRSpeakerRecognizerPSR *)&v4 dealloc];
}

- (void)_initializeWithContext:(id)a3
{
  id v16 = a3;
  objc_storeStrong((id *)&self->_spIdCtx, a3);
  id v5 = [(SSRSpeakerRecognitionContext *)self->_spIdCtx sessionId];
  sessionId = self->_sessionId;
  self->_sessionId = v5;

  self->_numSamplesProcessed = 0;
  self->_processingEnded = 0;
  self->_float extraSamplesAtStart = 0;
  self->_float vtEndInSampleCount = 0;
  uint64_t v7 = +[SSRUtils stringForInvocationStyle:[(SSRSpeakerRecognitionContext *)self->_spIdCtx recognitionStyle]];
  invocationStyleStr = self->_invocationStyleStr;
  self->_invocationStyleStr = v7;

  if (![(SSRSpeakerRecognitionContext *)self->_spIdCtx recognitionStyle])
  {
    v9 = [(SSRSpeakerRecognitionContext *)self->_spIdCtx vtEventInfo];
    float v10 = [v9 objectForKeyedSubscript:@"extraSamplesAtStart"];
    [v10 floatValue];
    self->_float extraSamplesAtStart = (unint64_t)v11;

    v12 = [v9 objectForKeyedSubscript:@"triggerEndSeconds"];
    [v12 floatValue];
    double v14 = v13;

    [MEMORY[0x263F38018] inputRecordingSampleRate];
    self->_float vtEndInSampleCount = (unint64_t)(v14 * v15);
  }
}

- (SSRSpeakerRecognizerPSR)initWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSRSpeakerRecognizerPSR;
  v9 = [(SSRSpeakerRecognizerPSR *)&v24 init];
  if (!v9)
  {
LABEL_9:
    v21 = v9;
    goto LABEL_13;
  }
  if ([v7 recognitionStyle]
    && [v7 recognitionStyle] != 1
    && [v7 recognitionStyle] != 2)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, v9, @"SSRSpeakerRecognizerPSR.m", 54, @"Incorrect ctx for VTSpeakerRecognizer: %@", v7 object file lineNumber description];
  }
  [(SSRSpeakerRecognizerPSR *)v9 _initializeWithContext:v7];
  objc_storeWeak((id *)&v9->_delegate, v8);
  float v10 = [[SSRSpeakerAnalyzerPSR alloc] initWithVoiceRecognitionContext:v9->_spIdCtx delegate:v9];
  psrAnalyzer = v9->_psrAnalyzer;
  v9->_psrAnalyzer = v10;

  v12 = v9->_psrAnalyzer;
  float v13 = *MEMORY[0x263F37FA0];
  BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      float v15 = v13;
      id v16 = +[SSRUtils stringForInvocationStyle:](SSRUtils, "stringForInvocationStyle:", [v7 recognitionStyle]);
      double v17 = [(SSRSpeakerRecognitionContext *)v9->_spIdCtx sessionId];
      unint64_t extraSamplesAtStart = v9->_extraSamplesAtStart;
      unint64_t vtEndInSampleCount = v9->_vtEndInSampleCount;
      [MEMORY[0x263F38018] inputRecordingSampleRate];
      *(_DWORD *)buf = 136316418;
      int v26 = "-[SSRSpeakerRecognizerPSR initWithContext:delegate:]";
      __int16 v27 = 2112;
      __int16 v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = v17;
      __int16 v31 = 2048;
      unint64_t v32 = extraSamplesAtStart;
      __int16 v33 = 2048;
      unint64_t v34 = vtEndInSampleCount;
      __int16 v35 = 2048;
      double v36 = (float)((float)((float)vtEndInSampleCount / v20) * 1000.0);
      _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s %@::uniqueUttTag: %@, extraSamplesAtStart: %lu, _tdEndInSampleCount: %lu(%f ms)", buf, 0x3Eu);
    }
    goto LABEL_9;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    int v26 = "-[SSRSpeakerRecognizerPSR initWithContext:delegate:]";
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to create SSRSpeakerRecognizerPSR", buf, 0xCu);
  }
  v21 = 0;
LABEL_13:

  return v21;
}

@end