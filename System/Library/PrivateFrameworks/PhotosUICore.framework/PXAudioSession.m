@interface PXAudioSession
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (BOOL)isReadyToPlay;
- (NSError)error;
- (NSNumber)contentLoudnessInLKFS;
- (NSNumber)contentPeakDecibels;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PXAudioAsset)asset;
- (PXAudioSession)init;
- (PXAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7;
- (PXAudioSessionAVAudioSessionDelegate)audioSessionDelegate;
- (float)desiredPlayerVolume;
- (float)targetLoudnessInLKFS;
- (float)volume;
- (int64_t)status;
- (void)_invalidateDesiredPlayerVolume;
- (void)_updateDesiredPlayerVolume;
- (void)didPerformChanges;
- (void)pause;
- (void)performChanges:(id)a3;
- (void)performInternalChanges:(id)a3;
- (void)play;
- (void)playFromTime:(id *)a3;
- (void)prepareToPlay;
- (void)setAudioSessionDelegate:(id)a3;
- (void)setContentLoudnessInLKFS:(id)a3;
- (void)setContentPeakDecibels:(id)a3;
- (void)setDesiredPlayerVolume:(float)a3;
- (void)setDuration:(id *)a3;
- (void)setError:(id)a3;
- (void)setIsReadyToPlay:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTargetLoudnessInLKFS:(float)a3;
- (void)setVolume:(float)a3;
@end

@implementation PXAudioSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_audioSessionDelegate);
  objc_storeStrong((id *)&self->_contentLoudnessInLKFS, 0);
  objc_storeStrong((id *)&self->_contentPeakDecibels, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (float)desiredPlayerVolume
{
  return self->_desiredPlayerVolume;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (PXAudioAsset)asset
{
  return self->_asset;
}

- (void)setAudioSessionDelegate:(id)a3
{
}

- (PXAudioSessionAVAudioSessionDelegate)audioSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionDelegate);
  return (PXAudioSessionAVAudioSessionDelegate *)WeakRetained;
}

- (BOOL)isReadyToPlay
{
  return self->_isReadyToPlay;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (int64_t)status
{
  return self->_status;
}

- (NSNumber)contentLoudnessInLKFS
{
  return self->_contentLoudnessInLKFS;
}

- (NSNumber)contentPeakDecibels
{
  return self->_contentPeakDecibels;
}

- (float)targetLoudnessInLKFS
{
  return self->_targetLoudnessInLKFS;
}

- (float)volume
{
  return self->_volume;
}

- (NSError)error
{
  return self->_error;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXAudioSession;
  [(PXAudioSession *)&v3 didPerformChanges];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXAudioSession;
  [(PXAudioSession *)&v3 performChanges:a3];
}

- (void)_updateDesiredPlayerVolume
{
  [(PXAudioSession *)self volume];
  float v4 = v3;
  uint64_t v5 = [(PXAudioSession *)self contentPeakDecibels];
  if (v5)
  {
    v7 = (void *)v5;
    v8 = [(PXAudioSession *)self contentLoudnessInLKFS];

    if (v8)
    {
      [(PXAudioSession *)self targetLoudnessInLKFS];
      float v10 = v9;
      v11 = [(PXAudioSession *)self contentLoudnessInLKFS];
      [v11 floatValue];
      float v13 = v12;

      v14 = [(PXAudioSession *)self contentPeakDecibels];
      [v14 floatValue];

      if (v10 != 0.0 && v13 != 0.0)
      {
        PXVolumeGainForTargetLoudness(v10, v13);
        float v4 = v4 * *(float *)&v6;
      }
    }
  }
  *(float *)&double v6 = v4;
  [(PXAudioSession *)self setDesiredPlayerVolume:v6];
}

- (void)_invalidateDesiredPlayerVolume
{
}

- (void)setDesiredPlayerVolume:(float)a3
{
  if (self->_desiredPlayerVolume != a3)
  {
    self->_desiredPlayerVolume = a3;
    [(PXAudioSession *)self desiredPlayerVolumeDidChange];
  }
}

- (void)setContentLoudnessInLKFS:(id)a3
{
  v7 = (NSNumber *)a3;
  uint64_t v5 = self->_contentLoudnessInLKFS;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contentLoudnessInLKFS, a3);
      [(PXAudioSession *)self _invalidateDesiredPlayerVolume];
    }
  }
}

