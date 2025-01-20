@interface BKSharedCADisplayProvider
+ (id)sharedInstance;
- (BKSharedCADisplayProvider)init;
- (CADisplay)mainDisplay;
- (NSArray)displays;
- (void)_lock_addObserversToDisplay:(id)a3;
- (void)_lock_removeObserversFromDisplay:(id)a3;
- (void)_lock_updateObservingState;
- (void)addMonitor:(id)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeMonitor:(id)a3;
@end

@implementation BKSharedCADisplayProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observedDisplays, 0);

  objc_storeStrong((id *)&self->_lock_monitors, 0);
}

- (void)_lock_removeObserversFromDisplay:(id)a3
{
  lock_observedDisplays = self->_lock_observedDisplays;
  id v7 = a3;
  if ((-[NSMutableSet containsObject:](lock_observedDisplays, "containsObject:") & 1) == 0)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BKCADisplayMonitor.m" lineNumber:171 description:@"attempting to remove ourselves as an observer for an untracked display. did we mix up mutable and immutable?"];
  }
  [(NSMutableSet *)self->_lock_observedDisplays removeObject:v7];
  [v7 removeObserver:self forKeyPath:@"availableModes" context:off_1001221F0];
  [v7 removeObserver:self forKeyPath:@"currentMode" context:off_1001221F8];
  [v7 removeObserver:self forKeyPath:@"logicalScale" context:off_100122200];
  [v7 removeObserver:self forKeyPath:@"pointScale" context:off_100122208];
}

- (void)_lock_addObserversToDisplay:(id)a3
{
  lock_observedDisplays = self->_lock_observedDisplays;
  id v7 = a3;
  if (-[NSMutableSet containsObject:](lock_observedDisplays, "containsObject:"))
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BKCADisplayMonitor.m" lineNumber:162 description:@"attempting to add ourselves as an observer for an already tracked display. did we mix up mutable and immutable?"];
  }
  [(NSMutableSet *)self->_lock_observedDisplays addObject:v7];
  [v7 addObserver:self forKeyPath:@"availableModes" options:0 context:off_1001221F0];
  [v7 addObserver:self forKeyPath:@"currentMode" options:0 context:off_1001221F8];
  [v7 addObserver:self forKeyPath:@"logicalScale" options:0 context:off_100122200];
  [v7 addObserver:self forKeyPath:@"pointScale" options:0 context:off_100122208];
}

- (void)_lock_updateObservingState
{
  if ([(NSMutableSet *)self->_lock_monitors count])
  {
    if (!self->_isObserving)
    {
      v3 = [(BKSharedCADisplayProvider *)self displays];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v18;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v18 != v6) {
              objc_enumerationMutation(v3);
            }
            [(BKSharedCADisplayProvider *)self _lock_addObserversToDisplay:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          }
          id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v5);
      }
      self->_isObserving = 1;
    }
  }
  else if (self->_isObserving)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = self->_lock_observedDisplays;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[BKSharedCADisplayProvider _lock_removeObserversFromDisplay:](self, "_lock_removeObserversFromDisplay:", *(void *)(*((void *)&v13 + 1) + 8 * (void)j), (void)v13);
        }
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }

    self->_isObserving = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_class();
  id v14 = v11;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      long long v15 = v14;
    }
    else {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }
  id v16 = v15;

  if (off_1001221F0 == a6)
  {
    long long v17 = sub_10005FBB0();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    long long v18 = [v16 uniqueId];
    *(_DWORD *)buf = 138543618;
    *(void *)v91 = v16;
    *(_WORD *)&v91[8] = 2114;
    *(void *)&v91[10] = v18;
    long long v19 = "available modes changed for display %{public}@ %{public}@";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);

    goto LABEL_19;
  }
  if (off_1001221F8 == a6)
  {
    long long v17 = sub_10005FBB0();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    long long v18 = [v16 uniqueId];
    *(_DWORD *)buf = 138543618;
    *(void *)v91 = v16;
    *(_WORD *)&v91[8] = 2114;
    *(void *)&v91[10] = v18;
    long long v19 = "current modes changed for display %{public}@ %{public}@";
    goto LABEL_18;
  }
  if (off_100122200 == a6)
  {
    long long v17 = sub_10005FBB0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = [v16 uniqueId];
      *(_DWORD *)buf = 138543618;
      *(void *)v91 = v16;
      *(_WORD *)&v91[8] = 2114;
      *(void *)&v91[10] = v18;
      long long v19 = "logical scale changed for display %{public}@ %{public}@";
      goto LABEL_18;
    }
