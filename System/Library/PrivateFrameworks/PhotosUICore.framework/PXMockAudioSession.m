@interface PXMockAudioSession
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (PXMockAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7;
- (void)_handleCurrentTimeUpdateTimer:(id)a3;
- (void)_invalidateCurrentTimeUpdateTimer;
- (void)_startCurrentTimeUpdateTimer;
- (void)pause;
- (void)play;
- (void)playFromTime:(id *)a3;
- (void)prepareToPlay;
@end

@implementation PXMockAudioSession

- (void).cxx_destruct
{
}

- (void)_handleCurrentTimeUpdateTimer:(id)a3
{
  p_currentTime = &self->_currentTime;
  CMTimeMake(&rhs, 1, 10);
  CMTime v4 = *(CMTime *)p_currentTime;
  CMTimeAdd(&v6, &v4, &rhs);
  *(CMTime *)p_currentTime = v6;
}

- (void)_invalidateCurrentTimeUpdateTimer
{
  currentTimeUpdateTimer = self->_currentTimeUpdateTimer;
  if (currentTimeUpdateTimer)
  {
    [(NSTimer *)currentTimeUpdateTimer invalidate];
    CMTime v4 = self->_currentTimeUpdateTimer;
    self->_currentTimeUpdateTimer = 0;
  }
}

- (void)_startCurrentTimeUpdateTimer
{
  [(PXMockAudioSession *)self _invalidateCurrentTimeUpdateTimer];
  objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleCurrentTimeUpdateTimer_, 0, 1, 0.1);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  currentTimeUpdateTimer = self->_currentTimeUpdateTimer;
  self->_currentTimeUpdateTimer = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 232);
  return self;
}

- (void)playFromTime:(id *)a3
{
  [(PXAudioSession *)self performInternalChanges:&__block_literal_global_9_188283];
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_currentTime.value = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = var3;
  [(PXMockAudioSession *)self _startCurrentTimeUpdateTimer];
}

uint64_t __35__PXMockAudioSession_playFromTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatus:3];
}

- (void)play
{
  [(PXAudioSession *)self performInternalChanges:&__block_literal_global_7_188285];
  [(PXMockAudioSession *)self _startCurrentTimeUpdateTimer];
}

uint64_t __26__PXMockAudioSession_play__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatus:3];
}

- (void)pause
{
  [(PXMockAudioSession *)self _invalidateCurrentTimeUpdateTimer];
  [(PXAudioSession *)self performInternalChanges:&__block_literal_global_5_188287];
}

uint64_t __27__PXMockAudioSession_pause__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatus:2];
}

- (void)prepareToPlay
{
  [(PXAudioSession *)self performInternalChanges:&__block_literal_global_188289];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXMockAudioSession_prepareToPlay__block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __35__PXMockAudioSession_prepareToPlay__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performInternalChanges:&__block_literal_global_2_188290];
}

void __35__PXMockAudioSession_prepareToPlay__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsReadyToPlay:1];
  [v2 setStatus:2];
}

uint64_t __35__PXMockAudioSession_prepareToPlay__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatus:1];
}

- (PXMockAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)PXMockAudioSession;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  result = -[PXAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v11, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, a3, &v10, a6, 0);
  if (result)
  {
    int64_t var3 = a5->var3;
    *(_OWORD *)&result->_currentTime.value = *(_OWORD *)&a5->var0;
    result->_currentTime.epoch = var3;
  }
  return result;
}

@end