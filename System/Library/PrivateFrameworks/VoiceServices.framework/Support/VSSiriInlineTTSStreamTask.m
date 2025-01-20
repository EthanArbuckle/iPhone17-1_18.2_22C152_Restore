@interface VSSiriInlineTTSStreamTask
- (BOOL)isSpeaking;
- (BOOL)waitForNewData:(double)a3;
- (NSCondition)refreshTimeoutCondition;
- (NSDate)playbackBeginDate;
- (NSError)error;
- (NSMutableArray)finalTimingInfo;
- (NSString)streamID;
- (SATTSSpeechSynthesisResource)streamingResource;
- (SATTSSpeechSynthesisVoice)streamingVoice;
- (VSAudioData)serverAudio;
- (VSAudioPlaybackService)playbackServices;
- (VSDeviceTTSCore)deviceTTSCore;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSSiriInlineTTSStreamTask)init;
- (VSSiriInlineTTSStreamTask)initWithRequest:(id)a3 withStreamID:(id)a4;
- (VSSiriInstrumentation)siriInstrumentation;
- (VSSpeechRequest)request;
- (VSSpeechServiceDelegate)delegate;
- (double)bufferDurationLimit;
- (double)timeoutValue;
- (id)audioPowerProvider;
- (id)taskHash;
- (id)voiceKey;
- (void)cancel;
- (void)dealloc;
- (void)handleBegin:(id)a3;
- (void)handleChunk:(id)a3;
- (void)handleEnd:(id)a3;
- (void)handleStreamNotification:(id)a3;
- (void)main;
- (void)reportFinish;
- (void)reportInstrumentMetrics;
- (void)reportSpeechStart;
- (void)reportTimingInfo;
- (void)resume;
- (void)setBufferDurationLimit:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceTTSCore:(id)a3;
- (void)setError:(id)a3;
- (void)setFinalTimingInfo:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setPlaybackBeginDate:(id)a3;
- (void)setPlaybackServices:(id)a3;
- (void)setRefreshTimeoutCondition:(id)a3;
- (void)setRequest:(id)a3;
- (void)setServerAudio:(id)a3;
- (void)setSiriInstrumentation:(id)a3;
- (void)setStreamID:(id)a3;
- (void)setStreamingResource:(id)a3;
- (void)setStreamingVoice:(id)a3;
- (void)setTimeoutValue:(double)a3;
- (void)signalNewDataWithError:(id)a3;
- (void)startPlayback;
- (void)suspend;
- (void)synthesisCore:(id)a3 didReceiveAudio:(id)a4;
- (void)synthesisCore:(id)a3 didReceiveProcessingWordTimingInfo:(id)a4;
- (void)synthesisCore:(id)a3 didReceiveWordTimingInfo:(id)a4;
@end

@implementation VSSiriInlineTTSStreamTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_playbackBeginDate, 0);
  objc_storeStrong((id *)&self->_finalTimingInfo, 0);
  objc_storeStrong((id *)&self->_serverAudio, 0);
  objc_storeStrong((id *)&self->_refreshTimeoutCondition, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playbackServices, 0);
  objc_storeStrong((id *)&self->_deviceTTSCore, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_streamingVoice, 0);
  objc_storeStrong((id *)&self->_streamingResource, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSiriInstrumentation:(id)a3
{
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setPlaybackBeginDate:(id)a3
{
}

- (NSDate)playbackBeginDate
{
  return self->_playbackBeginDate;
}

- (void)setTimeoutValue:(double)a3
{
  self->_timeoutValue = a3;
}

- (double)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setBufferDurationLimit:(double)a3
{
  self->_bufferDurationLimit = a3;
}

- (double)bufferDurationLimit
{
  return self->_bufferDurationLimit;
}

- (void)setFinalTimingInfo:(id)a3
{
}

- (NSMutableArray)finalTimingInfo
{
  return self->_finalTimingInfo;
}

- (void)setServerAudio:(id)a3
{
}

- (VSAudioData)serverAudio
{
  return self->_serverAudio;
}

- (void)setRefreshTimeoutCondition:(id)a3
{
}

- (NSCondition)refreshTimeoutCondition
{
  return self->_refreshTimeoutCondition;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setPlaybackServices:(id)a3
{
}

- (VSAudioPlaybackService)playbackServices
{
  return self->_playbackServices;
}

- (void)setDeviceTTSCore:(id)a3
{
}

- (VSDeviceTTSCore)deviceTTSCore
{
  return self->_deviceTTSCore;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setStreamingVoice:(id)a3
{
}

- (SATTSSpeechSynthesisVoice)streamingVoice
{
  return self->_streamingVoice;
}

- (void)setStreamingResource:(id)a3
{
}

- (SATTSSpeechSynthesisResource)streamingResource
{
  return self->_streamingResource;
}

- (void)setStreamID:(id)a3
{
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setRequest:(id)a3
{
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)setDelegate:(id)a3
{
}

- (VSSpeechServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechServiceDelegate *)WeakRetained;
}

- (void)synthesisCore:(id)a3 didReceiveWordTimingInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(VSSiriInlineTTSStreamTask *)self finalTimingInfo];
  [v6 addObjectsFromArray:v5];
}

- (void)synthesisCore:(id)a3 didReceiveProcessingWordTimingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VSSiriInlineTTSStreamTask *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__VSSiriInlineTTSStreamTask_synthesisCore_didReceiveProcessingWordTimingInfo___block_invoke;
    v11[3] = &unk_2647DCC70;
    objc_copyWeak(&v12, &location);
    [v10 setBoundaryTimeObserverForTimingInfos:v7 usingBlock:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __78__VSSiriInlineTTSStreamTask_synthesisCore_didReceiveProcessingWordTimingInfo___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained delegate];
    id v6 = [v4 request];
    uint64_t v7 = [v9 textRange];
    objc_msgSend(v5, "speechRequest:didStartWithMark:forRange:", v6, 1, v7, v8);
  }
}

