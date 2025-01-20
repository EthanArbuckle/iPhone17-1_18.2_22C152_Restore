@interface PUTimedAnimationGroup
- (PUTimedAnimationGroup)init;
- (double)beginTime;
- (double)currentTime;
- (double)elapsedTime;
- (void)_update;
- (void)pauseAnimations;
- (void)resumeAnimations;
- (void)setBeginTime:(double)a3;
- (void)setElapsedTime:(double)a3;
@end

@implementation PUTimedAnimationGroup

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)_update
{
  BOOL v3 = [(PUAnimationGroup *)self isPaused];
  BOOL v4 = v3;
  if (self->_areAnimationsPaused != v3 || [(PUAnimationGroup *)self isPaused])
  {
    self->_areAnimationsPaused = v4;
    [(PUTimedAnimationGroup *)self updateAnimations];
    [(PUAnimationGroup *)self completeIfNeeded];
  }
}

- (double)currentTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (void)resumeAnimations
{
  v4.receiver = self;
  v4.super_class = (Class)PUTimedAnimationGroup;
  [(PUAnimationGroup *)&v4 resumeAnimations];
  [(PUTimedAnimationGroup *)self currentTime];
  self->_beginTime = v3 - self->_pausedElapsedTime;
  [(PUTimedAnimationGroup *)self _update];
}

- (void)pauseAnimations
{
  v6.receiver = self;
  v6.super_class = (Class)PUTimedAnimationGroup;
  [(PUAnimationGroup *)&v6 pauseAnimations];
  [(PUTimedAnimationGroup *)self currentTime];
  double v4 = v3;
  [(PUTimedAnimationGroup *)self beginTime];
  self->_pausedElapsedTime = v4 - v5;
  [(PUTimedAnimationGroup *)self _update];
}

- (void)setElapsedTime:(double)a3
{
  if (![(PUAnimationGroup *)self isPaused])
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUTimedAnimationGroup.m", 38, @"Invalid parameter not satisfying: %@", @"[self isPaused]" object file lineNumber description];
  }
  if (self->_pausedElapsedTime != a3)
  {
    self->_pausedElapsedTime = a3;
    [(PUTimedAnimationGroup *)self _update];
  }
}

- (double)elapsedTime
{
  if ([(PUAnimationGroup *)self isPaused]) {
    return self->_pausedElapsedTime;
  }
  [(PUTimedAnimationGroup *)self currentTime];
  double v5 = v4;
  [(PUTimedAnimationGroup *)self beginTime];
  return v5 - v6;
}

- (PUTimedAnimationGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUTimedAnimationGroup;
  v2 = [(PUTimedAnimationGroup *)&v6 init];
  double v3 = v2;
  if (v2)
  {
    [(PUTimedAnimationGroup *)v2 currentTime];
    v3->_beginTime = v4;
  }
  return v3;
}

@end