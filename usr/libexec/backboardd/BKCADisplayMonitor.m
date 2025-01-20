@interface BKCADisplayMonitor
- (BKCADisplayMonitor)init;
- (BKCADisplayMonitor)initWithDisplayProvider:(id)a3 log:(id)a4 filterPredicate:(id)a5;
- (BKCADisplayMonitor)initWithLog:(id)a3;
- (BKCADisplayMonitor)initWithLog:(id)a3 filterPredicate:(id)a4;
- (BOOL)_filterDisplay:(id)a3 usingPredicate:(id)a4;
- (BOOL)displayUUIDIsActive:(id)a3;
- (BOOL)hasActiveDisplays;
- (NSArray)activeDisplays;
- (id)_filterDisplays:(id)a3 usingPredicate:(id)a4;
- (id)_immutableDisplays;
- (id)addObserver:(id)a3;
- (id)immutableDisplayForUUID:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reevaluateActiveDisplaysWithReason:(id)a3;
- (void)setDisplayFilterPredicate:(id)a3;
@end

@implementation BKCADisplayMonitor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterPredicateLock_displayFilterPredicate, 0);
  objc_storeStrong((id *)&self->_displayLock_displayIndexToDisplayUUID, 0);
  objc_storeStrong((id *)&self->_displayLock_displayUUIDKeyToImmutableCADisplay, 0);
  objc_storeStrong((id *)&self->_displayLock_observerAssertion, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_displayProvider, 0);
}

- (void)reevaluateActiveDisplaysWithReason:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v67 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "reevaluateActiveDisplaysWithReason: %{public}@", buf, 0xCu);
  }
  v41 = v4;
  os_unfair_lock_lock(&self->_filterPredicateLock);
  id v6 = [self->_filterPredicateLock_displayFilterPredicate copy];
  os_unfair_lock_unlock(&self->_filterPredicateLock);
  v39 = [(BKCADisplayMonitor *)self _immutableDisplays];
  v40 = v6;
  v7 = -[BKCADisplayMonitor _filterDisplays:usingPredicate:](self, "_filterDisplays:usingPredicate:");
  os_unfair_lock_lock(&self->_displayLock);
  v8 = [(NSMutableDictionary *)self->_displayLock_displayUUIDKeyToImmutableCADisplay allValues];
  v9 = +[NSSet setWithArray:v8];

  v10 = [v7 allValues];
  v11 = +[NSSet setWithArray:v10];

  v38 = v7;
  objc_storeStrong((id *)&self->_displayLock_displayUUIDKeyToImmutableCADisplay, v7);
  [(NSMutableDictionary *)self->_displayLock_displayIndexToDisplayUUID removeAllObjects];
  displayLock_displayUUIDKeyToImmutableCADisplay = self->_displayLock_displayUUIDKeyToImmutableCADisplay;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10008E914;
  v61[3] = &unk_1000F8798;
  v61[4] = self;
  [(NSMutableDictionary *)displayLock_displayUUIDKeyToImmutableCADisplay enumerateKeysAndObjectsUsingBlock:v61];
  v13 = [(BSCompoundAssertion *)self->_displayLock_observerAssertion context];
  id v14 = [v13 copy];

  os_unfair_lock_unlock(&self->_displayLock);
  id v44 = [v11 mutableCopy];
  [v44 intersectSet:v9];
  id v43 = [v11 mutableCopy];
  [v43 minusSet:v9];
  v37 = v9;
  id v15 = [v9 mutableCopy];
  v36 = v11;
  [v15 minusSet:v11];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v14;
  id v16 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v21 = v43;
        id v22 = [v21 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v54;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v54 != v24) {
                objc_enumerationMutation(v21);
              }
              [v20 monitor:self displayDidBecomeActive:*(void *)(*((void *)&v53 + 1) + 8 * (void)j)];
            }
            id v23 = [v21 countByEnumeratingWithState:&v53 objects:v64 count:16];
          }
          while (v23);
        }

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v26 = v15;
        id v27 = [v26 countByEnumeratingWithState:&v49 objects:v63 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v50;
          do
          {
            for (k = 0; k != v28; k = (char *)k + 1)
            {
              if (*(void *)v50 != v29) {
                objc_enumerationMutation(v26);
              }
              [v20 monitor:self displayDidBecomeInactive:*(void *)(*((void *)&v49 + 1) + 8 * (void)k)];
            }
            id v28 = [v26 countByEnumeratingWithState:&v49 objects:v63 count:16];
          }
          while (v28);
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v31 = v44;
        id v32 = [v31 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v46;
          do
          {
            for (m = 0; m != v33; m = (char *)m + 1)
            {
              if (*(void *)v46 != v34) {
                objc_enumerationMutation(v31);
              }
              [v20 monitor:self activeDisplayPropertiesDidChange:*(void *)(*((void *)&v45 + 1) + 8 * (void)m)];
            }
            id v33 = [v31 countByEnumeratingWithState:&v45 objects:v62 count:16];
          }
          while (v33);
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v17);
  }
}

