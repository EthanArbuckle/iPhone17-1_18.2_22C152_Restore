@interface ICBatchFetchHelper
- (BOOL)_canObtainPermanentIDForObject:(id)a3 context:(id)a4 ckIdentifierAccountIdentifierPair:(id)a5;
- (BOOL)isMissingCKIdentifier:(id)a3 accountIdentifier:(id)a4;
- (ICBatchFetchHelper)initWithQueue:(id)a3 managedObjectContext:(id)a4 batchSize:(unint64_t)a5 cacheCountLimit:(unint64_t)a6;
- (NSCache)managedObjectIDCache;
- (NSCache)missingCKIdentifierAccountPairCache;
- (NSManagedObjectContext)managedObjectContext;
- (NSMutableArray)dispatchBlocks;
- (NSMutableSet)ckIdentifierAccountPairs;
- (OS_dispatch_queue)queue;
- (id)cachedManagedObjectForCKIdentifier:(id)a3 accountIdentifier:(id)a4;
- (int64_t)batchSize;
- (void)_dispatchBlockApplyingBackPressureIfNeeded:(id)a3;
- (void)_flush;
- (void)addCKIdentifiers:(id)a3 accountIdentifier:(id)a4 dispatchBlock:(id)a5;
- (void)addCKIdentifiers:(id)a3 accountIdentifier:(id)a4 onCurrentQueue:(BOOL)a5 dispatchBlock:(id)a6;
- (void)addDispatchBlock:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)flushOnCurrentQueue:(BOOL)a3;
- (void)removeCachedManagedObjectForCKIdentifier:(id)a3 accountIdentifier:(id)a4;
- (void)setBatchSize:(int64_t)a3;
- (void)setCachedManagedObject:(id)a3 forCKIdentifier:(id)a4 accountIdentifier:(id)a5;
- (void)setCkIdentifierAccountPairs:(id)a3;
- (void)setDispatchBlocks:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setManagedObjectIDCache:(id)a3;
- (void)setMissingCKIdentifierAccountPairCache:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ICBatchFetchHelper

- (ICBatchFetchHelper)initWithQueue:(id)a3 managedObjectContext:(id)a4 batchSize:(unint64_t)a5 cacheCountLimit:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ICBatchFetchHelper;
  v13 = [(ICBatchFetchHelper *)&v24 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeWeak((id *)&v14->_managedObjectContext, v12);
    v14->_batchSize = a5;
    v15 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:a5];
    ckIdentifierAccountPairs = v14->_ckIdentifierAccountPairs;
    v14->_ckIdentifierAccountPairs = v15;

    v17 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a5];
    dispatchBlocks = v14->_dispatchBlocks;
    v14->_dispatchBlocks = v17;

    v19 = (NSCache *)objc_alloc_init((Class)NSCache);
    missingCKIdentifierAccountPairCache = v14->_missingCKIdentifierAccountPairCache;
    v14->_missingCKIdentifierAccountPairCache = v19;

    [(NSCache *)v14->_missingCKIdentifierAccountPairCache setCountLimit:a6];
    v21 = (NSCache *)objc_alloc_init((Class)NSCache);
    managedObjectIDCache = v14->_managedObjectIDCache;
    v14->_managedObjectIDCache = v21;

    [(NSCache *)v14->_managedObjectIDCache setCountLimit:a6];
    atomic_store(a5, (unsigned int *)&remainingDispatchQueueCapacity);
  }

  return v14;
}

