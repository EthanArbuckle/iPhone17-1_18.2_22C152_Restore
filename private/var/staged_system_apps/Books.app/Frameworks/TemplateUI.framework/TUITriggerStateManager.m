@interface TUITriggerStateManager
- (NSMutableDictionary)lastUpdateEventForTrigger;
- (NSMutableDictionary)observers;
- (NSMutableDictionary)triggerStates;
- (NSMutableSet)embeddedCollectionDelegates;
- (TUITriggerStateManager)init;
- (unint64_t)stateForTriggerWithName:(id)a3;
- (void)_updateTriggerStatesWithNewStates:(id)a3 updateEvent:(unint64_t)a4;
- (void)addObserver:(id)a3 forTrigger:(id)a4;
- (void)registerEmbeddedCollectionDelegate:(id)a3;
- (void)removeObserver:(id)a3 forTrigger:(id)a4;
- (void)setEmbeddedCollectionDelegates:(id)a3;
- (void)setLastUpdateEventForTrigger:(id)a3;
- (void)setObservers:(id)a3;
- (void)setTriggerStates:(id)a3;
- (void)unregisterEmbeddedCollectionDelegate:(id)a3;
- (void)updateTriggerStatesWithNewStates:(id)a3 updateEvent:(unint64_t)a4;
@end

@implementation TUITriggerStateManager

- (TUITriggerStateManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)TUITriggerStateManager;
  v2 = [(TUITriggerStateManager *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    triggerStates = v2->_triggerStates;
    v2->_triggerStates = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastUpdateEventForTrigger = v2->_lastUpdateEventForTrigger;
    v2->_lastUpdateEventForTrigger = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    observers = v2->_observers;
    v2->_observers = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    embeddedCollectionDelegates = v2->_embeddedCollectionDelegates;
    v2->_embeddedCollectionDelegates = v9;
  }
  return v2;
}

- (void)addObserver:(id)a3 forTrigger:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(TUITriggerStateManager *)self observers];
  v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v8 = +[NSHashTable weakObjectsHashTable];
  }
  [v8 addObject:v10];
  v9 = [(TUITriggerStateManager *)self observers];
  [v9 setObject:v8 forKey:v6];
}

- (void)removeObserver:(id)a3 forTrigger:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(TUITriggerStateManager *)self observers];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    [v8 removeObject:v10];
    v9 = [(TUITriggerStateManager *)self observers];
    [v9 setObject:v8 forKey:v6];
  }
}

- (void)updateTriggerStatesWithNewStates:(id)a3 updateEvent:(unint64_t)a4
{
  -[TUITriggerStateManager _updateTriggerStatesWithNewStates:updateEvent:](self, "_updateTriggerStatesWithNewStates:updateEvent:", a3);
  embeddedCollectionDelegates = self->_embeddedCollectionDelegates;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_135DEC;
  v7[3] = &unk_256128;
  v7[4] = a4;
  [(NSMutableSet *)embeddedCollectionDelegates enumerateObjectsUsingBlock:v7];
}

- (unint64_t)stateForTriggerWithName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_triggerStates objectForKey:a3];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

- (void)registerEmbeddedCollectionDelegate:(id)a3
{
}

- (void)unregisterEmbeddedCollectionDelegate:(id)a3
{
}

- (void)_updateTriggerStatesWithNewStates:(id)a3 updateEvent:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 namesForTriggersInUpdate];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v31)
  {
    id v29 = v6;
    uint64_t v30 = *(void *)v37;
    v28 = v7;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v7);
        }
        uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        unint64_t v10 = [v6 observationModeForTriggerWithName:v9, v28, v29];
        if (a4 < 2)
        {
          if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
            continue;
          }
        }
        else if (a4 != 2 && (a4 != 3 || v10 >= 2))
        {
          continue;
        }
        v11 = [(NSMutableDictionary *)self->_triggerStates objectForKey:v9];
        unsigned int v12 = [v11 intValue];

        id v13 = [v6 stateForTriggerWithName:v9];
        v14 = [(NSMutableDictionary *)self->_lastUpdateEventForTrigger objectForKey:v9];
        unsigned int v15 = [v14 intValue];

        if (v13 != (id)(int)v12 || v15 != a4)
        {
          triggerStates = self->_triggerStates;
          v18 = +[NSNumber numberWithUnsignedInteger:v13];
          [(NSMutableDictionary *)triggerStates setObject:v18 forKey:v9];

          lastUpdateEventForTrigger = self->_lastUpdateEventForTrigger;
          v20 = +[NSNumber numberWithUnsignedInteger:a4];
          [(NSMutableDictionary *)lastUpdateEventForTrigger setObject:v20 forKey:v9];

          v21 = [(TUITriggerStateManager *)self observers];
          v22 = [v21 objectForKey:v9];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v23 = [v22 allObjects];
          id v24 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v33;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v33 != v26) {
                  objc_enumerationMutation(v23);
                }
                [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) handleTrigger:v9 didChangeState:v13 updateEvent:a4];
              }
              id v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v25);
          }

          v7 = v28;
          id v6 = v29;
        }
      }
      id v31 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v31);
  }
}

- (NSMutableDictionary)triggerStates
{
  return self->_triggerStates;
}

- (void)setTriggerStates:(id)a3
{
}

- (NSMutableDictionary)lastUpdateEventForTrigger
{
  return self->_lastUpdateEventForTrigger;
}

- (void)setLastUpdateEventForTrigger:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableSet)embeddedCollectionDelegates
{
  return self->_embeddedCollectionDelegates;
}

- (void)setEmbeddedCollectionDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedCollectionDelegates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastUpdateEventForTrigger, 0);

  objc_storeStrong((id *)&self->_triggerStates, 0);
}

@end