@interface PXEventCoalescer
+ (id)delayedCoalescerWithDelay:(double)a3;
+ (id)rateLimitingCoalescerWithRate:(double)a3;
- (BOOL)isCancelled;
- (BOOL)waitingForCallback;
- (PXEventCoalescer)init;
- (PXEventCoalescer)initWithInterval:(double)a3;
- (double)interval;
- (double)lastEventTime;
- (double)lastSignalTime;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)cancel;
- (void)inputEvent;
- (void)registerObserver:(id)a3;
- (void)reset;
- (void)setInterval:(double)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setLastEventTime:(double)a3;
- (void)setLastSignalTime:(double)a3;
- (void)setWaitingForCallback:(BOOL)a3;
- (void)signalObservers;
- (void)signalObserversBeganPendingEvent;
- (void)unregisterObserver:(id)a3;
@end

@implementation PXEventCoalescer

+ (id)delayedCoalescerWithDelay:(double)a3
{
  v3 = [[PXDelayEventCoalescer alloc] initWithDelay:a3];

  return v3;
}

+ (id)rateLimitingCoalescerWithRate:(double)a3
{
  v3 = [[PXRateLimitingEventCoalescer alloc] initWithRate:a3];

  return v3;
}

- (PXEventCoalescer)initWithInterval:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXEventCoalescer;
  v4 = [(PXEventCoalescer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_interval = a3;
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;
  }
  return v5;
}

- (void)registerObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setLastSignalTime:(double)a3
{
  self->_lastSignalTime = a3;
}

- (double)lastSignalTime
{
  return self->_lastSignalTime;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BOOL)waitingForCallback
{
  return self->_waitingForCallback;
}

- (void)setLastEventTime:(double)a3
{
  self->_lastEventTime = a3;
}

- (double)lastEventTime
{
  return self->_lastEventTime;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)signalObservers
{
  [(PXEventCoalescer *)self setLastSignalTime:CFAbsoluteTimeGetCurrent()];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__PXEventCoalescer_signalObservers__block_invoke;
  v3[3] = &unk_26545B2F0;
  v3[4] = self;
  [(PXEventCoalescer *)self _enumerateObserversWithBlock:v3];
}

uint64_t __35__PXEventCoalescer_signalObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 outputEventSignaledForCoalescer:*(void *)(a1 + 32)];
}

- (void)signalObserversBeganPendingEvent
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__PXEventCoalescer_signalObserversBeganPendingEvent__block_invoke;
  v2[3] = &unk_26545B2F0;
  v2[4] = self;
  [(PXEventCoalescer *)self _enumerateObserversWithBlock:v2];
}

void __52__PXEventCoalescer_signalObserversBeganPendingEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 coalescerBeganPendingEvent:*(void *)(a1 + 32)];
  }
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  v5 = (void *)[(NSHashTable *)self->_observers copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setWaitingForCallback:(BOOL)a3
{
  if (self->_waitingForCallback != a3)
  {
    self->_waitingForCallback = a3;
    if (a3) {
      [(PXEventCoalescer *)self signalObserversBeganPendingEvent];
    }
  }
}

- (void)unregisterObserver:(id)a3
{
}

- (void)inputEvent
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXEventCoalescer.m", 86, @"Method %s is a responsibility of subclass %@", "-[PXEventCoalescer inputEvent]", v6 object file lineNumber description];

  abort();
}

- (void)reset
{
  [(PXEventCoalescer *)self cancel];
  [(PXEventCoalescer *)self setWaitingForCallback:0];
  [(PXEventCoalescer *)self setLastEventTime:0.0];

  [(PXEventCoalescer *)self setLastSignalTime:0.0];
}

- (void)cancel
{
}

- (PXEventCoalescer)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXEventCoalescer.m", 69, @"%s is not available as initializer", "-[PXEventCoalescer init]");

  abort();
}

@end