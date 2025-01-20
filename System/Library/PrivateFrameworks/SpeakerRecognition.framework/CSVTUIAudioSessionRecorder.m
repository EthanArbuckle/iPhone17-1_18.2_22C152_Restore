@interface CSVTUIAudioSessionRecorder
- (BOOL)_hasCorrectInputAudioRoute;
- (BOOL)_hasCorrectInputAudioRouteFromHardwareConfiguration:(int64_t)a3;
- (BOOL)_hasCorrectOutputAudioRoute;
- (BOOL)hasAudioRoute;
- (BOOL)hasCorrectAudioRoute;
- (BOOL)isRecording;
- (BOOL)prepareRecord;
- (BOOL)startRecording;
- (CSAudioPowerMeter)powerMeter;
- (CSVTUIAudioSessionDelegate)delegate;
- (CSVTUIAudioSessionRecorder)initWithAudioProvider:(id)a3 forceSupportsRemoteDarwinDisplay:(BOOL)a4;
- (CSVTUIAudioSessionRecorder)initWithDelegate:(id)a3;
- (CSVTUIAudioSessionRecorderDelegate)audioSessionRecorderDelegate;
- (float)averagePower;
- (id)_forceFetchAudioProvider:(BOOL)a3 recordContext:(id)a4;
- (int64_t)convertStopReason:(int64_t)a3;
- (unint64_t)audioSource;
- (unint64_t)audioStreamHandleId;
- (unsigned)getAudioSessionID;
- (void)_handleDidStopWithReason:(int64_t)a3;
- (void)_updateRemoteDarwinDisplayConnectedIfNeeded;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)releaseAudioSession;
- (void)setAudioSessionRecorderDelegate:(id)a3;
- (void)setAudioStreamHandleId:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPowerMeter:(id)a3;
- (void)stopRecording;
- (void)updateAudioRecorderForTrainingDevice:(unint64_t)a3 deviceUUIDs:(id)a4;
@end

@implementation CSVTUIAudioSessionRecorder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioSessionRecorderDelegate);
  objc_storeStrong((id *)&self->_powerMeter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);

  objc_storeStrong((id *)&self->_audioProvider, 0);
}

- (void)setAudioSessionRecorderDelegate:(id)a3
{
}

- (CSVTUIAudioSessionRecorderDelegate)audioSessionRecorderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);

  return (CSVTUIAudioSessionRecorderDelegate *)WeakRetained;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setPowerMeter:(id)a3
{
}

- (CSAudioPowerMeter)powerMeter
{
  return self->_powerMeter;
}

- (CSVTUIAudioSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSVTUIAudioSessionDelegate *)WeakRetained;
}

- (void)_updateRemoteDarwinDisplayConnectedIfNeeded
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((CSIsIPad() & 1) != 0 || self->_forceSupportsRemoteDarwinDisplay)
  {
    v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
    v4 = [v3 pickableRoutesForCategory:@"PlayAndRecord" andMode:@"SpeechRecognition"];

    v5 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v21 = "-[CSVTUIAudioSessionRecorder _updateRemoteDarwinDisplayConnectedIfNeeded]";
      __int16 v22 = 2113;
      v23 = v4;
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Available audio routes %{private}@", buf, 0x16u);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      v9 = (void *)MEMORY[0x263F542F8];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(MEMORY[0x263F380D0], "audioPortSubtypeAsString:", 1781740087, (void)v15);
          v13 = [v11 objectForKeyedSubscript:*v9];
          v14 = v13;
          if (v12 && [v13 isEqualToString:v12])
          {

            LOBYTE(v7) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    self->_isRemoteDarwinDisplayConnected = v7;
  }
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  if (![(CSVTUIAudioSessionRecorder *)self _hasCorrectInputAudioRouteFromHardwareConfiguration:a4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_delegate);
        [v9 audioSessionUnsupportedAudioRoute];
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CSVTUIAudioSessionRecorder_audioStreamProvider_didHardwareConfigurationChange___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __81__CSVTUIAudioSessionRecorder_audioStreamProvider_didHardwareConfigurationChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRemoteDarwinDisplayConnectedIfNeeded];
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  [(CSVTUIAudioSessionRecorder *)self _handleDidStopWithReason:[(CSVTUIAudioSessionRecorder *)self convertStopReason:a4]];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 audioSessionErrorDidOccur:0];
    }
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 numSamples];
  id v7 = [v5 data];

  powerMeter = self->_powerMeter;
  id v15 = v7;
  -[CSAudioPowerMeter processShortBuffer:stride:inFrameToProcess:](powerMeter, "processShortBuffer:stride:inFrameToProcess:", [v15 bytes], 1, v6);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_delegate);
      [v14 audioSessionRecordBufferAvailable:v15];
    }
  }
}

