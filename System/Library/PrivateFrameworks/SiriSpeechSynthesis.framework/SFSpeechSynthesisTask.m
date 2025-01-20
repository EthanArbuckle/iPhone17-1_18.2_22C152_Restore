@interface SFSpeechSynthesisTask
- (AudioStreamBasicDescription)asbd;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isSpeakRequest;
- (BOOL)isSpeaking;
- (NSCondition)synthesisStateCondition;
- (NSError)error;
- (NSMutableArray)bufferedAudioData;
- (NSMutableArray)bufferedAudios;
- (NSMutableArray)phonemeSequence;
- (NSString)taskIdentifer;
- (SFSSAudioPlaybackService)playbackService;
- (SFSSInstrumentMetrics)instrumentMetrics;
- (SFSSResourceAsset)resourceAsset;
- (SFSSVoiceAsset)voiceAsset;
- (SFSpeechSynthesisRequest)request;
- (SFSpeechSynthesisTask)initWithRequest:(id)a3;
- (SFSpeechSynthesisTaskPrivateDelegate)delegate;
- (double)audioPlaybackBufferDuration;
- (double)bufferedDuration;
- (id)cancel;
- (id)pause;
- (id)resume;
- (int64_t)speakState;
- (int64_t)synthesisState;
- (void)cancelTask;
- (void)handleSynthesisBegin:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4 audioPlaybackBufferDuration:(double)a5 voiceAsset:(id)a6 resourceAsset:(id)a7;
- (void)handleSynthesisChunks:(id)a3;
- (void)handleSynthesisEnd:(id)a3;
- (void)handleSynthesisEndCallback;
- (void)handleSynthesisFrontendFeaturePhoneme:(id)a3;
- (void)handleSynthesisInit;
- (void)initSpeak:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioPlaybackBufferDuration:(double)a3;
- (void)setBufferedAudioData:(id)a3;
- (void)setBufferedAudios:(id)a3;
- (void)setBufferedDuration:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorIfNotNull:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setIsSpeaking:(BOOL)a3;
- (void)setPhonemeSequence:(id)a3;
- (void)setPlaybackService:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResourceAsset:(id)a3;
- (void)setSpeakState:(int64_t)a3;
- (void)setSynthesisState:(int64_t)a3;
- (void)setSynthesisStateCondition:(id)a3;
- (void)setTaskIdentifer:(id)a3;
- (void)setVoiceAsset:(id)a3;
- (void)start:(id)a3;
- (void)startSpeakIfValid;
- (void)waitForSpeakFinish;
@end

@implementation SFSpeechSynthesisTask

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_phonemeSequence, 0);
  objc_storeStrong((id *)&self->_bufferedAudioData, 0);
  objc_storeStrong((id *)&self->_bufferedAudios, 0);
  objc_storeStrong((id *)&self->_taskIdentifer, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_resourceAsset, 0);
  objc_storeStrong((id *)&self->_voiceAsset, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_synthesisStateCondition, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SFSpeechSynthesisTaskPrivateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFSpeechSynthesisTaskPrivateDelegate *)WeakRetained;
}

- (void)setSynthesisState:(int64_t)a3
{
  self->_synthesisState = a3;
}

- (int64_t)synthesisState
{
  return self->_synthesisState;
}

- (void)setSpeakState:(int64_t)a3
{
  self->_speakState = a3;
}

- (int64_t)speakState
{
  return self->_speakState;
}

- (void)setPhonemeSequence:(id)a3
{
}

- (NSMutableArray)phonemeSequence
{
  return self->_phonemeSequence;
}

- (void)setBufferedAudioData:(id)a3
{
}

- (NSMutableArray)bufferedAudioData
{
  return self->_bufferedAudioData;
}

- (void)setBufferedAudios:(id)a3
{
}

- (NSMutableArray)bufferedAudios
{
  return self->_bufferedAudios;
}

- (void)setBufferedDuration:(double)a3
{
  self->_bufferedDuration = a3;
}

- (double)bufferedDuration
{
  return self->_bufferedDuration;
}

- (void)setTaskIdentifer:(id)a3
{
}

