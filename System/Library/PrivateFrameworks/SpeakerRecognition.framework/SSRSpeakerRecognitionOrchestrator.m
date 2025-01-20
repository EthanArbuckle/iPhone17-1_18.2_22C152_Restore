@interface SSRSpeakerRecognitionOrchestrator
- (CSAudioFileWriter)ssrUttLogger;
- (NSDictionary)combinedScores;
- (NSDictionary)psrFinalSpeakerInfo;
- (NSDictionary)psrLastSpeakerInfo;
- (NSDictionary)satFinalSpeakerInfo;
- (NSDictionary)satLastSpeakerInfo;
- (NSString)debugUtteranceAudioFilePath;
- (NSString)debugUtteranceJsonFilePath;
- (NSString)transDesc;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (SSRSpeakerRecognitionContext)context;
- (SSRSpeakerRecognitionOrchestrator)initWithContext:(id)a3 withDelegate:(id)a4 error:(id *)a5;
- (SSRSpeakerRecognitionOrchestratorDelegate)delegate;
- (SSRSpeakerRecognizer)psrRecognizer;
- (SSRSpeakerRecognizer)satRecognizer;
- (SSRVoiceActivityDetector)vad;
- (id)getLatestVoiceRecognitionInfo;
- (id)orchestratorScoresWithPSRScores:(id)a3 withSATScores:(id)a4 withSegmentStartTime:(double)a5;
- (id)resetWithContext:(id)a3;
- (unint64_t)getPSRProcessingTime;
- (unint64_t)myriadResult;
- (void)SSRVoiceActivityDetector:(id)a3 didDetectEndPointAt:(unint64_t)a4;
- (void)SSRVoiceActivityDetector:(id)a3 didDetectStartPointAt:(unint64_t)a4;
- (void)_logSpeakerIdProcessorScoreDelayWithScoreInfo:(id)a3 hasFinished:(BOOL)a4;
- (void)_resetWithContext:(id)a3;
- (void)dealloc;
- (void)endAudio;
- (void)processAudio:(id)a3 numSamples:(unint64_t)a4;
- (void)setCombinedScores:(id)a3;
- (void)setContext:(id)a3;
- (void)setDebugUtteranceAudioFilePath:(id)a3;
- (void)setDebugUtteranceJsonFilePath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMyriadResult:(unint64_t)a3;
- (void)setPsrFinalSpeakerInfo:(id)a3;
- (void)setPsrLastSpeakerInfo:(id)a3;
- (void)setPsrRecognizer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSatFinalSpeakerInfo:(id)a3;
- (void)setSatLastSpeakerInfo:(id)a3;
- (void)setSatRecognizer:(id)a3;
- (void)setSsrUttLogger:(id)a3;
- (void)setTransDesc:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setVad:(id)a3;
- (void)speakerRecognizer:(id)a3 hasSpeakerIdInfo:(id)a4;
- (void)speakerRecognizerFinishedProcessing:(id)a3 withFinalSpeakerIdInfo:(id)a4;
- (void)updateDebugFilePathsForSegment:(unint64_t)a3;
@end

