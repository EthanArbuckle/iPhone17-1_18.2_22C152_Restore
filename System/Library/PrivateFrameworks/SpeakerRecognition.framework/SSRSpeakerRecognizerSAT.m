@interface SSRSpeakerRecognizerSAT
- (BOOL)processingEnded;
- (NSDictionary)lastScoreCard;
- (NSDictionary)lastSpeakerInfo;
- (NSString)invocationStyleStr;
- (NSString)sessionId;
- (SSRSpeakerAnalyzerSAT)satAnalyzer;
- (SSRSpeakerRecognitionContext)spIdCtx;
- (SSRSpeakerRecognizerDelegate)delegate;
- (SSRSpeakerRecognizerSAT)initWithContext:(id)a3 delegate:(id)a4;
- (unint64_t)extraSamplesAtStart;
- (unint64_t)numTdTiSamplesProcessed;
- (unint64_t)tdEndInSampleCount;
- (unint64_t)totalNumSamplesReceived;
- (void)_initializeWithContext:(id)a3;
- (void)dealloc;
- (void)endAudio;
- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4;
- (void)resetWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtraSamplesAtStart:(unint64_t)a3;
- (void)setInvocationStyleStr:(id)a3;
- (void)setLastSpeakerInfo:(id)a3;
- (void)setNumTdTiSamplesProcessed:(unint64_t)a3;
- (void)setProcessingEnded:(BOOL)a3;
- (void)setSatAnalyzer:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSpIdCtx:(id)a3;
- (void)setTdEndInSampleCount:(unint64_t)a3;
- (void)setTotalNumSamplesReceived:(unint64_t)a3;
- (void)voiceRecognitionSATAnalyzer:(id)a3 hasVoiceRecognitionInfo:(id)a4;
- (void)voiceRecognitionSATAnalyzerFinishedProcessing:(id)a3 withVoiceRecognitionInfo:(id)a4;
@end

@implementation SSRSpeakerRecognizerSAT

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satAnalyzer, 0);
  objc_storeStrong((id *)&self->_invocationStyleStr, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_storeStrong((id *)&self->_spIdCtx, 0);
}

- (void)setSatAnalyzer:(id)a3
{
}

- (SSRSpeakerAnalyzerSAT)satAnalyzer
{
  return self->_satAnalyzer;
}

- (void)setProcessingEnded:(BOOL)a3
{
  self->_processingEnded = a3;
}

- (BOOL)processingEnded
{
  return self->_processingEnded;
}

- (void)setNumTdTiSamplesProcessed:(unint64_t)a3
{
  self->_numTdTiSamplesProcessed = a3;
}

- (unint64_t)numTdTiSamplesProcessed
{
  return self->_numTdTiSamplesProcessed;
}

- (void)setTotalNumSamplesReceived:(unint64_t)a3
{
  self->_totalNumSamplesReceived = a3;
}

- (unint64_t)totalNumSamplesReceived
{
  return self->_totalNumSamplesReceived;
}

- (void)setTdEndInSampleCount:(unint64_t)a3
{
  self->_tdEndInSampleCount = a3;
}

- (unint64_t)tdEndInSampleCount
{
  return self->_tdEndInSampleCount;
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

- (void)voiceRecognitionSATAnalyzerFinishedProcessing:(id)a3 withVoiceRecognitionInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"sessionId"];
  if (v7 && ![(NSString *)self->_sessionId isEqualToString:v7])
  {
    v11 = (void *)*MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      spIdCtx = self->_spIdCtx;
      v10 = v11;
      v13 = [(SSRSpeakerRecognitionContext *)spIdCtx sessionId];
      int v14 = 136315650;
      v15 = "-[SSRSpeakerRecognizerSAT voiceRecognitionSATAnalyzerFinishedProcessing:withVoiceRecognitionInfo:]";
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v14, 0x20u);

      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSpeakerInfo, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 speakerRecognizerFinishedProcessing:self withFinalSpeakerIdInfo:v6];
LABEL_7:
    }
  }
}

- (void)voiceRecognitionSATAnalyzer:(id)a3 hasVoiceRecognitionInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"sessionId"];
  if (v7 && ![(NSString *)self->_sessionId isEqualToString:v7])
  {
    v11 = (void *)*MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      spIdCtx = self->_spIdCtx;
      v10 = v11;
      v13 = [(SSRSpeakerRecognitionContext *)spIdCtx sessionId];
      int v14 = 136315650;
      v15 = "-[SSRSpeakerRecognizerSAT voiceRecognitionSATAnalyzer:hasVoiceRecognitionInfo:]";
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v14, 0x20u);

      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSpeakerInfo, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 speakerRecognizer:self hasSpeakerIdInfo:v6];
LABEL_7:
    }
  }
}