- (NSString)taskIdentifer
{
  return self->_taskIdentifer;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (SFSSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setResourceAsset:(id)a3
{
}

- (SFSSResourceAsset)resourceAsset
{
  return self->_resourceAsset;
}

- (void)setVoiceAsset:(id)a3
{
}

- (SFSSVoiceAsset)voiceAsset
{
  return self->_voiceAsset;
}

- (void)setPlaybackService:(id)a3
{
}

- (SFSSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setRequest:(id)a3
{
}

- (SFSpeechSynthesisRequest)request
{
  return self->_request;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[4].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[4].mBytesPerPacket;
  return self;
}

- (void)setAudioPlaybackBufferDuration:(double)a3
{
  self->_audioPlaybackBufferDuration = a3;
}

- (double)audioPlaybackBufferDuration
{
  return self->_audioPlaybackBufferDuration;
}

- (void)setSynthesisStateCondition:(id)a3
{
}

- (NSCondition)synthesisStateCondition
{
  return self->_synthesisStateCondition;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void)setIsSpeaking:(BOOL)a3
{
  self->_isSpeaking = a3;
}

- (void)setErrorIfNotNull:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SFSpeechSynthesisTask *)self error];

  if (!v5)
  {
    [(SFSpeechSynthesisTask *)self setError:v4];
    v6 = SFSSGetLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [(SFSpeechSynthesisTask *)self error];
      int v8 = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_22B575000, v6, OS_LOG_TYPE_DEBUG, "Set Error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)isSpeakRequest
{
  v2 = [(SFSpeechSynthesisTask *)self request];
  BOOL v3 = [v2 type] == 0;

  return v3;
}

- (BOOL)isSpeaking
{
  return [(SFSpeechSynthesisTask *)self speakState] == 1;
}

- (BOOL)isCancelled
{
  if ([(SFSpeechSynthesisTask *)self isSpeakRequest]) {
    return [(SFSpeechSynthesisTask *)self speakState] == 3;
  }
  else {
    return [(SFSpeechSynthesisTask *)self synthesisState] == 4;
  }
}

- (BOOL)isFinished
{
  if ([(SFSpeechSynthesisTask *)self isSpeakRequest]) {
    return [(SFSpeechSynthesisTask *)self speakState] == 4;
  }
  else {
    return [(SFSpeechSynthesisTask *)self synthesisState] == 3;
  }
}

- (void)handleSynthesisFrontendFeaturePhoneme:(id)a3
{
  id v4 = a3;
  id v5 = [(SFSpeechSynthesisTask *)self phonemeSequence];
  [v5 addObjectsFromArray:v4];
}

- (void)handleSynthesisEndCallback
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "handleSynthesisEndCallback", buf, 2u);
  }

  id v4 = [(SFSpeechSynthesisTask *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = +[SFSSAudioConverter sharedInstance];
    v7 = [(SFSpeechSynthesisTask *)self bufferedAudioData];
    [(SFSpeechSynthesisTask *)self asbd];
    id v24 = 0;
    *(_OWORD *)buf = SFSSAudioFormat48khzPCM;
    long long v27 = unk_22B64D1A8;
    uint64_t v28 = 16;
    int v8 = [v6 convertChunks:v7 srcAsbd:v25 dstAsbd:buf outError:&v24];
    id v9 = v24;

    if (v9)
    {
      uint64_t v10 = SFSSGetLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v9;
        _os_log_impl(&dword_22B575000, v10, OS_LOG_TYPE_INFO, "Audio converter error: %@", buf, 0xCu);
      }

      v11 = [(SFSpeechSynthesisTask *)self error];

      if (!v11) {
        [(SFSpeechSynthesisTask *)self setError:v9];
      }
    }
    v12 = [(SFSpeechSynthesisTask *)self delegate];
    *(_OWORD *)buf = SFSSAudioFormat48khzPCM;
    long long v27 = unk_22B64D1A8;
    uint64_t v28 = 16;
    [v12 speechSynthesisTask:self didFinishSysthesisAudio:buf audioData:v8];
  }
  v13 = [(SFSpeechSynthesisTask *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(SFSpeechSynthesisTask *)self delegate];
    v16 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
    v17 = [v16 voiceAssetKey];
    v18 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
    v19 = [v18 resourceAssetKey];
    [v15 speechSynthesisTask:self didFinishWithVoiceKey:v17 resourceKey:v19];
  }
  v20 = [(SFSpeechSynthesisTask *)self delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    v22 = [(SFSpeechSynthesisTask *)self delegate];
    v23 = [(SFSpeechSynthesisTask *)self phonemeSequence];
    [v22 speechSynthesisTask:self didFinishWithPhoneme:v23];
  }
}

