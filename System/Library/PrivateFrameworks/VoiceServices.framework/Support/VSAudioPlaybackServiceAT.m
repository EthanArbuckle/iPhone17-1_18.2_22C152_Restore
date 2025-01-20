@interface VSAudioPlaybackServiceAT
- (AudioStreamBasicDescription)asbd;
- (AudioTimeStamp)audioStartTimeStamp;
- (BOOL)discontinuedDuringPlayback;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (BOOL)isAudioQueueRunning;
- (BOOL)isAudioQueueStalled;
- (NSCondition)dequeueCondition;
- (NSDate)audioQueueFutureEndDate;
- (NSDate)audioQueueStartDate;
- (NSError)error;
- (NSMutableArray)enqueuedMappedAudioInfo;
- (OpaqueAudioQueue)audioQueue;
- (OpaqueCMTimebase)timebase;
- (VSAudioPlaybackServiceAT)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4;
- (VSMappedData)mappedData;
- (_opaque_pthread_cond_t)stateChangeCondition;
- (_opaque_pthread_mutex_t)waitForStateChangeMutex;
- (double)enqueuedSampleCount;
- (id)_enqueueAudioBytesLength:(unsigned int)a3 audioBytes:(const void *)a4 packetCount:(int64_t)a5 packetDescriptions:(const void *)a6;
- (id)addBoundaryTimeObserverForTimes:(id)a3 usingBlock:(id)a4;
- (id)start;
- (int64_t)state;
- (unint64_t)playingBufferCount;
- (unsigned)sessionID;
- (void)dealloc;
- (void)dequeueAvailableMappedAudio;
- (void)didEndAccessPower;
- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5;
- (void)flushAndStop;
- (void)handleMediaServerReset;
- (void)pause;
- (void)removeTimeObserver:(id)a3;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setAudioQueueFutureEndDate:(id)a3;
- (void)setAudioQueueStartDate:(id)a3;
- (void)setAudioStartTimeStamp:(AudioTimeStamp *)a3;
- (void)setDequeueCondition:(id)a3;
- (void)setEnqueuedMappedAudioInfo:(id)a3;
- (void)setEnqueuedSampleCount:(double)a3;
- (void)setError:(id)a3;
- (void)setMappedData:(id)a3;
- (void)setPlayingBufferCount:(unint64_t)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setState:(int64_t)a3;
- (void)setStateChangeCondition:(_opaque_pthread_cond_t *)a3;
- (void)setTimebase:(OpaqueCMTimebase *)a3;
- (void)setWaitForStateChangeMutex:(_opaque_pthread_mutex_t *)a3;
- (void)signalQueueRunningStateChange;
- (void)stop;
- (void)waitForAudioQueueStop;
- (void)willBeginAccessPower;
@end

