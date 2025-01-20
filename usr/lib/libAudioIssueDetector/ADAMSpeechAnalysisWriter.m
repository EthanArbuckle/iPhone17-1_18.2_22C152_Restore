@interface ADAMSpeechAnalysisWriter
+ (id)censoredResultFromInputResult:(id)a3;
- (ADAMSpeechAnalysisWriter)initWithWriterName:(id)a3 sessionID:(unsigned int)a4 audioFormat:(id)a5 speechMetricsSRWriter:(id)a6 completionHandler:(id)a7;
- (BOOL)isComplete;
- (BOOL)isMonitoring;
- (BOOL)verifyStateInit;
- (BOOL)verifyStateOn;
- (id).cxx_construct;
- (int)write:(id)a3 withMetadata:(const Metadata *)a4;
- (unint64_t)_addPendingRequest;
- (unint64_t)_fetchTimestampforTask:(id)a3;
- (unint64_t)_getNumPendingRequests;
- (unint64_t)_removePendingRequest;
- (void)_initSpeechAnalyzer;
- (void)_recordTimestamp:(unint64_t)a3 forTask:(id)a4;
- (void)createAndLogOSTransaction;
- (void)destroyAndLogOSTransaction;
- (void)logResultCountAndFirstTimeStamp;
- (void)speechRecognitionDidDetectSpeech:(id)a3;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4;
- (void)speechRecognitionTaskWasCancelled:(id)a3;
@end

@implementation ADAMSpeechAnalysisWriter

- (id).cxx_construct
{
  *((unsigned char *)self + 136) = 0;
  *((unsigned char *)self + 144) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_speechMetricsSRWriter, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_taskTimestamps, 0);
  objc_storeStrong((id *)&self->_throttlingSemaphore, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_SpeechRequest, 0);

  objc_storeStrong((id *)&self->_SpeechRecognizer, 0);
}

- (void)logResultCountAndFirstTimeStamp
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_firstContinuousTimestampPerMinute.__engaged_)
  {
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v3 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int resultCounterPerMinute = self->_resultCounterPerMinute;
      int v8 = 136316418;
      v9 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v10 = 1024;
      int v11 = 451;
      __int16 v12 = 1040;
      int v13 = 24;
      __int16 v14 = 2080;
      v15 = "ADAMSpeechAnalysisWriter]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 1024;
      LODWORD(v19) = resultCounterPerMinute;
      _os_log_impl(&dword_2227C1000, v3, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] # speech results sent previous minute : %d", (uint8_t *)&v8, 0x32u);
    }
    self->_unsigned int resultCounterPerMinute = 0;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v5 = (id)ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_firstContinuousTimestampPerMinute.__engaged_) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      unint64_t val = self->_firstContinuousTimestampPerMinute.var0.__val_;
      double firstAbsoluteTimestampPerMinute = self->_firstAbsoluteTimestampPerMinute;
      int v8 = 136316674;
      v9 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v10 = 1024;
      int v11 = 454;
      __int16 v12 = 1040;
      int v13 = 24;
      __int16 v14 = 2080;
      v15 = "ADAMSpeechAnalysisWriter]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = val;
      __int16 v20 = 2048;
      double v21 = firstAbsoluteTimestampPerMinute;
      _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] first speech timestamps of previous minute : continuous %llu, absolute %f", (uint8_t *)&v8, 0x40u);
    }

    if (self->_firstContinuousTimestampPerMinute.__engaged_) {
      self->_firstContinuousTimestampPerMinute.__engaged_ = 0;
    }
  }
}

- (BOOL)verifyStateOn
{
  BOOL v3 = [(ADAMSRSensorWriter *)self->_speechMetricsSRWriter isValidSRSensorWriterPresent];
  if (v3) {
    LOBYTE(v3) = self->_SpeechRecognizer != 0;
  }
  return v3;
}

