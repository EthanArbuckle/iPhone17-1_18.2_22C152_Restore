@interface SUVariableCellConfigurationCache
- (NSArray)caches;
- (SUVariableCellConfigurationCache)initWithTableHeight:(double)a3;
- (id)cacheForClass:(Class)a3;
- (id)cellContext;
- (void)dealloc;
- (void)reset;
- (void)resetLayoutCaches;
- (void)setCellContext:(id)a3;
@end

@implementation SUVariableCellConfigurationCache

- (SUVariableCellConfigurationCache)initWithTableHeight:(double)a3
{
  result = [(SUVariableCellConfigurationCache *)self init];
  if (result) {
    result->_tableHeight = a3;
  }
  return result;
}

- (void)dealloc
{
  self->_caches = 0;
  self->_cellContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUVariableCellConfigurationCache;
  [(SUVariableCellConfigurationCache *)&v3 dealloc];
}

- (id)cacheForClass:(Class)a3
{
  caches = self->_caches;
  if (caches)
  {
    if (a3) {
      goto LABEL_3;
    }
    return 0;
  }
  caches = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->_caches = caches;
  if (!a3) {
    return 0;
  }
LABEL_3:
  v6 = (SUCellConfigurationCache *)[(NSMutableDictionary *)caches objectForKey:a3];
  if (!v6)
  {
    v6 = [[SUCellConfigurationCache alloc] initWithClass:a3 tableHeight:self->_tableHeight];
    [(NSMutableDictionary *)self->_caches setObject:v6 forKey:a3];
  }
  return v6;
}

- (NSArray)caches
{
  return (NSArray *)[(NSMutableDictionary *)self->_caches allValues];
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  caches = self->_caches;
  uint64_t v4 = [(NSMutableDictionary *)caches countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(caches);
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_caches, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i)), "reset");
      }
      uint64_t v5 = [(NSMutableDictionary *)caches countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)resetLayoutCaches
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  caches = self->_caches;
  uint64_t v4 = [(NSMutableDictionary *)caches countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(caches);
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_caches, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i)), "resetLayoutCaches");
      }
      uint64_t v5 = [(NSMutableDictionary *)caches countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  objc_msgSend(-[SUVariableCellConfigurationCache cellContext](self, "cellContext"), "resetLayoutCaches");
}

- (id)cellContext
{
  return self->_cellContext;
}

- (void)setCellContext:(id)a3
{
}

@end