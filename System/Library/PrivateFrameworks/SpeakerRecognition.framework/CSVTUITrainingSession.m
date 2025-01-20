@interface CSVTUITrainingSession
- (BOOL)resultAlreadyReported;
- (BOOL)setupPhraseSpotter;
- (CSVTUITrainingSession)initWithUtteranceId:(int64_t)a3 sessionNumber:(int64_t)a4 Locale:(id)a5 audioSession:(id)a6 keywordDetector:(id)a7 speechRecognizer:(id)a8 speechRecognitionRequest:(id)a9 sessionDelegate:(id)a10 sessionDispatchQueue:(id)a11 zeroCounter:(id)a12 completion:(id)a13;
- (CSVTUITrainingSession)initWithUtteranceId:(int64_t)a3 sessionNumber:(int64_t)a4 Locale:(id)a5 vtAssetConfigVersion:(id)a6 audioSession:(id)a7 keywordDetector:(id)a8 speechRecognizer:(id)a9 speechRecognitionRequest:(id)a10 sessionDelegate:(id)a11 sessionDispatchQueue:(id)a12 mhUUID:(id)a13 zeroCounter:(id)a14 completionWithResult:(id)a15;
- (NSDictionary)voiceTriggerEventInfo;
- (id)createDigitalZeroReporterWithVoiceTriggerEventInfo:(id)a3 withSessionStatus:(int)a4;
- (id)getMhUUID;
- (id)getUtteranceId;
- (id)requestTriggeredUtterance:(id)a3;
- (int)getTrainingAudioStatusWithVTEI:(id)a3 digitalZeroReporter:(id)a4;
- (int64_t)numSamplesInPCMBuffer;
- (unint64_t)getPhId;
- (void)_registerEndPointTimeout;
- (void)audioSessionDidStopRecording:(int64_t)a3;
- (void)audioSessionErrorDidOccur:(id)a3;
- (void)audioSessionUnsupportedAudioRoute;
- (void)closeSessionWithCompletion:(id)a3;
- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4;
- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4 complete:(id)a5;
- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4 voiceTriggerEventInfo:(id)a5 completeWithResult:(id)a6;
- (void)computeRequiredTrailingSamples;
- (void)didDetectBeginOfSpeech;
- (void)didDetectEndOfSpeech:(int64_t)a3;
- (void)feedSpeechRecognitionTrailingSamplesWithCompletedBlock:(id)a3;
- (void)feedSpeechRecognitionWithPCMBuffer;
- (void)finishSpeechRecognitionTask;
- (void)handleAudioBufferForVTWithAudioInput:(id)a3 withDetectedBlock:(id)a4;
- (void)handleAudioInput:(id)a3;
- (void)handleMasterTimeout:(id)a3;
- (void)logTrainingSessionCompleteWithVoiceTriggerEventInfo:(id)a3;
- (void)pushAudioInputIntoPCMBuffer:(id)a3;
- (void)resumeTraining;
- (void)setVoiceTriggerEventInfo:(id)a3;
- (void)setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:(id)a3;
- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4;
- (void)startMasterTimerWithTimeout:(float)a3;
- (void)startTraining;
- (void)stopMasterTimer;
- (void)suspendTraining;
- (void)trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:(id)a3;
- (void)updateMeterAndForward;
@end

@implementation CSVTUITrainingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_continuousZeroCounter, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_trainingCompletionWithResult, 0);
  objc_storeStrong(&self->_trainingCompletion, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_pcmBufArray, 0);
  objc_storeStrong((id *)&self->_masterTimer, 0);
  objc_storeStrong((id *)&self->_speechRecognitionTask, 0);
  objc_storeStrong((id *)&self->_speechRecognitionRequest, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_keywordDetector, 0);
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_mhUUID, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)_registerEndPointTimeout
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CSVTUITrainingSession__registerEndPointTimeout__block_invoke;
  v5[3] = &unk_264429BD0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__CSVTUITrainingSession__registerEndPointTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained closeSessionWithStatus:7 successfully:0];
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_t *)MEMORY[0x263F37FA8];
  v8 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[CSVTUITrainingSession speechRecognitionTask:didHypothesizeTranscription:]";
    __int16 v15 = 2082;
    v16 = "-[CSVTUITrainingSession speechRecognitionTask:didHypothesizeTranscription:]";
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v13, 0x16u);
  }
  v9 = [v6 formattedString];
  v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v11 = [v9 stringByTrimmingCharactersInSet:v10];

  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[CSVTUITrainingSession speechRecognitionTask:didHypothesizeTranscription:]";
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s recognized text = %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)stopMasterTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSVTUITrainingSession stopMasterTimer]";
    __int16 v8 = 2082;
    v9 = "-[CSVTUITrainingSession stopMasterTimer]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v6, 0x16u);
  }
  masterTimer = self->_masterTimer;
  if (masterTimer)
  {
    [(NSTimer *)masterTimer invalidate];
    id v5 = self->_masterTimer;
    self->_masterTimer = 0;
  }
}

