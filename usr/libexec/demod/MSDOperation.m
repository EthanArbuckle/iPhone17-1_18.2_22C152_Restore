@interface MSDOperation
- (BOOL)canPassCheckpoint;
- (BOOL)isAllDependentInComponentCancelled;
- (BOOL)isLeaf;
- (BOOL)isRoot;
- (BOOL)result;
- (BOOL)retryable;
- (BOOL)rollback;
- (BOOL)runInstallInParallel;
- (BOOL)skipped;
- (MSDComponent)component;
- (MSDOperation)initWithContext:(id)a3;
- (MSDOperationBarrier)checkpointBarrier;
- (MSDOperationContext)context;
- (MSDOperationObserver)observer;
- (NSError)error;
- (NSMutableSet)dependents;
- (NSString)identifier;
- (id)allDependentOperations;
- (id)description;
- (id)methodSelectors;
- (int64_t)type;
- (unint64_t)flag;
- (unint64_t)signpostId;
- (void)addDependency:(id)a3;
- (void)addObserver:(id)a3;
- (void)execute;
- (void)main;
- (void)produceNewDependentOperation:(id)a3 forRollback:(BOOL)a4;
- (void)setCheckpointBarrier:(id)a3;
- (void)setComponent:(id)a3;
- (void)setContext:(id)a3;
- (void)setDependents:(id)a3;
- (void)setError:(id)a3;
- (void)setFlag:(unint64_t)a3;
- (void)setObserver:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setRetryable:(BOOL)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setSkipped:(BOOL)a3;
@end

@implementation MSDOperation

- (MSDOperation)initWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDOperation;
  v5 = [(MSDOperation *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(MSDOperation *)v5 setContext:v4];
    [(MSDOperation *)v6 setComponent:0];
    [(MSDOperation *)v6 setFlag:0];
    [(MSDOperation *)v6 setCheckpointBarrier:0];
    [(MSDOperation *)v6 setObserver:0];
    v7 = sub_1000687C8();
    [(MSDOperation *)v6 setSignpostId:os_signpost_id_generate(v7)];

    id v8 = objc_alloc_init((Class)NSMutableSet);
    [(MSDOperation *)v6 setDependents:v8];
  }
  return v6;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (MSDOperationContext)context
{
  return self->_context;
}

- (int64_t)type
{
  return 0;
}

- (BOOL)retryable
{
  return [(MSDOperation *)self flag] & 1;
}

- (void)setRetryable:(BOOL)a3
{
  unint64_t v4 = [(MSDOperation *)self flag] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(MSDOperation *)self setFlag:v4];
}

- (BOOL)skipped
{
  v2 = [(MSDOperation *)self context];
  unsigned __int8 v3 = [v2 skipped];

  return v3;
}

- (void)setSkipped:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MSDOperation *)self context];
  [v4 setSkipped:v3];
}

- (void)main
{
  BOOL v3 = _os_activity_create((void *)&_mh_execute_header, "Perform Operation", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v3, &v17);
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: entered.", buf, 0xCu);
  }

  v5 = [(MSDOperation *)self observer];

  if (v5)
  {
    v6 = [(MSDOperation *)self observer];
    [v6 operationDidStart:self];
  }
  v7 = sub_1000687C8();
  unint64_t v8 = [(MSDOperation *)self signpostId];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Perform Operation", "Operation name: %{xcode:string}@", buf, 0xCu);
    }
  }

  [(MSDOperation *)self execute];
  objc_super v10 = sub_1000687C8();
  unint64_t v11 = [(MSDOperation *)self signpostId];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      unsigned int v13 = [(MSDOperation *)self result];
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v12, "Perform Operation", "Operation name: %{xcode:string}@ result: %{xcode:BOOLean}d", buf, 0x12u);
    }
  }

  v14 = [(MSDOperation *)self observer];

  if (v14)
  {
    v15 = [(MSDOperation *)self observer];
    [v15 operationWillFinish:self];
  }
  v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: will return.", buf, 0xCu);
  }

  os_activity_scope_leave(&v17);
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  if (([v6 conformsToProtocol:&OBJC_PROTOCOL___MSDOperationObserver] & 1) == 0)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MSDOperation.m" lineNumber:116 description:@"Observer does not conform to protocol"];
  }
  [(MSDOperation *)self setObserver:v6];
}

- (id)methodSelectors
{
  return +[NSArray array];
}

- (void)execute
{
  if ([(MSDOperation *)self canPassCheckpoint])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(MSDOperation *)self methodSelectors];
    id v3 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v3)
    {
      id v5 = v3;
      uint64_t v6 = *(void *)v26;
      *(void *)&long long v4 = 67109120;
      long long v23 = v4;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(obj);
          }
          unint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_super v10 = (const char *)[v8 pointerValue];
          unint64_t v11 = NSStringFromSelector(v10);
          os_signpost_id_t v12 = (uint64_t (*)(MSDOperation *, const char *))[(MSDOperation *)self methodForSelector:v10];
          unsigned int v13 = sub_1000687C8();
          unint64_t v14 = [(MSDOperation *)self signpostId];
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v11;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Execute Method Selector", "Selector name: %{xcode:string}@", buf, 0xCu);
            }
          }

          int v16 = v12(self, v10);
          os_activity_scope_state_s v17 = sub_1000687C8();
          unint64_t v18 = [(MSDOperation *)self signpostId];
          if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v19 = v18;
            if (os_signpost_enabled(v17))
            {
              *(_DWORD *)buf = v23;
              LODWORD(v30) = v16;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v19, "Execute Method Selector", "Selector result: %{xcode:BOOLean}d", buf, 8u);
            }
          }

          if ((v16 & 1) == 0)
          {
            v22 = sub_100068600();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_1000D2460((uint64_t)v11, v22);
            }

