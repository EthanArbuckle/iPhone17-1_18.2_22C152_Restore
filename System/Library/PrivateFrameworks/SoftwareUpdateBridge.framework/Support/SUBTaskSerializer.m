@interface SUBTaskSerializer
- (OS_dispatch_queue)queue;
- (SUBTaskSerializer)initWithQueueLabel:(const char *)a3;
- (void)enqueueAsynchronousTask:(id)a3;
- (void)enqueueSynchronousTask:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SUBTaskSerializer

- (SUBTaskSerializer)initWithQueueLabel:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUBTaskSerializer;
  v4 = [(SUBTaskSerializer *)&v9 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(a3, v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;
  }
  return v4;
}

- (void)enqueueSynchronousTask:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D398;
    block[3] = &unk_10002D0F8;
    id v8 = v4;
    dispatch_sync(queue, block);
  }
}

- (void)enqueueAsynchronousTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_get_label((dispatch_queue_t)self->_queue);
    v5 = (void *)os_transaction_create();
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D470;
    v8[3] = &unk_10002C700;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_sync(queue, v8);
  }
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
}

@end