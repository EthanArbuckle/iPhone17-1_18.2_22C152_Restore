@interface PKRenderLoop
- (BOOL)_isForcingPause;
- (BOOL)attachToWindowScene:(id)a3;
- (BOOL)effectiveIsPaused;
- (BOOL)isDrawing;
- (BOOL)isInvalidated;
- (BOOL)isPaused;
- (BOOL)isRunnable;
- (CAFrameRateRange)preferredFrameRateRange;
- (PKRenderLoop)init;
- (PKRenderLoopDelegate)delegate;
- (UIScreen)screen;
- (UIWindowScene)windowScene;
- (uint64_t)_attachToScreen:(uint64_t)a1;
- (unsigned)highFrameRateReason;
- (void)_drawAtTime:(uint64_t)a1;
- (void)_drawWithDisplayLink:(uint64_t)a1;
- (void)_resetBackgroundState;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_setNeedsForcingPauseUpdate;
- (void)_updateBackgroundState;
- (void)_updateEffectivePausedState;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3;
@end

@implementation PKRenderLoop

- (void)_drawWithDisplayLink:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3 && *(id *)(a1 + 24) == v3)
  {
    id v5 = v3;
    [v3 targetTimestamp];
    -[PKRenderLoop _drawAtTime:](a1, v4);
    id v3 = v5;
  }
}

- (void)_drawAtTime:(uint64_t)a1
{
  if (a1 && !*(unsigned char *)(a1 + 38))
  {
    double v4 = (void *)MEMORY[0x223C3D6D0]();
    *(unsigned char *)(a1 + 16) = 1;
    [(id)a1 _willDraw];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    [WeakRetained renderLoop:a1 drawAtTime:a2];

    *(unsigned char *)(a1 + 16) = 0;
    [(id)a1 _didDraw];
  }
}

- (void)_updateBackgroundState
{
  if (a1)
  {
    *(unsigned char *)(a1 + 34) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v2 = [WeakRetained activationState];
      if ((unint64_t)(v2 + 1) <= 3) {
        *(unsigned char *)(a1 + 34) = 0x1000001u >> (8 * (v2 + 1));
      }
    }
    -[PKRenderLoop _updateEffectivePausedState](a1);
  }
}

- (void)_updateEffectivePausedState
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 17)
    || !*(void *)(a1 + 24)
    || !CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)(a1 + 64), *MEMORY[0x263F15738])
    && *(float *)(a1 + 68) <= 0.0
    || *(unsigned char *)(a1 + 34))
  {
    int v2 = 1;
  }
  else
  {
    int v2 = [(id)a1 _isForcingPause];
  }
  int v3 = v2 ^ 1;
  int v4 = *(unsigned __int8 *)(a1 + 39);
  if (v4 != (v2 ^ 1)) {
    *(unsigned char *)(a1 + 39) = v3;
  }
  int v5 = (v2 & 1) != 0 || *(unsigned char *)(a1 + 37) != 0;
  if (*(unsigned __int8 *)(a1 + 38) == v5)
  {
    if (v4 == v3 || !*(unsigned char *)(a1 + 36)) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    [WeakRetained renderLoop:a1 didChangeRunnable:*(unsigned __int8 *)(a1 + 39)];
    goto LABEL_18;
  }
  *(unsigned char *)(a1 + 38) = v5;
  objc_msgSend(*(id *)(a1 + 24), "setPaused:");
  if (v4 != v3 && *(unsigned char *)(a1 + 36))
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 8));
    [v6 renderLoop:a1 didChangeRunnable:*(unsigned __int8 *)(a1 + 39)];
  }
  if (*(unsigned char *)(a1 + 35))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    [WeakRetained renderLoop:a1 didChangeEffectivePaused:*(unsigned __int8 *)(a1 + 38)];
LABEL_18:
  }
}

- (BOOL)_isForcingPause
{
  return 0;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (BOOL)effectiveIsPaused
{
  return self->_effectivePaused;
}

- (BOOL)isRunnable
{
  return self->_runnable;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  return (UIScreen *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_delegate, v5);
  if (v5)
  {
    self->_delegateObservesEffectivePaused = objc_opt_respondsToSelector() & 1;
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
    self->_delegateObservesEffectivePaused = 0;
  }
  self->_delegateObservesRunnable = v4 & 1;

  MEMORY[0x270F9A790]();
}

- (void)_setNeedsForcingPauseUpdate
{
  if (a1) {
    -[PKRenderLoop _updateEffectivePausedState](a1);
  }
}

- (PKRenderLoop)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKRenderLoop;
  int v2 = [(PKRenderLoop *)&v6 init];
  int v3 = (PKRenderLoop *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 37) = 257;
    v2[34] = 1;
    uint64_t v4 = MEMORY[0x263F15738];
    *((void *)v2 + 8) = *MEMORY[0x263F15738];
    *((_DWORD *)v2 + 18) = *(_DWORD *)(v4 + 8);
    -[PKRenderLoop _updateBackgroundState]((uint64_t)v2);
  }
  return v3;
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, a3))
  {
    self->_preferredFrameRateRange.float minimum = minimum;
    self->_preferredFrameRateRange.float maximum = maximum;
    self->_preferredFrameRateRange.float preferred = preferred;
    *(float *)&double v7 = minimum;
    *(float *)&double v8 = maximum;
    *(float *)&double v9 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v7, v8, v9);
    -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (BOOL)attachToWindowScene:(id)a3
{
  id v4 = a3;
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)&self->_windowScene, v4);
      -[PKRenderLoop _resetBackgroundState]((uint64_t)self);
