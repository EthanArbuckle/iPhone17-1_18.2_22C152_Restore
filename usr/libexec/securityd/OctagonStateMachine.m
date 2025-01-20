@interface OctagonStateMachine
- (BOOL)allowPendingFlags;
- (BOOL)halted;
- (BOOL)isPaused;
- (CKKSCondition)paused;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)pendingFlagsScheduler;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSResultOperation)nextStateMachineCycleOperation;
- (NSDictionary)stateConditions;
- (NSDictionary)stateNumberMap;
- (NSMutableArray)stateMachineRequests;
- (NSMutableArray)stateMachineWatchers;
- (NSMutableDictionary)mutableStateConditions;
- (NSMutableDictionary)pendingFlags;
- (NSMutableSet)testHoldStates;
- (NSOperation)checkReachabilityOperation;
- (NSOperation)checkUnlockOperation;
- (NSOperation)holdStateMachineOperation;
- (NSOperationQueue)operationQueue;
- (NSSet)allowableStates;
- (NSString)name;
- (NSString)unexpectedStateErrorDomain;
- (OS_dispatch_queue)queue;
- (OctagonFlags)currentFlags;
- (OctagonStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 unexpectedStateErrorDomain:(id)a9 lockStateTracker:(id)a10 reachabilityTracker:(id)a11;
- (OctagonStateMachineEngine)stateEngine;
- (OctagonStateString)currentState;
- (id)_onqueueNextStateMachineTransition;
- (id)createOperationToFinishAttempt:(id)a3;
- (id)description;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7;
- (id)dumpPendingFlags;
- (id)pendingFlagsString;
- (id)possiblePendingFlags;
- (id)timeoutErrorForState:(id)a3;
- (id)waitForState:(id)a3 wait:(unint64_t)a4;
- (unint64_t)conditionChecksInFlight;
- (unint64_t)currentConditions;
- (unint64_t)timeout;
- (void)_onqueueHandleFlag:(id)a3;
- (void)_onqueueHandlePendingFlag:(id)a3;
- (void)_onqueueHandlePendingFlagLater:(id)a3;
- (void)_onqueuePokeStateMachine;
- (void)_onqueueRecheckConditions;
- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4;
- (void)_onqueueSendAnyPendingFlags;
- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3;
- (void)disablePendingFlags;
- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6;
- (void)haltOperation;
- (void)handleExternalRequest:(id)a3 startTimeout:(unint64_t)a4;
- (void)handleFlag:(id)a3;
- (void)handlePendingFlag:(id)a3;
- (void)pokeStateMachine;
- (void)registerMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4;
- (void)registerStateTransitionWatcher:(id)a3 startTimeout:(unint64_t)a4;
- (void)setAllowPendingFlags:(BOOL)a3;
- (void)setCheckReachabilityOperation:(id)a3;
- (void)setCheckUnlockOperation:(id)a3;
- (void)setConditionChecksInFlight:(unint64_t)a3;
- (void)setCurrentConditions:(unint64_t)a3;
- (void)setCurrentFlags:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHoldStateMachineOperation:(id)a3;
- (void)setMutableStateConditions:(id)a3;
- (void)setName:(id)a3;
- (void)setNextStateMachineCycleOperation:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPaused:(id)a3;
- (void)setPendingFlags:(id)a3;
- (void)setPendingFlagsScheduler:(id)a3;
- (void)setStateEngine:(id)a3;
- (void)setStateMachineRequests:(id)a3;
- (void)setStateMachineWatchers:(id)a3;
- (void)setTestHoldStates:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setWatcherTimeout:(unint64_t)a3;
- (void)startOperation;
- (void)testPauseStateMachineAfterEntering:(id)a3;
- (void)testReleaseStateMachinePause:(id)a3;
@end

@implementation OctagonStateMachine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkReachabilityOperation, 0);
  objc_storeStrong((id *)&self->_checkUnlockOperation, 0);
  objc_storeStrong((id *)&self->_pendingFlagsScheduler, 0);
  objc_storeStrong((id *)&self->_pendingFlags, 0);
  objc_storeStrong((id *)&self->_stateMachineWatchers, 0);
  objc_storeStrong((id *)&self->_stateMachineRequests, 0);
  objc_storeStrong((id *)&self->_nextStateMachineCycleOperation, 0);
  objc_storeStrong((id *)&self->_testHoldStates, 0);
  objc_storeStrong((id *)&self->_holdStateMachineOperation, 0);
  objc_storeStrong((id *)&self->_currentFlags, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_mutableStateConditions, 0);
  objc_destroyWeak((id *)&self->_stateEngine);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_unexpectedStateErrorDomain, 0);
  objc_storeStrong((id *)&self->_stateNumberMap, 0);
  objc_storeStrong((id *)&self->_allowableStates, 0);
  objc_storeStrong((id *)&self->_paused, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)setCheckReachabilityOperation:(id)a3
{
}

