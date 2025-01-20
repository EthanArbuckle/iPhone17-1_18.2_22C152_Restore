@interface CSVTUIAudioRecorder
+ (unint64_t)_convertDeactivateOption:(unint64_t)a3;
- (BOOL)_shouldUseRemoteBuiltInMic:(id)a3;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)isRecordingWithStreamHandleId:(unint64_t)a3;
- (BOOL)prepareAudioStreamRecordWithStreamHandleId:(unint64_t)a3 error:(id *)a4;
- (BOOL)startAudioStreamWithStreamHandleId:(unint64_t)a3 error:(id *)a4;
- (BOOL)stopAudioStreamWithStreamHandleId:(unint64_t)a3 error:(id *)a4;
- (CSVTUIAudioRecorder)initWithQueue:(id)a3 error:(id *)a4;
- (CSVTUIAudioRecorderRemoteDeviceContext)remoteDeviceContext;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)voiceControllerCreationQueue;
- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4;
- (id)_getRecordSettingsWithRequest;
- (id)_voiceControllerWithError:(id *)a3;
- (id)getPlaybackRouteForStreamID:(unint64_t)a3;
- (id)recordRouteWithStreamHandleId:(unint64_t)a3;
- (unint64_t)setContext:(id)a3 error:(id *)a4;
- (void)_audioRecorderDidStartRecordingSuccessfully:(BOOL)a3 streamHandleID:(unint64_t)a4 error:(id)a5;
- (void)_audioRecorderDidStopRecordingForReason:(int64_t)a3 streamHandleID:(unint64_t)a4;
- (void)_destroyVoiceController;
- (void)_processAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5;
- (void)_processAudioChain:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 atTime:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 numberOfChannels:(int)a8;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setAudioSessionEventDelegate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteDeviceContext:(id)a3;
- (void)setVoiceControllerCreationQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateAudioRecorderForTrainingDevice:(unint64_t)a3 deviceUUIDs:(id)a4;
- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5;
- (void)voiceControllerBeginRecordInterruption:(id)a3;
- (void)voiceControllerBeginRecordInterruption:(id)a3 withContext:(id)a4;
- (void)voiceControllerDidSetAudioSessionActive:(id)a3 isActivated:(BOOL)a4;
- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5;
- (void)voiceControllerEndRecordInterruption:(id)a3;
- (void)voiceControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int)a4;
- (void)voiceControllerWillSetAudioSessionActive:(id)a3 willActivate:(BOOL)a4;
@end

@implementation CSVTUIAudioRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceContext, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_voiceControllerCreationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_latestContext, 0);
  objc_storeStrong((id *)&self->_remoteRecordClient, 0);

  objc_storeStrong((id *)&self->_voiceController, 0);
}

- (void)setRemoteDeviceContext:(id)a3
{
}

- (CSVTUIAudioRecorderRemoteDeviceContext)remoteDeviceContext
{
  return self->_remoteDeviceContext;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setVoiceControllerCreationQueue:(id)a3
{
}

- (OS_dispatch_queue)voiceControllerCreationQueue
{
  return self->_voiceControllerCreationQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAudioSessionEventDelegate:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[CSVTUIAudioRecorder setAudioSessionEventDelegate:]";
    _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_getRecordSettingsWithRequest
{
  v15[8] = *MEMORY[0x263EF8340];
  BOOL v2 = [MEMORY[0x263F38018] inputRecordingNumberOfChannels] > 1;
  v14[0] = *MEMORY[0x263EF92C0];
  v3 = [NSNumber numberWithUnsignedInt:1819304813];
  v15[0] = v3;
  v14[1] = *MEMORY[0x263EF92F8];
  int v4 = NSNumber;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  v5 = objc_msgSend(v4, "numberWithFloat:");
  v15[1] = v5;
  v14[2] = *MEMORY[0x263EF92C8];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x263F38018], "inputRecordingSampleBitDepth"));
  v15[2] = v6;
  v14[3] = *MEMORY[0x263EF92D0];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F38018], "inputRecordingIsFloat"));
  v15[3] = v7;
  v14[4] = *MEMORY[0x263EF92E0];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x263F38018], "inputRecordingNumberOfChannels"));
  uint64_t v9 = *MEMORY[0x263EF92A8];
  v15[4] = v8;
  v15[5] = &unk_26CD455F8;
  uint64_t v10 = *MEMORY[0x263EF92E8];
  v14[5] = v9;
  v14[6] = v10;
  v15[6] = *MEMORY[0x263EF92F0];
  v14[7] = *MEMORY[0x263EF92D8];
  v11 = [NSNumber numberWithBool:v2];
  v15[7] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];

  return v12;
}

