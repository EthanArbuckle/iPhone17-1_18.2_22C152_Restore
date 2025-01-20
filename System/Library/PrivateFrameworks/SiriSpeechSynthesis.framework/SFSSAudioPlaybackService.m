@interface SFSSAudioPlaybackService
- (AudioStreamBasicDescription)asbd;
- (BOOL)discontinuedDuringPlayback;
- (BOOL)isAudioQueueRunning;
- (NSCondition)audioQueueStateCondition;
- (NSString)outputRoute;
- (OpaqueAudioQueue)audioQueue;
- (SFSSAudioPlaybackService)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4;
- (id)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5;
- (id)start;
- (unsigned)sessionID;
- (void)flushAndStop;
- (void)handleMediaServerReset;
- (void)pause;
- (void)reset;
- (void)setAudioQueueStateCondition:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)signalQueueRunningStateChange;
- (void)stop;
- (void)waitForAudioQueueStop;
- (void)waitForQueueRunningStateChange;
@end

@implementation SFSSAudioPlaybackService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueStateCondition, 0);
  objc_storeStrong((id *)&self->_outputRoute, 0);
}

- (void)setAudioQueueStateCondition:(id)a3
{
}

- (NSCondition)audioQueueStateCondition
{
  return self->_audioQueueStateCondition;
}

- (BOOL)discontinuedDuringPlayback
{
  return self->_discontinuedDuringPlayback;
}

- (NSString)outputRoute
{
  return self->_outputRoute;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (void)waitForQueueRunningStateChange
{
  [(NSCondition *)self->_audioQueueStateCondition lock];
  [(NSCondition *)self->_audioQueueStateCondition wait];
  audioQueueStateCondition = self->_audioQueueStateCondition;
  [(NSCondition *)audioQueueStateCondition unlock];
}

- (void)signalQueueRunningStateChange
{
  [(NSCondition *)self->_audioQueueStateCondition lock];
  [(NSCondition *)self->_audioQueueStateCondition broadcast];
  audioQueueStateCondition = self->_audioQueueStateCondition;
  [(NSCondition *)audioQueueStateCondition unlock];
}

- (void)handleMediaServerReset
{
  long long v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "mediaserverd reset", v4, 2u);
  }

  [(SFSSAudioPlaybackService *)self stop];
}

- (BOOL)isAudioQueueRunning
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  UInt32 ioDataSize = 4;
  int outData = 0;
  OSStatus Property = AudioQueueGetProperty(self->_audioQueue, 0x6171726Eu, &outData, &ioDataSize);
  if (Property)
  {
    OSStatus v3 = Property;
    v4 = SFSSGetLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v9 = v3;
      _os_log_error_impl(&dword_22B575000, v4, OS_LOG_TYPE_ERROR, "Error AudioQueueGetProperty isRunning %d", buf, 8u);
    }
  }
  return outData != 0;
}

- (id)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    AudioQueueBufferRef outBuffer = 0;
    OSStatus v10 = AudioQueueAllocateBuffer(self->_audioQueue, [v8 length], &outBuffer);
    if (v10)
    {
      OSStatus v11 = v10;
      v12 = SFSSGetLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v11;
        _os_log_error_impl(&dword_22B575000, v12, OS_LOG_TYPE_ERROR, "Error AudioQueueAllocateBuffer %d", buf, 8u);
      }

      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08410];
      uint64_t v15 = v11;
