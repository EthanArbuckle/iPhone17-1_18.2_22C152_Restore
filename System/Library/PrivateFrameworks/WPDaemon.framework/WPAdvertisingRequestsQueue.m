@interface WPAdvertisingRequestsQueue
- (BOOL)isAdvertisingForClientType:(unsigned __int8)a3;
- (NSMutableArray)queue;
- (NSMutableSet)clientTypes;
- (WPAdvertisingRequestsQueue)init;
- (id)allRequests;
- (unint64_t)count;
- (void)add:(id)a3;
- (void)remove:(id)a3;
- (void)removeAll;
- (void)removeRequestsOfClientType:(unsigned __int8)a3;
- (void)setClientTypes:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation WPAdvertisingRequestsQueue

- (void)add:(id)a3
{
  id v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(WPAdvertisingRequestsQueue *)v4 queue];
  uint64_t v6 = [v5 count];

  v7 = [(WPAdvertisingRequestsQueue *)v4 queue];
  if (v6)
  {
    v8 = [(WPAdvertisingRequestsQueue *)v4 queue];
    uint64_t v9 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v8, "count"), 1024, &__block_literal_global_8);

    v7 = [(WPAdvertisingRequestsQueue *)v4 queue];
    [v7 insertObject:v10 atIndex:v9];
  }
  else
  {
    [v7 addObject:v10];
  }

  objc_sync_exit(v4);
}

- (unint64_t)count
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(WPAdvertisingRequestsQueue *)v2 queue];
  unint64_t v4 = [v3 count];

  objc_sync_exit(v2);
  return v4;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)remove:(id)a3
{
  id v6 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = [(WPAdvertisingRequestsQueue *)v4 queue];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (BOOL)isAdvertisingForClientType:(unsigned __int8)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = [(WPAdvertisingRequestsQueue *)v4 queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__WPAdvertisingRequestsQueue_isAdvertisingForClientType___block_invoke;
  v7[3] = &unk_26469B0A8;
  unsigned __int8 v8 = a3;
  v7[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v7];

  objc_sync_exit(v4);
  LOBYTE(v4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

- (id)allRequests
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(WPAdvertisingRequestsQueue *)v2 queue];
  unint64_t v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  return v4;
}

- (WPAdvertisingRequestsQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)WPAdvertisingRequestsQueue;
  v2 = [(WPAdvertisingRequestsQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    queue = v2->_queue;
    v2->_queue = (NSMutableArray *)v3;
  }
  return v2;
}

uint64_t __34__WPAdvertisingRequestsQueue_add___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeRequestsOfClientType:(unsigned __int8)a3
{
  unint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = [(WPAdvertisingRequestsQueue *)v4 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WPAdvertisingRequestsQueue_removeRequestsOfClientType___block_invoke;
  v6[3] = &unk_26469B080;
  unsigned __int8 v7 = a3;
  v6[4] = v4;
  [v5 enumerateObjectsUsingBlock:v6];

  objc_sync_exit(v4);
}

void __57__WPAdvertisingRequestsQueue_removeRequestsOfClientType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 clientType] == *(unsigned __int8 *)(a1 + 40))
  {
    id v5 = [*(id *)(a1 + 32) queue];
    [v5 removeObjectAtIndex:a3];
  }
}

uint64_t __57__WPAdvertisingRequestsQueue_isAdvertisingForClientType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 clientType];
  if (result == *(unsigned __int8 *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)removeAll
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(WPAdvertisingRequestsQueue *)obj queue];
  [v2 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)clientTypes
{
  return self->_clientTypes;
}

- (void)setClientTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTypes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end