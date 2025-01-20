@interface CSVTUIEndpointAnalyzer
+ (id)timeStampString;
- (AVAudioFormat)currentRequestAudioFormat;
- (BOOL)didEnterTwoshot;
- (BOOL)finishedSkippingSamplesForVT;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)shouldDetectTwoShot;
- (CSAudioFileWriter)audioFileWriter;
- (CSVTUIEndpointAnalyzer)init;
- (CSVTUIEndpointAnalyzerDelegate)delegate;
- (OS_dispatch_queue)queue;
- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer;
- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3;
- (double)endWaitTime;
- (double)firstAudioSampleSensorTimestamp;
- (double)nnvadAudioOriginInMs;
- (double)startWaitTime;
- (double)vtEndInSecs;
- (double)vtExtraAudioAtStartInMs;
- (id)_pcmBufferForAudioChunk:(id)a3;
- (int64_t)firstSampleId;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)framePosition;
- (unint64_t)nnvadState;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)numSamplesReceived;
- (unint64_t)numSamplesSkippedForVT;
- (unint64_t)vtEndInSampleCount;
- (void)_checkSNObservationForEndpoint:(id)a3;
- (void)_checkSNObservationForStartpoint:(id)a3;
- (void)_reportEndpointAtTsInSecs:(double)a3;
- (void)_reportStartpointAtTsInSecs:(double)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setCurrentRequestAudioFormat:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEnterTwoshot:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setFinishedSkippingSamplesForVT:(BOOL)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setFirstSampleId:(int64_t)a3;
- (void)setFramePosition:(unint64_t)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setNnvadAudioOriginInMs:(double)a3;
- (void)setNnvadState:(unint64_t)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setNumSamplesReceived:(unint64_t)a3;
- (void)setNumSamplesSkippedForVT:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setShouldDetectTwoShot:(BOOL)a3;
- (void)setSnAudioStreamAnalyzer:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtEndInSecs:(double)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)stopEndpointer;
@end

@implementation CSVTUIEndpointAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequestAudioFormat, 0);
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (void)setFinishedSkippingSamplesForVT:(BOOL)a3
{
  self->_finishedSkippingSamplesForVT = a3;
}

- (BOOL)finishedSkippingSamplesForVT
{
  return self->_finishedSkippingSamplesForVT;
}

- (void)setNumSamplesSkippedForVT:(unint64_t)a3
{
  self->_numSamplesSkippedForVT = a3;
}

- (unint64_t)numSamplesSkippedForVT
{
  return self->_numSamplesSkippedForVT;
}

- (void)setFirstSampleId:(int64_t)a3
{
  self->_firstSampleId = a3;
}

- (int64_t)firstSampleId
{
  return self->_firstSampleId;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDidEnterTwoshot:(BOOL)a3
{
  self->_didEnterTwoshot = a3;
}

- (BOOL)didEnterTwoshot
{
  return self->_didEnterTwoshot;
}

- (void)setShouldDetectTwoShot:(BOOL)a3
{
  self->_shouldDetectTwoShot = a3;
}

- (BOOL)shouldDetectTwoShot
{
  return self->_shouldDetectTwoShot;
}

- (void)setNnvadAudioOriginInMs:(double)a3
{
  self->_nnvadAudioOriginInMs = a3;
}

- (double)nnvadAudioOriginInMs
{
  return self->_nnvadAudioOriginInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSecs:(double)a3
{
  self->_vtEndInSecs = a3;
}

- (double)vtEndInSecs
{
  return self->_vtEndInSecs;
}

- (void)setCurrentRequestAudioFormat:(id)a3
{
}

- (AVAudioFormat)currentRequestAudioFormat
{
  return self->_currentRequestAudioFormat;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_anchorMachAbsTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setNumSamplesReceived:(unint64_t)a3
{
  self->_numSamplesReceived = a3;
}

- (unint64_t)numSamplesReceived
{
  return self->_numSamplesReceived;
}

- (void)setNnvadState:(unint64_t)a3
{
  self->_nnvadState = a3;
}

- (unint64_t)nnvadState
{
  return self->_nnvadState;
}

- (void)setFramePosition:(unint64_t)a3
{
  self->_framePosition = a3;
}

- (unint64_t)framePosition
{
  return self->_framePosition;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setDelegate:(id)a3
{
}

- (CSVTUIEndpointAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSVTUIEndpointAnalyzerDelegate *)WeakRetained;
}

- (void)setEndWaitTime:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__CSVTUIEndpointAnalyzer_setEndWaitTime___block_invoke;
  v4[3] = &unk_2644290B0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __41__CSVTUIEndpointAnalyzer_setEndWaitTime___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 176) = result;
  return result;
}

- (void)setStartWaitTime:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__CSVTUIEndpointAnalyzer_setStartWaitTime___block_invoke;
  v4[3] = &unk_2644290B0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __43__CSVTUIEndpointAnalyzer_setStartWaitTime___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 168) = result;
  return result;
}

