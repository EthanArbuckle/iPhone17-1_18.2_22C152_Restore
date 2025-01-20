@interface VSOspreyTTSCore
- (BOOL)didReceiveAudio;
- (NSCondition)didReceiveAudioCondition;
- (NSError)error;
- (OS_dispatch_queue)delegateCallbackQueue;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSOspreyTTSCore)initWithRequest:(id)a3;
- (VSOspreyTTSCoreDelegate)delegate;
- (VSServerTTSClient)serverTTSClient;
- (VSSiriServerConfiguration)serverConfig;
- (VSSpeechInternalSettings)internalSettings;
- (VSSpeechRequest)request;
- (VSTimeoutCondition)timeoutCondition;
- (VSVoiceAsset)voice;
- (VSVoiceResourceAsset)voiceResource;
- (double)bufferDurationLimit;
- (double)timeout;
- (void)cancel;
- (void)main;
- (void)performRoundTripOspreyTTS;
- (void)performStreamingOspreyTTS;
- (void)setBufferDurationLimit:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateCallbackQueue:(id)a3;
- (void)setDidReceiveAudio:(BOOL)a3;
- (void)setDidReceiveAudioCondition:(id)a3;
- (void)setError:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setInternalSettings:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setServerTTSClient:(id)a3;
- (void)setTimeoutCondition:(id)a3;
- (void)setVoice:(id)a3;
- (void)setVoiceResource:(id)a3;
- (void)waitUntilFinishedIfAudioReceivedWithin:(double)a3;
@end

@implementation VSOspreyTTSCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_didReceiveAudioCondition, 0);
  objc_storeStrong((id *)&self->_timeoutCondition, 0);
  objc_storeStrong((id *)&self->_internalSettings, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_serverTTSClient, 0);
  objc_storeStrong((id *)&self->_voiceResource, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_instrumentMetrics);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setDelegateCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return self->_delegateCallbackQueue;
}

- (void)setDidReceiveAudioCondition:(id)a3
{
}

- (NSCondition)didReceiveAudioCondition
{
  return self->_didReceiveAudioCondition;
}

- (BOOL)didReceiveAudio
{
  return self->_didReceiveAudio;
}

- (void)setTimeoutCondition:(id)a3
{
}

- (VSTimeoutCondition)timeoutCondition
{
  return self->_timeoutCondition;
}

- (void)setBufferDurationLimit:(double)a3
{
  self->_bufferDurationLimit = a3;
}

- (double)bufferDurationLimit
{
  return self->_bufferDurationLimit;
}

- (void)setInternalSettings:(id)a3
{
}

- (VSSpeechInternalSettings)internalSettings
{
  return self->_internalSettings;
}

- (void)setServerConfig:(id)a3
{
}

- (VSSiriServerConfiguration)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerTTSClient:(id)a3
{
}

- (VSServerTTSClient)serverTTSClient
{
  return self->_serverTTSClient;
}

- (void)setVoiceResource:(id)a3
{
}

- (VSVoiceResourceAsset)voiceResource
{
  return self->_voiceResource;
}

- (void)setVoice:(id)a3
{
}

- (VSVoiceAsset)voice
{
  return self->_voice;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (VSInstrumentMetrics)instrumentMetrics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instrumentMetrics);
  return (VSInstrumentMetrics *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSOspreyTTSCoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSOspreyTTSCoreDelegate *)WeakRetained;
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)waitUntilFinishedIfAudioReceivedWithin:(double)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v5 = [(VSOspreyTTSCore *)self didReceiveAudioCondition];
  [v5 lock];

  BOOL v6 = [(VSOspreyTTSCore *)self didReceiveAudio];
  v7 = [(VSOspreyTTSCore *)self didReceiveAudioCondition];
  v8 = v7;
  if (v6)
  {
    [v7 unlock];

    [(VSOspreyTTSCore *)self waitUntilFinished];
  }
  else
  {
    v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
    char v10 = [v8 waitUntilDate:v9];

    v11 = [(VSOspreyTTSCore *)self didReceiveAudioCondition];
    [v11 unlock];

    if ((v10 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08320];
      v17[0] = @"Osprey core is not able to provide audio in time";
      v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v14 = [v12 errorWithDomain:@"ServerTTSErrorDomain" code:602 userInfo:v13];
      [(VSOspreyTTSCore *)self setError:v14];

      v15 = [(VSOspreyTTSCore *)self timeoutCondition];
      [v15 stop];
    }
    [(VSOspreyTTSCore *)self waitUntilFinished];
  }
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_INFO, "Osprey core %p is cancelled", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VSOspreyTTSCore;
  [(VSOspreyTTSCore *)&v5 cancel];
  v4 = [(VSOspreyTTSCore *)self timeoutCondition];
  [v4 stop];
}

