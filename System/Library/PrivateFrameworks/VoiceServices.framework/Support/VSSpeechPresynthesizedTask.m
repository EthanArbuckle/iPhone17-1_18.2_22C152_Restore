@interface VSSpeechPresynthesizedTask
- (AudioStreamBasicDescription)asbd;
- (BOOL)isSpeaking;
- (NSError)error;
- (NSMutableData)audioData;
- (NSString)description;
- (VSAudioPlaybackService)playbackService;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSPresynthesizedAudioRequest)request;
- (VSSiriInstrumentation)siriInstrumentation;
- (VSSpeechPresynthesizedTask)init;
- (VSSpeechPresynthesizedTask)initWithRequest:(id)a3;
- (VSSpeechServiceDelegate)delegate;
- (id)audioPowerProvider;
- (id)taskHash;
- (void)cancel;
- (void)main;
- (void)reportFinish;
- (void)reportSpeechStart;
- (void)resume;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setPlaybackService:(id)a3;
- (void)setSiriInstrumentation:(id)a3;
- (void)suspend;
@end

@implementation VSSpeechPresynthesizedTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setSiriInstrumentation:(id)a3
{
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  uint64_t v3 = *(void *)&a3->mBitsPerChannel;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&self->_asbd.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(void *)&self->_asbd.mBitsPerChannel = v3;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[8].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[7].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[8].mBytesPerPacket;
  return self;
}

- (void)setAudioData:(id)a3
{
}

- (NSMutableData)audioData
{
  return self->_audioData;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setPlaybackService:(id)a3
{
}

- (VSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setDelegate:(id)a3
{
}

- (VSSpeechServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechServiceDelegate *)WeakRetained;
}

- (VSPresynthesizedAudioRequest)request
{
  return self->_request;
}

- (id)audioPowerProvider
{
  v2 = [(VSSpeechPresynthesizedTask *)self playbackService];
  long long v3 = [v2 audioPowerProvider];

  return v3;
}

- (id)taskHash
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- (void)reportFinish
{
  v65[1] = *MEMORY[0x263EF8340];
  long long v3 = [(VSSpeechPresynthesizedTask *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(VSSpeechPresynthesizedTask *)self delegate];
    v6 = [(VSSpeechPresynthesizedTask *)self request];
    v7 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
    v8 = [(VSSpeechPresynthesizedTask *)self error];
    [v5 audioRequest:v6 didReportInstrumentMetrics:v7 error:v8];
  }
  v9 = [(VSSpeechPresynthesizedTask *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(VSSpeechPresynthesizedTask *)self delegate];
    v12 = [(VSSpeechPresynthesizedTask *)self request];
    v13 = [(VSSpeechPresynthesizedTask *)self error];
    v14 = [(VSSpeechPresynthesizedTask *)self error];
    [v11 audioRequest:v12 didStopAtEnd:v13 == 0 error:v14];
  }
  uint64_t v15 = [(VSSpeechPresynthesizedTask *)self error];
  if (!v15) {
    goto LABEL_9;
  }
  v16 = (void *)v15;
  v17 = [(VSSpeechPresynthesizedTask *)self error];
  if ([v17 code] == 400)
  {

LABEL_9:
    v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      uint64_t v21 = [v54 requestCreatedTimestamp];
      if ([(VSSpeechPresynthesizedTask *)self isCancelled]) {
        v22 = @"Cancelled";
      }
      else {
        v22 = @"Finished";
      }
      v23 = [(VSSpeechPresynthesizedTask *)self request];
      uint64_t v24 = [v23 text];
      v25 = (void *)v24;
      if (v24) {
        v26 = (__CFString *)v24;
      }
      else {
        v26 = &stru_26DAD0E18;
      }
      v55 = @"audio_duration";
      v27 = NSNumber;
      v28 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v28 audioDuration];
      v29 = objc_msgSend(v27, "numberWithDouble:");
      v56 = v29;
      v30 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      *(_DWORD *)buf = 134218754;
      uint64_t v58 = v21;
      __int16 v59 = 2112;
      v60 = v22;
      __int16 v61 = 2112;
      v62 = v26;
      __int16 v63 = 2114;
      v64 = v30;
      _os_log_impl(&dword_226CB1000, v20, OS_LOG_TYPE_DEFAULT, "Audio task %llu: %@ speaking utterance '%@', %{public}@", buf, 0x2Au);
    }
    int v31 = [(VSSpeechPresynthesizedTask *)self isCancelled];
    v32 = [(VSSpeechPresynthesizedTask *)self siriInstrumentation];
    v33 = v32;
    if (v31)
    {
      [v32 instrumentSpeechCancelled];
    }
    else
    {
      v34 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v34 audioDuration];
      double v36 = v35;
      v37 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v37 ttsSynthesisLatency];
      double v39 = v38;
      v40 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v40 cappedRealTimeFactor];
      double v42 = v41;
      v43 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      uint64_t v44 = [v43 promptCount];
      v45 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      objc_msgSend(v33, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v44, objc_msgSend(v45, "errorCode"), v36, v39, v42);
    }
    goto LABEL_23;
  }
  v18 = [(VSSpeechPresynthesizedTask *)self error];
  uint64_t v19 = [v18 code];

  if (v19 == 501) {
    goto LABEL_9;
  }
  v46 = VSGetLogDefault();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v51 = [(VSSpeechPresynthesizedTask *)self request];
    uint64_t v52 = [v51 requestCreatedTimestamp];
    v53 = [(VSSpeechPresynthesizedTask *)self error];
    *(_DWORD *)buf = 134218242;
    uint64_t v58 = v52;
    __int16 v59 = 2112;
    v60 = v53;
    _os_log_error_impl(&dword_226CB1000, v46, OS_LOG_TYPE_ERROR, "Error in audio task %llu, error: %@", buf, 0x16u);
  }
  v33 = [(VSSpeechPresynthesizedTask *)self siriInstrumentation];
  v47 = NSNumber;
  v48 = [(VSSpeechPresynthesizedTask *)self error];
  v49 = objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v48, "code"));
  v65[0] = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
  [v33 instrumentSpeechFailedWithErrorCodes:v50];

