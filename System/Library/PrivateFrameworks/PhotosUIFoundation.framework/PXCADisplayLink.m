@interface PXCADisplayLink
+ (BOOL)highFramerateRequiresReasonAndRange;
+ (BOOL)supportsSpecificScreen;
- (BOOL)isHighFrameRateActive;
- (BOOL)paused;
- (PXCADisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9;
- (double)duration;
- (double)resolvedDuration;
- (double)targetTimestamp;
- (double)timestamp;
- (id)description;
- (id)queue;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)frameRateRangeType;
- (unsigned)highFrameRateReason;
- (void)_addToRunLoop;
- (void)_tick:(id)a3;
- (void)_updateIsHighFrameRateActive;
- (void)dealloc;
- (void)invalidate;
- (void)setFrameRateRangeType:(unint64_t)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setIsHighFrameRateActive:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation PXCADisplayLink

- (double)duration
{
  [(CADisplayLink *)self->_displayLink duration];
  return result;
}

- (double)targetTimestamp
{
  double result = self->_updateCycleTargetTimestamp;
  if (result == 0.0) {
    [(CADisplayLink *)self->_displayLink targetTimestamp];
  }
  return result;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  [(CADisplayLink *)self->_displayLink setPaused:v3];

  [(PXCADisplayLink *)self _updateIsHighFrameRateActive];
}

- (double)timestamp
{
  double result = self->_updateCycleTimestamp;
  if (result == 0.0) {
    [(CADisplayLink *)self->_displayLink timestamp];
  }
  return result;
}

- (void)setIsHighFrameRateActive:(BOOL)a3
{
  if (self->_isHighFrameRateActive != a3)
  {
    self->_isHighFrameRateActive = a3;
    [(PXCADisplayLink *)self highFrameRateReason];
    [(CADisplayLink *)self->_displayLink preferredFrameRateRange];
    kdebug_trace();
  }
}

void __112__PXCADisplayLink_initWithWeakTarget_selector_deferredStart_runloopModes_preferredFramesPerSecond_screen_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _addToRunLoop];
}

- (int64_t)preferredFramesPerSecond
{
  [(CADisplayLink *)self->_displayLink preferredFrameRateRange];
  return (uint64_t)v2;
}

- (PXCADisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9
{
  BOOL v12 = a5;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if (v19 != (id)MEMORY[0x263EF83A0])
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXCADisplayLink.m", 66, @"Invalid parameter not satisfying: %@", @"queue == dispatch_get_main_queue()" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)PXCADisplayLink;
  v20 = [(PXDisplayLink *)&v32 initInternalWithWeakTarget:v16 selector:a4 deferredStart:v12 runloopModes:v17 preferredFramesPerSecond:a7 screen:v18 queue:v19];
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x263F15780] displayLinkWithTarget:v20 selector:sel__tick_];
    displayLink = v20->_displayLink;
    v20->_displayLink = (CADisplayLink *)v21;

    BOOL v23 = +[PXCADisplayLink highFramerateRequiresReasonAndRange];
    if (a7 >= 1 && !v23)
    {
      CAFrameRateRange v35 = CAFrameRateRangeMake((float)a7, (float)a7, (float)a7);
      -[CADisplayLink setPreferredFrameRateRange:](v20->_displayLink, "setPreferredFrameRateRange:", *(double *)&v35.minimum, *(double *)&v35.maximum, *(double *)&v35.preferred);
    }
    if (v12)
    {
      objc_initWeak(&location, v20);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __112__PXCADisplayLink_initWithWeakTarget_selector_deferredStart_runloopModes_preferredFramesPerSecond_screen_queue___block_invoke;
      aBlock[3] = &unk_26545BBD8;
      objc_copyWeak(&v30, &location);
      context.version = 0;
      context.info = _Block_copy(aBlock);
      memset(&context.retain, 0, 24);
      v24 = CFRunLoopObserverCreate(0, 0x20uLL, 0, 2000001, (CFRunLoopObserverCallBack)_PXRunLoopObserverTrampoline, &context);
      if (v24)
      {
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddObserver(Current, v24, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
        CFRelease(v24);
      }
      else
      {
        v26 = PFUIGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_259CDA000, v26, OS_LOG_TYPE_ERROR, "Failed to create an observer", buf, 2u);
        }

        CFRelease(context.info);
      }
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PXCADisplayLink *)v20 _addToRunLoop];
    }
  }

  return v20;
}

- (void)_addToRunLoop
{
  displayLink = self->_displayLink;
  v4 = [MEMORY[0x263EFF9F0] mainRunLoop];
  v5 = [(PXDisplayLink *)self runloopModes];
  [(CADisplayLink *)displayLink addToRunLoop:v4 forMode:v5];

  [(PXCADisplayLink *)self paused];

  kdebug_trace();
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (+[PXCADisplayLink highFramerateRequiresReasonAndRange])
  {
    [(CADisplayLink *)self->_displayLink setHighFrameRateReason:v3];
    kdebug_trace();
    [(PXCADisplayLink *)self _updateIsHighFrameRateActive];
  }
}