- (void)_reportStartpointAtTsInSecs:(double)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSVTUIEndpointAnalyzer _reportStartpointAtTsInSecs:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Reporting start speech", (uint8_t *)&v7, 0xCu);
  }
  self->_nnvadState = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointer:self didDetectStartpointAtTime:a3];
}

- (void)_reportEndpointAtTsInSecs:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (os_log_t *)MEMORY[0x263F38100];
  v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Reporting end speech", (uint8_t *)&v17, 0xCu);
  }
  self->_nnvadState = 2;
  double v7 = self->_vtExtraAudioAtStartInMs / 1000.0 + a3;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  unint64_t v9 = (unint64_t)(v7 * v8);
  v10 = (void *)MEMORY[0x263F38078];
  unint64_t numSamplesProcessedBeforeAnchorTime = self->_numSamplesProcessedBeforeAnchorTime;
  unint64_t anchorMachAbsTime = self->_anchorMachAbsTime;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  uint64_t v13 = objc_msgSend(v10, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v9, anchorMachAbsTime, numSamplesProcessedBeforeAnchorTime);
  v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAnchorTimeBuffered = self->_isAnchorTimeBuffered;
    int v17 = 136315650;
    v18 = "-[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    __int16 v19 = 2050;
    uint64_t v20 = v13;
    __int16 v21 = 1026;
    BOOL v22 = isAnchorTimeBuffered;
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s endpointedBuffer.hostTime=%{public}llu, isAnchorTimeBuffered=%{public}d", (uint8_t *)&v17, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointer:self didDetectHardEndpointAtTime:a3];
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    unint64_t v9 = "-[CSVTUIEndpointAnalyzer request:didFailWithError:]";
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s request: %{public}@, returnedError: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (self->_nnvadState == 2)
  {
    unint64_t v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSVTUIEndpointAnalyzer request:didProduceResult:]";
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing finished. Not scheduling", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__CSVTUIEndpointAnalyzer_request_didProduceResult___block_invoke;
    v11[3] = &unk_26442A138;
    id v12 = v7;
    id v13 = self;
    dispatch_async(queue, v11);
  }
}

void __51__CSVTUIEndpointAnalyzer_request_didProduceResult___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 timeRange];
    if (v6 >= 1)
    {
      v3 = *(void **)(a1 + 40);
      uint64_t v4 = v3[6];
      switch(v4)
      {
        case 2:
          id v5 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            int v8 = "-[CSVTUIEndpointAnalyzer request:didProduceResult:]_block_invoke";
            _os_log_debug_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEBUG, "%s Processing finished. Ignoring", buf, 0xCu);
          }
          break;
        case 1:
          [v3 _checkSNObservationForEndpoint:*(void *)(a1 + 32)];
          break;
        case 0:
          [v3 _checkSNObservationForStartpoint:*(void *)(a1 + 32)];
          break;
      }
    }
  }
}

