@interface OctagonStateTransitionWatcher
- (BOOL)active;
- (BOOL)completed;
- (BOOL)timeoutCanOccur;
- (CKKSResultOperation)result;
- (NSDictionary)stateNumberMap;
- (NSOperationQueue)operationQueue;
- (NSString)name;
- (NSString)unexpectedStateErrorDomain;
- (OS_dispatch_queue)queue;
- (OctagonStateTransitionPath)intendedPath;
- (OctagonStateTransitionPathStep)remainingPath;
- (OctagonStateTransitionRequest)initialRequest;
- (id)description;
- (id)initNamed:(id)a3 stateMachine:(id)a4 path:(id)a5 initialRequest:(id)a6;
- (void)onqueueHandleStartTimeout:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueProcessTransition:(id)a3;
- (void)onqueueStartFinishOperation;
- (void)setActive:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setInitialRequest:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemainingPath:(id)a3;
- (void)setStateNumberMap:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setUnexpectedStateErrorDomain:(id)a3;
@end

@implementation OctagonStateTransitionWatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unexpectedStateErrorDomain, 0);
  objc_storeStrong((id *)&self->_stateNumberMap, 0);
  objc_storeStrong((id *)&self->_initialRequest, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_remainingPath, 0);
  objc_storeStrong((id *)&self->_intendedPath, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setUnexpectedStateErrorDomain:(id)a3
{
}

- (NSString)unexpectedStateErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStateNumberMap:(id)a3
{
}

- (NSDictionary)stateNumberMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitialRequest:(id)a3
{
}

- (OctagonStateTransitionRequest)initialRequest
{
  return (OctagonStateTransitionRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRemainingPath:(id)a3
{
}

- (OctagonStateTransitionPathStep)remainingPath
{
  return (OctagonStateTransitionPathStep *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (OctagonStateTransitionPath)intendedPath
{
  return (OctagonStateTransitionPath *)objc_getProperty(self, a2, 32, 1);
}

- (CKKSResultOperation)result
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)onqueueStartFinishOperation
{
  v3 = [(OctagonStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v3);

  [(OctagonStateTransitionWatcher *)self setTimeoutCanOccur:0];
  v4 = [(OctagonStateTransitionWatcher *)self operationQueue];
  v5 = [(OctagonStateTransitionWatcher *)self result];
  [v4 addOperation:v5];

  [(OctagonStateTransitionWatcher *)self setActive:0];

  [(OctagonStateTransitionWatcher *)self setCompleted:1];
}

- (void)onqueueProcessTransition:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(OctagonStateTransitionWatcher *)self remainingPath];
  if (v6)
  {
    v7 = (void *)v6;
    unsigned __int8 v8 = [(OctagonStateTransitionWatcher *)self completed];

    if ((v8 & 1) == 0)
    {
      v9 = [(OctagonStateTransitionWatcher *)self remainingPath];
      v10 = [v4 nextState];
      v11 = [v9 nextStep:v10];

      if (v11)
      {
        [(OctagonStateTransitionWatcher *)self setRemainingPath:v11];
        v12 = [(OctagonStateTransitionWatcher *)self remainingPath];
        unsigned int v13 = [v12 successState];

        if (v13) {
          [(OctagonStateTransitionWatcher *)self onqueueStartFinishOperation];
        }
      }
      else
      {
        v14 = [v4 error];

        if (v14)
        {
          v15 = [v4 error];
          v16 = [(OctagonStateTransitionWatcher *)self result];
          [v16 setError:v15];
        }
        else
        {
          v17 = [(OctagonStateTransitionWatcher *)self stateNumberMap];
          v18 = [v4 nextState];
          v15 = [v17 objectForKeyedSubscript:v18];

          v19 = &SecPolicyXPCArrayCopyArray_ptr;
          if (v15)
          {
            v20 = [(OctagonStateTransitionWatcher *)self unexpectedStateErrorDomain];
            id v21 = [v15 integerValue];
            v22 = [v4 nextState];
            v23 = +[NSString stringWithFormat:@"unexpected state '%@'", v22];
            v16 = +[NSError errorWithDomain:v20 code:v21 description:v23];

            v19 = &SecPolicyXPCArrayCopyArray_ptr;
          }
          else
          {
            v16 = 0;
          }
          v24 = v19[500];
          v25 = [v4 nextState];
          v26 = [(OctagonStateTransitionWatcher *)self remainingPath];
          v27 = +[NSString stringWithFormat:@"state became %@, was expecting %@", v25, v26];
          v28 = [v24 errorWithDomain:@"com.apple.security.octagon" code:30 description:v27 underlying:v16];
          v29 = [(OctagonStateTransitionWatcher *)self result];
          [v29 setError:v28];
        }
        v30 = +[CKKSAnalytics logger];
        v38 = [(OctagonStateTransitionWatcher *)self result];
        v31 = [v38 error];
        v39[0] = @"name";
        v32 = [(OctagonStateTransitionWatcher *)self name];
        v40[0] = v32;
        v39[1] = @"intended";
        v33 = [(OctagonStateTransitionWatcher *)self remainingPath];
        v34 = [v33 followStates];
        v35 = [v34 allKeys];
        v40[1] = v35;
        v39[2] = @"became";
        v36 = [v4 nextState];
        v40[2] = v36;
        v37 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
        [v30 logUnrecoverableError:v31 forEvent:@"OctagonEventStateTransition" withAttributes:v37];

        [(OctagonStateTransitionWatcher *)self onqueueStartFinishOperation];
        v11 = 0;
      }
    }
  }
}

- (void)onqueueHandleStartTimeout:(id)a3
{
  id v10 = a3;
  id v4 = [(OctagonStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(OctagonStateTransitionWatcher *)self timeoutCanOccur])
  {
    [(OctagonStateTransitionWatcher *)self setTimeoutCanOccur:0];
    v5 = [(OctagonStateTransitionWatcher *)self name];
    uint64_t v6 = [(OctagonStateTransitionWatcher *)self remainingPath];
    v7 = +[NSString stringWithFormat:@"Operation(%@) timed out waiting to start for [%@]", v5, v6];

    unsigned __int8 v8 = +[NSError errorWithDomain:@"CKKSResultOperationError" code:3 description:v7 underlying:v10];
    v9 = [(OctagonStateTransitionWatcher *)self result];
    [v9 setError:v8];

    [(OctagonStateTransitionWatcher *)self onqueueStartFinishOperation];
  }
}

- (void)onqueueHandleTransition:(id)a3
{
  id v12 = a3;
  id v4 = [(OctagonStateTransitionWatcher *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(OctagonStateTransitionWatcher *)self remainingPath];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    unsigned __int8 v7 = [(OctagonStateTransitionWatcher *)self completed];

    if ((v7 & 1) == 0)
    {
      if (![(OctagonStateTransitionWatcher *)self active])
      {
        unsigned __int8 v8 = [v12 nextState];
        v9 = [(OctagonStateTransitionWatcher *)self intendedPath];
        id v10 = [v9 initialState];
        unsigned int v11 = [v8 isEqualToString:v10];

        if (!v11) {
          goto LABEL_7;
        }
        [(OctagonStateTransitionWatcher *)self setActive:1];
      }
      [(OctagonStateTransitionWatcher *)self onqueueProcessTransition:v12];
    }
  }
LABEL_7:
}

- (id)description
{
  v3 = [(OctagonStateTransitionWatcher *)self name];
  id v4 = [(OctagonStateTransitionWatcher *)self remainingPath];
  uint64_t v5 = [(OctagonStateTransitionWatcher *)self result];
  uint64_t v6 = +[NSString stringWithFormat:@"<OctagonStateTransitionWatcher(%@): remaining: %@, result: %@>", v3, v4, v5];

  return v6;
}

- (id)initNamed:(id)a3 stateMachine:(id)a4 path:(id)a5 initialRequest:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)OctagonStateTransitionWatcher;
  v15 = [(OctagonStateTransitionWatcher *)&v31 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_intendedPath, a5);
    uint64_t v17 = [v13 asPathStep];
    remainingPath = v16->_remainingPath;
    v16->_remainingPath = (OctagonStateTransitionPathStep *)v17;

    v19 = +[NSString stringWithFormat:@"watcher-%@", v11];
    uint64_t v20 = +[CKKSResultOperation named:v19 withBlock:&stru_1002F9348];
    id v21 = v16->_result;
    v16->_result = (CKKSResultOperation *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    uint64_t v24 = [v12 queue];
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v24;

    uint64_t v26 = [v12 stateNumberMap];
    stateNumberMap = v16->_stateNumberMap;
    v16->_stateNumberMap = (NSDictionary *)v26;

    uint64_t v28 = [v12 unexpectedStateErrorDomain];
    unexpectedStateErrorDomain = v16->_unexpectedStateErrorDomain;
    v16->_unexpectedStateErrorDomain = (NSString *)v28;

    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_initialRequest, a6);
    *(_WORD *)&v16->_active = 0;
  }

  return v16;
}

@end