- (NSOperation)checkReachabilityOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCheckUnlockOperation:(id)a3
{
}

- (NSOperation)checkUnlockOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCurrentConditions:(unint64_t)a3
{
  self->_currentConditions = a3;
}

- (unint64_t)currentConditions
{
  return self->_currentConditions;
}

- (void)setConditionChecksInFlight:(unint64_t)a3
{
  self->_conditionChecksInFlight = a3;
}

- (unint64_t)conditionChecksInFlight
{
  return self->_conditionChecksInFlight;
}

- (void)setPendingFlagsScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)pendingFlagsScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPendingFlags:(id)a3
{
}

- (NSMutableDictionary)pendingFlags
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAllowPendingFlags:(BOOL)a3
{
  self->_allowPendingFlags = a3;
}

- (BOOL)allowPendingFlags
{
  return self->_allowPendingFlags;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setStateMachineWatchers:(id)a3
{
}

- (NSMutableArray)stateMachineWatchers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStateMachineRequests:(id)a3
{
}

- (NSMutableArray)stateMachineRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNextStateMachineCycleOperation:(id)a3
{
}

- (CKKSResultOperation)nextStateMachineCycleOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTestHoldStates:(id)a3
{
}

- (NSMutableSet)testHoldStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setHoldStateMachineOperation:(id)a3
{
}

- (NSOperation)holdStateMachineOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentFlags:(id)a3
{
}

- (OctagonFlags)currentFlags
{
  return (OctagonFlags *)objc_getProperty(self, a2, 120, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMutableStateConditions:(id)a3
{
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStateEngine:(id)a3
{
}

- (OctagonStateMachineEngine)stateEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateEngine);

  return (OctagonStateMachineEngine *)WeakRetained;
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 80, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (NSString)unexpectedStateErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)stateNumberMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPaused:(id)a3
{
}

- (CKKSCondition)paused
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = [(OctagonStateMachine *)self name];
  v18 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v17, @"state-rpc"]);

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Beginning a '%@' rpc", buf, 0xCu);
  }

  v19 = [(OctagonStateMachine *)self lockStateTracker];

  if (v19)
  {
    v20 = [(OctagonStateMachine *)self lockStateTracker];
    [v20 recheck];
  }
  v21 = [OctagonStateTransitionRequest alloc];
  v22 = [(OctagonStateMachine *)self queue];
  id v23 = [(OctagonStateTransitionRequest *)v21 init:v12 sourceStates:v16 serialQueue:v22 transitionOp:v14];

  v24 = [OctagonStateTransitionWatcher alloc];
  v25 = +[NSString stringWithFormat:@"watcher-%@", v12];
  id v26 = [(OctagonStateTransitionWatcher *)v24 initNamed:v25 stateMachine:self path:v15 initialRequest:v23];

  unint64_t v27 = [(OctagonStateMachine *)self timeout];
  if (v27) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = 120000000000;
  }
  [(OctagonStateMachine *)self registerStateTransitionWatcher:v26 startTimeout:v28];
  v29 = +[NSString stringWithFormat:@"%@-callback", v12];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10011F500;
  v39[3] = &unk_1002FADB8;
  v39[4] = self;
  id v40 = v12;
  id v41 = v26;
  id v42 = v13;
  id v30 = v13;
  id v31 = v26;
  id v32 = v12;
  v33 = +[CKKSResultOperation named:v29 withBlockTakingSelf:v39];

  v34 = [v31 result];
  [v33 addDependency:v34];

  v35 = [(OctagonStateMachine *)self operationQueue];
  [v35 addOperation:v33];

  unint64_t v36 = [(OctagonStateMachine *)self timeout];
  if (v36) {
    uint64_t v37 = v36;
  }
  else {
    uint64_t v37 = 120000000000;
  }
  [(OctagonStateMachine *)self handleExternalRequest:v23 startTimeout:v37];

  return v33;
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[NSString stringWithFormat:@"intial-transition-%@", v13];
  id v15 = [v11 initialState];
  id v16 = +[OctagonStateTransitionOperation named:v14 entering:v15];

  v17 = [(OctagonStateMachine *)self doWatchedStateMachineRPC:v13 sourceStates:v12 path:v11 transitionOp:v16 reply:v10];

  return v17;
}

