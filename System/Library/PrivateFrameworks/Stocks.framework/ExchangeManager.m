@interface ExchangeManager
+ (id)sharedManager;
- (BOOL)containsExchange:(id)a3;
- (ExchangeManager)init;
- (id)exchangeList;
- (id)exchangeWithName:(id)a3;
- (id)exchangeWithName:(id)a3 createIfNotFound:(BOOL)a4;
- (void)_addExchange:(id)a3;
- (void)_loadExchangesFromDefaults;
- (void)addExchange:(id)a3;
- (void)reloadExchangesFromDefaults;
- (void)removeExchange:(id)a3;
- (void)saveChanges;
@end

@implementation ExchangeManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __32__ExchangeManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (ExchangeManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ExchangeManager;
  v2 = [(ExchangeManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    exchangesByName = v2->_exchangesByName;
    v2->_exchangesByName = (NSMutableDictionary *)v3;

    [(ExchangeManager *)v2 _loadExchangesFromDefaults];
  }
  return v2;
}

- (id)exchangeList
{
  return (id)[(NSMutableDictionary *)self->_exchangesByName allValues];
}

- (id)exchangeWithName:(id)a3
{
  return [(ExchangeManager *)self exchangeWithName:a3 createIfNotFound:0];
}

- (id)exchangeWithName:(id)a3 createIfNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = +[Exchange formattedExchangeNameForName:a3];
  v7 = [(NSMutableDictionary *)self->_exchangesByName objectForKeyedSubscript:v6];
  if (!v7)
  {
    if (v6) {
      BOOL v8 = !v4;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      v7 = 0;
    }
    else
    {
      v9 = StocksLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ExchangeManager exchangeWithName:createIfNotFound:]((uint64_t)v6, v9, v11, v12, v13, v14, v15, v16);
      }

      v7 = [[Exchange alloc] initWithName:v6];
      [(ExchangeManager *)self addExchange:v7];
    }
  }

  return v7;
}

- (BOOL)containsExchange:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = [a3 name];
  v5 = [(ExchangeManager *)self exchangeWithName:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)addExchange:(id)a3
{
  id v4 = a3;
  v5 = StocksLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ExchangeManager addExchange:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  [(ExchangeManager *)self _addExchange:v4];
  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"ExchangeWasAddedNotification" object:v4];
}

- (void)_addExchange:(id)a3
{
  if (a3)
  {
    exchangesByName = self->_exchangesByName;
    id v4 = a3;
    id v5 = [v4 name];
    [(NSMutableDictionary *)exchangesByName setObject:v4 forKeyedSubscript:v5];
  }
}

- (void)removeExchange:(id)a3
{
  id v4 = a3;
  id v5 = StocksLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ExchangeManager removeExchange:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (v4)
  {
    exchangesByName = self->_exchangesByName;
    uint64_t v13 = [v4 name];
    uint64_t v14 = [(NSMutableDictionary *)exchangesByName objectForKeyedSubscript:v13];

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 postNotificationName:@"ExchangeWillBeRemovedNotification" object:v4];

      uint64_t v16 = self->_exchangesByName;
      v17 = [v4 name];
      [(NSMutableDictionary *)v16 removeObjectForKey:v17];
    }
  }
}

- (void)_loadExchangesFromDefaults
{
}

- (void)reloadExchangesFromDefaults
{
}

- (void)saveChanges
{
}

void __30__ExchangeManager_saveChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 archiveDictionary];
  [v3 addObject:v4];
}

- (void).cxx_destruct
{
}

- (void)exchangeWithName:(uint64_t)a3 createIfNotFound:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)addExchange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeExchange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end