- (void)setDisplayFilterPredicate:(id)a3
{
  id v4 = [a3 copy];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = log;
    id v7 = objc_retainBlock(v4);
    int v10 = 134217984;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting display predicate: %p", (uint8_t *)&v10, 0xCu);
  }
  os_unfair_lock_lock(&self->_filterPredicateLock);
  id v8 = objc_retainBlock(v4);
  id filterPredicateLock_displayFilterPredicate = self->_filterPredicateLock_displayFilterPredicate;
  self->_id filterPredicateLock_displayFilterPredicate = v8;

  os_unfair_lock_unlock(&self->_filterPredicateLock);
  [(BKCADisplayMonitor *)self reevaluateActiveDisplaysWithReason:@"predicate changed"];
}

- (id)_filterDisplays:(id)a3 usingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    v12 = (void *)BKSDisplayUUIDMainKey;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([(BKCADisplayMonitor *)self _filterDisplay:v14 usingPredicate:v7])
        {
          id v15 = [v14 uniqueId];
          if ([v15 length]) {
            id v16 = v15;
          }
          else {
            id v16 = v12;
          }
          id v17 = v16;

          [v19 setObject:v14 forKey:v17];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v19;
}

- (BOOL)_filterDisplay:(id)a3 usingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, id, id *))a4;
  id v8 = [v6 uniqueId];
  id v9 = [v8 length];
  id v10 = (void *)BKSDisplayUUIDMainKey;
  if (v9) {
    id v10 = v8;
  }
  id v11 = v10;

  uint64_t v12 = [v6 currentMode];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [v6 availableModes];
    id v15 = [v14 count];

    if (v15)
    {
      id v16 = [v6 currentMode];
      id v17 = [v16 width];
      id v18 = [v16 height];
      unint64_t v19 = (unint64_t)v18;
      if (v17 && v18)
      {
        if (!v7)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v31 = v6;
            __int16 v32 = 2114;
            id v33 = v11;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Display is active %{public}@ %{public}@ because: connected", buf, 0x16u);
          }
          goto LABEL_18;
        }
        id v29 = 0;
        char v20 = v7[2](v7, v6, &v29);
        id v21 = v29;
        long long v22 = self->_log;
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          if (v23)
          {
            *(_DWORD *)buf = 138543874;
            id v31 = v6;
            __int16 v32 = 2114;
            id v33 = v11;
            __int16 v34 = 2114;
            double v35 = *(double *)&v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Display is active %{public}@ %{public}@ because: %{public}@", buf, 0x20u);
          }

