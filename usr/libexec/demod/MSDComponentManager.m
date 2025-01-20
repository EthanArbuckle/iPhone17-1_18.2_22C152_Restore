@interface MSDComponentManager
- (BOOL)parallelProcessing;
- (BOOL)result;
- (BOOL)waitForProcessingCompletionTillDate:(id)a3 outError:(id *)a4;
- (MSDComponentManager)initWithComponents:(id)a3 andProcessor:(id)a4;
- (MSDComponentProcessor)componentProcessor;
- (NSError)error;
- (NSMutableArray)activeComponents;
- (NSMutableArray)pendingComponents;
- (NSMutableArray)removableComponents;
- (NSMutableArray)retryableComponents;
- (os_unfair_lock_s)componentListLock;
- (unint64_t)_calculateFreeSpaceToReserve:(unint64_t)a3;
- (void)_cancelAllOperations;
- (void)_dispatchComponent:(id)a3;
- (void)_dispatchNextComponent;
- (void)_enforceFreeDiskSpaceRequirement;
- (void)_handleCompleteComponent:(id)a3;
- (void)_handleNewOperationStagedForComponent:(id)a3;
- (void)_handleRetryComponent:(id)a3 forComponent:(id)a4;
- (void)_postCompletionNotificationWithResult:(BOOL)a3 andError:(id)a4;
- (void)_setupInterComponentDependencyOnRetry:(BOOL)a3;
- (void)_startProcessingComponentsOnRetry:(BOOL)a3;
- (void)abortProcessing;
- (void)component:(id)a3 didProduceClonedComponent:(id)a4;
- (void)componentDidHaveNewOperationStaged:(id)a3;
- (void)pauseProcessing;
- (void)resumeProcessing;
- (void)setActiveComponents:(id)a3;
- (void)setComponentListLock:(os_unfair_lock_s)a3;
- (void)setComponentProcessor:(id)a3;
- (void)setParallelProcessing:(BOOL)a3;
- (void)setPendingComponents:(id)a3;
- (void)setRemovableComponents:(id)a3;
- (void)setRetryableComponents:(id)a3;
- (void)startProcessingAllComponents;
@end

@implementation MSDComponentManager

- (MSDComponentManager)initWithComponents:(id)a3 andProcessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MSDComponentManager;
  v8 = [(MSDComponentManager *)&v30 init];
  if (v8)
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    [(MSDComponentManager *)v8 setActiveComponents:v9];

    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    [(MSDComponentManager *)v8 setRetryableComponents:v10];

    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    [(MSDComponentManager *)v8 setRemovableComponents:v11];

    id v12 = [v6 mutableCopy];
    [(MSDComponentManager *)v8 setPendingComponents:v12];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v13 = [v6 reverseObjectEnumerator];
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v17) createRemovableCounterpartComponent];
          if (v18)
          {
            v19 = [(MSDComponentManager *)v8 removableComponents];
            [v19 addObject:v18];
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v15);
    }

    [(MSDComponentManager *)v8 setComponentProcessor:v7];
    [(MSDComponentManager *)v8 setComponentListLock:0];
    if (os_variant_has_internal_content()
      && (+[MSDTestPreferences sharedInstance],
          v20 = objc_claimAutoreleasedReturnValue(),
          unsigned int v21 = [v20 disableParallelProcessing],
          v20,
          v21))
    {
      v22 = sub_100068600();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Disabling parallel processing as requested.", v25, 2u);
      }

      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v23 = 1;
    }
    [(MSDComponentManager *)v8 setParallelProcessing:v23];
  }

  return v8;
}

- (void)startProcessingAllComponents
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[MSDComponentManager startProcessingAllComponents]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v6, 0xCu);
  }

  p_componentListLock = &self->_componentListLock;
  os_unfair_lock_lock(&self->_componentListLock);
  [(MSDComponentManager *)self _enforceFreeDiskSpaceRequirement];
  [(MSDComponentManager *)self _startProcessingComponentsOnRetry:0];
  v5 = [(MSDComponentManager *)self componentProcessor];
  [v5 resume];

  os_unfair_lock_unlock(p_componentListLock);
}