- (void)handleSynthesisEnd:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = SFSSGetLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "handleSynthesisEnd", buf, 2u);
  }

  [(SFSpeechSynthesisTask *)self setErrorIfNotNull:v4];
  uint64_t v6 = mach_absolute_time();
  v7 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v7 setSynthesisEndTimestamp:v6];

  int v8 = [(SFSpeechSynthesisTask *)self error];
  if (!v8)
  {
    int v8 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
    if ([(SFSSCacheItem *)v8 sourceOfTTS] != 1)
    {
      id v9 = +[SFSpeechSynthesisInternalSetting sharedInstance];
      char v10 = [v9 disableCaching];

      if (v10) {
        goto LABEL_10;
      }
      v11 = SFSSGetLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [(SFSpeechSynthesisTask *)self taskIdentifer];
        *(_DWORD *)buf = 138412290;
        v41 = v12;
        _os_log_impl(&dword_22B575000, v11, OS_LOG_TYPE_INFO, "Cache Audio for task: %@", buf, 0xCu);
      }
      v13 = [SFSSCacheItem alloc];
      v38 = [(SFSpeechSynthesisTask *)self request];
      uint64_t v14 = [v38 text];
      v37 = [(SFSpeechSynthesisTask *)self request];
      v15 = [v37 voiceName];
      v16 = [(SFSpeechSynthesisTask *)self voiceAsset];
      v17 = [v16 key];
      v18 = [(SFSpeechSynthesisTask *)self resourceAsset];
      v19 = [v18 key];
      [(SFSpeechSynthesisTask *)self asbd];
      v20 = [(SFSpeechSynthesisTask *)self bufferedAudios];
      char v21 = (void *)[v20 copy];
      v22 = v13;
      v23 = (void *)v14;
      int v8 = [(SFSSCacheItem *)v22 initWithText:v14 voiceName:v15 voiceKey:v17 resourceKey:v19 asbd:v39 rawAudio:v21];

      id v24 = +[SFSSCachingService sharedInstance];
      v25 = [(SFSSCacheItem *)v8 key];
      [v24 setObject:v8 forKey:v25];
    }
  }

LABEL_10:
  [(SFSpeechSynthesisTask *)self setSynthesisState:3];
  if ([(SFSpeechSynthesisTask *)self isSpeakRequest])
  {
    [(SFSpeechSynthesisTask *)self startSpeakIfValid];
    [(SFSpeechSynthesisTask *)self waitForSpeakFinish];
    uint64_t v26 = mach_absolute_time();
    long long v27 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
    [v27 setSpeakEndTimestamp:v26];
  }
  [(SFSpeechSynthesisTask *)self bufferedDuration];
  double v29 = v28;
  v30 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v30 setAudioDuration:v29];

  v31 = [(SFSpeechSynthesisTask *)self error];
  uint64_t v32 = [v31 code];
  v33 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v33 setErrorCode:v32];

  v34 = SFSSGetLogObject();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
    v36 = [v35 description];
    *(_DWORD *)buf = 138412290;
    v41 = v36;
    _os_log_impl(&dword_22B575000, v34, OS_LOG_TYPE_INFO, "InstrumentMetrics: %@", buf, 0xCu);
  }
  [(SFSpeechSynthesisTask *)self handleSynthesisEndCallback];
}

- (void)handleSynthesisChunks:(id)a3
{
  id v4 = a3;
  char v5 = [(SFSpeechSynthesisTask *)self bufferedAudios];
  [v5 addObject:v4];

  uint64_t v6 = [SFSSAudioData alloc];
  [(SFSpeechSynthesisTask *)self asbd];
  v7 = [(SFSSAudioData *)v6 initWithASBD:v20 rawData:v4];

  int v8 = [(SFSpeechSynthesisTask *)self bufferedAudioData];
  [v8 addObject:v7];

  [(SFSSAudioData *)v7 duration];
  double v10 = v9;
  [(SFSpeechSynthesisTask *)self bufferedDuration];
  [(SFSpeechSynthesisTask *)self setBufferedDuration:v10 + v11];
  if ([(SFSpeechSynthesisTask *)self isSpeakRequest])
  {
    v12 = [(SFSpeechSynthesisTask *)self playbackService];
    v13 = [(SFSSAudioData *)v7 audioData];
    uint64_t v14 = [(SFSSAudioData *)v7 packetCount];
    v15 = [(SFSSAudioData *)v7 packetDescriptions];
    v16 = [v12 enqueue:v13 packetCount:v14 packetDescriptions:v15];
    [(SFSpeechSynthesisTask *)self setErrorIfNotNull:v16];

    [(SFSpeechSynthesisTask *)self bufferedDuration];
    double v18 = v17;
    [(SFSpeechSynthesisTask *)self audioPlaybackBufferDuration];
    if (v18 >= v19)
    {
      [(SFSpeechSynthesisTask *)self setSynthesisState:2];
      [(SFSpeechSynthesisTask *)self startSpeakIfValid];
    }
  }
}