LABEL_18:
          BOOL v25 = 1;
          goto LABEL_23;
        }
        if (v23)
        {
          *(_DWORD *)buf = 138543874;
          id v31 = v6;
          __int16 v32 = 2114;
          id v33 = v11;
          __int16 v34 = 2114;
          double v35 = *(double *)&v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Display is inactive %{public}@ %{public}@ because: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        id v26 = self->_log;
        BOOL v25 = 0;
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
LABEL_23:

          goto LABEL_24;
        }
        *(_DWORD *)buf = 138544130;
        id v31 = v6;
        __int16 v32 = 2114;
        id v33 = v11;
        __int16 v34 = 2048;
        double v35 = (double)(unint64_t)v17;
        __int16 v36 = 2048;
        double v37 = (double)v19;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Display is inactive %{public}@ %{public}@ because: size is (%g,%g)", buf, 0x2Au);
      }
      BOOL v25 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v24 = self->_log;
  BOOL v25 = 0;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Display is inactive %{public}@ because: not connected", buf, 0xCu);
    BOOL v25 = 0;
  }
LABEL_24:

  return v25;
}

- (id)_immutableDisplays
{
  os_unfair_lock_assert_not_owner(&self->_displayLock);
  v3 = [(BKCADisplayProvider *)self->_displayProvider displays];
  id v4 = [v3 bs_map:&stru_1000F87D8];

  return v4;
}

- (BOOL)hasActiveDisplays
{
  v2 = self;
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_displayLock_displayUUIDKeyToImmutableCADisplay count] != 0;
  os_unfair_lock_unlock(p_displayLock);
  return (char)v2;
}

- (NSArray)activeDisplays
{
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  id v4 = [(NSMutableDictionary *)self->_displayLock_displayUUIDKeyToImmutableCADisplay allValues];
  os_unfair_lock_unlock(p_displayLock);

  return (NSArray *)v4;
}

- (BOOL)displayUUIDIsActive:(id)a3
{
  p_displayLock = &self->_displayLock;
  id v5 = a3;
  os_unfair_lock_lock(p_displayLock);
  id v6 = [(NSMutableDictionary *)self->_displayLock_displayUUIDKeyToImmutableCADisplay objectForKey:v5];

  os_unfair_lock_unlock(p_displayLock);
  return v6 != 0;
}

- (id)addObserver:(id)a3
{
  p_displayLock = &self->_displayLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_displayLock);
  os_unfair_lock_lock(p_displayLock);
  displayLock_observerAssertion = self->_displayLock_observerAssertion;
  if (!displayLock_observerAssertion)
  {
    id v7 = +[BSCompoundAssertion assertionWithIdentifier:@"backboardd.CADisplayMonitor"];
    id v8 = self->_displayLock_observerAssertion;
    self->_displayLock_observerAssertion = v7;

    displayLock_observerAssertion = self->_displayLock_observerAssertion;
  }
  id v9 = [(id)objc_opt_class() description];
  id v10 = [(BSCompoundAssertion *)displayLock_observerAssertion acquireForReason:v9 withContext:v5];

  os_unfair_lock_unlock(p_displayLock);

  return v10;
}

- (id)immutableDisplayForUUID:(id)a3
{
  id v4 = a3;
  p_displayLock = &self->_displayLock;
  os_unfair_lock_assert_not_owner(&self->_displayLock);
  os_unfair_lock_lock(&self->_displayLock);
  displayLock_displayUUIDKeyToImmutableCADisplay = self->_displayLock_displayUUIDKeyToImmutableCADisplay;
  id v7 = v4;
  id v8 = [v7 length];
  id v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    id v9 = v7;
  }
  id v10 = v9;

  id v11 = [(NSMutableDictionary *)displayLock_displayUUIDKeyToImmutableCADisplay objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(p_displayLock);

  return v11;
}

