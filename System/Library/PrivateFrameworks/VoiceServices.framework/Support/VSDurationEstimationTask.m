@interface VSDurationEstimationTask
+ (id)shortTermCachedEngineForVoice:(id)a3 voiceResource:(id)a4;
+ (id)shortTermCachedEngines;
- (NSError)error;
- (VSDeviceTTSCore)deviceCore;
- (VSDurationEstimationTask)init;
- (VSDurationEstimationTask)initWithRequest:(id)a3;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSSpeechRequest)request;
- (double)estimatedDuration;
- (id)delegate;
- (id)taskHash;
- (void)cancel;
- (void)main;
- (void)setDeviceCore:(id)a3;
- (void)setError:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation VSDurationEstimationTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCore, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setDeviceCore:(id)a3
{
}

- (VSDeviceTTSCore)deviceCore
{
  return self->_deviceCore;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (double)estimatedDuration
{
  return self->_estimatedDuration;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setRequest:(id)a3
{
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (id)taskHash
{
  return &stru_26DAD0E18;
}

- (id)delegate
{
  return 0;
}

- (void)cancel
{
  v3 = [(VSDurationEstimationTask *)self deviceCore];
  [v3 cancel];

  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:MEMORY[0x263EFFA78]];
  [(VSDurationEstimationTask *)self setError:v4];
}

- (void)main
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v3 = [(VSDurationEstimationTask *)self deviceCore];
  id v4 = [v3 selectedVoice];
  v5 = [(VSDurationEstimationTask *)self deviceCore];
  v6 = [v5 selectedVoiceResource];
  v7 = +[VSDurationEstimationTask shortTermCachedEngineForVoice:v4 voiceResource:v6];
  v8 = [(VSDurationEstimationTask *)self deviceCore];
  [v8 setEngine:v7];

  v9 = [(VSDurationEstimationTask *)self deviceCore];
  v10 = [v9 engine];

  if (!v10)
  {
    v11 = [MEMORY[0x263F84E40] sharedManager];
    v12 = [(VSDurationEstimationTask *)self request];
    v13 = [v12 languageCode];
    v14 = [(VSDurationEstimationTask *)self request];
    v15 = [v14 voiceName];
    v16 = [v11 selectVoiceForLang:v13 name:v15 type:1 gender:0 footprint:1];

    id v17 = objc_alloc(MEMORY[0x263F84E88]);
    v18 = [v16 voicePath];
    v19 = (void *)[v17 initWithVoicePath:v18 resourcePath:0];
    v20 = [(VSDurationEstimationTask *)self deviceCore];
    [v20 setEngine:v19];
  }
  v21 = [(VSDurationEstimationTask *)self deviceCore];
  v22 = [v21 engine];

  if (!v22)
  {
    v27 = VSGetLogDefault();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      return;
    }
    v48 = [(VSDurationEstimationTask *)self request];
    *(_DWORD *)buf = 138412290;
    double v52 = *(double *)&v48;
    _os_log_error_impl(&dword_226CB1000, v27, OS_LOG_TYPE_ERROR, "Unable to create engine for request %@", buf, 0xCu);
LABEL_20:

    goto LABEL_10;
  }
  v23 = [(VSDurationEstimationTask *)self deviceCore];
  [v23 start];

  if ([(VSDurationEstimationTask *)self isCancelled]) {
    return;
  }
  v24 = [(VSDurationEstimationTask *)self deviceCore];
  v25 = [v24 error];

  if (!v25)
  {
    v28 = [(VSDurationEstimationTask *)self deviceCore];
    v29 = [v28 engine];

    if (v29)
    {
      v30 = NSString;
      v31 = [(VSDurationEstimationTask *)self deviceCore];
      v32 = [v31 selectedVoice];
      v33 = [v32 key];
      v34 = [(VSDurationEstimationTask *)self deviceCore];
      v35 = [v34 selectedVoiceResource];
      v36 = [v35 key];
      v37 = [v30 stringWithFormat:@"cached_engine_%@_%@", v33, v36];

      v38 = +[VSDurationEstimationTask shortTermCachedEngines];
      v39 = [(VSDurationEstimationTask *)self deviceCore];
      v40 = [v39 engine];
      [v38 setObject:v40 forKey:v37 timeToLive:30.0];
    }
    v41 = [(VSDurationEstimationTask *)self deviceCore];
    v42 = [v41 streamAudio];
    v43 = [(VSDurationEstimationTask *)self deviceCore];
    v44 = v43;
    if (v42) {
      [v43 streamAudio];
    }
    else {
    v45 = [v43 compressedAudio];
    }
    [v45 duration];
    self->_double estimatedDuration = v46;

    v27 = VSGetLogDefault();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    double estimatedDuration = self->_estimatedDuration;
    v48 = [(VSDurationEstimationTask *)self request];
    v49 = [v48 utterance];
    *(_DWORD *)buf = 134218242;
    double v52 = estimatedDuration;
    __int16 v53 = 2112;
    v54 = v49;
    _os_log_impl(&dword_226CB1000, v27, OS_LOG_TYPE_INFO, "Estimated duration: %.2f, for utterance: %@", buf, 0x16u);

    goto LABEL_20;
  }
  self->_double estimatedDuration = 0.0;
  id v50 = [(VSDurationEstimationTask *)self deviceCore];
  v26 = [v50 error];
  [(VSDurationEstimationTask *)self setError:v26];
}

- (VSDurationEstimationTask)initWithRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VSDurationEstimationTask;
  v6 = [(VSDurationEstimationTask *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x263F84E28]);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v8;

    if ([v5 requestCreatedTimestamp])
    {
      uint64_t v10 = [v5 requestCreatedTimestamp];
    }
    else
    {
      v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_INFO, "Using timestamp inside voiced for Estimation task", buf, 2u);
      }

      uint64_t v10 = mach_absolute_time();
    }
    [(VSInstrumentMetrics *)v7->_instrumentMetrics setRequestCreatedTimestamp:v10];
    v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [(VSDurationEstimationTask *)v7 instrumentMetrics];
      uint64_t v14 = [v13 requestCreatedTimestamp];
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v14;
      _os_log_impl(&dword_226CB1000, v12, OS_LOG_TYPE_INFO, "Created Estimation task %llu", buf, 0xCu);
    }
    v15 = [[VSDeviceTTSCore alloc] initWithRequest:v5];
    deviceCore = v7->_deviceCore;
    v7->_deviceCore = v15;
  }
  return v7;
}

- (VSDurationEstimationTask)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)shortTermCachedEngineForVoice:(id)a3 voiceResource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[VSDurationEstimationTask shortTermCachedEngines];
  v8 = NSString;
  v9 = [v6 key];

  uint64_t v10 = [v5 key];

  v11 = [v8 stringWithFormat:@"cached_engine_%@_%@", v9, v10];

  v12 = [v7 objectForKey:v11];

  return v12;
}

+ (id)shortTermCachedEngines
{
  if (shortTermCachedEngines_onceToken != -1) {
    dispatch_once(&shortTermCachedEngines_onceToken, &__block_literal_global_135);
  }
  id v2 = (void *)shortTermCachedEngines_shortTermCachedEngines;
  return v2;
}

uint64_t __50__VSDurationEstimationTask_shortTermCachedEngines__block_invoke()
{
  shortTermCachedEngines_shortTermCachedEngines = objc_alloc_init(VSShortTermCache);
  return MEMORY[0x270F9A758]();
}

@end