- (void)setWatcherTimeout:(unint64_t)a3
{
}

- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(OctagonStateMachine *)self name];
  id v15 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v14, @"state-rpc"]);

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Beginning a '%@' rpc", buf, 0xCu);
  }

  id v16 = [(OctagonStateMachine *)self lockStateTracker];

  if (v16)
  {
    v17 = [(OctagonStateMachine *)self lockStateTracker];
    [v17 recheck];
  }
  v18 = [OctagonStateTransitionRequest alloc];
  v19 = [(OctagonStateMachine *)self queue];
  id v20 = [(OctagonStateTransitionRequest *)v18 init:v10 sourceStates:v12 serialQueue:v19 transitionOp:v11];

  [(OctagonStateMachine *)self handleExternalRequest:v20 startTimeout:30000000000];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v21 = +[NSString stringWithFormat:@"%@-callback", v10];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10011FAEC;
  v27[3] = &unk_1002FAD90;
  objc_copyWeak(&v31, (id *)buf);
  id v22 = v10;
  id v28 = v22;
  id v23 = v11;
  id v29 = v23;
  id v24 = v13;
  id v30 = v24;
  v25 = +[CKKSResultOperation named:v21 withBlock:v27];

  [v25 addDependency:v23];
  id v26 = [(OctagonStateMachine *)self operationQueue];
  [v26 addOperation:v25];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 states];
  v8 = [(OctagonStateMachine *)self currentState];
  unsigned int v9 = [v7 containsObject:v8];

  if (v9)
  {
    id v10 = [(OctagonStateMachine *)self currentState];
    [v6 onqueueEnterState:v10];
  }
  else
  {
    id v11 = [(OctagonStateMachine *)self stateMachineWatchers];
    [v11 addObject:v6];

    [(OctagonStateMachine *)self _onqueuePokeStateMachine];
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      dispatch_time_t v12 = dispatch_time(0, a4);
      id v13 = [(OctagonStateMachine *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10011FDE4;
      block[3] = &unk_100306AD0;
      objc_copyWeak(&v16, &location);
      id v15 = v6;
      dispatch_after(v12, v13, block);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void)registerMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FF28;
  block[3] = &unk_1003075B8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)registerStateTransitionWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FFF4;
  block[3] = &unk_1003075B8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)handleExternalRequest:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120270;
  block[3] = &unk_1003075B8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (id)timeoutErrorForState:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self stateNumberMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(OctagonStateMachine *)self unexpectedStateErrorDomain];
    id v8 = [v6 integerValue];
    unsigned int v9 = +[NSString stringWithFormat:@"Current state: '%@'", v4];
    id v10 = +[NSError errorWithDomain:v7 code:v8 description:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)haltOperation
{
  v3 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001205C4;
  block[3] = &unk_100308558;
  void block[4] = self;
  dispatch_sync(v3, block);

  id v4 = [(OctagonStateMachine *)self nextStateMachineCycleOperation];
  [v4 waitUntilFinished];
}

- (void)startOperation
{
  v3 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001206F8;
  block[3] = &unk_100308558;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)isPaused
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(OctagonStateMachine *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10012086C;
  v5[3] = &unk_100307348;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)testReleaseStateMachinePause:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100120970;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)testPauseStateMachineAfterEntering:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100120B34;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueueSendAnyPendingFlags
{
  v3 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(OctagonStateMachine *)self allowPendingFlags])
  {
    id v4 = [(OctagonStateMachine *)self pendingFlags];
    v5 = [v4 allValues];
    id v6 = [v5 copy];

    id v44 = +[NSDate date];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v8)
    {

      goto LABEL_37;
    }
    id v9 = v8;
    id v10 = 0;
    char v42 = 0;
    uint64_t v11 = *(void *)v46;
    id obj = v7;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v46 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
      id v14 = [v13 fireTime];

      if (!v14)
      {
        BOOL v17 = 1;
        goto LABEL_16;
      }
      id v15 = [v13 fireTime];
      id v16 = [v15 compare:v44];

      BOOL v17 = v16 == (id)-1;
      if (v16 == (id)-1) {
        break;
      }
      uint64_t v18 = [v13 fireTime];
      v19 = v18;
      if (v10)
      {
        uint64_t v20 = [v10 earlierDate:v18];

        id v10 = (void *)v20;
LABEL_14:

        goto LABEL_16;
      }
      BOOL v17 = 0;
      id v10 = (void *)v18;