@implementation VSAudioPlaybackServiceAT

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dequeueCondition, 0);
  objc_storeStrong((id *)&self->_enqueuedMappedAudioInfo, 0);
  objc_storeStrong((id *)&self->_mappedData, 0);
  objc_storeStrong((id *)&self->_audioQueueFutureEndDate, 0);
  objc_storeStrong((id *)&self->_audioQueueStartDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setDequeueCondition:(id)a3
{
}

- (NSCondition)dequeueCondition
{
  return self->_dequeueCondition;
}

- (void)setPlayingBufferCount:(unint64_t)a3
{
  self->_playingBufferCount = a3;
}

- (unint64_t)playingBufferCount
{
  return self->_playingBufferCount;
}

- (void)setEnqueuedMappedAudioInfo:(id)a3
{
}

- (NSMutableArray)enqueuedMappedAudioInfo
{
  return self->_enqueuedMappedAudioInfo;
}

- (void)setMappedData:(id)a3
{
}

- (VSMappedData)mappedData
{
  return self->_mappedData;
}

- (void)setAudioQueueFutureEndDate:(id)a3
{
}

- (NSDate)audioQueueFutureEndDate
{
  return self->_audioQueueFutureEndDate;
}

- (void)setAudioQueueStartDate:(id)a3
{
}

- (NSDate)audioQueueStartDate
{
  return self->_audioQueueStartDate;
}

- (void)setAudioStartTimeStamp:(AudioTimeStamp *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleTime;
  long long v4 = *(_OWORD *)&a3->mRateScalar;
  long long v5 = *(_OWORD *)&a3->mSMPTETime.mHours;
  *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mSubframes = *(_OWORD *)&a3->mSMPTETime.mSubframes;
  *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mHours = v5;
  *(_OWORD *)&self->_audioStartTimeStamp.mSampleTime = v3;
  *(_OWORD *)&self->_audioStartTimeStamp.mRateScalar = v4;
}

- (AudioTimeStamp)audioStartTimeStamp
{
  long long v3 = *(_OWORD *)&self[4].mRateScalar;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self[4].mSampleTime;
  *(_OWORD *)&retstr->mRateScalar = v3;
  long long v4 = *(_OWORD *)&self[4].mSMPTETime.mHours;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self[4].mSMPTETime.mSubframes;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (void)setEnqueuedSampleCount:(double)a3
{
  self->_enqueuedSampleCount = a3;
}

- (double)enqueuedSampleCount
{
  return self->_enqueuedSampleCount;
}

- (void)setStateChangeCondition:(_opaque_pthread_cond_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_stateChangeCondition.__opaque[8] = *(_OWORD *)&a3->__opaque[8];
  *(_OWORD *)&self->_stateChangeCondition.__opaque[24] = v4;
  *(_OWORD *)&self->_stateChangeCondition.__sig = v3;
}

- (_opaque_pthread_cond_t)stateChangeCondition
{
  long long v3 = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__opaque[24];
  return self;
}

- (void)setWaitForStateChangeMutex:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_waitForStateChangeMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_waitForStateChangeMutex.__opaque[40] = v5;
  *(_OWORD *)&self->_waitForStateChangeMutex.__sig = v3;
  *(_OWORD *)&self->_waitForStateChangeMutex.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)waitForStateChangeMutex
{
  long long v3 = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[3].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setTimebase:(OpaqueCMTimebase *)a3
{
  self->_timebase = a3;
}

- (OpaqueCMTimebase)timebase
{
  return self->_timebase;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)discontinuedDuringPlayback
{
  return self->_discontinuedDuringPlayback;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_audioQueue = a3;
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[3].mBytesPerPacket;
  return self;
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  UInt32 ioDataSize = 8;
  BOOL v7 = [(VSAudioPlaybackServiceAT *)self isAudioQueueRunning];
  if (v7)
  {
    uint64_t Property = AudioQueueGetProperty(self->_audioQueue, 0x61716D64u, outData, &ioDataSize);
    if (Property)
    {
      uint64_t v9 = Property;
      v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(NSString, "vs_stringFrom4CC:", v9);
        *(_DWORD *)buf = 136315394;
        v23 = "-[VSAudioPlaybackServiceAT getAveragePower:andPeakPower:]";
        __int16 v24 = 2112;
        v25 = v17;
        _os_log_error_impl(&dword_226CB1000, v10, OS_LOG_TYPE_ERROR, "Error: %s, errno: %@", buf, 0x16u);
      }
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08410];
      uint64_t v20 = *MEMORY[0x263F08320];
      v21 = @"Unable to get kAudioQueueProperty_CurrentLevelMeterDB";
      v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v14 = [v11 errorWithDomain:v12 code:(int)v9 userInfo:v13];
      error = self->_error;
      self->_error = v14;

      LOBYTE(v7) = 0;
    }
    else
    {
      int v16 = outData[1];
      *a3 = *(float *)outData;
      *(_DWORD *)a4 = v16;
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (void)didEndAccessPower
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int inData = 0;
  uint64_t v3 = AudioQueueSetProperty(self->_audioQueue, 0x61716D65u, &inData, 4u);
  if (v3)
  {
    uint64_t v4 = v3;
    long long v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "vs_stringFrom4CC:", v4);
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, "Unable to disable kAudioQueueProperty_EnableLevelMetering, err: %@", buf, 0xCu);
    }
    v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15 = @"Unable to disable kAudioQueueProperty_EnableLevelMetering";
    v8 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:(int)v4 userInfo:v8];
    error = self->_error;
    self->_error = v9;
  }
  timebase = self->_timebase;
  if (timebase) {
    CMTimebaseSetRate(timebase, 0.0);
  }
}