- (void)synthesisCore:(id)a3 didReceiveAudio:(id)a4
{
  v44[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(VSSiriInlineTTSStreamTask *)self error];

  if (!v6)
  {
    uint64_t v7 = [(VSSiriInlineTTSStreamTask *)self playbackServices];

    if (!v7)
    {
      uint64_t v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_DEFAULT, "Initializing fallback playback service", buf, 2u);
      }

      id v9 = [VSAudioPlaybackService alloc];
      v10 = [(VSSiriInlineTTSStreamTask *)self request];
      uint64_t v11 = [v10 audioSessionID];
      if (v5)
      {
        [v5 asbd];
      }
      else
      {
        uint64_t v41 = 0;
        long long v39 = 0u;
        long long v40 = 0u;
      }
      id v12 = [(VSSiriInlineTTSStreamTask *)self request];
      v13 = [v12 accessoryID];
      v14 = [(VSAudioPlaybackService *)v9 initWithAudioSessionID:v11 asbd:&v39 useAVSBAR:v13 != 0];
      [(VSSiriInlineTTSStreamTask *)self setPlaybackServices:v14];

      v15 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
      v16 = [v15 outputRouteInfo];
      v17 = [v16 audioRouteName];
      v18 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v18 setAudioOutputRoute:v17];

      v19 = [(VSSiriInlineTTSStreamTask *)self playbackServices];

      if (!v19)
      {
        v37 = (void *)MEMORY[0x263F087E8];
        uint64_t v43 = *MEMORY[0x263F08320];
        v44[0] = @"Unable to create playback service";
        v33 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
        v38 = [v37 errorWithDomain:@"VoiceServicesErrorDomain" code:450 userInfo:v33];
        [(VSSiriInlineTTSStreamTask *)self setError:v38];

LABEL_15:
        goto LABEL_16;
      }
      uint64_t v20 = mach_absolute_time();
      v21 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
      v22 = [v21 start];

      if (v22) {
        [(VSSiriInlineTTSStreamTask *)self setError:v22];
      }
      uint64_t v23 = mach_absolute_time() - v20;
      v24 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v24 setAudioStartTimestampDiffs:v23];
    }
    v25 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v26 = [v25 speechBeginTimestamp];

    if (!v26)
    {
      uint64_t v27 = mach_absolute_time();
      v28 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v28 setSpeechBeginTimestamp:v27];

      [(VSSiriInlineTTSStreamTask *)self reportSpeechStart];
    }
    v29 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
    v30 = [v5 audioData];
    uint64_t v31 = [v5 packetCount];
    v32 = [v5 packetDescriptions];
    [v29 enqueue:v30 packetCount:v31 packetDescriptions:v32];

    v33 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    [v5 duration];
    double v35 = v34;
    [v33 audioDuration];
    [v33 setAudioDuration:v35 + v36];
    goto LABEL_15;
  }
LABEL_16:
}

- (id)audioPowerProvider
{
  v2 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  v3 = [v2 audioPowerProvider];

  return v3;
}

- (void)reportInstrumentMetrics
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(VSSiriInlineTTSStreamTask *)self delegate];
  v4 = [(VSSiriInlineTTSStreamTask *)self request];
  id v5 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v3 speechRequest:v4 didReportInstrumentMetrics:v5];

  id v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v8 = [v7 requestCreatedTimestamp];
    id v9 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    int v14 = 134218242;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEFAULT, "Stream task %llu: Instrument metric: %@", (uint8_t *)&v14, 0x16u);
  }
  v10 = +[VSDiagnosticService defaultService];
  uint64_t v11 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  id v12 = [v11 dictionaryMetrics];
  v13 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  objc_msgSend(v10, "dumpInstrumentMetrics:withTimestamp:", v12, objc_msgSend(v13, "requestCreatedTimestamp"));
}

- (void)reportTimingInfo
{
  id v5 = [(VSSiriInlineTTSStreamTask *)self delegate];
  v3 = [(VSSiriInlineTTSStreamTask *)self request];
  v4 = [(VSSiriInlineTTSStreamTask *)self finalTimingInfo];
  [v5 speechRequest:v3 didReceiveTimingInfo:v4];
}