- (BOOL)waitForProcessingCompletionTillDate:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10000B6D0;
  v36 = sub_10000B6E0;
  id v37 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[MSDComponentManager waitForProcessingCompletionTillDate:outError:]";
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered with deadline %{public}@", buf, 0x16u);
  }

  id v9 = [(MSDComponentManager *)self activeComponents];
  BOOL v10 = [v9 count] == 0;

  if (!v10)
  {
    id v11 = +[NSNotificationCenter defaultCenter];
    id v12 = +[NSOperationQueue mainQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000B6E8;
    v24[3] = &unk_100151BF8;
    long long v26 = &v28;
    long long v27 = &v32;
    v13 = v7;
    v25 = v13;
    id v14 = [v11 addObserverForName:@"MSDComponentManagerComplete" object:0 queue:v12 usingBlock:v24];

    if (v6)
    {
      [v6 timeIntervalSinceNow];
      dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      if (dispatch_semaphore_wait(v13, v16))
      {
        v17 = sub_100068600();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Timed out waiting for processing of all components to complete.", buf, 2u);
        }

        uint64_t v18 = +[NSError errorDomainMSDWithCode:3727741184 message:@"Cannot finish update within given time."];
        v19 = (void *)v33[5];
        v33[5] = v18;

        [(MSDComponentManager *)self _cancelAllOperations];
      }
      if (!a4)
      {
LABEL_10:
        if (!v14) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      if (!a4) {
        goto LABEL_10;
      }
    }
    *a4 = (id) v33[5];
    if (!v14)
    {
LABEL_18:
      v22 = sub_100068600();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[MSDComponentManager waitForProcessingCompletionTillDate:outError:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
      }

      BOOL v20 = *((unsigned char *)v29 + 24) != 0;
      goto LABEL_21;
    }
LABEL_17:
    unsigned int v21 = +[NSNotificationCenter defaultCenter];
    [v21 removeObserver:v14];

    goto LABEL_18;
  }
  id v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No more active component to process.", buf, 2u);
  }
  BOOL v20 = 1;
LABEL_21:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v20;
}

- (void)pauseProcessing
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[MSDComponentManager pauseProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s called.", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(MSDComponentManager *)self componentProcessor];
  [v4 suspend];
}

- (void)resumeProcessing
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[MSDComponentManager resumeProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s called.", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(MSDComponentManager *)self componentProcessor];
  [v4 resume];
}

- (void)abortProcessing
{
  v3 = +[NSError errorDomainMSDWithCode:3727741185 message:@"Operation canceled."];
  v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[MSDComponentManager abortProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v5, 0xCu);
  }

  [(MSDComponentManager *)self _cancelAllOperations];
  [(MSDComponentManager *)self _postCompletionNotificationWithResult:0 andError:v3];
}

- (void)_startProcessingComponentsOnRetry:(BOOL)a3
{
  [(MSDComponentManager *)self _setupInterComponentDependencyOnRetry:a3];
  if ([(MSDComponentManager *)self parallelProcessing])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(MSDComponentManager *)self activeComponents];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(MSDComponentManager *)self _dispatchComponent:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [(MSDComponentManager *)self _dispatchNextComponent];
  }
}

- (void)_cancelAllOperations
{
  p_componentListLock = &self->_componentListLock;
  os_unfair_lock_lock(&self->_componentListLock);
  v4 = [(MSDComponentManager *)self activeComponents];
  [v4 removeAllObjects];

  id v5 = [(MSDComponentManager *)self retryableComponents];
  [v5 removeAllObjects];

  id v6 = [(MSDComponentManager *)self removableComponents];
  [v6 removeAllObjects];

  uint64_t v7 = [(MSDComponentManager *)self pendingComponents];
  [v7 removeAllObjects];

  os_unfair_lock_unlock(p_componentListLock);
  id v8 = [(MSDComponentManager *)self componentProcessor];
  [v8 cancel];
}

- (void)_dispatchNextComponent
{
  v3 = [(MSDComponentManager *)self activeComponents];
  v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 name];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dispatching component %{public}@ ...", (uint8_t *)&v7, 0xCu);
    }
    [(MSDComponentManager *)self _dispatchComponent:v4];
  }
}