- (void)_checkSNObservationForEndpoint:(id)a3
{
  id v4 = a3;
  if (([v4 detected] & 1) == 0)
  {
    [(CSVTUIEndpointAnalyzer *)self _effectiveAudioTimeInSecsForSNObservation:v4];
    -[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:");
  }
}

- (void)_checkSNObservationForStartpoint:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CSVTUIEndpointAnalyzer *)self _effectiveAudioTimeInSecsForSNObservation:v4];
  double v6 = v5;
  int v7 = [v4 detected];

  if (v7)
  {
    [(CSVTUIEndpointAnalyzer *)self _reportStartpointAtTsInSecs:v6];
  }
  else
  {
    double startWaitTime = self->_startWaitTime;
    if (v6 > startWaitTime)
    {
      uint64_t v9 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        id v11 = "-[CSVTUIEndpointAnalyzer _checkSNObservationForStartpoint:]";
        __int16 v12 = 2050;
        double v13 = v6;
        __int16 v14 = 2050;
        double v15 = startWaitTime;
        _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s No Startpt detected even after %{public}f secs. startWaitTime=%{public}f secs", (uint8_t *)&v10, 0x20u);
      }
      [(CSVTUIEndpointAnalyzer *)self _reportEndpointAtTsInSecs:v6];
    }
  }
}

- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3
{
  if (a3)
  {
    [a3 timeRange];
    double v4 = (double)v6;
  }
  else
  {
    double v4 = 0.0;
  }
  return self->_vtEndInSecs + v4 / (double)self->_currentRequestSampleRate;
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__CSVTUIEndpointAnalyzer_recordingStoppedForReason___block_invoke;
  v4[3] = &unk_2644290B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __52__CSVTUIEndpointAnalyzer_recordingStoppedForReason___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 136315394;
    int v7 = "-[CSVTUIEndpointAnalyzer recordingStoppedForReason:]_block_invoke";
    __int16 v8 = 2050;
    uint64_t v9 = v3;
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Recording Stopped For Reason: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  *(void *)(*(void *)(a1 + 32) + 48) = 2;
  [*(id *)(*(void *)(a1 + 32) + 136) endAudio];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = 0;
}

- (void)stopEndpointer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[CSVTUIEndpointAnalyzer stopEndpointer]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_nnvadState = 2;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CSVTUIEndpointAnalyzer_stopEndpointer__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__CSVTUIEndpointAnalyzer_stopEndpointer__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) endAudio];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  if (v1[6] == 2)
  {
    uint64_t v2 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSVTUIEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Processing Done. Returning", buf, 0xCu);
    }
  }
  else
  {
    if ((v1[19] & 0x8000000000000000) != 0)
    {
      *(double *)(*(void *)(a1 + 32) + 144) = (double)(unint64_t)[*(id *)(a1 + 40) hostTime];
      *(void *)(*(void *)(a1 + 32) + 152) = [*(id *)(a1 + 40) startSampleCount];
      id v4 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        double v5 = *(void **)(a1 + 32);
        uint64_t v6 = v5[19];
        uint64_t v7 = v5[7];
        uint64_t v8 = v5[13];
        *(_DWORD *)buf = 136315906;
        v18 = "-[CSVTUIEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
        __int16 v19 = 2050;
        uint64_t v20 = v6;
        __int16 v21 = 2050;
        uint64_t v22 = v7;
        __int16 v23 = 2050;
        uint64_t v24 = v8;
        _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Rx first sample: %{public}ld, _numSamplesReceived=%{public}lu, _vtEndInSampleCount=%{public}lu", buf, 0x2Au);
      }
      v1 = *(void **)(a1 + 32);
    }
    v1[8] = v1[7];
    *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) hostTime];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) wasBuffered];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(v10 + 56);
    uint64_t v12 = *(void *)(v10 + 104);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_13;
    v16[3] = &unk_264428BE0;
    v16[4] = v10;
    [v9 skipSamplesAtStartSuchThatNumSamplesReceivedSoFar:v11 reachesACountOf:v12 completionHandler:v16];
    *(void *)(*(void *)(a1 + 32) + 56) += [*(id *)(a1 + 40) numSamples];
    double v13 = [*(id *)(a1 + 40) dataForChannel:*(void *)(*(void *)(a1 + 32) + 24)];
    __int16 v14 = *(void **)(*(void *)(a1 + 32) + 136);
    id v15 = v13;
    objc_msgSend(v14, "addSamples:numSamples:", objc_msgSend(v15, "bytes"), objc_msgSend(*(id *)(a1 + 40), "numSamples"));
  }
}