- (void)voiceControllerDidSetAudioSessionActive:(id)a3 isActivated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSVTUIAudioRecorder voiceControllerDidSetAudioSessionActive:isActivated:]";
    __int16 v8 = 1026;
    BOOL v9 = v4;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)voiceControllerWillSetAudioSessionActive:(id)a3 willActivate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSVTUIAudioRecorder voiceControllerWillSetAudioSessionActive:willActivate:]";
    __int16 v8 = 1026;
    BOOL v9 = v4;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)voiceControllerEndRecordInterruption:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSVTUIAudioRecorder voiceControllerEndRecordInterruption:]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)voiceControllerBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSVTUIAudioRecorder voiceControllerBeginRecordInterruption:withContext:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s withContext : %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)voiceControllerBeginRecordInterruption:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSVTUIAudioRecorder voiceControllerBeginRecordInterruption:]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)voiceControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSVTUIAudioRecorder voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:]";
    __int16 v12 = 1026;
    int v13 = a4;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s toConfiguration : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__CSVTUIAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke;
  v8[3] = &unk_26442A0D8;
  v8[4] = self;
  int v9 = a4;
  dispatch_async(queue, v8);
}

void __91__CSVTUIAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderRecordHardwareConfigurationDidChange:toConfiguration:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v13 = "-[CSVTUIAudioRecorder voiceControllerDidStopRecording:forStream:forReason:]";
    __int16 v14 = 2050;
    id v15 = v8;
    __int16 v16 = 2050;
    unint64_t v17 = a4;
    __int16 v18 = 2050;
    int64_t v19 = a5;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Received didStopRecording : %{public}p forStream:%{public}llu forReason:%{public}ld", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CSVTUIAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_26442A0B0;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(queue, block);
}

uint64_t __75__CSVTUIAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioRecorderDidStopRecordingForReason:*(void *)(a1 + 40) streamHandleID:*(void *)(a1 + 48)];
}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  unint64_t v8 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
  if (!(v8 % [MEMORY[0x263F380D0] loggingHeartbeatRate]))
  {
    long long v9 = (void *)*MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = v9;
      int v11 = 136315906;
      __int16 v12 = "-[CSVTUIAudioRecorder voiceControllerAudioCallback:forStream:buffer:]";
      __int16 v13 = 1026;
      int v14 = [v7 bytesDataSize];
      __int16 v15 = 2050;
      uint64_t v16 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
      __int16 v17 = 2050;
      unint64_t v18 = a4;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Received audio buffer %{public}d, heartbeat = %{public}llu, streamID (%{public}lu)", (uint8_t *)&v11, 0x26u);
    }
  }
  ++voiceControllerAudioCallback_forStream_buffer__heartbeat;
  [(CSVTUIAudioRecorder *)self _processAudioBuffer:v7 audioStreamHandleId:a4 arrivalTimestampToAudioRecorder:mach_absolute_time()];
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  __int16 v12 = (void *)*MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = v12;
    int v14 = [v11 localizedDescription];
    *(_DWORD *)buf = 136316162;
    v22 = "-[CSVTUIAudioRecorder voiceControllerDidStartRecording:forStream:successfully:error:]";
    __int16 v23 = 2050;
    id v24 = v10;
    __int16 v25 = 2050;
    unint64_t v26 = a4;
    __int16 v27 = 1026;
    BOOL v28 = v7;
    __int16 v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Received didStartRecording : %{public}p, forStream:%{public}llu, successfully:%{public}d, error:%{public}@", buf, 0x30u);
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__CSVTUIAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v17[3] = &unk_26442A088;
  BOOL v20 = v7;
  id v18 = v11;
  unint64_t v19 = a4;
  v17[4] = self;
  id v16 = v11;
  dispatch_async(queue, v17);
}