@implementation SSRSpeakerRecognitionOrchestrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transDesc, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_debugUtteranceJsonFilePath, 0);
  objc_storeStrong((id *)&self->_debugUtteranceAudioFilePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_satFinalSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_psrFinalSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_combinedScores, 0);
  objc_storeStrong((id *)&self->_satLastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_psrLastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_vad, 0);
  objc_storeStrong((id *)&self->_satRecognizer, 0);
  objc_storeStrong((id *)&self->_psrRecognizer, 0);
  objc_storeStrong((id *)&self->_ssrUttLogger, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setTransDesc:(id)a3
{
}

- (NSString)transDesc
{
  return self->_transDesc;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setDebugUtteranceJsonFilePath:(id)a3
{
}

- (NSString)debugUtteranceJsonFilePath
{
  return self->_debugUtteranceJsonFilePath;
}

- (void)setDebugUtteranceAudioFilePath:(id)a3
{
}

- (NSString)debugUtteranceAudioFilePath
{
  return self->_debugUtteranceAudioFilePath;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSatFinalSpeakerInfo:(id)a3
{
}

- (NSDictionary)satFinalSpeakerInfo
{
  return self->_satFinalSpeakerInfo;
}

- (void)setPsrFinalSpeakerInfo:(id)a3
{
}

- (NSDictionary)psrFinalSpeakerInfo
{
  return self->_psrFinalSpeakerInfo;
}

- (void)setCombinedScores:(id)a3
{
}

- (NSDictionary)combinedScores
{
  return self->_combinedScores;
}

- (void)setSatLastSpeakerInfo:(id)a3
{
}

- (NSDictionary)satLastSpeakerInfo
{
  return self->_satLastSpeakerInfo;
}

- (void)setPsrLastSpeakerInfo:(id)a3
{
}

- (NSDictionary)psrLastSpeakerInfo
{
  return self->_psrLastSpeakerInfo;
}

- (void)setVad:(id)a3
{
}

- (SSRVoiceActivityDetector)vad
{
  return self->_vad;
}

- (void)setSatRecognizer:(id)a3
{
}

- (SSRSpeakerRecognizer)satRecognizer
{
  return self->_satRecognizer;
}

- (void)setPsrRecognizer:(id)a3
{
}

- (SSRSpeakerRecognizer)psrRecognizer
{
  return self->_psrRecognizer;
}

- (void)setMyriadResult:(unint64_t)a3
{
  self->_myriadResult = a3;
}

- (unint64_t)myriadResult
{
  return self->_myriadResult;
}

- (void)setSsrUttLogger:(id)a3
{
}

- (CSAudioFileWriter)ssrUttLogger
{
  return self->_ssrUttLogger;
}

- (void)setDelegate:(id)a3
{
}

- (SSRSpeakerRecognitionOrchestratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRSpeakerRecognitionOrchestratorDelegate *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)SSRVoiceActivityDetector:(id)a3 didDetectEndPointAt:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectEndPointAt___block_invoke;
  v5[3] = &unk_2644290B0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __82__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectEndPointAt___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(a1 + 32) + 24);
  *(double *)(*(void *)(a1 + 32) + 16) = (double)*(unint64_t *)(a1 + 40) / 1000.0;
  v2 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 48);
    v4 = v2;
    v5 = [v3 sessionId];
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 136315650;
    v9 = "-[SSRSpeakerRecognitionOrchestrator SSRVoiceActivityDetector:didDetectEndPointAt:]_block_invoke";
    __int16 v10 = 2114;
    v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Starting a new segment of speech - %ldms", (uint8_t *)&v8, 0x20u);
  }
  return [*(id *)(a1 + 32) _resetWithContext:*(void *)(*(void *)(a1 + 32) + 48)];
}

- (void)SSRVoiceActivityDetector:(id)a3 didDetectStartPointAt:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectStartPointAt___block_invoke;
  v5[3] = &unk_2644290B0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __84__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectStartPointAt___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 48);
    v4 = v2;
    v5 = [v3 sessionId];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 136315650;
    int v8 = "-[SSRSpeakerRecognitionOrchestrator SSRVoiceActivityDetector:didDetectStartPointAt:]_block_invoke";
    __int16 v9 = 2114;
    __int16 v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Speech started at - %ldms", (uint8_t *)&v7, 0x20u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
}

- (void)speakerRecognizerFinishedProcessing:(id)a3 withFinalSpeakerIdInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__SSRSpeakerRecognitionOrchestrator_speakerRecognizerFinishedProcessing_withFinalSpeakerIdInfo___block_invoke;
  block[3] = &unk_26442A310;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __96__SSRSpeakerRecognitionOrchestrator_speakerRecognizerFinishedProcessing_withFinalSpeakerIdInfo___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    id v12 = (void *)*MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 48);
    id v14 = v12;
    v15 = [v13 sessionId];
    v16 = *(__CFString **)(a1 + 48);
    *(_DWORD *)v52 = 136315650;
    *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:]_block_invoke";
    *(_WORD *)&v52[12] = 2114;
    *(void *)&v52[14] = v15;
    *(_WORD *)&v52[22] = 2114;
    v53 = v16;
    v17 = "%s SSROrch[%{public}@]:: ERR: VoiceInfo is nil from recognizer %{public}@";
