@interface PCDelegateInfo
- (id)queue;
- (void)setQueue:(id)a3;
@end

@implementation PCDelegateInfo

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
  v5 = (OS_dispatch_queue *)a3;
  queue = self->_queue;
  p_queue = &self->_queue;
  if (queue != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_queue, a3);
    v5 = v8;
  }
}

- (id)queue
{
  return self->_queue;
}

@end