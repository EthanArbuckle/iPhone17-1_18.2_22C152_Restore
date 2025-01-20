@interface _TUIDynamicValueInstance
- (BOOL)applyUpdatesForTransactionGroup:(id)a3;
- (BOOL)hasUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3 block:(id)a4;
- (TUIDynamicValue)dynamicValue;
- (TUIDynamicValueObserving)observer;
- (_TUIDynamicValueInstance)initWithDynamicValue:(id)a3 value:(id)a4 observer:(id)a5;
- (id)dequeueUpdate;
- (id)tui_unwrapDynamicWithError:(unint64_t *)a3;
- (void)enqueueUpdate:(id)a3;
- (void)valueWithBlock:(id)a3;
@end

@implementation _TUIDynamicValueInstance

- (_TUIDynamicValueInstance)initWithDynamicValue:(id)a3 value:(id)a4 observer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUIDynamicValueInstance;
  v12 = [(_TUIDynamicValueInstance *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_dynamicValue, a3);
    objc_storeStrong(&v13->_value, a4);
    objc_storeWeak((id *)&v13->_observer, v11);
  }

  return v13;
}

- (void)enqueueUpdate:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  updates = self->_updates;
  if (!updates)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    v8 = self->_updates;
    self->_updates = v7;

    updates = self->_updates;
  }
  [(NSMutableArray *)updates addObject:v5];
  os_unfair_lock_unlock(p_accessLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v9 = [v5 transaction];

  [WeakRetained dynamicChanged:self transaction:v9];
}

- (id)dequeueUpdate
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if ([(NSMutableArray *)self->_updates count])
  {
    v4 = [(NSMutableArray *)self->_updates objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_updates removeObjectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);

  return v4;
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v9 = (char *)[(NSMutableArray *)self->_updates count];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    while (1)
    {
      if (v6)
      {
        v12 = [(NSMutableArray *)self->_updates objectAtIndexedSubscript:v11];
        v13 = [v12 transaction];
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
      objc_super v15 = -[NSMutableArray subarrayWithRange:](self->_updates, "subarrayWithRange:", 0, v11);
      v16 = v7[2](v7, v15);
      v17 = v16;
      if (v15 != v16)
      {
        id v18 = [v16 count];
        updates = self->_updates;
        if (!v18)
        {
          -[NSMutableArray removeObjectsInRange:](updates, "removeObjectsInRange:", 0, v11);
          BOOL v20 = 0;
          goto LABEL_14;
        }
        -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](updates, "replaceObjectsInRange:withObjectsFromArray:", 0, v11, v17);
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
  id v6 = self->_updates;
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
          id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) transaction:(void)v15];
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
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6AE2C;
  v4[3] = &unk_253248;
  v4[4] = self;
  return [(_TUIDynamicValueInstance *)self optimizeUpdatesForTransactionGroup:a3 block:v4];
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  id v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if ([(NSMutableArray *)self->_updates count])
  {
    id v6 = [(NSMutableArray *)self->_updates firstObject];
    id v7 = v6;
    if (v4
      && ([v6 transaction],
          id v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v4 containsTransaction:v8],
          v8,
          !v9))
    {
      BOOL v12 = 0;
    }
    else
    {
      [(NSMutableArray *)self->_updates removeObjectAtIndex:0];
      id v10 = [v7 value];
      id value = self->_value;
      self->_id value = v10;

      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);

  return v12;
}

- (void)valueWithBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, id))a3 + 2))(a3, self->_value);
  }
}

- (id)tui_unwrapDynamicWithError:(unint64_t *)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_6B0B0;
  id v10 = sub_6B0C0;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6B0C8;
  v5[3] = &unk_253270;
  v5[4] = &v6;
  [(_TUIDynamicValueInstance *)self valueWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (TUIDynamicValueObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (TUIDynamicValueObserving *)WeakRetained;
}

- (TUIDynamicValue)dynamicValue
{
  return self->_dynamicValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicValue, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_updates, 0);
}

@end