LABEL_21:
            uint64_t v21 = 0;
            goto LABEL_22;
          }
          unsigned int v20 = [(MSDOperation *)self canPassCheckpoint];

          if (!v20) {
            goto LABEL_21;
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    uint64_t v21 = 1;
LABEL_22:
  }
  else
  {
    uint64_t v21 = 0;
  }
  -[MSDOperation setResult:](self, "setResult:", v21, v23);
}

- (BOOL)canPassCheckpoint
{
  if ([(MSDOperation *)self isCancelled])
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      unint64_t v18 = self;
      long long v4 = "%{public}@ is cancelled.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v17, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(MSDOperation *)self skipped])
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      unint64_t v18 = self;
      long long v4 = "%{public}@ is skipped.";
      goto LABEL_7;
    }
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  v7 = [(MSDOperation *)self checkpointBarrier];
  unsigned int v8 = [v7 activated];

  if (!v8) {
    return 1;
  }
  os_signpost_id_t v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    unint64_t v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is halted by checkpoint barrier.", (uint8_t *)&v17, 0xCu);
  }

  objc_super v10 = sub_1000687C8();
  unint64_t v11 = [(MSDOperation *)self signpostId];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v17 = 138412290;
      unint64_t v18 = self;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Encounter Checkpoint Barrier", "Operation name: %{xcode:string}@", (uint8_t *)&v17, 0xCu);
    }
  }

  unsigned int v13 = [(MSDOperation *)self checkpointBarrier];
  [v13 waitUntilClear];

  unint64_t v14 = sub_1000687C8();
  unint64_t v15 = [(MSDOperation *)self signpostId];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v16, "Encounter Checkpoint Barrier", "", (uint8_t *)&v17, 2u);
    }
  }

  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    unint64_t v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is free of checkpoint barrier.", (uint8_t *)&v17, 0xCu);
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

- (BOOL)isRoot
{
  v2 = [(MSDOperation *)self dependencies];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isLeaf
{
  v2 = [(MSDOperation *)self dependents];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isAllDependentInComponentCancelled
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(MSDOperation *)self dependents];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        os_signpost_id_t v9 = [(MSDOperation *)self component];
        objc_super v10 = [v8 component];

        if (v9 == v10 && ![v8 isCancelled])
        {
          BOOL v11 = 0;
          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (void)addDependency:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSDOperation;
  id v4 = a3;
  [(MSDOperation *)&v6 addDependency:v4];
  id v5 = [v4 dependents:v6.receiver super_class:v6.super_class];

  [v5 addObject:self];
}

- (void)produceNewDependentOperation:(id)a3 forRollback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    long long v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 1026;
    BOOL v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: New dependent operation produced: %{public}@ for rollback: %{public, BOOL}d", buf, 0x1Cu);
  }

  [v6 addDependency:self];
  unsigned int v8 = [(MSDOperation *)self observer];

  if (v8)
  {
    os_signpost_id_t v9 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006EDDC;
    block[3] = &unk_100152DD8;
    block[4] = self;
    id v11 = v6;
    BOOL v12 = v4;
    dispatch_async(v9, block);
  }
}

- (id)allDependentOperations
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [v4 addObject:self];
  while ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
    [v4 removeObjectAtIndex:0];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    __int16 v15 = v5;
    id v6 = [v5 dependents];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          BOOL v12 = [v11 component];
          long long v13 = [(MSDOperation *)self component];

          if (v12 == v13 && ([v3 containsObject:v11] & 1) == 0)
          {
            [v3 addObject:v11];
            [v4 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }

  return v3;
}

- (BOOL)rollback
{
  return 1;
}

- (id)description
{
  unsigned int v3 = [(MSDOperation *)self result];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  id v5 = v4;
  unint64_t v6 = [(MSDOperation *)self flag];
  id v7 = [(MSDOperation *)self identifier];
  id v8 = [(MSDOperation *)self context];
  uint64_t v9 = [v8 uniqueName];
  objc_super v10 = +[NSString stringWithFormat:@"<%@: Name=%@ Result=%@ Flag=%lx>", v7, v9, v5, v6];

  return v10;
}

- (BOOL)runInstallInParallel
{
  return 0;
}

- (MSDComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSMutableSet)dependents
{
  return self->_dependents;
}

- (void)setDependents:(id)a3
{
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)flag
{
  return self->_flag;
}

- (void)setFlag:(unint64_t)a3
{
  self->_flag = a3;
}

- (MSDOperationBarrier)checkpointBarrier
{
  return self->_checkpointBarrier;
}

- (void)setCheckpointBarrier:(id)a3
{
}

- (MSDOperationObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MSDOperationObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_checkpointBarrier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_component, 0);
}

@end