- (void)reportFinish
{
  v59[1] = *MEMORY[0x263EF8340];
  v3 = [(VSSiriInlineTTSStreamTask *)self delegate];
  v4 = [(VSSiriInlineTTSStreamTask *)self request];
  uint64_t v5 = [(VSSiriInlineTTSStreamTask *)self isCancelled] ^ 1;
  id v6 = [(VSSiriInlineTTSStreamTask *)self error];
  [v3 speechRequest:v4 didStopWithSuccess:v5 phonemesSpoken:&stru_26DAD0E18 error:v6];

  uint64_t v7 = [(VSSiriInlineTTSStreamTask *)self error];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(VSSiriInlineTTSStreamTask *)self error];
  if ([v9 code] == 400)
  {

LABEL_5:
    id v12 = [(VSSiriInlineTTSStreamTask *)self voiceKey];
    v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      uint64_t v14 = [v48 requestCreatedTimestamp];
      if ([(VSSiriInlineTTSStreamTask *)self isCancelled]) {
        uint64_t v15 = @"Cancelled";
      }
      else {
        uint64_t v15 = @"Finished";
      }
      __int16 v16 = [(VSSiriInlineTTSStreamTask *)self request];
      v17 = [v16 logText];
      if (v12) {
        uint64_t v18 = v12;
      }
      else {
        uint64_t v18 = @"(null)";
      }
      v49[0] = @"voice";
      v49[1] = @"voice_resource";
      v50[0] = v18;
      v19 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      uint64_t v20 = [v19 voiceResourceAssetKey];
      v21 = (void *)v20;
      if (v20) {
        v22 = (__CFString *)v20;
      }
      else {
        v22 = @"(null)";
      }
      v50[1] = v22;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
      *(_DWORD *)buf = 134218754;
      uint64_t v52 = v14;
      __int16 v53 = 2112;
      v54 = v15;
      __int16 v55 = 2112;
      v56 = v17;
      __int16 v57 = 2114;
      v58 = v23;
      _os_log_impl(&dword_226CB1000, v13, OS_LOG_TYPE_DEFAULT, "Stream task %llu: %@ speaking text: '%@', %{public}@", buf, 0x2Au);
    }
    int v24 = [(VSSiriInlineTTSStreamTask *)self isCancelled];
    v25 = [(VSSiriInlineTTSStreamTask *)self siriInstrumentation];
    uint64_t v26 = v25;
    if (v24)
    {
      [v25 instrumentSpeechCancelled];
    }
    else
    {
      uint64_t v27 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v27 audioDuration];
      double v29 = v28;
      v30 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v30 ttsSynthesisLatency];
      double v32 = v31;
      v33 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v33 cappedRealTimeFactor];
      double v35 = v34;
      double v36 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      uint64_t v37 = [v36 promptCount];
      v38 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      objc_msgSend(v26, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v37, objc_msgSend(v38, "errorCode"), v29, v32, v35);
    }
    long long v39 = (void *)MEMORY[0x263F84E10];
    long long v40 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    [v39 reportInstrumentMetrics:v40];
    goto LABEL_20;
  }
  v10 = [(VSSiriInlineTTSStreamTask *)self error];
  uint64_t v11 = [v10 code];

  if (v11 == 501) {
    goto LABEL_5;
  }
  uint64_t v41 = VSGetLogDefault();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v45 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v46 = [v45 requestCreatedTimestamp];
    v47 = [(VSSiriInlineTTSStreamTask *)self error];
    *(_DWORD *)buf = 134218242;
    uint64_t v52 = v46;
    __int16 v53 = 2112;
    v54 = v47;
    _os_log_error_impl(&dword_226CB1000, v41, OS_LOG_TYPE_ERROR, "Error in stream task %llu, error: %@", buf, 0x16u);
  }
  id v12 = [(VSSiriInlineTTSStreamTask *)self siriInstrumentation];
  v42 = NSNumber;
  long long v40 = [(VSSiriInlineTTSStreamTask *)self error];
  uint64_t v43 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v40, "code"));
  v59[0] = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  [(__CFString *)v12 instrumentSpeechFailedWithErrorCodes:v44];

LABEL_20:
}

- (id)voiceKey
{
  v3 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  int v4 = [v3 isServerTimeout];

  if (v4)
  {
    uint64_t v5 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    id v6 = [v5 selectedVoice];
    uint64_t v7 = [v6 voiceData];
    uint64_t v8 = [v7 descriptiveKey];
  }
  else
  {
    uint64_t v5 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v8 = [v5 voiceAssetKey];
  }

  return v8;
}

- (void)reportSpeechStart
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [(VSSiriInlineTTSStreamTask *)self delegate];
  int v4 = [(VSSiriInlineTTSStreamTask *)self request];
  [v3 speechRequestDidStart:v4];

  uint64_t v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = [v6 requestCreatedTimestamp];
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_INFO, "Task %llu started speaking", buf, 0xCu);
  }
  uint64_t v7 = [(VSSiriInlineTTSStreamTask *)self siriInstrumentation];
  double v28 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  uint64_t v8 = [v28 sourceOfTTS];
  uint64_t v27 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v27 timeToSpeakLatency];
  double v10 = v9;
  uint64_t v26 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  uint64_t v23 = [v26 outputRouteInfo];
  uint64_t v11 = (void *)MEMORY[0x263F84EC0];
  v25 = [(VSSiriInlineTTSStreamTask *)self streamingVoice];
  int v24 = [v25 type];
  uint64_t v22 = [v11 typeFromString:v24];
  id v12 = (void *)MEMORY[0x263F84EC0];
  v13 = [(VSSiriInlineTTSStreamTask *)self streamingVoice];
  uint64_t v14 = [v13 quality];
  uint64_t v15 = [v12 footprintFromString:v14];
  __int16 v16 = [(VSSiriInlineTTSStreamTask *)self streamingVoice];
  v17 = [v16 contentVersion];
  uint64_t v18 = [v17 integerValue];
  v19 = [(VSSiriInlineTTSStreamTask *)self streamingResource];
  uint64_t v20 = [v19 resourceVersion];
  LOBYTE(v21) = 0;
  objc_msgSend(v7, "instrumentSpeechStartedWithSource:customerPerceivedLatency:audioOutputRoute:voiceType:voiceFootprint:voiceVersion:resourceVersion:isWhisper:", v8, v23, v22, v15, v18, objc_msgSend(v20, "integerValue"), v10, v21);
}

