@interface CSVTUITrainingSessionWithPayload
- (BOOL)shouldHandleSession;
- (BOOL)shouldMatchPayload;
- (NSDictionary)voiceTriggerEventInfo;
- (float)_getSessionEOSTimeout;
- (void)_firedEndPointTimeout;
- (void)_firedVoiceTriggerTimeout;
- (void)_registerEndPointTimeout;
- (void)_registerForceEndPointTimeout;
- (void)_registerVoiceTriggerTimeout;
- (void)_reportStopListening;
- (void)audioSessionDidStartRecording:(BOOL)a3 error:(id)a4;
- (void)audioSessionDidStopRecording:(int64_t)a3;
- (void)audioSessionErrorDidOccur:(id)a3;
- (void)audioSessionUnsupportedAudioRoute;
- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4;
- (void)didDetectBeginOfSpeech;
- (void)didDetectEndOfSpeech:(int64_t)a3;
- (void)handleAudioInput:(id)a3;
- (void)matchRecognitionResult:(id)a3 withMatchedBlock:(id)a4 withNonMatchedBlock:(id)a5;
- (void)setVoiceTriggerEventInfo:(id)a3;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4;
- (void)startTraining;
@end

@implementation CSVTUITrainingSessionWithPayload

- (void).cxx_destruct
{
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)matchRecognitionResult:(id)a3 withMatchedBlock:(id)a4 withNonMatchedBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(void))a4;
  v10 = (void (**)(void))a5;
  if (v8)
  {
    v11 = +[CSVTUIASRGrammars sharedGrammars];
    v12 = [v11 getTrailingPatternsForUtt:self->super._utteranceId Locale:self->super._locale];

    v13 = +[CSVTUIASRGrammars sharedGrammars];
    v14 = [v13 getLeadingPatternsForUtt:self->super._utteranceId Locale:self->super._locale];

    v15 = +[CSVTUIASRGrammars sharedGrammars];
    v16 = [v15 getRegexPatternsForUtt:self->super._utteranceId Locale:self->super._locale];

    int64_t v17 = 0;
    if (v12 && v14 && v16) {
      int64_t v17 = +[CSVTUIRegularExpressionMatcher matchWithString:v8 TrailingStr:v12 LeadingStr:v14 Pattern:v16];
    }
    v18 = (NSObject **)MEMORY[0x263F37FA8];
    v19 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int64_t utteranceId = self->super._utteranceId;
      int v22 = 136316162;
      v23 = "-[CSVTUITrainingSessionWithPayload matchRecognitionResult:withMatchedBlock:withNonMatchedBlock:]";
      __int16 v24 = 2114;
      int64_t v25 = (int64_t)v12;
      __int16 v26 = 2114;
      v27 = v14;
      __int16 v28 = 2050;
      int64_t v29 = utteranceId;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@ %{public}ld %{public}@", (uint8_t *)&v22, 0x34u);
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      v23 = "-[CSVTUITrainingSessionWithPayload matchRecognitionResult:withMatchedBlock:withNonMatchedBlock:]";
      __int16 v24 = 2050;
      int64_t v25 = v17;
      _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Recog Result: [%{public}ld]", (uint8_t *)&v22, 0x16u);
    }
    if (v9 && (v21 = v9, v17 == 1) || v10 && (v21 = v10, !v17)) {
      v21[2]();
    }
  }
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  if (self->super._speechRecognitionTask == a3 && !a4)
  {
    queue = self->super._queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishSuccessfully___block_invoke;
    block[3] = &unk_26442A618;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __80__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishSuccessfully___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishSuccessfully:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s SPEECH RECOGNITION TASK FINISH UNSUCCESSFULLY", (uint8_t *)&v3, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 123) = 1;
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v6 = a4;
  if (self->super._speechRecognitionTask == a3)
  {
    objc_initWeak(&location, self);
    queue = self->super._queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke;
    v8[3] = &unk_264429B80;
    v8[4] = self;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v3 = [*(id *)(a1 + 40) bestTranscription];
    v4 = [v3 formattedString];
    uint64_t v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];

    *(unsigned char *)(*(void *)(a1 + 32) + 201) = 1;
    v7 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishRecognition:]_block_invoke";
      __int16 v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Final: [%{public}@]", buf, 0x16u);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_8;
    v11[3] = &unk_26442A618;
    id v12 = WeakRetained;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_9;
    v9[3] = &unk_26442A618;
    id v10 = v12;
    id v8 = v12;
    [v8 matchRecognitionResult:v6 withMatchedBlock:v11 withNonMatchedBlock:v9];
  }
}

uint64_t __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishRecognition:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Final Matching", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) finishSpeechRecognitionTask];
  return [*(id *)(a1 + 32) closeSessionWithStatus:1 successfully:1];
}

