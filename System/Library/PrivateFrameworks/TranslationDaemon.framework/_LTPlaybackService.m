@interface _LTPlaybackService
- (BOOL)_currentOutputRouteIsSpeaker;
- (BOOL)isAudioQueueRunning;
- (_LTPlaybackService)initWithContext:(id)a3 ASBD:(AudioStreamBasicDescription *)a4;
- (id)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5;
- (id)start;
- (int64_t)state;
- (void)dealloc;
- (void)flushAndStop;
- (void)handleMediaServerReset;
- (void)isAudioQueueRunning;
- (void)reset;
- (void)signalQueueRunningStateChanged;
- (void)start;
- (void)stop;
- (void)waitForAudioQueueStop;
@end

@implementation _LTPlaybackService

- (_LTPlaybackService)initWithContext:(id)a3 ASBD:(AudioStreamBasicDescription *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_LTPlaybackService;
  v8 = [(_LTPlaybackService *)&v37 init];
  v9 = v8;
  if (!v8)
  {
LABEL_5:
    v15 = 0;
    goto LABEL_20;
  }
  long long v10 = *(_OWORD *)&a4->mSampleRate;
  long long v11 = *(_OWORD *)&a4->mBytesPerPacket;
  *((void *)v8 + 5) = *(void *)&a4->mBitsPerChannel;
  *(_OWORD *)(v8 + 24) = v11;
  *(_OWORD *)(v8 + 8) = v10;
  objc_storeStrong((id *)v8 + 21, a3);
  uint64_t v12 = [v7 audioSessionID];
  *((void *)v9 + 7) = 850045863;
  *((_OWORD *)v9 + 4) = 0u;
  *((_OWORD *)v9 + 5) = 0u;
  *((_OWORD *)v9 + 6) = 0u;
  *((void *)v9 + 14) = 0;
  *((void *)v9 + 15) = 1018212795;
  *((_OWORD *)v9 + 8) = 0u;
  *((_OWORD *)v9 + 9) = 0u;
  *((void *)v9 + 20) = 0;
  v13 = (AudioQueueRef *)(v9 + 48);
  if (AudioQueueNewOutputWithAudioSession())
  {
    v14 = _LTOSLogTTS();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_LTPlaybackService initWithContext:ASBD:]();
    }
    goto LABEL_5;
  }
  [v7 ttsPlaybackRate];
  if (v16 != 1.0)
  {
    int inData = 1;
    AudioQueueSetProperty(*v13, 0x715F7470u, &inData, 4u);
    int inData = 1953064047;
    AudioQueueSetProperty(*v13, 0x71747061u, &inData, 4u);
    v17 = *v13;
    [v7 ttsPlaybackRate];
    *(float *)&double v18 = v18;
    AudioQueueSetParameter(v17, 2u, *(AudioQueueParameterValue *)&v18);
  }
  v19 = [MEMORY[0x263EFF980] array];
  v20 = [MEMORY[0x263EF93E0] retrieveSessionWithID:v12];
  v21 = [v20 currentRoute];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v22 = objc_msgSend(v21, "outputs", 0);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v33 + 1) + 8 * v26) portType];
        [v19 addObject:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v24);
  }

  v28 = [v19 componentsJoinedByString:@","];
  v29 = _LTOSLogTTS();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    int inData = 138412290;
    v39 = v28;
    _os_log_impl(&dword_2600DC000, v29, OS_LOG_TYPE_INFO, "Current audio output route: %@", (uint8_t *)&inData, 0xCu);
  }
  v30 = [MEMORY[0x263F08A00] defaultCenter];
  [v30 addObserver:v9 selector:sel_handleMediaServerReset name:*MEMORY[0x263EF90F8] object:0];

  v31 = _LTOSLogTTS();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int inData = 67109120;
    LODWORD(v39) = v12;
    _os_log_impl(&dword_2600DC000, v31, OS_LOG_TYPE_INFO, "AudioQueue initialized with session id: %d", (uint8_t *)&inData, 8u);
  }
  v15 = v9;

LABEL_20:
  return v15;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error disposing audio queue %d", v2, v3, v4, v5, v6);
}

- (void)handleMediaServerReset
{
  uint64_t v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "mediaserverd reset", v4, 2u);
  }
  [(_LTPlaybackService *)self stop];
}

- (BOOL)_currentOutputRouteIsSpeaker
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EF93E0], "retrieveSessionWithID:", -[_LTTranslationContext audioSessionID](self->_context, "audioSessionID"));
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 currentRoute];
    uint64_t v5 = [v4 outputs];

    if ([v5 count] == 1)
    {
      uint8_t v6 = [v5 firstObject];
      id v7 = [v6 portType];
      char v8 = [v7 isEqualToString:@"Speaker"];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)start
{
  v17[1] = *MEMORY[0x263EF8340];
  OSStatus v3 = AudioQueueStart(self->_audioQueue, 0);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F08410];
    uint64_t v6 = v3;
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = @"Error AudioQueueStart";
    id v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    char v8 = [v4 errorWithDomain:v5 code:v6 userInfo:v7];

    v9 = _LTOSLogTTS();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTPlaybackService start]();
    }
  }
  else
  {
    if ([(_LTTranslationContext *)self->_context muteTTSBasedOnRingerSwitchIfPossible]&& [(_LTPlaybackService *)self _currentOutputRouteIsSpeaker])
    {
      long long v10 = objc_msgSend(MEMORY[0x263EF93E0], "retrieveSessionWithID:", -[_LTTranslationContext audioSessionID](self->_context, "audioSessionID"));
      long long v11 = [NSNumber numberWithBool:1];
      id v15 = 0;
      [v10 setMXSessionProperty:@"MutesAudioBasedOnRingerSwitchState" value:v11 error:&v15];
      id v12 = v15;

      if (v12)
      {
        v13 = _LTOSLogTTS();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(_LTPlaybackService *)(uint64_t)v12 start];
        }
      }
    }
    char v8 = 0;
    self->_state = 1;
  }
  return v8;
}