- (void)handleMasterTimeout:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSVTUITrainingSession handleMasterTimeout:]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Master Timeout Fired", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CSVTUITrainingSession_handleMasterTimeout___block_invoke;
  v6[3] = &unk_26442A160;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

uint64_t __45__CSVTUITrainingSession_handleMasterTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_time_t v3 = *(void **)(a1 + 32);
    if (v3[13])
    {
      id v5 = WeakRetained;
      [v3 stopMasterTimer];
      [v5 closeSessionWithStatus:7 successfully:0];
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)startMasterTimerWithTimeout:(float)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSVTUITrainingSession startMasterTimerWithTimeout:]";
    __int16 v10 = 2082;
    v11 = "-[CSVTUITrainingSession startMasterTimerWithTimeout:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}s CALLED", buf, 0x16u);
  }
  if (a3 != 0.0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__CSVTUITrainingSession_startMasterTimerWithTimeout___block_invoke;
    v6[3] = &unk_26442A0D8;
    v6[4] = self;
    float v7 = a3;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __53__CSVTUITrainingSession_startMasterTimerWithTimeout___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 104) = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_handleMasterTimeout_ selector:0 userInfo:1 repeats:*(float *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)finishSpeechRecognitionTask
{
  speechRecognitionRequest = self->_speechRecognitionRequest;
  if (speechRecognitionRequest) {
    [(SFSpeechAudioBufferRecognitionRequest *)speechRecognitionRequest endAudio];
  }
  speechRecognitionTask = self->_speechRecognitionTask;
  if (speechRecognitionTask)
  {
    [(SFSpeechRecognitionTask *)speechRecognitionTask finish];
  }
}

- (void)setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:(id)a3
{
  id v13 = a3;
  v4 = (SFSpeechAudioBufferRecognitionRequest *)objc_alloc_init(MEMORY[0x263F17B80]);
  speechRecognitionRequest = self->_speechRecognitionRequest;
  self->_speechRecognitionRequest = v4;

  int v6 = self->_speechRecognitionRequest;
  float v7 = +[CSVTUIASRGrammars sharedGrammars];
  __int16 v8 = [v7 getLMEforLocale:self->_locale];
  [(SFSpeechAudioBufferRecognitionRequest *)v6 setContextualStrings:v8];

  [(SFSpeechAudioBufferRecognitionRequest *)self->_speechRecognitionRequest setTaskHint:1001];
  if (self->_speechRecognizer && self->_speechRecognitionRequest)
  {
    v9 = (void *)[v13 mutableCopy];
    __int16 v10 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld] VTUISession Number:[%ld]", self->_utteranceId, self->_sessionNumber);
    [v9 setObject:@"PHS explicit training utterance" forKey:v10];

    [(SFSpeechAudioBufferRecognitionRequest *)self->_speechRecognitionRequest _setVoiceTriggerEventInfo:v9];
    v11 = [(SFSpeechRecognizer *)self->_speechRecognizer recognitionTaskWithRequest:self->_speechRecognitionRequest delegate:self];
    speechRecognitionTask = self->_speechRecognitionTask;
    self->_speechRecognitionTask = v11;
  }
}

- (void)didDetectEndOfSpeech:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[CSVTUITrainingSession didDetectEndOfSpeech:]";
    __int16 v11 = 2050;
    int64_t v12 = a3;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s End of speech detected with endpoint type: %{public}ld", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__CSVTUITrainingSession_didDetectEndOfSpeech___block_invoke;
  v7[3] = &unk_264429BA8;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = (id)a3;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

void __46__CSVTUITrainingSession_didDetectEndOfSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(void *)(a1 + 40) == 2)
  {
    id v3 = WeakRetained;
    [WeakRetained _registerEndPointTimeout];
    id WeakRetained = v3;
  }
}

- (void)didDetectBeginOfSpeech
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSVTUITrainingSession didDetectBeginOfSpeech]";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Begin of speech detected", (uint8_t *)&v3, 0xCu);
  }
}

