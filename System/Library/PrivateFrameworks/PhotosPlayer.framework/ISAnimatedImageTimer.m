@interface ISAnimatedImageTimer
+ (id)sharedTimer;
- (ISAnimatedImageTimer)init;
- (double)timestamp;
- (void)_animationTimerFired:(id)a3;
- (void)_fireTimerWithInterval:(double)a3;
- (void)_iosUpdateDisplayLink;
- (void)_setTimestamp:(double)a3;
- (void)_updateDisplayLink;
- (void)dealloc;
- (void)hasObserversDidChange;
@end

@implementation ISAnimatedImageTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkProxy, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)_animationTimerFired:(id)a3
{
  [a3 timestamp];

  -[ISAnimatedImageTimer _fireTimerWithInterval:](self, "_fireTimerWithInterval:");
}

- (void)_iosUpdateDisplayLink
{
  displayLink = self->_displayLink;
  if (displayLink || (BOOL v4 = [(ISObservable *)self hasObservers], displayLink = self->_displayLink, !v4))
  {
    [(CADisplayLink *)displayLink invalidate];
    v5 = self->_displayLink;
    self->_displayLink = 0;
  }
  else if (!displayLink)
  {
    v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self->_displayLinkProxy selector:sel__displayLinkFire_];
    v7 = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    v10 = self->_displayLink;
    CAFrameRateRange v12 = CAFrameRateRangeMake(60.0, 60.0, 60.0);
    -[CADisplayLink setPreferredFrameRateRange:](v10, "setPreferredFrameRateRange:", *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  }
}

- (void)_setTimestamp:(double)a3
{
  if (self->_timestamp != a3)
  {
    self->_timestamp = a3;
    [(ISObservable *)self signalChange:1];
  }
}

- (void)_fireTimerWithInterval:(double)a3
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke;
    v6[3] = &__block_descriptor_40_e30_v16__0__ISAnimatedImageTimer_8l;
    *(double *)&v6[4] = a3;
    [(ISObservable *)self performChanges:v6];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_2;
    block[3] = &unk_1E6BECFC0;
    block[4] = self;
    *(double *)&block[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setTimestamp:*(double *)(a1 + 32)];
}

uint64_t __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_3;
  v3[3] = &__block_descriptor_40_e30_v16__0__ISAnimatedImageTimer_8l;
  v3[4] = *(void *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _setTimestamp:*(double *)(a1 + 32)];
}

- (void)_updateDisplayLink
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ISAnimatedImageTimer__updateDisplayLink__block_invoke;
  block[3] = &unk_1E6BECD80;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__ISAnimatedImageTimer__updateDisplayLink__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _iosUpdateDisplayLink];
}

- (void)hasObserversDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageTimer;
  [(ISObservable *)&v3 hasObserversDidChange];
  [(ISAnimatedImageTimer *)self _updateDisplayLink];
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)ISAnimatedImageTimer;
  [(ISAnimatedImageTimer *)&v4 dealloc];
}

- (ISAnimatedImageTimer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISAnimatedImageTimer;
  v2 = [(ISObservable *)&v6 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(_ISAnimatedImageTimerForwardingProxy);
    displayLinkProxy = v2->_displayLinkProxy;
    v2->_displayLinkProxy = v3;

    [(_ISAnimatedImageTimerForwardingProxy *)v2->_displayLinkProxy _setForwardingTarget:v2];
  }
  return v2;
}

+ (id)sharedTimer
{
  if (sharedTimer_onceToken != -1) {
    dispatch_once(&sharedTimer_onceToken, &__block_literal_global_2904);
  }
  v2 = (void *)sharedTimer__sharedTimer;

  return v2;
}

uint64_t __35__ISAnimatedImageTimer_sharedTimer__block_invoke()
{
  v0 = objc_alloc_init(ISAnimatedImageTimer);
  uint64_t v1 = sharedTimer__sharedTimer;
  sharedTimer__sharedTimer = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end