- (void)setFrameRateRangeType:(unint64_t)a3
{
  if (+[PXCADisplayLink highFramerateRequiresReasonAndRange]&& self->_frameRateRangeType != a3)
  {
    self->_frameRateRangeType = a3;
    *(float *)&double v5 = PXFrameRateRangeTypeGetCAFrameRateRange(a3);
    [(CADisplayLink *)self->_displayLink setPreferredFrameRateRange:v5];
    kdebug_trace();
    [(PXCADisplayLink *)self _updateIsHighFrameRateActive];
  }
}

- (void)_updateIsHighFrameRateActive
{
  if (+[PXCADisplayLink highFramerateRequiresReasonAndRange]&& ![(PXCADisplayLink *)self paused]&& [(PXCADisplayLink *)self highFrameRateReason])
  {
    [(CADisplayLink *)self->_displayLink preferredFrameRateRange];
    BOOL v4 = v3 > 60.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  [(PXCADisplayLink *)self setIsHighFrameRateActive:v4];
}

+ (BOOL)highFramerateRequiresReasonAndRange
{
  if (highFramerateRequiresReasonAndRange_onceToken != -1) {
    dispatch_once(&highFramerateRequiresReasonAndRange_onceToken, &__block_literal_global_8428);
  }
  return highFramerateRequiresReasonAndRange_highFramerateRequiresReasonAndRange;
}

- (BOOL)paused
{
  displayLink = self->_displayLink;
  return !displayLink || [(CADisplayLink *)displayLink isPaused];
}

- (unsigned)highFrameRateReason
{
  return [(CADisplayLink *)self->_displayLink highFrameRateReason];
}

- (void)_tick:(id)a3
{
  if (self->_displayLink == a3)
  {
    if (_UIUpdateCycleEnabled())
    {
      if (_UIUpdateCurrentTiming())
      {
        _UIMediaTimeForMachTime();
        double v5 = v4;
        self->_updateCycleTargetTimestamp = v4;
        [(CADisplayLink *)self->_displayLink duration];
        double v7 = v5 - v6;
      }
      else
      {
        self->_updateCycleTargetTimestamp = 0.0;
        double v7 = 0.0;
      }
      self->_updateCycleTimestamp = v7;
    }
    id v8 = [(PXDisplayLink *)self target];
    if (v8) {
      objc_msgSend(v8, "performSelector:withObject:", -[PXDisplayLink selector](self, "selector"), self);
    }
    else {
      [(PXCADisplayLink *)self invalidate];
    }
  }
}

- (void).cxx_destruct
{
}

void __54__PXCADisplayLink_highFramerateRequiresReasonAndRange__block_invoke()
{
  char v0 = MGGetBoolAnswer();
  v1 = (void *)MGGetStringAnswer();
  char v2 = [v1 isEqualToString:@"iPhone"];

  highFramerateRequiresReasonAndRange_highFramerateRequiresReasonAndRange = v0 & v2;
}

- (void)dealloc
{
  [(PXCADisplayLink *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXCADisplayLink;
  [(PXCADisplayLink *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = self->_displayLink;
  if (v3)
  {
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__PXCADisplayLink_invalidate__block_invoke;
    v5[3] = &unk_26545BC00;
    double v6 = v3;
    px_dispatch_on_main_queue(v5);
  }
}

uint64_t __29__PXCADisplayLink_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

+ (BOOL)supportsSpecificScreen
{
  return 0;
}

- (BOOL)isHighFrameRateActive
{
  return self->_isHighFrameRateActive;
}

- (unint64_t)frameRateRangeType
{
  return self->_frameRateRangeType;
}

- (double)resolvedDuration
{
  uint64_t v3 = [(PXCADisplayLink *)self preferredFramesPerSecond];
  displayLink = self->_displayLink;
  if (v3 < 1)
  {
    [(CADisplayLink *)displayLink duration];
  }
  else
  {
    [(CADisplayLink *)displayLink targetTimestamp];
    double v6 = v5;
    [(CADisplayLink *)self->_displayLink timestamp];
    return v6 - v7;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  BOOL v6 = [(PXCADisplayLink *)self paused];
  double v7 = @"NO";
  if (v6) {
    double v7 = @"YES";
  }
  id v8 = v7;
  [(PXCADisplayLink *)self targetTimestamp];
  uint64_t v10 = v9;
  [(PXCADisplayLink *)self timestamp];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; paused = %@; targetTimestamp = %.3f timestamp = %.3f>",
    v5,
    self,
    v8,
    v10,
  BOOL v12 = v11);

  return v12;
}

- (id)queue
{
  char v2 = (void *)MEMORY[0x263EF83A0];
  id v3 = MEMORY[0x263EF83A0];
  return v2;
}

@end