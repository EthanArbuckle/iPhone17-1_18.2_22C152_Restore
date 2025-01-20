@interface VSAudioPlaybackServiceAVSBAR
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mappedAudioQueuedTimeStamp;
- (AVSampleBufferAudioRenderer)renderer;
- (AVSampleBufferRenderSynchronizer)synchronizer;
- (AudioStreamBasicDescription)asbd;
- (BOOL)discontinuedDuringPlayback;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (BOOL)startedProvidingData;
- (NSError)error;
- (NSMutableArray)enqueuedMappedAudioInfo;
- (NSString)outputRoute;
- (OS_dispatch_queue)dataQueue;
- (OS_dispatch_semaphore)noRemainTasks;
- (VSAudioPlaybackServiceAVSBAR)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4;
- (VSMappedData)mappedData;
- (_opaque_pthread_mutex_t)audioQueueBufferLock;
- (_opaque_pthread_mutex_t)stateLock;
- (double)duration:(id)a3;
- (double)rendererEnqueuedAudioDuration;
- (id)addBoundaryTimeObserverForTimes:(id)a3 usingBlock:(id)a4;
- (id)start;
- (int64_t)state;
- (opaqueCMSampleBuffer)createSampleBuffer:(id)a3;
- (opaqueCMSampleBuffer)createSilenceEndBuffer;
- (unsigned)sessionID;
- (void)_play;
- (void)_startProvidingData;
- (void)addEndOfDataAttachment;
- (void)createSampleBufferIdNeeded:(id)a3;
- (void)dealloc;
- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5;
- (void)flushAndStop;
- (void)freeAudioQueue;
- (void)handleMediaServerReset;
- (void)pause;
- (void)provideMoreData;
- (void)removeTimeObserver:(id)a3;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioQueueBufferLock:(_opaque_pthread_mutex_t *)a3;
- (void)setDataQueue:(id)a3;
- (void)setEnqueuedMappedAudioInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setMappedAudioQueuedTimeStamp:(id *)a3;
- (void)setMappedData:(id)a3;
- (void)setNoRemainTasks:(id)a3;
- (void)setOutputRoute:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setRendererEnqueuedAudioDuration:(double)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setStartedProvidingData:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStateLock:(_opaque_pthread_mutex_t *)a3;
- (void)setSynchronizer:(id)a3;
- (void)stop;
- (void)stopWaiting;
@end

@implementation VSAudioPlaybackServiceAVSBAR

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noRemainTasks, 0);
  objc_storeStrong((id *)&self->_enqueuedMappedAudioInfo, 0);
  objc_storeStrong((id *)&self->_mappedData, 0);
  objc_storeStrong((id *)&self->_outputRoute, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_synchronizer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setNoRemainTasks:(id)a3
{
}

- (OS_dispatch_semaphore)noRemainTasks
{
  return self->_noRemainTasks;
}

- (void)setStartedProvidingData:(BOOL)a3
{
  self->_startedProvidingData = a3;
}

- (BOOL)startedProvidingData
{
  return self->_startedProvidingData;
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

- (void)setOutputRoute:(id)a3
{
}

- (NSString)outputRoute
{
  return self->_outputRoute;
}

- (void)setRendererEnqueuedAudioDuration:(double)a3
{
  self->_rendererEnqueuedAudioDuration = a3;
}

- (double)rendererEnqueuedAudioDuration
{
  return self->_rendererEnqueuedAudioDuration;
}

- (void)setMappedAudioQueuedTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_mappedAudioQueuedTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_mappedAudioQueuedTimeStamp.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mappedAudioQueuedTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
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

- (void)setStateLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_stateLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_stateLock.__opaque[40] = v5;
  *(_OWORD *)&self->_stateLock.__sig = v3;
  *(_OWORD *)&self->_stateLock.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)stateLock
{
  long long v3 = *(_OWORD *)&self[3].__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[3].__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[4].__opaque[8];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[4].__sig;
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setDataQueue:(id)a3
{
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setSynchronizer:(id)a3
{
}

- (AVSampleBufferRenderSynchronizer)synchronizer
{
  return self->_synchronizer;
}

- (void)setRenderer:(id)a3
{
}

- (AVSampleBufferAudioRenderer)renderer
{
  return self->_renderer;
}

- (void)setAudioQueueBufferLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_audioQueueBufferLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_audioQueueBufferLock.__opaque[40] = v5;
  *(_OWORD *)&self->_audioQueueBufferLock.__sig = v3;
  *(_OWORD *)&self->_audioQueueBufferLock.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)audioQueueBufferLock
{
  long long v3 = *(_OWORD *)&self[2].__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[2].__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
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
  long long v3 = *(_OWORD *)&self[3].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[3].mBitsPerChannel;
  return self;
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  [(AVSampleBufferAudioRenderer *)self->_renderer volume];
  *(_DWORD *)a3 = v7;
  [(AVSampleBufferAudioRenderer *)self->_renderer volume];
  *(_DWORD *)a4 = v8;
  return 1;
}

- (void)removeTimeObserver:(id)a3
{
  if (a3) {
    -[AVSampleBufferRenderSynchronizer removeTimeObserver:](self->_synchronizer, "removeTimeObserver:");
  }
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  int v7 = [a3 sortedArrayUsingComparator:&__block_literal_global];
  objc_initWeak(&location, self);
  synchronizer = self->_synchronizer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_2;
  v13[3] = &unk_2647DC760;
  objc_copyWeak(&v16, &location);
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  v11 = [(AVSampleBufferRenderSynchronizer *)synchronizer addBoundaryTimeObserverForTimes:v9 queue:0 usingBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    long long v4 = (void *)*((void *)WeakRetained + 4);
    if (v4) {
      [v4 currentTime];
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_3;
    v6[3] = &unk_2647DC738;
    long long v8 = v10;
    uint64_t v9 = v11;
    long long v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v5 enumerateObjectsWithOptions:2 usingBlock:v6];
  }
}

void __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  memset(&v11, 0, sizeof(v11));
  if (v6) {
    [v6 CMTimeValue];
  }
  CMTime time1 = v11;
  CMTime v9 = *(CMTime *)(a1 + 40);
  if (CMTimeCompare(&time1, &v9) <= 0)
  {
    long long v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    CMTime time1 = v11;
    v8();
    *a4 = 1;
  }
}

uint64_t __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  [v4 CMTimeValue];
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  [v6 CMTimeValue];
LABEL_6:
  uint64_t v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

- (void)freeAudioQueue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_audioQueueBufferLock = &self->_audioQueueBufferLock;
  pthread_mutex_lock(&self->_audioQueueBufferLock);
  if ([(NSMutableArray *)self->_enqueuedMappedAudioInfo count])
  {
    id v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(NSMutableArray *)self->_enqueuedMappedAudioInfo count];
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v5;
      _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEFAULT, "#AVSBAR Dropping %lu enqueued data", buf, 0xCu);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_enqueuedMappedAudioInfo;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          CMTime v11 = *(const void **)(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 8);
          if (v11) {
            CFRelease(v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_enqueuedMappedAudioInfo removeAllObjects];
  }
  pthread_mutex_unlock(p_audioQueueBufferLock);
}

