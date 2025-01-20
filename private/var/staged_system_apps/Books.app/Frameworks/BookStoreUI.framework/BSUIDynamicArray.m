@interface BSUIDynamicArray
- (BSUIDynamicArray)initWithArray:(id)a3 options:(id)a4;
- (JSValue)onUpdate;
- (NSArray)internalArray;
- (NSMutableSet)strongObservers;
- (NSMutableSet)weakObservers;
- (OS_dispatch_queue)queue;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)length;
- (void)addObserver:(id)a3;
- (void)addWeakObserver:(id)a3;
- (void)notifyObserversWithGeneration:(id)a3;
- (void)performBatchUpdatesWithGeneration:(id)a3 block:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setOnUpdate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStrongObservers:(id)a3;
- (void)setWeakObservers:(id)a3;
- (void)updateArray:(id)a3;
@end

@implementation BSUIDynamicArray

- (BSUIDynamicArray)initWithArray:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BSUIDynamicArrayProvider alloc] initWithArray:v7 options:v6 dynamicArray:self];
  v9 = [(BSUIDynamicArrayProvider *)v8 currentGeneration];
  id v10 = [v7 count];

  v22.receiver = self;
  v22.super_class = (Class)BSUIDynamicArray;
  v11 = [(BSUIDynamicArray *)&v22 initWithDataProvider:v8 generation:v9 count:v10];

  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("BSUIDynamicArray.queue", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v11->_observerAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = +[NSMutableSet set];
    strongObservers = v11->_strongObservers;
    v11->_strongObservers = (NSMutableSet *)v15;

    uint64_t v17 = +[NSMutableSet set];
    weakObservers = v11->_weakObservers;
    v11->_weakObservers = (NSMutableSet *)v17;

    if ([(BSUIDynamicArrayProvider *)v8 loadsContent]) {
      [(BSUIDynamicArray *)v11 setTransactionCategory:TUITransactionCategoryContentLoad];
    }
    objc_opt_class();
    v19 = [v6 objectForKeyedSubscript:@"debugName"];
    v20 = BUDynamicCast();
    [(BSUIDynamicArray *)v11 setDebugName:v20];
  }
  return v11;
}

- (void)updateArray:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(BSUIDynamicArray *)self dataProvider];
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 updateArray:v4 batchUpdatesBlock:0];
}

- (void)performBatchUpdatesWithGeneration:(id)a3 block:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIDynamicArray;
  id v6 = a3;
  [(BSUIDynamicArray *)&v7 performBatchUpdatesWithGeneration:v6 block:a4];
  -[BSUIDynamicArray notifyObserversWithGeneration:](self, "notifyObserversWithGeneration:", v6, v7.receiver, v7.super_class);
}

- (void)notifyObserversWithGeneration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(BSUIDynamicArray *)self dataProvider];
  id v6 = BUDynamicCast();

  objc_super v7 = [v6 arrayForGeneration:v4];

  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1B418;
  v10[3] = &unk_38EA28;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)objectAtIndex:(int64_t)a3
{
  objc_opt_class();
  v5 = [(BSUIDynamicArray *)self dataProvider];
  id v6 = BUDynamicCast();

  objc_super v7 = [v6 currentGeneration];
  v8 = [v6 objectAtIndex:a3 generation:v7];

  return v8;
}

- (NSArray)internalArray
{
  objc_opt_class();
  v3 = [(BSUIDynamicArray *)self dataProvider];
  id v4 = BUDynamicCast();

  v5 = [v4 currentGeneration];
  id v6 = [v4 arrayForGeneration:v5];

  return (NSArray *)v6;
}

- (int64_t)length
{
  objc_opt_class();
  v3 = [(BSUIDynamicArray *)self dataProvider];
  id v4 = BUDynamicCast();

  v5 = [v4 currentGeneration];
  id v6 = [v4 countForGeneration:v5];

  return (int64_t)v6;
}

- (void)addObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  id v6 = [(BSUIDynamicArray *)self strongObservers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  id v6 = [(BSUIDynamicArray *)self strongObservers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)addWeakObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  id v6 = [(BSUIDynamicArray *)self weakObservers];
  objc_super v7 = +[JSManagedValue managedValueWithValue:v5];

  [v6 addObject:v7];

  os_unfair_lock_unlock(p_observerAccessLock);
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