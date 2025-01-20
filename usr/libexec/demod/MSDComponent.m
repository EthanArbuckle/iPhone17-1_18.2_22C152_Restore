@interface MSDComponent
- (BOOL)forRemoval;
- (BOOL)result;
- (BOOL)rollbackOperations;
- (MSDComponent)initWithName:(id)a3 andOperations:(id)a4;
- (MSDComponentObserver)observer;
- (NSMutableOrderedSet)activeOperations;
- (NSMutableOrderedSet)finishedOperations;
- (NSMutableOrderedSet)removeOperations;
- (NSMutableOrderedSet)stagedOperations;
- (NSString)description;
- (NSString)name;
- (id)_cloneComponent;
- (id)_cloneOperations:(id)a3;
- (id)_handleRetryableOperation:(id)a3;
- (id)activateStagedOperations;
- (id)createRemovableCounterpartComponent;
- (id)errors;
- (id)finishedOperationContexts;
- (id)setupIntraComponentDependency:(BOOL)a3;
- (int64_t)retryCount;
- (os_unfair_lock_s)componentLock;
- (unint64_t)diskSpaceRequired;
- (void)_addStagedOperation:(id)a3 forRollback:(BOOL)a4;
- (void)_addStagedOperations:(id)a3 forRollback:(BOOL)a4;
- (void)_cancelRemainingOperations;
- (void)_estimateDiskSpaceRequirementFromOperations:(id)a3;
- (void)_handleActiveOperationsDepleted;
- (void)_handleCancelledOperation:(id)a3;
- (void)_handleFailedOperation:(id)a3;
- (void)_handleSkippedOperation:(id)a3;
- (void)_handleSuccessfulOperation:(id)a3;
- (void)_rollbackFinishedOperations;
- (void)addInstallDependency:(id)a3;
- (void)addObserver:(id)a3;
- (void)addRemoveOperations:(id)a3;
- (void)discardStagedOperationsAndTriggerCompletion;
- (void)operation:(id)a3 didProduceNewOperation:(id)a4 forRollback:(BOOL)a5;
- (void)operationWillFinish:(id)a3;
- (void)setActiveOperations:(id)a3;
- (void)setComponentLock:(os_unfair_lock_s)a3;
- (void)setDiskSpaceRequired:(unint64_t)a3;
- (void)setFinishedOperations:(id)a3;
- (void)setForRemoval:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setObserver:(id)a3;
- (void)setRemoveOperations:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setRollbackOperations:(BOOL)a3;
- (void)setStagedOperations:(id)a3;
@end

@implementation MSDComponent

- (MSDComponent)initWithName:(id)a3 andOperations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSDComponent;
  v8 = [(MSDComponent *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(MSDComponent *)v8 setName:v6];
    [(MSDComponent *)v9 setRetryCount:3];
    [(MSDComponent *)v9 setForRemoval:0];
    id v10 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(MSDComponent *)v9 setRemoveOperations:v10];

    id v11 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(MSDComponent *)v9 setStagedOperations:v11];

    id v12 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(MSDComponent *)v9 setActiveOperations:v12];

    id v13 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(MSDComponent *)v9 setFinishedOperations:v13];

    [(MSDComponent *)v9 _addStagedOperations:v7 forRollback:0];
    [(MSDComponent *)v9 _estimateDiskSpaceRequirementFromOperations:v7];
    [(MSDComponent *)v9 setObserver:0];
    [(MSDComponent *)v9 setComponentLock:0];
  }

  return v9;
}

- (BOOL)result
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(MSDComponent *)self finishedOperations];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 result] & 1) == 0 && !objc_msgSend(v9, "skipped"))
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  os_unfair_lock_unlock(p_componentLock);
  return v10;
}

- (id)finishedOperationContexts
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(MSDComponent *)self finishedOperations];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) context];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_componentLock);

  return v3;
}