- (BOOL)isSpeaking
{
  return 1;
}

- (void)suspend
{
  id v2 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  [v2 pause];
}

- (void)resume
{
  id v3 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  id v2 = (id)[v3 start];
}

- (id)taskHash
{
  return self->_streamID;
}

- (void)cancel
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:0];
  [(VSSiriInlineTTSStreamTask *)self setError:v3];

  if (([(VSSiriInlineTTSStreamTask *)self isExecuting] & 1) != 0
    || ([(VSSiriInlineTTSStreamTask *)self isCancelled] & 1) != 0
    || ([(VSSiriInlineTTSStreamTask *)self isFinished] & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VSSiriInlineTTSStreamTask;
    [(VSSiriInlineTTSStreamTask *)&v6 cancel];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VSSiriInlineTTSStreamTask;
    [(VSSiriInlineTTSStreamTask *)&v7 cancel];
    [(VSSiriInlineTTSStreamTask *)self reportFinish];
  }
  int v4 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  [v4 stop];

  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"ServerTTSErrorDomain" code:400 userInfo:MEMORY[0x263EFFA78]];
  [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:v5];
}

- (void)main
{
  v108[1] = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v3 = mach_absolute_time();
  int v4 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v4 setSynthesisBeginTimestamp:v3];

  uint64_t v5 = +[VSSiriServerConfiguration defaultConfig];
  objc_super v6 = [v5 experimentIdentifier];
  objc_super v7 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v7 setExperimentIdentifier:v6];

  kdebug_trace();
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  double v9 = [(VSSiriInlineTTSStreamTask *)self streamID];
  [v8 addObserver:self selector:sel_handleStreamNotification_ name:v9 object:0];

  double v10 = +[VSInlineStreamService sharedService];
  uint64_t v11 = [(VSSiriInlineTTSStreamTask *)self streamID];
  [v10 startStreamingWithId:v11];

  do
  {
    [(VSSiriInlineTTSStreamTask *)self timeoutValue];
    BOOL v12 = -[VSSiriInlineTTSStreamTask waitForNewData:](self, "waitForNewData:");
    v13 = [(VSSiriInlineTTSStreamTask *)self error];

    if (v13) {
      break;
    }
    if (!v12)
    {
      uint64_t v14 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      uint64_t v15 = [v14 synthesisEndTimestamp];

      if (!v15)
      {
        uint64_t v18 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
        uint64_t v19 = [v18 speechBeginTimestamp];

        uint64_t v20 = VSGetLogDefault();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        if (v19)
        {
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "Stream TTS network stall.", buf, 2u);
          }
          uint64_t v22 = 701;
        }
        else
        {
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "Inline streaming TTS timeout.", buf, 2u);
          }
          uint64_t v22 = 702;
        }

        uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"ServerTTSErrorDomain" code:v22 userInfo:MEMORY[0x263EFFA78]];
        [(VSSiriInlineTTSStreamTask *)self setError:v23];

        int v24 = [(VSSiriInlineTTSStreamTask *)self error];
        uint64_t v25 = [v24 code];
        uint64_t v26 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
        [v26 setErrorCode:v25];

        uint64_t v27 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
        [v27 setIsServerTimeout:1];

        uint64_t v28 = mach_absolute_time();
        double v29 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
        [v29 setSynthesisEndTimestamp:v28];

        kdebug_trace();
        notify_post((const char *)[(id)*MEMORY[0x263F84F10] UTF8String]);
        break;
      }
    }
    __int16 v16 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v17 = [v16 synthesisEndTimestamp];
  }
  while (!v17);
  uint64_t v30 = [MEMORY[0x263F08A00] defaultCenter];
  [v30 removeObserver:self];

  if ([(VSSiriInlineTTSStreamTask *)self isCancelled])
  {
    int v31 = 0;
  }
  else
  {
    double v32 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    if ([v32 errorCode] == 701)
    {
      v33 = [(VSSiriInlineTTSStreamTask *)self request];
      int v31 = [v33 retryDeviceOnNetworkStall];
    }
    else
    {
      int v31 = 0;
    }
  }
  if (([(VSSiriInlineTTSStreamTask *)self isCancelled] & 1) != 0
    || ([(VSSiriInlineTTSStreamTask *)self error],
        double v34 = objc_claimAutoreleasedReturnValue(),
        v34,
        !v34))
  {
    if (!v31) {
      goto LABEL_36;
    }
  }
  else
  {
    double v35 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    double v36 = [v35 request];
    uint64_t v37 = [v36 utterance];
    uint64_t v38 = [v37 length];

    if (!v38)
    {
      long long v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v107 = *MEMORY[0x263F08320];
      v108[0] = @"Missing utterance in the request (preprocessing missing?). Can't fallback to device TTS.";
      long long v40 = [NSDictionary dictionaryWithObjects:v108 forKeys:&v107 count:1];
      uint64_t v41 = [v39 errorWithDomain:@"VoiceServicesErrorDomain" code:100 userInfo:v40];
      [(VSSiriInlineTTSStreamTask *)self setError:v41];

      if ((v31 & 1) == 0) {
        goto LABEL_36;
      }
    }
  }
  v42 = VSGetLogDefault();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v100 = [(VSSiriInlineTTSStreamTask *)self error];
    v101 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    int v102 = [v101 errorCode];
    *(_DWORD *)buf = 138412546;
    v104 = v100;
    __int16 v105 = 1024;
    int v106 = v102;
    _os_log_error_impl(&dword_226CB1000, v42, OS_LOG_TYPE_ERROR, "Streaming error: %@, error_code: %d", buf, 0x12u);
  }
  [(VSSiriInlineTTSStreamTask *)self setServerAudio:0];
  uint64_t v43 = [(VSSiriInlineTTSStreamTask *)self finalTimingInfo];
  [v43 removeAllObjects];

  [(VSSiriInlineTTSStreamTask *)self setError:0];
  v44 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  [v44 stop];

  [(VSSiriInlineTTSStreamTask *)self setPlaybackServices:0];
  if ((v31 & 1) != 0
    || ([(VSSiriInlineTTSStreamTask *)self instrumentMetrics],
        v45 = objc_claimAutoreleasedReturnValue(),
        uint64_t v46 = [v45 speechBeginTimestamp],
        v45,
        v46))
  {
    v47 = (void *)MEMORY[0x263F84E30];
    uint64_t v48 = *MEMORY[0x263F84F08];
    v49 = [(VSSiriInlineTTSStreamTask *)self request];
    v50 = [v49 languageCode];
    v51 = [v47 localizedInterstitialStringForKey:v48 language:v50];

    uint64_t v52 = NSString;
    if (v51) {
      __int16 v53 = v51;
    }
    else {
      __int16 v53 = &stru_26DAD0E18;
    }
    v54 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    __int16 v55 = [v54 request];
    v56 = [v55 utterance];
    __int16 v57 = [v52 stringWithFormat:@"%@ %@", v53, v56];
    v58 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    v59 = [v58 request];
    [v59 setUtterance:v57];

    v60 = NSString;
    v61 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    v62 = [v61 request];
    v63 = [v62 text];
    v64 = [v60 stringWithFormat:@"%@ %@", v53, v63];
    v65 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    v66 = [v65 request];
    [v66 setText:v64];
  }
  v67 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
  [v67 start];

  v68 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
  v69 = [v68 error];
  [(VSSiriInlineTTSStreamTask *)self setError:v69];

  v70 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v70 setIsServerStreamTTS:0];

  v71 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v71 setIsServerTTS:0];

  v72 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v72 setIsServerTimeout:1];

  v73 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v73 setSourceOfTTS:1];

  v74 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
  v75 = [v74 selectedVoice];
  v76 = [v75 key];
  v77 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v77 setVoiceAssetKey:v76];

  v78 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
  v79 = [v78 selectedVoiceResource];
  v80 = [v79 key];
  v81 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v81 setVoiceResourceAssetKey:v80];