LABEL_10:
      v25 = [v13 errorWithDomain:v14 code:v15 userInfo:0];
      goto LABEL_19;
    }
    mAudioData = outBuffer->mAudioData;
    id v17 = v8;
    memcpy(mAudioData, (const void *)[v17 bytes], objc_msgSend(v17, "length"));
    UInt32 v18 = [v17 length];
    v19 = outBuffer;
    outBuffer->mAudioDataByteSize = v18;
    audioQueue = self->_audioQueue;
    id v21 = v9;
    OSStatus v22 = AudioQueueEnqueueBuffer(audioQueue, v19, a4, (const AudioStreamPacketDescription *)[v21 bytes]);
    if (v22)
    {
      OSStatus v23 = v22;
      v24 = SFSSGetLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v23;
        _os_log_error_impl(&dword_22B575000, v24, OS_LOG_TYPE_ERROR, "Error AudioQueueEnqueueBuffer %d", buf, 8u);
      }

      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08410];
      uint64_t v15 = v23;
      goto LABEL_10;
    }
    if (a4 && v21) {
      double v26 = (double)(self->_asbd.mFramesPerPacket * a4);
    }
    else {
      double v26 = (double)([v17 length] / (unint64_t)self->_asbd.mBytesPerFrame);
    }
    double v27 = v26 + self->_enqueuedSampleCount;
    self->_double enqueuedSampleCount = v27;
    double mSampleRate = self->_asbd.mSampleRate;
    v29 = SFSSGetLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v17 length];
      double enqueuedSampleCount = self->_enqueuedSampleCount;
      *(_DWORD *)buf = 134219008;
      v35 = self;
      __int16 v36 = 2048;
      uint64_t v37 = 0;
      __int16 v38 = 2048;
      uint64_t v39 = v30;
      __int16 v40 = 2048;
      double v41 = enqueuedSampleCount;
      __int16 v42 = 2048;
      double v43 = v27 / mSampleRate;
      _os_log_impl(&dword_22B575000, v29, OS_LOG_TYPE_INFO, "AudioPlaybackService %p enqueued audio buffer at sample time: %.2f, size: %ld, total enqueued samples: %.0f, enqueued audio duration: %.3f", buf, 0x34u);
    }
  }
  v25 = 0;
LABEL_19:

  return v25;
}

- (void)reset
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OSStatus v3 = AudioQueueReset(self->_audioQueue);
  if (v3)
  {
    OSStatus v4 = v3;
    v5 = SFSSGetLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueReset %d", (uint8_t *)v6, 8u);
    }
  }
  self->_double enqueuedSampleCount = 0.0;
}

- (void)pause
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OSStatus v3 = AudioQueuePause(self->_audioQueue);
  OSStatus v4 = SFSSGetLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109120;
      LODWORD(v7) = v3;
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueuePause %d", (uint8_t *)&v6, 8u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "VSAudioPlaybackServices %p success AudioQueuePause", (uint8_t *)&v6, 0xCu);
  }
}

- (void)waitForAudioQueueStop
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(SFSSAudioPlaybackService *)self isAudioQueueRunning])
  {
    do
      [(SFSSAudioPlaybackService *)self waitForQueueRunningStateChange];
    while ([(SFSSAudioPlaybackService *)self isAudioQueueRunning]);
  }
  OSStatus v3 = AudioQueueRemovePropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_audioPlaybackServiceRunningStateChanged, self);
  if (v3)
  {
    OSStatus v4 = v3;
    v5 = SFSSGetLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueRemovePropertyListener %d", (uint8_t *)v7, 8u);
    }
  }
  int v6 = SFSSGetLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_22B575000, v6, OS_LOG_TYPE_INFO, "Audio queue stopped.", (uint8_t *)v7, 2u);
  }
}

- (void)stop
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OSStatus v3 = AudioQueueStop(self->_audioQueue, 1u);
  if (v3)
  {
    OSStatus v4 = v3;
    v5 = SFSSGetLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %d", (uint8_t *)v6, 8u);
    }
  }
  self->_double enqueuedSampleCount = 0.0;
}

- (void)flushAndStop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  OSStatus v3 = AudioQueueFlush(self->_audioQueue);
  if (v3)
  {
    OSStatus v4 = v3;
    v5 = SFSSGetLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 67109120;
      OSStatus v10 = v4;
      int v6 = "Error AudioQueueFlush %d";
LABEL_10:
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    OSStatus v7 = AudioQueueStop(self->_audioQueue, 0);
    if (!v7)
    {
      self->_double enqueuedSampleCount = 0.0;
      return;
    }
    OSStatus v8 = v7;
    v5 = SFSSGetLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 67109120;
      OSStatus v10 = v8;
      int v6 = "Error AudioQueueStop %d";
      goto LABEL_10;
    }
  }
}