- (void)pause
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "Pausing synchronizer", buf, 2u);
  }

  pthread_mutex_lock(&self->_stateLock);
  self->_state = 1;
  pthread_mutex_unlock(&self->_stateLock);
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    synchronizer = self->_synchronizer;
    if (synchronizer) {
      [(AVSampleBufferRenderSynchronizer *)synchronizer currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 134217984;
    Float64 v12 = Seconds;
    _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEFAULT, "#AVSBAR synchronizer.rate will be set to 0 (at current time: %f).", buf, 0xCu);
  }

  mach_absolute_time();
  [(AVSampleBufferRenderSynchronizer *)self->_synchronizer setRate:0.0];
  mach_absolute_time();
  VSAbsoluteTimeToSecond();
  if (v7 > 0.25)
  {
    uint64_t v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      VSAbsoluteTimeToSecond();
      *(_DWORD *)buf = 134217984;
      Float64 v12 = v9;
      _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "_synchronizer pause rate high latency: %.3f sec", buf, 0xCu);
    }
  }
}

- (void)stop
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "Stopping synchronizer and renderer", buf, 2u);
  }

  pthread_mutex_lock(&self->_stateLock);
  self->_state = 4;
  pthread_mutex_unlock(&self->_stateLock);
  [(VSAudioPlaybackServiceAVSBAR *)self stopWaiting];
  [(AVSampleBufferAudioRenderer *)self->_renderer stopRequestingMediaData];
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    synchronizer = self->_synchronizer;
    if (synchronizer) {
      [(AVSampleBufferRenderSynchronizer *)synchronizer currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 134217984;
    *(Float64 *)&uint8_t buf[4] = Seconds;
    _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEFAULT, "#AVSBAR synchronizer.rate will be set to 0 and time set to 0 (from current time: %f). Then renderer will be flushed.", buf, 0xCu);
  }

  mach_absolute_time();
  double v7 = self->_synchronizer;
  *(_OWORD *)buf = *MEMORY[0x263F010E0];
  uint64_t v17 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(AVSampleBufferRenderSynchronizer *)v7 setRate:buf time:0.0];
  mach_absolute_time();
  VSAbsoluteTimeToSecond();
  if (v8 > 0.25)
  {
    double v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      VSAbsoluteTimeToSecond();
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_error_impl(&dword_226CB1000, v9, OS_LOG_TYPE_ERROR, "_synchronizer stop rate high latency: %.3f sec", buf, 0xCu);
    }
  }
  uint64_t v10 = VSGetLogDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    [(AVSampleBufferRenderSynchronizer *)self->_synchronizer rate];
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "#AVSBAR synchronizer.rate was set to 0. Current rate: %f", buf, 0xCu);
  }

  Float64 v12 = dispatch_get_global_queue(33, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__VSAudioPlaybackServiceAVSBAR_stop__block_invoke;
  v14[3] = &unk_2647DCD78;
  v14[4] = self;
  dispatch_async(v12, v14);
}

void __36__VSAudioPlaybackServiceAVSBAR_stop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) flush];
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "#AVSBAR renderer was flushed", v3, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  if (sLastSynchronizer == *(void *)(*(void *)(a1 + 32) + 32)) {
    sLastSynchronizerStartedProvidingData = 0;
  }
}

