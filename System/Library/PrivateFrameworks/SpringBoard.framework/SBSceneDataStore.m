@interface SBSceneDataStore
- (BOOL)_isInvalidated;
- (NSDictionary)_data;
- (NSString)identifier;
- (id)_initWithIdentifier:(id)a3 data:(id)a4 changeHandler:(id)a5;
- (id)objectForKey:(id)a3;
- (id)safeObjectForKey:(id)a3 ofType:(Class)a4;
- (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4;
- (void)_invalidate;
- (void)_invokeChangeHandler;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setArchivedObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SBSceneDataStore

- (id)safeObjectForKey:(id)a3 ofType:(Class)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  v7 = [(NSMutableDictionary *)self->_data bs_safeObjectForKey:v6 ofType:a4];

  return v7;
}

- (id)_initWithIdentifier:(id)a3 data:(id)a4 changeHandler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSceneDataStore.m", 46, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SBSceneDataStore.m", 45, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBSceneDataStore.m", 47, @"Invalid parameter not satisfying: %@", @"changeHandler" object file lineNumber description];

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)SBSceneDataStore;
  v13 = [(SBSceneDataStore *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_data, a4);
    uint64_t v15 = MEMORY[0x1D948C7A0](v12);
    id handler = v14->_handler;
    v14->_id handler = (id)v15;

    v14->_invalidated = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    archivedObjectCache = v14->_archivedObjectCache;
    v14->_archivedObjectCache = v17;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_archivedObjectCache, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = [(NSMutableDictionary *)self->_data objectForKey:v4];

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  v7 = [(NSMutableDictionary *)self->_data objectForKey:v6];
  v8 = v7;
  if (!v7 || ([v7 isEqual:v9] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_data setObject:v9 forKey:v6];
    [(SBSceneDataStore *)self _invokeChangeHandler];
  }
}

- (void)_invokeChangeHandler
{
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSceneDataStore.m" lineNumber:161 description:@"Cannot modify a scene data store that has been invalidated."];
  }
  id handler = self->_handler;
  if (handler)
  {
    v5 = (void (*)(void))*((void *)handler + 2);
    v5();
  }
}

- (NSDictionary)_data
{
  return &self->_data->super;
}

- (void)setArchivedObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BSDispatchQueueAssertMain();
  id v9 = [(NSMutableDictionary *)self->_archivedObjectCache objectForKey:v8];
  id v10 = v9;
  if (!v9 || ([v9 isEqual:v7] & 1) == 0)
  {
    if (v7)
    {
      id v14 = 0;
      id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
      id v12 = v14;
      if (!v11)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"SBSceneDataStore.m", 100, @"%@ (key: %@)", v12, v8 object file lineNumber description];
      }
      [(NSMutableDictionary *)self->_archivedObjectCache setObject:v7 forKey:v8];
    }
    else
    {
      id v11 = 0;
    }
    [(SBSceneDataStore *)self setObject:v11 forKey:v8];
  }
}

- (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [(NSMutableDictionary *)self->_archivedObjectCache objectForKey:v7];
  if (!v8)
  {
    id v9 = [(NSMutableDictionary *)self->_data objectForKey:v7];
    if (v9)
    {
      id v13 = 0;
      id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a3 fromData:v9 error:&v13];
      id v10 = v13;
      if (!v8)
      {
        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"SBSceneDataStore.m", 121, @"%@ (key: %@)", v10, v7 object file lineNumber description];
      }
      [(NSMutableDictionary *)self->_archivedObjectCache setObject:v8 forKey:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (void)removeObjectForKey:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  id v4 = [(NSMutableDictionary *)self->_data objectForKey:v5];

  if (v4)
  {
    [(NSMutableDictionary *)self->_data removeObjectForKey:v5];
    [(SBSceneDataStore *)self _invokeChangeHandler];
  }
}

- (void)removeAllObjects
{
  BSDispatchQueueAssertMain();
  if ([(NSMutableDictionary *)self->_data count])
  {
    [(NSMutableDictionary *)self->_data removeAllObjects];
    [(SBSceneDataStore *)self _invokeChangeHandler];
  }
}

- (void)_invalidate
{
  self->_invalidated = 1;
  id handler = self->_handler;
  self->_id handler = 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

@end