- (void)_postCompletionNotificationWithResult:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:2];
  id v6 = +[NSNumber numberWithBool:v4];
  [v5 setObject:v6 forKey:@"Result"];

  if (v8) {
    [v5 setObject:v8 forKey:@"Error"];
  }
  int v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"MSDComponentManagerComplete" object:0 userInfo:v5];
}

- (void)_dispatchComponent:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self];
  id v5 = [(MSDComponentManager *)self componentProcessor];
  [v5 process:v4];
}

- (void)_handleNewOperationStagedForComponent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New operation staged for component: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(MSDComponentManager *)self componentProcessor];
  [v6 process:v4];
}

- (void)_handleCompleteComponent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "All operations complete for component: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  os_unfair_lock_lock(&self->_componentListLock);
  id v6 = [(MSDComponentManager *)self activeComponents];
  [v6 removeObject:v4];

  int v7 = [(MSDComponentManager *)self activeComponents];
  id v8 = [v7 count];

  if (v8)
  {
    if (![(MSDComponentManager *)self parallelProcessing]) {
      [(MSDComponentManager *)self _dispatchNextComponent];
    }
    goto LABEL_15;
  }
  long long v9 = [(MSDComponentManager *)self retryableComponents];
  id v10 = [v9 count];

  if (v10)
  {
    long long v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Processing retryable components...", (uint8_t *)&v21, 2u);
    }

    long long v12 = [(MSDComponentManager *)self activeComponents];
    v13 = [(MSDComponentManager *)self retryableComponents];
    [v12 addObjectsFromArray:v13];

    id v14 = [(MSDComponentManager *)self retryableComponents];
    [v14 removeAllObjects];

    double v15 = self;
    uint64_t v16 = 1;
LABEL_14:
    [(MSDComponentManager *)v15 _startProcessingComponentsOnRetry:v16];
    goto LABEL_15;
  }
  v17 = [(MSDComponentManager *)self pendingComponents];
  id v18 = [v17 count];

  v19 = sub_100068600();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Processing pending components...", (uint8_t *)&v21, 2u);
    }

    [(MSDComponentManager *)self _enforceFreeDiskSpaceRequirement];
    double v15 = self;
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  if (v20)
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "All components complete!", (uint8_t *)&v21, 2u);
  }

  [(MSDComponentManager *)self _postCompletionNotificationWithResult:1 andError:0];
LABEL_15:
  os_unfair_lock_unlock(&self->_componentListLock);
}

- (void)_handleRetryComponent:(id)a3 forComponent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000C6E54((uint64_t)v6, v8);
  }

  os_unfair_lock_lock(&self->_componentListLock);
  long long v9 = [(MSDComponentManager *)self retryableComponents];
  [v9 addObject:v6];

  os_unfair_lock_unlock(&self->_componentListLock);
  [(MSDComponentManager *)self _handleCompleteComponent:v7];
}

