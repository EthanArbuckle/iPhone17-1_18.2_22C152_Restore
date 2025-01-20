@interface _TUIDynamicArrayInstance
- (BOOL)applyUpdatesForTransactionGroup:(id)a3;
- (BOOL)applyUpdatesForTransactionGroup:(id)a3 withBlock:(id)a4;
- (BOOL)hasUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3 block:(id)a4;
- (BOOL)tui_hasProperty:(id)a3;
- (TUIDynamicArray)array;
- (TUIDynamicArrayObserving)observer;
- (_TUIDynamicArrayInstance)initWithArray:(id)a3 generation:(id)a4 count:(unint64_t)a5 observer:(id)a6;
- (id)_dequeueUpdateGroup;
- (id)_dequeueUpdateGroupForTransactionGroup:(id)a3;
- (id)generation;
- (id)tui_objectAtIndex:(int64_t)a3;
- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4;
- (id)tui_valueForProperty:(id)a3;
- (unint64_t)count;
- (unint64_t)countForGeneration:(id)a3;
- (void)enqueueUpdateGroup:(id)a3;
- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5;
- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5;
- (void)objectsAtIndexes:(id)a3 block:(id)a4;
- (void)objectsInRange:(_NSRange)a3 block:(id)a4;
- (void)tui_unwwrapEnumeratorWithBlock:(id)a3;
@end

@implementation _TUIDynamicArrayInstance

- (_TUIDynamicArrayInstance)initWithArray:(id)a3 generation:(id)a4 count:(unint64_t)a5 observer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_TUIDynamicArrayInstance;
  v14 = [(_TUIDynamicArrayInstance *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_array, a3);
    objc_storeWeak((id *)&v15->_observer, v13);
    v15->_count = a5;
    objc_storeStrong(&v15->_generation, a4);
    uint64_t v16 = objc_opt_new();
    updateGroups = v15->_updateGroups;
    v15->_updateGroups = (NSMutableArray *)v16;
  }
  return v15;
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  return [(_TUIDynamicArrayInstance *)self applyUpdatesForTransactionGroup:a3 withBlock:0];
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v9 = (char *)[(NSMutableArray *)self->_updateGroups count];
  if (v9)
  {
    v10 = v9;
    id v11 = 0;
    while (1)
    {
      if (v6)
      {
        id v12 = [(NSMutableArray *)self->_updateGroups objectAtIndexedSubscript:v11];
        id v13 = [v12 transaction];
        unsigned int v14 = [v6 containsTransaction:v13];

        if (!v14) {
          break;
        }
      }
      if (v10 == ++v11)
      {
        id v11 = v10;
        break;
      }
    }
    if (v11)
    {
      v15 = -[NSMutableArray subarrayWithRange:](self->_updateGroups, "subarrayWithRange:", 0, v11);
      uint64_t v16 = v7[2](v7, v15);
      v17 = v16;
      if (v15 != v16)
      {
        id v18 = [v16 count];
        updateGroups = self->_updateGroups;
        if (!v18)
        {
          -[NSMutableArray removeObjectsInRange:](updateGroups, "removeObjectsInRange:", 0, v11);
          BOOL v20 = 0;
          goto LABEL_14;
        }
        -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](updateGroups, "replaceObjectsInRange:withObjectsFromArray:", 0, v11, v17);
      }
      BOOL v20 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  BOOL v20 = 0;
LABEL_15:
  os_unfair_lock_unlock(p_accessLock);

  return v20;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  id v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_updateGroups;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v4)
        {
          id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) transaction:v15];
          unsigned __int8 v12 = [v4 containsTransaction:v11];

          if ((v12 & 1) == 0) {
            continue;
          }
        }
        BOOL v13 = 1;
        goto LABEL_13;
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_13:

  os_unfair_lock_unlock(p_accessLock);
  return v13;
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  return [(_TUIDynamicArrayInstance *)self optimizeUpdatesForTransactionGroup:a3 block:&stru_2561F0];
}

- (id)_dequeueUpdateGroup
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if ([(NSMutableArray *)self->_updateGroups count])
  {
    id v4 = [(NSMutableArray *)self->_updateGroups firstObject];
    [(NSMutableArray *)self->_updateGroups removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);

  return v4;
}

