@interface SSRSpeakerRecognitionController
- (NSDictionary)lastScoreCard;
- (SSRSpeakerRecognitionContext)context;
- (SSRSpeakerRecognitionController)initWithContext:(id)a3 withDelegate:(id)a4 error:(id *)a5;
- (SSRSpeakerRecognitionControllerDelegate)delegate;
- (SSRSpeakerRecognitionOrchestrator)orchestrator;
- (id)getLatestSpeakerInfo;
- (id)resetWithContext:(id)a3;
- (unint64_t)getPSRProcessingTime;
- (void)endAudio;
- (void)processAudio:(id)a3 withNumberOfSamples:(unint64_t)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastScoreCard:(id)a3;
- (void)setOrchestrator:(id)a3;
- (void)voiceRecognitionOrchestrator:(id)a3 hasVoiceRecognitionInfo:(id)a4;
- (void)voiceRecognitionOrchestratorFinishedProcessing:(id)a3 withFinalVoiceRecognitionInfo:(id)a4;
@end

@implementation SSRSpeakerRecognitionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScoreCard, 0);
  objc_storeStrong((id *)&self->_orchestrator, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setLastScoreCard:(id)a3
{
}

- (NSDictionary)lastScoreCard
{
  return self->_lastScoreCard;
}

- (void)setOrchestrator:(id)a3
{
}

- (SSRSpeakerRecognitionOrchestrator)orchestrator
{
  return self->_orchestrator;
}

- (void)setDelegate:(id)a3
{
}

- (SSRSpeakerRecognitionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRSpeakerRecognitionControllerDelegate *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)voiceRecognitionOrchestratorFinishedProcessing:(id)a3 withFinalVoiceRecognitionInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (NSDictionary *)a4;
  v8 = (os_log_t *)MEMORY[0x263F37FA0];
  v9 = (void *)*MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [(NSDictionary *)v7 objectForKeyedSubscript:@"spIdKnownUserScores"];
    int v19 = 136315394;
    v20 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestratorFinishedProcessing:withFinalVoiceRecognitionInfo:]";
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Final - %@", (uint8_t *)&v19, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 speakerRecognitionFinishedProcessing:self withFinalSpeakerInfo:v7];
LABEL_7:

    goto LABEL_8;
  }
  os_log_t v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    v14 = v15;
    v17 = [(SSRSpeakerRecognitionContext *)context sessionId];
    int v19 = 136315394;
    v20 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestratorFinishedProcessing:withFinalVoiceRecognitionInfo:]";
    __int16 v21 = 2114;
    v22 = v17;
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Discarded speaker scores for session - %{public}@", (uint8_t *)&v19, 0x16u);

    goto LABEL_7;
  }
LABEL_8:
  lastScoreCard = self->_lastScoreCard;
  self->_lastScoreCard = v7;
}

- (void)voiceRecognitionOrchestrator:(id)a3 hasVoiceRecognitionInfo:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_t *)MEMORY[0x263F37FA0];
  v9 = (void *)*MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [v7 objectForKeyedSubscript:@"segmentCounter"];
    int v12 = [v11 intValue];
    char v13 = [v7 objectForKeyedSubscript:@"segmentStartTime"];
    [v13 floatValue];
    double v15 = v14;
    [v7 objectForKeyedSubscript:@"spIdAudioProcessedDuration"];
    v17 = id v16 = v6;
    int v18 = [v17 intValue];
    int v19 = [v7 objectForKeyedSubscript:@"spIdKnownUserScores"];
    *(_DWORD *)buf = 136316162;
    v31 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:]";
    __int16 v32 = 1026;
    *(_DWORD *)v33 = v12;
    *(_WORD *)&v33[4] = 2050;
    *(double *)&v33[6] = v15;
    __int16 v34 = 1024;
    int v35 = v18;
    __int16 v36 = 2114;
    v37 = v19;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Scorecard for {%{public}d, %{public}.2fsec %dms} - %{public}@", buf, 0x2Cu);

    id v6 = v16;
    v8 = (os_log_t *)MEMORY[0x263F37FA0];
  }
  v20 = [v7 objectForKeyedSubscript:@"spIdKnownUserScores"];

  if (v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      uint64_t v23 = objc_loadWeakRetained((id *)&self->_delegate);
      [v23 speakerRecognitionController:self hasSpeakerInfo:v7];
    }
    else
    {
      os_log_t v26 = *v8;
      if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:
        v29 = (NSDictionary *)v7;
        lastScoreCard = self->_lastScoreCard;
        self->_lastScoreCard = v29;
        goto LABEL_12;
      }
      context = self->_context;
      uint64_t v23 = v26;
      v28 = [(SSRSpeakerRecognitionContext *)context sessionId];
      *(_DWORD *)buf = 136315394;
      v31 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:]";
      __int16 v32 = 2114;
      *(void *)v33 = v28;
      _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Discarded speaker scores for session - %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  lastScoreCard = [NSString stringWithFormat:@"ERR: Scorecard not available in score dictionary - %@", v7];
  v25 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:]";
    __int16 v32 = 2112;
    *(void *)v33 = lastScoreCard;
    _os_log_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
LABEL_12:
}

- (unint64_t)getPSRProcessingTime
{
  return [(SSRSpeakerRecognitionOrchestrator *)self->_orchestrator getPSRProcessingTime];
}

- (id)getLatestSpeakerInfo
{
  return [(SSRSpeakerRecognitionOrchestrator *)self->_orchestrator getLatestVoiceRecognitionInfo];
}

- (id)resetWithContext:(id)a3
{
  id v3 = [(SSRSpeakerRecognitionOrchestrator *)self->_orchestrator resetWithContext:a3];
  return 0;
}

- (void)endAudio
{
}

- (void)processAudio:(id)a3 withNumberOfSamples:(unint64_t)a4
{
}

- (SSRSpeakerRecognitionController)initWithContext:(id)a3 withDelegate:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SSRSpeakerRecognitionController;
  v11 = [(SSRSpeakerRecognitionController *)&v18 init];
  if (!v11) {
    goto LABEL_8;
  }
  id v17 = 0;
  int v12 = [[SSRSpeakerRecognitionOrchestrator alloc] initWithContext:v9 withDelegate:v11 error:&v17];
  id v13 = v17;
  orchestrator = v11->_orchestrator;
  v11->_orchestrator = v12;

  if (!v13 && v11->_orchestrator)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_context, a3);
LABEL_8:
    double v15 = v11;
    goto LABEL_9;
  }
  if (a5) {
    *a5 = v13;
  }

  double v15 = 0;
LABEL_9:

  return v15;
}

@end