- (void)_handleDidStopWithReason:(int64_t)a3
{
  [(CSAudioPowerMeter *)self->_powerMeter reset];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 audioSessionDidStopRecording:a3];
    }
  }
}

- (unint64_t)audioSource
{
  if (CSIsOSX()) {
    return 0;
  }
  audioProvider = self->_audioProvider;
  if (!audioProvider) {
    return 6;
  }
  id v5 = [(CSAudioProvider *)audioProvider playbackRoute];
  if (!v5) {
    return 6;
  }
  uint64_t v6 = v5;
  if (([v5 isEqualToString:*MEMORY[0x263EF9220]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x263EF9208]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x263EF9238]] & 1) != 0)
  {
    unint64_t v3 = 1;
  }
  else if (([v6 isEqualToString:*MEMORY[0x263EF91C0]] & 1) != 0 {
         || ([v6 isEqualToString:*MEMORY[0x263EF91C8]] & 1) != 0
  }
         || ([v6 isEqualToString:*MEMORY[0x263EF91D0]] & 1) != 0)
  {
    unint64_t v3 = 2;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263EF91B8]])
  {
    unint64_t v3 = 3;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263EF9200]])
  {
    unint64_t v3 = 4;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263EF91F8]])
  {
    unint64_t v3 = 5;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (int64_t)convertStopReason:(int64_t)a3
{
  int64_t result = a3;
  switch(a3)
  {
    case -11789:
    case -11788:
    case -11787:
    case -11786:
      return result;
    default:
      if (a3) {
        int64_t result = -11785;
      }
      break;
  }
  return result;
}

- (BOOL)_hasCorrectOutputAudioRoute
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (CSIsOSX()) {
    goto LABEL_2;
  }
  audioProvider = self->_audioProvider;
  if (!audioProvider)
  {
LABEL_14:
    LOBYTE(v3) = 0;
    return v3;
  }
  id v5 = [(CSAudioProvider *)audioProvider playbackRoute];
  uint64_t v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[CSVTUIAudioSessionRecorder _hasCorrectOutputAudioRoute]";
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s audioOutput:[%@]", (uint8_t *)&v8, 0x16u);
  }
  if (!v5)
  {
    if ([MEMORY[0x263F380D0] isExclaveHardware])
    {
LABEL_2:
      LOBYTE(v3) = 1;
      return v3;
    }
    goto LABEL_14;
  }
  if (self->_isRemoteDarwinDisplayConnected && ([v5 isEqualToString:*MEMORY[0x263EF9208]] & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if (([v5 isEqualToString:*MEMORY[0x263EF9220]] & 1) != 0 {
         || ([v5 isEqualToString:*MEMORY[0x263EF9208]] & 1) != 0)
  }
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [v5 isEqualToString:*MEMORY[0x263EF9200]] ^ 1;
  }

  return v3;
}

- (BOOL)_hasCorrectInputAudioRouteFromHardwareConfiguration:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSVTUIAudioSessionRecorder _hasCorrectInputAudioRouteFromHardwareConfiguration:]";
    __int16 v8 = 2048;
    int64_t v9 = a3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s hardwareConfig: %ld", (uint8_t *)&v6, 0x16u);
  }
  BOOL result = CSIsOSX();
  if ((unint64_t)(a3 - 1) < 3) {
    return 1;
  }
  return result;
}

- (BOOL)_hasCorrectInputAudioRoute
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (CSIsOSX()) {
    return 1;
  }
  audioProvider = self->_audioProvider;
  if (!audioProvider) {
    return 0;
  }
  id v5 = [(CSAudioProvider *)audioProvider recordRoute];
  int v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int64_t v9 = "-[CSVTUIAudioSessionRecorder _hasCorrectInputAudioRoute]";
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s audioInput:[%@]", (uint8_t *)&v8, 0x16u);
  }
  BOOL v3 = v5
    && (([v5 isEqualToString:@"Borealis Input"] & 1) != 0
     || ([v5 isEqualToString:*MEMORY[0x263EF91E0]] & 1) != 0
     || [MEMORY[0x263F380D0] isExclaveHardware]
     && ([v5 isEqualToString:@"HACBuiltIn"] & 1) != 0);

  return v3;
}

