@interface KTStateMultiStateArrivalWatcher
- (BOOL)completed;
- (BOOL)timeoutCanOccur;
- (KTResultOperation)initialTimeoutListenerOp;
- (KTResultOperation)result;
- (NSDictionary)failStates;
- (NSOperationQueue)operationQueue;
- (NSSet)states;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5;
- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6;
- (id)timeout:(unint64_t)a3;
- (void)_onqueuePerformTimeoutWithUnderlyingError;
- (void)completeWithErrorIfPending:(id)a3;
- (void)onqueueEnterState:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueStartFinishOperation:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setInitialTimeoutListenerOp:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
@end

@implementation KTStateMultiStateArrivalWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5
{
  return [(KTStateMultiStateArrivalWatcher *)self initNamed:a3 serialQueue:a4 states:a5 failStates:&__NSDictionary0__struct];
}

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)KTStateMultiStateArrivalWatcher;
  v15 = [(KTStateMultiStateArrivalWatcher *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v17 = [v14 allKeys];
    uint64_t v18 = [v13 setByAddingObjectsFromArray:v17];
    states = v16->_states;
    v16->_states = (NSSet *)v18;

    objc_storeStrong((id *)&v16->_failStates, a6);
    v20 = +[NSString stringWithFormat:@"watcher-%@", v11];
    uint64_t v21 = +[KTResultOperation named:v20 withBlock:&stru_10008E0E8];
    v22 = v16->_result;
    v16->_result = (KTResultOperation *)v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v23;

    objc_storeStrong((id *)&v16->_queue, a4);
    *(_WORD *)&v16->_completed = 256;
  }

  return v16;
}

- (id)description
{
  v3 = [(KTStateMultiStateArrivalWatcher *)self name];
  v4 = [(KTStateMultiStateArrivalWatcher *)self states];
  v5 = [(KTStateMultiStateArrivalWatcher *)self result];
  v6 = +[NSString stringWithFormat:@"<KTStateMultiStateArrivalWatcher(%@): states: %@, result: %@>", v3, v4, v5];

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v4 = a3;
  v5 = [(KTStateMultiStateArrivalWatcher *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 nextState];

  [(KTStateMultiStateArrivalWatcher *)self onqueueEnterState:v6];
}

- (void)onqueueEnterState:(id)a3
{
  id v8 = a3;
  if (![(KTStateMultiStateArrivalWatcher *)self completed])
  {
    id v4 = [(KTStateMultiStateArrivalWatcher *)self states];
    unsigned int v5 = [v4 containsObject:v8];

    if (v5)
    {
      id v6 = [(KTStateMultiStateArrivalWatcher *)self failStates];
      v7 = [v6 objectForKeyedSubscript:v8];

      [(KTStateMultiStateArrivalWatcher *)self onqueueStartFinishOperation:v7];
    }
  }
}

- (void)_onqueuePerformTimeoutWithUnderlyingError
{
  v3 = [(KTStateMultiStateArrivalWatcher *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(KTStateMultiStateArrivalWatcher *)self timeoutCanOccur])
  {
    [(KTStateMultiStateArrivalWatcher *)self setTimeoutCanOccur:0];
    id v4 = [(KTStateMultiStateArrivalWatcher *)self name];
    unsigned int v5 = [(KTStateMultiStateArrivalWatcher *)self states];
    id v7 = +[NSString stringWithFormat:@"Operation(%@) timed out waiting to start for any state in [%@]", v4, v5];

    id v6 = +[NSError errorWithDomain:@"KTResultOperationError" code:3 description:v7];
    [(KTStateMultiStateArrivalWatcher *)self onqueueStartFinishOperation:v6];
  }
}

- (id)timeout:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, a3);
  id v6 = [(KTStateMultiStateArrivalWatcher *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A94C;
  v8[3] = &unk_10008CAD8;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)onqueueStartFinishOperation:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(KTStateMultiStateArrivalWatcher *)self queue];
  dispatch_assert_queue_V2(v5);

  [(KTStateMultiStateArrivalWatcher *)self setTimeoutCanOccur:0];
  id v6 = [(KTStateMultiStateArrivalWatcher *)self result];
  [v6 setError:v4];

  id v7 = [(KTStateMultiStateArrivalWatcher *)self operationQueue];
  id v8 = [(KTStateMultiStateArrivalWatcher *)self result];
  [v7 addOperation:v8];

  [(KTStateMultiStateArrivalWatcher *)self setCompleted:1];
}

- (void)completeWithErrorIfPending:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(KTStateMultiStateArrivalWatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003AB00;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (KTResultOperation)result
{
  return (KTResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)states
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)failStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (KTResultOperation)initialTimeoutListenerOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 56, 1);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_initialTimeoutListenerOp, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_failStates, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end