- (void)handleSynthesisBegin:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4 audioPlaybackBufferDuration:(double)a5 voiceAsset:(id)a6 resourceAsset:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v13 = a6;
  [(SFSpeechSynthesisTask *)self setAudioPlaybackBufferDuration:a5];
  long long v14 = *(_OWORD *)&a4->mBytesPerPacket;
  v29[0] = *(_OWORD *)&a4->mSampleRate;
  v29[1] = v14;
  uint64_t v30 = *(void *)&a4->mBitsPerChannel;
  [(SFSpeechSynthesisTask *)self setAsbd:v29];
  [(SFSpeechSynthesisTask *)self setVoiceAsset:v13];

  [(SFSpeechSynthesisTask *)self setResourceAsset:v12];
  v15 = SFSSGetLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [(SFSpeechSynthesisTask *)self voiceAsset];
    double v17 = [v16 key];
    double v18 = [(SFSpeechSynthesisTask *)self resourceAsset];
    double v19 = [v18 key];
    *(_DWORD *)buf = 138412546;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_22B575000, v15, OS_LOG_TYPE_INFO, "handleSynthesisBegin: voiceKey=%@, resourceKey=%@", buf, 0x16u);
  }
  if ([(SFSpeechSynthesisTask *)self isSpeakRequest])
  {
    v20 = SFSSGetLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      [(SFSpeechSynthesisTask *)self audioPlaybackBufferDuration];
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = v21;
      _os_log_impl(&dword_22B575000, v20, OS_LOG_TYPE_INFO, "AudioPlaybackBufferDuration=%f", buf, 0xCu);
    }

    [(SFSpeechSynthesisTask *)self asbd];
    [(SFSpeechSynthesisTask *)self initSpeak:v10 asbd:v28];
  }
  v22 = [(SFSpeechSynthesisTask *)self voiceAsset];
  v23 = [v22 key];
  id v24 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v24 setVoiceAssetKey:v23];

  v25 = [(SFSpeechSynthesisTask *)self resourceAsset];
  uint64_t v26 = [v25 key];
  long long v27 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v27 setResourceAssetKey:v26];
}

- (void)handleSynthesisInit
{
  BOOL v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "handleSynthesisInit", v6, 2u);
  }

  uint64_t v4 = mach_absolute_time();
  char v5 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v5 setSynthesisBeginTimestamp:v4];

  [(SFSpeechSynthesisTask *)self setSynthesisState:1];
}

- (void)waitForSpeakFinish
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(SFSpeechSynthesisTask *)self taskIdentifer];
    int v9 = 138412290;
    uint64_t v10 = v4;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Wait for speak finish, taskId=%@", (uint8_t *)&v9, 0xCu);
  }
  char v5 = [(SFSpeechSynthesisTask *)self playbackService];
  [v5 flushAndStop];

  uint64_t v6 = [(SFSpeechSynthesisTask *)self playbackService];
  [v6 waitForAudioQueueStop];

  [(SFSpeechSynthesisTask *)self setSpeakState:4];
  v7 = SFSSGetLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [(SFSpeechSynthesisTask *)self taskIdentifer];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_22B575000, v7, OS_LOG_TYPE_INFO, "Speak finished, taskId=%@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)initSpeak:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = [SFSSAudioPlaybackService alloc];
  long long v7 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)v15 = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&v15[16] = v7;
  uint64_t v16 = *(void *)&a4->mBitsPerChannel;
  int v8 = [(SFSSAudioPlaybackService *)v6 initWithAudioSessionID:0 asbd:v15];
  [(SFSpeechSynthesisTask *)self setPlaybackService:v8];

  int v9 = [(SFSpeechSynthesisTask *)self playbackService];
  uint64_t v10 = [v9 outputRoute];
  uint64_t v11 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
  [v11 setAudioOutputRoute:v10];

  id v12 = SFSSGetLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [(SFSpeechSynthesisTask *)self taskIdentifer];
    long long v14 = [(SFSpeechSynthesisTask *)self error];
    *(_DWORD *)v15 = 138412546;
    *(void *)&v15[4] = v13;
    *(_WORD *)&v15[12] = 2112;
    *(void *)&v15[14] = v14;
    _os_log_impl(&dword_22B575000, v12, OS_LOG_TYPE_INFO, "Init speak, taskId=%@, error=%@", v15, 0x16u);
  }
}