LABEL_28:
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, v17, v52, 0x20u);
LABEL_29:

    return;
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 48) recognitionStyle];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == 2 && !*(unsigned char *)(v3 + 40))
  {
    v44 = (void *)*MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v45 = *(void **)(v3 + 48);
    id v14 = v44;
    v15 = [v45 sessionId];
    v46 = *(__CFString **)(a1 + 48);
    *(_DWORD *)v52 = 136315650;
    *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:]_block_invoke";
    *(_WORD *)&v52[12] = 2114;
    *(void *)&v52[14] = v15;
    *(_WORD *)&v52[22] = 2114;
    v53 = v46;
    v17 = "%s SSROrch[%{public}@]:: EndAudioCalled is false, returning for recognizer %{public}@";
    goto LABEL_28;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = (os_log_t *)MEMORY[0x263F38100];
  if (v4 == *(void *)(v3 + 80))
  {
    objc_storeStrong((id *)(v3 + 128), *(id *)(a1 + 32));
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)(*(void *)(a1 + 40) + 48);
      int v8 = v18;
      id v9 = [v19 sessionId];
      v20 = *(__CFString **)(a1 + 32);
      *(_DWORD *)v52 = 136315650;
      *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v9;
      *(_WORD *)&v52[22] = 2114;
      v53 = v20;
      __int16 v11 = "%s SSROrch[%{public}@]:: PSR Analyzer finished the session with %{public}@";
      goto LABEL_12;
    }
  }
  else if (v4 == *(void *)(v3 + 88))
  {
    objc_storeStrong((id *)(v3 + 136), *(id *)(a1 + 32));
    os_log_t v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(*(void *)(a1 + 40) + 48);
      int v8 = v6;
      id v9 = [v7 sessionId];
      id v10 = *(__CFString **)(a1 + 32);
      *(_DWORD *)v52 = 136315650;
      *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v9;
      *(_WORD *)&v52[22] = 2114;
      v53 = v10;
      __int16 v11 = "%s SSROrch[%{public}@]:: SAT Analyzer finished the session with %{public}@";
LABEL_12:
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, v11, v52, 0x20u);
    }
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (!*(void *)(v21 + 80) || !*(void *)(v21 + 88) || *(void *)(v21 + 128))
  {
    uint64_t v22 = objc_msgSend(*(id *)(a1 + 40), "orchestratorScoresWithPSRScores:withSATScores:withSegmentStartTime:", *(void *)(v21 + 128), *(void *)(v21 + 136), *(double *)(v21 + 16), *(_OWORD *)v52, *(void *)&v52[16], v53);
    uint64_t v23 = *(void *)(a1 + 40);
    v24 = *(void **)(v23 + 120);
    *(void *)(v23 + 120) = v22;

    os_log_t v25 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(void **)(*(void *)(a1 + 40) + 48);
      v27 = v25;
      v28 = [v26 sessionId];
      uint64_t v29 = *(void *)(a1 + 40);
      v30 = *(__CFString **)(v29 + 160);
      v31 = *(void **)(v29 + 120);
      *(_DWORD *)v52 = 136315906;
      *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v28;
      *(_WORD *)&v52[22] = 2112;
      v53 = v30;
      __int16 v54 = 2114;
      v55 = v31;
      _os_log_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: FilePath:%@, combinedScores - %{public}@", v52, 0x2Au);
    }
    +[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:*(void *)(*(void *)(a1 + 40) + 160) withScoreInfo:*(void *)(*(void *)(a1 + 40) + 120)];
    os_log_t v32 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(void **)(*(void *)(a1 + 40) + 48);
      v34 = v32;
      v35 = [v33 sessionId];
      v36 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKeyedSubscript:@"spIdKnownUserScores"];
      *(_DWORD *)v52 = 136315650;
      *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v35;
      *(_WORD *)&v52[22] = 2114;
      v53 = v36;
      _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Finished the session with known user scores %{public}@", v52, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
      [v39 voiceRecognitionOrchestratorFinishedProcessing:*(void *)(a1 + 40) withFinalVoiceRecognitionInfo:*(void *)(*(void *)(a1 + 40) + 120)];
    }
    else
    {
      os_log_t v40 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        [*(id *)(a1 + 40) _logSpeakerIdProcessorScoreDelayWithScoreInfo:*(void *)(a1 + 32) hasFinished:1];
        v43 = [*(id *)(*(void *)(a1 + 40) + 48) logAggregator];
        [v43 pushAnalytics];

        return;
      }
      v41 = *(void **)(*(void *)(a1 + 40) + 48);
      v39 = v40;
      v42 = [v41 sessionId];
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v42;
      _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Discarded speaker scores for session", v52, 0x16u);
    }
    goto LABEL_25;
  }
  os_log_t v47 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v48 = *(void **)(v21 + 48);
    id v14 = v47;
    v15 = [v48 sessionId];
    uint64_t v49 = *(void *)(a1 + 40);
    if (*(void *)(v49 + 128)) {
      v50 = @"SAT";
    }
    else {
      v50 = @"PSR";
    }
    v51 = objc_msgSend(*(id *)(v49 + 48), "sessionId", *(void *)v52, *(_OWORD *)&v52[8], v53);
    *(_DWORD *)v52 = 136315906;
    *(void *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:]_block_invoke";
    *(_WORD *)&v52[12] = 2114;
    *(void *)&v52[14] = v15;
    *(_WORD *)&v52[22] = 2114;
    v53 = v50;
    __int16 v54 = 2114;
    v55 = v51;
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Wait for %{public}@ analyzer to complete the session - %{public}@", v52, 0x2Au);

    goto LABEL_29;
  }
}

