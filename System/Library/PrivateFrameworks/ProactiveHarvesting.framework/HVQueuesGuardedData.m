@interface HVQueuesGuardedData
- (HVQueuesGuardedData)init;
@end

@implementation HVQueuesGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAvailableNotificationInProgress, 0);
  objc_storeStrong((id *)&self->_queues, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (HVQueuesGuardedData)init
{
  v9.receiver = self;
  v9.super_class = (Class)HVQueuesGuardedData;
  v2 = [(HVQueuesGuardedData *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:5];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    uint64_t v5 = objc_opt_new();
    queues = v2->_queues;
    v2->_queues = (NSMutableDictionary *)v5;

    contentAvailableNotificationInProgress = v2->_contentAvailableNotificationInProgress;
    v2->_contentAvailableNotificationInProgress = 0;

    v2->_dataSourcesWithContentAvailable = 0;
  }
  return v2;
}

@end