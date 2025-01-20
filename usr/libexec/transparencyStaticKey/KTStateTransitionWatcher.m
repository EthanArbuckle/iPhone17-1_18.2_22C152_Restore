@interface KTStateTransitionWatcher
+ (id)stripUnexpectedPathError:(id)a3;
- (BOOL)active;
- (BOOL)completed;
- (BOOL)isExpectedFailure:(id)a3 expected:(id)a4;
- (BOOL)onqueueCheckExpectedFailure:(id)a3 attempt:(id)a4;
- (BOOL)timeoutCanOccur;
- (KTResultOperation)initialTimeoutListenerOp;
- (KTResultOperation)result;
- (KTSignalTermHandler)sigTerm;
- (KTStateTransitionPath)intendedPath;
- (KTStateTransitionPathStep)remainingPath;
- (KTStateTransitionRequest)initialRequest;
- (NSOperationQueue)operationQueue;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (id)description;
- (id)initNamed:(id)a3 serialQueue:(id)a4 path:(id)a5 initialRequest:(id)a6;
- (id)timeout:(unint64_t)a3;
- (void)_onqueuePerformTimeoutWithUnderlyingError:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueProcessTransition:(id)a3;
- (void)onqueueStartFinishOperation;
- (void)setActive:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setInitialRequest:(id)a3;
- (void)setInitialTimeoutListenerOp:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemainingPath:(id)a3;
- (void)setSigTerm:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setTimer:(id)a3;
@end

@implementation KTStateTransitionWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 path:(id)a5 initialRequest:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)KTStateTransitionWatcher;
  v15 = [(KTStateTransitionWatcher *)&v40 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_intendedPath, a5);
    uint64_t v17 = [v13 asPathStep];
    remainingPath = v16->_remainingPath;
    v16->_remainingPath = (KTStateTransitionPathStep *)v17;

    v19 = +[NSString stringWithFormat:@"watcher-%@", v11];
    uint64_t v20 = +[KTResultOperation named:v19 withBlock:&stru_10008E0C8];
    v21 = v16->_result;
    v16->_result = (KTResultOperation *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_initialRequest, a6);
    id location = 0;
    objc_initWeak(&location, v16);
    if (v14)
    {
      v24 = +[NSString stringWithFormat:@"watcher-timeout-%@", v11];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100039078;
      v36[3] = &unk_10008DAC8;
      objc_copyWeak(&v38, &location);
      id v25 = v14;
      id v37 = v25;
      uint64_t v26 = +[KTResultOperation named:v24 withBlock:v36];
      initialTimeoutListenerOp = v16->_initialTimeoutListenerOp;
      v16->_initialTimeoutListenerOp = (KTResultOperation *)v26;

      v28 = v16->_initialTimeoutListenerOp;
      v29 = [v25 transitionOperation];
      [(KTResultOperation *)v28 addDependency:v29];

      [(NSOperationQueue *)v16->_operationQueue addOperation:v16->_initialTimeoutListenerOp];
      objc_destroyWeak(&v38);
    }
    v30 = [KTSignalTermHandler alloc];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000391B4;
    v34[3] = &unk_10008CAD8;
    objc_copyWeak(&v35, &location);
    v31 = [(KTSignalTermHandler *)v30 initWithSIGTERMNotification:v34];
    sigTerm = v16->_sigTerm;
    v16->_sigTerm = v31;

    *(_WORD *)&v16->_active = 0;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (id)description
{
  v3 = [(KTStateTransitionWatcher *)self name];
  v4 = [(KTStateTransitionWatcher *)self remainingPath];
  v5 = [(KTStateTransitionWatcher *)self result];
  v6 = +[NSString stringWithFormat:@"<KTStateTransitionWatcher(%@): remaining: %@, result: %@>", v3, v4, v5];

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v12 = a3;
  v4 = [(KTStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(KTStateTransitionWatcher *)self remainingPath];
  if (v5)
  {
    v6 = (void *)v5;
    unsigned __int8 v7 = [(KTStateTransitionWatcher *)self completed];

    if ((v7 & 1) == 0)
    {
      if (![(KTStateTransitionWatcher *)self active])
      {
        v8 = [v12 nextState];
        v9 = [(KTStateTransitionWatcher *)self intendedPath];
        v10 = [v9 initialState];
        unsigned int v11 = [v8 isEqualToString:v10];

        if (!v11) {
          goto LABEL_7;
        }
        [(KTStateTransitionWatcher *)self setActive:1];
      }
      [(KTStateTransitionWatcher *)self onqueueProcessTransition:v12];
    }
  }
LABEL_7:
}

- (void)_onqueuePerformTimeoutWithUnderlyingError:(id)a3
{
  id v12 = a3;
  v4 = [(KTStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(KTStateTransitionWatcher *)self timer];

  if (v5)
  {
    v6 = [(KTStateTransitionWatcher *)self timer];
    dispatch_source_cancel(v6);

    [(KTStateTransitionWatcher *)self setTimer:0];
  }
  if ([(KTStateTransitionWatcher *)self timeoutCanOccur])
  {
    [(KTStateTransitionWatcher *)self setTimeoutCanOccur:0];
    unsigned __int8 v7 = [(KTStateTransitionWatcher *)self name];
    v8 = [(KTStateTransitionWatcher *)self remainingPath];
    v9 = +[NSString stringWithFormat:@"Operation(%@) timed out waiting to start for [%@]", v7, v8];

    v10 = +[NSError errorWithDomain:@"KTResultOperationError" code:3 description:v9 underlying:v12];
    unsigned int v11 = [(KTStateTransitionWatcher *)self result];
    [v11 setError:v10];

    [(KTStateTransitionWatcher *)self onqueueStartFinishOperation];
  }
}

- (id)timeout:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(KTStateTransitionWatcher *)self queue];
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  [(KTStateTransitionWatcher *)self setTimer:v6];

  unsigned __int8 v7 = [(KTStateTransitionWatcher *)self timer];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100039750;
  v15 = &unk_10008CAD8;
  objc_copyWeak(&v16, &location);
  dispatch_source_set_event_handler(v7, &v12);

  v8 = [(KTStateTransitionWatcher *)self timer];
  dispatch_time_t v9 = dispatch_time(0, a3);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);

  v10 = [(KTStateTransitionWatcher *)self timer];
  dispatch_resume(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (BOOL)isExpectedFailure:(id)a3 expected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 domain];
  dispatch_time_t v9 = [v6 domain];
  if (![v8 isEqual:v9])
  {

    goto LABEL_7;
  }
  id v10 = [v7 code];
  id v11 = [v6 code];

  if (v10 != v11)
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_36;
  }
  id v12 = [v7 userInfo];
  uint64_t v13 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (v13)
  {
    id v14 = [v6 userInfo];
    v15 = [v14 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v15) {
      BOOL v16 = [(KTStateTransitionWatcher *)self isExpectedFailure:v15 expected:v13];
    }
    else {
      BOOL v16 = 0;
    }
  }
  else
  {
    uint64_t v17 = [v7 userInfo];
    v18 = [v17 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey];

    if (v18)
    {
      v19 = [v6 userInfo];
      uint64_t v20 = [v19 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey];

      v34 = (void *)v20;
      if (v20)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id obj = v18;
        id v21 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v33 = *(void *)v40;
          v31 = v18;
          while (1)
          {
            uint64_t v23 = 0;
LABEL_13:
            if (*(void *)v40 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * v23);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v25 = v34;
            id v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (!v26) {
              break;
            }
            id v27 = v26;
            uint64_t v28 = *(void *)v36;
LABEL_17:
            uint64_t v29 = 0;
            while (1)
            {
              if (*(void *)v36 != v28) {
                objc_enumerationMutation(v25);
              }
              if ([(KTStateTransitionWatcher *)self isExpectedFailure:*(void *)(*((void *)&v35 + 1) + 8 * v29) expected:v24])
              {
                break;
              }
              if (v27 == (id)++v29)
              {
                id v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v27) {
                  goto LABEL_17;
                }
                goto LABEL_30;
              }
            }

            if ((id)++v23 != v22) {
              goto LABEL_13;
            }
            id v22 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
            BOOL v16 = 1;
            v18 = v31;
            uint64_t v13 = 0;
            if (!v22) {
              goto LABEL_33;
            }
          }
LABEL_30:

          BOOL v16 = 0;
          v18 = v31;
          uint64_t v13 = 0;
        }
        else
        {
          BOOL v16 = 1;
        }