- (id)errors
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(MSDComponent *)self finishedOperations];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 error];

        if (v11)
        {
          long long v12 = [v10 error];
          [v3 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_componentLock);

  return v3;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&OBJC_PROTOCOL___MSDComponentObserver] & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MSDComponent.m" lineNumber:118 description:@"Observer does not conform to protocol"];
  }
  os_unfair_lock_lock(&self->_componentLock);
  [(MSDComponent *)self setObserver:v5];

  os_unfair_lock_unlock(&self->_componentLock);
}

- (void)addRemoveOperations:(id)a3
{
  p_componentLock = &self->_componentLock;
  id v5 = a3;
  os_unfair_lock_lock(p_componentLock);
  id v6 = [(MSDComponent *)self removeOperations];
  [v6 addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_componentLock);
}

- (id)activateStagedOperations
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v4 = [(MSDComponent *)self stagedOperations];
  id v5 = [v4 copy];

  id v6 = [(MSDComponent *)self stagedOperations];
  [v6 removeAllObjects];

  id v7 = [(MSDComponent *)self activeOperations];
  [v7 unionOrderedSet:v5];

  os_unfair_lock_unlock(p_componentLock);

  return v5;
}

- (id)createRemovableCounterpartComponent
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v4 = [(MSDComponent *)self removeOperations];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [MSDComponent alloc];
    id v7 = [(MSDComponent *)self name];
    uint64_t v8 = [(MSDComponent *)self removeOperations];
    v9 = [v8 array];
    BOOL v10 = [(MSDComponent *)v6 initWithName:v7 andOperations:v9];

    [(MSDComponent *)v10 setForRemoval:1];
  }
  else
  {
    BOOL v10 = 0;
  }
  os_unfair_lock_unlock(p_componentLock);

  return v10;
}

