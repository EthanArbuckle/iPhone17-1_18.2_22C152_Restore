@interface PDPassDynamicStateManager
- (PDPassDynamicStateManager)init;
- (PDPassDynamicStateManager)initWithDatabaseManager:(id)a3;
- (PDPassDynamicStateManagerObserver)observer;
- (id)_passDynamicStateFromState:(id)a3;
- (id)passDynamicStateForUniqueIdentifier:(id)a3;
- (id)passDynamicStatesFromStates:(id)a3;
- (void)_process;
- (void)setDidUpdateDynamicStateForPassUniqueID:(id)a3;
- (void)setDidUpdateDynamicStatesForPassUniqueIDs:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation PDPassDynamicStateManager

- (id)passDynamicStatesFromStates:(id)a3
{
  id v4 = a3;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100010870;
  v11 = &unk_10074D2C0;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = self;
  id v5 = v12;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (id)_passDynamicStateFromState:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)PKPassDynamicState) _init];
    id v5 = [v3 liveRender];
    [v4 setLiveRender:v5];

    id v6 = [v3 balanceModel];
    [v4 setBalanceModel:v6];

    v7 = [v3 relevancyModel];

    [v4 setRelevancyModel:v7];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (PDPassDynamicStateManager)init
{
  return 0;
}

- (PDPassDynamicStateManager)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPassDynamicStateManager;
  id v6 = [(PDPassDynamicStateManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
  }

  return v7;
}

- (void)setDidUpdateDynamicStateForPassUniqueID:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[PDPassDynamicStateManager setDidUpdateDynamicStatesForPassUniqueIDs:](self, "setDidUpdateDynamicStatesForPassUniqueIDs:", v5, v6);
}

- (void)setDidUpdateDynamicStatesForPassUniqueIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    uniqueIDs = self->_uniqueIDs;
    if (uniqueIDs)
    {
      [(NSMutableSet *)uniqueIDs addObjectsFromArray:v5];
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v8 = self->_uniqueIDs;
      self->_uniqueIDs = v7;

      [(NSMutableSet *)self->_uniqueIDs addObjectsFromArray:v5];
      os_unfair_lock_unlock(&self->_lock);
      objc_super v9 = PDHeavyQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100395D3C;
      block[3] = &unk_10072E1E8;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)_process
{
  p_lock = &self->_lock;
  location = (id *)&self->_observer;
  for (i = &self->_lock; ; p_lock = i)
  {
    os_unfair_lock_lock(p_lock);
    id v4 = [(NSMutableSet *)self->_uniqueIDs allObjects];
    id v5 = [v4 count];
    uniqueIDs = self->_uniqueIDs;
    if (v5)
    {
      [(NSMutableSet *)uniqueIDs removeAllObjects];
      if ([(NSMutableSet *)self->_uniqueIDs count]) {
        __break(1u);
      }
    }
    else
    {
      self->_uniqueIDs = 0;
    }
    os_unfair_lock_unlock(p_lock);
    if (![v4 count]) {
      break;
    }
    v8 = (void *)PDOSTransactionCreate("PDPassDynamicStateManager.stateConstruction");
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
          v16 = -[PDPassDynamicStateManager passDynamicStateForUniqueIdentifier:](self, "passDynamicStateForUniqueIdentifier:", v15, location);
          [v9 setObject:v16 forKeyedSubscript:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    id WeakRetained = objc_loadWeakRetained(location);
    [WeakRetained dynamicStateManager:self dynamicStatesDidUpdate:v9];
  }
}

- (id)passDynamicStateForUniqueIdentifier:(id)a3
{
  id v4 = sub_100218A4C(&self->_databaseManager->super.isa, (uint64_t)a3);
  id v5 = [(PDPassDynamicStateManager *)self _passDynamicStateFromState:v4];

  return v5;
}

- (PDPassDynamicStateManagerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PDPassDynamicStateManagerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_uniqueIDs, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end