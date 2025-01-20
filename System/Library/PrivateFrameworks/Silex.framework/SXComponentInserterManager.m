@interface SXComponentInserterManager
- (NSArray)inserters;
- (NSMutableArray)mutableInserters;
- (SXComponentInserterManager)init;
- (void)addInserter:(id)a3;
- (void)removeInserter:(id)a3;
@end

@implementation SXComponentInserterManager

- (SXComponentInserterManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXComponentInserterManager;
  v2 = [(SXComponentInserterManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    mutableInserters = v2->_mutableInserters;
    v2->_mutableInserters = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSArray)inserters
{
  v2 = [(SXComponentInserterManager *)self mutableInserters];
  uint64_t v3 = (void *)[v2 copy];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = v4;

  return v5;
}

- (void)addInserter:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    v4 = [(SXComponentInserterManager *)self mutableInserters];
    int v5 = [v4 containsObject:v8];

    if (v5)
    {
      objc_super v6 = [(SXComponentInserterManager *)self mutableInserters];
      [v6 removeObject:v8];
    }
    v7 = [(SXComponentInserterManager *)self mutableInserters];
    [v7 addObject:v8];
  }
}

- (void)removeInserter:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentInserterManager *)self mutableInserters];
    [v5 removeObject:v4];
  }
}

- (NSMutableArray)mutableInserters
{
  return self->_mutableInserters;
}

- (void).cxx_destruct
{
}

@end