uint64_t __85__CSVTUIAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioRecorderDidStartRecordingSuccessfully:*(unsigned __int8 *)(a1 + 56) streamHandleID:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_audioRecorderDidStopRecordingForReason:(int64_t)a3 streamHandleID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "audioRecorderDidStopRecord:audioStreamHandleId:reason:", self, a4, a3, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  self->_waitingForDidStart = 0;
}

- (void)_audioRecorderDidStartRecordingSuccessfully:(BOOL)a3 streamHandleID:(unint64_t)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_observers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "audioRecorderDidStartRecord:audioStreamHandleId:successfully:error:", self, a4, v6, v8, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  self->_waitingForDidStart = 0;
}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([MEMORY[0x263F38018] inputRecordingNumberOfChannels] <= a4)
  {
    id v8 = v5;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263EFF990]);
    unint64_t v7 = [v5 length] / (unint64_t)a4;
    id v8 = (id)objc_msgSend(v6, "initWithLength:", v7 * objc_msgSend(MEMORY[0x263F38018], "inputRecordingNumberOfChannels"));
    int v9 = [MEMORY[0x263F38018] inputRecordingNumberOfChannels];
    unint64_t v10 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    if (!(v10 % [MEMORY[0x263F380D0] loggingHeartbeatRate]))
    {
      uint64_t v11 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        long long v14 = "-[CSVTUIAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:]";
        __int16 v15 = 1026;
        int v16 = v9 - a4;
        __int16 v17 = 2050;
        uint64_t v18 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
        _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Compensating %{public}u channel(s), heartbeat = %{public}lld", (uint8_t *)&v13, 0x1Cu);
      }
    }
    ++_compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v5, "length"), objc_msgSend(v5, "bytes"));
  }

  return v8;
}

- (void)_processAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void *)MEMORY[0x21D4B2500]();
  if ((CSIsTV() & 1) == 0)
  {
    int v10 = *(_DWORD *)([v8 streamDescription] + 8);
    if (v10 == 1819304813)
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", objc_msgSend(v8, "data"), (int)objc_msgSend(v8, "bytesDataSize"));
      uint64_t v12 = -[CSVTUIAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v11, *(unsigned int *)([v8 streamDescription] + 28));
      uint64_t v13 = [v8 timeStamp];
      -[CSVTUIAudioRecorder _processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:](self, "_processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v12, a4, 0, v13, a5, [MEMORY[0x263F38018] inputRecordingNumberOfChannels]);
    }
    else
    {
      long long v14 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        int v16 = "-[CSVTUIAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
        __int16 v17 = 1026;
        int v18 = v10;
        _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s Cannot handle audio buffer : unexpected format(%{public}u)", (uint8_t *)&v15, 0x12u);
      }
    }
  }
}

- (void)_processAudioChain:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 atTime:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 numberOfChannels:(int)a8
{
  id v14 = a3;
  id v15 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__CSVTUIAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
  block[3] = &unk_26442A060;
  block[4] = self;
  id v20 = v14;
  id v21 = v15;
  unint64_t v22 = a4;
  unint64_t v23 = a6;
  unint64_t v24 = a7;
  int v25 = a8;
  id v17 = v15;
  id v18 = v14;
  dispatch_async(queue, block);
}