- (id)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  UInt32 v6 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (![v8 length])
  {
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  long long v10 = _LTOSLogTTS();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = v10;
    LODWORD(buf.mSampleTime) = 134217984;
    *(void *)((char *)&buf.mSampleTime + 4) = [v8 length];
    _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Creating buffer of length: %zu", (uint8_t *)&buf, 0xCu);
  }
  AudioQueueBufferRef outBuffer = 0;
  OSStatus v12 = AudioQueueAllocateBuffer(self->_audioQueue, [v8 length], &outBuffer);
  if (v12)
  {
    v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v12 userInfo:0];
    v14 = _LTOSLogTTS();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_LTPlaybackService enqueue:packetCount:packetDescriptions:]();
    }
    goto LABEL_16;
  }
  mAudioData = outBuffer->mAudioData;
  id v16 = v8;
  memcpy(mAudioData, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
  UInt32 v17 = [v16 length];
  outBuffer->mAudioDataByteSize = v17;
  memset(&buf, 0, sizeof(buf));
  AudioQueueGetCurrentTime(self->_audioQueue, 0, &buf, 0);
  audioQueue = self->_audioQueue;
  v19 = outBuffer;
  id v20 = v9;
  OSStatus v21 = AudioQueueEnqueueBuffer(audioQueue, v19, v6, (const AudioStreamPacketDescription *)[v20 bytes]);
  if (!v21)
  {
    uint64_t v23 = _LTOSLogTTS();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if (v20) {
        uint64_t v24 = @"Opus";
      }
      else {
        uint64_t v24 = @"PCM";
      }
      Float64 mSampleTime = buf.mSampleTime;
      uint64_t v26 = v23;
      uint64_t v27 = [v16 length];
      *(_DWORD *)v30 = 138543874;
      v31 = v24;
      __int16 v32 = 2048;
      Float64 v33 = mSampleTime;
      __int16 v34 = 2048;
      uint64_t v35 = v27;
      _os_log_impl(&dword_2600DC000, v26, OS_LOG_TYPE_INFO, "Enqueued %{public}@ audio buffer at sample title: %.2f, size: %zu", v30, 0x20u);
    }
    goto LABEL_15;
  }
  v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v21 userInfo:0];
  v22 = _LTOSLogTTS();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[_LTPlaybackService enqueue:packetCount:packetDescriptions:]();
  }
LABEL_16:

  return v13;
}

- (void)signalQueueRunningStateChanged
{
  p_waitForStateChange = &self->_waitForStateChange;
  pthread_mutex_lock(&self->_waitForStateChange);
  uint64_t v4 = _LTOSLogTTS();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Playback service running state changed", v5, 2u);
  }
  pthread_cond_broadcast(&self->_stateChangeCondition);
  pthread_mutex_unlock(p_waitForStateChange);
}

- (void)waitForAudioQueueStop
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error adding audio queue property listener %d", v2, v3, v4, v5, v6);
}

- (void)flushAndStop
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error flushing audio queue %d", v2, v3, v4, v5, v6);
}

- (void)stop
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error AudioQueueStop %d", v2, v3, v4, v5, v6);
}

- (void)reset
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error AudioQueueReset %d", v2, v3, v4, v5, v6);
}

- (BOOL)isAudioQueueRunning
{
  UInt32 ioDataSize = 4;
  int outData = 0;
  if (AudioQueueGetProperty(self->_audioQueue, 0x6171726Eu, &outData, &ioDataSize))
  {
    uint64_t v2 = _LTOSLogTTS();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[_LTPlaybackService isAudioQueueRunning]();
    }
  }
  return outData != 0;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

- (void)initWithContext:ASBD:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error creating playback service, %d", v2, v3, v4, v5, v6);
}

- (void)start
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_3_3(&dword_2600DC000, v0, v1, "Error starting audio queue %d: %@");
}

- (void)enqueue:packetCount:packetDescriptions:.cold.1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_3_3(&dword_2600DC000, v0, v1, "Failed to enqueue audio data: %d: %@");
}

- (void)enqueue:packetCount:packetDescriptions:.cold.2()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_3_3(&dword_2600DC000, v0, v1, "Failed to create audio buffer: %d: %@");
}

- (void)isAudioQueueRunning
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_9(&dword_2600DC000, v0, v1, "Error checking is running property: %d", v2, v3, v4, v5, v6);
}

@end