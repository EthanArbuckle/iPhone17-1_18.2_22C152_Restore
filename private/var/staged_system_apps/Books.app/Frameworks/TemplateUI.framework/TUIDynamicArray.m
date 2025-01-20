@interface TUIDynamicArray
+ (TUIDynamicArray)arrayWithDataProvider:(id)a3 generation:(id)a4 count:(unint64_t)a5;
+ (TUIDynamicArray)dynamicArrayWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (BOOL)tui_hasProperty:(id)a3;
- (NSString)debugName;
- (NSString)transactionCategory;
- (TUIDynamicArray)init;
- (TUIDynamicArray)initWithDataProvider:(id)a3 generation:(id)a4 count:(unint64_t)a5;
- (TUIDynamicArrayDataProviding)dataProvider;
- (TUIDynamicValue)dynamicValueForCount;
- (TUIDynamicValue)dynamicValueForEmpty;
- (id)_newUpdateGroupWithGeneration:(id)a3 transaction:(id)a4;
- (id)_rootDataProvider;
- (id)dynamicValueAtIndex:(int64_t)a3;
- (id)instanceForObserver:(id)a3;
- (id)instantiateAsBinding:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9;
- (id)instantiateAsEnumerator:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9;
- (id)js_newObserverWithController:(id)a3 block:(id)a4;
- (id)newArrayWithDataAugmenter:(id)a3;
- (id)newArrayWithDataMapper:(id)a3;
- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5;
- (id)tui_objectAtIndex:(int64_t)a3;
- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4;
- (id)tui_valueForProperty:(id)a3;
- (unint64_t)_count;
- (unint64_t)_countForGeneration:(id)a3;
- (void)_enqueueUpdate:(id)a3;
- (void)_updateCount:(unint64_t)a3 generation:(id)a4;
- (void)_updateProvider:(id)a3 count:(unint64_t)a4 generation:(id)a5;
- (void)setDebugName:(id)a3;
- (void)setTransactionCategory:(id)a3;
- (void)updatePredicate:(id)a3;
@end

@implementation TUIDynamicArray

+ (TUIDynamicArray)dynamicArrayWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 queryGenerationToken];
  if (v7)
  {
    v8 = [v6 queryGenerationToken];
    v9 = +[NSQueryGenerationToken currentQueryGenerationToken];
    unsigned __int8 v10 = [v8 isEqual:v9];

    if (v10)
    {
      v7 = 0;
    }
    else
    {
      v11 = [[_TUICoreDataProvider alloc] initWithFetchRequest:v5 managedObjectContext:v6];
      v7 = [(_TUICoreDataProvider *)v11 _startObserving];
    }
  }

  return (TUIDynamicArray *)v7;
}

- (void)updatePredicate:(id)a3
{
  id v7 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TUIDynamicArray *)self _rootDataProvider];
  id v6 = TUIDynamicCast(v4, v5);

  if (v6) {
    [v6 _updatePredicate:v7];
  }
}

- (id)js_newObserverWithController:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [_TUIDynamicArrayJSObserver alloc];
  v9 = [v7 coordinator];

  unsigned __int8 v10 = [(_TUIDynamicArrayJSObserver *)v8 initWithCoordinator:v9 block:v6 array:self];

  return v10;
}

- (TUIDynamicArray)init
{
  v7.receiver = self;
  v7.super_class = (Class)TUIDynamicArray;
  v2 = [(TUIDynamicArray *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:5];
    instanceByObserver = v3->_instanceByObserver;
    v3->_instanceByObserver = (NSMapTable *)v4;
  }
  return v3;
}

- (TUIDynamicArray)initWithDataProvider:(id)a3 generation:(id)a4 count:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = [(TUIDynamicArray *)self init];
  v11 = v10;
  if (v10) {
    [(TUIDynamicArray *)v10 _updateProvider:v8 count:a5 generation:v9];
  }

  return v11;
}

- (id)_rootDataProvider
{
  return self->_dataProvider;
}

- (void)_updateProvider:(id)a3 count:(unint64_t)a4 generation:(id)a5
{
  id v8 = (TUIDynamicArrayDataProviding *)a3;
  id v9 = a5;
  dataProvider = self->_dataProvider;
  self->_dataProvider = v8;
  v12 = v8;

  id generation = self->_generation;
  self->_count = a4;
  self->_id generation = v9;
}

- (void)_updateCount:(unint64_t)a3 generation:(id)a4
{
  self->_count = a3;
  objc_storeStrong(&self->_generation, a4);
}

- (id)newArrayWithDataAugmenter:(id)a3
{
  id v4 = a3;
  id v5 = [[_TUIAugmentedDynamicArray alloc] initWithArray:self augmenter:v4];

  return v5;
}

- (id)newArrayWithDataMapper:(id)a3
{
  id v4 = a3;
  id v5 = [[_TUIMappedDynamicArray alloc] initWithArray:self mapper:v4];

  return v5;
}

- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5
{
  id v6 = a5;
  objc_super v7 = [[_TUIDynamicArrayInstance alloc] initWithArray:self generation:self->_generation count:self->_count observer:v6];

  return v7;
}

- (id)instanceForObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = [(NSMapTable *)self->_instanceByObserver objectForKey:v4];
  if (!v5)
  {
    id v5 = [(TUIDynamicArray *)self newInstanceWithGeneration:self->_generation count:self->_count observer:v4];
    [(NSMapTable *)self->_instanceByObserver setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_accessLock);

  return v5;
}

- (id)instantiateAsEnumerator:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  v18 = [_TUIDynamicArrayContainer alloc];
  v19 = [v15 transactionCoordinator];
  v20 = [v15 dynamicController];
  v21 = [(_TUIDynamicArrayContainer *)v18 initWithEnumerator:a3.var0 binding:TUINameNil array:self context:v15 transactionCoordinator:v19 dynamicController:v20 nodes:a7 snapshot:v16 options:v17 flags:a5 builderClass:a6];

  return v21;
}

- (id)instantiateAsBinding:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  v18 = [_TUIDynamicArrayContainer alloc];
  v19 = [v15 transactionCoordinator];
  v20 = [v15 dynamicController];
  v21 = [(_TUIDynamicArrayContainer *)v18 initWithEnumerator:TUIEnumeratorNil binding:*(unsigned int *)&a3 array:self context:v15 transactionCoordinator:v19 dynamicController:v20 nodes:a7 snapshot:v16 options:v17 flags:a5 builderClass:a6];

  return v21;
}

+ (TUIDynamicArray)arrayWithDataProvider:(id)a3 generation:(id)a4 count:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithDataProvider:v9 generation:v8 count:a5];

  return (TUIDynamicArray *)v10;
}

- (void)_enqueueUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transaction];
  id v6 = TUITransactionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [(TUIDynamicArray *)self debugName];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lastTransactionToken);
    *(_DWORD *)buf = 134218754;
    v26 = self;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2112;
    v30 = v5;
    __int16 v31 = 2112;
    id v32 = WeakRetained;
    _os_log_impl(&def_141F14, v6, OS_LOG_TYPE_DEFAULT, "[%p] %{public}@: DynamicArray: enqueueUpdate - tx=%@, lastToken=%@", buf, 0x2Au);
  }
  id v9 = objc_loadWeakRetained((id *)&self->_lastTransactionToken);
  [v5 dependentOn:v9];

  [v5 addCategory:self->_transactionCategory];
  id v10 = [v5 dependencyToken];
  objc_storeWeak((id *)&self->_lastTransactionToken, v10);

  os_unfair_lock_lock(&self->_accessLock);
  v11 = [(NSMapTable *)self->_instanceByObserver objectEnumerator];
  v12 = [v11 allObjects];

  id v13 = [v4 count];
  v14 = [v4 generation];
  [(TUIDynamicArray *)self _updateCount:v13 generation:v14];

  os_unfair_lock_unlock(&self->_accessLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v12;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) enqueueUpdateGroup:v4 v20];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (id)tui_objectAtIndex:(int64_t)a3
{
  v3 = [[_TUIDynamicArrayIndex alloc] initWithArray:self index:a3];

  return v3;
}

- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4
{
  if (a3 || a4 != -1) {
    id v4 = [[_TUISubDynamicArray alloc] initWithArray:self start:a3 end:a4];
  }
  else {
    id v4 = self;
  }

  return v4;
}

- (BOOL)tui_hasProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"count"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"empty"];
  }

  return v4;
}

- (id)tui_valueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"count"])
  {
    id v5 = off_251148;
LABEL_5:
    id v6 = [objc_alloc(*v5) initWithArray:self];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"empty"])
  {
    id v5 = &off_251150;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_newUpdateGroupWithGeneration:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  objc_super v7 = [a4 tx];
  id v8 = [[_TUIDynamicArrayUpdateGroup alloc] initWithGeneration:v6 count:self->_count transaction:v7];

  return v8;
}

- (TUIDynamicValue)dynamicValueForCount
{
  v2 = [[_TUIDynamicArrayCount alloc] initWithArray:self];

  return (TUIDynamicValue *)v2;
}

- (TUIDynamicValue)dynamicValueForEmpty
{
  v2 = [[_TUIDynamicArrayEmpty alloc] initWithArray:self];

  return (TUIDynamicValue *)v2;
}

- (id)dynamicValueAtIndex:(int64_t)a3
{
  id v3 = [[_TUIDynamicArrayIndex alloc] initWithArray:self index:a3];

  return v3;
}

- (unint64_t)_countForGeneration:(id)a3
{
  return (unint64_t)[(TUIDynamicArrayDataProviding *)self->_dataProvider countForGeneration:a3];
}

- (unint64_t)_count
{
  return self->_count;
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

- (TUIDynamicArrayDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_transactionCategory, 0);
  objc_storeStrong((id *)&self->_instanceByObserver, 0);
  objc_destroyWeak((id *)&self->_lastTransactionToken);
  objc_storeStrong(&self->_generation, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end