@interface TVObservableEventController
- (void)addObserver:(id)a3 forEvent:(id)a4;
- (void)dispatchEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forEvent:(id)a4;
@end

@implementation TVObservableEventController

- (void)dispatchEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NSMutableDictionary *)self->_observerRecords objectForKeyedSubscript:v8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) handleEvent:v8 sender:v9 withUserInfo:v10];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)addObserver:(id)a3 forEvent:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  observerRecords = self->_observerRecords;
  if (!observerRecords)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    id v9 = self->_observerRecords;
    self->_observerRecords = v8;

    id v10 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    eventsByObserver = self->_eventsByObserver;
    self->_eventsByObserver = v10;

    observerRecords = self->_observerRecords;
  }
  uint64_t v12 = [(NSMutableDictionary *)observerRecords objectForKeyedSubscript:v6];
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_observerRecords setObject:v12 forKeyedSubscript:v6];
  }
  [v12 addObject:v15];
  uint64_t v13 = [(NSMapTable *)self->_eventsByObserver objectForKey:v15];
  if (!v13)
  {
    uint64_t v14 = self->_eventsByObserver;
    uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    [(NSMapTable *)v14 setObject:v13 forKey:v15];
  }
  [v13 addObject:v6];
}

- (void)removeObserver:(id)a3 forEvent:(id)a4
{
  observerRecords = self->_observerRecords;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)observerRecords objectForKeyedSubscript:a4];
  [v7 removeObject:v6];
}

- (void)removeObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMapTable *)self->_eventsByObserver objectForKey:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TVObservableEventController *)self removeObserver:v4 forEvent:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByObserver, 0);
  objc_storeStrong((id *)&self->_observerRecords, 0);
}

@end