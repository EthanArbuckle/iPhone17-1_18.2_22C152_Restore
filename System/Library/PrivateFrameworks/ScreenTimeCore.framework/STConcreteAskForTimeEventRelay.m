@interface STConcreteAskForTimeEventRelay
- (NSHashTable)observers;
- (NSObject)observersLock;
- (STConcreteAskForTimeEventRelay)init;
- (void)addObserver:(id)a3;
- (void)relayRequestEvent:(id)a3;
- (void)relayResponseEvent:(id)a3;
@end

@implementation STConcreteAskForTimeEventRelay

- (STConcreteAskForTimeEventRelay)init
{
  v8.receiver = self;
  v8.super_class = (Class)STConcreteAskForTimeEventRelay;
  v2 = [(STConcreteAskForTimeEventRelay *)&v8 init];
  uint64_t v3 = objc_opt_new();
  observersLock = v2->_observersLock;
  v2->_observersLock = v3;

  uint64_t v5 = +[NSHashTable weakObjectsHashTable];
  observers = v2->_observers;
  v2->_observers = (NSHashTable *)v5;

  return v2;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v4 = self->_observersLock;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)relayRequestEvent:(id)a3
{
  id v4 = a3;
  id v5 = self->_observersLock;
  objc_sync_enter(v5);
  v6 = [(NSHashTable *)self->_observers allObjects];
  objc_sync_exit(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "eventRelay:didRelayRequestEvent:", self, v4, (void)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)relayResponseEvent:(id)a3
{
  id v4 = a3;
  id v5 = self->_observersLock;
  objc_sync_enter(v5);
  v6 = [(NSHashTable *)self->_observers allObjects];
  objc_sync_exit(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "eventRelay:didRelayResponseEvent:", self, v4, (void)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSObject)observersLock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
}

@end