LABEL_19:

LABEL_20:
    uint64_t v20 = objc_opt_class();
    id v21 = v14;
    if (v20)
    {
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    id v23 = v22;

    id v24 = [v23 immutableCopy];
    v69 = v24;
    if (!v24)
    {
LABEL_62:

      goto LABEL_63;
    }
    id v62 = v16;
    id v63 = v14;
    id v64 = v12;
    id v65 = v10;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v26 = [(NSMutableSet *)self->_lock_monitors copy];
    os_unfair_lock_unlock(p_lock);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v26;
    id v70 = [obj countByEnumeratingWithState:&v74 objects:v89 count:16];
    if (!v70) {
      goto LABEL_61;
    }
    uint64_t v68 = *(void *)v75;
    v66 = (void *)BKSDisplayUUIDMainKey;
    v27 = &BKTransferTouchesEntitlement_ptr;
LABEL_28:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v75 != v68) {
        objc_enumerationMutation(obj);
      }
      uint64_t v29 = *(void *)(*((void *)&v74 + 1) + 8 * v28);
      id v30 = v69;
      if (!v29) {
        goto LABEL_57;
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v29 + 60));
      id v31 = [*(id *)(v29 + 64) copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 60));
      v72 = v31;
      LODWORD(v31) = [(id)v29 _filterDisplay:v30 usingPredicate:v31];
      os_unfair_lock_lock((os_unfair_lock_t)(v29 + 24));
      id v73 = v30;
      id v32 = v30;
      unsigned int v33 = [v32 displayId];
      uint64_t v34 = v33;
      v35 = *(void **)(v29 + 48);
      v36 = [v27[161] numberWithInteger:v33];
      id v37 = [v35 objectForKey:v36];

      if (v31)
      {
        if (v37)
        {
          v38 = *(NSObject **)(v29 + 16);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v91 = v33;
            *(_WORD *)&v91[4] = 2114;
            *(void *)&v91[6] = v37;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "modified display %d -- %{public}@", buf, 0x12u);
          }
          [*(id *)(v29 + 40) setObject:v32 forKey:v37];
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_10008E160;
          v85[3] = &unk_1000F8800;
          v85[4] = v29;
          id v39 = v32;
          id v86 = v39;
          v40 = objc_retainBlock(v85);
          v41 = &v86;
        }
        else
        {
          id v45 = [v32 uniqueId];
          id v46 = [v45 length];
          v47 = v66;
          if (v46) {
            v47 = v45;
          }
          id v37 = v47;

          v48 = *(NSObject **)(v29 + 16);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v91 = v33;
            *(_WORD *)&v91[4] = 2114;
            *(void *)&v91[6] = v37;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "adding display %d -- %{public}@", buf, 0x12u);
          }
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_10008E154;
          v87[3] = &unk_1000F8800;
          v87[4] = v29;
          id v39 = v32;
          id v88 = v39;
          v40 = objc_retainBlock(v87);
          [*(id *)(v29 + 40) setObject:v39 forKey:v37];
          v49 = *(void **)(v29 + 48);
          v50 = [v27[161] numberWithInteger:v34];
          [v49 setObject:v37 forKey:v50];

          v41 = &v88;
        }
      }
      else
      {
        v42 = *(NSObject **)(v29 + 16);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v91 = v33;
          *(_WORD *)&v91[4] = 2114;
          *(void *)&v91[6] = v37;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "removing display %d -- %{public}@", buf, 0x12u);
        }
        id v39 = [*(id *)(v29 + 40) objectForKey:v37];

        if (!v39)
        {
          v40 = 0;
          goto LABEL_47;
        }
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_10008E16C;
        v83[3] = &unk_1000F8800;
        v83[4] = v29;
        id v84 = v32;
        v40 = objc_retainBlock(v83);
        [*(id *)(v29 + 40) removeObjectForKey:v37];
        v43 = *(void **)(v29 + 48);
        v44 = [v27[161] numberWithInteger:v34];
        [v43 removeObjectForKey:v44];

        v41 = &v84;
      }