- (void)willBeginAccessPower
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int inData = 1;
  uint64_t v3 = AudioQueueSetProperty(self->_audioQueue, 0x61716D65u, &inData, 4u);
  if (v3)
  {
    uint64_t v4 = v3;
    long long v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "vs_stringFrom4CC:", v4);
      *(_DWORD *)buf = 138412290;
      int v16 = v11;
      _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, "Unable to enable kAudioQueueProperty_EnableLevelMetering, err: %@", buf, 0xCu);
    }
    v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v13 = *MEMORY[0x263F08320];
    uint64_t v14 = @"Unable to enable kAudioQueueProperty_EnableLevelMetering";
    v8 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:(int)v4 userInfo:v8];
    error = self->_error;
    self->_error = v9;
  }
}

- (void)removeTimeObserver:(id)a3
{
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 usingBlock:(id)a4
{
  if (self->_timebase)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [[VSOccasionalTimesObserver alloc] initWithTimebase:self->_timebase times:v7 queue:0 block:v6];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isAudioQueueRunning
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  UInt32 ioDataSize = 4;
  int outData = 0;
  uint64_t Property = AudioQueueGetProperty(self->_audioQueue, 0x6171726Eu, &outData, &ioDataSize);
  if (Property)
  {
    uint64_t v4 = Property;
    long long v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "vs_stringFrom4CC:", v4);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v12;
      _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueGetProperty isRunning %@", buf, 0xCu);
    }
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v15 = *MEMORY[0x263F08320];
    int v16 = @"Error AudioQueueGetProperty isRunning";
    v8 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:(int)v4 userInfo:v8];
    error = self->_error;
    self->_error = v9;
  }
  return outData != 0;
}

- (BOOL)isAudioQueueStalled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_state != 3) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_audioQueueFutureEndDate];
  BOOL v5 = v4 > 5.0;
  if (v4 > 5.0)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
    [v6 setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v6 stringFromDate:v3];
      v10 = [v6 stringFromDate:self->_audioQueueFutureEndDate];
      int v11 = 138412802;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = 0x4014000000000000;
      _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Detected stall of audio queue, based on NSDate. Now: %@, supposed end time: %@, Tolerance: %.2f", (uint8_t *)&v11, 0x20u);
    }
  }

  return v5;
}

- (void)waitForAudioQueueStop
{
  v29[1] = *MEMORY[0x263EF8340];
  int64_t state = self->_state;
  if (state != 1 && state != 4)
  {
    p_waitForStateChangeMutex = &self->_waitForStateChangeMutex;
    pthread_mutex_lock(&self->_waitForStateChangeMutex);
    uint64_t v6 = AudioQueueAddPropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_VSAudioPlaybackServiceRunningStateChanged, self);
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(NSString, "vs_stringFrom4CC:", v7);
        LODWORD(v27.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&v27.tv_sec + 4) = (__darwin_time_t)v22;
        _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "Error AudioQueueAddPropertyListener %@", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F08410];
      uint64_t v11 = (int)v7;
      uint64_t v28 = *MEMORY[0x263F08320];
      v29[0] = @"Error AudioQueueAddPropertyListener";
      uint64_t v12 = NSDictionary;
      __int16 v13 = (__CFString **)v29;
      uint64_t v14 = &v28;
    }
    else
    {
      do
      {
        v27.tv_sec = 0;
        *(void *)&v27.tv_usec = 0;
        v24.tv_sec = 0;
        v24.tv_nsec = 0;
        gettimeofday(&v27, 0);
        v24.tv_sec = v27.tv_sec + 1;
        v24.tv_nsec = 1000 * v27.tv_usec;
        int v15 = pthread_cond_timedwait(&self->_stateChangeCondition, p_waitForStateChangeMutex, &v24);
      }
      while ([(VSAudioPlaybackServiceAT *)self isAudioQueueRunning]
           && (v15 != 60 || ![(VSAudioPlaybackServiceAT *)self isAudioQueueStalled]));
      uint64_t v16 = AudioQueueRemovePropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_VSAudioPlaybackServiceRunningStateChanged, self);
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = v16;
      uint64_t v18 = VSGetLogDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(NSString, "vs_stringFrom4CC:", v17);
        LODWORD(v27.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&v27.tv_sec + 4) = (__darwin_time_t)v23;
        _os_log_error_impl(&dword_226CB1000, v18, OS_LOG_TYPE_ERROR, "Error AudioQueueRemovePropertyListener %@", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F08410];
      uint64_t v11 = (int)v17;
      uint64_t v25 = *MEMORY[0x263F08320];
      v26 = @"Error AudioQueueRemovePropertyListener";
      uint64_t v12 = NSDictionary;
      __int16 v13 = &v26;
      uint64_t v14 = &v25;
    }
    uint64_t v19 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    uint64_t v20 = [v9 errorWithDomain:v10 code:v11 userInfo:v19];
    error = self->_error;
    self->_error = v20;

