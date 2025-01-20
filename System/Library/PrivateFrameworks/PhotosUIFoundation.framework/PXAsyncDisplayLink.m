@interface PXAsyncDisplayLink
+ (BOOL)supportsSpecificScreen;
- (BOOL)paused;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4;
- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 preferredFramesPerSecond:(int64_t)a5 screen:(id)a6 queue:(id)a7;
- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5;
- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6;
- (SEL)selector;
- (UIScreen)screen;
- (double)currentMediaTime;
- (double)duration;
- (double)resolvedDuration;
- (double)targetTimestamp;
- (double)timestamp;
- (id)target;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)frameRateRangeType;
- (unsigned)highFrameRateReason;
- (void)_mainQueue_tick;
- (void)_modifyDisplayLink:(id)a3;
- (void)_queue_tickTimestamp:(double)a3 duration:(double)a4 targetTimestamp:(double)a5 preferredFramesPerSecond:(int64_t)a6;
- (void)invalidate;
- (void)setFrameRateRangeType:(unint64_t)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation PXAsyncDisplayLink

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);

  objc_storeStrong((id *)&self->_mainQueue_displayLink, 0);
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  return (UIScreen *)WeakRetained;
}

- (BOOL)paused
{
  return self->_paused;
}

- (unint64_t)frameRateRangeType
{
  return self->_frameRateRangeType;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (double)resolvedDuration
{
  return self->_resolvedDuration;
}

- (double)duration
{
  return self->_duration;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SEL)selector
{
  return self->_selector;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)_modifyDisplayLink:(id)a3
{
  id v4 = a3;
  v5 = self->_mainQueue_displayLink;
  v6 = [(PXDisplayLink *)self->_mainQueue_displayLink queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__PXAsyncDisplayLink__modifyDisplayLink___block_invoke;
  v9[3] = &unk_26545B750;
  v10 = v5;
  id v11 = v4;
  v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);
}

uint64_t __41__PXAsyncDisplayLink__modifyDisplayLink___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_mainQueue_tick
{
  v3 = self->_mainQueue_displayLink;
  [(PXDisplayLink *)v3 timestamp];
  v5 = v4;
  [(PXDisplayLink *)v3 duration];
  v7 = v6;
  [(PXDisplayLink *)v3 targetTimestamp];
  v9 = v8;
  v10 = [(PXDisplayLink *)v3 preferredFramesPerSecond];
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__PXAsyncDisplayLink__mainQueue_tick__block_invoke;
  v12[3] = &unk_26545A058;
  objc_copyWeak(v13, &location);
  v13[1] = v5;
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = v10;
  dispatch_async(queue, v12);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __37__PXAsyncDisplayLink__mainQueue_tick__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_tickTimestamp:duration:targetTimestamp:preferredFramesPerSecond:", *(void *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(PXAsyncDisplayLink *)self paused];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  id v8 = v7;
  [(PXAsyncDisplayLink *)self targetTimestamp];
  uint64_t v10 = v9;
  [(PXAsyncDisplayLink *)self timestamp];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; paused = %@; targetTimestamp = %.3f timestamp = %.3f mainQueue_displayLink = %@>",
    v5,
    self,
    v8,
    v10,
    v11,
  v12 = self->_mainQueue_displayLink);

  return (NSString *)v12;
}

- (void)_queue_tickTimestamp:(double)a3 duration:(double)a4 targetTimestamp:(double)a5 preferredFramesPerSecond:(int64_t)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_timestamp = a3;
  self->_duration = a4;
  double v11 = a5 - a3;
  if (a6 <= 0) {
    double v11 = a4;
  }
  self->_resolvedDuration = v11;
  self->_targetTimestamp = a5;
  self->_preferredFramesPerSecond = a6;
  if (![(PXAsyncDisplayLink *)self paused])
  {
    id v12 = [(PXAsyncDisplayLink *)self target];
    if (v12) {
      objc_msgSend(v12, "performSelector:withObject:", -[PXAsyncDisplayLink selector](self, "selector"), self);
    }
    else {
      [(PXAsyncDisplayLink *)self invalidate];
    }
  }
}