- (BOOL)_canObtainPermanentIDForObject:(id)a3 context:(id)a4 ckIdentifierAccountIdentifierPair:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_1000823B4;
  v31[4] = sub_1000823C4;
  id v32 = 0;
  v10 = [v7 objectID];

  if (v10)
  {
    id v11 = [v7 objectID];
    unsigned int v12 = [v11 isTemporaryID];

    if (v12)
    {
      if (v8)
      {
        v23 = _NSConcreteStackBlock;
        uint64_t v24 = 3221225472;
        v25 = sub_1000823CC;
        v26 = &unk_1008B0870;
        v29 = &v33;
        id v27 = v8;
        id v28 = v7;
        v30 = v31;
        [v27 performBlockAndWait:&v23];
        if (!*((unsigned char *)v34 + 24))
        {
          v13 = +[REMLog cloudkit];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            sub_100755ECC();
          }
        }
      }
      else
      {
        v14 = +[REMLog cloudkit];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_100755E60((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
    else
    {
      *((unsigned char *)v34 + 24) = 1;
    }
  }
  char v21 = *((unsigned char *)v34 + 24);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (void)_flush
{
  v3 = [(ICBatchFetchHelper *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableSet);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v7 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
    id v8 = [v7 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = *(void *)v64;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        unsigned int v12 = [(ICBatchFetchHelper *)self missingCKIdentifierAccountPairCache];
        v13 = [v12 objectForKey:v11];

        if (v13)
        {
          [v6 addObject:v11];
          v14 = +[REMLog cloudkit];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v11;
            uint64_t v15 = v14;
            uint64_t v16 = "ICBatchFetchHelper does not need to fetch %{public}@ as it is in missingCKIdentifierCache";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          uint64_t v17 = [(ICBatchFetchHelper *)self managedObjectIDCache];
          uint64_t v18 = [v17 objectForKey:v11];

          if (!v18) {
            continue;
          }
          [v6 addObject:v11];
          v14 = +[REMLog cloudkit];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v11;
            uint64_t v15 = v14;
            uint64_t v16 = "ICBatchFetchHelper does not need to fetch %{public}@ as it is already in managedObjectIDCache";
            goto LABEL_13;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (!v8)
      {
LABEL_17:

        uint64_t v19 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
        [v19 minusSet:v6];

        break;
      }
    }
  }
  uint64_t v20 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
  BOOL v21 = [v20 count] == 0;

  if (!v21)
  {
    id v22 = objc_alloc_init((Class)NSMutableSet);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v23 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
    id v24 = [v23 countByEnumeratingWithState:&v59 objects:v74 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v60;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v60 != v25) {
            objc_enumerationMutation(v23);
          }
          id v27 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) ckIdentifier];
          [v22 addObject:v27];
        }
        id v24 = [v23 countByEnumeratingWithState:&v59 objects:v74 count:16];
      }
      while (v24);
    }

    id v28 = +[NSPredicate predicateWithFormat:@"ckIdentifier IN %@", v22];
    v29 = [(ICBatchFetchHelper *)self managedObjectContext];

    if (v29)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v70 = 0x3032000000;
      v71 = sub_1000823B4;
      v72 = sub_1000823C4;
      id v73 = 0;
      v30 = [(ICBatchFetchHelper *)self managedObjectContext];
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100082B18;
      v55[3] = &unk_1008ADFD0;
      id v56 = v28;
      v57 = self;
      p_long long buf = &buf;
      [v30 performBlockAndWait:v55];

      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        v31 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
        [v31 minusSet:*(void *)(*((void *)&buf + 1) + 40)];
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v32 = +[REMLog cloudkit];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_100755F4C(v32);
      }
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v33 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
    id v34 = [v33 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v52;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(v33);
          }
          uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * (void)k);
          v38 = [(ICBatchFetchHelper *)self missingCKIdentifierAccountPairCache];
          [v38 setObject:v37 forKey:v37];
        }
        id v34 = [v33 countByEnumeratingWithState:&v51 objects:v68 count:16];
      }
      while (v34);
    }
  }
  v39 = [(ICBatchFetchHelper *)self dispatchBlocks];
  id v40 = [v39 copy];

  v41 = [(ICBatchFetchHelper *)self ckIdentifierAccountPairs];
  [v41 removeAllObjects];

  v42 = [(ICBatchFetchHelper *)self dispatchBlocks];
  [v42 removeAllObjects];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v43 = v40;
  id v44 = [v43 countByEnumeratingWithState:&v47 objects:v67 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v48;
    do
    {
      for (m = 0; m != v44; m = (char *)m + 1)
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(v43);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v47 + 1) + 8 * (void)m) + 16))();
      }
      id v44 = [v43 countByEnumeratingWithState:&v47 objects:v67 count:16];
    }
    while (v44);
  }

  atomic_fetch_add(remainingDispatchQueueCapacity, [v43 count]);
}