void __128__CSVTUIAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        LODWORD(v7) = *(_DWORD *)(a1 + 80);
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) audioRecorderBufferAvailable:*(void *)(a1 + 32) audioStreamHandleId:*(void *)(a1 + 56) buffer:*(void *)(a1 + 40) remoteVAD:*(void *)(a1 + 48) atTime:*(void *)(a1 + 64) arrivalTimestampToAudioRecorder:*(void *)(a1 + 72) numberOfChannels:v7];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)_shouldUseRemoteBuiltInMic:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 objectForKeyedSubscript:@"useRemoteBuiltInMic"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  return (id)[(AVVoiceController *)self->_voiceController getPlaybackRouteForStream:a3 withError:0];
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF910], "date", a3, a4);
  uint64_t v7 = (os_log_t *)MEMORY[0x263F37FA8];
  long long v8 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[CSVTUIAudioRecorder deactivateAudioSession:error:]";
    __int16 v16 = 2050;
    unint64_t v17 = a3;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for deactivation : %{public}tu", (uint8_t *)&v14, 0x16u);
  }
  [(AVVoiceController *)self->_voiceController deactivateAudioSessionWithOptions:+[CSVTUIAudioRecorder _convertDeactivateOption:a3]];
  self->_waitingForDidStart = 0;
  long long v9 = [MEMORY[0x263EFF910] date];
  os_log_t v10 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = v10;
    [v9 timeIntervalSinceDate:v6];
    int v14 = 136315394;
    id v15 = "-[CSVTUIAudioRecorder deactivateAudioSession:error:]";
    __int16 v16 = 2050;
    unint64_t v17 = v12;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", (uint8_t *)&v14, 0x16u);
  }
  return 1;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v9 = [MEMORY[0x263EFF910] date];
  os_log_t v10 = (os_log_t *)MEMORY[0x263F37FA8];
  long long v11 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for activation", buf, 0xCu);
  }
  voiceController = self->_voiceController;
  if (a3 == 2)
  {
    __int16 v27 = 0;
    char v13 = [(AVVoiceController *)voiceController activateAudioSessionForStream:a4 isPrewarm:0 recordMode:1 error:&v27];
    int v14 = v27;
  }
  else
  {
    unint64_t v26 = 0;
    char v13 = [(AVVoiceController *)voiceController activateAudioSessionForStream:a4 isPrewarm:0 recordMode:0 error:&v26];
    int v14 = v26;
  }
  id v15 = v14;
  if (v13)
  {
    __int16 v16 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s AVVC successfully activated audioSession", buf, 0xCu);
    }
    BOOL v17 = 1;
    if (!a5) {
      goto LABEL_15;
    }
LABEL_14:
    *a5 = v15;
    goto LABEL_15;
  }
  os_log_t v18 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v24 = v18;
    int v25 = [v15 localizedDescription];
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    __int16 v30 = 2114;
    uint64_t v31 = v25;
    _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s AVVC setSessionActivate has failed : %{public}@", buf, 0x16u);
  }
  BOOL v17 = 0;
  if (a5) {
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v19 = [MEMORY[0x263EFF910] date];
  os_log_t v20 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    [v19 timeIntervalSinceDate:v9];
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    __int16 v30 = 2050;
    uint64_t v31 = v22;
    _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", buf, 0x16u);
  }
  return v17;
}

- (id)recordRouteWithStreamHandleId:(unint64_t)a3
{
  if ([MEMORY[0x263F380D0] hasRemoteBuiltInMic])
  {
    uint64_t v5 = @"Builtin Microphone";
  }
  else
  {
    uint64_t v6 = [(AVVoiceController *)self->_voiceController getRecordDeviceInfoForStream:a3];
    uint64_t v5 = [v6 recordRoute];
  }

  return v5;
}

- (BOOL)isRecordingWithStreamHandleId:(unint64_t)a3
{
  if (![MEMORY[0x263F380D0] hasRemoteBuiltInMic]) {
    return [(AVVoiceController *)self->_voiceController getCurrentStreamState:a3] > 3;
  }
  remoteRecordClient = self->_remoteRecordClient;

  return [(CSVTUIRemoteRecordClient *)remoteRecordClient isRecording];
}

- (BOOL)stopAudioStreamWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  long long v8 = (os_log_t *)MEMORY[0x263F37FA8];
  long long v9 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v23 = "-[CSVTUIAudioRecorder stopAudioStreamWithStreamHandleId:error:]";
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC stopRecordForStream", buf, 0xCu);
  }
  voiceController = self->_voiceController;
  id v21 = 0;
  char v11 = [(AVVoiceController *)voiceController stopRecordForStream:a3 error:&v21];
  id v12 = v21;
  if ((v11 & 1) != 0 || (os_log_t v13 = *v8, !os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)))
  {
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v19 = v13;
  os_log_t v20 = [v12 localizedDescription];
  *(_DWORD *)buf = 136315394;
  unint64_t v23 = "-[CSVTUIAudioRecorder stopAudioStreamWithStreamHandleId:error:]";
  __int16 v24 = 2114;
  int v25 = v20;
  _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Failed to stopRecordForStream : %{public}@", buf, 0x16u);

  if (a4) {
LABEL_6:
  }
    *a4 = v12;
LABEL_7:
  int v14 = [MEMORY[0x263EFF910] date];
  os_log_t v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = v15;
    [v14 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 136315394;
    unint64_t v23 = "-[CSVTUIAudioRecorder stopAudioStreamWithStreamHandleId:error:]";
    __int16 v24 = 2050;
    int v25 = v17;
    _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s stopRecordForStream elapsed time = %{public}lf", buf, 0x16u);
  }
  self->_waitingForDidStart = 0;

  return v11;
}