- (BOOL)hasCorrectAudioRoute
{
  return [(CSVTUIAudioSessionRecorder *)self _hasCorrectInputAudioRoute]
      && [(CSVTUIAudioSessionRecorder *)self _hasCorrectOutputAudioRoute];
}

- (BOOL)hasAudioRoute
{
  return 1;
}

- (float)averagePower
{
  [(CSAudioPowerMeter *)self->_powerMeter getAveragePowerDB];
  return v2;
}

- (unsigned)getAudioSessionID
{
  double v2 = [MEMORY[0x263EF93E0] sharedInstance];
  unsigned int v3 = [v2 opaqueSessionID];

  return v3;
}

- (void)releaseAudioSession
{
  [(CSAudioProvider *)self->_audioProvider deactivateAudioSession:1 error:0];
  [(CSAudioProvider *)self->_audioProvider setAudioProviderDelegate:0];
  [(CSAudioStream *)self->_audioStream setDelegate:0];
  audioProvider = self->_audioProvider;
  self->_audioProvider = 0;

  audioStream = self->_audioStream;
  self->_audioStream = 0;
}

- (BOOL)isRecording
{
  return [(CSAudioStream *)self->_audioStream isStreaming];
}

- (void)stopRecording
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  audioStream = self->_audioStream;
  if (audioStream)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__CSVTUIAudioSessionRecorder_stopRecording__block_invoke;
    v5[3] = &unk_264429208;
    v5[4] = self;
    [(CSAudioStream *)audioStream stopAudioStreamWithOption:0 completion:v5];
  }
  else
  {
    v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[CSVTUIAudioSessionRecorder stopRecording]";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s failed to stopRecording since audioStream not existing", buf, 0xCu);
    }
  }
}

void __43__CSVTUIAudioSessionRecorder_stopRecording__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) _handleDidStopWithReason:0];
  if ((a2 & 1) == 0)
  {
    int v6 = (void *)*MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      uint64_t v8 = [v5 localizedDescription];
      int v9 = 136315394;
      __int16 v10 = "-[CSVTUIAudioSessionRecorder stopRecording]_block_invoke";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s failed to stopRecording : %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)startRecording
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned int v3 = [MEMORY[0x263F37FF8] noAlertOption];
  [v3 setRequireSingleChannelLookup:1];
  [v3 setSelectedChannel:0];
  audioStream = self->_audioStream;
  if (audioStream)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__CSVTUIAudioSessionRecorder_startRecording__block_invoke;
    v7[3] = &unk_264429208;
    v7[4] = self;
    [(CSAudioStream *)audioStream startAudioStreamWithOption:v3 completion:v7];
  }
  else
  {
    id v5 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v9 = "-[CSVTUIAudioSessionRecorder startRecording]";
      _os_log_error_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_ERROR, "%s Failed to startAudioStream since audioStream not existing", buf, 0xCu);
    }
  }

  return audioStream != 0;
}

void __44__CSVTUIAudioSessionRecorder_startRecording__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  if (WeakRetained)
  {
    int v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
      [v9 audioSessionDidStartRecording:a2 error:v10];
    }
  }
}

- (void)updateAudioRecorderForTrainingDevice:(unint64_t)a3 deviceUUIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = CSIsOSX();
  if (a3 == 1 && v7)
  {
    char v8 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315651;
      long long v16 = "-[CSVTUIAudioSessionRecorder updateAudioRecorderForTrainingDevice:deviceUUIDs:]";
      __int16 v17 = 2048;
      uint64_t v18 = 1;
      __int16 v19 = 2113;
      id v20 = v6;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Update to latest record context with device type: %zu, Remote device UUID list: %{private}@", (uint8_t *)&v15, 0x20u);
    }
    id v9 = [v6 firstObject];
    id v10 = [v9 UUIDString];

    __int16 v11 = [MEMORY[0x263F380C0] sharedInstance];
    [v11 deviceConnectedWithUUID:v10];
    uint64_t v12 = [v11 fetchRichDeviceUIDStringFromUUID:v10];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F37FE8]) initWithRecordType:4 deviceId:v12];
    id v14 = [(CSVTUIAudioSessionRecorder *)self _forceFetchAudioProvider:1 recordContext:v13];
    [v14 setLatestRecordContext:v13 streamType:3];
  }
}

