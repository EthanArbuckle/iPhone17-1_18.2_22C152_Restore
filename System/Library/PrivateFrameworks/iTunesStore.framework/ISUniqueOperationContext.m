@interface ISUniqueOperationContext
- (BOOL)containsOperation:(id)a3;
- (ISUniqueOperationContext)init;
- (id)uniqueOperationForKey:(id)a3;
- (unint64_t)countOfOperations;
- (void)addOperation:(id)a3;
- (void)dealloc;
- (void)removeOperation:(id)a3;
- (void)setUniqueOperation:(id)a3 forKey:(id)a4;
@end

@implementation ISUniqueOperationContext

- (ISUniqueOperationContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)ISUniqueOperationContext;
  v2 = [(ISUniqueOperationContext *)&v4 init];
  if (v2)
  {
    v2->_operations = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2->_uniqueOperations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  self->_operations = 0;
  self->_uniqueOperations = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISUniqueOperationContext;
  [(ISUniqueOperationContext *)&v3 dealloc];
}

- (void)addOperation:(id)a3
{
}

- (BOOL)containsOperation:(id)a3
{
  return [(NSMutableSet *)self->_operations containsObject:a3];
}

- (unint64_t)countOfOperations
{
  return [(NSMutableSet *)self->_operations count];
}

- (void)removeOperation:(id)a3
{
}

- (void)setUniqueOperation:(id)a3 forKey:(id)a4
{
  uniqueOperations = self->_uniqueOperations;
  if (a3) {
    [(NSMutableDictionary *)uniqueOperations setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)uniqueOperations removeObjectForKey:a4];
  }
}

- (id)uniqueOperationForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_uniqueOperations objectForKey:a3];
}

@end