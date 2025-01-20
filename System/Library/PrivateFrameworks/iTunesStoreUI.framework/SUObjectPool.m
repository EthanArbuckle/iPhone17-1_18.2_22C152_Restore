@interface SUObjectPool
- (NSArray)vendedObjects;
- (id)addObjectsOfClass:(Class)a3 count:(int64_t)a4 forClass:(Class)a5;
- (id)copyPoppedObjectForClass:(Class)a3;
- (void)addObjects:(id)a3 forClass:(Class)a4;
- (void)dealloc;
@end

@implementation SUObjectPool

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUObjectPool;
  [(SUObjectPool *)&v3 dealloc];
}

- (void)addObjects:(id)a3 forClass:(Class)a4
{
  poolObjects = self->_poolObjects;
  if (!poolObjects)
  {
    poolObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_poolObjects = poolObjects;
  }
  id v8 = (id)[(NSMutableDictionary *)poolObjects objectForKey:a4];
  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableDictionary *)self->_poolObjects setObject:v9 forKey:a4];
    id v8 = v9;
  }
  id v10 = v8;
  [v8 addObjectsFromArray:a3];
}

- (id)addObjectsOfClass:(Class)a3 count:(int64_t)a4 forClass:(Class)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!a3) {
    a3 = a5;
  }
  if (a4 >= 1)
  {
    do
    {
      id v10 = objc_alloc_init(a3);
      [v9 addObject:v10];

      --a4;
    }
    while (a4);
  }
  [(SUObjectPool *)self addObjects:v9 forClass:a5];

  return v9;
}

- (id)copyPoppedObjectForClass:(Class)a3
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_poolObjects, "objectForKey:");
  if ([v5 count])
  {
    id v6 = (id)[v5 lastObject];
    [v5 removeLastObject];
  }
  else
  {
    id v6 = objc_alloc_init(a3);
  }
  vendedObjects = self->_vendedObjects;
  if (!vendedObjects)
  {
    vendedObjects = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_vendedObjects = vendedObjects;
  }
  [(NSMutableArray *)vendedObjects addObject:v6];
  return v6;
}

- (NSArray)vendedObjects
{
  v2 = (void *)[(NSMutableArray *)self->_vendedObjects copy];

  return (NSArray *)v2;
}

@end