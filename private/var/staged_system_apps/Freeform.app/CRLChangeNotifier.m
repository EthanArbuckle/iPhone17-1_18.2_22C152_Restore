@interface CRLChangeNotifier
- (CRLChangeNotifier)init;
- (id)p_findCountedObserverForObserver:(id)a3 inArray:(id)a4;
- (void)addObserver:(id)a3 forChangeSource:(id)a4;
- (void)addObserver:(id)a3 forChangeSourceOfClass:(Class)a4;
- (void)p_addObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5;
- (void)p_processChanges:(id)a3 preprocessing:(BOOL)a4;
- (void)p_removeDeallocatedObserversFromArray:(id)a3;
- (void)p_removeObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5;
- (void)p_removeZeroCountObserversInMap:(id)a3 fromCountedObserversByChangeSourceMap:(id)a4;
- (void)p_trimChangeSourceToCountedObserversMap:(id)a3;
- (void)preprocessChanges:(id)a3;
- (void)processChanges:(id)a3;
- (void)removeObserver:(id)a3 forChangeSource:(id)a4;
- (void)removeObserver:(id)a3 forChangeSourceOfClass:(Class)a4;
@end

@implementation CRLChangeNotifier

- (CRLChangeNotifier)init
{
  v10.receiver = self;
  v10.super_class = (Class)CRLChangeNotifier;
  v2 = [(CRLChangeNotifier *)&v10 init];
  if (v2)
  {
    v3 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:517 valueOptions:0 capacity:0];
    changeSourceOfObjectObservers = v2->_changeSourceOfObjectObservers;
    v2->_changeSourceOfObjectObservers = v3;

    v5 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:517 valueOptions:0 capacity:0];
    changeSourceOfClassObservers = v2->_changeSourceOfClassObservers;
    v2->_changeSourceOfClassObservers = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.freeform.CRLChangeNotifier.notifyingLock", 0);
    currentlyNotifyingLock = v2->_currentlyNotifyingLock;
    v2->_currentlyNotifyingLock = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)p_findCountedObserverForObserver:(id)a3 inArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100210858;
  v11[3] = &unk_1014E2B10;
  id v7 = v5;
  id v12 = v7;
  id v8 = [v6 indexOfObjectPassingTest:v11];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = [v6 objectAtIndexedSubscript:v8];
  }

  return v9;
}

- (void)p_addObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = 8;
  if (v5) {
    uint64_t v10 = 16;
  }
  id v11 = *(id *)((char *)&v9->super.isa + v10);
  id v12 = [v11 objectForKey:v8];
  if (!v12)
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    [v11 setObject:v12 forKey:v8];
  }
  v13 = [(CRLChangeNotifier *)v9 p_findCountedObserverForObserver:v15 inArray:v12];
  v14 = v13;
  if (v13)
  {
    [(CRLCountedObserver *)v13 incrementCount];
  }
  else
  {
    v14 = [[CRLCountedObserver alloc] initWithObserver:v15];
    [v12 addObject:v14];
  }

  objc_sync_exit(v9);
}

- (void)p_removeObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = 8;
  if (v5) {
    uint64_t v11 = 16;
  }
  id v12 = *(id *)((char *)&v10->super.isa + v11);
  v13 = [v12 objectForKey:v9];
  if (v13)
  {
    v14 = [(CRLChangeNotifier *)v10 p_findCountedObserverForObserver:v8 inArray:v13];
    if (v14)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 0;
      currentlyNotifyingLock = v10->_currentlyNotifyingLock;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100210C30;
      block[3] = &unk_1014CB090;
      block[4] = v10;
      block[5] = &v27;
      dispatch_sync(currentlyNotifyingLock, block);
      id v16 = v14;
      objc_sync_enter(v16);
      if (![v16 decrementCount])
      {
        if (*((unsigned char *)v28 + 24))
        {
          v17 = v10->_currentlyNotifyingLock;
          v18 = _NSConcreteStackBlock;
          uint64_t v19 = 3221225472;
          v20 = sub_100210C4C;
          v21 = &unk_1014E2B38;
          BOOL v25 = v5;
          v22 = v10;
          id v23 = v9;
          id v24 = v16;
          dispatch_sync(v17, &v18);
        }
        else
        {
          [v13 removeObject:v16];
        }
      }
      if (!objc_msgSend(v13, "count", v18, v19, v20, v21, v22)) {
        [v12 removeObjectForKey:v9];
      }
      objc_sync_exit(v16);

      _Block_object_dispose(&v27, 8);
    }
  }
  objc_sync_exit(v10);
}

- (void)addObserver:(id)a3 forChangeSource:(id)a4
{
}

- (void)removeObserver:(id)a3 forChangeSource:(id)a4
{
}

- (void)addObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
}

- (void)removeObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
}