- (void)audioSessionUnsupportedAudioRoute
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSVTUITrainingSession audioSessionUnsupportedAudioRoute]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Unsupported", (uint8_t *)&v4, 0xCu);
  }
  [(CSVTUITrainingSession *)self closeSessionWithStatus:4 successfully:0];
}

- (void)audioSessionErrorDidOccur:(id)a3
{
}

- (void)audioSessionDidStopRecording:(int64_t)a3
{
  if (a3) {
    [(CSVTUITrainingSession *)self closeSessionWithStatus:5 successfully:0];
  }
}

- (int)getTrainingAudioStatusWithVTEI:(id)a3 digitalZeroReporter:(id)a4
{
  id v5 = a3;
  if ([a4 digitalZeroDetected])
  {
    int v6 = 1;
  }
  else
  {
    float v7 = [v5 objectForKey:*MEMORY[0x263F381C8]];
    int v8 = [v7 BOOLValue];

    if (v8) {
      int v6 = 0;
    }
    else {
      int v6 = 2;
    }
  }

  return v6;
}

- (id)createDigitalZeroReporterWithVoiceTriggerEventInfo:(id)a3 withSessionStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t utteranceId_low = LODWORD(self->_utteranceId);
  float v7 = [a3 objectForKey:*MEMORY[0x263F381B0]];
  uint64_t v8 = [v7 unsignedIntegerValue];
  v9 = @"Siri";
  if (!v8) {
    v9 = @"Hey Siri";
  }
  __int16 v10 = v9;

  __int16 v11 = [[CSVTUISelfLoggingDigitalZeroReporter alloc] initWithSiriSetupID:self->_mhUUID PageNumber:utteranceId_low withPhId:v10 withLocale:self->_locale withVTAssetConfigVersion:self->_vtAssetConfigVersion withSessionStatus:v4];

  return v11;
}

- (void)logTrainingSessionCompleteWithVoiceTriggerEventInfo:(id)a3
{
  uint64_t utteranceId_low = LODWORD(self->_utteranceId);
  uint64_t v5 = *MEMORY[0x263F381B0];
  id v6 = a3;
  float v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 unsignedIntegerValue];
  v9 = @"Siri";
  if (!v8) {
    v9 = @"Hey Siri";
  }
  __int16 v10 = v9;

  __int16 v11 = [v6 objectForKey:*MEMORY[0x263F38218]];
  [v11 floatValue];
  int v13 = v12;

  v14 = [v6 objectForKey:*MEMORY[0x263F38220]];
  uint64_t v15 = [v14 unsignedIntegerValue];

  v16 = [v6 objectForKey:*MEMORY[0x263F38200]];
  uint64_t v17 = [v16 unsignedIntegerValue];

  v18 = [v6 objectForKey:*MEMORY[0x263F381C8]];

  uint64_t v19 = [v18 BOOLValue];
  id v21 = [MEMORY[0x263F380E0] sharedLogger];
  LODWORD(v20) = v13;
  [v21 logSiriSetupPHSEnrollmentUtteranceCompletedWithSiriSetupID:self->_mhUUID withPageNumber:utteranceId_low withPhId:v10 withTopScoreForUtterance:v15 withStartSampleCount:v17 withEndSampleCount:v19 withHasSpeechDetected:v20];
}

- (int64_t)numSamplesInPCMBuffer
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_pcmBufArray;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "frameLength", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)getPhId
{
  return self->_phId;
}

- (id)getMhUUID
{
  return self->_mhUUID;
}

- (id)getUtteranceId
{
  return (id)[NSNumber numberWithInteger:self->_utteranceId];
}