- (BOOL)verifyStateInit
{
  BOOL v3 = [(ADAMSRSensorWriter *)self->_speechMetricsSRWriter isValidSRSensorWriterPresent];
  if (v3) {
    LOBYTE(v3) = self->_SpeechRecognizer == 0;
  }
  return v3;
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6 = a3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_throttlingSemaphore);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ADAMSpeechAnalysisWriter_speechRecognitionTask_didFinishSuccessfully___block_invoke;
  block[3] = &unk_264628E80;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __72__ADAMSpeechAnalysisWriter_speechRecognitionTask_didFinishSuccessfully___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _removePendingRequest];
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v3 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 40) error];
    int v11 = 136316418;
    __int16 v12 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v13 = 1024;
    int v14 = 423;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v2;
    _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -> FINISHED task %@, successful(%@), error: %@, pending requests: %llu", (uint8_t *)&v11, 0x3Au);
  }
LABEL_10:
  [*(id *)(a1 + 32) logResultCountAndFirstTimeStamp];
  v9 = [*(id *)(a1 + 40) error];
  if (!v2)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
    if (v10) {
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    }
  }
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v5 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v9 = 1024;
    int v10 = 405;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d recognition task %@ cancelled", (uint8_t *)&v7, 0x1Cu);
  }

LABEL_10:
  [(ADAMSpeechAnalysisWriter *)self speechRecognitionTask:v4 didFinishSuccessfully:0];
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7
    && ([v7 speechRecognitionMetadata],
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    int v10 = +[ADAMSpeechAnalysisWriter censoredResultFromInputResult:v8];
    unint64_t v11 = [(ADAMSpeechAnalysisWriter *)self _fetchTimestampforTask:v6];
    self->_uint64_t lastTimestamp = v11;
    if (!self->_firstContinuousTimestampPerMinute.__engaged_)
    {
      self->_double firstAbsoluteTimestampPerMinute = SRAbsoluteTimeFromContinuousTime(v11);
      self->_firstContinuousTimestampPerMinute.var0.__val_ = self->_lastTimestamp;
      self->_firstContinuousTimestampPerMinute.__engaged_ = 1;
    }
    id v12 = objc_alloc(MEMORY[0x263F176D0]);
    sessionID = self->_sessionID;
    SRAbsoluteTime v14 = SRAbsoluteTimeFromContinuousTime(self->_lastTimestamp);
    __int16 v15 = (void *)[v12 initWithSessionIdentifier:sessionID sessionFlags:0 timestamp:0 audioLevel:v10 speechRecognition:0 soundClassification:0 speechExpression:SRAbsoluteTimeToCFAbsoluteTime(v14)];
    speechMetricsSRWriter = self->_speechMetricsSRWriter;
    id v26 = 0;
    [(ADAMSRSensorWriter *)speechMetricsSRWriter provideSample:v15 error:&v26];
    __int16 v17 = v26;
    if (v17)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      __int16 v18 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t lastTimestamp = self->_lastTimestamp;
        SRAbsoluteTime v20 = SRAbsoluteTimeFromContinuousTime(lastTimestamp);
        v28 = "ADAMSpeechAnalysisWriter.mm";
        __int16 v29 = 1024;
        int v30 = 381;
        __int16 v31 = 1040;
        int v32 = 24;
        __int16 v33 = 2080;
        *(_DWORD *)buf = 136316930;
        v34 = "ADAMSpeechAnalysisWriter]";
        __int16 v35 = 2048;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v17;
        __int16 v39 = 2048;
        uint64_t v40 = lastTimestamp;
        __int16 v41 = 2048;
        SRAbsoluteTime v42 = v20;
        _os_log_impl(&dword_2227C1000, v18, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] failed to write speech metrics result to SensorKit: %@ timestamp: continuous %llu, absolute %f", buf, 0x4Au);
      }
    }
    else
    {
      ++self->_resultCounterPerMinute;
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      __int16 v18 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v8 bestTranscription];
        uint64_t v23 = [v22 formattedString];
        uint64_t v24 = self->_lastTimestamp;
        SRAbsoluteTime v25 = SRAbsoluteTimeFromContinuousTime(v24);
        *(_DWORD *)buf = 136317443;
        v28 = "ADAMSpeechAnalysisWriter.mm";
        __int16 v29 = 1024;
        int v30 = 387;
        __int16 v31 = 1040;
        int v32 = 24;
        __int16 v33 = 2080;
        v34 = "ADAMSpeechAnalysisWriter]";
        __int16 v35 = 2048;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v6;
        __int16 v39 = 2117;
        uint64_t v40 = (uint64_t)v23;
        __int16 v41 = 2112;
        SRAbsoluteTime v42 = *(double *)&v15;
        __int16 v43 = 2048;
        uint64_t v44 = v24;
        __int16 v45 = 2048;
        SRAbsoluteTime v46 = v25;
        _os_log_impl(&dword_2227C1000, v18, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] -> WRITE speech metrics for task %@, best result: %{sensitive}@ speech metrics: %@ timestamp: continuous %llu, absolute %f", buf, 0x5Eu);
      }
    }
  }
  else
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      __int16 v17 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v17) {
        goto LABEL_22;
      }
    }
    else
    {
      __int16 v17 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v29 = 1024;
      int v30 = 393;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Speech Metrics are null", buf, 0x12u);
    }
  }

