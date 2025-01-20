@interface ICDispatchAfterHandler
+ (id)appLifeCycleHandler;
- (ICDispatchAfterHandler)init;
- (NSMutableDictionary)identifierBlockMap;
- (id)identifierForStringIdentifier:(id)a3;
- (void)cancelAll;
- (void)cancelBlocksWithStringIdentifier:(id)a3;
- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5;
- (void)setIdentifierBlockMap:(id)a3;
@end

@implementation ICDispatchAfterHandler

- (void)cancelBlocksWithStringIdentifier:(id)a3
{
  id v8 = [(ICDispatchAfterHandler *)self identifierForStringIdentifier:a3];
  uint64_t v4 = objc_opt_class();
  v5 = [(ICDispatchAfterHandler *)self identifierBlockMap];
  v6 = [v5 objectForKeyedSubscript:v8];
  v7 = ICCheckedDynamicCast(v4, (uint64_t)v6);

  [v7 cancelAll];
}

- (id)identifierForStringIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  v6 = v5;

  return v6;
}

- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5
{
  id v14 = a5;
  id v8 = [(ICDispatchAfterHandler *)self identifierForStringIdentifier:a4];
  uint64_t v9 = objc_opt_class();
  v10 = [(ICDispatchAfterHandler *)self identifierBlockMap];
  v11 = [v10 objectForKeyedSubscript:v8];
  ICCheckedDynamicCast(v9, (uint64_t)v11);
  v12 = (ICDispatchAfterBlocks *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = [[ICDispatchAfterBlocks alloc] initWithIdentifier:v8];
    v13 = [(ICDispatchAfterHandler *)self identifierBlockMap];
    [v13 setObject:v12 forKeyedSubscript:v8];
  }
  [(ICDispatchAfterBlocks *)v12 dispatchAfter:v14 withBlock:a3];
}

- (NSMutableDictionary)identifierBlockMap
{
  return self->_identifierBlockMap;
}

uint64_t __45__ICDispatchAfterHandler_appLifeCycleHandler__block_invoke()
{
  appLifeCycleHandler_sDispatchAfterHandler = objc_alloc_init(ICDispatchAfterHandler);
  return MEMORY[0x270F9A758]();
}

- (ICDispatchAfterHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICDispatchAfterHandler;
  v2 = [(ICDispatchAfterHandler *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(ICDispatchAfterHandler *)v2 setIdentifierBlockMap:v3];
  }
  return v2;
}

- (void)setIdentifierBlockMap:(id)a3
{
}

+ (id)appLifeCycleHandler
{
  if (appLifeCycleHandler_predicate != -1) {
    dispatch_once(&appLifeCycleHandler_predicate, &__block_literal_global_6);
  }
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "+[ICDispatchAfterHandler appLifeCycleHandler]", 1, 0, @"The app handler should only be used on the main thread");
  }
  v2 = (void *)appLifeCycleHandler_sDispatchAfterHandler;
  return v2;
}

- (void)cancelAll
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(ICDispatchAfterHandler *)self identifierBlockMap];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = [v2 objectForKeyedSubscript:v7];
        v10 = ICCheckedDynamicCast(v8, (uint64_t)v9);

        [v10 cancelAll];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
}

@end