- (void)main
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = [(VSOspreyTTSCore *)self instrumentMetrics];
  [(id)v4 setSynthesisBeginTimestamp:v3];

  kdebug_trace();
  objc_super v5 = [(VSOspreyTTSCore *)self internalSettings];
  LOBYTE(v4) = [v5 disableOspreyStreaming];

  if (v4) {
    [(VSOspreyTTSCore *)self performRoundTripOspreyTTS];
  }
  else {
    [(VSOspreyTTSCore *)self performStreamingOspreyTTS];
  }
  uint64_t v6 = mach_absolute_time();
  v7 = [(VSOspreyTTSCore *)self instrumentMetrics];
  [v7 setSynthesisEndTimestamp:v6];

  kdebug_trace();
  uint64_t v8 = [(VSOspreyTTSCore *)self delegateCallbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__VSOspreyTTSCore_main__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_async_and_wait(v8, block);
}

void __23__VSOspreyTTSCore_main__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 error];
  [v4 ospreyCore:v2 didFinishWithError:v3];
}

- (void)performStreamingOspreyTTS
{
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VSOspreyTTSCore *)self instrumentMetrics];
  [v3 setSourceOfTTS:5];

  id v4 = [VSTimeoutCondition alloc];
  [(VSOspreyTTSCore *)self timeout];
  objc_super v5 = [(VSTimeoutCondition *)v4 initWithTimeoutValue:"initWithTimeoutValue:"];
  [(VSOspreyTTSCore *)self setTimeoutCondition:v5];

  objc_initWeak(&location, self);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__869;
  v30 = __Block_byref_object_dispose__870;
  id v31 = [MEMORY[0x263EFF980] array];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__869;
  v24[4] = __Block_byref_object_dispose__870;
  id v25 = [MEMORY[0x263EFF980] array];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__869;
  v22[4] = __Block_byref_object_dispose__870;
  id v23 = 0;
  uint64_t v6 = [(VSOspreyTTSCore *)self serverTTSClient];
  uint64_t v7 = [(VSOspreyTTSCore *)self request];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke;
  v20[3] = &unk_2647DC8E8;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  v20[5] = v32;
  v20[6] = &v26;
  v20[7] = v24;
  v20[8] = v22;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_26;
  v18[3] = &unk_2647DC910;
  objc_copyWeak(&v19, &location);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2_28;
  v16[3] = &unk_2647DC960;
  objc_copyWeak(&v17, &location);
  v16[4] = v32;
  v16[5] = &v26;
  v16[6] = v24;
  [v6 ospreyStartStreamingRequest:v7 dataHandler:v20 metaInfoHandler:v18 completion:v16];

  uint64_t v8 = [(VSOspreyTTSCore *)self timeoutCondition];
  LOBYTE(v7) = [v8 wait];

  if ((v7 & 1) == 0)
  {
    if (v27[5])
    {
      v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_226CB1000, v9, OS_LOG_TYPE_ERROR, "Timeout in osprey streaming", v15, 2u);
      }

      char v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      v35 = @"Osprey streaming TTS timed out";
      v11 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v12 = [v10 errorWithDomain:@"ServerTTSErrorDomain" code:602 userInfo:v11];
      [(VSOspreyTTSCore *)self setError:v12];
    }
    else
    {
      v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, "Network stall in osprey streaming", v15, 2u);
      }

      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08320];
      v37[0] = @"Osprey streaming network stall";
      v11 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      v12 = [v14 errorWithDomain:@"ServerTTSErrorDomain" code:603 userInfo:v11];
      [(VSOspreyTTSCore *)self setError:v12];
    }

    [(VSOspreyTTSCore *)self cancel];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  objc_destroyWeak(&location);
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v8 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v8, "isFinished") & 1) == 0)
  {
    [v5 duration];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [v8 bufferDurationLimit];
    if (v10 > fmax(v11 + 0.1, 0.8))
    {
      v12 = [v8 internalSettings];
      int v13 = [v12 simulateNetworkStall];

      if (v13)
      {
        v14 = VSGetLogDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226CB1000, v14, OS_LOG_TYPE_INFO, "Simulate network stall is on, ignore audio object", buf, 2u);
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    v15 = [*(id *)(a1 + 32) instrumentMetrics];
    uint64_t v16 = [v15 serverFirstPacketTimestamp];

    if (!v16)
    {
      uint64_t v17 = mach_absolute_time();
      v18 = [*(id *)(a1 + 32) instrumentMetrics];
      [v18 setServerFirstPacketTimestamp:v17];
    }
    uint64_t v19 = mach_absolute_time();
    v20 = [*(id *)(a1 + 32) instrumentMetrics];
    [v20 setServerLastPacketTimestamp:v19];

    double v21 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v22 = [*(id *)(a1 + 32) instrumentMetrics];
    [v22 setServerStreamedAudioDuration:v21];

    if ([v8 didReceiveAudio])
    {
      id v23 = [v8 delegateCallbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_24;
      block[3] = &unk_2647DCC20;
      block[4] = v8;
      id v48 = v5;
      id v49 = v6;
      dispatch_async(v23, block);

      v24 = v48;
    }
    else
    {
      double v25 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      [v8 bufferDurationLimit];
      if (v25 < v26)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v5];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];
LABEL_16:
        id v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v31)
        {
          v32 = [v31 dateByAddingTimeInterval:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
          [v32 timeIntervalSinceNow];
          double v34 = v33 + 0.05;
          v35 = [v8 timeoutCondition];
          [v35 setTimeoutValue:v34];

          uint64_t v36 = VSGetLogDefault();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v37 = [v8 timeoutCondition];
            [v37 timeoutValue];
            *(_DWORD *)buf = 134217984;
            uint64_t v51 = v38;
            _os_log_impl(&dword_226CB1000, v36, OS_LOG_TYPE_INFO, "Refresh timeout value as %.2f", buf, 0xCu);
          }
        }
        v14 = [v8 timeoutCondition];
        [v14 refresh];
        goto LABEL_21;
      }
      [v8 setDidReceiveAudio:1];
      v27 = [v8 delegateCallbackQueue];
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      v41 = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2;
      v42 = &unk_2647DC8C0;
      v43 = v8;
      long long v46 = *(_OWORD *)(a1 + 48);
      id v44 = v5;
      id v45 = v6;
      dispatch_async(v27, &v39);

      uint64_t v28 = objc_msgSend(MEMORY[0x263EFF910], "date", v39, v40, v41, v42, v43);
      uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      v24 = v44;
    }

    goto LABEL_16;
  }