- (void)stopWaiting
{
  dsema = self->_noRemainTasks;
  noRemainTasks = self->_noRemainTasks;
  self->_noRemainTasks = 0;

  id v4 = dsema;
  if (dsema)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)dsema);
    id v4 = dsema;
  }
}

- (void)flushAndStop
{
  v41[1] = *MEMORY[0x263EF8340];
  long long v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_INFO, "#AVSBAR flushAndStop", (uint8_t *)&buf, 2u);
  }

  pthread_mutex_lock(&self->_stateLock);
  if ((unint64_t)(self->_state - 3) > 1)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    objc_storeStrong((id *)&self->_noRemainTasks, v5);
    self->_state = 3;
    pthread_mutex_unlock(&self->_stateLock);
    [(VSAudioPlaybackServiceAVSBAR *)self addEndOfDataAttachment];
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke;
    block[3] = &unk_2647DCD78;
    block[4] = self;
    dispatch_sync(dataQueue, block);
    memset(&buf, 0, sizeof(buf));
    synchronizer = self->_synchronizer;
    if (synchronizer)
    {
      [(AVSampleBufferRenderSynchronizer *)synchronizer currentTime];
      double v8 = self->_synchronizer;
    }
    else
    {
      double v8 = 0;
    }
    CMTime mappedAudioQueuedTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
    double v9 = [MEMORY[0x263F08D40] valueWithBytes:&mappedAudioQueuedTimeStamp objCType:"{?=qiIq}"];
    v41[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    float v11 = self->_dataQueue;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke_2;
    v32[3] = &unk_2647DCD78;
    id v4 = v5;
    v33 = v4;
    Float64 v12 = [(AVSampleBufferRenderSynchronizer *)v8 addBoundaryTimeObserverForTimes:v10 queue:v11 usingBlock:v32];

    double v13 = 0.0;
    *(void *)&long long v14 = 134218240;
    long long v30 = v14;
    while (1)
    {
      CMTime time1 = buf;
      CMTime time2 = mappedAudioQueuedTimeStamp;
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
        break;
      }
      long long v15 = VSGetLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CMTime time1 = buf;
        Float64 Seconds = CMTimeGetSeconds(&time1);
        CMTime time1 = mappedAudioQueuedTimeStamp;
        Float64 v17 = CMTimeGetSeconds(&time1);
        LODWORD(time1.value) = v30;
        *(Float64 *)((char *)&time1.value + 4) = Seconds;
        LOWORD(time1.flags) = 2048;
        *(Float64 *)((char *)&time1.flags + 2) = v17;
        _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_DEFAULT, "#AVSBAR Waiting for synchronizer finishing playing between current %f sec and until %f sec", (uint8_t *)&time1, 0x16u);
      }

      dispatch_time_t v18 = dispatch_time(0, 1000000000);
      if (!dispatch_semaphore_wait(v4, v18) || !self->_noRemainTasks) {
        break;
      }
      memset(&time1, 0, sizeof(time1));
      uint64_t v19 = self->_synchronizer;
      if (v19)
      {
        [(AVSampleBufferRenderSynchronizer *)v19 currentTime];
        uint64_t v19 = self->_synchronizer;
      }
      [(AVSampleBufferRenderSynchronizer *)v19 rate];
      if (v20 <= 0.0 || (time2 = time1, CMTime v31 = buf, CMTimeCompare(&time2, &v31) <= 0))
      {
        if (self->_state != 1)
        {
          double v13 = v13 + 1.0;
          if (v13 >= 5.0)
          {
            v21 = VSGetLogDefault();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              [(AVSampleBufferRenderSynchronizer *)self->_synchronizer rate];
              double v28 = v27;
              CMTime time2 = time1;
              Float64 v29 = CMTimeGetSeconds(&time2);
              LODWORD(time2.value) = v30;
              *(double *)((char *)&time2.value + 4) = v28;
              LOWORD(time2.flags) = 2048;
              *(Float64 *)((char *)&time2.flags + 2) = v29;
              _os_log_error_impl(&dword_226CB1000, v21, OS_LOG_TYPE_ERROR, "#AVSBAR Synchronizer is stalled with rate %f at time %f.", (uint8_t *)&time2, 0x16u);
            }

            v22 = (void *)MEMORY[0x263F087E8];
            uint64_t v37 = *MEMORY[0x263F08320];
            v38 = @"Timeout waiting for AVSampleBufferRenderSynchronizer";
            v23 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            v24 = [v22 errorWithDomain:@"VoiceServicesErrorDomain" code:450 userInfo:v23];
            error = self->_error;
            self->_error = v24;

            break;
          }
        }
      }
      CMTime buf = time1;
    }
    -[AVSampleBufferRenderSynchronizer removeTimeObserver:](self->_synchronizer, "removeTimeObserver:", v12, v30);
    noRemainTasks = self->_noRemainTasks;
    self->_noRemainTasks = 0;

    [(VSAudioPlaybackServiceAVSBAR *)self stop];
  }
  else
  {
    pthread_mutex_unlock(&self->_stateLock);
    id v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_error_impl(&dword_226CB1000, v4, OS_LOG_TYPE_ERROR, "#AVSBAR already stopped or waiting for finish", (uint8_t *)&buf, 2u);
    }
  }
}