- (id)_dequeueUpdateGroupForTransactionGroup:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  if ([(NSMutableArray *)self->_updateGroups count])
  {
    v5 = [(NSMutableArray *)self->_updateGroups firstObject];
    id v6 = v5;
    if (!v4
      || ([v5 transaction],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v4 containsTransaction:v7],
          v7,
          v8))
    {
      [(NSMutableArray *)self->_updateGroups removeObjectAtIndex:0];
      goto LABEL_7;
    }
  }
  id v6 = 0;
LABEL_7:
  os_unfair_lock_unlock(&self->_accessLock);

  return v6;
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3 withBlock:(id)a4
{
  id v6 = (void (**)(id, id, id, id))a4;
  id v7 = [(_TUIDynamicArrayInstance *)self _dequeueUpdateGroupForTransactionGroup:a3];
  unsigned int v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 generation];
    id generation = self->_generation;
    self->_id generation = v9;

    self->_count = (unint64_t)[v8 count];
    if (v6)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = [v8 updates];
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          long long v15 = 0;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            v6[2](v6, [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) kind], [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) oldIndex], [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) newIndex]);
            long long v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
  }

  return v8 != 0;
}

- (void)objectsInRange:(_NSRange)a3 block:(id)a4
{
  if (a4) {
    -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:", a3.location, a3.length, self->_generation, a4);
  }
}

- (void)objectsAtIndexes:(id)a3 block:(id)a4
{
  if (a4) {
    [(_TUIDynamicArrayInstance *)self fetchDataForIndexes:a3 generation:self->_generation block:a4];
  }
}

- (void)enqueueUpdateGroup:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableArray *)self->_updateGroups addObject:v5];
  os_unfair_lock_unlock(p_accessLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v6 = [v5 transaction];

  [WeakRetained dynamicChanged:self transaction:v6];
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  array = self->_array;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(TUIDynamicArray *)array dataProvider];
  [v11 fetchDataForRange:location length:length generation:v10 block:v9];
}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  array = self->_array;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUIDynamicArray *)array dataProvider];
  [v11 fetchDataForIndexes:v10 generation:v9 block:v8];
}

- (unint64_t)countForGeneration:(id)a3
{
  array = self->_array;
  id v4 = a3;
  id v5 = [(TUIDynamicArray *)array dataProvider];
  id v6 = [v5 countForGeneration:v4];

  return (unint64_t)v6;
}

- (id)tui_objectAtIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_139750;
  id v13 = sub_139760;
  id v14 = 0;
  unint64_t v5 = [(_TUIDynamicArrayInstance *)self count];
  int64_t v6 = (v5 & (a3 >> 63)) + a3;
  if (v6 >= 0 && v6 < v5) {
    -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:");
  }
  id v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4
{
  unint64_t v7 = [(_TUIDynamicArrayInstance *)self count];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_139750;
  long long v17 = sub_139760;
  id v18 = 0;
  int64_t v8 = (v7 & (a3 >> 63)) + a3;
  if (v8 < 0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    if (v8 < v7)
    {
      int64_t v10 = (v7 & (a4 >> 63)) + a4;
      if ((v10 & 0x8000000000000000) == 0 && v10 < v7 && v8 <= v10)
      {
        -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:");
        uint64_t v9 = (void *)v14[5];
      }
    }
  }
  id v11 = v9;
  _Block_object_dispose(&v13, 8);

  return v11;
}

- (void)tui_unwwrapEnumeratorWithBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_TUIDynamicArrayInstance *)self count];
  id generation = self->_generation;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1399E8;
  v8[3] = &unk_254ED0;
  id v9 = v4;
  id v7 = v4;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:", 0, v5, generation, v8);
}

- (BOOL)tui_hasProperty:(id)a3
{
  return [a3 isEqualToString:@"count"];
}

- (id)tui_valueForProperty:(id)a3
{
  if ([a3 isEqualToString:@"count"])
  {
    id v4 = +[NSNumber numberWithUnsignedInteger:self->_count];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (TUIDynamicArrayObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (TUIDynamicArrayObserving *)WeakRetained;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)generation
{
  return self->_generation;
}

- (TUIDynamicArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong(&self->_generation, 0);
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_updateGroups, 0);
}

@end