- (void)pushAudioInputIntoPCMBuffer:(id)a3
{
  LODWORD(v3) = kCSVTUITrainingSessionSampleRate;
  id v5 = +[SSRUtils createAVAudioPCMBufferWithNSData:a3 audioFormat:3 sampleRate:1 numOfChannel:0 isInterleaved:v3];
  if ((unint64_t)[(NSMutableArray *)self->_pcmBufArray count] >= 0x3C) {
    [(NSMutableArray *)self->_pcmBufArray removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_pcmBufArray addObject:v5];
}

- (void)computeRequiredTrailingSamples
{
  int64_t v3 = [(CSVTUITrainingSession *)self numSamplesInPCMBuffer];
  self->_numRequiredTrailingSamples = 3200 * (v3 / 3200) - v3 + 3200;
}

- (void)trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F38220]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  float v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F381F0]];
  unint64_t v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = v6 - v8;
  if (v8 >= v6) {
    uint64_t v9 = v8 - v6;
  }
  if (v9 >= 80000) {
    uint64_t v10 = 80000;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = [(NSMutableArray *)self->_pcmBufArray count];
  v29 = v4;
  if (v11 - 1 < 0)
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    uint64_t v28 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = [(NSMutableArray *)self->_pcmBufArray objectAtIndex:--v12];
      unsigned int v15 = [v14 frameLength];
      v13 += v15;
      uint64_t v16 = v13 - v10;
      if (v13 >= v10) {
        break;
      }

      if (v12 <= 0)
      {
        uint64_t v14 = 0;
        uint64_t v16 = 0;
        uint64_t v28 = 0;
        uint64_t v12 = 0;
        goto LABEL_13;
      }
    }
    uint64_t v28 = v15;
  }
LABEL_13:
  uint64_t v17 = (NSObject **)MEMORY[0x263F37FA8];
  v18 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    __int16 v32 = 2050;
    uint64_t v33 = v10;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s correctSampleSize:    [%{public}ld]", buf, 0x16u);
    uint64_t v19 = v17;
    v18 = *v17;
  }
  else
  {
    uint64_t v19 = v17;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    __int16 v32 = 2050;
    uint64_t v33 = v13;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s accumSampleSize:      [%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    __int16 v32 = 2050;
    uint64_t v33 = v12;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s startBufferIndex:     [%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    __int16 v32 = 2050;
    uint64_t v33 = v28;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s startBufferSampleSize:[%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    __int16 v32 = 2050;
    uint64_t v33 = v16;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s samplesToBeDeleted:   [%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    pcmBufArray = self->_pcmBufArray;
    id v21 = v18;
    uint64_t v22 = [(NSMutableArray *)pcmBufArray count];
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    __int16 v32 = 2050;
    uint64_t v33 = v22;
    _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Total Number of buffs:[%{public}ld]", buf, 0x16u);
  }
  if (v16 >= 1)
  {
    v23 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
      _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Adjusting the start buffer", buf, 0xCu);
    }
    id v24 = objc_alloc(MEMORY[0x263EF9388]);
    v25 = (void *)[v24 initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:*(float *)&kCSVTUITrainingSessionSampleRate];
    v26 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v25 frameCapacity:v28 - v16];
    memcpy(*(void **)([v26 mutableAudioBufferList] + 16), (const void *)(*(void *)(objc_msgSend(v14, "mutableAudioBufferList") + 16) + 2 * v16), 2 * (v28 - v16));
    *(_DWORD *)([v26 mutableAudioBufferList] + 12) = v28 - v16;
    [v26 setFrameLength:v28 - v16];
    [(NSMutableArray *)self->_pcmBufArray replaceObjectAtIndex:v12 withObject:v26];
  }
  if (v12)
  {
    v27 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
      _os_log_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s Adjusting the array elements", buf, 0xCu);
    }
    -[NSMutableArray removeObjectsInRange:](self->_pcmBufArray, "removeObjectsInRange:", 0, v12, v28);
  }
}

- (void)feedSpeechRecognitionWithPCMBuffer
{
  if (self->_speechRecognitionRequest)
  {
    while ([(NSMutableArray *)self->_pcmBufArray count])
    {
      int64_t v3 = [(NSMutableArray *)self->_pcmBufArray objectAtIndex:0];
      [(SFSpeechAudioBufferRecognitionRequest *)self->_speechRecognitionRequest appendAudioPCMBuffer:v3];
      [(NSMutableArray *)self->_pcmBufArray removeObjectAtIndex:0];
    }
  }
}

- (void)feedSpeechRecognitionTrailingSamplesWithCompletedBlock:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  int64_t v5 = self->_numTrailingSamples + [(CSVTUITrainingSession *)self numSamplesInPCMBuffer];
  self->_numTrailingSamples = v5;
  unint64_t v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unint64_t v8 = "-[CSVTUITrainingSession feedSpeechRecognitionTrailingSamplesWithCompletedBlock:]";
    __int16 v9 = 2050;
    int64_t v10 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s feeding tailing: [%{public}ld] samples", (uint8_t *)&v7, 0x16u);
  }
  [(CSVTUITrainingSession *)self feedSpeechRecognitionWithPCMBuffer];
  if (v4 && self->_numTrailingSamples >= self->_numRequiredTrailingSamples) {
    v4[2](v4);
  }
}