- (BOOL)startAudioStreamWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  mach_absolute_time();
  kdebug_trace();
  long long v8 = (void *)[objc_alloc(MEMORY[0x263EF94C8]) initWithStreamID:a3 atStartHostTime:0];
  [v8 setSkipAlert:1];
  [v8 setStartAlert:0];
  [v8 setStopAlert:0];
  [v8 setStopOnErrorAlert:0];
  long long v9 = (os_log_t *)MEMORY[0x263F37FA8];
  os_log_t v10 = (void *)*MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    char v11 = v10;
    id v12 = [v8 debugDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = "-[CSVTUIAudioRecorder startAudioStreamWithStreamHandleId:error:]";
    __int16 v27 = 2114;
    BOOL v28 = v12;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC startRecordForStream : %{public}@", buf, 0x16u);
  }
  voiceController = self->_voiceController;
  id v24 = 0;
  char v14 = [(AVVoiceController *)voiceController startRecordForStream:v8 error:&v24];
  id v15 = v24;
  if (v14)
  {
    self->_waitingForDidStart = 1;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  os_log_t v16 = *v9;
  if (!os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unint64_t v22 = v16;
  unint64_t v23 = [v15 localizedDescription];
  *(_DWORD *)buf = 136315394;
  uint64_t v26 = "-[CSVTUIAudioRecorder startAudioStreamWithStreamHandleId:error:]";
  __int16 v27 = 2114;
  BOOL v28 = v23;
  _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s startRecordForStream failed : %{public}@", buf, 0x16u);

  if (a4) {
LABEL_8:
  }
    *a4 = v15;
LABEL_9:
  BOOL v17 = [MEMORY[0x263EFF910] date];
  os_log_t v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    [v17 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = "-[CSVTUIAudioRecorder startAudioStreamWithStreamHandleId:error:]";
    __int16 v27 = 2050;
    BOOL v28 = v20;
    _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s startRecordForStream elapsed time = %{public}lf", buf, 0x16u);
  }
  return v14;
}

- (BOOL)prepareAudioStreamRecordWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  long long v8 = [(CSVTUIAudioRecorder *)self _getRecordSettingsWithRequest];
  kdebug_trace();
  long long v9 = (os_log_t *)MEMORY[0x263F37FA8];
  os_log_t v10 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = "-[CSVTUIAudioRecorder prepareAudioStreamRecordWithStreamHandleId:error:]";
    __int16 v27 = 2050;
    unint64_t v28 = a3;
    __int16 v29 = 2114;
    __int16 v30 = v8;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC prepareRecordForStream(%{public}llu) : %{public}@", buf, 0x20u);
  }
  id v11 = objc_alloc(MEMORY[0x263EF94C0]);
  [MEMORY[0x263F38018] inputRecordingBufferDuration];
  id v12 = objc_msgSend(v11, "initWithStreamID:settings:bufferDuration:", a3, v8);
  [v12 setMeteringEnabled:1];
  voiceController = self->_voiceController;
  id v24 = 0;
  char v14 = [(AVVoiceController *)voiceController prepareRecordForStream:v12 error:&v24];
  id v15 = v24;
  if ((v14 & 1) != 0 || (os_log_t v16 = *v9, !os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)))
  {
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unint64_t v22 = v16;
  unint64_t v23 = [v15 localizedDescription];
  *(_DWORD *)buf = 136315394;
  uint64_t v26 = "-[CSVTUIAudioRecorder prepareAudioStreamRecordWithStreamHandleId:error:]";
  __int16 v27 = 2114;
  unint64_t v28 = (unint64_t)v23;
  _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s AVVC prepareRecordForStream failed : %{public}@", buf, 0x16u);

  if (a4) {
LABEL_6:
  }
    *a4 = v15;
LABEL_7:
  BOOL v17 = [MEMORY[0x263EFF910] date];
  os_log_t v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    [v17 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = "-[CSVTUIAudioRecorder prepareAudioStreamRecordWithStreamHandleId:error:]";
    __int16 v27 = 2050;
    unint64_t v28 = v20;
    _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s prepareRecordForStream elapsed time = %{public}lf", buf, 0x16u);
  }
  return v14;
}