- (id)setupIntraComponentDependency:(BOOL)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_t lock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [(MSDComponent *)self stagedOperations];
  id v5 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v52;
    id v34 = v4;
    uint64_t v36 = *(void *)v52;
    do
    {
      uint64_t v8 = 0;
      id v37 = v6;
      do
      {
        if (*(void *)v52 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v8);
        if ([v9 type] == (id)1)
        {
          v41 = v8;
          BOOL v10 = [v9 context];
          uint64_t v11 = [v10 uniqueName];

          v40 = (void *)v11;
          v39 = [v4 objectForKey:v11];
          id v42 = objc_alloc_init((Class)NSMutableArray);
          [v42 addObject:v9];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v12 = [v9 dependents];
          id v13 = [v12 countByEnumeratingWithState:&v47 objects:v60 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v48;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v48 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                if ([v17 type] == (id)2)
                {
                  v18 = [v17 context];
                  v19 = [v9 context];

                  if (v18 == v19)
                  {
                    [v42 addObject:v17];
                    long long v45 = 0u;
                    long long v46 = 0u;
                    long long v43 = 0u;
                    long long v44 = 0u;
                    v20 = [v17 dependents];
                    id v21 = [v20 countByEnumeratingWithState:&v43 objects:v59 count:16];
                    if (v21)
                    {
                      id v22 = v21;
                      uint64_t v23 = *(void *)v44;
                      while (2)
                      {
                        for (j = 0; j != v22; j = (char *)j + 1)
                        {
                          if (*(void *)v44 != v23) {
                            objc_enumerationMutation(v20);
                          }
                          v25 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
                          if ([v25 type] == (id)3)
                          {
                            v26 = [v25 context];
                            v27 = [v17 context];

                            if (v26 == v27)
                            {
                              [v42 addObject:v25];
                              goto LABEL_28;
                            }
                          }
                        }
                        id v22 = [v20 countByEnumeratingWithState:&v43 objects:v59 count:16];
                        if (v22) {
                          continue;
                        }
                        break;
                      }
                    }
LABEL_28:

                    id v4 = v34;
                    goto LABEL_29;
                  }
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v47 objects:v60 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
LABEL_29:

          uint64_t v8 = v41;
          if (v39)
          {
            v28 = sub_100068600();
            BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
            if (a3)
            {
              if (v29)
              {
                v30 = [v39 lastObject];
                *(_DWORD *)buf = 138412546;
                v56 = v9;
                __int16 v57 = 2112;
                v58 = v30;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Setting up intra-component dependency: %@ -> %@", buf, 0x16u);
              }
              v28 = [v39 lastObject];
              [v9 addDependency:v28];
            }
            else if (v29)
            {
              v31 = [v39 lastObject];
              *(_DWORD *)buf = 138412546;
              v56 = v9;
              __int16 v57 = 2112;
              v58 = v31;
              _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Skipping intra-component dependency linking: %@ -> %@", buf, 0x16u);
            }
          }
          [v4 setObject:v42 forKey:v40];

          uint64_t v7 = v36;
          id v6 = v37;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);

  return v4;
}

- (void)addInstallDependency:(id)a3
{
  id v4 = a3;
  v26 = self;
  os_unfair_lock_t lock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v24 = v4;
  id obj = [v4 stagedOperations];
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    uint64_t v25 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      id v27 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v8);
        if ([v9 type] == (id)3)
        {
          BOOL v10 = [v9 identifier];
          if (![v10 isEqualToString:@"MSDProvisioningProfileInstallOperation"])
          {

LABEL_11:
            BOOL v29 = v8;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v12 = [(MSDComponent *)v26 stagedOperations];
            id v13 = [v12 countByEnumeratingWithState:&v30 objects:v46 count:16];
            if (!v13) {
              goto LABEL_27;
            }
            id v14 = v13;
            uint64_t v15 = *(void *)v31;
            while (2)
            {
              uint64_t v16 = 0;
LABEL_14:
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
              if ([v17 type] == (id)3
                && ([v17 runInstallInParallel] & 1) == 0)
              {
                v18 = [v17 identifier];
                if ([v18 isEqualToString:@"MSDProvisioningProfileInstallOperation"])
                {
                  unsigned __int8 v19 = [v17 isLeaf];

                  if ((v19 & 1) == 0) {
                    goto LABEL_25;
                  }
                }
                else
                {
                }
                v20 = sub_100068600();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  id v21 = [v17 component];
                  id v22 = [v9 component];
                  *(_DWORD *)buf = 138413058;
                  v39 = v17;
                  __int16 v40 = 2112;
                  v41 = v21;
                  __int16 v42 = 2112;
                  long long v43 = v9;
                  __int16 v44 = 2112;
                  long long v45 = v22;
                  _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Setting up install dependency: %@(%@) -> %@(%@)", buf, 0x2Au);
                }
                [v17 addDependency:v9];
              }
LABEL_25:
              if (v14 == (id)++v16)
              {
                id v14 = [v12 countByEnumeratingWithState:&v30 objects:v46 count:16];
                if (!v14)
                {
LABEL_27:

                  uint64_t v7 = v25;
                  id v6 = v27;
                  uint64_t v8 = v29;
                  goto LABEL_28;
                }
                continue;
              }
              goto LABEL_14;
            }
          }
          unsigned __int8 v11 = [v9 isLeaf];

          if (v11) {
            goto LABEL_11;
          }
        }
LABEL_28:
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)discardStagedOperationsAndTriggerCompletion
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(MSDComponent *)self stagedOperations];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) cancel];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v9 = [(MSDComponent *)self finishedOperations];
  BOOL v10 = [(MSDComponent *)self stagedOperations];
  [v9 unionOrderedSet:v10];

  unsigned __int8 v11 = [(MSDComponent *)self stagedOperations];
  [v11 removeAllObjects];

  [(MSDComponent *)self _handleActiveOperationsDepleted];
  os_unfair_lock_unlock(p_componentLock);
}