- (void)speakerRecognizer:(id)a3 hasSpeakerIdInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__SSRSpeakerRecognitionOrchestrator_speakerRecognizer_hasSpeakerIdInfo___block_invoke;
  block[3] = &unk_26442A310;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __72__SSRSpeakerRecognitionOrchestrator_speakerRecognizer_hasSpeakerIdInfo___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4 == *(void *)(v3 + 80))
    {
      uint64_t v5 = 104;
    }
    else
    {
      if (v4 != *(void *)(v3 + 88)) {
        goto LABEL_9;
      }
      uint64_t v5 = 112;
    }
    objc_storeStrong((id *)(v3 + v5), v2);
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_9:
    uint64_t v11 = [(id)v3 orchestratorScoresWithPSRScores:*(void *)(v3 + 104) withSATScores:*(void *)(v3 + 112) withSegmentStartTime:*(double *)(v3 + 16)];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 120);
    *(void *)(v12 + 120) = v11;

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
      [v16 voiceRecognitionOrchestrator:*(void *)(a1 + 40) hasVoiceRecognitionInfo:*(void *)(*(void *)(a1 + 40) + 120)];
    }
    else
    {
      v17 = (void *)*MEMORY[0x263F38100];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:
        [*(id *)(a1 + 40) _logSpeakerIdProcessorScoreDelayWithScoreInfo:*(void *)(a1 + 32) hasFinished:0];
        return;
      }
      os_log_t v18 = *(void **)(*(void *)(a1 + 40) + 48);
      v16 = v17;
      v19 = [v18 sessionId];
      v20 = [*(id *)(*(void *)(a1 + 40) + 48) sessionId];
      int v21 = 136315650;
      uint64_t v22 = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizer:hasSpeakerIdInfo:]_block_invoke";
      __int16 v23 = 2114;
      v24 = v19;
      __int16 v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Discarded speaker scores for session - %{public}@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_14;
  }
  id v6 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 48);
    int v8 = v6;
    id v9 = [v7 sessionId];
    id v10 = *(void **)(a1 + 48);
    int v21 = 136315650;
    uint64_t v22 = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizer:hasSpeakerIdInfo:]_block_invoke";
    __int16 v23 = 2114;
    v24 = v9;
    __int16 v25 = 2114;
    v26 = v10;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: ERR: VoiceInfo is nil from recognizer %{public}@", (uint8_t *)&v21, 0x20u);
  }
}

- (id)getLatestVoiceRecognitionInfo
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__761;
  v24 = __Block_byref_object_dispose__762;
  id v25 = 0;
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke;
  block[3] = &unk_26442A648;
  void block[4] = self;
  block[5] = &v20;
  dispatch_async_and_wait(queue, block);
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  [v5 timeIntervalSinceDate:v3];
  uint64_t v18 = v6;
  id v7 = (id)*MEMORY[0x263F38100];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(SSRSpeakerRecognitionContext *)self->_context sessionId];
    uint64_t v9 = v16[3];
    id v10 = [(id)v21[5] objectForKeyedSubscript:@"spIdKnownUserScores"];
    *(_DWORD *)buf = 136315906;
    uint64_t v27 = "-[SSRSpeakerRecognitionOrchestrator getLatestVoiceRecognitionInfo]";
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    __int16 v30 = 2050;
    uint64_t v31 = v9;
    __int16 v32 = 2114;
    v33 = v10;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Sync score report with %{public}f delay - with known user scores %{public}@", buf, 0x2Au);
  }
  uint64_t v11 = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke_59;
  v14[3] = &unk_26442A648;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_async(v11, v14);
  id v12 = (id)v21[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) lastScoreCard];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 88) lastScoreCard];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) orchestratorScoresWithPSRScores:*(void *)(*(void *)(a1 + 32) + 104) withSATScores:*(void *)(*(void *)(a1 + 32) + 112) withSegmentStartTime:*(double *)(*(void *)(a1 + 32) + 16)];

  return MEMORY[0x270F9A758]();
}

void __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke_59(uint64_t a1)
{
  double v2 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) logAggregator];
  [v3 setSpeakerRecognitionWaitTime:v2];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) logAggregator];
  [v4 setSpeakerRecognitionProcessingStatus:0];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 48) logAggregator];
  [v5 pushAnalytics];
}

- (void)updateDebugFilePathsForSegment:(unint64_t)a3
{
  id v5 = [(SSRSpeakerRecognitionContext *)self->_context debugUtteranceAudioFile];
  id v17 = [v5 stringByDeletingLastPathComponent];

  uint64_t v6 = [(SSRSpeakerRecognitionContext *)self->_context debugUtteranceAudioFile];
  id v7 = [v6 lastPathComponent];

  int v8 = NSString;
  uint64_t v9 = [v7 stringByDeletingPathExtension];
  id v10 = [v8 stringWithFormat:@"%@_%d", v9, a3];

  uint64_t v11 = [v10 stringByAppendingPathExtension:@"wav"];
  id v12 = [v17 stringByAppendingPathComponent:v11];
  debugUtteranceAudioFilePath = self->_debugUtteranceAudioFilePath;
  self->_debugUtteranceAudioFilePath = v12;

  id v14 = [v10 stringByAppendingPathExtension:@"json"];
  uint64_t v15 = [v17 stringByAppendingPathComponent:v14];
  debugUtteranceJsonFilePath = self->_debugUtteranceJsonFilePath;
  self->_debugUtteranceJsonFilePath = v15;
}