void __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  *(void *)(*(void *)(a1 + 32) + 160) += a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 11) && *(void *)(v6 + 160) >= *(void *)(v6 + 104))
  {
    *(unsigned char *)(v6 + 11) = 1;
    uint64_t v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 160);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 11);
      int v11 = 136315650;
      uint64_t v12 = "-[CSVTUIEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      __int16 v13 = 2050;
      uint64_t v14 = v9;
      __int16 v15 = 1026;
      int v16 = v8;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s _numSamplesSkippedForVT=%{public}lu, _finishedSkippingSamplesForVT=%{public}d", (uint8_t *)&v11, 0x1Cu);
    }
  }
  if ([v5 numSamples])
  {
    uint64_t v10 = [*(id *)(a1 + 32) _pcmBufferForAudioChunk:v5];
    [*(id *)(*(void *)(a1 + 32) + 32) analyzeAudioBuffer:v10 atAudioFramePosition:*(void *)(*(void *)(a1 + 32) + 40)];
    *(void *)(*(void *)(a1 + 32) + 40) += [v10 frameLength];
  }
}

- (id)_pcmBufferForAudioChunk:(id)a3
{
  unint64_t activeChannel = self->_activeChannel;
  id v5 = a3;
  uint64_t v6 = [v5 dataForChannel:activeChannel];
  uint64_t v7 = [v5 numSamples];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:self->_currentRequestAudioFormat frameCapacity:v7];
  [v8 setFrameLength:v7];
  uint64_t v9 = *(void **)([v8 mutableAudioBufferList] + 16);
  id v10 = v6;
  int v11 = (const void *)[v10 bytes];
  uint64_t v12 = [v5 numSamples];
  uint64_t v13 = [v5 sampleByteDepth];

  memcpy(v9, v11, v13 * v12);

  return v8;
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CSVTUIEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __63__CSVTUIEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"triggerEndSeconds"];
  [v2 floatValue];
  *(double *)(*(void *)(a1 + 32) + 96) = v3;

  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"extraSamplesAtStart"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  *(void *)(*(void *)(a1 + 32) + 104) = (unint64_t)(*(double *)(*(void *)(a1 + 32) + 96)
                                                               * (double)*(unint64_t *)(*(void *)(a1 + 32)
                                                                                             + 80));
  *(double *)(*(void *)(a1 + 32) + 112) = (float)((float)((float)v5
                                                            / (float)*(unint64_t *)(*(void *)(a1 + 32) + 80))
                                                    * 1000.0);
  *(double *)(*(void *)(a1 + 32) + 120) = -(*(double *)(*(void *)(a1 + 32) + 112)
                                              - *(double *)(*(void *)(a1 + 32) + 96) * 1000.0);
  id v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v7 + 96);
    uint64_t v10 = *(void *)(v7 + 104);
    unint64_t v11 = (unint64_t)*(double *)(v7 + 112);
    uint64_t v12 = *(void *)(v7 + 120);
    uint64_t v13 = *(void *)(v7 + 160);
    LODWORD(v7) = *(unsigned __int8 *)(v7 + 11);
    int v14 = 136316930;
    __int16 v15 = "-[CSVTUIEndpointAnalyzer handleVoiceTriggerWithActivationInfo:]_block_invoke";
    __int16 v16 = 2050;
    uint64_t v17 = v9;
    __int16 v18 = 2050;
    uint64_t v19 = v10;
    __int16 v20 = 2050;
    unint64_t v21 = v11;
    __int16 v22 = 2050;
    uint64_t v23 = v12;
    __int16 v24 = 2050;
    uint64_t v25 = v13;
    __int16 v26 = 1026;
    int v27 = v7;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s triggerEndSeconds: %{public}f, _vtEndInSampleCount: %{public}lu, _vtExtraAudioAtStartInMs: %{public}lu,  _nnvadAudioOriginInMs: %{public}f, _numSamplesSkippedForVT: %{public}lu, _finishedSkippingSamplesForVT: %{public}d, voiceTriggerInfo: %{public}@,", (uint8_t *)&v14, 0x4Eu);
  }
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CSVTUIEndpointAnalyzer_resetForNewRequestWithSampleRate___block_invoke;
  v4[3] = &unk_2644290B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __59__CSVTUIEndpointAnalyzer_resetForNewRequestWithSampleRate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_log_t *)MEMORY[0x263F38100];
  float v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[CSVTUIEndpointAnalyzer resetForNewRequestWithSampleRate:]_block_invoke";
    __int16 v23 = 2048;
    __int16 v24 = v4;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s NewReq: sampleRate: %lu", buf, 0x16u);
  }
  *(void *)(*(void *)(a1 + 32) + 144) = 0;
  *(void *)(*(void *)(a1 + 32) + 152) = -1;
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  *(void *)(*(void *)(a1 + 32) + 72) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 168) = 0x4014000000000000;
  *(void *)(*(void *)(a1 + 32) + 176) = 0x3FE8A3D70A3D70A4;
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  *(void *)(*(void *)(a1 + 32) + 96) = 0;
  *(void *)(*(void *)(a1 + 32) + 104) = 0;
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  *(void *)(*(void *)(a1 + 32) + 112) = 0;
  *(void *)(*(void *)(a1 + 32) + 160) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 11) = 0;
  id v5 = objc_alloc(MEMORY[0x263EF9388]);
  if ([MEMORY[0x263F38018] inputRecordingIsFloat]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 3;
  }
  uint64_t v7 = [v5 initWithCommonFormat:v6 sampleRate:1 channels:0 interleaved:(double)*(unint64_t *)(*(void *)(a1 + 32) + 80)];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 88);
  *(void *)(v8 + 88) = v7;

  uint64_t v10 = [objc_alloc(MEMORY[0x263F179B8]) initWithFormat:*(void *)(*(void *)(a1 + 32) + 88)];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v10;

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F17A00]) initWithRequestType:0];
  uint64_t v14 = *(void *)(a1 + 32);
  __int16 v15 = *(void **)(v14 + 32);
  id v20 = 0;
  int v16 = [v15 addRequest:v13 withObserver:v14 error:&v20];
  id v17 = v20;
  __int16 v18 = v17;
  if (!v16 || v17)
  {
    uint64_t v19 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[CSVTUIEndpointAnalyzer resetForNewRequestWithSampleRate:]_block_invoke";
      __int16 v23 = 2112;
      __int16 v24 = v18;
      _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Err: %@", buf, 0x16u);
    }
  }
}

- (CSVTUIEndpointAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSVTUIEndpointAnalyzer;
  uint64_t v2 = [(CSVTUIEndpointAnalyzer *)&v7 init];
  if (v2)
  {
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    v2->_currentRequestSampleRate = (unint64_t)v3;
    v2->_firstAudioSampleSensorTimestamp = 0.0;
    v2->_firstSampleId = -1;
    uint64_t v4 = [MEMORY[0x263F380D0] getSerialQueueWithQOS:33 name:@"com.apple.corespeech.vtui.nnvad" fixedPriority:*MEMORY[0x263F38110]];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  float v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

@end