LABEL_23:
}

- (void)reportSpeechStart
{
  long long v3 = [(VSSpeechPresynthesizedTask *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(VSSpeechPresynthesizedTask *)self delegate];
    v6 = [(VSSpeechPresynthesizedTask *)self request];
    [v5 audioRequestDidStart:v6];
  }
  id v13 = [(VSSpeechPresynthesizedTask *)self siriInstrumentation];
  v7 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
  [v7 timeToSpeakLatency];
  double v9 = v8;
  char v10 = [(VSSpeechPresynthesizedTask *)self playbackService];
  v11 = [v10 outputRouteInfo];
  LOBYTE(v12) = 0;
  [v13 instrumentSpeechStartedWithSource:7 customerPerceivedLatency:v11 audioOutputRoute:0 voiceType:0 voiceFootprint:0 voiceVersion:0 resourceVersion:v9 isWhisper:v12];
}

- (void)resume
{
  id v3 = [(VSSpeechPresynthesizedTask *)self playbackService];
  id v2 = (id)[v3 start];
}

- (void)suspend
{
  id v2 = [(VSSpeechPresynthesizedTask *)self playbackService];
  [v2 pause];
}

- (void)cancel
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:0];
  [(VSSpeechPresynthesizedTask *)self setError:v3];

  if (([(VSSpeechPresynthesizedTask *)self isExecuting] & 1) != 0
    || ([(VSSpeechPresynthesizedTask *)self isCancelled] & 1) != 0
    || ([(VSSpeechPresynthesizedTask *)self isFinished] & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)VSSpeechPresynthesizedTask;
    [(VSSpeechPresynthesizedTask *)&v7 cancel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VSSpeechPresynthesizedTask;
    [(VSSpeechPresynthesizedTask *)&v8 cancel];
    [(VSSpeechPresynthesizedTask *)self reportFinish];
  }
  char v4 = [(VSSpeechPresynthesizedTask *)self playbackService];
  [v4 stop];

  v5 = [(VSSpeechPresynthesizedTask *)self delegate];
  v6 = [(VSSpeechPresynthesizedTask *)self request];
  [v5 audioRequest:v6 didStopAtEnd:0 error:0];
}

- (BOOL)isSpeaking
{
  return 1;
}