LABEL_22:
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  __int16 v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 formattedString];
    int v11 = 136316162;
    id v12 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v13 = 1024;
    int v14 = 323;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = [v5 state];
    _os_log_impl(&dword_2227C1000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d didHypothesizeTranscription for task %@, Transcription: %@ Task state: %ld", (uint8_t *)&v11, 0x30u);
  }
LABEL_10:
}

- (void)speechRecognitionDidDetectSpeech:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    id v7 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v8 = 1024;
    int v9 = 314;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2227C1000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d deteced speech for task %@", (uint8_t *)&v6, 0x1Cu);
  }

LABEL_10:
}

- (int)write:(id)a3 withMetadata:(const Metadata *)a4
{
  id v6 = a3;
  if ([(ADAMSpeechAnalysisWriter *)self isMonitoring])
  {
    if (!self->_transaction) {
      [(ADAMSpeechAnalysisWriter *)self createAndLogOSTransaction];
    }
    [(ADAMSpeechAnalysisWriter *)self _initSpeechAnalyzer];
    if (ADAM::isXCTest(void)::once != -1) {
      dispatch_once(&ADAM::isXCTest(void)::once, &__block_literal_global_60);
    }
    if (!ADAM::isXCTest(void)::isXCTest)
    {
      UInt64 mHostTime = a4->var0.mHostTime;
      uint64_t v16 = 0;
      uint64_t v15 = 0;
      mach_get_times();
      [(ADAMSpeechAnalysisWriter *)self _addPendingRequest];
      UInt64 v8 = mHostTime;
      queue = self->_queue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __47__ADAMSpeechAnalysisWriter_write_withMetadata___block_invoke;
      v11[3] = &unk_264628E58;
      v11[4] = self;
      id v12 = v6;
      UInt64 v13 = v8;
      int v14 = a4;
      dispatch_async(queue, v11);
    }
  }

  return 0;
}

void __47__ADAMSpeechAnalysisWriter_write_withMetadata___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F17B80]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  [*(id *)(*(void *)(a1 + 32) + 16) setShouldReportPartialResults:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setRequiresOnDeviceRecognition:1];
  [*(id *)(*(void *)(a1 + 32) + 16) appendAudioPCMBuffer:*(void *)(a1 + 40)];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) recognitionTaskWithRequest:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(a1 + 32) _recordTimestamp:*(void *)(a1 + 48) forTask:v5];
  [*(id *)(*(void *)(a1 + 32) + 16) endAudio];
  *(void *)(*(void *)(a1 + 32) + 24) += *(unsigned int *)(*(void *)(a1 + 56) + 64);
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v6 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  UInt64 v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
    __int16 v10 = [NSNumber numberWithUnsignedLongLong:v5];
    uint64_t v11 = [*(id *)(a1 + 32) _getNumPendingRequests];
    uint64_t v12 = *(void *)(a1 + 48);
    int v18 = 136316674;
    __int16 v19 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v20 = 1024;
    int v21 = 290;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    SRAbsoluteTime v25 = v5;
    __int16 v26 = 2112;
    v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = v12;
    _os_log_impl(&dword_2227C1000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -> SENT speech recognition request [ %@ ] with task [ %@ (%@)] requests pending: %llu timestamp: %llu", (uint8_t *)&v18, 0x44u);
  }