uint64_t __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) provideMoreData];
}

intptr_t __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke_2(uint64_t a1)
{
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "#AVSBAR Synchronizer reached endTime", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)provideMoreData
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_enqueuedMappedAudioInfo count])
  {
    long long v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int64_t state = self->_state;
      *(_DWORD *)CMTime buf = 134217984;
      int64_t v34 = state;
      _os_log_debug_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEBUG, "#AVSBAR Call to provide more audio data during state %ld.", buf, 0xCu);
    }
  }
  if ([(AVSampleBufferAudioRenderer *)self->_renderer isReadyForMoreMediaData])
  {
    *(void *)&long long v4 = 134217984;
    long long v26 = v4;
    while (1)
    {
      pthread_mutex_lock(&self->_audioQueueBufferLock);
      uint64_t v5 = [(NSMutableArray *)self->_enqueuedMappedAudioInfo firstObject];
      if (!v5) {
        break;
      }
      id v6 = (CFTypeRef *)v5;
      [(NSMutableArray *)self->_enqueuedMappedAudioInfo removeObjectAtIndex:0];
      [(VSAudioPlaybackServiceAVSBAR *)self createSampleBufferIdNeeded:v6];
      pthread_mutex_unlock(&self->_audioQueueBufferLock);
      double v7 = (opaqueCMSampleBuffer *)v6[1];
      if (v7)
      {
        CMSampleBufferGetOutputDuration(&time, v7);
        double Seconds = CMTimeGetSeconds(&time);
        double v9 = VSGetLogDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          renderer = self->_renderer;
          *(_DWORD *)CMTime buf = 138412546;
          int64_t v34 = (int64_t)renderer;
          __int16 v35 = 2048;
          double v36 = Seconds;
          _os_log_impl(&dword_226CB1000, v9, OS_LOG_TYPE_INFO, "#AVSBAR Enqueuing to %@: %f sec", buf, 0x16u);
        }

        mach_absolute_time();
        float v11 = [(VSAudioPlaybackServiceAVSBAR *)self renderer];
        [v11 enqueueSampleBuffer:v6[1]];

        mach_absolute_time();
        VSAbsoluteTimeToSecond();
        if (v12 > 0.25)
        {
          double v13 = VSGetLogDefault();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            VSAbsoluteTimeToSecond();
            *(_DWORD *)CMTime buf = v26;
            int64_t v34 = v14;
            _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, "_renderer enqueueSampleBuffer high latency: %.3f sec", buf, 0xCu);
          }
        }
        CFRelease(v6[1]);
        self->_rendererEnqueuedAudioDuration = Seconds + self->_rendererEnqueuedAudioDuration;
        kdebug_trace();
      }

      if (([(AVSampleBufferAudioRenderer *)self->_renderer isReadyForMoreMediaData] & 1) == 0) {
        goto LABEL_19;
      }
    }
    pthread_mutex_unlock(&self->_audioQueueBufferLock);
  }
LABEL_19:
  if ([(NSMutableArray *)self->_enqueuedMappedAudioInfo count])
  {
    long long v15 = VSGetLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = self->_renderer;
      uint64_t v17 = [(NSMutableArray *)self->_enqueuedMappedAudioInfo count];
      *(_DWORD *)CMTime buf = 138412546;
      int64_t v34 = (int64_t)v16;
      __int16 v35 = 2048;
      double v36 = *(double *)&v17;
      _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_INFO, "#AVSBAR Renderer %@ not anymore ready for more media data. enqueuedMappedAudioInfo count left: %lu", buf, 0x16u);
    }

    if (self->_state == 3)
    {
      pthread_mutex_lock(&self->_audioQueueBufferLock);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      dispatch_time_t v18 = self->_enqueuedMappedAudioInfo;
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            [(VSAudioPlaybackServiceAVSBAR *)self createSampleBufferIdNeeded:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          }
          uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v20);
      }

      pthread_mutex_unlock(&self->_audioQueueBufferLock);
    }
  }
  [(AVSampleBufferRenderSynchronizer *)self->_synchronizer rate];
  if (v23 == 0.0)
  {
    int64_t v24 = self->_state;
    if (v24 == 3 || v24 == 2 && self->_rendererEnqueuedAudioDuration > 0.0) {
      [(VSAudioPlaybackServiceAVSBAR *)self _play];
    }
  }
}

