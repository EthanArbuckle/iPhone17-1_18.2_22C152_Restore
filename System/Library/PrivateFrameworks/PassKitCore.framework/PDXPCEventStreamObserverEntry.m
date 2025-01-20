@interface PDXPCEventStreamObserverEntry
- (OS_dispatch_queue)replyQueue;
- (PDXPCEventStreamObserver)observer;
- (void)setObserver:(id)a3;
- (void)setReplyQueue:(id)a3;
@end

@implementation PDXPCEventStreamObserverEntry

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (PDXPCEventStreamObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PDXPCEventStreamObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end