@interface _TVRCExpiringStore
- (BOOL)containsIdentifier:(id)a3;
- (NSMapTable)identifierToBlockMap;
- (NSMutableSet)store;
- (_TVRCExpiringStore)init;
- (void)_removeIdentifierAndPerformCompletion:(id)a3;
- (void)addIdentifier:(id)a3 withExpiration:(double)a4 completion:(id)a5;
- (void)dealloc;
- (void)removeIdentifier:(id)a3;
- (void)setIdentifierToBlockMap:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation _TVRCExpiringStore

- (_TVRCExpiringStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)_TVRCExpiringStore;
  v2 = [(_TVRCExpiringStore *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    store = v2->_store;
    v2->_store = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0x10000 capacity:50];
    identifierToBlockMap = v2->_identifierToBlockMap;
    v2->_identifierToBlockMap = (NSMapTable *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)_TVRCExpiringStore;
  [(_TVRCExpiringStore *)&v3 dealloc];
}

- (BOOL)containsIdentifier:(id)a3
{
  return [(NSMutableSet *)self->_store containsObject:a3];
}

- (void)addIdentifier:(id)a3 withExpiration:(double)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  if (([(NSMutableSet *)self->_store containsObject:v11] & 1) == 0)
  {
    [(NSMutableSet *)self->_store addObject:v11];
    [(_TVRCExpiringStore *)self performSelector:sel__removeIdentifierAndPerformCompletion_ withObject:v11 afterDelay:a4];
    if (v8)
    {
      identifierToBlockMap = self->_identifierToBlockMap;
      v10 = (void *)MEMORY[0x22A6592D0](v8);
      [(NSMapTable *)identifierToBlockMap setObject:v10 forKey:v11];
    }
  }
}

- (void)removeIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263F8C6D0];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel__removeIdentifierAndPerformCompletion_ object:v5];
  [(NSMutableSet *)self->_store removeObject:v5];
  [(NSMapTable *)self->_identifierToBlockMap removeObjectForKey:v5];
}

- (void)_removeIdentifierAndPerformCompletion:(id)a3
{
  id v6 = a3;
  [(NSMutableSet *)self->_store removeObject:v6];
  uint64_t v4 = [(NSMapTable *)self->_identifierToBlockMap objectForKey:v6];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  [(NSMapTable *)self->_identifierToBlockMap removeObjectForKey:v6];
}

- (NSMutableSet)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSMapTable)identifierToBlockMap
{
  return self->_identifierToBlockMap;
}

- (void)setIdentifierToBlockMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToBlockMap, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end