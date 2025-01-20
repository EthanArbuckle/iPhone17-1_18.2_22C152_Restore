@interface RCActivityWaveformProcessor
- (BOOL)getAmplitudes:(float *)a3 count:(int)a4 startTime:(double)a5 endTime:(double)a6;
- (RCActivityWaveformProcessor)init;
- (RCActivityWaveformProcessorDelegate)delegate;
- (VMFrameRange)_bufferRange;
- (double)availableRangeEnd;
- (double)availableRangeStart;
- (double)punchInTime;
- (double)recordingStartTime;
- (double)referenceMediaTime;
- (double)sampleRate;
- (float)runningAverage;
- (id).cxx_construct;
- (int)_excessFrames;
- (int64_t)inputBufferReadPosition;
- (unsigned)emptyFramesToLeaveInInputBuffer;
- (void)_tearDown;
- (void)consumeRingBufferIfNecessary;
- (void)dealloc;
- (void)prepareToProcessWithFormat:(id)a3 audioTime:(id)a4 punchInTime:(double)a5;
- (void)processAudioBuffer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyFramesToLeaveInInputBuffer:(unsigned int)a3;
- (void)setInputBufferReadPosition:(int64_t)a3;
- (void)setReferenceMediaTime:(double)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation RCActivityWaveformProcessor

- (RCActivityWaveformProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)RCActivityWaveformProcessor;
  result = [(RCActivityWaveformProcessor *)&v3 init];
  if (result) {
    result->_readerLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  [(RCActivityWaveformProcessor *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)RCActivityWaveformProcessor;
  [(RCActivityWaveformProcessor *)&v3 dealloc];
}

- (double)recordingStartTime
{
  if (!self->_isPrepared) {
    return 0.0;
  }
  [(RCActivityWaveformProcessor *)self referenceMediaTime];
  return result;
}

- (double)availableRangeStart
{
  if (self->_isPrepared) {
    return self->_referenceMediaTime
  }
         + (double)(uint64_t)[(RCActivityWaveformProcessor *)self _bufferRange] / self->_sampleRate;
  else {
    return 0.0;
  }
}

- (double)availableRangeEnd
{
  if (!self->_isPrepared) {
    return 0.0;
  }
  id v3 = [(RCActivityWaveformProcessor *)self _bufferRange];
  return self->_referenceMediaTime + (double)((uint64_t)v3 + v4) / self->_sampleRate;
}

- (void)prepareToProcessWithFormat:(id)a3 audioTime:(id)a4 punchInTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_isPrepared) {
    [(RCActivityWaveformProcessor *)self _tearDown];
  }
  [v8 sampleRate];
  self->_double sampleRate = v10;
  self->_punchInTime = a5;
  v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v11 activityWaveformTimeWindowDuration];
  double v13 = v12;

  double sampleRate = self->_sampleRate;
  +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", [v9 hostTime]);
  float v15 = v13 + 0.2 + 0.5;
  self->_referenceMediaTime = v16;
  self->_emptyFramesToLeaveInInputBuffer = (self->_sampleRate * 0.5);
  sub_1000499FC((uint64_t)&self->_ringBuffer, (int)(sampleRate * v15), 1, 0);
  v17 = objc_alloc_init(RCAmplitudeAnalyzer);
  mainQueueAmplitudeAnalyzer = self->_mainQueueAmplitudeAnalyzer;
  self->_mainQueueAmplitudeAnalyzer = v17;

  v19 = objc_alloc_init(RCAmplitudeAnalyzer);
  audioQueueAmplitudeAnalyzer = self->_audioQueueAmplitudeAnalyzer;
  self->_audioQueueAmplitudeAnalyzer = v19;

  v21 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v21 activityWaveformRunningAverageDuration];

  operator new();
}

- (void)_tearDown
{
  sub_100049BC0((uint64_t)&self->_ringBuffer);
  rollingSumBuffer = (void **)self->_rollingSumBuffer;
  if (rollingSumBuffer)
  {
    uint64_t v4 = *rollingSumBuffer;
    if (*rollingSumBuffer)
    {
      rollingSumBuffer[1] = v4;
      operator delete(v4);
    }
    operator delete();
  }
  self->_isPrepared = 0;
}

