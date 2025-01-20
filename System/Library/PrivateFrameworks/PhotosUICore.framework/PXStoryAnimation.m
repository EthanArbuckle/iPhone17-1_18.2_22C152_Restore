@interface PXStoryAnimation
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastElapsedTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)canBePaused;
- (BOOL)isPaused;
- (BOOL)isStopped;
- (NSString)identifier;
- (NSString)shortDescription;
- (PXStoryAnimation)init;
- (PXStoryAnimation)initWithIdentifier:(id)a3;
- (PXUpdater)updater;
- (double)pauseDeceleration;
- (double)pausedVelocity;
- (double)resumeAcceleration;
- (double)velocity;
- (id)description;
- (void)_invalidateTime;
- (void)_setNeedsUpdate;
- (void)_updateTime;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setElapsedTime:(id *)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsStopped:(BOOL)a3;
- (void)setLastElapsedTime:(id *)a3;
- (void)setPauseDeceleration:(double)a3;
- (void)setPausedVelocity:(double)a3;
- (void)setResumeAcceleration:(double)a3;
- (void)setTime:(id *)a3;
- (void)setVelocity:(double)a3;
- (void)stop;
@end

@implementation PXStoryAnimation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setResumeAcceleration:(double)a3
{
  self->_resumeAcceleration = a3;
}

- (double)resumeAcceleration
{
  return self->_resumeAcceleration;
}

- (void)setPausedVelocity:(double)a3
{
  self->_pausedVelocity = a3;
}

- (double)pausedVelocity
{
  return self->_pausedVelocity;
}

- (void)setPauseDeceleration:(double)a3
{
  self->_pauseDeceleration = a3;
}

- (double)pauseDeceleration
{
  return self->_pauseDeceleration;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (BOOL)canBePaused
{
  return self->_canBePaused;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setLastElapsedTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_lastElapsedTime.value = *(_OWORD *)&a3->var0;
  self->_lastElapsedTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastElapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_updateTime
{
}

- (void)_invalidateTime
{
  id v2 = [(PXStoryAnimation *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTime];
}

- (void)_setNeedsUpdate
{
}

- (NSString)shortDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = (void *)[v4 mutableCopy];

  objc_msgSend(v5, "px_removePrefix:", @"PXStory");
  objc_msgSend(v5, "px_removeSuffix:", @"Animation");
  id v6 = [NSString alloc];
  [(PXStoryAnimation *)self time];
  CMTime time = v9;
  v7 = (void *)[v6 initWithFormat:@"%@: %0.1fs", v5, CMTimeGetSeconds(&time)];

  return (NSString *)v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(PXStoryAnimation *)self time];
  CMTime time = v12;
  Float64 Seconds = CMTimeGetSeconds(&time);
  BOOL v7 = [(PXStoryAnimation *)self isStopped];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  CMTime v9 = v8;
  v10 = objc_msgSend(v3, "initWithFormat:", @"<%@: %p; t=%0.1f, stopped = %@>",
                  v5,
                  self,
                  *(void *)&Seconds,
                  v9);

  return v10;
}

- (void)setIsStopped:(BOOL)a3
{
  if (self->_isStopped != a3)
  {
    self->_isStopped = a3;
    [(PXStoryAnimation *)self signalChange:2];
    if (self->_isStopped)
    {
      [(PXStoryAnimation *)self wasStopped];
    }
  }
}

- (void)stop
{
}

- (void)setTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 time = &self->_time;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  if (CMTimeCompare(&time1, (CMTime *)&time))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_time->epoch = a3->var3;
    *(_OWORD *)&p_time->value = v6;
    [(PXStoryAnimation *)self signalChange:1];
    [(PXStoryAnimation *)self timeDidChange];
  }
}

- (void)setIsPaused:(BOOL)a3
{
  if (self->_isPaused != a3)
  {
    self->_isPaused = a3;
    [(PXStoryAnimation *)self _invalidateTime];
  }
}

- (void)setElapsedTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 elapsedTime = &self->_elapsedTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 elapsedTime = self->_elapsedTime;
  if (CMTimeCompare(&time1, (CMTime *)&elapsedTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_elapsedTime->epoch = a3->var3;
    *(_OWORD *)&p_elapsedTime->value = v6;
    [(PXStoryAnimation *)self _invalidateTime];
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryAnimation;
  [(PXStoryAnimation *)&v4 didPerformChanges];
  id v3 = [(PXStoryAnimation *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryAnimation;
  [(PXStoryAnimation *)&v3 performChanges:a3];
}

- (PXStoryAnimation)init
{
  return [(PXStoryAnimation *)self initWithIdentifier:0];
}

- (PXStoryAnimation)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryAnimation;
  long long v6 = [(PXStoryAnimation *)&v16 init];
  if (v6)
  {
    BOOL v7 = (void *)[v5 copy];
    v8 = v7;
    if (!v7)
    {
      objc_super v3 = [MEMORY[0x1E4F29128] UUID];
      v8 = [v3 UUIDString];
    }
    objc_storeStrong((id *)&v6->_identifier, v8);
    if (!v7)
    {
    }
    *(void *)&v6->_elapsedTime.timescale = 0;
    v6->_elapsedTime.epoch = 0;
    v6->_elapsedTime.value = 0;
    *(void *)&v6->_lastElapsedTime.timescale = 0;
    v6->_lastElapsedTime.epoch = 0;
    v6->_lastElapsedTime.value = 0;
    *(void *)&v6->_time.timescale = 0;
    v6->_time.epoch = 0;
    v6->_time.value = 0;
    v6->_velocity = 1.0;
    v6->_canBePaused = 1;
    CMTime v9 = +[PXStorySettings sharedInstance];
    [v9 movementAnimationPauseDeceleration];
    v6->_pauseDeceleration = v10;
    [v9 movementAnimationPausedVelocity];
    v6->_pausedVelocity = v11;
    [v9 movementAnimationResumeAcceleration];
    v6->_resumeAcceleration = v12;
    uint64_t v13 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v6 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v6->_updater;
    v6->_updater = (PXUpdater *)v13;

    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateTime];
  }

  return v6;
}

@end