uint64_t __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_9(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishRecognition:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Final Not Matching", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) finishSpeechRecognitionTask];
  return [*(id *)(a1 + 32) closeSessionWithStatus:2 successfully:0];
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  id v6 = a4;
  if (self->super._speechRecognitionTask == a3)
  {
    objc_initWeak(&location, self);
    queue = self->super._queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke;
    v8[3] = &unk_264429B80;
    v8[4] = self;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v3 = [*(id *)(a1 + 40) formattedString];
    int v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

    *(unsigned char *)(*(void *)(a1 + 32) + 201) = 1;
    id v6 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didHypothesizeTranscription:]_block_invoke";
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Non Final: [%{public}@]", buf, 0x16u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke_7;
    v8[3] = &unk_26442A618;
    id v9 = WeakRetained;
    id v7 = WeakRetained;
    [v7 matchRecognitionResult:v5 withMatchedBlock:v8 withNonMatchedBlock:0];
  }
}

uint64_t __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke_7(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didHypothesizeTranscription:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s NON Final Matching", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) finishSpeechRecognitionTask];
  return [*(id *)(a1 + 32) closeSessionWithStatus:1 successfully:1];
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = (os_log_t *)MEMORY[0x263F37FA8];
  id v8 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    BOOL utteranceStored = self->_utteranceStored;
    int v15 = 136315906;
    v16 = "-[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:]";
    __int16 v17 = 1026;
    int v18 = v5;
    __int16 v19 = 1026;
    BOOL v20 = v4;
    __int16 v21 = 1026;
    BOOL v22 = utteranceStored;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d and success : %{public}d utteranceStored : %{public}d", (uint8_t *)&v15, 0x1Eu);
  }
  if (v5 <= 1 && !self->_utteranceStored)
  {
    id v10 = [(CSVTUITrainingSession *)self requestTriggeredUtterance:self->_voiceTriggerEventInfo];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._sessionDelegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->super._sessionDelegate);
      self->_BOOL utteranceStored = [v13 CSVTUITrainingSession:self hasTrainUtterance:v10 languageCode:self->super._locale payload:1];

      if (!self->_utteranceStored)
      {
        uint64_t v14 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315138;
          v16 = "-[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:]";
          _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to store utterance, overiding status", (uint8_t *)&v15, 0xCu);
        }
        uint64_t v5 = 2;
      }
    }
  }
  if (self->super._trainingCompletion) {
    [(CSVTUITrainingSession *)self closeSessionWithStatus:v5 successfully:v4 complete:0];
  }
  else {
    [(CSVTUITrainingSession *)self closeSessionWithStatus:v5 successfully:v4 voiceTriggerEventInfo:self->_voiceTriggerEventInfo completeWithResult:0];
  }
}

- (void)didDetectEndOfSpeech:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = (os_log_t *)MEMORY[0x263F37FA8];
  uint64_t v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[CSVTUITrainingSessionWithPayload didDetectEndOfSpeech:]";
    __int16 v18 = 2050;
    int64_t v19 = a3;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s End of speech detected with endpoint type: %{public}ld", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  if (a3 == 2)
  {
    queue = self->super._queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke_2;
    v11[3] = &unk_264429BD0;
    objc_copyWeak(&v12, &location);
    dispatch_async(queue, v11);
    id v8 = &v12;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    id v7 = self->super._queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke;
    block[3] = &unk_26442A160;
    objc_copyWeak(&v14, &location);
    block[4] = self;
    dispatch_async(v7, block);
    id v8 = &v14;
LABEL_7:
    objc_destroyWeak(v8);
    goto LABEL_10;
  }
  id v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v17 = "-[CSVTUITrainingSessionWithPayload didDetectEndOfSpeech:]";
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s unknown endpoint type", buf, 0xCu);
  }
LABEL_10:
  objc_destroyWeak(&location);
}

void __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(unsigned char *)(*(void *)(a1 + 32) + 200))
  {
    id v3 = WeakRetained;
    [WeakRetained _reportStopListening];
    [v3 _registerEndPointTimeout];
    id WeakRetained = v3;
    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  }
}

void __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportStopListening];
  [WeakRetained _registerForceEndPointTimeout];
}

- (void)didDetectBeginOfSpeech
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSVTUITrainingSessionWithPayload didDetectBeginOfSpeech]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Begin of speech detected", buf, 0xCu);
  }
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CSVTUITrainingSessionWithPayload_didDetectBeginOfSpeech__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__CSVTUITrainingSessionWithPayload_didDetectBeginOfSpeech__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 200) = 1;
  return result;
}

- (void)audioSessionUnsupportedAudioRoute
{
}

- (void)audioSessionErrorDidOccur:(id)a3
{
}