- (void)_resetWithContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  if ([v5 recognitionStyle] == 2)
  {
    [(CSAudioFileWriter *)self->_ssrUttLogger endAudio];
    +[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:self->_debugUtteranceJsonFilePath withScoreInfo:self->_combinedScores];
    [(SSRSpeakerRecognitionOrchestrator *)self updateDebugFilePathsForSegment:self->_segmentCounter];
    if (CSIsInternalBuild()
      && +[SSRUtils ssrAudioLogsCountWithinPrivacyLimit])
    {
      id v6 = objc_alloc(MEMORY[0x263F380B0]);
      id v7 = [NSURL URLWithString:self->_debugUtteranceAudioFilePath];
      [MEMORY[0x263F38038] lpcmInt16ASBD];
      [MEMORY[0x263F38038] lpcmInt16ASBD];
      int v8 = (CSAudioFileWriter *)[v6 initWithURL:v7 inputFormat:v16 outputFormat:&v15];
      ssrUttLogger = self->_ssrUttLogger;
      self->_ssrUttLogger = v8;
    }
    else
    {
      id v10 = self->_ssrUttLogger;
      self->_ssrUttLogger = 0;
    }
  }
  psrFinalSpeakerInfo = self->_psrFinalSpeakerInfo;
  self->_psrFinalSpeakerInfo = 0;

  satLastSpeakerInfo = self->_satLastSpeakerInfo;
  self->_satLastSpeakerInfo = 0;

  psrLastSpeakerInfo = self->_psrLastSpeakerInfo;
  self->_psrLastSpeakerInfo = 0;

  id v14 = self->_satLastSpeakerInfo;
  self->_satLastSpeakerInfo = 0;

  self->_numSamplesAddedToSpeakerRecognizers = 0;
  self->_startPointReported = 0;
  [(SSRVoiceActivityDetector *)self->_vad resetWithContext:v5];
  [(SSRSpeakerRecognizer *)self->_psrRecognizer resetWithContext:v5];
  [(SSRSpeakerRecognizer *)self->_satRecognizer resetWithContext:v5];
}

- (id)orchestratorScoresWithPSRScores:(id)a3 withSATScores:(id)a4 withSegmentStartTime:(double)a5
{
  context = self->_context;
  id v9 = a4;
  id v10 = a3;
  [(SSRSpeakerRecognitionContext *)context combinationWeight];
  uint64_t v11 = +[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:](SSRUtils, "combineScoreFromPSR:fromSAT:withCombinedWt:", v10, v9);

  id v12 = [(SSRSpeakerRecognitionContext *)self->_context numEnrollmentUtterances];
  [v11 setObject:v12 forKeyedSubscript:@"numEnrollmentUtt"];

  uint64_t v13 = NSNumber;
  [(SSRSpeakerRecognitionContext *)self->_context combinationWeight];
  id v14 = objc_msgSend(v13, "numberWithFloat:");
  [v11 setObject:v14 forKeyedSubscript:@"combinationWeight"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SSRSpeakerRecognitionContext scoreType](self->_context, "scoreType"));
  [v11 setObject:v15 forKeyedSubscript:@"spIdUserScoresVersion"];

  v16 = [(SSRSpeakerRecognitionContext *)self->_context sessionId];
  [v11 setObject:v16 forKeyedSubscript:@"sessionId"];

  id v17 = [(SSRSpeakerRecognitionContext *)self->_context configVersion];
  [v11 setObject:v17 forKeyedSubscript:@"spIdAssetVersion"];

  uint64_t v18 = [NSNumber numberWithDouble:a5];
  [v11 setObject:v18 forKeyedSubscript:@"segmentStartTime"];

  v19 = [NSNumber numberWithUnsignedInteger:self->_segmentCounter];
  [v11 setObject:v19 forKeyedSubscript:@"segmentCounter"];

  uint64_t v20 = [NSNumber numberWithUnsignedInteger:self->_myriadResult];
  [v11 setObject:v20 forKeyedSubscript:@"myriad"];

  if (CSIsInternalBuild()) {
    [v11 setObject:self->_debugUtteranceJsonFilePath forKeyedSubscript:@"ssrMeta"];
  }
  [v11 setObject:@"spIdVTInvocationScoreThresholdingType" forKeyedSubscript:@"spIdScoreThresholdingType"];

  return v11;
}