- (void)addEndOfDataAttachment
{
  p_audioQueueBufferLock = &self->_audioQueueBufferLock;
  pthread_mutex_lock(&self->_audioQueueBufferLock);
  long long v4 = [(NSMutableArray *)self->_enqueuedMappedAudioInfo lastObject];
  if (v4)
  {
    uint64_t v5 = v4;
    [(VSAudioMappedInfoAVSBAR *)v4 setEndOfSiriTTSUtterance:1];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(VSAudioMappedInfoAVSBAR);
    uint64_t v6 = [(VSMappedData *)self->_mappedData appendData:0];
    -[VSAudioMappedInfoAVSBAR setAudioBytesRange:](v5, "setAudioBytesRange:", v6, v7);
    [(VSAudioMappedInfoAVSBAR *)v5 setPacketCount:0];
    uint64_t v8 = [(VSMappedData *)self->_mappedData appendData:0];
    -[VSAudioMappedInfoAVSBAR setPacketDescriptionsRange:](v5, "setPacketDescriptionsRange:", v8, v9);
    [(VSAudioMappedInfoAVSBAR *)v5 setEndOfSiriTTSUtterance:1];
    [(NSMutableArray *)self->_enqueuedMappedAudioInfo addObject:v5];
  }
  pthread_mutex_unlock(p_audioQueueBufferLock);
  uint64_t v10 = VSGetLogDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)float v11 = 0;
    _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "#AVSBAR EndOfDataAttachment ready for enqueuing", v11, 2u);
  }
}

- (opaqueCMSampleBuffer)createSilenceEndBuffer
{
  v39[1] = *MEMORY[0x263EF8340];
  asbd.mSampleRate = 48000.0;
  *(_OWORD *)&asbd.mFormatID = xmmword_226CFFCE0;
  *(_OWORD *)&asbd.mBytesPerFrame = xmmword_226CFFCF0;
  long long v3 = malloc_type_calloc(2uLL, 0x800uLL, 0x8D699448uLL);
  CMBlockBufferRef blockBufferOut = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  OSStatus v5 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, 0x1000uLL, (CFAllocatorRef)*MEMORY[0x263EFFB18], 0, 0, 0x1000uLL, 0, &blockBufferOut);
  if (v5)
  {
    OSStatus v6 = v5;
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Error in creating block buffer for Silence buffer", (uint8_t *)&presentationTimeStamp, 2u);
    }

    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39[0] = @"Error in creating block buffer for Silence buffer";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    float v11 = [v8 errorWithDomain:v9 code:v6 userInfo:v10];
    error = self->_error;
    self->_error = v11;

    free(v3);
    return 0;
  }
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v13 = CMAudioFormatDescriptionCreate(v4, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  if (v13)
  {
    OSStatus v14 = v13;
    long long v15 = VSGetLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_226CB1000, v15, OS_LOG_TYPE_ERROR, "Error in CMAudioFormatDescriptionCreate from Silence buffer creation", (uint8_t *)&presentationTimeStamp, 2u);
    }

    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v37 = @"Error in CMAudioFormatDescriptionCreate from Silence buffer creation";
    dispatch_time_t v18 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    uint64_t v19 = [v16 errorWithDomain:v17 code:v14 userInfo:v18];
    uint64_t v20 = self->_error;
    self->_error = v19;

    CFRelease(blockBufferOut);
    return 0;
  }
  CMTime presentationTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
  CMSampleBufferRef v30 = 0;
  OSStatus v21 = CMAudioSampleBufferCreateWithPacketDescriptions(v4, blockBufferOut, 1u, 0, 0, formatDescriptionOut, 0x1000 / asbd.mBytesPerFrame, &presentationTimeStamp, 0, &v30);
  CFRelease(blockBufferOut);
  CFRelease(formatDescriptionOut);
  if (v21)
  {
    v22 = VSGetLogDefault();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_226CB1000, v22, OS_LOG_TYPE_ERROR, "Error in CMAudioSampleBufferCreateWithPacketDescriptions from silence buffer", (uint8_t *)&presentationTimeStamp, 2u);
    }

    float v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08410];
    uint64_t v34 = *MEMORY[0x263F08320];
    __int16 v35 = @"Error in CMAudioSampleBufferCreateWithPacketDescriptions from silence buffer";
    v25 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    long long v26 = [v23 errorWithDomain:v24 code:v21 userInfo:v25];
    long long v27 = self->_error;
    self->_error = v26;

    return 0;
  }
  return v30;
}

- (void)_startProvidingData
{
  if (!self->_startedProvidingData)
  {
    self->_startedProvidingData = 1;
    if ((AVSampleBufferRenderSynchronizer *)sLastSynchronizer == self->_synchronizer) {
      sLastSynchronizerStartedProvidingData = 1;
    }
    objc_initWeak(&location, self);
    renderer = self->_renderer;
    dataQueue = self->_dataQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__VSAudioPlaybackServiceAVSBAR__startProvidingData__block_invoke;
    v5[3] = &unk_2647DCA50;
    objc_copyWeak(&v6, &location);
    [(AVSampleBufferAudioRenderer *)renderer requestMediaDataWhenReadyOnQueue:dataQueue usingBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __51__VSAudioPlaybackServiceAVSBAR__startProvidingData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained provideMoreData];
}

- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)(self->_state - 3) > 1)
  {
    if ([v8 length])
    {
      pthread_mutex_lock(&self->_audioQueueBufferLock);
      uint64_t v10 = objc_alloc_init(VSAudioMappedInfoAVSBAR);
      uint64_t v12 = [(VSMappedData *)self->_mappedData appendData:v8];
      -[VSAudioMappedInfoAVSBAR setAudioBytesRange:](v10, "setAudioBytesRange:", v12, v13);
      [(VSAudioMappedInfoAVSBAR *)v10 setPacketCount:a4];
      uint64_t v14 = [(VSMappedData *)self->_mappedData appendData:v9];
      -[VSAudioMappedInfoAVSBAR setPacketDescriptionsRange:](v10, "setPacketDescriptionsRange:", v14, v15);
      id v16 = VSGetLogDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        [(VSAudioPlaybackServiceAVSBAR *)self duration:v10];
        int v18 = 134217984;
        uint64_t v19 = v17;
        _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_INFO, "Adding to enqueuedMappedAudioInfo: %f sec", (uint8_t *)&v18, 0xCu);
      }

      [(NSMutableArray *)self->_enqueuedMappedAudioInfo addObject:v10];
      pthread_mutex_unlock(&self->_audioQueueBufferLock);
      [(VSAudioPlaybackServiceAVSBAR *)self _startProvidingData];
    }
    else
    {
      VSGetLogDefault();
      uint64_t v10 = (VSAudioMappedInfoAVSBAR *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        float v11 = "#AVSBAR empty audio data: will not enqueue it";
        goto LABEL_11;
      }
    }
  }
  else
  {
    VSGetLogDefault();
    uint64_t v10 = (VSAudioMappedInfoAVSBAR *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      float v11 = "#AVSBAR already stopped or waiting for finish: will not enqueue more";
LABEL_11:
      _os_log_error_impl(&dword_226CB1000, &v10->super, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v18, 2u);
    }
  }
}