- (void)setContentPeakDecibels:(id)a3
{
  v7 = (NSNumber *)a3;
  uint64_t v5 = self->_contentPeakDecibels;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contentPeakDecibels, a3);
      [(PXAudioSession *)self _invalidateDesiredPlayerVolume];
    }
  }
}

- (void)setIsReadyToPlay:(BOOL)a3
{
  if (self->_isReadyToPlay != a3)
  {
    self->_isReadyToPlay = a3;
    [(PXAudioSession *)self signalChange:8];
  }
}

- (void)setDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 duration = &self->_duration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_duration;
  if (CMTimeCompare(&time1, (CMTime *)&duration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_duration->epoch = a3->var3;
    *(_OWORD *)&p_duration->value = v6;
    [(PXAudioSession *)self signalChange:1];
  }
}

- (void)setError:(id)a3
{
  uint64_t v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    [(PXAudioSession *)self errorDidChange];
    [(PXAudioSession *)self signalChange:4];
    uint64_t v5 = v6;
  }
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(PXAudioSession *)self signalChange:2];
  }
}

- (void)setTargetLoudnessInLKFS:(float)a3
{
  if (self->_targetLoudnessInLKFS != a3)
  {
    self->_targetLoudnessInLKFS = a3;
    [(PXAudioSession *)self _invalidateDesiredPlayerVolume];
  }
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    [(PXAudioSession *)self _invalidateDesiredPlayerVolume];
  }
}

- (void)playFromTime:(id *)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  long long v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXAudioSession.m", 105, @"Method %s is a responsibility of subclass %@", "-[PXAudioSession playFromTime:]", v7 object file lineNumber description];

  abort();
}

- (void)play
{
  float v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  long long v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAudioSession.m", 101, @"Method %s is a responsibility of subclass %@", "-[PXAudioSession play]", v6 object file lineNumber description];

  abort();
}

- (void)pause
{
  float v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  long long v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAudioSession.m", 97, @"Method %s is a responsibility of subclass %@", "-[PXAudioSession pause]", v6 object file lineNumber description];

  abort();
}

- (void)prepareToPlay
{
  float v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  long long v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAudioSession.m", 93, @"Method %s is a responsibility of subclass %@", "-[PXAudioSession prepareToPlay]", v6 object file lineNumber description];

  abort();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a3, self, @"PXAudioSession.m", 77, @"Method %s is a responsibility of subclass %@", "-[PXAudioSession currentTime]", v7 object file lineNumber description];

  abort();
}

- (void)performInternalChanges:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXAudioSession_performInternalChanges___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__PXAudioSession_performInternalChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performChanges:*(void *)(a1 + 32)];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PXAudioSession *)self status] - 1;
  if (v6 > 3) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_1E5DC3C40[v6];
  }
  id v8 = [(PXAudioSession *)self asset];
  id v9 = (void *)[v3 initWithFormat:@"<%@: %p; status: %@; asset: %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (PXAudioSession)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAudioSession.m", 44, @"%s is not available as initializer", "-[PXAudioSession init]");

  abort();
}

- (PXAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXAudioSession;
  v16 = [(PXAudioSession *)&v22 init];
  v17 = (PXAudioSession *)v16;
  if (v16)
  {
    int64_t var3 = a5->var3;
    *(_OWORD *)(v16 + 200) = *(_OWORD *)&a5->var0;
    *((void *)v16 + 27) = var3;
    objc_storeStrong((id *)v16 + 21, a3);
    v17->_desiredPlayerVolume = a4;
    v17->_volume = a4;
    objc_storeStrong((id *)&v17->_queue, a6);
    uint64_t v19 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v17];
    updater = v17->_updater;
    v17->_updater = (PXUpdater *)v19;

    [(PXUpdater *)v17->_updater addUpdateSelector:sel__updateDesiredPlayerVolume];
    objc_storeWeak((id *)&v17->_audioSessionDelegate, v15);
  }

  return v17;
}

@end