- (void)operationWillFinish:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation will finish: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  os_unfair_lock_lock(&self->_componentLock);
  if (([v4 isCancelled] & 1) == 0)
  {
    if ([v4 type] == (id)5)
    {
      os_unfair_lock_unlock(&self->_componentLock);
      id v6 = 0;
LABEL_7:
      uint64_t v7 = [(MSDComponent *)self observer];
      [v7 componentDidComplete:self];
LABEL_8:

      goto LABEL_9;
    }
    if ([v4 result])
    {
      [(MSDComponent *)self _handleSuccessfulOperation:v4];
    }
    else if ([v4 skipped])
    {
      [(MSDComponent *)self _handleSkippedOperation:v4];
    }
    else
    {
      if ([v4 retryable])
      {
        id v6 = [(MSDComponent *)self _handleRetryableOperation:v4];
        goto LABEL_18;
      }
      [(MSDComponent *)self _handleFailedOperation:v4];
    }
    id v6 = 0;
LABEL_18:
    uint64_t v8 = [(MSDComponent *)self stagedOperations];
    id v9 = [v8 count];

    if (v9)
    {
      os_unfair_lock_unlock(&self->_componentLock);
      if (!v6)
      {
        uint64_t v7 = [(MSDComponent *)self observer];
        [v7 componentDidHaveNewOperationStaged:self];
        goto LABEL_8;
      }
      BOOL v10 = 0;
    }
    else
    {
      unsigned __int8 v11 = [(MSDComponent *)self stagedOperations];
      if ([v11 count])
      {
        BOOL v10 = 0;
      }
      else
      {
        long long v12 = [(MSDComponent *)self activeOperations];
        BOOL v10 = [v12 count] == 0;
      }
      os_unfair_lock_unlock(&self->_componentLock);
      if (!v6)
      {
LABEL_29:
        if (!v10) {
          goto LABEL_9;
        }
        goto LABEL_7;
      }
    }
    long long v13 = [(MSDComponent *)self observer];
    [v13 component:self didProduceClonedComponent:v6];

    if (v9)
    {
      long long v14 = [(MSDComponent *)self observer];
      [v14 componentDidHaveNewOperationStaged:self];

      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
    goto LABEL_29;
  }
  [(MSDComponent *)self _handleCancelledOperation:v4];
  os_unfair_lock_unlock(&self->_componentLock);
  id v6 = 0;
LABEL_9:
}

- (void)operation:(id)a3 didProduceNewOperation:(id)a4 forRollback:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    unsigned __int8 v11 = self;
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: New operation produced: %{public}@ rollback: %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_componentLock);
  [(MSDComponent *)self _addStagedOperation:v7 forRollback:v5];
  os_unfair_lock_unlock(&self->_componentLock);
  id v9 = [(MSDComponent *)self observer];
  [v9 componentDidHaveNewOperationStaged:self];
}

- (void)_addStagedOperations:(id)a3 forRollback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MSDComponent *)self _addStagedOperation:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) forRollback:v4];
        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_addStagedOperation:(id)a3 forRollback:(BOOL)a4
{
  id v7 = a3;
  id v6 = [(MSDComponent *)self stagedOperations];
  [v6 addObject:v7];

  if (!a4)
  {
    [v7 associateWithComponent:self];
    [v7 addObserver:self];
  }
}

- (void)_estimateDiskSpaceRequirementFromOperations:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableSet set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) context];
        long long v12 = [v11 uniqueName];
        uint64_t v13 = [v11 diskSpacedRequired];
        if (v13)
        {
          long long v14 = (void *)v13;
          unsigned __int8 v15 = [v4 containsObject:v12];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = [v11 diskSpacedRequired];
            v8 += (uint64_t)[v16 unsignedLongLongValue];

            [v4 addObject:v12];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  [(MSDComponent *)self setDiskSpaceRequired:v8];
}

