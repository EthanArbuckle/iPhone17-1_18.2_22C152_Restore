@interface _PASNotificationDescriptor
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (id)handler;
- (void)setGroup:(id)a3;
- (void)setHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _PASNotificationDescriptor

- (void)setQueue:(id)a3
{
}

- (void)setHandler:(id)a3
{
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)handler
{
  return self->_handler;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end