LABEL_22:
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_26(uint64_t a1, void *a2, void *a3, float a4)
{
  id v12 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v9 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v9, "isFinished") & 1) == 0)
  {
    [v9 setVoice:v12];
    [v9 setVoiceResource:v7];
    double v10 = [v9 internalSettings];
    [v10 streamBufferDuration];
    if (v11 == 0.0) {
      float v11 = a4;
    }
    [v9 setBufferDurationLimit:v11];
  }
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 0.8
      && ([v5 internalSettings],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 simulateNetworkStall],
          v6,
          v7))
    {
      uint64_t v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_INFO, "Simulate network stall is on, ignore completion callback", buf, 2u);
      }
    }
    else
    {
      double v9 = [v5 error];

      if (!v9) {
        [v5 setError:v3];
      }
      double v10 = [v5 delegateCallbackQueue];
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_29;
      v15 = &unk_2647DC938;
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v16 = v3;
      uint64_t v17 = v5;
      uint64_t v19 = *(void *)(a1 + 48);
      dispatch_async(v10, &v12);

      float v11 = objc_msgSend(v5, "timeoutCondition", v12, v13, v14, v15);
      [v11 stop];

      uint64_t v8 = v16;
    }
  }
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_29(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (!*(void *)(a1 + 32))
    {
      [*(id *)(a1 + 40) setDidReceiveAudio:1];
      if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
      {
        unint64_t v2 = 0;
        do
        {
          id v3 = [*(id *)(a1 + 40) delegate];
          uint64_t v4 = *(void *)(a1 + 40);
          id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v2];
          id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:v2];
          [v3 ospreyCore:v4 didReceiveAudio:v5 wordTimingInfo:v6];

          ++v2;
        }
        while (v2 < [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]);
      }
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_24(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 ospreyCore:*(void *)(a1 + 32) didReceiveAudio:*(void *)(a1 + 40) wordTimingInfo:*(void *)(a1 + 48)];
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    unint64_t v2 = 0;
    do
    {
      id v3 = [*(id *)(a1 + 32) delegate];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:v2];
      id v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:v2];
      [v3 ospreyCore:v4 didReceiveAudio:v5 wordTimingInfo:v6];

      ++v2;
    }
    while (v2 < [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]);
  }
  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  [v7 ospreyCore:*(void *)(a1 + 32) didReceiveAudio:*(void *)(a1 + 40) wordTimingInfo:*(void *)(a1 + 48)];

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  float v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (void)performRoundTripOspreyTTS
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = [(VSOspreyTTSCore *)self instrumentMetrics];
  [v3 setSourceOfTTS:4];

  uint64_t v4 = [VSTimeoutCondition alloc];
  [(VSOspreyTTSCore *)self timeout];
  id v5 = [(VSTimeoutCondition *)v4 initWithTimeoutValue:"initWithTimeoutValue:"];
  [(VSOspreyTTSCore *)self setTimeoutCondition:v5];

  objc_initWeak(&location, self);
  id v6 = [(VSOspreyTTSCore *)self serverTTSClient];
  uint64_t v7 = [(VSOspreyTTSCore *)self request];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke;
  v17[3] = &unk_2647DC870;
  objc_copyWeak(&v18, &location);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_3;
  v15 = &unk_2647DC898;
  objc_copyWeak(&v16, &location);
  [v6 ospreyStartSynthesisRequest:v7 responseHandler:v17 completion:&v12];

  uint64_t v8 = [(VSOspreyTTSCore *)self timeoutCondition];
  LOBYTE(v7) = [v8 wait];

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"Osprey round-trip TTS timed out";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    float v11 = [v9 errorWithDomain:@"ServerTTSErrorDomain" code:602 userInfo:v10];
    [(VSOspreyTTSCore *)self setError:v11];
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v8, "isFinished") & 1) == 0)
  {
    [v8 setDidReceiveAudio:1];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_2;
    block[3] = &unk_2647DCC20;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    id v5 = [v4 error];

    if (!v5) {
      [v4 setError:v7];
    }
    id v6 = [v4 timeoutCondition];
    [v6 stop];
  }
}

