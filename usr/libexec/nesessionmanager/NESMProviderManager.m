@interface NESMProviderManager
- (NESMProviderManager)init;
@end

@implementation NESMProviderManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTerminationOperations, 0);
  objc_storeStrong((id *)&self->_extensionsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_registrationMap, 0);
  objc_storeStrong((id *)&self->_eventPublisher, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NESMProviderManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)NESMProviderManager;
  v2 = [(NESMProviderManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NESMProviderManager queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = xpc_event_publisher_create();
    eventPublisher = v2->_eventPublisher;
    v2->_eventPublisher = (OS_xpc_event_publisher *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registrationMap = v2->_registrationMap;
    v2->_registrationMap = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    extensionsBeingUpdated = v2->_extensionsBeingUpdated;
    v2->_extensionsBeingUpdated = v10;
  }
  return v2;
}

@end