LABEL_36:
  v82 = [(VSSiriInlineTTSStreamTask *)self error];

  if (v82)
  {
    v83 = [(VSSiriInlineTTSStreamTask *)self error];
    uint64_t v84 = [v83 code];
    v85 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    [v85 setErrorCode:v84];
  }
  else
  {
    v86 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
    [v86 flushAndStop];

    v83 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
    v85 = [v83 error];
    [(VSSiriInlineTTSStreamTask *)self setError:v85];
  }

  uint64_t v87 = mach_absolute_time();
  v88 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v88 setSpeechEndTimestamp:v87];

  v89 = [(VSSiriInlineTTSStreamTask *)self error];

  if (!v89)
  {
    [(VSSiriInlineTTSStreamTask *)self reportInstrumentMetrics];
    [(VSSiriInlineTTSStreamTask *)self reportTimingInfo];
    v90 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v91 = [v90 sourceOfTTS];

    if (v91 == 3)
    {
      v92 = +[VSDiagnosticService defaultService];
      v93 = [(VSSiriInlineTTSStreamTask *)self serverAudio];
      v94 = [(VSSiriInlineTTSStreamTask *)self request];
      [v92 dumpCompressedAudio:v93 forRequest:v94];
LABEL_47:

      goto LABEL_48;
    }
    v95 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    v96 = [v95 streamAudio];

    if (v96)
    {
      v92 = +[VSDiagnosticService defaultService];
      v93 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
      v94 = [v93 streamAudio];
      v97 = [(VSSiriInlineTTSStreamTask *)self request];
      [v92 dumpStreamAudio:v94 forRequest:v97];
LABEL_46:

      goto LABEL_47;
    }
    v98 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
    v99 = [v98 compressedAudio];

    if (v99)
    {
      v92 = +[VSDiagnosticService defaultService];
      v93 = [(VSSiriInlineTTSStreamTask *)self deviceTTSCore];
      v94 = [v93 compressedAudio];
      v97 = [(VSSiriInlineTTSStreamTask *)self request];
      [v92 dumpCompressedAudio:v94 forRequest:v97];
      goto LABEL_46;
    }
  }
LABEL_48:
  [(VSSiriInlineTTSStreamTask *)self reportFinish];
  kdebug_trace();
}

- (void)signalNewDataWithError:(id)a3
{
  id v8 = a3;
  int v4 = [(VSSiriInlineTTSStreamTask *)self refreshTimeoutCondition];
  [v4 lock];

  uint64_t v5 = [(VSSiriInlineTTSStreamTask *)self error];

  if (!v5) {
    [(VSSiriInlineTTSStreamTask *)self setError:v8];
  }
  objc_super v6 = [(VSSiriInlineTTSStreamTask *)self refreshTimeoutCondition];
  [v6 signal];

  objc_super v7 = [(VSSiriInlineTTSStreamTask *)self refreshTimeoutCondition];
  [v7 unlock];
}