- (void)_enforceFreeDiskSpaceRequirement
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[MSDTargetDevice sharedInstance];
  id v5 = [v4 getFreeSpace];

  unint64_t v6 = [(MSDComponentManager *)self _calculateFreeSpaceToReserve:v5];
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trying to enforce free disk space requirement:  %{iec-bytes}llu", buf, 0xCu);
  }

  *(void *)&long long v8 = 138543362;
  long long v31 = v8;
  uint64_t v32 = self;
  while (1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v9 = [(MSDComponentManager *)self pendingComponents];
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      while (2)
      {
        v13 = 0;
        id v14 = v5;
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          double v15 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v13);
          uint64_t v16 = [v15 diskSpaceRequired];
          v17 = sub_100068600();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            unint64_t v38 = (unint64_t)v15;
            __int16 v39 = 2048;
            id v40 = v16;
            __int16 v41 = 2048;
            v42 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Free space needed=%{iec-bytes}llu, Free space left=%{iec-bytes}llu", buf, 0x20u);
          }

          BOOL v18 = v14 >= v16;
          id v5 = (unsigned char *)(v14 - v16);
          if (v5 == 0 || !v18 || (unint64_t)v5 <= v6)
          {
            v19 = sub_100068600();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              unint64_t v38 = (unint64_t)v15;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Not enough free space left for this component.", buf, 0xCu);
            }

            id v5 = v14;
            self = v32;
            goto LABEL_20;
          }
          [v3 addObject:v15];
          v13 = (char *)v13 + 1;
          id v14 = v5;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
        self = v32;
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    if ([v3 count])
    {
      uint64_t v28 = [(MSDComponentManager *)self activeComponents];
      [v28 addObjectsFromArray:v3];

      int v21 = [(MSDComponentManager *)self pendingComponents];
      [v21 removeObjectsInArray:v3];
      goto LABEL_33;
    }
    BOOL v20 = [(MSDComponentManager *)self removableComponents];
    int v21 = [v20 firstObject];

    if (v21) {
      break;
    }
    id v22 = [(MSDComponentManager *)self pendingComponents];
    uint64_t v23 = [v22 firstObject];

    v24 = sub_100068600();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (!v23)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No more pending component to discard.", buf, 2u);
      }
      goto LABEL_32;
    }
    if (v25)
    {
      *(_DWORD *)buf = v31;
      unint64_t v38 = (unint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Discarding one pending component due to insufficient disk space: %{public}@", buf, 0xCu);
    }

    long long v26 = [(MSDComponentManager *)self activeComponents];
    [v26 addObject:v23];

    long long v27 = [(MSDComponentManager *)self pendingComponents];
    [v27 removeObject:v23];

    [v23 discardStagedOperationsAndTriggerCompletion];
  }
  long long v29 = sub_100068600();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = v31;
    unint64_t v38 = (unint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Removing existing component to free up disk space: %{public}@", buf, 0xCu);
  }

  uint64_t v30 = [(MSDComponentManager *)self activeComponents];
  [v30 addObject:v21];

  v24 = [(MSDComponentManager *)self removableComponents];
  [v24 removeObject:v21];
LABEL_32:

LABEL_33:
}

- (unint64_t)_calculateFreeSpaceToReserve:(unint64_t)a3
{
  id v4 = (void *)MGCopyAnswer();
  id v5 = [v4 objectForKey:kMGQDiskUsageAmountDataReserved];
  unint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = (unint64_t)[v5 unsignedLongLongValue];
  }
  else
  {
    long long v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000C6ECC(v8);
    }

    unint64_t v7 = 5 * a3 / 0x64;
  }

  return v7;
}

- (void)_setupInterComponentDependencyOnRetry:(BOOL)a3
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_10000B6D0;
  v10[4] = sub_10000B6E0;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_10000B6D0;
  v8[4] = sub_10000B6E0;
  id v9 = 0;
  id v5 = [(MSDComponentManager *)self activeComponents];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C98C;
  v6[3] = &unk_100151C20;
  BOOL v7 = a3;
  v6[4] = v8;
  v6[5] = v10;
  [v5 enumerateObjectsUsingBlock:v6];

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
}

- (void)component:(id)a3 didProduceClonedComponent:(id)a4
{
}

- (void)componentDidHaveNewOperationStaged:(id)a3
{
}

- (BOOL)result
{
  return self->_result;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)activeComponents
{
  return self->_activeComponents;
}

- (void)setActiveComponents:(id)a3
{
}

- (NSMutableArray)retryableComponents
{
  return self->_retryableComponents;
}

- (void)setRetryableComponents:(id)a3
{
}

- (NSMutableArray)removableComponents
{
  return self->_removableComponents;
}

- (void)setRemovableComponents:(id)a3
{
}

- (NSMutableArray)pendingComponents
{
  return self->_pendingComponents;
}

- (void)setPendingComponents:(id)a3
{
}

- (MSDComponentProcessor)componentProcessor
{
  return self->_componentProcessor;
}

- (void)setComponentProcessor:(id)a3
{
}

- (os_unfair_lock_s)componentListLock
{
  return self->_componentListLock;
}

- (void)setComponentListLock:(os_unfair_lock_s)a3
{
  self->_componentListLock = a3;
}

- (BOOL)parallelProcessing
{
  return self->_parallelProcessing;
}

- (void)setParallelProcessing:(BOOL)a3
{
  self->_parallelProcessing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentProcessor, 0);
  objc_storeStrong((id *)&self->_pendingComponents, 0);
  objc_storeStrong((id *)&self->_removableComponents, 0);
  objc_storeStrong((id *)&self->_retryableComponents, 0);
  objc_storeStrong((id *)&self->_activeComponents, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end