@interface NRDeviceCollectionHistoryObserverWrapper
- (OS_dispatch_queue)queue;
- (id)observer;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NRDeviceCollectionHistoryObserverWrapper

- (id)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_observer, 0);
}

@end