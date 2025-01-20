@interface HDSPSleepEventList
- (HDSPSleepEventList)init;
- (NSArray)sortedEvents;
- (NSMutableDictionary)eventsByProvider;
- (id)allEvents;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)nextEvent;
- (id)overdueEventsForDate:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_sortEvents;
- (void)addEvents:(id)a3 provider:(id)a4;
- (void)removeAllEvents;
- (void)removeEvents:(id)a3;
- (void)removeEventsForProvider:(id)a3;
@end

@implementation HDSPSleepEventList

- (HDSPSleepEventList)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDSPSleepEventList;
  v2 = [(HDSPSleepEventList *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventsByProvider = v2->_eventsByProvider;
    v2->_eventsByProvider = v3;

    sortedEvents = v2->_sortedEvents;
    v2->_sortedEvents = (NSArray *)MEMORY[0x263EFFA68];

    v6 = v2;
  }

  return v2;
}

- (void)addEvents:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  eventsByProvider = self->_eventsByProvider;
  v9 = [v7 providerIdentifier];
  id v10 = [(NSMutableDictionary *)eventsByProvider objectForKeyedSubscript:v9];

  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v11 = self->_eventsByProvider;
    v12 = [v7 providerIdentifier];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__HDSPSleepEventList_addEvents_provider___block_invoke;
  v14[3] = &unk_2645DA940;
  id v15 = v10;
  id v13 = v10;
  objc_msgSend(v6, "na_each:", v14);
  [(HDSPSleepEventList *)self _sortEvents];
}

void __41__HDSPSleepEventList_addEvents_provider___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (void)_sortEvents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_eventsByProvider;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_eventsByProvider, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v8), (void)v14);
        id v10 = [v9 allValues];
        [v3 addObjectsFromArray:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v11 = HKSPSleepEventComparator();
  [v3 sortUsingComparator:v11];

  v12 = (NSArray *)[v3 copy];
  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = v12;
}

- (void)removeEventsForProvider:(id)a3
{
  eventsByProvider = self->_eventsByProvider;
  uint64_t v5 = [a3 providerIdentifier];
  [(NSMutableDictionary *)eventsByProvider removeObjectForKey:v5];

  [(HDSPSleepEventList *)self _sortEvents];
}

- (void)removeEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_eventsByProvider;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(NSMutableDictionary *)self->_eventsByProvider objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __35__HDSPSleepEventList_removeEvents___block_invoke;
        v12[3] = &unk_2645DA940;
        id v13 = v10;
        id v11 = v10;
        objc_msgSend(v4, "na_each:", v12);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(HDSPSleepEventList *)self _sortEvents];
}

void __35__HDSPSleepEventList_removeEvents___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 removeObjectForKey:v3];
}

- (void)removeAllEvents
{
  [(NSMutableDictionary *)self->_eventsByProvider removeAllObjects];
  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = (NSArray *)MEMORY[0x263EFFA68];
}

- (id)nextEvent
{
  return [(NSArray *)self->_sortedEvents firstObject];
}

- (id)overdueEventsForDate:(id)a3
{
  id v4 = a3;
  sortedEvents = self->_sortedEvents;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__HDSPSleepEventList_overdueEventsForDate___block_invoke;
  v9[3] = &unk_2645DA6F8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)sortedEvents na_filter:v9];

  return v7;
}

uint64_t __43__HDSPSleepEventList_overdueEventsForDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 dueDate];
  uint64_t v4 = objc_msgSend(v3, "hksp_isBeforeOrSameAsDate:", *(void *)(a1 + 32));

  return v4;
}

- (id)allEvents
{
  return self->_sortedEvents;
}

- (id)succinctDescription
{
  v2 = [(HDSPSleepEventList *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(HDSPSleepEventList *)self allEvents];
  [v3 appendArraySection:v4 withName:@"sleepEvents" multilinePrefix:&stru_26D3FAEE0 skipIfEmpty:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HDSPSleepEventList *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (NSMutableDictionary)eventsByProvider
{
  return self->_eventsByProvider;
}

- (NSArray)sortedEvents
{
  return self->_sortedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedEvents, 0);

  objc_storeStrong((id *)&self->_eventsByProvider, 0);
}

@end