- (void)invalidate
{
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  if (!self->_displayLock_isInvalid)
  {
    self->_displayLock_isInvalid = 1;
    [(BKCADisplayProvider *)self->_displayProvider removeMonitor:self];
    displayProvider = self->_displayProvider;
    self->_displayProvider = 0;

    [(BSCompoundAssertion *)self->_displayLock_observerAssertion invalidate];
    displayLock_observerAssertion = self->_displayLock_observerAssertion;
    self->_displayLock_observerAssertion = 0;

    os_unfair_lock_lock(&self->_filterPredicateLock);
    id filterPredicateLock_displayFilterPredicate = self->_filterPredicateLock_displayFilterPredicate;
    self->_id filterPredicateLock_displayFilterPredicate = 0;

    os_unfair_lock_unlock(&self->_filterPredicateLock);
  }

  os_unfair_lock_unlock(p_displayLock);
}

- (BKCADisplayMonitor)initWithDisplayProvider:(id)a3 log:(id)a4 filterPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)BKCADisplayMonitor;
  id v11 = [(BKCADisplayMonitor *)&v28 init];
  if (v11)
  {
    if (!v8)
    {
      id v8 = +[BKSharedCADisplayProvider sharedInstance];
    }
    objc_storeStrong((id *)&v11->_displayProvider, v8);
    if (v9)
    {
      uint64_t v12 = (OS_os_log *)v9;
    }
    else
    {
      sub_10005FBB0();
      uint64_t v12 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    }
    log = v11->_log;
    v11->_log = v12;

    v11->_displayLock._os_unfair_lock_opaque = 0;
    id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    displayLock_displayUUIDKeyToImmutableCADisplay = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v11->_displayLock_displayUUIDKeyToImmutableCADisplay = v14;

    id v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    displayLock_displayIndexToDisplayUUID = v11->_displayLock_displayIndexToDisplayUUID;
    v11->_displayLock_displayIndexToDisplayUUID = v16;

    id v18 = [(BKCADisplayMonitor *)v11 _immutableDisplays];
    uint64_t v19 = [(BKCADisplayMonitor *)v11 _filterDisplays:v18 usingPredicate:v11->_filterPredicateLock_displayFilterPredicate];
    char v20 = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v11->_displayLock_displayUUIDKeyToImmutableCADisplay = (NSMutableDictionary *)v19;

    id v21 = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008F4FC;
    v26[3] = &unk_1000F8798;
    long long v22 = v11;
    id v27 = v22;
    [(NSMutableDictionary *)v21 enumerateKeysAndObjectsUsingBlock:v26];
    v22->_filterPredicateLock._os_unfair_lock_opaque = 0;
    id v23 = [v10 copy];
    id filterPredicateLock_displayFilterPredicate = v11->_filterPredicateLock_displayFilterPredicate;
    v11->_id filterPredicateLock_displayFilterPredicate = v23;

    [(BKCADisplayProvider *)v11->_displayProvider addMonitor:v22];
  }

  return v11;
}

- (BKCADisplayMonitor)initWithLog:(id)a3 filterPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BKSharedCADisplayProvider sharedInstance];
  id v9 = [(BKCADisplayMonitor *)self initWithDisplayProvider:v8 log:v7 filterPredicate:v6];

  return v9;
}

- (BKCADisplayMonitor)initWithLog:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSharedCADisplayProvider sharedInstance];
  id v6 = [(BKCADisplayMonitor *)self initWithDisplayProvider:v5 log:v4 filterPredicate:0];

  return v6;
}

- (BKCADisplayMonitor)init
{
  v3 = +[BKSharedCADisplayProvider sharedInstance];
  id v4 = [(BKCADisplayMonitor *)self initWithDisplayProvider:v3 log:0 filterPredicate:0];

  return v4;
}

- (void)dealloc
{
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  if (!self->_displayLock_isInvalid)
  {
    id v5 = +[NSString stringWithFormat:@"must invoke -invalidate before deallocating BKCADisplayMonitor"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(a2);
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 2114;
      CFStringRef v17 = @"BKCADisplayMonitor.m";
      __int16 v18 = 1024;
      int v19 = 198;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10008F840);
  }
  os_unfair_lock_unlock(p_displayLock);
  v9.receiver = self;
  v9.super_class = (Class)BKCADisplayMonitor;
  [(BKCADisplayMonitor *)&v9 dealloc];
}

@end