- (void)audioSessionDidStopRecording:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSVTUITrainingSessionWithPayload audioSessionDidStopRecording:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s AudioSession Stopped", (uint8_t *)&v6, 0xCu);
  }
  if (a3) {
    [(CSVTUITrainingSessionWithPayload *)self closeSessionWithStatus:5 successfully:0];
  }
}

- (void)audioSessionDidStartRecording:(BOOL)a3 error:(id)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSVTUITrainingSessionWithPayload audioSessionDidStartRecording:error:]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s AudioSession Started", (uint8_t *)&v5, 0xCu);
  }
}

- (void)handleAudioInput:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->super._queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke;
  v7[3] = &unk_264429B80;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained && [WeakRetained shouldHandleSession])
  {
    [v3 updateMeterAndForward];
    unint64_t v4 = [*(id *)(a1 + 32) length];
    unsigned int v5 = [MEMORY[0x263F38018] inputRecordingBytesPerFrame];
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = v6[1];
    unint64_t v8 = v4 / v5;
    if (v7 == 3)
    {
      float v10 = (float)(v6[26] + v8 - v6[27]);
      [MEMORY[0x263F38018] inputRecordingDurationInSecs];
      float v12 = v11;
      [MEMORY[0x263F38018] inputRecordingSampleRate];
      if ((float)(v12 * v13) >= v10)
      {
        *(void *)(*(void *)(a1 + 40) + 208) += v8;
        [v3 handleAudioBufferForVTWithAudioInput:*(void *)(a1 + 32) withDetectedBlock:0];
      }
      else
      {
        id v14 = *MEMORY[0x263F37FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = *(void **)(a1 + 40);
          uint64_t v16 = v15[26];
          uint64_t v17 = v15[27];
          uint64_t v18 = v15[28];
          *(_DWORD *)buf = 136316418;
          BOOL v22 = "-[CSVTUITrainingSessionWithPayload handleAudioInput:]_block_invoke";
          __int16 v23 = 2050;
          unint64_t v24 = v8;
          __int16 v25 = 2050;
          uint64_t v26 = v16 - v17;
          __int16 v27 = 2050;
          uint64_t v28 = v16;
          __int16 v29 = 2050;
          uint64_t v30 = v17;
          __int16 v31 = 2050;
          uint64_t v32 = v18;
          _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Discarding surplus audio of %{public}lu samples, audio sample available %{public}lu (%{public}lu, %{public}lu, %{public}lu)", buf, 0x3Eu);
        }
      }
      [v3 pushAudioInputIntoPCMBuffer:*(void *)(a1 + 32)];
      [v3 feedSpeechRecognitionWithPCMBuffer];
    }
    else if (v7 == 1)
    {
      [v3 pushAudioInputIntoPCMBuffer:*(void *)(a1 + 32)];
      *(void *)(*(void *)(a1 + 40) + 208) += v8;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke_2;
      v19[3] = &unk_264429B58;
      uint64_t v9 = *(void *)(a1 + 32);
      v19[4] = *(void *)(a1 + 40);
      id v20 = v3;
      [v20 handleAudioBufferForVTWithAudioInput:v9 withDetectedBlock:v19];
    }
  }
}

void __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), a2);
  id v11 = a2;
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 232) objectForKeyedSubscript:*MEMORY[0x263F38220]];
  *(void *)(*(void *)(a1 + 32) + 216) = [v4 unsignedIntegerValue];

  unsigned int v5 = [v11 objectForKeyedSubscript:*MEMORY[0x263F381B0]];
  *(void *)(*(void *)(a1 + 32) + 48) = [v5 unsignedIntegerValue];

  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(v6 + 216);
  unint64_t v8 = *(void *)(v6 + 224);
  BOOL v9 = v7 >= v8;
  unint64_t v10 = v7 - v8;
  if (!v9) {
    unint64_t v10 = 0;
  }
  *(void *)(v6 + 216) = v10;
  [*(id *)(a1 + 40) setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:v11];
  [*(id *)(a1 + 40) feedSpeechRecognitionWithPCMBuffer];
  *(void *)(*(void *)(a1 + 32) + 8) = 3;
  [*(id *)(a1 + 40) _registerVoiceTriggerTimeout];
}

- (void)_reportStopListening
{
  if (!self->_reportedStopListening)
  {
    self->_reportedStopListening = 1;
    p_sessionDelegate = &self->super._sessionDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._sessionDelegate);
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)p_sessionDelegate);
      [v5 CSVTUITrainingSessionStopListen];
    }
  }
}