LABEL_17:
    pthread_mutex_unlock(p_waitForStateChangeMutex);
  }
}

- (void)pause
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = AudioQueuePause(self->_audioQueue);
  double v4 = VSGetLogDefault();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "vs_stringFrom4CC:", v3);
      uint64_t v11 = (VSAudioPlaybackServiceAT *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      int v15 = v11;
      _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueuePause %@", buf, 0xCu);
    }
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v12 = *MEMORY[0x263F08320];
    __int16 v13 = @"Error AudioQueuePause";
    BOOL v5 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v8 = [v6 errorWithDomain:v7 code:(int)v3 userInfo:v5];
    error = self->_error;
    self->_error = v8;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int v15 = self;
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p success AudioQueuePause", buf, 0xCu);
  }

  timebase = self->_timebase;
  if (timebase) {
    CMTimebaseSetRate(timebase, 0.0);
  }
}

- (void)stop
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_INFO, "AudioQueue will stop", buf, 2u);
  }

  self->_int64_t state = 4;
  pthread_mutex_lock(&__VSAudioQueueBufferLock);
  [(NSMutableArray *)self->_enqueuedMappedAudioInfo removeAllObjects];
  [(NSCondition *)self->_dequeueCondition lock];
  [(NSCondition *)self->_dequeueCondition signal];
  [(NSCondition *)self->_dequeueCondition unlock];
  pthread_mutex_unlock(&__VSAudioQueueBufferLock);
  uint64_t v4 = AudioQueueStop(self->_audioQueue, 1u);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "vs_stringFrom4CC:", v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %@", buf, 0xCu);
    }
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08410];
    uint64_t v13 = *MEMORY[0x263F08320];
    uint64_t v14 = @"Error AudioQueueStop";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:(int)v5 userInfo:v9];
    error = self->_error;
    self->_error = v10;
  }
  [(VSAudioPlaybackServiceAT *)self signalQueueRunningStateChange];
  [(VSAudioPlaybackServiceAT *)self didEndAccessPower];
  self->_enqueuedSampleCount = 0.0;
}

- (void)flushAndStop
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_INFO, "AudioQueue will flushAndStop", buf, 2u);
  }

  self->_int64_t state = 3;
  [(NSCondition *)self->_dequeueCondition lock];
  while ([(NSMutableArray *)self->_enqueuedMappedAudioInfo count])
  {
    if (![(NSCondition *)self->_dequeueCondition waitUntilDate:self->_audioQueueFutureEndDate])
    {
      uint64_t v4 = VSGetLogDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v4, OS_LOG_TYPE_ERROR, "Timeout in AudioQueue dequeue condition.", buf, 2u);
      }

      break;
    }
  }
  [(NSCondition *)self->_dequeueCondition unlock];
  uint64_t v5 = AudioQueueFlush(self->_audioQueue);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "vs_stringFrom4CC:", v6);
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Error AudioQueueFlush %@", buf, 0xCu);
    }
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v6 = (int)v6;
    uint64_t v33 = *MEMORY[0x263F08320];
    v34 = @"Error AudioQueueFlush";
    uint64_t v10 = NSDictionary;
    uint64_t v11 = &v34;
    uint64_t v12 = &v33;