- (void)_logSpeakerIdProcessorScoreDelayWithScoreInfo:(id)a3 hasFinished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  int v8 = [v6 date];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  double v11 = v10 - self->_lastScoreReportTimeStamp;
  id v12 = [v7 objectForKeyedSubscript:@"spIdAudioProcessedDuration"];

  unint64_t v13 = [v12 integerValue];
  id v14 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v15 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    id v17 = v15;
    uint64_t v18 = [(SSRSpeakerRecognitionContext *)context sessionId];
    if (v4) {
      v19 = @"finished";
    }
    else {
      v19 = @"reported";
    }
    double v20 = (double)self->_numSamplesAddedToSpeakerRecognizers * 1000.0;
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    int v24 = 136316418;
    id v25 = "-[SSRSpeakerRecognitionOrchestrator _logSpeakerIdProcessorScoreDelayWithScoreInfo:hasFinished:]";
    __int16 v26 = 2114;
    uint64_t v27 = (uint64_t)v18;
    __int16 v28 = 2114;
    uint64_t v29 = v19;
    __int16 v30 = 2050;
    uint64_t v31 = (uint64_t)(v11 * 1000.0);
    __int16 v32 = 2050;
    unint64_t v33 = v13;
    __int16 v34 = 2050;
    uint64_t v35 = (uint64_t)(v20 / v21 - (double)v13);
    _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Scorecard %{public}@ with delay:%{public}ldms, processed:%{public}ldms, await:%{public}ldms", (uint8_t *)&v24, 0x3Eu);
  }
  if (CSIsCommunalDevice() && v11 > 0.8)
  {
    uint64_t v22 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315394;
      id v25 = "-[SSRSpeakerRecognitionOrchestrator _logSpeakerIdProcessorScoreDelayWithScoreInfo:hasFinished:]";
      __int16 v26 = 2048;
      uint64_t v27 = (uint64_t)(v11 * 1000.0);
      _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s ERR: Posting diagnostic report for abnormal score delay - %ldms", (uint8_t *)&v24, 0x16u);
    }
    __int16 v23 = [MEMORY[0x263F38028] sharedInstance];
    [v23 submitVoiceIdIssueReport:*MEMORY[0x263F38118]];
  }
  self->_lastScoreReportTimeStamp = v10;
}

- (unint64_t)getPSRProcessingTime
{
  return [(SSRSpeakerRecognizer *)self->_psrRecognizer getSpeakerRecognizerProcessingTime];
}

- (id)resetWithContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SSRSpeakerRecognitionOrchestrator_resetWithContext___block_invoke;
  v8[3] = &unk_26442A138;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async_and_wait(queue, v8);

  return 0;
}

uint64_t __54__SSRSpeakerRecognitionOrchestrator_resetWithContext___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 168);
  id v4 = (os_log_t *)MEMORY[0x263F38100];
  if (v3)
  {
    *(void *)(v2 + 168) = 0;

    os_log_t v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(*(void *)(a1 + 32) + 48);
      id v7 = v5;
      int v8 = [v6 sessionId];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 176);
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[SSRSpeakerRecognitionOrchestrator resetWithContext:]_block_invoke";
      __int16 v27 = 2114;
      __int16 v28 = v8;
      __int16 v29 = 2114;
      uint64_t v30 = v9;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Released OS transaction for %{public}@", buf, 0x20u);
    }
  }
  if ([*(id *)(a1 + 40) osTransactionReqd])
  {
    double v10 = NSString;
    double v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    uint64_t v13 = [v10 stringWithFormat:@"SSRSpeakerRecognitionOrchestrator-%@", v12];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 176);
    *(void *)(v14 + 176) = v13;

    [*(id *)(*(void *)(a1 + 32) + 176) UTF8String];
    uint64_t v16 = os_transaction_create();
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(v17 + 168);
    *(void *)(v17 + 168) = v16;

    os_log_t v19 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = *(void **)(*(void *)(a1 + 32) + 48);
      float v21 = v19;
      uint64_t v22 = [v20 sessionId];
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 176);
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[SSRSpeakerRecognitionOrchestrator resetWithContext:]_block_invoke";
      __int16 v27 = 2114;
      __int16 v28 = v22;
      __int16 v29 = 2114;
      uint64_t v30 = v23;
      _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Creating OS transaction for %{public}@", buf, 0x20u);
    }
  }
  return [*(id *)(a1 + 32) _resetWithContext:*(void *)(a1 + 40)];
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SSRSpeakerRecognitionOrchestrator_endAudio__block_invoke;
  block[3] = &unk_26442A618;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__SSRSpeakerRecognitionOrchestrator_endAudio__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  [*(id *)(*(void *)(a1 + 32) + 64) endAudio];
  [*(id *)(*(void *)(a1 + 32) + 80) endAudio];
  [*(id *)(*(void *)(a1 + 32) + 88) endAudio];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 96);

  return [v2 endAudio];
}