- (id)_cloneComponent
{
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  BOOL v4 = [(MSDComponent *)self stagedOperations];
  [v3 unionOrderedSet:v4];

  id v5 = [(MSDComponent *)self activeOperations];
  [v3 unionOrderedSet:v5];

  id v6 = [v3 array];
  id v7 = [(MSDComponent *)self _cloneOperations:v6];

  uint64_t v8 = [MSDComponent alloc];
  uint64_t v9 = [(MSDComponent *)self name];
  int v10 = [(MSDComponent *)v8 initWithName:v9 andOperations:v7];

  [(MSDComponent *)v10 setRetryCount:[(MSDComponent *)self retryCount]];
  long long v11 = [(MSDComponent *)self finishedOperations];
  id v12 = [v11 mutableCopy];
  [(MSDComponent *)v10 setFinishedOperations:v12];

  return v10;
}

- (id)_cloneOperations:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v3 objectAtIndex:v6];
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v10 = [v7 context];
      long long v11 = +[MSDOperationRepository createOperationFromIdentifier:v9 withContext:v10];

      [v5 addObject:v11];
      id v12 = +[NSNumber numberWithInt:v6];
      uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 hash]);
      [v4 setObject:v12 forKey:v13];

      ++v6;
    }
    while ((unint64_t)[v3 count] > v6);
  }
  if ([v5 count])
  {
    uint64_t v14 = 0;
    id v26 = v3;
    do
    {
      unsigned __int8 v15 = [v5 objectAtIndex:v14, v26];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v27 = v14;
      uint64_t v16 = [v3 objectAtIndex:v14];
      __int16 v17 = [v16 dependencies];

      id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v29;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(*((void *)&v28 + 1) + 8 * i) hash]);
            uint64_t v23 = [v4 objectForKey:v22];

            if (v23)
            {
              v24 = [v5 objectAtIndex:(int)[v23 intValue]];
              [v15 addDependency:v24];
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v19);
      }

      uint64_t v14 = v27 + 1;
      id v3 = v26;
    }
    while ((unint64_t)[v5 count] > v27 + 1);
  }

  return v5;
}

- (void)_cancelRemainingOperations
{
  v2 = [(MSDComponent *)self activeOperations];
  id v3 = [v2 mutableCopy];

  uint64_t v13 = v3;
  if ([v3 count])
  {
    do
    {
      id v5 = objc_alloc_init((Class)NSMutableSet);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v13;
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([v11 isAllDependentInComponentCancelled])
            {
              id v12 = sub_100068600();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v19 = v11;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cancelling operation: %{public}@", buf, 0xCu);
              }

              [v11 cancel];
            }
            if ([v11 isCancelled]) {
              [v5 addObject:v11];
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
        }
        while (v8);
      }

      [v6 minusSet:v5];
    }
    while ([v6 count]);
  }
}

- (void)_rollbackFinishedOperations
{
  id v3 = [(MSDComponent *)self finishedOperations];
  id v4 = [v3 copy];

  [(MSDComponent *)self setRollbackOperations:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        long long v11 = sub_100068600();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v17 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Rolling back finished operation: %@", buf, 0xCu);
        }

        [v10 rollback];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_handleActiveOperationsDepleted
{
  if (![(MSDComponent *)self forRemoval])
  {
    id v3 = objc_alloc_init(MSDOperationContext);
    id v4 = [(MSDComponent *)self name];
    [(MSDOperationContext *)v3 setIdentifier:v4];

    id v5 = +[MSDOperationRepository createOperationFromIdentifier:@"MSDComponentCompleteOperation" withContext:v3];
    [(MSDComponent *)self _addStagedOperation:v5 forRollback:0];
  }
}

- (void)_handleSuccessfulOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C92C4();
  }

  id v6 = [(MSDComponent *)self activeOperations];
  [v6 removeObject:v4];

  id v7 = [(MSDComponent *)self finishedOperations];
  [v7 addObject:v4];

  uint64_t v8 = [(MSDComponent *)self activeOperations];
  id v9 = [v8 count];

  if (!v9) {
    [(MSDComponent *)self _handleActiveOperationsDepleted];
  }
}