LABEL_10:
  UInt64 v13 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  dispatch_time_t v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      uint64_t v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
      int v18 = 136315906;
      __int16 v19 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v20 = 1024;
      int v21 = 300;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      SRAbsoluteTime v25 = v5;
      _os_log_impl(&dword_2227C1000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d error: request [%@] , task [%@] timed out...", (uint8_t *)&v18, 0x26u);
    }
  }
LABEL_20:
  [*(id *)(a1 + 32) destroyAndLogOSTransaction];
}

- (unint64_t)_fetchTimestampforTask:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_timestampLock = &self->_timestampLock;
  os_unfair_lock_lock(&self->_timestampLock);
  taskTimestamps = self->_taskTimestamps;
  id v7 = [NSNumber numberWithUnsignedLongLong:v4];
  UInt64 v8 = [(NSMutableDictionary *)taskTimestamps objectForKey:v7];

  if (!v8)
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v13 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v13)
      {
LABEL_20:
        unint64_t v9 = self->_lastTimestamp + 5;
        goto LABEL_21;
      }
    }
    else
    {
      id v13 = (id)MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    int v18 = v13;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [NSNumber numberWithUnsignedLongLong:v4];
      unint64_t lastTimestamp = self->_lastTimestamp;
      int v22 = 136315906;
      uint64_t v23 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v24 = 1024;
      int v25 = 242;
      __int16 v26 = 2112;
      v27 = v19;
      __int16 v28 = 2048;
      unint64_t v29 = lastTimestamp;
      _os_log_impl(&dword_2227C1000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d timestamp missing for task %@, last timestamp: %llu", (uint8_t *)&v22, 0x26u);
    }
    goto LABEL_20;
  }
  unint64_t v9 = [v8 unsignedLongLongValue];
  __int16 v10 = self->_taskTimestamps;
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v4];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v12 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v12) {
      goto LABEL_21;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  uint64_t v15 = v12;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [NSNumber numberWithUnsignedLongLong:v4];
    int v22 = 136315906;
    uint64_t v23 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v24 = 1024;
    int v25 = 237;
    __int16 v26 = 2112;
    v27 = v16;
    __int16 v28 = 2048;
    unint64_t v29 = v9;
    _os_log_impl(&dword_2227C1000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d removed timestamp for task %@, timestamp: %llu", (uint8_t *)&v22, 0x26u);
  }
LABEL_21:
  os_unfair_lock_unlock(p_timestampLock);

  return v9;
}

- (void)_recordTimestamp:(unint64_t)a3 forTask:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  p_timestampLock = &self->_timestampLock;
  os_unfair_lock_lock(&self->_timestampLock);
  taskTimestamps = self->_taskTimestamps;
  unint64_t v9 = [NSNumber numberWithUnsignedLongLong:v6];
  __int16 v10 = [(NSMutableDictionary *)taskTimestamps objectForKey:v9];

  if (v10)
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v11 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v11) {
        goto LABEL_19;
      }
    }
    else
    {
      id v11 = (id)MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    id v17 = v11;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = [NSNumber numberWithUnsignedLongLong:v6];
      int v21 = 136315650;
      int v22 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v23 = 1024;
      int v24 = 220;
      __int16 v25 = 2112;
      unint64_t v26 = (unint64_t)v18;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d timestamp already exists for task %@?", (uint8_t *)&v21, 0x1Cu);
    }
  }
  else
  {
    id v12 = self->_taskTimestamps;
    id v13 = [NSNumber numberWithUnsignedLongLong:a3];
    id v14 = [NSNumber numberWithUnsignedLongLong:v6];
    [(NSMutableDictionary *)v12 setObject:v13 forKey:v14];

    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15) {
        goto LABEL_19;
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    id v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = [NSNumber numberWithUnsignedLongLong:v6];
      int v21 = 136315906;
      int v22 = "ADAMSpeechAnalysisWriter.mm";
      __int16 v23 = 1024;
      int v24 = 215;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2112;
      __int16 v28 = v20;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d Recorded timestamp (%llu) for task %@", (uint8_t *)&v21, 0x26u);
    }
  }

LABEL_19:
  os_unfair_lock_unlock(p_timestampLock);
}

- (unint64_t)_getNumPendingRequests
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  unint64_t pendingRequestCnt = self->_pendingRequestCnt;
  os_unfair_lock_unlock(p_statusLock);
  return pendingRequestCnt;
}