- (BOOL)waitForNewData:(double)a3
{
  uint64_t v5 = [(VSSiriInlineTTSStreamTask *)self refreshTimeoutCondition];
  [v5 lock];

  objc_super v6 = [(VSSiriInlineTTSStreamTask *)self refreshTimeoutCondition];
  objc_super v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  char v8 = [v6 waitUntilDate:v7];

  double v9 = [(VSSiriInlineTTSStreamTask *)self refreshTimeoutCondition];
  [v9 unlock];

  return v8;
}

- (void)startPlayback
{
  uint64_t v3 = mach_absolute_time();
  int v4 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  id v9 = [v4 start];

  uint64_t v5 = mach_absolute_time() - v3;
  objc_super v6 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v6 setAudioStartTimestampDiffs:v5];

  if (v9)
  {
    [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:v9];
  }
  else
  {
    uint64_t v7 = mach_absolute_time();
    char v8 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    [v8 setSpeechBeginTimestamp:v7];

    [(VSSiriInlineTTSStreamTask *)self reportSpeechStart];
  }
}

- (void)handleEnd:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 streamId];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_INFO, "Handle stream end with streamId: %@, count: %@", buf, 0x16u);
  }
  char v8 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  uint64_t v9 = [v8 synthesisEndTimestamp];

  if (!v9)
  {
    uint64_t v10 = mach_absolute_time();
    uint64_t v11 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    [v11 setSynthesisEndTimestamp:v10];

    kdebug_trace();
  }
  if ([v4 errorCode] && objc_msgSend(v4, "errorCode") != 200)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    uint64_t v14 = NSString;
    uint64_t v15 = [v4 errorCode];
    __int16 v16 = [v4 errorMessage];
    uint64_t v17 = [v14 stringWithFormat:@"Unknown inline streaming error %d, %@", v15, v16];
    uint64_t v26 = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v19 = [v13 errorWithDomain:@"ServerTTSErrorDomain" code:700 userInfo:v18];

    [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:v19];
  }
  else
  {
    BOOL v12 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    if ([v12 speechBeginTimestamp])
    {
    }
    else
    {
      uint64_t v20 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v20 audioDuration];
      double v22 = v21;
      [(VSSiriInlineTTSStreamTask *)self bufferDurationLimit];
      double v24 = v23;

      if (v22 < v24) {
        [(VSSiriInlineTTSStreamTask *)self startPlayback];
      }
    }
    [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:0];
  }
}

- (void)handleChunk:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 streamId];
    *(_DWORD *)buf = 138412290;
    v66 = v6;
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_INFO, "Handle stream chunk with streamId: %@", buf, 0xCu);
  }
  uint64_t v7 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  uint64_t v8 = [v7 serverFirstPacketTimestamp];

  if (!v8)
  {
    uint64_t v9 = mach_absolute_time();
    uint64_t v10 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    [v10 setServerFirstPacketTimestamp:v9];
  }
  uint64_t v11 = mach_absolute_time();
  BOOL v12 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v12 setServerLastPacketTimestamp:v11];

  id v13 = objc_alloc_init(MEMORY[0x263F84E18]);
  uint64_t v14 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  if (v14)
  {
    uint64_t v15 = v14;
    [v14 asbd];

    if (DWORD2(v62) == 1819304813)
    {
      __int16 v16 = [v4 audioData];
      [v13 populateWithPCMData:v16];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v64 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
  }
  uint64_t v17 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  if (!v17)
  {
    uint64_t v61 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
    goto LABEL_15;
  }
  uint64_t v18 = v17;
  [v17 asbd];

  if (DWORD2(v59) != 1869641075)
  {
LABEL_15:
    double v21 = [MEMORY[0x263F087E8] errorWithDomain:@"ServerTTSErrorDomain" code:451 userInfo:MEMORY[0x263EFFA78]];
    [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:v21];
LABEL_27:

    goto LABEL_28;
  }
  __int16 v16 = [v4 audioData];
  [v13 populateWithOpusData:v16];
LABEL_12:

  uint64_t v19 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  uint64_t v20 = v19;
  if (v19)
  {
    [v19 asbd];
  }
  else
  {
    uint64_t v58 = 0;
    long long v56 = 0u;
    long long v57 = 0u;
  }
  v54[0] = v56;
  v54[1] = v57;
  uint64_t v55 = v58;
  [v13 setAsbd:v54];

  double v22 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
  double v23 = [v13 audioData];
  uint64_t v24 = [v13 packetCount];
  uint64_t v25 = [v13 packetDescriptions];
  [v22 enqueue:v23 packetCount:v24 packetDescriptions:v25];

  uint64_t v26 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v13 duration];
  double v28 = v27;
  [v26 audioDuration];
  [v26 setAudioDuration:v28 + v29];

  uint64_t v30 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v30 audioDuration];
  double v32 = v31;
  v33 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v33 setServerStreamedAudioDuration:v32];

  double v34 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v34 audioDuration];
  double v36 = v35;
  [(VSSiriInlineTTSStreamTask *)self bufferDurationLimit];
  if (v36 < v37)
  {

    goto LABEL_20;
  }
  uint64_t v38 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  uint64_t v39 = [v38 speechBeginTimestamp];

  if (v39)
  {
LABEL_20:
    long long v40 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v41 = [v40 speechBeginTimestamp];

    if (v41)
    {
      v42 = [MEMORY[0x263EFF910] date];
      uint64_t v43 = [(VSSiriInlineTTSStreamTask *)self playbackBeginDate];
      [v42 timeIntervalSinceDate:v43];
      double v45 = v44;

      uint64_t v46 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v46 audioDuration];
      double v48 = v47 - v45;

      [(VSSiriInlineTTSStreamTask *)self setTimeoutValue:v48];
    }
    goto LABEL_25;
  }
  v49 = VSGetLogDefault();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v49, OS_LOG_TYPE_INFO, "Reached buffer threshold. Start playing audio.", buf, 2u);
  }

  [(VSSiriInlineTTSStreamTask *)self startPlayback];
  v50 = [MEMORY[0x263EFF910] date];
  [(VSSiriInlineTTSStreamTask *)self setPlaybackBeginDate:v50];

  v51 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v51 audioDuration];
  [(VSSiriInlineTTSStreamTask *)self setTimeoutValue:"setTimeoutValue:"];