LABEL_47:
      v51 = [*(id *)(v29 + 32) context];
      id v52 = [v51 copy];

      os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 24));
      if (v40)
      {
        id v71 = v37;
        v53 = v27;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v54 = v52;
        id v55 = [v54 countByEnumeratingWithState:&v79 objects:buf count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v80;
          do
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(void *)v80 != v57) {
                objc_enumerationMutation(v54);
              }
              ((void (*)(void *, void))v40[2])(v40, *(void *)(*((void *)&v79 + 1) + 8 * i));
            }
            id v56 = [v54 countByEnumeratingWithState:&v79 objects:buf count:16];
          }
          while (v56);
        }

        v27 = v53;
        id v37 = v71;
      }

      id v30 = v73;
LABEL_57:

      if ((id)++v28 == v70)
      {
        id v59 = [obj countByEnumeratingWithState:&v74 objects:v89 count:16];
        id v70 = v59;
        if (!v59)
        {
LABEL_61:

          id v12 = v64;
          id v10 = v65;
          id v16 = v62;
          id v14 = v63;
          goto LABEL_62;
        }
        goto LABEL_28;
      }
    }
  }
  if (off_1001221E8 == a6) {
    goto LABEL_20;
  }
  if (off_100122208 == a6)
  {
    long long v17 = sub_10005FBB0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v60 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 pointScale]);
      v61 = [v16 uniqueId];
      *(_DWORD *)buf = 138543874;
      *(void *)v91 = v60;
      *(_WORD *)&v91[8] = 2114;
      *(void *)&v91[10] = v16;
      __int16 v92 = 2114;
      v93 = v61;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "point scale changed to %{public}@ for display %{public}@ %{public}@", buf, 0x20u);
    }
    goto LABEL_19;
  }
  v78.receiver = self;
  v78.super_class = (Class)BKSharedCADisplayProvider;
  [(BKSharedCADisplayProvider *)&v78 observeValueForKeyPath:v10 ofObject:v14 change:v12 context:a6];
LABEL_63:
}

- (void)removeMonitor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_monitors removeObject:v5];

  [(BKSharedCADisplayProvider *)self _lock_updateObservingState];

  os_unfair_lock_unlock(p_lock);
}

- (void)addMonitor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_monitors addObject:v5];

  [(BKSharedCADisplayProvider *)self _lock_updateObservingState];

  os_unfair_lock_unlock(p_lock);
}

- (CADisplay)mainDisplay
{
  return (CADisplay *)+[CADisplay mainDisplay];
}

- (NSArray)displays
{
  return (NSArray *)+[CADisplay displays];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_monitors = self->_lock_monitors;
  self->_lock_monitors = 0;

  [(BKSharedCADisplayProvider *)self _lock_updateObservingState];

  os_unfair_lock_unlock(p_lock);
}

- (BKSharedCADisplayProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)BKSharedCADisplayProvider;
  v2 = [(BKSharedCADisplayProvider *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    lock_monitors = v3->_lock_monitors;
    v3->_lock_monitors = v4;

    uint64_t v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    lock_observedDisplays = v3->_lock_observedDisplays;
    v3->_lock_observedDisplays = v6;

    [(BKSharedCADisplayProvider *)v3 _lock_updateObservingState];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100123110 != -1) {
    dispatch_once(&qword_100123110, &stru_1000F8770);
  }
  v2 = (void *)qword_100123118;

  return v2;
}

@end