@interface TRINotificationCallback
- (OS_dispatch_queue)queue;
- (TRINotificationCallback)init;
- (id)handler;
- (unint64_t)id;
- (void)setHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TRINotificationCallback

- (unint64_t)id
{
  return self->_id;
}

- (void)setQueue:(id)a3
{
}

- (void)setHandler:(id)a3
{
}

- (TRINotificationCallback)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRINotificationCallback;
  result = [(TRINotificationCallback *)&v3 init];
  if (result) {
    result->_id = (int)atomic_fetch_add(init_objCount, 1u);
  }
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end