- (double)duration:(id)a3
{
  id v4 = a3;
  OSStatus v5 = v4;
  double v6 = 0.0;
  if (self->_asbd.mSampleRate != 0.0)
  {
    if ([v4 packetCount])
    {
      unint64_t v8 = [v5 packetCount];
      LODWORD(v9) = self->_asbd.mFramesPerPacket;
      double v6 = (double)v8 * (double)v9 / self->_asbd.mSampleRate;
    }
    else
    {
      LODWORD(v7) = self->_asbd.mBytesPerFrame;
      double v10 = self->_asbd.mSampleRate * (double)v7;
      if (v10 != 0.0)
      {
        [v5 audioBytesRange];
        double v6 = (double)v11 / v10;
      }
    }
  }

  return v6;
}

- (opaqueCMSampleBuffer)createSampleBuffer:(id)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  CMBlockBufferRef v46 = 0;
  -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v4 audioBytesRange]);
  if ([v4 packetCount]) {
    packetDescriptions = (const AudioStreamPacketDescription *)-[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v4 packetDescriptionsRange]);
  }
  else {
    packetDescriptions = 0;
  }
  [v4 audioBytesRange];
  unsigned int v7 = v6;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int BlockBufferCopyingMemoryBlock = FigCreateBlockBufferCopyingMemoryBlock();
  if (BlockBufferCopyingMemoryBlock)
  {
    int v10 = BlockBufferCopyingMemoryBlock;
    unint64_t v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_226CB1000, v11, OS_LOG_TYPE_ERROR, "Error in creating block buffer for Sample buffer", (uint8_t *)&presentationTimeStamp, 2u);
    }

    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v51 = *MEMORY[0x263F08320];
    v52[0] = @"Error in creating block buffer for Sample buffer";
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    uint64_t v17 = v10;
  }
  else
  {
    CMAudioFormatDescriptionRef formatDescriptionOut = 0;
    OSStatus v20 = CMAudioFormatDescriptionCreate(v8, &self->_asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
    if (v20)
    {
      OSStatus v21 = v20;
      v22 = VSGetLogDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(presentationTimeStamp.value) = 0;
        _os_log_error_impl(&dword_226CB1000, v22, OS_LOG_TYPE_ERROR, "Error in CMAudioFormatDescriptionCreate", (uint8_t *)&presentationTimeStamp, 2u);
      }

      float v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08410];
      uint64_t v49 = *MEMORY[0x263F08320];
      v50 = @"Error in CMAudioFormatDescriptionCreate";
      v25 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      long long v26 = [v23 errorWithDomain:v24 code:v21 userInfo:v25];
      error = self->_error;
      self->_error = v26;

      CFRelease(v46);
      goto LABEL_13;
    }
    CMSampleBufferRef v44 = 0;
    CMSampleBufferRef v30 = formatDescriptionOut;
    CMTime v31 = v46;
    if (packetDescriptions)
    {
      CMItemCount v32 = [v4 packetCount];
      CMTime presentationTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
      OSStatus v33 = CMAudioSampleBufferCreateWithPacketDescriptions(v8, v31, 1u, 0, 0, v30, v32, &presentationTimeStamp, packetDescriptions, &v44);
    }
    else
    {
      UInt32 mBytesPerFrame = self->_asbd.mBytesPerFrame;
      CMTime presentationTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
      OSStatus v33 = CMAudioSampleBufferCreateWithPacketDescriptions(v8, v46, 1u, 0, 0, formatDescriptionOut, v7 / mBytesPerFrame, &presentationTimeStamp, 0, &v44);
    }
    OSStatus v35 = v33;
    CFRelease(v46);
    CFRelease(formatDescriptionOut);
    if (!v35)
    {
      memset(&presentationTimeStamp, 0, sizeof(presentationTimeStamp));
      CMSampleBufferGetOutputPresentationTimeStamp(&presentationTimeStamp, v44);
      memset(&v42, 0, sizeof(v42));
      CMSampleBufferGetOutputDuration(&v42, v44);
      CMTime lhs = presentationTimeStamp;
      CMTime rhs = v42;
      CMTimeAdd(&v41, &lhs, &rhs);
      self->_CMTime mappedAudioQueuedTimeStamp = ($95D729B680665BEAEFA1D6FCA8238556)v41;
      long long v28 = v44;
      goto LABEL_14;
    }
    uint64_t v36 = VSGetLogDefault();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_226CB1000, v36, OS_LOG_TYPE_ERROR, "Error in CMAudioSampleBufferCreateWithPacketDescriptions", (uint8_t *)&presentationTimeStamp, 2u);
    }

    uint64_t v37 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08410];
    uint64_t v47 = *MEMORY[0x263F08320];
    v48 = @"Error in CMAudioSampleBufferCreateWithPacketDescriptions";
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v15 = v37;
    uint64_t v16 = v38;
    uint64_t v17 = v35;
  }
  int v18 = [v15 errorWithDomain:v16 code:v17 userInfo:v14];
  uint64_t v19 = self->_error;
  self->_error = v18;

