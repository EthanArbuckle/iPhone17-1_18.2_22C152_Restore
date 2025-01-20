@interface BSUIDynamicValue
- (BSUIDynamicValue)initWithValue:(id)a3;
- (BSUIDynamicValue)initWithValue:(id)a3 options:(id)a4;
- (JSValue)onUpdate;
- (NSMutableSet)strongObservers;
- (NSMutableSet)weakObservers;
- (OS_dispatch_queue)queue;
- (id)getValue;
- (void)addObserver:(id)a3;
- (void)addWeakObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeWeakObserver:(id)a3;
- (void)setOnUpdate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStrongObservers:(id)a3;
- (void)setWeakObservers:(id)a3;
- (void)updateValue:(id)a3;
@end

@implementation BSUIDynamicValue

- (BSUIDynamicValue)initWithValue:(id)a3 options:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BSUIDynamicValue;
  v7 = [(BSUIDynamicValue *)&v19 initWithValue:a3];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("BSUIDynamicValue.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v7->_observerAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = +[NSMutableSet set];
    strongObservers = v7->_strongObservers;
    v7->_strongObservers = (NSMutableSet *)v11;

    uint64_t v13 = +[NSMutableSet set];
    weakObservers = v7->_weakObservers;
    v7->_weakObservers = (NSMutableSet *)v13;

    v15 = [v6 objectForKeyedSubscript:@"loadsContent"];

    if (v15) {
      [(BSUIDynamicValue *)v7 setTransactionCategory:TUITransactionCategoryContentLoad];
    }
    objc_opt_class();
    v16 = [v6 objectForKeyedSubscript:@"debugName"];
    v17 = BUDynamicCast();
    [(BSUIDynamicValue *)v7 setDebugName:v17];
  }
  return v7;
}

- (BSUIDynamicValue)initWithValue:(id)a3
{
  return [(BSUIDynamicValue *)self initWithValue:a3 options:0];
}

- (void)updateValue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8DC8;
  v7[3] = &unk_38E1F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)getValue
{
  v2 = [(BSUIDynamicValue *)self instanceForObserver:self];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = sub_92AC;
  v10 = sub_92BC;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_92C4;
  v5[3] = &unk_38E220;
  v5[4] = &v6;
  [v2 valueWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  uint64_t v6 = [(BSUIDynamicValue *)self strongObservers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  uint64_t v6 = [(BSUIDynamicValue *)self strongObservers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)addWeakObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  uint64_t v6 = [(BSUIDynamicValue *)self weakObservers];
  v7 = +[JSManagedValue managedValueWithValue:v5];

  [v6 addObject:v7];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeWeakObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_observerAccessLock);
  id v5 = [(BSUIDynamicValue *)self weakObservers];
  id v6 = [v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 value:v16];
        v14 = v13;
        if (!v13 || [v13 isEqual:v4])
        {
          v15 = [(BSUIDynamicValue *)self weakObservers];
          [v15 removeObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_observerAccessLock);
}

- (JSValue)onUpdate
{
  return self->_onUpdate;
}

- (void)setOnUpdate:(id)a3
{
}

- (NSMutableSet)strongObservers
{
  return self->_strongObservers;
}

- (void)setStrongObservers:(id)a3
{
}

- (NSMutableSet)weakObservers
{
  return self->_weakObservers;
}

- (void)setWeakObservers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_strongObservers, 0);

  objc_storeStrong((id *)&self->_onUpdate, 0);
}

@end