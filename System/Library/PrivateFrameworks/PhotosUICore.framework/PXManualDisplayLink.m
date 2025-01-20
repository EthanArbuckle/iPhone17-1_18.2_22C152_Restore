@interface PXManualDisplayLink
+ (BOOL)supportsSpecificScreen;
- (BOOL)paused;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4;
- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5;
- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6;
- (SEL)selector;
- (UIScreen)screen;
- (double)currentMediaTime;
- (double)duration;
- (double)targetTimestamp;
- (double)timestamp;
- (id)target;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)frameRateRangeType;
- (unsigned)highFrameRateReason;
- (void)incrementTargetTimeWithInterval:(double)a3;
- (void)setFrameRateRangeType:(unint64_t)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
@end

@implementation PXManualDisplayLink

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->screen);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);
}

- (void)setFrameRateRangeType:(unint64_t)a3
{
  self->_frameRateRangeType = a3;
}

- (unint64_t)frameRateRangeType
{
  return self->_frameRateRangeType;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->screen);
  return (UIScreen *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)paused
{
  return self->_paused;
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

- (void)incrementTargetTimeWithInterval:(double)a3
{
  self->_targetTimestamp = self->_targetTimestamp + a3;
  if (!self->_paused)
  {
    v4 = [(PXManualDisplayLink *)self target];
    if (v4)
    {
      id v6 = v4;
      id WeakRetained = objc_loadWeakRetained(&self->_target);
      objc_msgSend(WeakRetained, "performSelector:withObject:", -[PXManualDisplayLink selector](self, "selector"), self);

      v4 = v6;
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(PXManualDisplayLink *)self paused];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  v8 = v7;
  [(PXManualDisplayLink *)self targetTimestamp];
  v10 = [v3 stringWithFormat:@"<%@: %p paused = %@; targetTimestamp = %.3f>", v5, self, v8, v9];;

  return (NSString *)v10;
}

- (double)duration
{
  return 1.0 / (double)self->_preferredFramesPerSecond;
}

- (double)timestamp
{
  return self->_targetTimestamp;
}

- (double)currentMediaTime
{
  return self->_targetTimestamp;
}

- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXManualDisplayLink;
  v10 = [(PXManualDisplayLink *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_target, v8);
    v11->_selector = a4;
    objc_storeStrong((id *)&v11->_queue, a5);
    v11->_preferredFramesPerSecond = 30;
  }

  return v11;
}

- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6
{
  return [(PXManualDisplayLink *)self initWithWeakTarget:a3 selector:a4 queue:a6];
}

- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  return [(PXManualDisplayLink *)self initWithWeakTarget:a3 selector:a4 queue:MEMORY[0x1E4F14428]];
}

+ (BOOL)supportsSpecificScreen
{
  return 0;
}

@end