- (BOOL)prepareRecord
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unsigned int v3 = [MEMORY[0x263F37FE8] contextForVoiceTriggerTraining];
  v4 = [(CSVTUIAudioSessionRecorder *)self _forceFetchAudioProvider:0 recordContext:v3];

  if (v4)
  {
    id v29 = 0;
    char v5 = [v4 activateAudioSessionWithReason:2 dynamicAttribute:0 bundleID:0 error:&v29];
    id v6 = v29;
    if (v5)
    {
      audioStream = self->_audioStream;
      if (!audioStream || ![(CSAudioStream *)audioStream isStreaming])
      {
        int v15 = [MEMORY[0x263F37FE8] contextForVoiceTriggerTraining];
        long long v16 = [MEMORY[0x263F38008] defaultRequestWithContext:v15];
        [v16 setClientIdentity:7];
        [v16 setRequestRecordModeLock:1];
        if ([MEMORY[0x263F380D0] isExclaveHardware]) {
          [v16 setRequestListeningMicIndicatorLock:1];
        }
        __int16 v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        id v28 = v6;
        __int16 v19 = [v4 audioStreamWithRequest:v16 streamName:v18 error:&v28];
        id v14 = v28;

        if (v19) {
          BOOL v20 = v14 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        BOOL v9 = v20;
        uint64_t v21 = *MEMORY[0x263F37FA8];
        __int16 v22 = *MEMORY[0x263F37FA8];
        if (v20)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
            _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Successfully prepared record", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v26 = v21;
          v27 = [v14 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
          __int16 v32 = 2114;
          v33 = v27;
          _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s Failed to prepareAudioStreamRecord : %{public}@", buf, 0x16u);
        }
        [v19 setDelegate:self];
        uint64_t v24 = self->_audioStream;
        self->_audioStream = (CSAudioStream *)v19;

        goto LABEL_30;
      }
      char v8 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
        _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioStream is already recording, do not prepare anymore", buf, 0xCu);
      }
      BOOL v9 = 1;
    }
    else
    {
      __int16 v11 = (void *)*MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        uint64_t v13 = [v6 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
        __int16 v32 = 2114;
        v33 = v13;
        _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to activate audio session, error : %{public}@", buf, 0x16u);
      }
      BOOL v9 = 0;
    }
    id v14 = v6;
LABEL_30:

    goto LABEL_31;
  }
  id v10 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s Cannot prepare since audio provider does not exist", buf, 0xCu);
  }
  BOOL v9 = 0;
LABEL_31:

  return v9;
}