- (void)updateAudioRecorderForTrainingDevice:(unint64_t)a3 deviceUUIDs:(id)a4
{
  self->_remoteDeviceContext = 0;
  MEMORY[0x270F9A758]();
}

- (unint64_t)setContext:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__7215;
  v39 = __Block_byref_object_dispose__7216;
  id v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  long long v8 = [v6 avvcContextSettings];
  long long v9 = (id *)MEMORY[0x263F37FA8];
  os_log_t v10 = (id)*MEMORY[0x263F37FA8];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 debugDescription];
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSVTUIAudioRecorder setContext:error:]";
    __int16 v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setContext : %@", buf, 0x16u);
  }
  queue = self->_queue;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  int v25 = __40__CSVTUIAudioRecorder_setContext_error___block_invoke;
  uint64_t v26 = &unk_26442A038;
  __int16 v29 = &v31;
  __int16 v27 = self;
  id v13 = v8;
  id v28 = v13;
  __int16 v30 = &v35;
  dispatch_async_and_wait(queue, &v23);
  if (!v32[3])
  {
    char v14 = *v9;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v22 = objc_msgSend((id)v36[5], "localizedDescription", v23, v24, v25, v26, v27);
      *(_DWORD *)buf = 136315394;
      v42 = "-[CSVTUIAudioRecorder setContext:error:]";
      __int16 v43 = 2114;
      v44 = v22;
      _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get handle id : %{public}@", buf, 0x16u);
    }
  }
  objc_msgSend(v6, "avvcContext", v23, v24, v25, v26, v27);
  id v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  latestContext = self->_latestContext;
  self->_latestContext = v15;

  if (a4) {
    *a4 = (id) v36[5];
  }
  BOOL v17 = [MEMORY[0x263EFF910] date];
  os_log_t v18 = *v9;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [v17 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSVTUIAudioRecorder setContext:error:]";
    __int16 v43 = 2050;
    v44 = v19;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s setContext elapsed time = %{public}lf", buf, 0x16u);
  }

  unint64_t v20 = v32[3];
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void __40__CSVTUIAudioRecorder_setContext_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 setContext:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (id)_voiceControllerWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7215;
  v14[4] = __Block_byref_object_dispose__7216;
  id v15 = 0;
  voiceController = self->_voiceController;
  if (!voiceController)
  {
    kdebug_trace();
    if (CSIsHorseman())
    {
      voiceControllerCreationQueue = self->_voiceControllerCreationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke;
      block[3] = &unk_26442A648;
      block[4] = self;
      void block[5] = v14;
      dispatch_sync(voiceControllerCreationQueue, block);
    }
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke_2;
    v12[3] = &unk_26442A010;
    v12[4] = self;
    v12[5] = v14;
    v12[6] = a3;
    dispatch_async_and_wait(queue, v12);
    long long v8 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = self->_voiceController;
      *(_DWORD *)buf = 136315394;
      BOOL v17 = "-[CSVTUIAudioRecorder _voiceControllerWithError:]";
      __int16 v18 = 2050;
      uint64_t v19 = v9;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Successfully create AVVC : %{public}p", buf, 0x16u);
    }
    voiceController = self->_voiceController;
  }
  os_log_t v10 = voiceController;
  _Block_object_dispose(v14, 8);

  return v10;
}

void __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EF94D0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 initWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

void __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = objc_alloc(MEMORY[0x263EF94D0]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v3 + 40);
    uint64_t v4 = [v2 initWithError:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;
  }
  kdebug_trace();
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v7)
  {
    objc_msgSend(v7, "setRecordDelegate:");
  }
  else
  {
    long long v8 = (NSObject **)MEMORY[0x263F37FA8];
    long long v9 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      os_log_t v16 = "-[CSVTUIAudioRecorder _voiceControllerWithError:]_block_invoke_2";
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s AVVC initialization failed", buf, 0xCu);
    }
    os_log_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v10)
    {
      id v11 = *v8;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = v11;
        id v13 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315394;
        os_log_t v16 = "-[CSVTUIAudioRecorder _voiceControllerWithError:]_block_invoke";
        __int16 v17 = 2114;
        __int16 v18 = v13;
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
}