LABEL_33:
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 1;
    }
  }
LABEL_36:

  return v16;
}

- (BOOL)onqueueCheckExpectedFailure:(id)a3 attempt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(KTStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v8);

  if (!v6 || ([v7 error], dispatch_time_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v15 = [(KTStateTransitionWatcher *)self remainingPath];
    uint64_t v16 = [v15 expectedFailure];
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      v18 = [v7 error];

      if (!v18)
      {
        id v11 = [(KTStateTransitionWatcher *)self remainingPath];
        v19 = +[NSString stringWithFormat:@"state %@, had unexpected success", v11];
        uint64_t v20 = +[NSError errorWithDomain:@"com.apple.transparency" code:-4713 description:v19];
        id v21 = [(KTStateTransitionWatcher *)self result];
        [v21 setError:v20];
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v11 = [(KTStateTransitionWatcher *)self remainingPath];
    uint64_t v22 = [v11 expectedFailure];
    if (v22)
    {
      v19 = (void *)v22;
      BOOL v14 = 1;
LABEL_15:

      goto LABEL_16;
    }
    id v26 = [v7 error];

    if (!v26)
    {
      BOOL v14 = 1;
      goto LABEL_17;
    }
    id v11 = [(KTStateTransitionWatcher *)self remainingPath];
    v19 = +[NSString stringWithFormat:@"state %@, had unexpected failure: expected no failure", v11];
    uint64_t v20 = [v7 error];
    id v21 = +[NSError errorWithDomain:@"com.apple.transparency" code:-4714 description:v19 underlying:v20];
    id v27 = [(KTStateTransitionWatcher *)self result];
    [v27 setError:v21];

LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
  id v10 = [(KTStateTransitionWatcher *)self remainingPath];
  id v11 = [v10 expectedFailure];

  id v12 = [v7 error];
  unsigned __int8 v13 = [(KTStateTransitionWatcher *)self isExpectedFailure:v12 expected:v6];

  if ((v13 & 1) == 0)
  {
    v19 = [(KTStateTransitionWatcher *)self remainingPath];
    uint64_t v20 = [v7 error];
    id v21 = +[NSString stringWithFormat:@"state %@, had unexpected error %@, expected %@", v19, v20, v11];
    uint64_t v23 = [v7 error];
    uint64_t v24 = +[NSError errorWithDomain:@"com.apple.transparency" code:-4712 description:v21 underlying:v23];
    id v25 = [(KTStateTransitionWatcher *)self result];
    [v25 setError:v24];

    goto LABEL_14;
  }
  BOOL v14 = 1;
LABEL_16:

LABEL_17:
  return v14;
}

+ (id)stripUnexpectedPathError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if (([v4 isEqual:@"com.apple.transparency"] & 1) != 0
    || [v3 code] == (id)-4711
    || [v3 code] == (id)-4712
    || [v3 code] == (id)-4713)
  {

LABEL_6:
    uint64_t v5 = [v3 userInfo];
    id v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = v3;
    }
    id v8 = v7;

    goto LABEL_10;
  }
  id v10 = [v3 code];

  if (v10 == (id)-4714) {
    goto LABEL_6;
  }
  id v8 = v3;
LABEL_10:

  return v8;
}