LABEL_16:
      id v23 = [v13 afterOperation];

      if (v23)
      {
        id v24 = [v13 afterOperation];
        unsigned int v25 = [v24 isFinished];

        if (v25)
        {
          id v26 = [(OctagonStateMachine *)self name];
          unint64_t v27 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v26, @"pending-flag"]);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = [v13 flag];
            id v29 = [v13 afterOperation];
            *(_DWORD *)buf = 138412546;
            v50 = v28;
            __int16 v51 = 2112;
            v52 = v29;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Operation has ended for pending flag %@: %@", buf, 0x16u);
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      if (![v13 conditions]) {
        goto LABEL_27;
      }
      unint64_t v30 = (unint64_t)[v13 conditions];
      id v31 = (id)([(OctagonStateMachine *)self currentConditions] & v30);
      if (v31 == [v13 conditions])
      {
        id v32 = [(OctagonStateMachine *)self name];
        v33 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v32, @"pending-flag"]);

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [v13 flag];
          *(_DWORD *)buf = 138412290;
          v50 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Conditions are right for %@", buf, 0xCu);
        }
LABEL_27:
        if (v17)
        {
          v35 = [(OctagonStateMachine *)self currentFlags];
          unint64_t v36 = [v13 flag];
          [v35 _onqueueSetFlag:v36];

          uint64_t v37 = [(OctagonStateMachine *)self pendingFlags];
          v38 = [v13 flag];
          [v37 setObject:0 forKeyedSubscript:v38];

          char v42 = 1;
        }
      }
      if (v9 == (id)++v12)
      {
        id v7 = obj;
        id v9 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (!v9)
        {

          if (v10)
          {
            [v10 timeIntervalSinceDate:v44];
            unint64_t v40 = (unint64_t)(v39 * 1000000000.0);
            id v41 = [(OctagonStateMachine *)self pendingFlagsScheduler];
            [v41 triggerAt:v40];

            if ((v42 & 1) == 0)
            {
LABEL_38:

              return;
            }
LABEL_36:
            [(OctagonStateMachine *)self _onqueuePokeStateMachine];
            goto LABEL_38;
          }
          if (v42) {
            goto LABEL_36;
          }
LABEL_37:
          id v10 = 0;
          goto LABEL_38;
        }
        goto LABEL_4;
      }
    }
    v21 = [(OctagonStateMachine *)self name];
    v19 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v21, @"pending-flag"]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v13 flag];
      *(_DWORD *)buf = 138412290;
      v50 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Delay has ended for pending flag %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
}