- (unint64_t)_removePendingRequest
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  unint64_t v4 = self->_pendingRequestCnt - 1;
  self->_unint64_t pendingRequestCnt = v4;
  os_unfair_lock_unlock(p_statusLock);
  return v4;
}

- (unint64_t)_addPendingRequest
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  unint64_t v4 = self->_pendingRequestCnt + 1;
  self->_unint64_t pendingRequestCnt = v4;
  os_unfair_lock_unlock(p_statusLock);
  return v4;
}

- (BOOL)isComplete
{
  id v2 = self;
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  LOBYTE(v2) = v2->_pendingRequestCnt == 0;
  os_unfair_lock_unlock(p_statusLock);
  return (char)v2;
}

- (BOOL)isMonitoring
{
  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if (ADAM::Parameters::GetParamValue<BOOL>(5u))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(ADAMSRSensorWriter *)self->_speechMetricsSRWriter isValidSRSensorWriterPresent];
    if (v3)
    {
      BOOL v3 = [(ADAMSRSensorWriter *)self->_speechMetricsSRWriter isMonitoring];
      if (v3)
      {
        speechMetricsSRWriter = self->_speechMetricsSRWriter;
        LOBYTE(v3) = [(ADAMSRSensorWriter *)speechMetricsSRWriter isBundleIdentifierEligible];
      }
    }
  }
  return v3;
}

- (void)_initSpeechAnalyzer
{
  p_initLock = &self->_initLock;
  os_unfair_lock_lock(&self->_initLock);
  if (!self->_SpeechRecognizerInitialized)
  {
    id v4 = objc_alloc(MEMORY[0x263F17B98]);
    id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];
    id v6 = (SFSpeechRecognizer *)[v4 initWithLocale:v5];
    SpeechRecognizer = self->_SpeechRecognizer;
    self->_SpeechRecognizer = v6;

    SpeechRequest = self->_SpeechRequest;
    self->_SpeechRequest = 0;

    self->_SpeechRecognizerInitialized = 1;
  }

  os_unfair_lock_unlock(p_initLock);
}

- (ADAMSpeechAnalysisWriter)initWithWriterName:(id)a3 sessionID:(unsigned int)a4 audioFormat:(id)a5 speechMetricsSRWriter:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v36 = a6;
  id v14 = a7;
  v37.receiver = self;
  v37.super_class = (Class)ADAMSpeechAnalysisWriter;
  id v15 = [(ADAMSpeechAnalysisWriter *)&v37 init];
  if (!v15) {
    goto LABEL_12;
  }
  uint64_t v16 = MEMORY[0x223C9DD30](v14);
  id completionHandler = v15->_completionHandler;
  v15->_id completionHandler = (id)v16;

  uint64_t v18 = [NSString stringWithFormat:@"%d", v10, v36];
  sessionID = v15->_sessionID;
  v15->_sessionID = (NSString *)v18;

  id v20 = v13;
  {
    ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
  }
  int v21 = ADAM::get_log(void)::adam_os_log;
  if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v39 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v40 = 1024;
    int v41 = 100;
    __int16 v42 = 1040;
    *(_DWORD *)__int16 v43 = 24;
    *(_WORD *)&v43[4] = 2080;
    *(void *)&v43[6] = "ADAMSpeechAnalysisWriter]";
    __int16 v44 = 2048;
    __int16 v45 = v15;
    __int16 v46 = 1024;
    int v47 = v10;
    _os_log_impl(&dword_2227C1000, v21, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] Created with session ID: %d", buf, 0x32u);
  }
  objc_storeStrong((id *)&v15->_format, a5);
  id v13 = v20;
  v15->_frameCnt = 0;
  v15->_unint64_t pendingRequestCnt = 0;
  v15->_statusLock._os_unfair_lock_opaque = 0;
  v15->_unint64_t lastTimestamp = 0;
  *(void *)&v15->_timestampLock._os_unfair_lock_opaque = 0;
  int v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  taskTimestamps = v15->_taskTimestamps;
  v15->_taskTimestamps = v22;

  v15->_unsigned int resultCounterPerMinute = 0;
  v15->_double firstAbsoluteTimestampPerMinute = 0.0;
  v15->_SpeechRecognizerInitialized = 0;
  dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
  throttlingSemaphore = v15->_throttlingSemaphore;
  v15->_throttlingSemaphore = (OS_dispatch_semaphore *)v24;

  if ([(ADAMSpeechAnalysisWriter *)v15 isMonitoring]) {
    [(ADAMSpeechAnalysisWriter *)v15 createAndLogOSTransaction];
  }
  unint64_t v26 = [NSString stringWithUTF8String:"SiriUplink"];
  int v27 = [v12 hasPrefix:v26];

  if (v27)
  {
    objc_storeStrong((id *)&v15->_speechMetricsSRWriter, a6);
    __int16 v28 = "SiriUplink";
LABEL_11:
    dispatch_queue_t v31 = dispatch_queue_create(v28, 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v31;

LABEL_12:
    __int16 v33 = v15;
    goto LABEL_13;
  }
  uint64_t v29 = [NSString stringWithUTF8String:"TelephonyUplink"];
  int v30 = [v12 hasPrefix:v29];

  if (v30)
  {
    objc_storeStrong((id *)&v15->_speechMetricsSRWriter, a6);
    __int16 v28 = "TelephonyUplink";
    goto LABEL_11;
  }
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    __int16 v33 = (ADAMSpeechAnalysisWriter *)*(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v33) {
      goto LABEL_13;
    }
  }
  else
  {
    __int16 v33 = (ADAMSpeechAnalysisWriter *)MEMORY[0x263EF8438];
    id v35 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v39 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v40 = 1024;
    int v41 = 137;
    __int16 v42 = 2112;
    *(void *)__int16 v43 = v12;
    _os_log_impl(&dword_2227C1000, &v33->super, OS_LOG_TYPE_ERROR, "%25s:%-5d unknown audio buffer stream type: %@", buf, 0x1Cu);
  }

  __int16 v33 = 0;