- (void)_dispatchBlockApplyingBackPressureIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBatchFetchHelper *)self queue];
  dispatch_assert_queue_not_V2(v5);

  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((int)(atomic_fetch_add(remainingDispatchQueueCapacity, 0xFFFFFFFF) - 1) <= 0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v7 = [(ICBatchFetchHelper *)self queue];
    dispatch_sync(v7, v4);

    double v8 = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      unsigned int v12 = self;
      __int16 v13 = 2048;
      double v14 = v8 - Current;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ perform dispatch block sync took %f s", buf, 0x16u);
    }
  }
  else
  {
    v10 = [(ICBatchFetchHelper *)self queue];
    dispatch_async(v10, v4);
  }
}

- (void)addCKIdentifiers:(id)a3 accountIdentifier:(id)a4 dispatchBlock:(id)a5
{
}

- (void)addCKIdentifiers:(id)a3 accountIdentifier:(id)a4 onCurrentQueue:(BOOL)a5 dispatchBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_100083284;
  uint64_t v18 = &unk_1008AEC28;
  id v19 = a3;
  id v20 = a4;
  BOOL v21 = self;
  id v22 = a6;
  id v10 = v22;
  id v11 = v20;
  id v12 = v19;
  __int16 v13 = objc_retainBlock(&v15);
  if (v7)
  {
    double v14 = [(ICBatchFetchHelper *)self queue];
    dispatch_assert_queue_V2(v14);

    dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
    ((void (*)(void ***))v13[2])(v13);
  }
  else
  {
    -[ICBatchFetchHelper _dispatchBlockApplyingBackPressureIfNeeded:](self, "_dispatchBlockApplyingBackPressureIfNeeded:", v13, v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)addDispatchBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000834B8;
  v4[3] = &unk_1008AE160;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ICBatchFetchHelper *)v5 _dispatchBlockApplyingBackPressureIfNeeded:v4];
}

- (void)flush
{
}

- (void)flushOnCurrentQueue:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  double Current = CFAbsoluteTimeGetCurrent();
  id v6 = [(ICBatchFetchHelper *)self queue];
  BOOL v7 = v6;
  if (v3)
  {
    dispatch_assert_queue_V2(v6);

    [(ICBatchFetchHelper *)self _flush];
  }
  else
  {
    dispatch_assert_queue_not_V2(v6);

    double v8 = [(ICBatchFetchHelper *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000836F8;
    block[3] = &unk_1008ADA80;
    block[4] = self;
    dispatch_sync(v8, block);
  }
  double v9 = CFAbsoluteTimeGetCurrent();
  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    __int16 v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    __int16 v16 = 2048;
    double v17 = v9 - Current;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ flush (onCurrentQueue = %d) took %f s", buf, 0x1Cu);
  }
}

- (BOOL)isMissingCKIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(ICBatchFetchHelper *)self queue];
  dispatch_assert_queue_V2(v8);

  double v9 = [[_REMCKIdentifierAccountIdentifierPair alloc] initWithCkIdentifier:v7 accountIdentifier:v6];
  id v10 = [(ICBatchFetchHelper *)self missingCKIdentifierAccountPairCache];
  id v11 = [v10 objectForKey:v9];
  LOBYTE(self) = v11 != 0;

  return (char)self;
}

- (id)cachedManagedObjectForCKIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(ICBatchFetchHelper *)self queue];
  dispatch_assert_queue_V2(v8);

  double v9 = [[_REMCKIdentifierAccountIdentifierPair alloc] initWithCkIdentifier:v6 accountIdentifier:v7];
  id v10 = [(ICBatchFetchHelper *)self managedObjectIDCache];
  id v11 = [v10 objectForKey:v9];

  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = sub_1000823B4;
  uint64_t v37 = sub_1000823C4;
  id v38 = 0;
  if (!v11)
  {
    __int16 v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "ICBatchFetchHelper: %{public}@ is not in cachedManagedObjectForCKIdentifier", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managedObjectContext);

  if (!WeakRetained)
  {
    __int16 v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100755F90((uint64_t)v9, v16, v17, v18, v19, v20, v21, v22);
    }