LABEL_5:
      double v7 = [v4 screen];
      char v5 = -[PKRenderLoop _attachToScreen:]((uint64_t)self, v7);

LABEL_6:
      goto LABEL_7;
    }
    displayLink = self->_displayLink;
    if (v4)
    {
      if (!displayLink) {
        goto LABEL_5;
      }
    }
    else if (displayLink)
    {
      goto LABEL_5;
    }
    char v5 = displayLink != 0;
    goto LABEL_6;
  }
  char v5 = 0;
LABEL_7:

  return v5;
}

- (void)_resetBackgroundState
{
  if (a1)
  {
    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    int v2 = (void *)MEMORY[0x263F1D580];
    int v3 = (void *)MEMORY[0x263F1D570];
    id v4 = (void *)MEMORY[0x263F1D568];
    char v5 = (void *)MEMORY[0x263F1D588];
    objc_super v6 = (void *)MEMORY[0x263F1D590];
    double v7 = (void *)MEMORY[0x263F1D578];
    if (*(unsigned char *)(a1 + 32))
    {
      [v9 removeObserver:a1 name:*MEMORY[0x263F1D580] object:0];
      [v9 removeObserver:a1 name:*v3 object:0];
      [v9 removeObserver:a1 name:*v4 object:0];
      [v9 removeObserver:a1 name:*v5 object:0];
      [v9 removeObserver:a1 name:*v6 object:0];
      [v9 removeObserver:a1 name:*v7 object:0];
      *(unsigned char *)(a1 + 32) = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      *(unsigned char *)(a1 + 32) = 1;
      [v9 addObserver:a1 selector:sel__sceneWillConnect_ name:*v2 object:WeakRetained];
      [v9 addObserver:a1 selector:sel__sceneDidDisconnect_ name:*v3 object:WeakRetained];
      [v9 addObserver:a1 selector:sel__sceneDidActivate_ name:*v4 object:WeakRetained];
      [v9 addObserver:a1 selector:sel__sceneWillDeactivate_ name:*v5 object:WeakRetained];
      [v9 addObserver:a1 selector:sel__sceneWillEnterForeground_ name:*v6 object:WeakRetained];
      [v9 addObserver:a1 selector:sel__sceneDidEnterBackground_ name:*v7 object:WeakRetained];
    }
    -[PKRenderLoop _updateBackgroundState](a1);
  }
}

- (uint64_t)_attachToScreen:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_21;
  }
  if (*(unsigned char *)(a1 + 17))
  {
    a1 = 0;
    goto LABEL_21;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained != v3)
  {
    objc_super v6 = (void **)(a1 + 24);
    char v5 = *(void **)(a1 + 24);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  objc_super v6 = (void **)(a1 + 24);
  char v5 = *(void **)(a1 + 24);
  if (v3)
  {
    if (!v5)
    {
      objc_storeWeak((id *)(a1 + 56), v3);
      goto LABEL_8;
    }
LABEL_16:
    BOOL v16 = v5 == 0;
    goto LABEL_17;
  }
  if (!v5) {
    goto LABEL_16;
  }
LABEL_6:
  [v5 invalidate];
  double v7 = *v6;
  *objc_super v6 = 0;

LABEL_7:
  objc_storeWeak((id *)(a1 + 56), v3);
  if (v3)
  {
LABEL_8:
    double v8 = -[PKDisplayLinkTargetProxy initWithTarget:]((id *)[PKDisplayLinkTargetProxy alloc], (void *)a1);
    uint64_t v9 = [v3 displayLinkWithTarget:v8 selector:sel_drawWithDisplayLink_];
    v10 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v9;

    [*(id *)(a1 + 24) setPaused:*(unsigned __int8 *)(a1 + 38)];
    LODWORD(v11) = *(_DWORD *)(a1 + 64);
    LODWORD(v12) = *(_DWORD *)(a1 + 68);
    LODWORD(v13) = *(_DWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 24), "setPreferredFrameRateRange:", v11, v12, v13);
    if (*(unsigned char *)(a1 + 33)) {
      [*(id *)(a1 + 24) setHighFrameRateReason:*(unsigned int *)(a1 + 40)];
    }
    v14 = *(void **)(a1 + 24);
    v15 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v14 addToRunLoop:v15 forMode:*MEMORY[0x263EFF588]];
  }
  -[PKRenderLoop _updateEffectivePausedState](a1);
  BOOL v16 = *(unsigned char *)(a1 + 39) == 0;
LABEL_17:
  a1 = !v16;

LABEL_21:
  return a1;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(PKRenderLoop *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PKRenderLoop;
  [(PKRenderLoop *)&v4 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKRenderLoop *)self _didInvalidate];
    objc_storeWeak((id *)&self->_screen, 0);
    displayLink = self->_displayLink;
    if (displayLink)
    {
      [(CADisplayLink *)displayLink invalidate];
      objc_super v4 = self->_displayLink;
      self->_displayLink = 0;
    }
    -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_hasHighFrameRateReason = 1;
  self->_highFrameRateReason = a3;
  -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:");
}

- (void)_sceneWillEnterForeground:(id)a3
{
  self->_background = 0;
  -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isDrawing
{
  return self->_drawing;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum = self->_preferredFrameRateRange.minimum;
  float maximum = self->_preferredFrameRateRange.maximum;
  float preferred = self->_preferredFrameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (PKRenderLoopDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKRenderLoopDelegate *)WeakRetained;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end