- (void)handleAudioBufferForVTWithAudioInput:(id)a3 withDetectedBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unint64_t v6 = (void (**)(id, void *))a4;
  int v7 = [(CSVTUIKeywordDetector *)self->_keywordDetector analyze:a3];
  unint64_t v8 = (void *)[v7 mutableCopy];

  if (v8)
  {
    __int16 v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F381C8]];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F38220]];
      uint64_t v12 = [v11 unsignedIntegerValue];

      uint64_t v13 = [v8 objectForKeyedSubscript:*MEMORY[0x263F38200]];
      uint64_t v14 = [v13 unsignedIntegerValue];

      unsigned int v15 = [v8 objectForKeyedSubscript:*MEMORY[0x263F381F0]];
      uint64_t v16 = [v15 unsignedIntegerValue];

      uint64_t v17 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136316162;
        uint64_t v28 = "-[CSVTUITrainingSession handleAudioBufferForVTWithAudioInput:withDetectedBlock:]";
        __int16 v29 = 2114;
        double v30 = *(double *)&v8;
        __int16 v31 = 2050;
        uint64_t v32 = v12;
        __int16 v33 = 2050;
        uint64_t v34 = v14;
        __int16 v35 = 2050;
        uint64_t v36 = v16;
        _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Triggered! Event info: %{public}@\n%{public}9lld %{public}9lld %{public}9lld", (uint8_t *)&v27, 0x34u);
      }
      if (v6) {
        v6[2](v6, v8);
      }
    }
    uint64_t v18 = handleAudioBufferForVTWithAudioInput_withDetectedBlock__counter++;
    if (__ROR8__(0x8F5C28F5C28F5C29 * v18 + 0x51EB851EB851EB8, 1) <= 0x51EB851EB851EB8uLL)
    {
      uint64_t v19 = (void *)*MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *MEMORY[0x263F38218];
        id v21 = v19;
        uint64_t v22 = [v8 objectForKeyedSubscript:v20];
        [v22 floatValue];
        double v24 = v23;
        v25 = [v8 objectForKeyedSubscript:*MEMORY[0x263F381F0]];
        uint64_t v26 = [v25 unsignedIntegerValue];
        int v27 = 136315650;
        uint64_t v28 = "-[CSVTUITrainingSession handleAudioBufferForVTWithAudioInput:withDetectedBlock:]";
        __int16 v29 = 2050;
        double v30 = v24;
        __int16 v31 = 2050;
        uint64_t v32 = v26;
        _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s analyzing.... score so far: %{public}5.3f (%{public}ld)", (uint8_t *)&v27, 0x20u);
      }
    }
  }
}

- (void)updateMeterAndForward
{
  [(CSVTUIAudioSession *)self->_audioSession updateMeters];
  [(CSVTUIAudioSession *)self->_audioSession averagePower];
  int v4 = v3;
  p_sessionDelegate = &self->_sessionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)p_sessionDelegate);
    LODWORD(v8) = v4;
    [v9 CSVTUITrainingSessionRMSAvailable:v8];
  }
}

- (id)requestTriggeredUtterance:(id)a3
{
  return [(CSVTUIKeywordDetector *)self->_keywordDetector triggeredUtterance:a3];
}

- (void)handleAudioInput:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CSVTUITrainingSession_handleAudioInput___block_invoke;
  v7[3] = &unk_264429B80;
  objc_copyWeak(&v9, &location);
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __42__CSVTUITrainingSession_handleAudioInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 121))
    {
      if (!*(unsigned char *)(v4 + 122))
      {
        uint64_t v5 = *(void *)(v4 + 8);
        if (v5 == 2)
        {
          [WeakRetained pushAudioInputIntoPCMBuffer:*(void *)(a1 + 40)];
          v8[0] = MEMORY[0x263EF8330];
          v8[1] = 3221225472;
          id v8[2] = __42__CSVTUITrainingSession_handleAudioInput___block_invoke_9;
          v8[3] = &unk_26442A618;
          id v9 = v3;
          [v9 feedSpeechRecognitionTrailingSamplesWithCompletedBlock:v8];
          id v7 = v9;
          goto LABEL_8;
        }
        if (v5 == 1)
        {
          [WeakRetained updateMeterAndForward];
          [v3 pushAudioInputIntoPCMBuffer:*(void *)(a1 + 40)];
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __42__CSVTUITrainingSession_handleAudioInput___block_invoke_2;
          v10[3] = &unk_264429B58;
          uint64_t v6 = *(void *)(a1 + 40);
          v10[4] = *(void *)(a1 + 32);
          id v11 = v3;
          [v11 handleAudioBufferForVTWithAudioInput:v6 withDetectedBlock:v10];
          id v7 = v11;
LABEL_8:
        }
      }
    }
  }
}