LABEL_17:
    int v15 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    uint64_t v16 = [v8 errorWithDomain:v9 code:v6 userInfo:v15];
    error = self->_error;
    self->_error = v16;

    return;
  }
  uint64_t v13 = AudioQueueStop(self->_audioQueue, 0);
  if (v13)
  {
    uint64_t v6 = v13;
    uint64_t v14 = VSGetLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      timeval v27 = objc_msgSend(NSString, "vs_stringFrom4CC:", v6);
      *(_DWORD *)buf = 138412290;
      v36 = v27;
      _os_log_error_impl(&dword_226CB1000, v14, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %@", buf, 0xCu);
    }
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v6 = (int)v6;
    uint64_t v31 = *MEMORY[0x263F08320];
    v32 = @"Error AudioQueueStop";
    uint64_t v10 = NSDictionary;
    uint64_t v11 = &v32;
    uint64_t v12 = &v31;
    goto LABEL_17;
  }
  [(VSAudioPlaybackServiceAT *)self waitForAudioQueueStop];
  uint64_t v18 = AudioQueueStop(self->_audioQueue, 1u);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "vs_stringFrom4CC:", v19);
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %@", buf, 0xCu);
    }
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08410];
    uint64_t v29 = *MEMORY[0x263F08320];
    v30 = @"Error AudioQueueStop";
    v23 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    timespec v24 = [v21 errorWithDomain:v22 code:(int)v19 userInfo:v23];
    uint64_t v25 = self->_error;
    self->_error = v24;
  }
  [(VSAudioPlaybackServiceAT *)self didEndAccessPower];
  self->_int64_t state = 4;
  self->_enqueuedSampleCount = 0.0;
}

- (id)_enqueueAudioBytesLength:(unsigned int)a3 audioBytes:(const void *)a4 packetCount:(int64_t)a5 packetDescriptions:(const void *)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a3)
  {
    AudioQueueBufferRef outBuffer = 0;
    uint64_t v11 = AudioQueueAllocateBuffer(self->_audioQueue, a3, &outBuffer);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v43 = objc_msgSend(NSString, "vs_stringFrom4CC:", v12);
        LODWORD(outTimeStamp.mSampleTime) = 138412290;
        *(void *)((char *)&outTimeStamp.mSampleTime + 4) = v43;
        _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, "Error AudioQueueAllocateBuffer %@", (uint8_t *)&outTimeStamp, 0xCu);
      }
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08410];
      uint64_t v16 = (int)v12;