- (void)main
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(VSSpeechPresynthesizedTask *)self request];
    *(_DWORD *)buf = 138412290;
    v62 = v4;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "Speaking pre-synthesized audio: %@", buf, 0xCu);
  }
  uint64_t v5 = mach_absolute_time();
  v6 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
  [v6 setSynthesisBeginTimestamp:v5];

  objc_super v7 = +[VSSiriServerConfiguration defaultConfig];
  objc_super v8 = [v7 experimentIdentifier];
  double v9 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
  [v9 setExperimentIdentifier:v8];

  char v10 = (void *)MEMORY[0x263F84E18];
  v11 = [(VSSpeechPresynthesizedTask *)self request];
  uint64_t v12 = [v10 audioDataFromPresynthesisRequest:v11];

  uint64_t v13 = mach_absolute_time();
  v14 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
  [v14 setSynthesisEndTimestamp:v13];

  if (v12)
  {
    [v12 asbd];
  }
  else
  {
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
  }
  v52[0] = v54;
  v52[1] = v55;
  uint64_t v53 = v56;
  [(VSSpeechPresynthesizedTask *)self setAsbd:v52];
  uint64_t v15 = [VSAudioPlaybackService alloc];
  v16 = [(VSSpeechPresynthesizedTask *)self request];
  uint64_t v17 = [v16 audioSessionID];
  [(VSSpeechPresynthesizedTask *)self asbd];
  v18 = [(VSSpeechPresynthesizedTask *)self request];
  uint64_t v19 = [v18 accessoryID];
  v20 = [(VSAudioPlaybackService *)v15 initWithAudioSessionID:v17 asbd:v51 useAVSBAR:v19 != 0];
  [(VSSpeechPresynthesizedTask *)self setPlaybackService:v20];

  uint64_t v21 = [(VSSpeechPresynthesizedTask *)self playbackService];
  v22 = [v21 outputRouteInfo];
  v23 = [v22 audioRouteName];
  uint64_t v24 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
  [v24 setAudioOutputRoute:v23];

  v25 = [(VSSpeechPresynthesizedTask *)self playbackService];

  if (!v25)
  {
    v46 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = *MEMORY[0x263F08338];
    v60 = @"Can't create VSAudioPlaybackService";
    v47 = NSDictionary;
    v48 = &v60;
    v49 = &v59;
LABEL_13:
    v45 = [v47 dictionaryWithObjects:v48 forKeys:v49 count:1];
    v50 = [v46 errorWithDomain:@"VoiceServicesErrorDomain" code:0 userInfo:v45];
    [(VSSpeechPresynthesizedTask *)self setError:v50];

    goto LABEL_14;
  }
  if (!v12)
  {
    v46 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F08320];
    uint64_t v58 = @"Can't decode audio data";
    v47 = NSDictionary;
    v48 = &v58;
    v49 = &v57;
    goto LABEL_13;
  }
  if (([(VSSpeechPresynthesizedTask *)self isCancelled] & 1) == 0)
  {
    v26 = [(VSSpeechPresynthesizedTask *)self error];

    if (!v26)
    {
      uint64_t v27 = mach_absolute_time();
      v28 = [(VSSpeechPresynthesizedTask *)self playbackService];
      id v29 = (id)[v28 start];

      uint64_t v30 = mach_absolute_time() - v27;
      int v31 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v31 setAudioStartTimestampDiffs:v30];

      v32 = [(VSSpeechPresynthesizedTask *)self playbackService];
      v33 = [v12 audioData];
      uint64_t v34 = [v12 packetCount];
      double v35 = [v12 packetDescriptions];
      [v32 enqueue:v33 packetCount:v34 packetDescriptions:v35];

      uint64_t v36 = mach_absolute_time();
      v37 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v37 setSpeechBeginTimestamp:v36];

      [(VSSpeechPresynthesizedTask *)self reportSpeechStart];
      double v38 = [(VSSpeechPresynthesizedTask *)self playbackService];
      [v38 flushAndStop];

      double v39 = [(VSSpeechPresynthesizedTask *)self playbackService];
      v40 = [v39 error];
      [(VSSpeechPresynthesizedTask *)self setError:v40];

      uint64_t v41 = mach_absolute_time();
      double v42 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v42 setSpeechEndTimestamp:v41];

      [v12 duration];
      double v44 = v43;
      v45 = [(VSSpeechPresynthesizedTask *)self instrumentMetrics];
      [v45 setAudioDuration:v44];
LABEL_14:
    }
  }
  [(VSSpeechPresynthesizedTask *)self reportFinish];
}

- (NSString)description
{
  id v3 = NSString;
  char v4 = objc_msgSend(NSNumber, "numberWithBool:", -[VSSpeechPresynthesizedTask isExecuting](self, "isExecuting"));
  uint64_t v5 = [v3 stringWithFormat:@"task: inprogress %@, request: %@", v4, self->_request];

  return (NSString *)v5;
}

- (VSSpeechPresynthesizedTask)initWithRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSSpeechPresynthesizedTask;
  v6 = [(VSSpeechPresynthesizedTask *)&v17 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    objc_super v8 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x263F84E28]);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v8;

    [(VSInstrumentMetrics *)v7->_instrumentMetrics setSourceOfTTS:7];
    if ([v5 requestCreatedTimestamp])
    {
      uint64_t v10 = [v5 requestCreatedTimestamp];
    }
    else
    {
      v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v11, OS_LOG_TYPE_ERROR, "Using timestamp inside voiced for Presynthesized task", buf, 2u);
      }

      uint64_t v10 = mach_absolute_time();
    }
    [(VSInstrumentMetrics *)v7->_instrumentMetrics setRequestCreatedTimestamp:v10];
    uint64_t v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(VSSpeechPresynthesizedTask *)v7 instrumentMetrics];
      uint64_t v14 = [v13 requestCreatedTimestamp];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v14;
      _os_log_impl(&dword_226CB1000, v12, OS_LOG_TYPE_INFO, "Created Presynthesized Task %llu", buf, 0xCu);
    }
    uint64_t v15 = [v5 clientBundleIdentifier];
    [(VSInstrumentMetrics *)v7->_instrumentMetrics setClientBundleIdentifier:v15];

    kdebug_trace();
  }

  return v7;
}

- (VSSpeechPresynthesizedTask)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end