- (id)_forceFetchAudioProvider:(BOOL)a3 recordContext:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__2372;
  v43 = __Block_byref_object_dispose__2373;
  id v44 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);
  if (WeakRetained
    && (id v8 = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        WeakRetained,
        (v9 & 1) != 0))
  {
    id v10 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetching audioProvider from SpeechManager, this should only apply to Exclave hardware", buf, 0xCu);
    }
    id v11 = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke;
    v38[3] = &unk_2644291B8;
    v38[4] = &v39;
    [v11 requestAudioProviderForTrainingWithSyncBlock:v38];
  }
  else
  {
    p_audioProvider = (id *)&self->_audioProvider;
    if (self->_audioProvider && !a3)
    {
      uint64_t v13 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 0;
        _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s audioProvider already exists and force == %d, return the current one.", buf, 0x12u);
      }
      goto LABEL_25;
    }
    id v14 = (void *)MEMORY[0x21D4B2500]();
    id v15 = *p_audioProvider;
    id *p_audioProvider = 0;

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__2372;
    v55 = __Block_byref_object_dispose__2373;
    id v56 = 0;
    id v16 = objc_alloc(MEMORY[0x263F37FF0]);
    uint64_t v17 = *(void *)&buf[8];
    id obj = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v18 = (void *)[v16 initWithQueue:0 error:&obj];
    objc_storeStrong((id *)(v17 + 40), obj);
    if (v18)
    {
      *(void *)v51 = 0;
      *(void *)&v51[8] = v51;
      *(void *)&v51[16] = 0x2020000000;
      uint64_t v52 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 0;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke_14;
      v32[3] = &unk_2644291E0;
      v32[4] = v51;
      v32[5] = &v33;
      v32[6] = buf;
      [v18 setContext:v6 completion:v32];
      __int16 v19 = (id *)MEMORY[0x263F37FA8];
      BOOL v20 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(*(void *)&v51[8] + 24);
        *(_DWORD *)v45 = 136315650;
        v46 = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
        __int16 v47 = 2114;
        id v48 = v6;
        __int16 v49 = 2048;
        uint64_t v50 = v21;
        _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s For Context : %{public}@, audioStreamId(%llu) has allocated", v45, 0x20u);
      }
      if (*(void *)(*(void *)&v51[8] + 24))
      {
        id v22 = objc_alloc(MEMORY[0x263F37FE0]);
        uint64_t v23 = [v22 initWithAudioStreamHandleId:*(void *)(*(void *)&v51[8] + 24) audioStreamType:v34[3] audioRecordContext:v6 audioRecorder:v18];
        uint64_t v24 = (void *)v40[5];
        v40[5] = v23;

        [(id)v40[5] start];
        [(id)v40[5] setAudioProviderDelegate:self];
        int v25 = 0;
      }
      else
      {
        v27 = *v19;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v31 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
          *(_DWORD *)v45 = 136315394;
          v46 = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
          __int16 v47 = 2112;
          id v48 = v31;
          _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream handle ID : %{publid}@", v45, 0x16u);
        }
        int v25 = 1;
      }
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(v51, 8);
    }
    else
    {
      v26 = (id)*MEMORY[0x263F37FA8];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v30 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
        *(_DWORD *)v51 = 136315394;
        *(void *)&v51[4] = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
        *(_WORD *)&v51[12] = 2114;
        *(void *)&v51[14] = v30;
        _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create audio recorder : %{public}@", v51, 0x16u);
      }
      int v25 = 1;
    }

    _Block_object_dispose(buf, 8);
    if (v25)
    {
      id v28 = 0;
      goto LABEL_26;
    }
  }
  objc_storeStrong((id *)&self->_audioProvider, (id)v40[5]);
  [(CSVTUIAudioSessionRecorder *)self _updateRemoteDarwinDisplayConnectedIfNeeded];
  p_audioProvider = (id *)(v40 + 5);
LABEL_25:
  id v28 = *p_audioProvider;
LABEL_26:
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched audioProvider!!", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke_14(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

- (void)setDelegate:(id)a3
{
}

- (CSVTUIAudioSessionRecorder)initWithAudioProvider:(id)a3 forceSupportsRemoteDarwinDisplay:(BOOL)a4
{
  id v7 = a3;
  id v8 = [(CSVTUIAudioSessionRecorder *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audioProvider, a3);
    v9->_forceSupportsRemoteDarwinDisplay = a4;
    [(CSVTUIAudioSessionRecorder *)v9 _updateRemoteDarwinDisplayConnectedIfNeeded];
  }

  return v9;
}

- (CSVTUIAudioSessionRecorder)initWithDelegate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSVTUIAudioSessionRecorder;
  uint64_t v5 = [(CSVTUIAudioSessionRecorder *)&v17 init];
  id v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  objc_storeWeak((id *)&v5->_delegate, 0);
  objc_storeWeak((id *)&v6->_audioSessionRecorderDelegate, v4);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.VoiceTriggerUI.RecordSessionQueue", 0);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v7;

  uint64_t v9 = [MEMORY[0x263F37FE8] contextForVoiceTriggerTraining];
  id v10 = [(CSVTUIAudioSessionRecorder *)v6 _forceFetchAudioProvider:0 recordContext:v9];

  if (v6->_audioProvider)
  {
    id v11 = objc_alloc(MEMORY[0x263F37FD0]);
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    uint64_t v12 = objc_msgSend(v11, "initWithSampleRate:");
    powerMeter = v6->_powerMeter;
    v6->_powerMeter = (CSAudioPowerMeter *)v12;

LABEL_4:
    id v14 = v6;
    goto LABEL_8;
  }
  id v15 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v19 = "-[CSVTUIAudioSessionRecorder initWithDelegate:]";
    _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s Creating audioRecorder has failed", buf, 0xCu);
  }
  id v14 = 0;
LABEL_8:

  return v14;
}

@end