- (void)_onqueueRecheckConditions
{
  id v4 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(OctagonStateMachine *)self allowPendingFlags])
  {
    v5 = [(OctagonStateMachine *)self pendingFlags];
    id v6 = [v5 allValues];
    id v7 = [v6 copy];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v48;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          v10 |= (unint64_t)[*(id *)(*((void *)&v47 + 1) + 8 * i) conditions];
        }
        id v9 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v9);

      if (v10)
      {
        unsigned __int8 v13 = [(OctagonStateMachine *)self conditionChecksInFlight];
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        char v14 = v10 & ~v13;
        if (v14)
        {
          id v15 = [(OctagonStateMachine *)self lockStateTracker];
          BOOL v16 = v15 == 0;

          if (v16)
          {
            double v39 = +[NSAssertionHandler currentHandler];
            [v39 handleFailureInMethod:a2 object:self file:@"OctagonStateMachine.m" lineNumber:419 description:@"Must have a lock state tracker to wait for unlock"];
          }
          BOOL v17 = [(OctagonStateMachine *)self lockStateTracker];
          unsigned int v18 = [v17 isLocked];

          if (v18)
          {
            v19 = [(OctagonStateMachine *)self name];
            uint64_t v20 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v19, @"pending-flag"]);

            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Waiting for unlock", buf, 2u);
            }

            [(OctagonStateMachine *)self setCurrentConditions:[(OctagonStateMachine *)self currentConditions] & 0xFFFFFFFFFFFFFFFELL];
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_100121758;
            v43[3] = &unk_1003077A0;
            objc_copyWeak(&v44, &location);
            v21 = +[NSBlockOperation blockOperationWithBlock:v43];
            [(OctagonStateMachine *)self setCheckUnlockOperation:v21];

            [(OctagonStateMachine *)self setConditionChecksInFlight:[(OctagonStateMachine *)self conditionChecksInFlight] | 1];
            id v22 = [(OctagonStateMachine *)self checkUnlockOperation];
            id v23 = [(OctagonStateMachine *)self lockStateTracker];
            id v24 = [v23 unlockDependency];
            [v22 addNullableDependency:v24];

            unsigned int v25 = [(OctagonStateMachine *)self operationQueue];
            id v26 = [(OctagonStateMachine *)self checkUnlockOperation];
            [v25 addOperation:v26];

            objc_destroyWeak(&v44);
          }
          else
          {
            [(OctagonStateMachine *)self setCurrentConditions:[(OctagonStateMachine *)self currentConditions] | 1];
          }
        }
        if ((v14 & 2) != 0)
        {
          unint64_t v27 = [(OctagonStateMachine *)self reachabilityTracker];
          BOOL v28 = v27 == 0;

          if (v28)
          {
            unint64_t v40 = +[NSAssertionHandler currentHandler];
            [v40 handleFailureInMethod:a2 object:self file:@"OctagonStateMachine.m" lineNumber:447 description:@"Must have a network reachability tracker to use network reachability pending flags"];
          }
          id v29 = [(OctagonStateMachine *)self reachabilityTracker];
          unsigned __int8 v30 = [v29 currentReachability];

          if (v30)
          {
            [(OctagonStateMachine *)self setCurrentConditions:[(OctagonStateMachine *)self currentConditions] | 2];
          }
          else
          {
            id v31 = [(OctagonStateMachine *)self name];
            id v32 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v31, @"pending-flag"]);

            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Waiting for network reachability", buf, 2u);
            }

            [(OctagonStateMachine *)self setCurrentConditions:[(OctagonStateMachine *)self currentConditions] & 0xFFFFFFFFFFFFFFFDLL];
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_1001217F4;
            v41[3] = &unk_1003077A0;
            objc_copyWeak(&v42, &location);
            v33 = +[NSBlockOperation blockOperationWithBlock:v41];
            [(OctagonStateMachine *)self setCheckReachabilityOperation:v33];

            [(OctagonStateMachine *)self setConditionChecksInFlight:[(OctagonStateMachine *)self conditionChecksInFlight] | 2];
            v34 = [(OctagonStateMachine *)self checkReachabilityOperation];
            v35 = [(OctagonStateMachine *)self reachabilityTracker];
            unint64_t v36 = [v35 reachabilityDependency];
            [v34 addNullableDependency:v36];

            uint64_t v37 = [(OctagonStateMachine *)self operationQueue];
            v38 = [(OctagonStateMachine *)self checkReachabilityOperation];
            [v37 addOperation:v38];

            objc_destroyWeak(&v42);
          }
        }
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

- (id)possiblePendingFlags
{
  v2 = [(OctagonStateMachine *)self pendingFlags];
  v3 = [v2 allKeys];

  return v3;
}

- (id)dumpPendingFlags
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100121BC4;
  uint64_t v11 = sub_100121BD4;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v12 = +[NSMutableDictionary dictionary];
  v3 = [(OctagonStateMachine *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100121BDC;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)disablePendingFlags
{
  v3 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121DC8;
  block[3] = &unk_100308558;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueueHandlePendingFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OctagonStateMachine *)self pendingFlags];
  uint64_t v7 = [v4 flag];
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = [v4 afterOperation];

  if (v8)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    char v14 = sub_100121F84;
    id v15 = &unk_1003077A0;
    objc_copyWeak(&v16, &location);
    uint64_t v9 = +[NSBlockOperation blockOperationWithBlock:&v12];
    uint64_t v10 = [v4 afterOperation:v12, v13, v14, v15];
    [v9 addNullableDependency:v10];

    uint64_t v11 = [(OctagonStateMachine *)self operationQueue];
    [v11 addOperation:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  [(OctagonStateMachine *)self _onqueueRecheckConditions];
  [(OctagonStateMachine *)self _onqueueSendAnyPendingFlags];
}