- (void)_firedEndPointTimeout
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(CSVTUITrainingSessionWithPayload *)self shouldHandleSession])
  {
    int64_t status = self->super._status;
    char v4 = (os_log_t *)MEMORY[0x263F37FA8];
    id v5 = *MEMORY[0x263F37FA8];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT);
    if (status == 3)
    {
      if (v6)
      {
        int v9 = 136315138;
        unint64_t v10 = "-[CSVTUITrainingSessionWithPayload _firedEndPointTimeout]";
        _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s EOS Timeout Fired", (uint8_t *)&v9, 0xCu);
      }
      if ([(CSVTUITrainingSessionWithPayload *)self shouldMatchPayload])
      {
        [(CSVTUITrainingSession *)self finishSpeechRecognitionTask];
      }
      else
      {
        unint64_t v8 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315138;
          unint64_t v10 = "-[CSVTUITrainingSessionWithPayload _firedEndPointTimeout]";
          _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Stop right now since ASR has issue", (uint8_t *)&v9, 0xCu);
        }
      }
      uint64_t v7 = 1;
    }
    else
    {
      if (v6)
      {
        int v9 = 136315138;
        unint64_t v10 = "-[CSVTUITrainingSessionWithPayload _firedEndPointTimeout]";
        _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Force endpoint fired", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v7 = 7;
    }
    [(CSVTUITrainingSessionWithPayload *)self closeSessionWithStatus:v7 successfully:0];
  }
}

- (void)_registerEndPointTimeout
{
  objc_initWeak(&location, self);
  [(CSVTUITrainingSessionWithPayload *)self _getSessionEOSTimeout];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(float)(v3 * 1000000000.0));
  queue = self->super._queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CSVTUITrainingSessionWithPayload__registerEndPointTimeout__block_invoke;
  v6[3] = &unk_264429BD0;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __60__CSVTUITrainingSessionWithPayload__registerEndPointTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _firedEndPointTimeout];
}

- (float)_getSessionEOSTimeout
{
  speechRecognizer = self->super._speechRecognizer;
  if (!speechRecognizer) {
    return 0.0;
  }
  BOOL v3 = [(SFSpeechRecognizer *)speechRecognizer isAvailable];
  float result = 1.5;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (void)_registerForceEndPointTimeout
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 1500000000);
  queue = self->super._queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__CSVTUITrainingSessionWithPayload__registerForceEndPointTimeout__block_invoke;
  v5[3] = &unk_264429BD0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __65__CSVTUITrainingSessionWithPayload__registerForceEndPointTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _firedEndPointTimeout];
}

- (void)_firedVoiceTriggerTimeout
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(CSVTUITrainingSessionWithPayload *)self shouldHandleSession])
  {
    dispatch_time_t v3 = (os_log_t *)MEMORY[0x263F37FA8];
    dispatch_time_t v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[CSVTUITrainingSessionWithPayload _firedVoiceTriggerTimeout]";
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Fired VoiceTrigger Timeout", (uint8_t *)&v6, 0xCu);
    }
    if ([(CSVTUITrainingSessionWithPayload *)self shouldMatchPayload])
    {
      [(CSVTUITrainingSession *)self finishSpeechRecognitionTask];
    }
    else
    {
      id v5 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[CSVTUITrainingSessionWithPayload _firedVoiceTriggerTimeout]";
        _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Stop right now since ASR has issue", (uint8_t *)&v6, 0xCu);
      }
    }
    [(CSVTUITrainingSessionWithPayload *)self closeSessionWithStatus:1 successfully:0];
  }
}

- (void)_registerVoiceTriggerTimeout
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  queue = self->super._queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__CSVTUITrainingSessionWithPayload__registerVoiceTriggerTimeout__block_invoke;
  v5[3] = &unk_264429BD0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__CSVTUITrainingSessionWithPayload__registerVoiceTriggerTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _firedVoiceTriggerTimeout];
}

- (BOOL)shouldMatchPayload
{
  if (self->super._ASRErrorOccured)
  {
    LOBYTE(speechRecognizer) = 0;
  }
  else
  {
    speechRecognizer = self->super._speechRecognizer;
    if (speechRecognizer)
    {
      LODWORD(speechRecognizer) = [(SFSpeechRecognizer *)speechRecognizer isAvailable];
      if (speechRecognizer) {
        LOBYTE(speechRecognizer) = self->_ASRResultReceived;
      }
    }
  }
  return (char)speechRecognizer;
}

- (BOOL)shouldHandleSession
{
  return self->super._sessionProcess && !self->super._sessionSuspended;
}

- (void)startTraining
{
  v4.receiver = self;
  v4.super_class = (Class)CSVTUITrainingSessionWithPayload;
  [(CSVTUITrainingSession *)&v4 startTraining];
  self->_detectBOS = 0;
  self->_ASRResultReceived = 0;
  self->_reportedStopListening = 0;
  self->_BOOL utteranceStored = 0;
  self->_numSamplesFed = 0;
  self->_bestTriggerSampleStart = 0;
  self->super._phId = 0;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  self->_extraSamplesAtStart = (unint64_t)(float)(v3 * 0.5);
}

@end