LABEL_23:
      v34 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
      goto LABEL_32;
    }
    memcpy(outBuffer->mAudioData, a4, a3);
    outBuffer->mAudioDataByteSize = a3;
    memset(&outTimeStamp, 0, sizeof(outTimeStamp));
    OSStatus CurrentTime = AudioQueueGetCurrentTime(self->_audioQueue, 0, &outTimeStamp, 0);
    if (self->_enqueuedSampleCount == 0.0)
    {
      uint64_t v18 = [MEMORY[0x263EFF910] date];
      audioQueueStartDate = self->_audioQueueStartDate;
      self->_audioQueueStartDate = v18;
    }
    if (!CurrentTime)
    {
      double mSampleTime = self->_audioStartTimeStamp.mSampleTime;
      if (mSampleTime == 3.40282347e38)
      {
        p_audioStartTimeStamp = &self->_audioStartTimeStamp;
        long long v22 = *(_OWORD *)&outTimeStamp.mRateScalar;
        *(_OWORD *)&self->_audioStartTimeStamp.double mSampleTime = *(_OWORD *)&outTimeStamp.mSampleTime;
        *(_OWORD *)&self->_audioStartTimeStamp.mRateScalar = v22;
        long long v23 = *(_OWORD *)&outTimeStamp.mSMPTETime.mHours;
        *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mSubframes = *(_OWORD *)&outTimeStamp.mSMPTETime.mSubframes;
        *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mHours = v23;
        timespec v24 = VSGetLogDefault();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          double v25 = p_audioStartTimeStamp->mSampleTime;
          *(_DWORD *)buf = 134217984;
          v47 = *(VSAudioPlaybackServiceAT **)&v25;
          _os_log_impl(&dword_226CB1000, v24, OS_LOG_TYPE_INFO, "Audio queue start sample time: %.0f", buf, 0xCu);
        }

        double mSampleTime = p_audioStartTimeStamp->mSampleTime;
      }
      double v26 = outTimeStamp.mSampleTime;
      double enqueuedSampleCount = self->_enqueuedSampleCount;
      BOOL discontinuedDuringPlayback = self->_discontinuedDuringPlayback;
      if (outTimeStamp.mSampleTime > enqueuedSampleCount + mSampleTime) {
        BOOL discontinuedDuringPlayback = 1;
      }
      self->_BOOL discontinuedDuringPlayback = discontinuedDuringPlayback;
      if (v26 > enqueuedSampleCount + mSampleTime)
      {
        double v29 = v26 - enqueuedSampleCount - mSampleTime;
        v30 = VSGetLogDefault();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v47) = (int)v29;
          _os_log_error_impl(&dword_226CB1000, v30, OS_LOG_TYPE_ERROR, "Detected stalled audio generation, will enqueue %d silence frame to compensate.", buf, 8u);
        }

        AudioQueueEnqueueSilence();
        self->_double enqueuedSampleCount = v29 + self->_enqueuedSampleCount;
      }
    }
    uint64_t v31 = AudioQueueEnqueueBuffer(self->_audioQueue, outBuffer, a5, (const AudioStreamPacketDescription *)a6);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = VSGetLogDefault();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSString, "vs_stringFrom4CC:", v32);
        v44 = (VSAudioPlaybackServiceAT *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v44;
        _os_log_error_impl(&dword_226CB1000, v33, OS_LOG_TYPE_ERROR, "Error AudioQueueEnqueueBuffer %@", buf, 0xCu);
      }
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08410];
      uint64_t v16 = (int)v32;
      goto LABEL_23;
    }
    kdebug_trace();
    if (a5 && a6) {
      double v35 = (double)(self->_asbd.mFramesPerPacket * a5);
    }
    else {
      double v35 = (double)(a3 / self->_asbd.mBytesPerFrame);
    }
    double v36 = v35 + self->_enqueuedSampleCount;
    self->_double enqueuedSampleCount = v36;
    uint64_t v37 = [(NSDate *)self->_audioQueueStartDate dateByAddingTimeInterval:v36 / self->_asbd.mSampleRate];
    audioQueueFutureEndDate = self->_audioQueueFutureEndDate;
    self->_audioQueueFutureEndDate = v37;

    v39 = VSGetLogDefault();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      double v40 = self->_enqueuedSampleCount;
      BOOL v41 = self->_discontinuedDuringPlayback;
      *(_DWORD *)buf = 134219008;
      v47 = self;
      __int16 v48 = 2048;
      Float64 v49 = outTimeStamp.mSampleTime;
      __int16 v50 = 2048;
      uint64_t v51 = a3;
      __int16 v52 = 2048;
      double v53 = v40;
      __int16 v54 = 1024;
      BOOL v55 = v41;
      _os_log_impl(&dword_226CB1000, v39, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p enqueued audio buffer at sample time: %.2f, size: %ld, total enqueued samples: %.0f, discontinuity: %{BOOL}d", buf, 0x30u);
    }
  }
  v34 = 0;
LABEL_32:
  return v34;
}

- (void)dequeueAvailableMappedAudio
{
  if (self->_playingBufferCount <= 2)
  {
    do
    {
      if (![(NSMutableArray *)self->_enqueuedMappedAudioInfo count] || self->_state == 4) {
        break;
      }
      uint64_t v3 = [(NSMutableArray *)self->_enqueuedMappedAudioInfo firstObject];
      [(NSMutableArray *)self->_enqueuedMappedAudioInfo removeObjectAtIndex:0];
      [v3 audioBytesRange];
      uint64_t v5 = -[VSAudioPlaybackServiceAT _enqueueAudioBytesLength:audioBytes:packetCount:packetDescriptions:](self, "_enqueueAudioBytesLength:audioBytes:packetCount:packetDescriptions:", v4, -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v3 audioBytesRange]), objc_msgSend(v3, "packetCount"), -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v3, "packetDescriptionsRange")));
      if (!v5) {
        ++self->_playingBufferCount;
      }
      [(NSCondition *)self->_dequeueCondition lock];
      [(NSCondition *)self->_dequeueCondition broadcast];
      [(NSCondition *)self->_dequeueCondition unlock];
    }
    while (self->_playingBufferCount < 3);
  }
}

- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  pthread_mutex_lock(&__VSAudioQueueBufferLock);
  uint64_t v16 = objc_alloc_init(VSAudioMappedInfoAT);
  uint64_t v10 = [(VSMappedData *)self->_mappedData appendData:v9];
  uint64_t v12 = v11;

  -[VSAudioMappedInfoAT setAudioBytesRange:](v16, "setAudioBytesRange:", v10, v12);
  [(VSAudioMappedInfoAT *)v16 setPacketCount:a4];
  uint64_t v13 = [(VSMappedData *)self->_mappedData appendData:v8];
  uint64_t v15 = v14;

  -[VSAudioMappedInfoAT setPacketDescriptionsRange:](v16, "setPacketDescriptionsRange:", v13, v15);
  [(NSMutableArray *)self->_enqueuedMappedAudioInfo addObject:v16];
  [(VSAudioPlaybackServiceAT *)self dequeueAvailableMappedAudio];
  pthread_mutex_unlock(&__VSAudioQueueBufferLock);
}

- (id)start
{
  v22[1] = *MEMORY[0x263EF8340];
  error = self->_error;
  self->_error = 0;

  uint64_t v4 = AudioQueueStart(self->_audioQueue, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "vs_stringFrom4CC:", v5);
      LODWORD(v20.value) = 138412290;
      *(CMTimeValue *)((char *)&v20.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "Error AudioQueueStart %@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08410];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = @"Error AudioQueueStart";
    id v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:(int)v5 userInfo:v9];
  }
  else
  {
    self->_int64_t state = 2;
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    audioQueueStartDate = self->_audioQueueStartDate;
    self->_audioQueueStartDate = v11;

    uint64_t v13 = [(NSDate *)self->_audioQueueStartDate dateByAddingTimeInterval:self->_enqueuedSampleCount / self->_asbd.mSampleRate];
    audioQueueFutureEndDate = self->_audioQueueFutureEndDate;
    self->_audioQueueFutureEndDate = v13;

    uint64_t v15 = VSGetLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v20.value) = 134217984;
      *(CMTimeValue *)((char *)&v20.value + 4) = (CMTimeValue)self;
      _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_DEFAULT, "VSAudioPlaybackService %p success AudioQueueStart", (uint8_t *)&v20, 0xCu);
    }

    timebase = self->_timebase;
    if (timebase)
    {
      CMTimebaseSetRate(timebase, 1.0);
      uint64_t v17 = self->_timebase;
      CMTime v20 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      CMTimebaseSetTime(v17, &v20);
    }
    uint64_t v10 = 0;
  }
  return v10;
}

- (void)signalQueueRunningStateChange
{
  p_waitForStateChangeMutex = &self->_waitForStateChangeMutex;
  pthread_mutex_lock(&self->_waitForStateChangeMutex);
  uint64_t v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_INFO, "Signal AudioQueue running state change", v5, 2u);
  }

  pthread_cond_broadcast(&self->_stateChangeCondition);
  pthread_mutex_unlock(p_waitForStateChangeMutex);
}

- (void)handleMediaServerReset
{
  uint64_t v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "mediaserverd reset", v4, 2u);
  }

  [(VSAudioPlaybackServiceAT *)self stop];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = AudioQueueDispose(self->_audioQueue, 1u);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "Error AudioQueueDispose %@", buf, 0xCu);
    }
  }
  timebase = self->_timebase;
  if (timebase) {
    CFRelease(timebase);
  }
  v9.receiver = self;
  v9.super_class = (Class)VSAudioPlaybackServiceAT;
  [(VSAudioPlaybackServiceAT *)&v9 dealloc];
}