- (id)start
{
  v14[1] = *MEMORY[0x263EF8340];
  OSStatus v3 = AudioQueueStart(self->_audioQueue, 0);
  OSStatus v4 = SFSSGetLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      LODWORD(v12) = v3;
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueStart %d", (uint8_t *)&v11, 8u);
    }

    int v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"Error AudioQueueStart";
    OSStatus v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    int v9 = [v6 errorWithDomain:v7 code:v3 userInfo:v8];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "AudioPlaybackService %p success AudioQueueStart", (uint8_t *)&v11, 0xCu);
    }

    if (![(SFSSAudioPlaybackService *)self isAudioQueueRunning])
    {
      do
        [(SFSSAudioPlaybackService *)self waitForQueueRunningStateChange];
      while (![(SFSSAudioPlaybackService *)self isAudioQueueRunning]);
    }
    OSStatus v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "AudioPlaybackService %p success AudioQueueStart started", (uint8_t *)&v11, 0xCu);
    }
    int v9 = 0;
  }

  return v9;
}

- (SFSSAudioPlaybackService)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  v47.receiver = self;
  v47.super_class = (Class)SFSSAudioPlaybackService;
  OSStatus v8 = [(SFSSAudioPlaybackService *)&v47 init];
  int v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a4->mSampleRate;
    long long v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *(void *)&v8->_asbd.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)&v8->_asbd.double mSampleRate = v10;
    *(_OWORD *)&v8->_asbd.mBytesPerPacket = v11;
    if (a3)
    {
      v8->_sessionID = a3;
      p_sessionID = &v8->_sessionID;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263EF93E0] sharedInstance];
      v9->_sessionID = [v13 opaqueSessionID];
      p_sessionID = &v9->_sessionID;
    }
    int v14 = AudioQueueNewOutputWithAudioSession();
    if (v14)
    {
      int v15 = v14;
      v16 = SFSSGetLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v15;
        _os_log_error_impl(&dword_22B575000, v16, OS_LOG_TYPE_ERROR, "Error AudioQueueNewOutputWithAudioSession %d", buf, 8u);
      }

LABEL_26:
      uint64_t v37 = 0;
      goto LABEL_33;
    }
    id v17 = [MEMORY[0x263EF93E0] retrieveSessionWithID:*p_sessionID];
    UInt32 v18 = [v17 currentRoute];

    v19 = [MEMORY[0x263EFF980] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    __int16 v42 = v18;
    v20 = [v18 outputs];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v43 + 1) + 8 * i) portType];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v22);
    }

    uint64_t v26 = [v19 componentsJoinedByString:@","];
    outputRoute = v9->_outputRoute;
    v9->_outputRoute = (NSString *)v26;

    v28 = SFSSGetLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (SFSSAudioPlaybackService *)v9->_outputRoute;
      *(_DWORD *)buf = 138412290;
      v49 = v29;
      _os_log_impl(&dword_22B575000, v28, OS_LOG_TYPE_INFO, "Current audio output route: %@", buf, 0xCu);
    }

    OSStatus v30 = AudioQueueSetProperty(v9->_audioQueue, 0x63756964u, &AudioPlaybackAudioQueueUID, 8u);
    if (v30)
    {
      OSStatus v31 = v30;
      v32 = SFSSGetLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v31;
        _os_log_error_impl(&dword_22B575000, v32, OS_LOG_TYPE_ERROR, "Unable to set kAudioQueueProperty_ClientUID, errno: %d", buf, 8u);
      }
    }
    v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v9 selector:sel_handleMediaServerReset name:*MEMORY[0x263EF90F8] object:0];

    OSStatus v34 = AudioQueueAddPropertyListener(v9->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_audioPlaybackServiceRunningStateChanged, v9);
    v35 = SFSSGetLogObject();
    __int16 v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v34;
        _os_log_error_impl(&dword_22B575000, v36, OS_LOG_TYPE_ERROR, "Error AudioQueueAddPropertyListener %d", buf, 8u);
      }

      goto LABEL_26;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = a3;
      _os_log_impl(&dword_22B575000, v36, OS_LOG_TYPE_INFO, "AudioQueue initialized with session ID: %d", buf, 8u);
    }
  }
  [v7 timeIntervalSinceNow];
  uint64_t v39 = v38;
  __int16 v40 = SFSSGetLogObject();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v49 = v9;
    __int16 v50 = 2048;
    uint64_t v51 = v39;
    _os_log_impl(&dword_22B575000, v40, OS_LOG_TYPE_INFO, "AudioPlaybackService %p init latency: %.3f", buf, 0x16u);
  }

  uint64_t v37 = v9;
LABEL_33:

  return v37;
}

@end