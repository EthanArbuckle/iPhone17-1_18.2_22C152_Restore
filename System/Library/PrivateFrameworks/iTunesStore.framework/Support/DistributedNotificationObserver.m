@interface DistributedNotificationObserver
- (DistributedNotificationObserver)initWithServiceName:(id)a3;
- (NSArray)observedNotificationNames;
- (void)addObservedNotificationName:(id)a3;
- (void)addObservedNotificationNames:(id)a3;
- (void)dealloc;
- (void)postNotificationName:(id)a3 message:(id)a4;
- (void)removeObservedNotificationName:(id)a3;
@end

@implementation DistributedNotificationObserver

- (DistributedNotificationObserver)initWithServiceName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DistributedNotificationObserver;
  v4 = [(DistributedNotificationObserver *)&v6 init];
  if (v4)
  {
    v4->_connection = (SSXPCConnection *)[objc_alloc((Class)SSXPCConnection) initWithServiceName:a3];
    v4->_notificationNames = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DistributedNotificationObserver;
  [(DistributedNotificationObserver *)&v3 dealloc];
}

- (void)addObservedNotificationName:(id)a3
{
}

- (void)addObservedNotificationNames:(id)a3
{
}

- (NSArray)observedNotificationNames
{
  return (NSArray *)[(NSMutableSet *)self->_notificationNames allObjects];
}

- (void)postNotificationName:(id)a3 message:(id)a4
{
  if ([(NSMutableSet *)self->_notificationNames containsObject:a3])
  {
    connection = self->_connection;
    [(SSXPCConnection *)connection sendMessage:a4];
  }
}

- (void)removeObservedNotificationName:(id)a3
{
}

@end