- (NSDictionary)lastScoreCard
{
  v3 = [(SSRSpeakerAnalyzerSAT *)self->_satAnalyzer getVoiceRecognizerResults];
  lastSpeakerInfo = self->_lastSpeakerInfo;
  self->_lastSpeakerInfo = v3;

  v5 = self->_lastSpeakerInfo;

  return v5;
}

- (void)resetWithContext:(id)a3
{
  [(SSRSpeakerRecognizerSAT *)self _initializeWithContext:a3];
  id v4 = [(SSRSpeakerAnalyzerSAT *)self->_satAnalyzer resetForNewRequest];
}

- (void)endAudio
{
  self->_processingEnded = 1;
  [(SSRSpeakerAnalyzerSAT *)self->_satAnalyzer endAudio];
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
}

- (void)_initializeWithContext:(id)a3
{
  id v16 = a3;
  objc_storeStrong((id *)&self->_spIdCtx, a3);
  v5 = [(SSRSpeakerRecognitionContext *)self->_spIdCtx sessionId];
  sessionId = self->_sessionId;
  self->_sessionId = v5;

  self->_numTdTiSamplesProcessed = 0;
  self->_processingEnded = 0;
  self->_extraSamplesAtStart = 0;
  self->_tdEndInSampleCount = 0;
  v7 = +[SSRUtils stringForInvocationStyle:[(SSRSpeakerRecognitionContext *)self->_spIdCtx recognitionStyle]];
  invocationStyleStr = self->_invocationStyleStr;
  self->_invocationStyleStr = v7;

  if (![(SSRSpeakerRecognitionContext *)self->_spIdCtx recognitionStyle])
  {
    char v9 = [(SSRSpeakerRecognitionContext *)self->_spIdCtx vtEventInfo];
    v10 = [v9 objectForKeyedSubscript:@"extraSamplesAtStart"];
    [v10 floatValue];
    self->_extraSamplesAtStart = (unint64_t)v11;

    v12 = [v9 objectForKeyedSubscript:@"triggerEndSeconds"];
    [v12 floatValue];
    double v14 = v13;

    [MEMORY[0x263F38018] inputRecordingSampleRate];
    self->_tdEndInSampleCount = (unint64_t)(v14 * v15);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[SSRSpeakerRecognizerSAT dealloc]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s SSRSpeakerRecognizerSAT dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognizerSAT;
  [(SSRSpeakerRecognizerSAT *)&v4 dealloc];
}

- (SSRSpeakerRecognizerSAT)initWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSRSpeakerRecognizerSAT;
  char v9 = [(SSRSpeakerRecognizerSAT *)&v24 init];
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
    [v23 handleFailureInMethod:a2, v9, @"SSRSpeakerRecognizerSAT.m", 52, @"Incorrect ctx for VTSpeakerRecognizer: %@", v7 object file lineNumber description];
  }
  [(SSRSpeakerRecognizerSAT *)v9 _initializeWithContext:v7];
  objc_storeWeak((id *)&v9->_delegate, v8);
  v10 = [[SSRSpeakerAnalyzerSAT alloc] initWithVoiceRecognitionContext:v9->_spIdCtx delegate:v9];
  satAnalyzer = v9->_satAnalyzer;
  v9->_satAnalyzer = v10;

  v12 = v9->_satAnalyzer;
  float v13 = *MEMORY[0x263F37FA0];
  BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      float v15 = v13;
      id v16 = +[SSRUtils stringForInvocationStyle:](SSRUtils, "stringForInvocationStyle:", [v7 recognitionStyle]);
      v17 = [(SSRSpeakerRecognitionContext *)v9->_spIdCtx sessionId];
      unint64_t extraSamplesAtStart = v9->_extraSamplesAtStart;
      unint64_t tdEndInSampleCount = v9->_tdEndInSampleCount;
      [MEMORY[0x263F38018] inputRecordingSampleRate];
      *(_DWORD *)buf = 136316418;
      v26 = "-[SSRSpeakerRecognizerSAT initWithContext:delegate:]";
      __int16 v27 = 2112;
      v28 = v16;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2048;
      unint64_t v32 = extraSamplesAtStart;
      __int16 v33 = 2048;
      unint64_t v34 = tdEndInSampleCount;
      __int16 v35 = 2048;
      double v36 = (float)((float)((float)tdEndInSampleCount / v20) * 1000.0);
      _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s %@::uniqueUttTag: %@, extraSamplesAtStart: %lu, _tdEndInSampleCount: %lu(%f ms)", buf, 0x3Eu);
    }
    goto LABEL_9;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SSRSpeakerRecognizerSAT initWithContext:delegate:]";
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to create SSRSpeakerAnalyzerSAT", buf, 0xCu);
  }
  v21 = 0;
LABEL_13:

  return v21;
}

@end