- (void)start:(id)a3
{
  id v4 = a3;
  [(SFSpeechSynthesisTask *)self handleSynthesisInit];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SFSpeechSynthesisTask_start___block_invoke;
  v6[3] = &unk_26489E7F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SFSpeechSynthesisTask *)self startTask:v6];
}

uint64_t __31__SFSpeechSynthesisTask_start___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  BOOL v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v6 error];
    [v5 speechSynthesisTask:v6 didFinishWithError:v7];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
  }
  return MEMORY[0x270F9A758]();
}

- (void)startSpeakIfValid
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(SFSpeechSynthesisTask *)self speakState] != 1
    && [(SFSpeechSynthesisTask *)self speakState] != 2
    && [(SFSpeechSynthesisTask *)self speakState] != 3)
  {
    BOOL v3 = SFSSGetLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      char v4 = [(SFSpeechSynthesisTask *)self taskIdentifer];
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Start speaking, taskId=%@", (uint8_t *)&v9, 0xCu);
    }
    id v5 = [(SFSpeechSynthesisTask *)self playbackService];
    uint64_t v6 = [v5 start];
    [(SFSpeechSynthesisTask *)self setErrorIfNotNull:v6];

    [(SFSpeechSynthesisTask *)self setSpeakState:1];
    uint64_t v7 = mach_absolute_time();
    uint64_t v8 = [(SFSpeechSynthesisTask *)self instrumentMetrics];
    [v8 setSpeakBeginTimestamp:v7];
  }
}

- (id)resume
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(SFSpeechSynthesisTask *)self speakState] == 2)
  {
    [(SFSpeechSynthesisTask *)self setSpeakState:1];
    BOOL v3 = SFSSGetLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      char v4 = [(SFSpeechSynthesisTask *)self taskIdentifer];
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Resume speak, taskId=%@", buf, 0xCu);
    }
    id v5 = [(SFSpeechSynthesisTask *)self playbackService];
    uint64_t v6 = [v5 start];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Speak task is in wrong state. speak state = %ld", -[SFSpeechSynthesisTask speakState](self, "speakState"));
    uint64_t v11 = v5;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v6 = [v7 errorWithDomain:@"SFSpeechSynthesisTaskError" code:700 userInfo:v8];
  }
  return v6;
}

- (id)pause
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(SFSpeechSynthesisTask *)self speakState] == 1)
  {
    [(SFSpeechSynthesisTask *)self setSpeakState:2];
    BOOL v3 = SFSSGetLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      char v4 = [(SFSpeechSynthesisTask *)self taskIdentifer];
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Pause speak, taskId=%@", buf, 0xCu);
    }
    id v5 = [(SFSpeechSynthesisTask *)self playbackService];
    [v5 pause];
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Speak task is in wrong state. speak state = %ld", -[SFSpeechSynthesisTask speakState](self, "speakState"));
    uint64_t v11 = v5;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v6 = [v7 errorWithDomain:@"SFSpeechSynthesisTaskError" code:700 userInfo:v8];
  }
  return v6;
}