- (void)processAudioBuffer:(id)a3
{
  id v5 = a3;
  if (!self->_isPrepared)
  {
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos/Application/Helpers/RCActivityWaveformProcessor.mm"];
    v7 = (void *)v6;
    id v8 = @"<Unknown File>";
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    id v9 = v8;

    double v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:v9 lineNumber:121 description:@"You must call prepareToProcessWithFormat:audioTime:punchInTime: prior to processing."];
  }
  v11 = (const void **)[v5 floatChannelData];
  id v12 = [v5 frameLength];
  id v13 = v12;
  if (v12)
  {
    int mCapacity = self->_ringBuffer.mCapacity;
    unsigned int v15 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
    if (mCapacity - v15 < v12) {
      [(RCActivityWaveformProcessor *)self consumeRingBufferIfNecessary];
    }
    int v16 = self->_ringBuffer.mCapacity;
    unsigned int v17 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
    if (v16 - v17 >= v13)
    {
      memcpy(*(void **)self->_ringBuffer.mWritePointers, *v11, 4 * v13);
      sub_100049E5C((uint64_t)&self->_ringBuffer, v13);
      [(RCAmplitudeAnalyzer *)self->_audioQueueAmplitudeAnalyzer calculateAmplitude:v11 sampleCount:v13 channelCount:1];
    }
    else
    {
      v18 = OSLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10016B07C(v18);
      }

      float v19 = -1.0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049ED4;
    block[3] = &unk_1002218A8;
    float v21 = v19;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)getAmplitudes:(float *)a3 count:(int)a4 startTime:(double)a5 endTime:(double)a6
{
  if (!self->_isPrepared) {
    return 0;
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  double referenceMediaTime = self->_referenceMediaTime;
  double sampleRate = self->_sampleRate;
  v14 = (char *)[(RCActivityWaveformProcessor *)self _bufferRange];
  if (a4 < 1)
  {
    char v22 = 1;
  }
  else
  {
    int v16 = v14;
    uint64_t v17 = 0;
    uint64_t v18 = (uint64_t)((a5 - referenceMediaTime) * sampleRate);
    double v19 = (a6 - a5) / (double)a4;
    v20 = &v14[v15];
    uint64_t v21 = a4;
    char v22 = 1;
    do
    {
      uint64_t v23 = (v19 * self->_sampleRate);
      uint64_t v24 = (v17 * v23);
      uint64_t v25 = v24 + v18;
      if ((uint64_t)v16 <= v24 + v18) {
        v26 = (char *)(v24 + v18);
      }
      else {
        v26 = v16;
      }
      v27 = (char *)(v25 + v23);
      if ((uint64_t)v20 < (uint64_t)v27) {
        v27 = v20;
      }
      uint64_t v28 = v27 - v26;
      BOOL v29 = (v28 & ~(v28 >> 63)) == v23;
      if (v28 < 1)
      {
        float v31 = 0.0;
      }
      else
      {
        v30 = &v26[-self->_inputBufferReadPosition];
        v33 = 0;
        v33 = &(*self->_ringBuffer.mReadPointers)[(void)v30];
        -[RCAmplitudeAnalyzer calculateAmplitude:sampleCount:channelCount:](self->_mainQueueAmplitudeAnalyzer, "calculateAmplitude:sampleCount:channelCount:", &v33);
      }
      v22 &= v29;
      a3[v17++] = v31;
    }
    while (v21 != v17);
  }
  os_unfair_lock_unlock(p_readerLock);
  [(RCActivityWaveformProcessor *)self consumeRingBufferIfNecessary];
  return v22;
}

- (int)_excessFrames
{
  int mCapacity = self->_ringBuffer.mCapacity;
  unsigned int v3 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  unsigned int v4 = mCapacity - v3;
  unsigned int emptyFramesToLeaveInInputBuffer = self->_emptyFramesToLeaveInInputBuffer;
  BOOL v6 = emptyFramesToLeaveInInputBuffer >= v4;
  int v7 = emptyFramesToLeaveInInputBuffer - v4;
  if (v6) {
    return v7;
  }
  else {
    return 0;
  }
}

- (void)consumeRingBufferIfNecessary
{
  if ([(RCActivityWaveformProcessor *)self _excessFrames] >= 1)
  {
    os_unfair_lock_lock(&self->_readerLock);
    int v3 = [(RCActivityWaveformProcessor *)self _excessFrames];
    if (v3 >= 1)
    {
      unsigned int v4 = v3;
      sub_10004A1D0((uint64_t)&self->_ringBuffer, v3);
      self->_inputBufferReadPosition += v4;
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
}

- (float)runningAverage
{
  if (!self->_isPrepared) {
    return 0.0;
  }
  rollingSumBuffer = (double *)self->_rollingSumBuffer;
  float v3 = rollingSumBuffer[5];
  return v3 / (float)*((int *)rollingSumBuffer + 6);
}

- (VMFrameRange)_bufferRange
{
  int64_t inputBufferReadPosition = self->_inputBufferReadPosition;
  signed int v3 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  int64_t v4 = v3;
  int64_t v5 = inputBufferReadPosition;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (double)punchInTime
{
  return self->_punchInTime;
}

- (RCActivityWaveformProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCActivityWaveformProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)emptyFramesToLeaveInInputBuffer
{
  return self->_emptyFramesToLeaveInInputBuffer;
}

- (void)setEmptyFramesToLeaveInInputBuffer:(unsigned int)a3
{
  self->_unsigned int emptyFramesToLeaveInInputBuffer = a3;
}

- (double)referenceMediaTime
{
  return self->_referenceMediaTime;
}

- (void)setReferenceMediaTime:(double)a3
{
  self->_double referenceMediaTime = a3;
}

- (int64_t)inputBufferReadPosition
{
  return self->_inputBufferReadPosition;
}

- (void)setInputBufferReadPosition:(int64_t)a3
{
  self->_int64_t inputBufferReadPosition = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_double sampleRate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioQueueAmplitudeAnalyzer, 0);

  objc_storeStrong((id *)&self->_mainQueueAmplitudeAnalyzer, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end