- (void)onqueueProcessTransition:(id)a3
{
  id v22 = a3;
  v4 = [(KTStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(KTStateTransitionWatcher *)self remainingPath];
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned __int8 v7 = [(KTStateTransitionWatcher *)self completed];

    if ((v7 & 1) == 0)
    {
      id v8 = [(KTStateTransitionWatcher *)self remainingPath];
      dispatch_time_t v9 = [v22 nextState];
      id v10 = [v8 nextStep:v9];

      if (v10)
      {
        id v11 = [(KTStateTransitionWatcher *)self remainingPath];
        id v12 = [v11 expectedFailure];
        unsigned int v13 = [(KTStateTransitionWatcher *)self onqueueCheckExpectedFailure:v12 attempt:v22];

        if (v13)
        {
          [(KTStateTransitionWatcher *)self setRemainingPath:v10];
          BOOL v14 = [(KTStateTransitionWatcher *)self remainingPath];
          unsigned __int8 v15 = [v14 successState];

          if ((v15 & 1) == 0) {
            goto LABEL_12;
          }
        }
      }
      else
      {
        uint64_t v16 = [v22 error];

        if (v16)
        {
          uint64_t v17 = [v22 error];
          v18 = [(KTStateTransitionWatcher *)self result];
          [v18 setError:v17];
        }
        else
        {
          uint64_t v17 = [v22 nextState];
          v18 = [(KTStateTransitionWatcher *)self remainingPath];
          v19 = +[NSString stringWithFormat:@"state became %@, was expecting %@", v17, v18];
          uint64_t v20 = +[NSError errorWithDomain:@"com.apple.transparency" code:-4711 description:v19];
          id v21 = [(KTStateTransitionWatcher *)self result];
          [v21 setError:v20];
        }
      }
      [(KTStateTransitionWatcher *)self onqueueStartFinishOperation];
LABEL_12:
    }
  }
}

- (void)onqueueStartFinishOperation
{
  id v3 = [(KTStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v3);

  [(KTStateTransitionWatcher *)self setTimeoutCanOccur:0];
  v4 = [(KTStateTransitionWatcher *)self sigTerm];
  [v4 unregister];

  [(KTStateTransitionWatcher *)self setSigTerm:0];
  uint64_t v5 = [(KTStateTransitionWatcher *)self timer];

  if (v5)
  {
    id v6 = [(KTStateTransitionWatcher *)self timer];
    dispatch_source_cancel(v6);

    [(KTStateTransitionWatcher *)self setTimer:0];
  }
  unsigned __int8 v7 = [(KTStateTransitionWatcher *)self operationQueue];
  id v8 = [(KTStateTransitionWatcher *)self result];
  [v7 addOperation:v8];

  [(KTStateTransitionWatcher *)self setActive:0];

  [(KTStateTransitionWatcher *)self setCompleted:1];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (KTResultOperation)result
{
  return (KTResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (KTStateTransitionPath)intendedPath
{
  return (KTStateTransitionPath *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (KTStateTransitionPathStep)remainingPath
{
  return (KTStateTransitionPathStep *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemainingPath:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (KTStateTransitionRequest)initialRequest
{
  return (KTStateTransitionRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInitialRequest:(id)a3
{
}

- (KTResultOperation)initialTimeoutListenerOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitialTimeoutListenerOp:(id)a3
{
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimer:(id)a3
{
}

- (KTSignalTermHandler)sigTerm
{
  return (KTSignalTermHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSigTerm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigTerm, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_initialTimeoutListenerOp, 0);
  objc_storeStrong((id *)&self->_initialRequest, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_remainingPath, 0);
  objc_storeStrong((id *)&self->_intendedPath, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end