LABEL_13:
  long long v28 = 0;
LABEL_14:

  return v28;
}

- (void)createSampleBufferIdNeeded:(id)a3
{
  id v4 = (CMAttachmentBearerRef *)a3;
  OSStatus v5 = v4;
  if (v4[1]) {
    goto LABEL_2;
  }
  [(CMAttachmentBearerRef *)v4 audioBytesRange];
  if (v6)
  {
    unsigned int v7 = [(VSAudioPlaybackServiceAVSBAR *)self createSampleBuffer:v5];
    v5[1] = v7;
    if (!v7)
    {
      CFAllocatorRef v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = 0;
        unint64_t v9 = "Invalid sample buffer";
        int v10 = (uint8_t *)&v13;
LABEL_13:
        _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v11 = [(VSAudioPlaybackServiceAVSBAR *)self createSilenceEndBuffer];
    v5[1] = v11;
    if (!v11)
    {
      CFAllocatorRef v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = 0;
        unint64_t v9 = "Invalid silence buffer";
        int v10 = (uint8_t *)&v12;
        goto LABEL_13;
      }
LABEL_11:

      goto LABEL_2;
    }
  }
  if ([(CMAttachmentBearerRef *)v5 endOfSiriTTSUtterance]) {
    CMSetAttachment(v5[1], (CFStringRef)*MEMORY[0x263F01050], (CFTypeRef)*MEMORY[0x263EFFB40], 0);
  }
LABEL_2:
}

- (void)_play
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double rendererEnqueuedAudioDuration = self->_rendererEnqueuedAudioDuration;
    [(AVSampleBufferRenderSynchronizer *)self->_synchronizer rate];
    *(_DWORD *)CMTime buf = 134218240;
    double v9 = rendererEnqueuedAudioDuration;
    __int16 v10 = 2048;
    double v11 = v5;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "#AVSBAR synchronizer.rate will be set to 1 with enqueued audio duration %f sec. Previous rate: %f", buf, 0x16u);
  }

  uint64_t v6 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__VSAudioPlaybackServiceAVSBAR__play__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_async(v6, block);
}

void __37__VSAudioPlaybackServiceAVSBAR__play__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) state] == 4 || objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v2 = VSGetLogDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "#AVSBAR already stopped or paused: will not resume rate", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    mach_absolute_time();
    long long v3 = [*(id *)(a1 + 32) synchronizer];
    LODWORD(v4) = 1.0;
    [v3 setRate:v4];

    mach_absolute_time();
    VSAbsoluteTimeToSecond();
    if (v5 > 0.25)
    {
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        VSAbsoluteTimeToSecond();
        int v10 = 134217984;
        double v11 = v9;
        _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "_synchronizer play rate high latency: %.3f sec", (uint8_t *)&v10, 0xCu);
      }
    }
    v2 = VSGetLogDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      unsigned int v7 = [*(id *)(a1 + 32) synchronizer];
      [v7 rate];
      int v10 = 134217984;
      double v11 = v8;
      _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "#AVSBAR synchronizer.rate was set to 1. Current rate: %f", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)start
{
  self->_int64_t state = 2;
  if (self->_rendererEnqueuedAudioDuration > 0.0) {
    [(VSAudioPlaybackServiceAVSBAR *)self _play];
  }
  error = self->_error;
  return error;
}

- (void)handleMediaServerReset
{
  long long v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "mediaserverd reset", v4, 2u);
  }

  [(VSAudioPlaybackServiceAVSBAR *)self stop];
}

- (void)dealloc
{
  long long v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(VSAudioPlaybackServiceAVSBAR *)self stopWaiting];
  [(VSAudioPlaybackServiceAVSBAR *)self freeAudioQueue];
  v4.receiver = self;
  v4.super_class = (Class)VSAudioPlaybackServiceAVSBAR;
  [(VSAudioPlaybackServiceAVSBAR *)&v4 dealloc];
}