LABEL_13:

  return v33;
}

- (void)destroyAndLogOSTransaction
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  transaction = self->_transaction;
  self->_transaction = 0;

  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    BOOL v3 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v3) {
      return;
    }
  }
  else
  {
    BOOL v3 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v7 = 1024;
    int v8 = 86;
    _os_log_impl(&dword_2227C1000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed os_transaction for speech", (uint8_t *)&v5, 0x12u);
  }
}

- (void)createAndLogOSTransaction
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    int v5 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v5) {
      return;
    }
  }
  else
  {
    int v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "ADAMSpeechAnalysisWriter.mm";
    __int16 v9 = 1024;
    int v10 = 80;
    _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created os_transaction for speech", (uint8_t *)&v7, 0x12u);
  }
}

+ (id)censoredResultFromInputResult:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  __int16 v28 = [MEMORY[0x263EFF980] array];
  id v4 = [v3 bestTranscription];
  int v5 = [v4 segments];

  if (v5)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = [v3 bestTranscription];
    int v7 = [v6 segments];
    id v8 = v3;

    uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v30;
      uint64_t v11 = MEMORY[0x263EFFA68];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (v13)
          {
            id v14 = objc_alloc(MEMORY[0x263F17BC0]);
            [v13 timestamp];
            double v16 = v15;
            [v13 duration];
            double v18 = v17;
            [v13 confidence];
            LODWORD(v20) = v19;
            int v21 = [v14 _initWithSubstring:&stru_26D4ECBB0 range:0 timestamp:0 duration:v11 confidence:v11 alternativeSubstrings:&stru_26D4ECBB0 alternativeConfidences:v16 ip
            [v28 addObject:v21];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }

    id v3 = v8;
  }
  int v22 = (void *)[objc_alloc(MEMORY[0x263F17BB0]) _initWithSegments:v28 formattedString:&stru_26D4ECBB0 speakingRate:0.0 averagePauseDuration:0.0];
  id v23 = objc_alloc(MEMORY[0x263F17B88]);
  uint64_t v24 = [v3 isFinal];
  __int16 v25 = [v3 speechRecognitionMetadata];
  unint64_t v26 = (void *)[v23 _initWithBestTranscription:v22 rawTranscription:0 final:v24 speechRecognitionMetadata:v25];

  return v26;
}

@end