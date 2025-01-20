@interface _BKMousePointerDeviceAvailabilityMonitorObserverContext
- (BKMousePointerDeviceAvailabilityMonitorObserver)observer;
- (OS_dispatch_queue)queue;
- (_BKMousePointerDeviceAvailabilityMonitorObserverContext)initWithObserver:(id)a3 queue:(id)a4;
@end

@implementation _BKMousePointerDeviceAvailabilityMonitorObserverContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_observer);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BKMousePointerDeviceAvailabilityMonitorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (BKMousePointerDeviceAvailabilityMonitorObserver *)WeakRetained;
}

- (_BKMousePointerDeviceAvailabilityMonitorObserverContext)initWithObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BKMousePointerDeviceAvailabilityMonitorObserverContext;
  v8 = [(_BKMousePointerDeviceAvailabilityMonitorObserverContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

@end