void __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 ospreyCore:*(void *)(a1 + 32) didReceiveAudio:*(void *)(a1 + 40) wordTimingInfo:*(void *)(a1 + 48)];
}

- (void)setDidReceiveAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VSOspreyTTSCore *)self didReceiveAudioCondition];
  [v5 lock];

  self->_didReceiveAudio = v3;
  if (v3)
  {
    id v6 = [(VSOspreyTTSCore *)self didReceiveAudioCondition];
    [v6 broadcast];
  }
  id v7 = [(VSOspreyTTSCore *)self didReceiveAudioCondition];
  [v7 unlock];
}

- (double)timeout
{
  BOOL v3 = [(VSOspreyTTSCore *)self internalSettings];
  [v3 serverTTSTimeout];
  if (v4 == 0.0)
  {
    id v5 = [(VSOspreyTTSCore *)self serverConfig];
    id v6 = [(VSOspreyTTSCore *)self request];
    id v7 = [v6 clientBundleIdentifier];
    [v5 timeoutForAppId:v7];
    double v9 = v8;
  }
  else
  {
    double v9 = v4;
  }

  return v9;
}

- (VSOspreyTTSCore)initWithRequest:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VSOspreyTTSCore;
  id v6 = [(VSOspreyTTSCore *)&v20 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = +[VSSiriServerConfiguration defaultConfig];
    serverConfig = v7->_serverConfig;
    v7->_serverConfig = (VSSiriServerConfiguration *)v8;

    uint64_t v10 = objc_alloc_init(VSServerTTSClient);
    serverTTSClient = v7->_serverTTSClient;
    v7->_serverTTSClient = v10;

    uint64_t v12 = [MEMORY[0x263F84E90] standardInstance];
    internalSettings = v7->_internalSettings;
    v7->_internalSettings = (VSSpeechInternalSettings *)v12;

    v14 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    didReceiveAudioCondition = v7->_didReceiveAudioCondition;
    v7->_didReceiveAudioCondition = v14;

    id v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v17 = dispatch_queue_create("VSOspreyTTSCoreCallbackQueue", v16);
    delegateCallbackQueue = v7->_delegateCallbackQueue;
    v7->_delegateCallbackQueue = (OS_dispatch_queue *)v17;
  }
  return v7;
}

@end