- (void)_destroyVoiceController
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  voiceController = self->_voiceController;
  if (voiceController)
  {
    uint64_t v4 = (os_log_t *)MEMORY[0x263F37FA8];
    uint64_t v5 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v14 = "-[CSVTUIAudioRecorder _destroyVoiceController]";
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
      voiceController = self->_voiceController;
    }
    id v12 = 0;
    [(AVVoiceController *)voiceController teardownWithError:&v12];
    id v6 = v12;
    if (v6)
    {
      os_log_t v7 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        os_log_t v10 = v7;
        id v11 = [v6 localizedDescription];
        *(_DWORD *)buf = 136315394;
        char v14 = "-[CSVTUIAudioRecorder _destroyVoiceController]";
        __int16 v15 = 2114;
        os_log_t v16 = v11;
        _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s Failed to teardown AVVC : %{public}@", buf, 0x16u);
      }
    }
    long long v8 = (void *)MEMORY[0x21D4B2500]();
    long long v9 = self->_voiceController;
    self->_voiceController = 0;
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(CSVTUIAudioRecorder *)self _destroyVoiceController];
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL) {
    free(pNonInterleavedABL);
  }
  uint64_t v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    os_log_t v7 = "-[CSVTUIAudioRecorder dealloc]";
    __int16 v8 = 2050;
    long long v9 = self;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioRecorder %{public}p deallocated", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSVTUIAudioRecorder;
  [(CSVTUIAudioRecorder *)&v5 dealloc];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CSVTUIAudioRecorder_unregisterObserver___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __42__CSVTUIAudioRecorder_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__CSVTUIAudioRecorder_registerObserver___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __40__CSVTUIAudioRecorder_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) addObject:*(void *)(a1 + 40)];
}

- (CSVTUIAudioRecorder)initWithQueue:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSVTUIAudioRecorder;
  os_log_t v7 = [(CSVTUIAudioRecorder *)&v30 init];
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      [(CSVTUIAudioRecorder *)v7 setQueue:v6];
    }
    else
    {
      id v9 = [(id)objc_opt_class() description];
      uint64_t v10 = (const char *)[v9 UTF8String];
      id v11 = dispatch_get_global_queue(33, 0);
      dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v10, 0, v11);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v12;
    }
    char v14 = dispatch_get_global_queue(9, 0);
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("VoiceControllerCreationQueue", 0, v14);
    voiceControllerCreationQueue = v8->_voiceControllerCreationQueue;
    v8->_voiceControllerCreationQueue = (OS_dispatch_queue *)v15;

    id v29 = 0;
    uint64_t v17 = [(CSVTUIAudioRecorder *)v8 _voiceControllerWithError:&v29];
    id v18 = v29;
    voiceController = v8->_voiceController;
    v8->_voiceController = (AVVoiceController *)v17;

    if (v8->_voiceController) {
      BOOL v20 = v18 == 0;
    }
    else {
      BOOL v20 = 0;
    }
    if (!v20)
    {
      id v21 = (void *)*MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = v21;
        id v28 = [v18 localizedDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "-[CSVTUIAudioRecorder initWithQueue:error:]";
        __int16 v33 = 2114;
        uint64_t v34 = v28;
        _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s Failed to create AVVC : %{public}@", buf, 0x16u);

        if (a4) {
          goto LABEL_11;
        }
      }
      else if (a4)
      {
LABEL_11:
        id v18 = v18;
        unint64_t v22 = 0;
        *a4 = v18;
        goto LABEL_17;
      }
      unint64_t v22 = 0;
      goto LABEL_17;
    }
    uint64_t v23 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v23;

    v8->_waitingForDidStart = 0;
    int v25 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v32 = "-[CSVTUIAudioRecorder initWithQueue:error:]";
      __int16 v33 = 2050;
      uint64_t v34 = v8;
      _os_log_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_DEFAULT, "%s Create new CSAudioRecorder = %{public}p", buf, 0x16u);
    }
  }
  if (a4) {
    *a4 = 0;
  }
  unint64_t v22 = v8;
  id v18 = 0;
LABEL_17:

  return v22;
}

+ (unint64_t)_convertDeactivateOption:(unint64_t)a3
{
  return a3 == 1;
}

@end