- (void)processAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  if (self->_lastScoreReportTimeStamp == 0.0)
  {
    id v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceReferenceDate];
    self->_lastScoreReportTimeStamp = v8;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SSRSpeakerRecognitionOrchestrator_processAudio_numSamples___block_invoke;
  block[3] = &unk_26442A5F0;
  id v12 = v6;
  unint64_t v13 = a4;
  void block[4] = self;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __61__SSRSpeakerRecognitionOrchestrator_processAudio_numSamples___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 40)
    || [*(id *)(v2 + 48) recognitionStyle] != 2
    && (uint64_t v11 = *(void *)(a1 + 32),
        unint64_t v12 = *(void *)(v11 + 32),
        v12 > [*(id *)(v11 + 48) maxAllowedAudioSamples]))
  {
    uint64_t v3 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 48);
      os_log_t v5 = v3;
      id v6 = [v4 sessionId];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(unsigned __int8 *)(v7 + 40);
      uint64_t v9 = *(void *)(v7 + 32);
      uint64_t v10 = [*(id *)(v7 + 48) maxAllowedAudioSamples];
      int v16 = 136316162;
      uint64_t v17 = "-[SSRSpeakerRecognitionOrchestrator processAudio:numSamples:]_block_invoke";
      __int16 v18 = 2114;
      os_log_t v19 = v6;
      __int16 v20 = 1024;
      int v21 = v8;
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Ignoring addAudio, endAudio: %d procSamples: %lu maxProcSamples: %lu", (uint8_t *)&v16, 0x30u);
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 32) += *(void *)(a1 + 48);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "addSamples:numSamples:", objc_msgSend(*(id *)(a1 + 40), "bytes"), *(void *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 32) + 80) processAudioData:*(void *)(a1 + 40) numSamples:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 88) processAudioData:*(void *)(a1 + 40) numSamples:*(void *)(a1 + 48)];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 96);
    uint64_t v15 = *(void *)(a1 + 48);
    [v14 processAudioData:v13 numSamples:v15];
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  transaction = self->_transaction;
  if (transaction)
  {
    id v4 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      transDesc = self->_transDesc;
      *(_DWORD *)buf = 136315394;
      int v8 = "-[SSRSpeakerRecognitionOrchestrator dealloc]";
      __int16 v9 = 2114;
      uint64_t v10 = transDesc;
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Released OS transaction for %{public}@", buf, 0x16u);
      transaction = self->_transaction;
    }
  }
  self->_transaction = 0;

  v6.receiver = self;
  v6.super_class = (Class)SSRSpeakerRecognitionOrchestrator;
  [(SSRSpeakerRecognitionOrchestrator *)&v6 dealloc];
}