- (VSAudioPlaybackServiceAVSBAR)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  v44.receiver = self;
  v44.super_class = (Class)VSAudioPlaybackServiceAVSBAR;
  unsigned int v7 = [(VSAudioPlaybackServiceAVSBAR *)&v44 init];
  float v8 = v7;
  if (!v7)
  {
LABEL_15:
    mach_absolute_time();
    uint64_t v37 = VSGetLogDefault();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      VSAbsoluteTimeToSecond();
      *(_DWORD *)CMTime buf = 134218240;
      *(void *)CMBlockBufferRef v46 = v8;
      *(_WORD *)&v46[8] = 2048;
      uint64_t v47 = v38;
      _os_log_impl(&dword_226CB1000, v37, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p init latency: %.3f", buf, 0x16u);
    }

    v39 = v8;
    goto LABEL_21;
  }
  *((void *)v7 + 6) = 1;
  long long v9 = *(_OWORD *)&a4->mSampleRate;
  long long v10 = *(_OWORD *)&a4->mBytesPerPacket;
  *((void *)v7 + 19) = *(void *)&a4->mBitsPerChannel;
  *(_OWORD *)(v7 + 136) = v10;
  *(_OWORD *)(v7 + 120) = v9;
  if (v5)
  {
    *((_DWORD *)v7 + 3) = v5;
    double v11 = v7 + 12;
    uint64_t v12 = v5;
  }
  else
  {
    __int16 v13 = [MEMORY[0x263EF93E0] sharedInstance];
    *((_DWORD *)v8 + 3) = [v13 opaqueSessionID];
    double v11 = v8 + 12;

    uint64_t v12 = *((unsigned int *)v8 + 3);
  }
  uint64_t v14 = [MEMORY[0x263EF93E0] retrieveSessionWithID:v12];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    id v16 = objc_alloc_init(MEMORY[0x263F84E38]);
    uint64_t v17 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v16;

    uint64_t v18 = [MEMORY[0x263EFF980] array];
    uint64_t v19 = (void *)*((void *)v8 + 10);
    *((void *)v8 + 10) = v18;

    uint64_t v20 = MEMORY[0x263F010E0];
    *((_OWORD *)v8 + 6) = *MEMORY[0x263F010E0];
    *((void *)v8 + 14) = *(void *)(v20 + 16);
    OSStatus v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v22 = dispatch_queue_create("VSAudioPlaybackServiceAVSBARQueue", v21);
    float v23 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v22;

    uint64_t v24 = (void *)sLastSynchronizer;
    id v25 = (id)sLastSynchronizer;
    long long v26 = [v25 renderers];
    long long v27 = [v26 firstObject];

    long long v28 = &OBJC_IVAR___VSVoiceBooster__voiceBoostUnit;
    if (v27)
    {
      long long v29 = [v27 audioSession];
      if ([v29 opaqueSessionID] != *v11 || v25 && (objc_msgSend(v25, "currentTime"), v43))
      {

        long long v28 = &OBJC_IVAR___VSVoiceBooster__voiceBoostUnit;
      }
      else
      {
        char v42 = sLastSynchronizerStartedProvidingData;

        long long v28 = &OBJC_IVAR___VSVoiceBooster__voiceBoostUnit;
        if ((v42 & 1) == 0)
        {
          objc_storeStrong((id *)v8 + 3, v27);
          objc_storeStrong((id *)v8 + 4, v24);
          goto LABEL_12;
        }
      }
    }
    id v30 = objc_alloc_init(MEMORY[0x263EFA880]);
    CMTime v31 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v30;

    [*((id *)v8 + 3) setAudioSession:v15];
    id v32 = objc_alloc_init(MEMORY[0x263EFA890]);
    OSStatus v33 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v32;

    [*((id *)v8 + 4) setDelaysRateChangeUntilHasSufficientMediaData:0];
    [*((id *)v8 + 4) addRenderer:*((void *)v8 + 3)];
    objc_storeStrong((id *)&sLastSynchronizer, *((id *)v8 + 4));
    *((unsigned char *)v28 + 2424) = 0;
LABEL_12:
    pthread_mutex_init((pthread_mutex_t *)(v8 + 224), 0);
    pthread_mutex_init((pthread_mutex_t *)(v8 + 160), 0);
    uint64_t v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v8 selector:sel_handleMediaServerReset name:*MEMORY[0x263EF90F8] object:0];

    OSStatus v35 = VSGetLogDefault();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v36 = *((void *)v8 + 4) == (void)v25;
      *(_DWORD *)CMTime buf = 67109376;
      *(_DWORD *)CMBlockBufferRef v46 = v5;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v36;
      _os_log_impl(&dword_226CB1000, v35, OS_LOG_TYPE_DEFAULT, "#AVSBAR initialized with session ID: %d, reusing previous synchronizer: %{BOOL}d", buf, 0xEu);
    }

    goto LABEL_15;
  }
  v40 = VSGetLogDefault();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CMTime buf = 67109120;
    *(_DWORD *)CMBlockBufferRef v46 = v5;
    _os_log_error_impl(&dword_226CB1000, v40, OS_LOG_TYPE_ERROR, "Can't retrieve session with ID: %d", buf, 8u);
  }

  v39 = 0;
LABEL_21:

  return v39;
}

@end