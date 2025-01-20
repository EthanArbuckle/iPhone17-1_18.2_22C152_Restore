@interface PXRateLimitingEventCoalescer
- (PXRateLimitingEventCoalescer)init;
- (PXRateLimitingEventCoalescer)initWithRate:(double)a3;
- (void)_handleTimer;
- (void)inputEvent;
@end

@implementation PXRateLimitingEventCoalescer

- (PXRateLimitingEventCoalescer)initWithRate:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXRateLimitingEventCoalescer;
  return [(PXEventCoalescer *)&v4 initWithInterval:a3];
}

- (void)inputEvent
{
  [(PXEventCoalescer *)self setIsCancelled:0];
  if (![(PXEventCoalescer *)self waitingForCallback])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(PXEventCoalescer *)self lastSignalTime];
    double v5 = Current - v4;
    [(PXEventCoalescer *)self interval];
    if (v5 >= v6)
    {
      [(PXEventCoalescer *)self signalObservers];
    }
    else
    {
      [(PXEventCoalescer *)self interval];
      self->_debugLastDispatchInterval = v7 - v5;
      [(PXEventCoalescer *)self setWaitingForCallback:1];
      objc_initWeak(&location, self);
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(self->_debugLastDispatchInterval * 1000000000.0));
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __42__PXRateLimitingEventCoalescer_inputEvent__block_invoke;
      v9[3] = &unk_26545BBD8;
      objc_copyWeak(&v10, &location);
      dispatch_after(v8, MEMORY[0x263EF83A0], v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __42__PXRateLimitingEventCoalescer_inputEvent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTimer];
}

- (void)_handleTimer
{
  [(PXEventCoalescer *)self setWaitingForCallback:0];
  if (![(PXEventCoalescer *)self isCancelled])
  {
    [(PXEventCoalescer *)self signalObservers];
  }
}

- (PXRateLimitingEventCoalescer)init
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXEventCoalescer.m", 194, @"%s is not available as initializer", "-[PXRateLimitingEventCoalescer init]");

  abort();
}

@end