LABEL_25:
  [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:0];
  uint64_t v52 = [MEMORY[0x263F84E90] standardInstance];
  int v53 = [v52 enableAudioDump];

  if (v53)
  {
    double v21 = [(VSSiriInlineTTSStreamTask *)self serverAudio];
    [v21 concatenateWithAudio:v13];
    goto LABEL_27;
  }
LABEL_28:
}

- (void)handleBegin:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 speechSynthesisVoice];
  [(VSSiriInlineTTSStreamTask *)self setStreamingVoice:v5];

  objc_super v6 = [v4 speechSynthesisResource];
  [(VSSiriInlineTTSStreamTask *)self setStreamingResource:v6];

  uint64_t v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v4 streamId];
    uint64_t v9 = [v4 text];
    uint64_t v10 = [v4 decoderStreamDescription];
    uint64_t v11 = [v10 vsDescription];
    *(_DWORD *)buf = 138412802;
    uint64_t v59 = (uint64_t)v8;
    __int16 v60 = 2112;
    uint64_t v61 = v9;
    __int16 v62 = 2112;
    long long v63 = v11;
    _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_INFO, "Handle stream begin with streamId: %@, text: %@, decoder: %@", buf, 0x20u);
  }
  BOOL v12 = [MEMORY[0x263F84E90] standardInstance];
  [v12 streamBufferDuration];
  if (v13 == 0.0) {
    [v4 streamingPlaybackBufferSize];
  }
  [(VSSiriInlineTTSStreamTask *)self setBufferDurationLimit:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F84E18]);
  [(VSSiriInlineTTSStreamTask *)self setServerAudio:v14];

  uint64_t v15 = (void *)MEMORY[0x263F84E18];
  __int16 v16 = [v4 decoderStreamDescription];
  [v15 asbdFromDescription:v16];
  uint64_t v17 = [(VSSiriInlineTTSStreamTask *)self serverAudio];
  v51[0] = v53;
  v51[1] = v54;
  uint64_t v52 = v55;
  [v17 setAsbd:v51];

  uint64_t v18 = [VSAudioPlaybackService alloc];
  uint64_t v19 = [(VSSiriInlineTTSStreamTask *)self request];
  uint64_t v20 = [v19 audioSessionID];
  double v21 = [(VSSiriInlineTTSStreamTask *)self serverAudio];
  double v22 = v21;
  if (v21)
  {
    [v21 asbd];
  }
  else
  {
    uint64_t v50 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
  }
  double v23 = [(VSSiriInlineTTSStreamTask *)self request];
  uint64_t v24 = [v23 accessoryID];
  uint64_t v25 = [(VSAudioPlaybackService *)v18 initWithAudioSessionID:v20 asbd:&v48 useAVSBAR:v24 != 0];

  uint64_t v26 = [(VSSiriInlineTTSStreamTask *)self error];
  if (v26)
  {
  }
  else
  {
    double v27 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
    uint64_t v28 = [v27 errorCode];

    if (!v28)
    {
      [(VSSiriInlineTTSStreamTask *)self setPlaybackServices:v25];
      uint64_t v30 = [v4 text];
      double v31 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v31 setUtterance:v30];

      double v32 = [v4 speechSynthesisVoice];
      v33 = [v32 vsDescription];
      double v34 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v34 setVoiceAssetKey:v33];

      double v35 = [v4 speechSynthesisResource];
      double v36 = [v35 vsDescription];
      double v37 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v37 setVoiceResourceAssetKey:v36];

      uint64_t v38 = [(VSSiriInlineTTSStreamTask *)self playbackServices];
      uint64_t v39 = [v38 outputRouteInfo];
      long long v40 = [v39 audioRouteName];
      uint64_t v41 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      [v41 setAudioOutputRoute:v40];

      v42 = [(VSSiriInlineTTSStreamTask *)self playbackServices];

      if (v42) {
        goto LABEL_13;
      }
      uint64_t v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v56 = *MEMORY[0x263F08320];
      long long v57 = @"Unable to create playback service";
      double v29 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      double v44 = [v43 errorWithDomain:@"VoiceServicesErrorDomain" code:450 userInfo:v29];
      [(VSSiriInlineTTSStreamTask *)self signalNewDataWithError:v44];
      goto LABEL_19;
    }
  }
  double v29 = VSGetLogDefault();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    double v44 = [(VSSiriInlineTTSStreamTask *)self error];
    uint64_t v45 = [v44 code];
    if (v45)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v59 = v45;
      _os_log_error_impl(&dword_226CB1000, v29, OS_LOG_TYPE_ERROR, "Ignoring stream begin: error already occurred: %ld", buf, 0xCu);
    }
    else
    {
      uint64_t v46 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
      uint64_t v47 = [v46 errorCode];
      *(_DWORD *)buf = 134217984;
      uint64_t v59 = v47;
      _os_log_error_impl(&dword_226CB1000, v29, OS_LOG_TYPE_ERROR, "Ignoring stream begin: error already occurred: %ld", buf, 0xCu);
    }