- (id)cancel
{
  v28[1] = *MEMORY[0x263EF8340];
  if (![(SFSpeechSynthesisTask *)self isSpeakRequest]
    || [(SFSpeechSynthesisTask *)self speakState] == 3
    || [(SFSpeechSynthesisTask *)self speakState] == 4)
  {
    if ([(SFSpeechSynthesisTask *)self isSpeakRequest]
      || [(SFSpeechSynthesisTask *)self synthesisState] == 4
      || [(SFSpeechSynthesisTask *)self synthesisState] == 3)
    {
      BOOL v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08320];
      char v4 = [NSString stringWithFormat:@"Speak/Synthesis task is in wrong state. speak state = %ld, synthesis state = %ld", -[SFSpeechSynthesisTask speakState](self, "speakState"), -[SFSpeechSynthesisTask synthesisState](self, "synthesisState")];
      v22 = v4;
      id v5 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v6 = [v3 errorWithDomain:@"SFSpeechSynthesisTaskError" code:700 userInfo:v5];

      goto LABEL_17;
    }
    [(SFSpeechSynthesisTask *)self setSynthesisState:4];
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08320];
    v15 = [NSString stringWithFormat:@"Speak/Synthesis task is canceled. speak state = %ld, synthesis state = %ld", -[SFSpeechSynthesisTask speakState](self, "speakState"), -[SFSpeechSynthesisTask synthesisState](self, "synthesisState")];
    id v24 = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v17 = [v14 errorWithDomain:@"SFSpeechSynthesisError" code:300 userInfo:v16];
    [(SFSpeechSynthesisTask *)self setErrorIfNotNull:v17];

    double v18 = SFSSGetLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      double v19 = [(SFSpeechSynthesisTask *)self taskIdentifer];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v19;
      _os_log_impl(&dword_22B575000, v18, OS_LOG_TYPE_INFO, "Cancel synthesis task, taskId=%@", buf, 0xCu);
    }
    [(SFSpeechSynthesisTask *)self cancelTask];
  }
  else
  {
    [(SFSpeechSynthesisTask *)self setSpeakState:3];
    if ([(SFSpeechSynthesisTask *)self synthesisState] != 3)
    {
      [(SFSpeechSynthesisTask *)self setSynthesisState:4];
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      uint64_t v8 = [NSString stringWithFormat:@"Speak/Synthesis task is canceled. speak state = %ld, synthesis state = %ld", -[SFSpeechSynthesisTask speakState](self, "speakState"), -[SFSpeechSynthesisTask synthesisState](self, "synthesisState")];
      v28[0] = v8;
      int v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      uint64_t v10 = [v7 errorWithDomain:@"SFSpeechSynthesisError" code:300 userInfo:v9];
      [(SFSpeechSynthesisTask *)self setErrorIfNotNull:v10];
    }
    uint64_t v11 = SFSSGetLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(SFSpeechSynthesisTask *)self taskIdentifer];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v12;
      _os_log_impl(&dword_22B575000, v11, OS_LOG_TYPE_INFO, "Cancel speak task, taskId=%@", buf, 0xCu);
    }
    [(SFSpeechSynthesisTask *)self cancelTask];
    id v13 = [(SFSpeechSynthesisTask *)self playbackService];
    [v13 stop];
  }
  uint64_t v6 = 0;
LABEL_17:
  return v6;
}

- (void)cancelTask
{
  id v2 = [(SFSpeechSynthesisTask *)self cancel];
}

- (SFSpeechSynthesisTask)initWithRequest:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFSpeechSynthesisTask;
  uint64_t v6 = [(SFSpeechSynthesisTask *)&v23 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_speakState = 0;
    v6->_synthesisState = 0;
    objc_storeStrong((id *)&v6->_request, a3);
    v7->_bufferedDuration = 0.0;
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bufferedAudios = v7->_bufferedAudios;
    v7->_bufferedAudios = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bufferedAudioData = v7->_bufferedAudioData;
    v7->_bufferedAudioData = v10;

    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    phonemeSequence = v7->_phonemeSequence;
    v7->_phonemeSequence = v12;

    uint64_t v14 = [(SFSpeechSynthesisRequest *)v7->_request requestIdentifer];
    taskIdentifer = v7->_taskIdentifer;
    v7->_taskIdentifer = (NSString *)v14;

    uint64_t v16 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    synthesisStateCondition = v7->_synthesisStateCondition;
    v7->_synthesisStateCondition = v16;

    double v18 = objc_alloc_init(SFSSInstrumentMetrics);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v18;

    v20 = [v5 text];
    [(SFSSInstrumentMetrics *)v7->_instrumentMetrics setText:v20];

    -[SFSSInstrumentMetrics setIsSpeechRequest:](v7->_instrumentMetrics, "setIsSpeechRequest:", [v5 type] == 0);
    uint64_t v21 = [v5 clientBundleIdentifier];
    [(SFSSInstrumentMetrics *)v7->_instrumentMetrics setClientBundleIdentifier:v21];

    [(SFSSInstrumentMetrics *)v7->_instrumentMetrics setRequestCreatedTimestamp:mach_absolute_time()];
  }

  return v7;
}

@end