@interface CFXEngineNotificationQueueTransientWrapper
- (__CFXEngineNotificationQueue)engineNotificationQueue;
- (void)dealloc;
- (void)setEngineNotificationQueue:(__CFXEngineNotificationQueue *)a3;
@end

@implementation CFXEngineNotificationQueueTransientWrapper

- (void)setEngineNotificationQueue:(__CFXEngineNotificationQueue *)a3
{
}

- (__CFXEngineNotificationQueue)engineNotificationQueue
{
  return (__CFXEngineNotificationQueue *)objc_loadWeak(&self->_queue);
}

- (void)dealloc
{
  objc_storeWeak(&self->_queue, 0);
  v3.receiver = self;
  v3.super_class = (Class)CFXEngineNotificationQueueTransientWrapper;
  [(CFXEngineNotificationQueueTransientWrapper *)&v3 dealloc];
}

@end