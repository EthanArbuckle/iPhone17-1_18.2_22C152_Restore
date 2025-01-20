@interface SSDistributedNotificationCenterObserver
- (NSString)name;
- (OS_dispatch_queue)dispatchQueue;
- (SSDistributedNotificationCenterObserver)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
- (id)block;
- (void)dealloc;
@end

@implementation SSDistributedNotificationCenterObserver

- (SSDistributedNotificationCenterObserver)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SSDistributedNotificationCenterObserver;
  v8 = [(SSDistributedNotificationCenterObserver *)&v10 init];
  if (v8)
  {
    v8->_block = (id)[a5 copy];
    v8->_name = (NSString *)[a3 copy];
    if (a4)
    {
      v8->_dispatchQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
  }
  return v8;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)SSDistributedNotificationCenterObserver;
  [(SSDistributedNotificationCenterObserver *)&v3 dealloc];
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)name
{
  return self->_name;
}

@end