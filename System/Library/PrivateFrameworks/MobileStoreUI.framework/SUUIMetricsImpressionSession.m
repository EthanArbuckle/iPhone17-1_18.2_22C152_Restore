@interface SUUIMetricsImpressionSession
- (NSArray)impressionIdentifiers;
- (NSArray)impressionableViewElements;
- (NSString)impressionsString;
- (SUUIMetricsImpressionSession)init;
- (id)_allViewElementsInTimerMap;
- (id)_getTimerForViewElement:(id)a3;
- (void)_clearTimerForViewElement:(id)a3;
- (void)_setTimer:(id)a3 forViewElement:(id)a4;
- (void)addItemIdentifier:(int64_t)a3;
- (void)addItemViewElement:(id)a3;
- (void)beginActiveImpressionForViewElement:(id)a3;
- (void)endActiveImpressionForViewElement:(id)a3;
- (void)endAllPendingActiveImpression;
@end

@implementation SUUIMetricsImpressionSession

- (SUUIMetricsImpressionSession)init
{
  v12.receiver = self;
  v12.super_class = (Class)SUUIMetricsImpressionSession;
  v2 = [(SUUIMetricsImpressionSession *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    impressionIdentifiers = v2->_impressionIdentifiers;
    v2->_impressionIdentifiers = v3;

    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    impressionsString = v2->_impressionsString;
    v2->_impressionsString = v5;

    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    impressionableViewElements = v2->_impressionableViewElements;
    v2->_impressionableViewElements = v7;

    uint64_t v9 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:0];
    impressionableViewElementsTimerMap = v2->_impressionableViewElementsTimerMap;
    v2->_impressionableViewElementsTimerMap = (NSMapTable *)v9;
  }
  return v2;
}

- (void)addItemIdentifier:(int64_t)a3
{
  if (a3)
  {
    if ([(NSMutableString *)self->_impressionsString length]) {
      v5 = @",%lld";
    }
    else {
      v5 = @"%lld";
    }
    -[NSMutableString appendFormat:](self->_impressionsString, "appendFormat:", v5, a3);
    id v6 = (id)[objc_alloc(NSNumber) initWithLongLong:a3];
    [(NSMutableArray *)self->_impressionIdentifiers addObject:v6];
  }
}

- (void)addItemViewElement:(id)a3
{
  if (a3) {
    -[NSMutableOrderedSet addObject:](self->_impressionableViewElements, "addObject:");
  }
}

- (NSArray)impressionableViewElements
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_impressionableViewElements array];
}

- (void)beginActiveImpressionForViewElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 appDocument];
  [v5 impressionThreshold];
  if (v6 != 0.0 && [v4 isImpressionable])
  {
    v7 = [(SUUIMetricsImpressionSession *)self _getTimerForViewElement:v4];
    if (v7)
    {
    }
    else
    {
      v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      [v5 impressionThreshold];
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __68__SUUIMetricsImpressionSession_beginActiveImpressionForViewElement___block_invoke;
      handler[3] = &unk_265400958;
      id v13 = v5;
      id v11 = v4;
      id v14 = v11;
      v15 = self;
      dispatch_source_set_event_handler(v8, handler);
      [(SUUIMetricsImpressionSession *)self _setTimer:v8 forViewElement:v11];
      dispatch_resume(v8);
    }
  }
}

uint64_t __68__SUUIMetricsImpressionSession_beginActiveImpressionForViewElement___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v6[0] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v2 recordImpressionsForViewElements:v3];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SUUIMetricsImpressionNotification" object:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 48) _clearTimerForViewElement:*(void *)(a1 + 40)];
}

- (void)endActiveImpressionForViewElement:(id)a3
{
  id v4 = a3;
  source = [(SUUIMetricsImpressionSession *)self _getTimerForViewElement:v4];
  [(SUUIMetricsImpressionSession *)self _clearTimerForViewElement:v4];

  v5 = source;
  if (source)
  {
    dispatch_source_cancel(source);
    v5 = source;
  }
}

- (void)endAllPendingActiveImpression
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(SUUIMetricsImpressionSession *)self _allViewElementsInTimerMap];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SUUIMetricsImpressionSession *)self endActiveImpressionForViewElement:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_allViewElementsInTimerMap
{
  return NSAllMapTableKeys(self->_impressionableViewElementsTimerMap);
}

- (id)_getTimerForViewElement:(id)a3
{
  return NSMapGet(self->_impressionableViewElementsTimerMap, a3);
}

- (void)_setTimer:(id)a3 forViewElement:(id)a4
{
}

- (void)_clearTimerForViewElement:(id)a3
{
}

- (NSArray)impressionIdentifiers
{
  return &self->_impressionIdentifiers->super;
}

- (NSString)impressionsString
{
  return &self->_impressionsString->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionableViewElementsTimerMap, 0);
  objc_storeStrong((id *)&self->_impressionableViewElements, 0);
  objc_storeStrong((id *)&self->_impressionsString, 0);
  objc_storeStrong((id *)&self->_impressionIdentifiers, 0);
}

@end