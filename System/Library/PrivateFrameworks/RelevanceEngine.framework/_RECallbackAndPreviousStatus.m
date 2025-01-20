@interface _RECallbackAndPreviousStatus
- (OS_dispatch_queue)queue;
- (id)invalidationCallback;
- (int)status;
- (void)setInvalidationCallback:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation _RECallbackAndPreviousStatus

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (id)invalidationCallback
{
  return self->_invalidationCallback;
}

- (void)setInvalidationCallback:(id)a3
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
  objc_storeStrong(&self->_invalidationCallback, 0);
}

@end