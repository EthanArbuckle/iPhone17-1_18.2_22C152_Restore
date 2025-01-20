@interface FCCacheCoordinatorGCDSerialLock
- (FCCacheCoordinatorGCDSerialLock)init;
- (void)performReadSync:(id)a3;
- (void)performWriteSync:(id)a3;
@end

@implementation FCCacheCoordinatorGCDSerialLock

- (void)performReadSync:(id)a3
{
}

- (FCCacheCoordinatorGCDSerialLock)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCCacheCoordinatorGCDSerialLock;
  v2 = [(FCCacheCoordinatorGCDSerialLock *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("FCCacheCoordinatorGCDSerialLock.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)performWriteSync:(id)a3
{
}

- (void).cxx_destruct
{
}

@end