- (void)_handleFailedOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C932C();
  }

  if (os_variant_has_internal_content())
  {
    id v6 = +[MSDTestPreferences sharedInstance];
    unsigned int v7 = [v6 pauseContentUpdateOnError];

    if (v7)
    {
      do
      {
        uint64_t v8 = sub_100068600();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pausing content update as requested. Will check the value again in 30s.", v16, 2u);
        }

        sleep(0x1Eu);
        id v9 = +[MSDTestPreferences sharedInstance];
        unsigned __int8 v10 = [v9 pauseContentUpdateOnError];
      }
      while ((v10 & 1) != 0);
    }
  }
  long long v11 = [(MSDComponent *)self activeOperations];
  [v11 removeObject:v4];

  long long v12 = [(MSDComponent *)self finishedOperations];
  [v12 addObject:v4];

  [(MSDComponent *)self _cancelRemainingOperations];
  [(MSDComponent *)self _rollbackFinishedOperations];
  long long v13 = [(MSDComponent *)self finishedOperations];
  long long v14 = [(MSDComponent *)self activeOperations];
  [v13 unionOrderedSet:v14];

  long long v15 = [(MSDComponent *)self activeOperations];
  [v15 removeAllObjects];

  [(MSDComponent *)self _handleActiveOperationsDepleted];
}

- (id)_handleRetryableOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C9394();
  }

  [(MSDComponent *)self setRetryCount:(char *)[(MSDComponent *)self retryCount] - 1];
  if ([(MSDComponent *)self retryCount] <= 0)
  {
    unsigned int v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      unsigned __int8 v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Component retry count exhausted.", (uint8_t *)&v9, 0xCu);
    }

    [(MSDComponent *)self _handleFailedOperation:v4];
    id v6 = 0;
  }
  else
  {
    [(MSDComponent *)self _cancelRemainingOperations];
    id v6 = [(MSDComponent *)self _cloneComponent];
  }

  return v6;
}

- (void)_handleSkippedOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C93FC();
  }

  [(MSDComponent *)self _handleSuccessfulOperation:v4];
}

- (void)_handleCancelledOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C9464();
  }

  if ([(MSDComponent *)self rollbackOperations])
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rolling back cancelled operation: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [v4 rollback];
  }
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(MSDComponent *)self name];
  id v6 = +[NSString stringWithFormat:@"<%@: Name: %@>", v4, v5];

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)forRemoval
{
  return self->_forRemoval;
}

- (void)setForRemoval:(BOOL)a3
{
  self->_forRemoval = a3;
}

- (unint64_t)diskSpaceRequired
{
  return self->_diskSpaceRequired;
}

- (void)setDiskSpaceRequired:(unint64_t)a3
{
  self->_diskSpaceRequired = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)rollbackOperations
{
  return self->_rollbackOperations;
}

- (void)setRollbackOperations:(BOOL)a3
{
  self->_rollbackOperations = a3;
}

- (NSMutableOrderedSet)removeOperations
{
  return self->_removeOperations;
}

- (void)setRemoveOperations:(id)a3
{
}

- (NSMutableOrderedSet)stagedOperations
{
  return self->_stagedOperations;
}

- (void)setStagedOperations:(id)a3
{
}

- (NSMutableOrderedSet)activeOperations
{
  return self->_activeOperations;
}

- (void)setActiveOperations:(id)a3
{
}

- (NSMutableOrderedSet)finishedOperations
{
  return self->_finishedOperations;
}

- (void)setFinishedOperations:(id)a3
{
}

- (MSDComponentObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MSDComponentObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (os_unfair_lock_s)componentLock
{
  return self->_componentLock;
}

- (void)setComponentLock:(os_unfair_lock_s)a3
{
  self->_componentLock = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_finishedOperations, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_stagedOperations, 0);
  objc_storeStrong((id *)&self->_removeOperations, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end