- (VSAudioPlaybackServiceAT)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  v38.receiver = self;
  v38.super_class = (Class)VSAudioPlaybackServiceAT;
  uint64_t v7 = [(VSAudioPlaybackServiceAT *)&v38 init];
  uint64_t v8 = v7;
  if (v7)
  {
    *((void *)v7 + 5) = 1;
    long long v9 = *(_OWORD *)&a4->mSampleRate;
    long long v10 = *(_OWORD *)&a4->mBytesPerPacket;
    *((void *)v7 + 17) = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)(v7 + 120) = v10;
    *(_OWORD *)(v7 + 104) = v9;
    if (a3)
    {
      *((_DWORD *)v7 + 3) = a3;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263EF93E0] sharedInstance];
      *((_DWORD *)v8 + 3) = [v11 opaqueSessionID];
    }
    *((void *)v8 + 18) = 1018212795;
    *(_OWORD *)(v8 + 200) = 0u;
    *(_OWORD *)(v8 + 216) = 0u;
    *(_OWORD *)(v8 + 232) = 0u;
    *(_OWORD *)(v8 + 152) = 0u;
    *(_OWORD *)(v8 + 168) = 0u;
    *((void *)v8 + 23) = 0;
    *((void *)v8 + 24) = 850045863;
    *((void *)v8 + 31) = 0;
    *((void *)v8 + 32) = 0x47EFFFFFE0000000;
    id v12 = objc_alloc_init(MEMORY[0x263F84E38]);
    uint64_t v13 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v12;

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = (void *)*((void *)v8 + 10);
    *((void *)v8 + 10) = v14;

    id v16 = objc_alloc_init(MEMORY[0x263F08740]);
    uint64_t v17 = (void *)*((void *)v8 + 12);
    *((void *)v8 + 12) = v16;

    uint64_t v18 = AudioQueueNewOutputWithAudioSession();
    if (v18)
    {
      uint64_t v19 = v18;
      CMTime v20 = VSGetLogDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSString, "vs_stringFrom4CC:", v19);
        double v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        double v40 = v35;
        _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "Error AudioQueueNewOutputWithAudioSession %@", buf, 0xCu);
      }
      uint64_t v21 = 0;
      goto LABEL_23;
    }
    uint64_t v22 = AudioQueueSetProperty(*((AudioQueueRef *)v8 + 2), 0x63756964u, &VSAudioPlaybackAudioQueueUID, 8u);
    if (v22)
    {
      uint64_t v23 = v22;
      timespec v24 = VSGetLogDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSString, "vs_stringFrom4CC:", v23);
        double v36 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        double v40 = v36;
        _os_log_error_impl(&dword_226CB1000, v24, OS_LOG_TYPE_ERROR, "Unable to set kAudioQueueProperty_ClientUID, errno: %@", buf, 0xCu);
      }
    }
    CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    HostTimeClock = CMClockGetHostTimeClock();
    uint64_t v27 = CMTimebaseCreateWithSourceClock(v25, HostTimeClock, (CMTimebaseRef *)v8 + 4);
    if (v27)
    {
      uint64_t v28 = v27;
      double v29 = VSGetLogDefault();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSString, "vs_stringFrom4CC:", v28);
        uint64_t v37 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        double v40 = v37;
        _os_log_error_impl(&dword_226CB1000, v29, OS_LOG_TYPE_ERROR, "Error CMTimebaseCreateWithSourceClock: %@", buf, 0xCu);
      }
    }
    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v8 selector:sel_handleMediaServerReset name:*MEMORY[0x263EF90F8] object:0];

    uint64_t v31 = VSGetLogDefault();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = a3;
      _os_log_impl(&dword_226CB1000, v31, OS_LOG_TYPE_DEFAULT, "AudioQueue initialized with session ID: %d", buf, 8u);
    }
  }
  mach_absolute_time();
  uint64_t v32 = VSGetLogDefault();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    VSAbsoluteTimeToSecond();
    *(_DWORD *)buf = 134218240;
    double v40 = v8;
    __int16 v41 = 2048;
    uint64_t v42 = v33;
    _os_log_impl(&dword_226CB1000, v32, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p init latency: %.3f", buf, 0x16u);
  }

  uint64_t v21 = v8;
LABEL_23:

  return v21;
}

@end