- (void)_onqueueHandlePendingFlagLater:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OctagonStateMachine *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012219C;
  v8[3] = &unk_100305930;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)handlePendingFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012225C;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueueHandleFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OctagonStateMachine *)self currentFlags];
  [v6 _onqueueSetFlag:v4];

  [(OctagonStateMachine *)self _onqueuePokeStateMachine];
}

- (void)handleFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100122398;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueuePokeStateMachine
{
  v3 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  [(OctagonStateMachine *)self _onqueueStartNextStateMachineOperation:0];
}

- (void)pokeStateMachine
{
  v3 = [(OctagonStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122478;
  block[3] = &unk_100308558;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)createOperationToFinishAttempt:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001225D8;
  v9[3] = &unk_100306AD0;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  id v6 = +[CKKSResultOperation named:@"octagon-state-follow-up" withBlock:v9];
  id v7 = [(OctagonStateMachine *)self holdStateMachineOperation];
  [v6 addNullableDependency:v7];

  [v6 addNullableDependency:v5];
  [v6 setQualityOfService:25];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3
{
  id v5 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OctagonStateMachine *)self nextStateMachineCycleOperation];

  if (!v6)
  {
    id v7 = [(OctagonStateMachine *)self testHoldStates];
    id v8 = [(OctagonStateMachine *)self currentState];
    unsigned int v9 = [v7 containsObject:v8];

    if (v9)
    {
      id v10 = [(OctagonStateMachine *)self name];
      id v11 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v10, @"state"]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(OctagonStateMachine *)self currentState];
        *(_DWORD *)buf = 138412290;
        BOOL v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In test hold for state %@; pausing",
          buf,
          0xCu);
      }
      uint64_t v13 = [(OctagonStateMachine *)self paused];
      [v13 fulfill];
    }
    else
    {
      uint64_t v13 = [(OctagonStateMachine *)self _onqueueNextStateMachineTransition];
      char v14 = [(OctagonStateMachine *)self name];
      id v15 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v14, @"state"]);

      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412290;
          BOOL v28 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Beginning state transition attempt %@", buf, 0xCu);
        }

        BOOL v17 = [(OctagonStateMachine *)self createOperationToFinishAttempt:v13];
        [(OctagonStateMachine *)self setNextStateMachineCycleOperation:v17];

        unsigned int v18 = [(OctagonStateMachine *)self operationQueue];
        v19 = [(OctagonStateMachine *)self nextStateMachineCycleOperation];
        [v18 addOperation:v19];

        uint64_t v20 = [(OctagonStateMachine *)self holdStateMachineOperation];
        [v13 addNullableDependency:v20];

        [v13 setQualityOfService:25];
        v21 = [(OctagonStateMachine *)self operationQueue];
        [v21 addOperation:v13];

        if (a3) {
          goto LABEL_15;
        }
        id v22 = objc_alloc_init(CKKSCondition);
        [(OctagonStateMachine *)self setPaused:v22];
      }
      else
      {
        if (v16)
        {
          id v23 = [(OctagonStateMachine *)self currentState];
          id v24 = [(OctagonStateMachine *)self currentFlags];
          unsigned int v25 = [v24 contentsAsString];
          id v26 = [(OctagonStateMachine *)self pendingFlagsString];
          *(_DWORD *)buf = 138412802;
          BOOL v28 = v23;
          __int16 v29 = 2112;
          unsigned __int8 v30 = v25;
          __int16 v31 = 2112;
          id v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "State machine rests (%@, f:[%@] p:[%@])", buf, 0x20u);
        }
        id v22 = [(OctagonStateMachine *)self paused];
        [(CKKSCondition *)v22 fulfill];
      }
    }
LABEL_15:
  }
}

