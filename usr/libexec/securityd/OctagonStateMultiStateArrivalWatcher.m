@interface OctagonStateMultiStateArrivalWatcher
- (BOOL)completed;
- (BOOL)timeoutCanOccur;
- (CKKSResultOperation)result;
- (NSDictionary)failStates;
- (NSOperationQueue)operationQueue;
- (NSSet)states;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5;
- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6;
- (void)completeWithErrorIfPending:(id)a3;
- (void)onqueueEnterState:(id)a3;
- (void)onqueueHandleStartTimeout:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueStartFinishOperation:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
@end

@implementation OctagonStateMultiStateArrivalWatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_failStates, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSDictionary)failStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)states
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (CKKSResultOperation)result
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)completeWithErrorIfPending:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMultiStateArrivalWatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C04F8;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)onqueueStartFinishOperation:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMultiStateArrivalWatcher *)self queue];
  dispatch_assert_queue_V2(v5);

  [(OctagonStateMultiStateArrivalWatcher *)self setTimeoutCanOccur:0];
  id v6 = [(OctagonStateMultiStateArrivalWatcher *)self result];
  [v6 setError:v4];

  v7 = [(OctagonStateMultiStateArrivalWatcher *)self operationQueue];
  id v8 = [(OctagonStateMultiStateArrivalWatcher *)self result];
  [v7 addOperation:v8];

  [(OctagonStateMultiStateArrivalWatcher *)self setCompleted:1];
}

- (void)onqueueHandleStartTimeout:(id)a3
{
  id v9 = a3;
  id v4 = [(OctagonStateMultiStateArrivalWatcher *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(OctagonStateMultiStateArrivalWatcher *)self timeoutCanOccur])
  {
    [(OctagonStateMultiStateArrivalWatcher *)self setTimeoutCanOccur:0];
    v5 = [(OctagonStateMultiStateArrivalWatcher *)self name];
    id v6 = [(OctagonStateMultiStateArrivalWatcher *)self states];
    v7 = +[NSString stringWithFormat:@"Operation(%@) timed out waiting to start for any state in [%@]", v5, v6];

    id v8 = +[NSError errorWithDomain:@"CKKSResultOperationError" code:3 description:v7 underlying:v9];
    [(OctagonStateMultiStateArrivalWatcher *)self onqueueStartFinishOperation:v8];
  }
}

- (void)onqueueEnterState:(id)a3
{
  id v8 = a3;
  if (![(OctagonStateMultiStateArrivalWatcher *)self completed])
  {
    id v4 = [(OctagonStateMultiStateArrivalWatcher *)self states];
    unsigned int v5 = [v4 containsObject:v8];

    if (v5)
    {
      id v6 = [(OctagonStateMultiStateArrivalWatcher *)self failStates];
      v7 = [v6 objectForKeyedSubscript:v8];

      [(OctagonStateMultiStateArrivalWatcher *)self onqueueStartFinishOperation:v7];
    }
  }
}

- (void)onqueueHandleTransition:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(OctagonStateMultiStateArrivalWatcher *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 nextState];

  [(OctagonStateMultiStateArrivalWatcher *)self onqueueEnterState:v6];
}

- (id)description
{
  v3 = [(OctagonStateMultiStateArrivalWatcher *)self name];
  id v4 = [(OctagonStateMultiStateArrivalWatcher *)self states];
  unsigned int v5 = [(OctagonStateMultiStateArrivalWatcher *)self result];
  id v6 = +[NSString stringWithFormat:@"<OctagonStateMultiStateArrivalWatcher(%@): states: %@, result: %@>", v3, v4, v5];

  return v6;
}

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)OctagonStateMultiStateArrivalWatcher;
  v15 = [(OctagonStateMultiStateArrivalWatcher *)&v26 init];
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
    uint64_t v21 = +[CKKSResultOperation named:v20 withBlock:&stru_1002F9368];
    v22 = v16->_result;
    v16->_result = (CKKSResultOperation *)v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v23;

    objc_storeStrong((id *)&v16->_queue, a4);
    *(_WORD *)&v16->_completed = 256;
  }

  return v16;
}

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5
{
  return [(OctagonStateMultiStateArrivalWatcher *)self initNamed:a3 serialQueue:a4 states:a5 failStates:&__NSDictionary0__struct];
}

@end