- (void)invalidate
{
}

uint64_t __32__PXAsyncDisplayLink_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_paused != v3)
  {
    self->_paused = v3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__PXAsyncDisplayLink_setPaused___block_invoke;
    v5[3] = &__block_descriptor_33_e23_v16__0__PXDisplayLink_8l;
    BOOL v6 = v3;
    [(PXAsyncDisplayLink *)self _modifyDisplayLink:v5];
  }
}

uint64_t __32__PXAsyncDisplayLink_setPaused___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setFrameRateRangeType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_frameRateRangeType != a3)
  {
    self->_frameRateRangeType = a3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__PXAsyncDisplayLink_setFrameRateRangeType___block_invoke;
    v5[3] = &__block_descriptor_40_e23_v16__0__PXDisplayLink_8l;
    void v5[4] = a3;
    [(PXAsyncDisplayLink *)self _modifyDisplayLink:v5];
  }
}

uint64_t __44__PXAsyncDisplayLink_setFrameRateRangeType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFrameRateRangeType:*(void *)(a1 + 32)];
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_highFrameRateReason != a3)
  {
    self->_highFrameRateReason = a3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __45__PXAsyncDisplayLink_setHighFrameRateReason___block_invoke;
    v5[3] = &__block_descriptor_36_e23_v16__0__PXDisplayLink_8l;
    unsigned int v6 = a3;
    [(PXAsyncDisplayLink *)self _modifyDisplayLink:v5];
  }
}

uint64_t __45__PXAsyncDisplayLink_setHighFrameRateReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHighFrameRateReason:*(unsigned int *)(a1 + 32)];
}

- (double)currentMediaTime
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  mainQueue_displayLink = self->_mainQueue_displayLink;

  [(PXDisplayLink *)mainQueue_displayLink currentMediaTime];
  return result;
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 preferredFramesPerSecond:(int64_t)a5 screen:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PXAsyncDisplayLink;
  v15 = [(PXAsyncDisplayLink *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_target, v12);
    v16->_selector = a4;
    objc_storeStrong((id *)&v16->_queue, a7);
    v17 = [PXDisplayLink alloc];
    v18 = [(PXDisplayLink *)v17 initWithWeakTarget:v16 selector:sel__mainQueue_tick deferredStart:0 runloopModes:*MEMORY[0x263EFF588] preferredFramesPerSecond:a5 screen:v13 queue:MEMORY[0x263EF83A0]];
    mainQueue_displayLink = v16->_mainQueue_displayLink;
    v16->_mainQueue_displayLink = v18;
    v20 = v18;

    v16->_highFrameRateReason = [(PXDisplayLink *)v20 highFrameRateReason];
    v16->_frameRateRangeType = [(PXDisplayLink *)v20 frameRateRangeType];
    v16->_paused = [(PXDisplayLink *)v20 paused];
    [(PXDisplayLink *)v20 timestamp];
    v16->_timestamp = v21;
    [(PXDisplayLink *)v20 duration];
    v16->_duration = v22;
    [(PXDisplayLink *)v20 duration];
    v16->_resolvedDuration = v23;
    [(PXDisplayLink *)v20 targetTimestamp];
    double v25 = v24;

    v16->_targetTimestamp = v25;
    v16->_preferredFramesPerSecond = a5;
  }

  return v16;
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(PXAsyncDisplayLink *)self initWithWeakTarget:v12 selector:a4 preferredFramesPerSecond:PXDisplayLinkDefaultPreferredFramesPerSecond() screen:v11 queue:v10];

  return v13;
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXAsyncDisplayLink *)self initWithWeakTarget:v9 selector:a4 preferredFramesPerSecond:PXDisplayLinkDefaultPreferredFramesPerSecond() screen:0 queue:v8];

  return v10;
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  return [(PXAsyncDisplayLink *)self initWithWeakTarget:a3 selector:a4 queue:MEMORY[0x263EF83A0]];
}

+ (BOOL)supportsSpecificScreen
{
  return 0;
}

@end