- (SSRSpeakerRecognitionOrchestrator)initWithContext:(id)a3 withDelegate:(id)a4 error:(id *)a5
{
  v74[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)SSRSpeakerRecognitionOrchestrator;
  uint64_t v11 = [(SSRSpeakerRecognitionOrchestrator *)&v62 init];
  unint64_t v12 = v11;
  if (!v11)
  {
LABEL_35:
    uint64_t v56 = v12;
    goto LABEL_36;
  }
  p_context = (id *)&v11->_context;
  objc_storeStrong((id *)&v11->_context, a3);
  uint64_t v14 = [[SSRSpeakerRecognizerPSR alloc] initWithContext:v9 delegate:v12];
  psrRecognizer = v12->_psrRecognizer;
  v12->_psrRecognizer = (SSRSpeakerRecognizer *)v14;

  int v16 = (os_log_t *)MEMORY[0x263F38100];
  if (!v12->_psrRecognizer)
  {
    uint64_t v17 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      id v18 = *p_context;
      os_log_t v19 = v17;
      __int16 v20 = [v18 sessionId];
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      __int16 v65 = 2114;
      v66 = v20;
      _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Failed to create PSR Recognizer", buf, 0x16u);
    }
  }
  int v21 = [[SSRSpeakerRecognizerSAT alloc] initWithContext:v9 delegate:v12];
  satRecognizer = v12->_satRecognizer;
  v12->_satRecognizer = (SSRSpeakerRecognizer *)v21;

  if (!v12->_satRecognizer)
  {
    os_log_t v23 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = *p_context;
      uint64_t v25 = v23;
      uint64_t v26 = [v24 sessionId];
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      __int16 v65 = 2114;
      v66 = v26;
      _os_log_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Failed to create SAT Recognizer", buf, 0x16u);
    }
  }
  if (!v12->_psrRecognizer && !v12->_satRecognizer)
  {
    v46 = [NSString stringWithFormat:@"ERR: Failed to init PSR and SAT recognizers - Bailing out"];
    v53 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      __int16 v65 = 2114;
      v66 = v46;
      _os_log_error_impl(&dword_21C8A5000, v53, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!a5) {
        goto LABEL_29;
      }
    }
    else if (!a5)
    {
LABEL_29:
      v50 = [*p_context logAggregator];
      v51 = v50;
      uint64_t v52 = 101;
      goto LABEL_30;
    }
    __int16 v54 = (void *)MEMORY[0x263F087E8];
    v73 = @"reason";
    v74[0] = v46;
    v55 = [NSDictionary dictionaryWithObjects:v74 forKeys:&v73 count:1];
    *a5 = [v54 errorWithDomain:@"com.apple.speakerrecognition" code:101 userInfo:v55];

    goto LABEL_29;
  }
  uint64_t v27 = [v9 debugUtteranceAudioFile];
  debugUtteranceAudioFilePath = v12->_debugUtteranceAudioFilePath;
  v12->_debugUtteranceAudioFilePath = (NSString *)v27;

  uint64_t v29 = [v9 debugUtteranceMetaFile];
  debugUtteranceJsonFilePath = v12->_debugUtteranceJsonFilePath;
  v12->_debugUtteranceJsonFilePath = (NSString *)v29;

  v12->_segmentCounter = 0;
  if ([v9 recognitionStyle] != 2
    || (uint64_t v31 = [[SSRVoiceActivityDetector alloc] initWithContext:v9 delegate:v12], vad = v12->_vad, v12->_vad = v31, vad, v12->_vad))
  {
    uint64_t v33 = [MEMORY[0x263F380D0] getSerialQueueWithQOS:33 name:@"com.apple.ssr.orchestratorq" fixedPriority:*MEMORY[0x263F38110]];
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v33;

    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_myriadResult = 0;
    v12->_numSamplesAddedToSpeakerRecognizers = 0;
    *(_WORD *)&v12->_endAudioCalled = 0;
    if ([v9 recognitionStyle] == 2) {
      [(SSRSpeakerRecognitionOrchestrator *)v12 updateDebugFilePathsForSegment:v12->_segmentCounter];
    }
    ssrUttLogger = v12->_ssrUttLogger;
    v12->_ssrUttLogger = 0;

    if (CSIsInternalBuild())
    {
      uint64_t v36 = [MEMORY[0x263F38068] sharedPreferences];
      int v37 = [v36 speakerRecognitionAudioLoggingEnabled];

      if (v37)
      {
        char v38 = +[SSRUtils ssrAudioLogsDir];
        +[SSRUtils createDirectoryIfDoesNotExist:v38];

        if (+[SSRUtils ssrAudioLogsCountWithinPrivacyLimit])
        {
          id v39 = objc_alloc(MEMORY[0x263F380B0]);
          os_log_t v40 = [NSURL URLWithString:v12->_debugUtteranceAudioFilePath];
          [MEMORY[0x263F38038] lpcmInt16ASBD];
          [MEMORY[0x263F38038] lpcmInt16ASBD];
          uint64_t v41 = [v39 initWithURL:v40 inputFormat:v61 outputFormat:&v60];
          v42 = v12->_ssrUttLogger;
          v12->_ssrUttLogger = (CSAudioFileWriter *)v41;
        }
      }
    }
    v43 = *v16;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [(SSRSpeakerRecognitionContext *)v12->_context sessionId];
      if (v12->_satRecognizer)
      {
        if (v12->_psrRecognizer) {
          v45 = @"SAT+PSR";
        }
        else {
          v45 = @"SAT";
        }
      }
      else
      {
        v45 = @"PSR";
      }
      v57 = [*p_context debugUtteranceAudioFile];
      v58 = [v57 lastPathComponent];
      *(_DWORD *)buf = 136315906;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      __int16 v65 = 2114;
      v66 = v44;
      __int16 v67 = 2114;
      v68 = v45;
      __int16 v69 = 2114;
      v70 = v58;
      _os_log_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Successfully initialized with {%{public}@, %{public}@}", buf, 0x2Au);
    }
    goto LABEL_35;
  }
  v46 = [NSString stringWithFormat:@"ERR: Failed to init VAD - Bailing out"];
  os_log_t v47 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
    __int16 v65 = 2114;
    v66 = v46;
    _os_log_error_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (a5)
  {
LABEL_24:
    v48 = (void *)MEMORY[0x263F087E8];
    v71 = @"reason";
    v72 = v46;
    uint64_t v49 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    *a5 = [v48 errorWithDomain:@"com.apple.speakerrecognition" code:102 userInfo:v49];
  }
LABEL_25:
  v50 = [*p_context logAggregator];
  v51 = v50;
  uint64_t v52 = 102;
LABEL_30:
  [v50 setSpeakerRecognitionProcessingStatus:v52];

  uint64_t v56 = 0;
LABEL_36:

  return v56;
}

@end