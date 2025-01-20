@interface SXEventStoreProvider
- (EKEventStore)eventStore;
@end

@implementation SXEventStoreProvider

- (EKEventStore)eventStore
{
  eventStore = self->_eventStore;
  if (!eventStore)
  {
    v4 = (EKEventStore *)objc_alloc_init(MEMORY[0x263F04B98]);
    v5 = self->_eventStore;
    self->_eventStore = v4;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

- (void).cxx_destruct
{
}

@end