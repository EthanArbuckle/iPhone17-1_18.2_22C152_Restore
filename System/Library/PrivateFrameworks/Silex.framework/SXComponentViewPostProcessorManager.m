@interface SXComponentViewPostProcessorManager
- (NSMutableArray)processors;
- (SXComponentViewPostProcessorManager)init;
- (void)addProcessor:(id)a3;
- (void)processComponent:(id)a3 view:(id)a4;
- (void)removeProcessor:(id)a3;
@end

@implementation SXComponentViewPostProcessorManager

- (SXComponentViewPostProcessorManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXComponentViewPostProcessorManager;
  v2 = [(SXComponentViewPostProcessorManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    processors = v2->_processors;
    v2->_processors = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)processComponent:(id)a3 view:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(SXComponentViewPostProcessorManager *)self processors];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) processComponent:v6 view:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)addProcessor:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    v4 = [(SXComponentViewPostProcessorManager *)self processors];
    char v5 = [v4 containsObject:v7];

    if ((v5 & 1) == 0)
    {
      id v6 = [(SXComponentViewPostProcessorManager *)self processors];
      [v6 addObject:v7];
    }
  }
}

- (void)removeProcessor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentViewPostProcessorManager *)self processors];
    [v5 removeObject:v4];
  }
}

- (NSMutableArray)processors
{
  return self->_processors;
}

- (void).cxx_destruct
{
}

@end