- (void)p_processChanges:(id)a3 preprocessing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v56 = v4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v53 = objc_alloc_init((Class)NSMutableOrderedSet);
  currentlyNotifyingLocid k = self->_currentlyNotifyingLock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002115D0;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_sync(currentlyNotifyingLock, block);
  v48 = self;
  v54 = self;
  objc_sync_enter(v54);
  v47 = v6;
  id v9 = [v6 changesArray];
  id v10 = [v9 copy];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v10;
  id v49 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v80;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v80 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v12 = [v11 changeSource];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v58 = (void *)v12;
        v13 = -[NSMapTable objectForKey:](v54->_changeSourceOfObjectObservers, "objectForKey:");
        id v14 = [v13 countByEnumeratingWithState:&v75 objects:v87 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v76;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v76 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
              v18 = [v17 observer];
              char v19 = objc_opt_respondsToSelector();

              if (v19)
              {
                v20 = [[TSKChangeNotificationInfo alloc] initWithCountedObserver:v17 changeEntry:v11];
                [v7 addObject:v20];
              }
            }
            id v14 = [v13 countByEnumeratingWithState:&v75 objects:v87 count:16];
          }
          while (v14);
        }

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        v55 = v54->_changeSourceOfClassObservers;
        id v59 = [(NSMapTable *)v55 countByEnumeratingWithState:&v71 objects:v86 count:16];
        if (v59)
        {
          uint64_t v57 = *(void *)v72;
          do
          {
            for (id k = 0; k != v59; id k = (char *)k + 1)
            {
              if (*(void *)v72 != v57) {
                objc_enumerationMutation(v55);
              }
              uint64_t v21 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
              if (objc_opt_isKindOfClass())
              {
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                v22 = [(NSMapTable *)v54->_changeSourceOfClassObservers objectForKey:v21];
                id v23 = [v22 countByEnumeratingWithState:&v67 objects:v85 count:16];
                if (v23)
                {
                  uint64_t v24 = *(void *)v68;
                  do
                  {
                    for (m = 0; m != v23; m = (char *)m + 1)
                    {
                      if (*(void *)v68 != v24) {
                        objc_enumerationMutation(v22);
                      }
                      v26 = *(void **)(*((void *)&v67 + 1) + 8 * (void)m);
                      uint64_t v27 = [v26 observer];
                      char v28 = objc_opt_respondsToSelector();

                      if (v28)
                      {
                        uint64_t v29 = [[TSKChangeNotificationInfo alloc] initWithCountedObserver:v26 changeEntry:v11];
                        [v7 addObject:v29];
                      }
                    }
                    id v23 = [v22 countByEnumeratingWithState:&v67 objects:v85 count:16];
                  }
                  while (v23);
                }
              }
            }
            id v59 = [(NSMapTable *)v55 countByEnumeratingWithState:&v71 objects:v86 count:16];
          }
          while (v59);
        }
      }
      id v49 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v49);
  }

  objc_sync_exit(v54);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v61 = v7;
  id v30 = [v61 countByEnumeratingWithState:&v63 objects:v84 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v64;
    do
    {
      for (n = 0; n != v30; n = (char *)n + 1)
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(v61);
        }
        v33 = *(void **)(*((void *)&v63 + 1) + 8 * (void)n);
        id v34 = [v33 countedObserver];
        objc_sync_enter(v34);
        v35 = [v34 observer];
        if (v56)
        {
          v36 = [v33 entry];
          v37 = [v36 changes];
          v38 = [v33 entry];
          v39 = [v38 changeSource];
          [v35 preprocessChanges:v37 forChangeSource:v39];
        }
        else
        {
          v40 = [v33 entry];
          v41 = [v40 changes];
          v42 = [v33 entry];
          v43 = [v42 changeSource];
          [v35 processChanges:v41 forChangeSource:v43];

          if (objc_opt_respondsToSelector()) {
            [v53 addObject:v35];
          }
        }

        objc_sync_exit(v34);
      }
      id v30 = [v61 countByEnumeratingWithState:&v63 objects:v84 count:16];
    }
    while (v30);
  }

  v44 = [v53 array];
  [v44 makeObjectsPerformSelector:"didProcessAllChanges"];

  v45 = v54;
  objc_sync_enter(v45);
  v46 = v48->_currentlyNotifyingLock;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_100211C34;
  v62[3] = &unk_1014CBBB0;
  v62[4] = v45;
  dispatch_sync(v46, v62);
  objc_sync_exit(v45);
}

- (void)p_removeZeroCountObserversInMap:(id)a3 fromCountedObserversByChangeSourceMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v10);
        objc_sync_enter(v11);
        if (!objc_msgSend(v11, "currentCount", (void)v14))
        {
          uint64_t v12 = [v7 objectForKey:v11];
          v13 = [v6 objectForKey:v12];
          [v13 removeObject:v11];
        }
        objc_sync_exit(v11);

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)p_removeDeallocatedObserversFromArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithBlock:&stru_1014E2CB8];
  [v3 filterUsingPredicate:v4];
}

- (void)p_trimChangeSourceToCountedObserversMap:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v6 objectForKey:v11];
        [(CRLChangeNotifier *)self p_removeDeallocatedObserversFromArray:v12];
        if (![v12 count]) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [v6 removeObjectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)j) v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)preprocessChanges:(id)a3
{
}

- (void)processChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classObserversToCheckForRemovalAfterNotifications, 0);
  objc_storeStrong((id *)&self->_objectObserversToCheckForRemovalAfterNotifications, 0);
  objc_storeStrong((id *)&self->_currentlyNotifyingLock, 0);
  objc_storeStrong((id *)&self->_changeSourceOfClassObservers, 0);

  objc_storeStrong((id *)&self->_changeSourceOfObjectObservers, 0);
}

@end