LABEL_19:
  }
LABEL_13:
}

- (void)handleStreamNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(VSSiriInlineTTSStreamTask *)self instrumentMetrics];
  [v5 audioDuration];
  if (v6 <= 0.8)
  {
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F84E90] standardInstance];
    int v8 = [v7 simulateNetworkStall];

    if (v8)
    {
      uint64_t v9 = VSGetLogDefault();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v10 = [v4 object];
      int v16 = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_226CB1000, v9, OS_LOG_TYPE_INFO, "Simulate network stall is on, ignore object %@", (uint8_t *)&v16, 0xCu);
LABEL_5:

      goto LABEL_15;
    }
  }
  uint64_t v11 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  float v13 = [v4 object];
  if (isKindOfClass)
  {
    [(VSSiriInlineTTSStreamTask *)self handleBegin:v13];
  }
  else
  {
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    float v13 = [v4 object];
    if (v14)
    {
      [(VSSiriInlineTTSStreamTask *)self handleChunk:v13];
    }
    else
    {
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();

      if ((v15 & 1) == 0)
      {
        uint64_t v9 = VSGetLogDefault();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        uint64_t v10 = [v4 object];
        int v16 = 138412290;
        uint64_t v17 = v10;
        _os_log_error_impl(&dword_226CB1000, v9, OS_LOG_TYPE_ERROR, "Unknown streaming object: %@", (uint8_t *)&v16, 0xCu);
        goto LABEL_5;
      }
      float v13 = [v4 object];
      [(VSSiriInlineTTSStreamTask *)self handleEnd:v13];
    }
  }

LABEL_16:
}

- (void)dealloc
{
  uint64_t v3 = +[VSInlineStreamService sharedService];
  id v4 = [(VSSiriInlineTTSStreamTask *)self streamID];
  [v3 removeStreamId:v4];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)VSSiriInlineTTSStreamTask;
  [(VSSiriInlineTTSStreamTask *)&v6 dealloc];
}

- (VSSiriInlineTTSStreamTask)initWithRequest:(id)a3 withStreamID:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VSSiriInlineTTSStreamTask;
  uint64_t v9 = [(VSSiriInlineTTSStreamTask *)&v32 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_streamID, a4);
    uint64_t v11 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x263F84E28]);
    instrumentMetrics = v10->_instrumentMetrics;
    v10->_instrumentMetrics = v11;

    if ([v7 requestCreatedTimestamp])
    {
      uint64_t v13 = [v7 requestCreatedTimestamp];
    }
    else
    {
      char v14 = VSGetLogDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v14, OS_LOG_TYPE_ERROR, "Using timestamp inside voiced for Stream task", buf, 2u);
      }

      uint64_t v13 = mach_absolute_time();
    }
    [(VSInstrumentMetrics *)v10->_instrumentMetrics setRequestCreatedTimestamp:v13];
    char v15 = VSGetLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = [(VSSiriInlineTTSStreamTask *)v10 instrumentMetrics];
      uint64_t v17 = [v16 requestCreatedTimestamp];
      streamID = v10->_streamID;
      *(_DWORD *)buf = 134218242;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      double v36 = streamID;
      _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_INFO, "Created Stream task %llu: streamID %@", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    finalTimingInfo = v10->_finalTimingInfo;
    v10->_finalTimingInfo = (NSMutableArray *)v19;

    double v21 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    refreshTimeoutCondition = v10->_refreshTimeoutCondition;
    v10->_refreshTimeoutCondition = v21;

    double v23 = [MEMORY[0x263F84E90] standardInstance];
    [v23 serverTTSTimeout];
    if (v24 == 0.0)
    {
      uint64_t v25 = +[VSSiriServerConfiguration defaultConfig];
      uint64_t v26 = [v7 clientBundleIdentifier];
      [v25 timeoutForAppId:v26];
      v10->_timeoutValue = v27;
    }
    else
    {
      v10->_timeoutValue = v24;
    }

    -[VSInstrumentMetrics setCanUseServerTTS:](v10->_instrumentMetrics, "setCanUseServerTTS:", [v7 canUseServerTTS]);
    [(VSInstrumentMetrics *)v10->_instrumentMetrics setIsServerStreamTTS:1];
    [(VSInstrumentMetrics *)v10->_instrumentMetrics setIsServerTTS:1];
    [(VSInstrumentMetrics *)v10->_instrumentMetrics setIsSpeechRequest:1];
    [(VSInstrumentMetrics *)v10->_instrumentMetrics setSourceOfTTS:3];
    uint64_t v28 = [v7 clientBundleIdentifier];
    [(VSInstrumentMetrics *)v10->_instrumentMetrics setClientBundleIdentifier:v28];

    double v29 = [[VSDeviceTTSCore alloc] initWithRequest:v7];
    deviceTTSCore = v10->_deviceTTSCore;
    v10->_deviceTTSCore = v29;

    [(VSDeviceTTSCore *)v10->_deviceTTSCore setDelegate:v10];
    [(VSDeviceTTSCore *)v10->_deviceTTSCore setInstrumentMetrics:v10->_instrumentMetrics];
  }

  return v10;
}

- (VSSiriInlineTTSStreamTask)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end