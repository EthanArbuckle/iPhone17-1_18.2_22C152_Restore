@interface TUIDynamicValue
+ (TUIDynamicValue)valueWithValue:(id)a3;
- (BOOL)tui_hasProperty:(id)a3;
- (NSString)debugName;
- (NSString)transactionCategory;
- (TUIDynamicValue)initWithValue:(id)a3;
- (id)instanceForObserver:(id)a3;
- (id)instantiateAsBinding:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9;
- (id)instantiateAsEnumerator:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9;
- (id)newInstanceWithObserver:(id)a3;
- (id)newObserverWithController:(id)a3 block:(id)a4;
- (id)tui_valueForProperty:(id)a3;
- (id)value;
- (void)_enqueueUpdate:(id)a3;
- (void)setDebugName:(id)a3;
- (void)setTransactionCategory:(id)a3;
@end

@implementation TUIDynamicValue

- (TUIDynamicValue)initWithValue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIDynamicValue;
  v6 = [(TUIDynamicValue *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:5];
    instanceByObserver = v7->_instanceByObserver;
    v7->_instanceByObserver = (NSMapTable *)v8;

    objc_storeStrong(&v7->_value, a3);
  }

  return v7;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4 = a3;
  id v5 = [[_TUIDynamicValueInstance alloc] initWithDynamicValue:self value:self->_value observer:v4];

  return v5;
}

- (id)instanceForObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = [(NSMapTable *)self->_instanceByObserver objectForKey:v4];
  if (!v5)
  {
    id v5 = [(TUIDynamicValue *)self newInstanceWithObserver:v4];
    [(NSMapTable *)self->_instanceByObserver setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_accessLock);

  return v5;
}

- (id)instantiateAsEnumerator:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  v17 = [_TUIDynamicValueItem alloc];
  v18 = [v15 transactionCoordinator];
  v19 = [v15 dynamicController];
  v20 = [(_TUIDynamicValueItem *)v17 initWithEnumerator:a3.var0 binding:TUINameNil value:self context:v15 transactionCoordinator:v18 dynamicController:v19 nodes:a7 snapshot:v16 flags:a5 builderClass:a6];

  return v20;
}

- (id)instantiateAsBinding:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  v17 = [_TUIDynamicValueItem alloc];
  v18 = [v15 transactionCoordinator];
  v19 = [v15 dynamicController];
  v20 = [(_TUIDynamicValueItem *)v17 initWithEnumerator:TUIEnumeratorNil binding:*(unsigned int *)&a3 value:self context:v15 transactionCoordinator:v18 dynamicController:v19 nodes:a7 snapshot:v16 flags:a5 builderClass:a6];

  return v20;
}

+ (TUIDynamicValue)valueWithValue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithValue:v4];

  return (TUIDynamicValue *)v5;
}

- (void)_enqueueUpdate:(id)a3
{
  id v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v6 = [v4 value];
  id value = self->_value;
  self->_id value = v6;

  uint64_t v8 = [(NSMapTable *)self->_instanceByObserver objectEnumerator];
  v9 = [v8 allObjects];

  os_unfair_lock_unlock(p_accessLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) enqueueUpdate:v4, (void)v15];
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)tui_hasProperty:(id)a3
{
  return [a3 length] != 0;
}

- (id)tui_valueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    id v5 = [[_TUIDynamicValueProperty alloc] initWithValue:self property:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)value
{
  return self->_value;
}

- (NSString)transactionCategory
{
  return self->_transactionCategory;
}

- (void)setTransactionCategory:(id)a3
{
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_transactionCategory, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_lastTransactionToken);

  objc_storeStrong((id *)&self->_instanceByObserver, 0);
}

- (id)newObserverWithController:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [_TUIDynamicValueJSObserver alloc];
  v9 = [v7 coordinator];

  id v10 = [(_TUIDynamicValueJSObserver *)v8 initWithCoordinator:v9 block:v6 value:self];
  return v10;
}

@end