void __42__CSVTUITrainingSession_handleAudioInput___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), a2);
  uint64_t v5 = [*(id *)(a1 + 40) requestTriggeredUtterance:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v7 = objc_opt_respondsToSelector();

  uint64_t v8 = 2;
  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    int v10 = [v9 CSVTUITrainingSession:*(void *)(a1 + 32) hasTrainUtterance:v5 languageCode:*(void *)(*(void *)(a1 + 32) + 32) payload:0];

    if (v10) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  [*(id *)(a1 + 40) setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:v4];
  [*(id *)(a1 + 40) trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:v4];
  [*(id *)(a1 + 40) computeRequiredTrailingSamples];
  [*(id *)(a1 + 40) feedSpeechRecognitionWithPCMBuffer];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 168);
  if (v12 < 1)
  {
    [*(id *)(a1 + 40) closeSessionWithStatus:v8 successfully:1];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      unsigned int v15 = "-[CSVTUITrainingSession handleAudioInput:]_block_invoke_2";
      __int16 v16 = 2050;
      uint64_t v17 = v12;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Decide to delay ending ASR: [%{public}ld] samples", (uint8_t *)&v14, 0x16u);
      uint64_t v11 = *(void *)(a1 + 32);
    }
    *(void *)(v11 + 8) = 2;
  }
}

uint64_t __42__CSVTUITrainingSession_handleAudioInput___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) finishSpeechRecognitionTask];
  v2 = *(void **)(a1 + 32);

  return [v2 closeSessionWithStatus:0 successfully:1];
}

- (BOOL)setupPhraseSpotter
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[CSVTUITrainingSession setupPhraseSpotter]";
    __int16 v7 = 2082;
    uint64_t v8 = "-[CSVTUITrainingSession setupPhraseSpotter]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v5, 0x16u);
  }
  [(CSVTUIKeywordDetector *)self->_keywordDetector reset];
  return 1;
}

- (void)resumeTraining
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[CSVTUITrainingSession resumeTraining]";
    __int16 v8 = 2082;
    uint64_t v9 = "-[CSVTUITrainingSession resumeTraining]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s Called", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CSVTUITrainingSession_resumeTraining__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__CSVTUITrainingSession_resumeTraining__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSVTUITrainingSession resumeTraining]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Will resume training", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) stopMasterTimer];
  LODWORD(v3) = 10.0;
  [*(id *)(a1 + 32) startMasterTimerWithTimeout:v3];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 122) = 0;
  return result;
}

- (void)suspendTraining
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[CSVTUITrainingSession suspendTraining]";
    __int16 v8 = 2082;
    uint64_t v9 = "-[CSVTUITrainingSession suspendTraining]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s Called", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CSVTUITrainingSession_suspendTraining__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__CSVTUITrainingSession_suspendTraining__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSVTUITrainingSession suspendTraining]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Will suspend training", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
  [*(id *)(a1 + 32) stopMasterTimer];
  LODWORD(v3) = 20.0;
  uint64_t result = [*(id *)(a1 + 32) startMasterTimerWithTimeout:v3];
  *(unsigned char *)(*(void *)(a1 + 32) + 122) = 1;
  return result;
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4 voiceTriggerEventInfo:(id)a5 completeWithResult:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke;
  v14[3] = &unk_264429B30;
  int v17 = a3;
  v14[4] = self;
  id v15 = v10;
  BOOL v18 = a4;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(CSVTUITrainingSession *)self closeSessionWithCompletion:v14];
}

void __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) resultAlreadyReported] & 1) != 0
    || (uint64_t v2 = *(void *)(a1 + 32), !*(void *)(v2 + 144)))
  {
    int v5 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:]_block_invoke_2";
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Already reported status or no callback", buf, 0xCu);
    }
  }
  else
  {
    double v3 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      id v12 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:]_block_invoke";
      __int16 v13 = 1026;
      int v14 = v4;
      _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s returning status to UI : %{public}d", buf, 0x12u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke_3;
    v6[3] = &unk_264429B30;
    v6[4] = v2;
    id v7 = *(id *)(a1 + 40);
    int v9 = *(_DWORD *)(a1 + 56);
    char v10 = *(unsigned char *)(a1 + 60);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
}