LABEL_9:

    goto LABEL_15;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3032000000;
  id v43 = sub_1000823B4;
  id v44 = sub_1000823C4;
  id v45 = 0;
  id v13 = objc_loadWeakRetained((id *)&self->_managedObjectContext);
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_100083BA4;
  id v28 = &unk_1008B0870;
  v31 = &v33;
  v29 = self;
  id v30 = v11;
  p_long long buf = &buf;
  [v13 performBlockAndWait:&v25];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    __int16 v14 = +[REMLog cloudkit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100755FFC();
    }
  }
  else
  {
    if (v34[5]) {
      goto LABEL_14;
    }
    __int16 v14 = +[REMLog cloudkit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v39 = 138543362;
      id v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "ICBatchFetchHelper: existingObjectWithID %{public}@ is nil", v39, 0xCu);
    }
  }

  BOOL v15 = [(ICBatchFetchHelper *)self managedObjectIDCache];
  [v15 removeObjectForKey:v9];

LABEL_14:
  _Block_object_dispose(&buf, 8);

LABEL_15:
  id v23 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v23;
}

- (void)setCachedManagedObject:(id)a3 forCKIdentifier:(id)a4 accountIdentifier:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICBatchFetchHelper *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [v16 managedObjectContext];
  if (v16 && v11)
  {
    id v12 = [[_REMCKIdentifierAccountIdentifierPair alloc] initWithCkIdentifier:v8 accountIdentifier:v9];
    id v13 = [(ICBatchFetchHelper *)self missingCKIdentifierAccountPairCache];
    [v13 removeObjectForKey:v12];

    if ([(ICBatchFetchHelper *)self _canObtainPermanentIDForObject:v16 context:v11 ckIdentifierAccountIdentifierPair:v12])
    {
      __int16 v14 = [(ICBatchFetchHelper *)self managedObjectIDCache];
      BOOL v15 = [v16 objectID];
      [v14 setObject:v15 forKey:v12];
    }
  }
}

- (void)removeCachedManagedObjectForCKIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICBatchFetchHelper *)self queue];
  dispatch_assert_queue_V2(v8);

  id v10 = [[_REMCKIdentifierAccountIdentifierPair alloc] initWithCkIdentifier:v7 accountIdentifier:v6];
  id v9 = [(ICBatchFetchHelper *)self managedObjectIDCache];
  [v9 removeObjectForKey:v10];
}

- (void)dealloc
{
  BOOL v3 = [(ICBatchFetchHelper *)self dispatchBlocks];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = +[REMLog cloudkit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10075607C((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)ICBatchFetchHelper;
  [(ICBatchFetchHelper *)&v12 dealloc];
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (NSMutableSet)ckIdentifierAccountPairs
{
  return self->_ckIdentifierAccountPairs;
}

- (void)setCkIdentifierAccountPairs:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managedObjectContext);

  return (NSManagedObjectContext *)WeakRetained;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSMutableArray)dispatchBlocks
{
  return self->_dispatchBlocks;
}

- (void)setDispatchBlocks:(id)a3
{
}

- (NSCache)managedObjectIDCache
{
  return self->_managedObjectIDCache;
}

- (void)setManagedObjectIDCache:(id)a3
{
}

- (NSCache)missingCKIdentifierAccountPairCache
{
  return self->_missingCKIdentifierAccountPairCache;
}

- (void)setMissingCKIdentifierAccountPairCache:(id)a3
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
  objc_storeStrong((id *)&self->_missingCKIdentifierAccountPairCache, 0);
  objc_storeStrong((id *)&self->_managedObjectIDCache, 0);
  objc_storeStrong((id *)&self->_dispatchBlocks, 0);
  objc_destroyWeak((id *)&self->_managedObjectContext);

  objc_storeStrong((id *)&self->_ckIdentifierAccountPairs, 0);
}

@end