- (id)_onqueueNextStateMachineTransition
{
  v3 = [(OctagonStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(OctagonStateMachine *)self halted])
  {
    id v4 = [(OctagonStateMachine *)self currentState];
    unsigned __int8 v5 = [v4 isEqualToString:@"halted"];

    if (v5)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = +[OctagonStateTransitionOperation named:@"halt" entering:@"halted"];
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [(OctagonStateMachine *)self stateMachineRequests];
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v13 = [v12 sourceStates];
          char v14 = [(OctagonStateMachine *)self currentState];
          unsigned int v15 = [v13 containsObject:v14];

          if (v15)
          {
            uint64_t v16 = [v12 _onqueueStart];
            if (v16)
            {
              id v6 = (void *)v16;
              v19 = [(OctagonStateMachine *)self name];
              uint64_t v20 = sub_10000B100((const __CFString *)+[NSString stringWithFormat:@"%@-%@", v19, @"state"]);

              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = [(OctagonStateMachine *)self currentState];
                *(_DWORD *)buf = 138412546;
                BOOL v28 = v12;
                __int16 v29 = 2112;
                unsigned __int8 v30 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Running state machine request %@ (from %@)", buf, 0x16u);
              }
              goto LABEL_17;
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v7 = [(OctagonStateMachine *)self stateEngine];
    BOOL v17 = [(OctagonStateMachine *)self currentState];
    unsigned int v18 = [(OctagonStateMachine *)self currentFlags];
    id v6 = [v7 _onqueueNextStateMachineTransition:v17 flags:v18 pendingFlags:self];

LABEL_17:
  }

  return v6;
}

- (id)waitForState:(id)a3 wait:(unint64_t)a4
{
  id v6 = (OctagonStateString *)a3;
  id v7 = [(OctagonStateMachine *)self stateConditions];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = [v8 wait:a4];

  currentState = v6;
  if (v9) {
    currentState = self->_currentState;
  }
  id v11 = currentState;

  return v11;
}

- (void)setCurrentState:(id)a3
{
  unint64_t v6 = (unint64_t)a3;
  if (v6 | (unint64_t)self->_currentState)
  {
    unint64_t v14 = v6;
    if ((objc_msgSend((id)v6, "isEqualToString:") & 1) == 0)
    {
      if (self->_currentState)
      {
        id v7 = objc_alloc_init(CKKSCondition);
        id v8 = [(OctagonStateMachine *)self mutableStateConditions];
        [v8 setObject:v7 forKeyedSubscript:self->_currentState];
      }
      id v9 = [(OctagonStateMachine *)self allowableStates];
      unsigned __int8 v10 = [v9 containsObject:v14];

      if ((v10 & 1) == 0)
      {
        uint64_t v13 = +[NSAssertionHandler currentHandler];
        [v13 handleFailureInMethod:a2, self, @"OctagonStateMachine.m", 182, @"state machine tried to enter unknown state %@", v14 object file lineNumber description];
      }
      objc_storeStrong((id *)&self->_currentState, a3);
      if (v14)
      {
        id v11 = [(OctagonStateMachine *)self mutableStateConditions];
        id v12 = [v11 objectForKeyedSubscript:v14];
        [v12 fulfill];
      }
    }
  }

  _objc_release_x1();
}

- (OctagonStateString)currentState
{
  return self->_currentState;
}

- (id)description
{
  v3 = [(OctagonStateMachine *)self pendingFlags];
  id v4 = [v3 count];

  if (v4)
  {
    unsigned __int8 v5 = [(OctagonStateMachine *)self pendingFlagsString];
    unint64_t v6 = +[NSString stringWithFormat:@" (pending: %@)", v5];
  }
  else
  {
    unint64_t v6 = &stru_10030AA90;
  }
  id v7 = [(OctagonStateMachine *)self name];
  id v8 = [(OctagonStateMachine *)self currentState];
  id v9 = +[NSString stringWithFormat:@"<OctagonStateMachine(%@,%@,%@)>", v7, v8, v6];

  return v9;
}

- (id)pendingFlagsString
{
  v2 = [(OctagonStateMachine *)self pendingFlags];
  v3 = [v2 allValues];
  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (NSDictionary)stateConditions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned __int8 v10 = sub_100121BC4;
  id v11 = sub_100121BD4;
  id v12 = 0;
  v3 = [(OctagonStateMachine *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100123550;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (OctagonStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 unexpectedStateErrorDomain:(id)a9 lockStateTracker:(id)a10 reachabilityTracker:(id)a11
{
  id v61 = a3;
  id v65 = a4;
  id v62 = a5;
  id v60 = a6;
  id v64 = a7;
  id obj = a8;
  id v57 = a9;
  id v58 = a10;
  id v59 = a11;
  v73.receiver = self;
  v73.super_class = (Class)OctagonStateMachine;
  unsigned int v18 = [(OctagonStateMachine *)&v73 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_lockStateTracker, a10);
    objc_storeStrong((id *)&v19->_reachabilityTracker, a11);
    v19->_conditionChecksInFlight = 0;
    v19->_currentConditions = 0;
    id v20 = [v65 mutableCopy];
    [v20 setObject:&off_100325F48 forKeyedSubscript:@"not_started"];
    [v20 setObject:&off_100325F60 forKeyedSubscript:@"halted"];
    objc_storeStrong((id *)&v19->_stateNumberMap, v20);
    objc_storeStrong((id *)&v19->_unexpectedStateErrorDomain, a9);
    v21 = [v20 allKeys];
    uint64_t v22 = +[NSSet setWithArray:v21];
    allowableStates = v19->_allowableStates;
    v19->_allowableStates = (NSSet *)v22;

    objc_storeStrong((id *)&v19->_queue, a7);
    long long v24 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v24;

    long long v26 = [[OctagonFlags alloc] initWithQueue:v64 flags:v62];
    currentFlags = v19->_currentFlags;
    v19->_currentFlags = v26;

    objc_storeWeak((id *)&v19->_stateEngine, obj);
    uint64_t v28 = +[NSBlockOperation blockOperationWithBlock:&stru_1002FAD68];
    holdStateMachineOperation = v19->_holdStateMachineOperation;
    v19->_holdStateMachineOperation = (NSOperation *)v28;

    uint64_t v30 = +[NSMutableSet set];
    testHoldStates = v19->_testHoldStates;
    v19->_testHoldStates = (NSMutableSet *)v30;

    v19->_halted = 0;
    id v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableStateConditions = v19->_mutableStateConditions;
    v19->_mutableStateConditions = v32;

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v34 = [v20 allKeys];
    id v35 = [v34 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v70;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v70 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          double v39 = objc_alloc_init(CKKSCondition);
          unint64_t v40 = [(OctagonStateMachine *)v19 mutableStateConditions];
          [v40 setObject:v39 forKeyedSubscript:v38];
        }
        id v35 = [v34 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v35);
    }

    [(OctagonStateMachine *)v19 setCurrentState:@"not_started"];
    uint64_t v41 = +[NSMutableArray array];
    stateMachineRequests = v19->_stateMachineRequests;
    v19->_stateMachineRequests = (NSMutableArray *)v41;

    uint64_t v43 = +[NSMutableArray array];
    stateMachineWatchers = v19->_stateMachineWatchers;
    v19->_stateMachineWatchers = (NSMutableArray *)v43;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v19->_allowPendingFlags = 1;
    uint64_t v45 = +[NSMutableDictionary dictionary];
    pendingFlags = v19->_pendingFlags;
    v19->_pendingFlags = (NSMutableDictionary *)v45;

    long long v47 = [CKKSNearFutureScheduler alloc];
    long long v48 = +[NSString stringWithFormat:@"%@-pending-flag", v61, v57, v58];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100123B1C;
    v66[3] = &unk_1003077A0;
    objc_copyWeak(&v67, &location);
    long long v49 = [(CKKSNearFutureScheduler *)v47 initWithName:v48 delay:100000000 keepProcessAlive:0 dependencyDescriptionCode:1006 block:v66];
    pendingFlagsScheduler = v19->_pendingFlagsScheduler;
    v19->_pendingFlagsScheduler = v49;

    __int16 v51 = +[OctagonStateTransitionOperation named:@"initialize" entering:v60];
    [v51 addDependency:v19->_holdStateMachineOperation];
    [(NSOperationQueue *)v19->_operationQueue addOperation:v51];
    v52 = objc_alloc_init(CKKSCondition);
    paused = v19->_paused;
    v19->_paused = v52;

    uint64_t v54 = [(OctagonStateMachine *)v19 createOperationToFinishAttempt:v51];
    nextStateMachineCycleOperation = v19->_nextStateMachineCycleOperation;
    v19->_nextStateMachineCycleOperation = (CKKSResultOperation *)v54;

    [(NSOperationQueue *)v19->_operationQueue addOperation:v19->_nextStateMachineCycleOperation];
    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
  }
  return v19;
}

@end