void __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) createDigitalZeroReporterWithVoiceTriggerEventInfo:*(void *)(a1 + 40) withSessionStatus:*(unsigned int *)(a1 + 56)];
  if (v6)
  {
    [*(id *)(*(void *)(a1 + 32) + 184) stopCountingZeroStatisticsWithReporter:v6];
    [v6 logDigitalZeroDetectionComplete];
  }
  uint64_t v2 = -[CSVTUITrainingResult initWithSessionId:sessionStatus:audioStatus:]([CSVTUITrainingResult alloc], "initWithSessionId:sessionStatus:audioStatus:", 0, *(unsigned int *)(a1 + 56), [*(id *)(a1 + 32) getTrainingAudioStatusWithVTEI:*(void *)(a1 + 40) digitalZeroReporter:v6]);
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 144) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = 0;

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "logTrainingSessionCompleteWithVoiceTriggerEventInfo:");
  }
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4 complete:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke;
  v10[3] = &unk_264429B08;
  int v12 = a3;
  BOOL v13 = a4;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(CSVTUITrainingSession *)self closeSessionWithCompletion:v10];
}

void __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) resultAlreadyReported] & 1) != 0
    || (uint64_t v2 = *(void *)(a1 + 32), !*(void *)(v2 + 136)))
  {
    uint64_t v5 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:complete:]_block_invoke_2";
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Already reported status or no callback", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v3 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      id v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:complete:]_block_invoke";
      __int16 v12 = 1026;
      int v13 = v4;
      _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s returning status to UI : %{public}d", buf, 0x12u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke_1;
    block[3] = &unk_264429B08;
    block[4] = v2;
    int v8 = *(_DWORD *)(a1 + 48);
    char v9 = *(unsigned char *)(a1 + 52);
    id v7 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
}

uint64_t __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke_1(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 136) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = (os_log_t *)MEMORY[0x263F37FA8];
  int v8 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:]";
    __int16 v12 = 1026;
    int v13 = v5;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d", (uint8_t *)&v10, 0x12u);
  }
  if (self->_trainingCompletion)
  {
    char v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:]";
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s closeSession tracking BOOL, calling old completion", (uint8_t *)&v10, 0xCu);
    }
    [(CSVTUITrainingSession *)self closeSessionWithStatus:v5 successfully:v4 complete:0];
  }
  else
  {
    [(CSVTUITrainingSession *)self closeSessionWithStatus:v5 successfully:v4 voiceTriggerEventInfo:self->_voiceTriggerEventInfo completeWithResult:0];
  }
}

- (void)closeSessionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__CSVTUITrainingSession_closeSessionWithCompletion___block_invoke;
  v7[3] = &unk_264429AE0;
  objc_copyWeak(&v9, &location);
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__CSVTUITrainingSession_closeSessionWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
  id v4 = WeakRetained;
  if (([WeakRetained resultAlreadyReported] & 1) == 0) {
    [*(id *)(a1 + 32) stopMasterTimer];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
}

- (BOOL)resultAlreadyReported
{
  return self->_resultReported;
}

- (void)startTraining
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CSVTUITrainingSession_startTraining__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__CSVTUITrainingSession_startTraining__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setupPhraseSpotter];
  LODWORD(v2) = 10.0;
  uint64_t result = [*(id *)(a1 + 32) startMasterTimerWithTimeout:v2];
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 122) = 0;
  return result;
}

- (CSVTUITrainingSession)initWithUtteranceId:(int64_t)a3 sessionNumber:(int64_t)a4 Locale:(id)a5 vtAssetConfigVersion:(id)a6 audioSession:(id)a7 keywordDetector:(id)a8 speechRecognizer:(id)a9 speechRecognitionRequest:(id)a10 sessionDelegate:(id)a11 sessionDispatchQueue:(id)a12 mhUUID:(id)a13 zeroCounter:(id)a14 completionWithResult:(id)a15
{
  id v46 = a5;
  id obj = a6;
  id v45 = a6;
  id v39 = a7;
  id v18 = a7;
  id v40 = a8;
  id v19 = a8;
  id v43 = a9;
  id v42 = a10;
  id v20 = a11;
  id v41 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v47.receiver = self;
  v47.super_class = (Class)CSVTUITrainingSession;
  double v24 = [(CSVTUITrainingSession *)&v47 init];
  v25 = v24;
  uint64_t v26 = 0;
  if (v18 && v19 && v20)
  {
    if (v24)
    {
      v24->_status = 1;
      v24->_utteranceId = a3;
      v24->_sessionNumber = a4;
      objc_storeStrong((id *)&v24->_locale, a5);
      objc_storeStrong((id *)&v25->_vtAssetConfigVersion, obj);
      objc_storeStrong((id *)&v25->_audioSession, v39);
      objc_storeStrong((id *)&v25->_speechRecognizer, a9);
      objc_storeStrong((id *)&v25->_speechRecognitionRequest, a10);
      speechRecognitionTask = v25->_speechRecognitionTask;
      v25->_speechRecognitionTask = 0;

      masterTimer = v25->_masterTimer;
      v25->_masterTimer = 0;

      __int16 v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      pcmBufArray = v25->_pcmBufArray;
      v25->_pcmBufArray = v29;

      *(_DWORD *)&v25->_resultReported = 0;
      objc_storeWeak((id *)&v25->_sessionDelegate, v20);
      id trainingCompletion = v25->_trainingCompletion;
      v25->_id trainingCompletion = 0;

      uint64_t v32 = MEMORY[0x21D4B2740](v23);
      id trainingCompletionWithResult = v25->_trainingCompletionWithResult;
      v25->_id trainingCompletionWithResult = (id)v32;

      objc_storeStrong((id *)&v25->_queue, a12);
      objc_storeStrong((id *)&v25->_mhUUID, a13);
      v25->_phId = 0;
      v25->_numRequiredTrailingSamples = 0;
      v25->_numTrailingSamples = 0;
      objc_storeStrong((id *)&v25->_continuousZeroCounter, a14);
      objc_storeStrong((id *)&v25->_keywordDetector, v40);
    }
    uint64_t v26 = v25;
  }

  return v26;
}

- (CSVTUITrainingSession)initWithUtteranceId:(int64_t)a3 sessionNumber:(int64_t)a4 Locale:(id)a5 audioSession:(id)a6 keywordDetector:(id)a7 speechRecognizer:(id)a8 speechRecognitionRequest:(id)a9 sessionDelegate:(id)a10 sessionDispatchQueue:(id)a11 zeroCounter:(id)a12 completion:(id)a13
{
  id v41 = a5;
  id obj = a6;
  id v18 = a6;
  id v37 = a7;
  id v19 = a7;
  id v40 = a8;
  id v39 = a9;
  id v20 = a10;
  id v21 = a11;
  id v38 = a12;
  id v22 = a13;
  v42.receiver = self;
  v42.super_class = (Class)CSVTUITrainingSession;
  id v23 = [(CSVTUITrainingSession *)&v42 init];
  double v24 = v23;
  v25 = 0;
  if (v18 && v19 && v20)
  {
    if (v23)
    {
      v23->_status = 1;
      v23->_utteranceId = a3;
      v23->_sessionNumber = a4;
      objc_storeStrong((id *)&v23->_locale, a5);
      objc_storeStrong((id *)&v24->_audioSession, obj);
      objc_storeStrong((id *)&v24->_speechRecognizer, a8);
      objc_storeStrong((id *)&v24->_speechRecognitionRequest, a9);
      speechRecognitionTask = v24->_speechRecognitionTask;
      v24->_speechRecognitionTask = 0;

      masterTimer = v24->_masterTimer;
      v24->_masterTimer = 0;

      uint64_t v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      pcmBufArray = v24->_pcmBufArray;
      v24->_pcmBufArray = v28;

      *(_DWORD *)&v24->_resultReported = 0;
      objc_storeWeak((id *)&v24->_sessionDelegate, v20);
      uint64_t v30 = MEMORY[0x21D4B2740](v22);
      id trainingCompletion = v24->_trainingCompletion;
      v24->_id trainingCompletion = (id)v30;

      id trainingCompletionWithResult = v24->_trainingCompletionWithResult;
      v24->_id trainingCompletionWithResult = 0;

      objc_storeStrong((id *)&v24->_queue, a11);
      v24->_numRequiredTrailingSamples = 0;
      v24->_numTrailingSamples = 0;
      objc_storeStrong((id *)&v24->_continuousZeroCounter, a12);
      objc_storeStrong((id *)&v24->_keywordDetector, v37);
    }
    v25 = v24;
  }

  return v25;
}

@end