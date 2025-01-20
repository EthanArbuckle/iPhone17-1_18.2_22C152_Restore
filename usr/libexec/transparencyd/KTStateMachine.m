@interface KTStateMachine
- (BOOL)allowPendingFlags;
- (BOOL)halted;
- (BOOL)isPaused;
- (KTCondition)paused;
- (KTFlags)currentFlags;
- (KTLockStateTracker)lockStateTracker;
- (KTNearFutureScheduler)pendingFlagsScheduler;
- (KTReachabilityTracker)reachabilityTracker;
- (KTResultOperation)nextStateMachineCycleOperation;
- (KTStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 idsConfigBag:(id)a11;
- (KTStateMachineEngine)stateEngine;
- (KTStateString)currentState;
- (NSDictionary)stateConditions;
- (NSMutableArray)stateMachineRequests;
- (NSMutableArray)stateMachineWatchers;
- (NSMutableDictionary)mutableStateConditions;
- (NSMutableDictionary)pendingFlags;
- (NSMutableSet)testHoldStates;
- (NSOperation)checkIDSDisableOperation;
- (NSOperation)checkReachabilityOperation;
- (NSOperation)checkUnlockOperation;
- (NSOperation)holdStateMachineOperation;
- (NSOperationQueue)operationQueue;
- (NSSet)allowableStates;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (TransparencyIDSConfigBag)idsConfigBag;
- (id)_onqueueNextStateMachineTransition;
- (id)createOperationToFinishAttempt:(id)a3;
- (id)description;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7;
- (id)dumpCurrentFlags;
- (id)dumpPendingFlags;
- (id)pendingFlagsString;
- (id)possiblePendingFlags;
- (id)waitForState:(id)a3 wait:(unint64_t)a4;
- (unint64_t)conditionChecksInFlight;
- (unint64_t)currentConditions;
- (unint64_t)timeout;
- (void)_onqueueCancelPendingFlag:(id)a3;
- (void)_onqueueHandleFlag:(id)a3;
- (void)_onqueueHandlePendingFlag:(id)a3;
- (void)_onqueueHandlePendingFlagLater:(id)a3;
- (void)_onqueuePokeStateMachine;
- (void)_onqueueRecheckConditions;
- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3;
- (void)_onqueueSendAnyPendingFlags;
- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3;
- (void)cancelPendingFlag:(id)a3;
- (void)disablePendingFlags;
- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6;
- (void)haltOperation;
- (void)handleExternalRequest:(id)a3;
- (void)handleFlag:(id)a3;
- (void)handlePendingFlag:(id)a3;
- (void)pokeStateMachine;
- (void)registerMultiStateArrivalWatcher:(id)a3;
- (void)registerStateTransitionWatcher:(id)a3;
- (void)setAllowPendingFlags:(BOOL)a3;
- (void)setCheckIDSDisableOperation:(id)a3;
- (void)setCheckReachabilityOperation:(id)a3;
- (void)setCheckUnlockOperation:(id)a3;
- (void)setConditionChecksInFlight:(unint64_t)a3;
- (void)setCurrentConditions:(unint64_t)a3;
- (void)setCurrentFlags:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHoldStateMachineOperation:(id)a3;
- (void)setIdsConfigBag:(id)a3;
- (void)setMutableStateConditions:(id)a3;
- (void)setName:(id)a3;
- (void)setNextStateMachineCycleOperation:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPaused:(id)a3;
- (void)setPendingFlags:(id)a3;
- (void)setPendingFlagsScheduler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateEngine:(id)a3;
- (void)setStateMachineRequests:(id)a3;
- (void)setStateMachineWatchers:(id)a3;
- (void)setTestHoldStates:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)startOperation;
- (void)testPauseStateMachineAfterEntering:(id)a3;
- (void)testReleaseStateMachinePause:(id)a3;
- (void)waitToResting;
@end

@implementation KTStateMachine

- (KTStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 idsConfigBag:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v56 = a5;
  id v55 = a6;
  id v58 = a7;
  id v57 = a8;
  id v52 = a9;
  id v53 = a10;
  id v54 = a11;
  v64.receiver = self;
  v64.super_class = (Class)KTStateMachine;
  v19 = [(KTStateMachine *)&v64 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    objc_storeStrong((id *)&v20->_lockStateTracker, a9);
    objc_storeStrong((id *)&v20->_reachabilityTracker, a10);
    v20->_conditionChecksInFlight = 0;
    v20->_currentConditions = 0;
    v65[0] = @"not_started";
    v65[1] = @"halted";
    v65[2] = @"KTDisabled";
    v21 = +[NSArray arrayWithObjects:v65 count:3];
    uint64_t v22 = [v18 setByAddingObjectsFromArray:v21];
    allowableStates = v20->_allowableStates;
    v20->_allowableStates = (NSSet *)v22;

    objc_storeStrong((id *)&v20->_queue, a7);
    v24 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v20->_operationQueue;
    v20->_operationQueue = v24;

    v26 = [[KTFlags alloc] initWithQueue:v58 flags:v56];
    currentFlags = v20->_currentFlags;
    v20->_currentFlags = v26;

    objc_storeWeak((id *)&v20->_stateEngine, v57);
    uint64_t v28 = +[NSBlockOperation blockOperationWithBlock:&stru_1002C3E70];
    holdStateMachineOperation = v20->_holdStateMachineOperation;
    v20->_holdStateMachineOperation = (NSOperation *)v28;

    uint64_t v30 = +[NSMutableSet set];
    testHoldStates = v20->_testHoldStates;
    v20->_testHoldStates = (NSMutableSet *)v30;

    v20->_halted = 0;
    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableStateConditions = v20->_mutableStateConditions;
    v20->_mutableStateConditions = v32;

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100183708;
    v62[3] = &unk_1002C3E98;
    v34 = v20;
    v63 = v34;
    [v18 enumerateObjectsUsingBlock:v62];
    [(KTStateMachine *)v34 setCurrentState:@"not_started"];
    uint64_t v35 = +[NSMutableArray array];
    stateMachineRequests = v34->_stateMachineRequests;
    v34->_stateMachineRequests = (NSMutableArray *)v35;

    uint64_t v37 = +[NSMutableArray array];
    stateMachineWatchers = v34->_stateMachineWatchers;
    v34->_stateMachineWatchers = (NSMutableArray *)v37;

    objc_storeStrong((id *)&v34->_idsConfigBag, a11);
    id location = 0;
    objc_initWeak(&location, v34);
    v34->_allowPendingFlags = 1;
    uint64_t v39 = +[NSMutableDictionary dictionary];
    pendingFlags = v34->_pendingFlags;
    v34->_pendingFlags = (NSMutableDictionary *)v39;

    v41 = [KTNearFutureScheduler alloc];
    v42 = +[NSString stringWithFormat:@"%@-pending-flag", v17];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10018378C;
    v59[3] = &unk_1002B72D8;
    objc_copyWeak(&v60, &location);
    v43 = [(KTNearFutureScheduler *)v41 initWithName:v42 delay:100000000 keepProcessAlive:0 dependencyDescriptionCode:1 block:v59];
    pendingFlagsScheduler = v34->_pendingFlagsScheduler;
    v34->_pendingFlagsScheduler = v43;

    v45 = +[KTStateTransitionOperation named:@"initialize" entering:v55];
    [v45 addDependency:v20->_holdStateMachineOperation];
    [(NSOperationQueue *)v20->_operationQueue addOperation:v45];
    v46 = objc_alloc_init(KTCondition);
    paused = v34->_paused;
    v34->_paused = v46;

    uint64_t v48 = [(KTStateMachine *)v34 createOperationToFinishAttempt:v45];
    nextStateMachineCycleOperation = v34->_nextStateMachineCycleOperation;
    v34 = (KTStateMachine *)((char *)v34 + 128);
    v34->super.isa = (Class)v48;

    [(NSOperationQueue *)v20->_operationQueue addOperation:v34->super.isa];
    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
  }
  return v20;
}

- (NSDictionary)stateConditions
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100183958;
  v11 = sub_100183968;
  id v12 = 0;
  v3 = [(KTStateMachine *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100183970;
  v6[3] = &unk_1002C3EC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)pendingFlagsString
{
  v2 = [(KTStateMachine *)self pendingFlags];
  v3 = [v2 allValues];
  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (id)description
{
  v3 = [(KTStateMachine *)self pendingFlags];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(KTStateMachine *)self pendingFlagsString];
    v6 = +[NSString stringWithFormat:@" (pending: %@)", v5];
  }
  else
  {
    v6 = &stru_1002CE4C0;
  }
  uint64_t v7 = [(KTStateMachine *)self name];
  v8 = [(KTStateMachine *)self currentState];
  uint64_t v9 = +[NSString stringWithFormat:@"<KTStateMachine(%@,%@,%@)>", v7, v8, v6];

  return v9;
}

- (KTStateString)currentState
{
  return self->_currentState;
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
        uint64_t v7 = objc_alloc_init(KTCondition);
        v8 = [(KTStateMachine *)self mutableStateConditions];
        [v8 setObject:v7 forKeyedSubscript:self->_currentState];
      }
      uint64_t v9 = [(KTStateMachine *)self allowableStates];
      unsigned __int8 v10 = [v9 containsObject:v14];

      if ((v10 & 1) == 0)
      {
        v13 = +[NSAssertionHandler currentHandler];
        [v13 handleFailureInMethod:a2, self, @"KTStateMachine.m", 172, @"state machine tried to enter unknown state %@", v14 object file lineNumber description];
      }
      objc_storeStrong((id *)&self->_currentState, a3);
      if (v14)
      {
        v11 = [(KTStateMachine *)self mutableStateConditions];
        id v12 = [v11 objectForKeyedSubscript:v14];
        [v12 fulfill];
      }
    }
  }

  _objc_release_x1();
}

- (id)waitForState:(id)a3 wait:(unint64_t)a4
{
  unint64_t v6 = (KTStateString *)a3;
  uint64_t v7 = [(KTStateMachine *)self stateConditions];
  v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = [v8 wait:a4];

  currentState = v6;
  if (v9) {
    currentState = self->_currentState;
  }
  v11 = currentState;

  return v11;
}

- (id)_onqueueNextStateMachineTransition
{
  v3 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(KTStateMachine *)self halted])
  {
    id v4 = [(KTStateMachine *)self currentState];
    unsigned __int8 v5 = [v4 isEqualToString:@"halted"];

    if (v5)
    {
      unint64_t v6 = 0;
    }
    else
    {
      unint64_t v6 = +[KTStateTransitionOperation named:@"halt" entering:@"halted"];
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [(KTStateMachine *)self stateMachineRequests];
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
          v13 = [v12 sourceStates];
          unint64_t v14 = [(KTStateMachine *)self currentState];
          unsigned int v15 = [v13 containsObject:v14];

          if (v15)
          {
            uint64_t v16 = [v12 _onqueueStart];
            if (v16)
            {
              unint64_t v6 = (void *)v16;
              if (qword_10032EE58 != -1) {
                dispatch_once(&qword_10032EE58, &stru_1002C3EE0);
              }
              v19 = (void *)qword_10032EE60;
              if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
              {
                v20 = v19;
                v21 = [(KTStateMachine *)self currentState];
                *(_DWORD *)buf = 138543618;
                uint64_t v28 = v12;
                __int16 v29 = 2114;
                uint64_t v30 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Running state machine request %{public}@ (from %{public}@)", buf, 0x16u);
              }
              goto LABEL_18;
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

    uint64_t v7 = [(KTStateMachine *)self stateEngine];
    id v17 = [(KTStateMachine *)self currentState];
    id v18 = [(KTStateMachine *)self currentFlags];
    unint64_t v6 = [v7 _onqueueNextStateMachineTransition:v17 flags:v18 pendingFlags:self];

LABEL_18:
  }

  return v6;
}

- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3
{
  unsigned __int8 v5 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(KTStateMachine *)self nextStateMachineCycleOperation];

  if (!v6)
  {
    uint64_t v7 = [(KTStateMachine *)self testHoldStates];
    id v8 = [(KTStateMachine *)self currentState];
    unsigned int v9 = [v7 containsObject:v8];

    if (v9)
    {
      if (qword_10032EE58 != -1) {
        dispatch_once(&qword_10032EE58, &stru_1002C3F00);
      }
      uint64_t v10 = (void *)qword_10032EE60;
      if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        id v12 = [(KTStateMachine *)self currentState];
        int v27 = 138412290;
        uint64_t v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In test hold for state %@; pausing",
          (uint8_t *)&v27,
          0xCu);
      }
      v13 = [(KTStateMachine *)self paused];
      [v13 fulfill];
    }
    else
    {
      v13 = [(KTStateMachine *)self _onqueueNextStateMachineTransition];
      if (v13)
      {
        if (qword_10032EE58 != -1) {
          dispatch_once(&qword_10032EE58, &stru_1002C3F20);
        }
        unint64_t v14 = qword_10032EE60;
        if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138543362;
          uint64_t v28 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning state transition attempt %{public}@", (uint8_t *)&v27, 0xCu);
        }
        unsigned int v15 = [(KTStateMachine *)self createOperationToFinishAttempt:v13];
        [(KTStateMachine *)self setNextStateMachineCycleOperation:v15];

        uint64_t v16 = [(KTStateMachine *)self operationQueue];
        id v17 = [(KTStateMachine *)self nextStateMachineCycleOperation];
        [v16 addOperation:v17];

        id v18 = [(KTStateMachine *)self holdStateMachineOperation];
        [v13 addNullableDependency:v18];

        [v13 setQualityOfService:25];
        v19 = [(KTStateMachine *)self operationQueue];
        [v19 addOperation:v13];

        if (a3) {
          goto LABEL_21;
        }
        v20 = objc_alloc_init(KTCondition);
        [(KTStateMachine *)self setPaused:v20];
      }
      else
      {
        if (qword_10032EE58 != -1) {
          dispatch_once(&qword_10032EE58, &stru_1002C3F40);
        }
        v21 = (void *)qword_10032EE60;
        if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = v21;
          long long v23 = [(KTStateMachine *)self currentState];
          long long v24 = [(KTStateMachine *)self currentFlags];
          long long v25 = [v24 contentsAsString];
          long long v26 = [(KTStateMachine *)self pendingFlagsString];
          int v27 = 138543874;
          uint64_t v28 = v23;
          __int16 v29 = 2114;
          uint64_t v30 = v25;
          __int16 v31 = 2114;
          v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "State machine rests (%{public}@, f:[%{public}@] p:[%{public}@])", (uint8_t *)&v27, 0x20u);
        }
        v20 = [(KTStateMachine *)self paused];
        [(KTCondition *)v20 fulfill];
      }
    }
LABEL_21:
  }
}

- (id)createOperationToFinishAttempt:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100184634;
  v9[3] = &unk_1002C3FA8;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  unint64_t v6 = +[KTResultOperation named:@"KT-state-follow-up" withBlock:v9];
  uint64_t v7 = [(KTStateMachine *)self holdStateMachineOperation];
  [v6 addNullableDependency:v7];

  [v6 addNullableDependency:v5];
  [v6 setQualityOfService:25];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (void)pokeStateMachine
{
  v3 = [(KTStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100184BBC;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueuePokeStateMachine
{
  v3 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  [(KTStateMachine *)self _onqueueStartNextStateMachineOperation:0];
}

- (void)handleFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100184CC4;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueueHandleFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(KTStateMachine *)self currentFlags];
  [v6 _onqueueSetFlag:v4];

  [(KTStateMachine *)self _onqueuePokeStateMachine];
}

- (void)handlePendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100184E00;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueueHandlePendingFlagLater:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(KTStateMachine *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100184ED8;
  v8[3] = &unk_1002B7D58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_onqueueCancelPendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(KTStateMachine *)self pendingFlags];
  [v6 setObject:0 forKeyedSubscript:v4];

  id v7 = [(KTStateMachine *)self currentFlags];
  [v7 _onqueueRemoveFlag:v4];
}

- (void)cancelPendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100185038;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_onqueueHandlePendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(KTStateMachine *)self pendingFlags];
  id v7 = [v4 flag];
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = [v4 afterOperation];

  if (v8)
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    unint64_t v14 = sub_1001851F0;
    unsigned int v15 = &unk_1002B72D8;
    objc_copyWeak(&v16, &location);
    id v9 = +[NSBlockOperation blockOperationWithBlock:&v12];
    id v10 = [v4 afterOperation:v12, v13, v14, v15];
    [v9 addNullableDependency:v10];

    id v11 = [(KTStateMachine *)self operationQueue];
    [v11 addOperation:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  [(KTStateMachine *)self _onqueueRecheckConditions];
  [(KTStateMachine *)self _onqueueSendAnyPendingFlags];
}

- (void)disablePendingFlags
{
  v3 = [(KTStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001853E8;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)dumpPendingFlags
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100183958;
  id v11 = sub_100183968;
  id v12 = 0;
  id v12 = +[NSMutableDictionary dictionary];
  v3 = [(KTStateMachine *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100185528;
  v6[3] = &unk_1002B9F78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)dumpCurrentFlags
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100183958;
  id v11 = sub_100183968;
  id v12 = 0;
  id v12 = +[NSMutableDictionary dictionary];
  v3 = [(KTStateMachine *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001857C0;
  v6[3] = &unk_1002B9F78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)possiblePendingFlags
{
  v2 = [(KTStateMachine *)self pendingFlags];
  v3 = [v2 allKeys];

  return v3;
}

- (void)_onqueueRecheckConditions
{
  id v4 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(KTStateMachine *)self allowPendingFlags])
  {
    id v5 = [(KTStateMachine *)self pendingFlags];
    id v6 = [v5 allValues];
    id v7 = [v6 copy];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v10 |= (unint64_t)[*(id *)(*((void *)&v48 + 1) + 8 * i) conditions];
        }
        id v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v9);

      if (v10)
      {
        unsigned __int8 v13 = [(KTStateMachine *)self conditionChecksInFlight];
        id location = 0;
        objc_initWeak(&location, self);
        char v14 = v10 & ~v13;
        if (v14)
        {
          unsigned int v15 = [(KTStateMachine *)self lockStateTracker];
          BOOL v16 = v15 == 0;

          if (v16)
          {
            uint64_t v37 = +[NSAssertionHandler currentHandler];
            [v37 handleFailureInMethod:a2 object:self file:@"KTStateMachine.m" lineNumber:438 description:@"Must have a lock state tracker to wait for unlock"];
          }
          id v17 = [(KTStateMachine *)self lockStateTracker];
          unsigned int v18 = [v17 isLocked];

          if (v18)
          {
            if (qword_10032EE58 != -1) {
              dispatch_once(&qword_10032EE58, &stru_1002C3FE8);
            }
            v19 = qword_10032EE60;
            if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Waiting for unlock", buf, 2u);
            }
            [(KTStateMachine *)self setCurrentConditions:[(KTStateMachine *)self currentConditions] & 0xFFFFFFFFFFFFFFFELL];
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_100185F98;
            v44[3] = &unk_1002B72D8;
            objc_copyWeak(&v45, &location);
            v20 = +[NSBlockOperation blockOperationWithBlock:v44];
            [(KTStateMachine *)self setCheckUnlockOperation:v20];

            [(KTStateMachine *)self setConditionChecksInFlight:[(KTStateMachine *)self conditionChecksInFlight] | 1];
            v21 = [(KTStateMachine *)self checkUnlockOperation];
            uint64_t v22 = [(KTStateMachine *)self lockStateTracker];
            long long v23 = [v22 unlockDependency];
            [v21 addNullableDependency:v23];

            long long v24 = [(KTStateMachine *)self operationQueue];
            long long v25 = [(KTStateMachine *)self checkUnlockOperation];
            [v24 addOperation:v25];

            objc_destroyWeak(&v45);
          }
          else
          {
            [(KTStateMachine *)self setCurrentConditions:[(KTStateMachine *)self currentConditions] | 1];
          }
        }
        if ((v14 & 2) != 0)
        {
          long long v26 = [(KTStateMachine *)self reachabilityTracker];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            v38 = +[NSAssertionHandler currentHandler];
            [v38 handleFailureInMethod:a2 object:self file:@"KTStateMachine.m" lineNumber:468 description:@"Must have a network reachability tracker to use network reachability pending flags"];
          }
          uint64_t v28 = [(KTStateMachine *)self reachabilityTracker];
          unsigned __int8 v29 = [v28 currentReachability];

          if (v29)
          {
            [(KTStateMachine *)self setCurrentConditions:[(KTStateMachine *)self currentConditions] | 2];
          }
          else
          {
            if (qword_10032EE58 != -1) {
              dispatch_once(&qword_10032EE58, &stru_1002C4028);
            }
            uint64_t v30 = qword_10032EE60;
            if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Waiting for network reachability", buf, 2u);
            }
            [(KTStateMachine *)self setCurrentConditions:[(KTStateMachine *)self currentConditions] & 0xFFFFFFFFFFFFFFFDLL];
            uint64_t v39 = _NSConcreteStackBlock;
            uint64_t v40 = 3221225472;
            v41 = sub_100186174;
            v42 = &unk_1002B72D8;
            objc_copyWeak(&v43, &location);
            __int16 v31 = +[NSBlockOperation blockOperationWithBlock:&v39];
            -[KTStateMachine setCheckReachabilityOperation:](self, "setCheckReachabilityOperation:", v31, v39, v40, v41, v42);

            [(KTStateMachine *)self setConditionChecksInFlight:[(KTStateMachine *)self conditionChecksInFlight] | 2];
            v32 = [(KTStateMachine *)self checkReachabilityOperation];
            v33 = [(KTStateMachine *)self reachabilityTracker];
            v34 = [v33 reachabilityDependency];
            [v32 addNullableDependency:v34];

            uint64_t v35 = [(KTStateMachine *)self operationQueue];
            v36 = [(KTStateMachine *)self checkReachabilityOperation];
            [v35 addOperation:v36];

            objc_destroyWeak(&v43);
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

- (void)_onqueueSendAnyPendingFlags
{
  v2 = self;
  v3 = [(KTStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(KTStateMachine *)v2 allowPendingFlags])
  {
    id v4 = [(KTStateMachine *)v2 pendingFlags];
    id v5 = [v4 allValues];
    id v6 = [v5 copy];

    id v7 = +[NSDate date];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v8 = v6;
    id v51 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (!v51)
    {

      goto LABEL_41;
    }
    uint64_t v10 = 0;
    char v50 = 0;
    uint64_t v11 = *(void *)v53;
    *(void *)&long long v9 = 138543618;
    long long v48 = v9;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v53 != v11) {
        objc_enumerationMutation(v8);
      }
      unsigned __int8 v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
      char v14 = [v13 fireTime:v48];

      if (!v14) {
        goto LABEL_15;
      }
      unsigned int v15 = [v13 fireTime];
      id v16 = [v15 compare:v7];

      if (v16 == (id)-1) {
        break;
      }
      uint64_t v17 = [v13 fireTime];
      unsigned int v18 = (void *)v17;
      if (v10)
      {
        uint64_t v19 = [v10 earlierDate:v17];

        int v20 = 0;
        uint64_t v10 = (void *)v19;
      }
      else
      {
        int v20 = 0;
        uint64_t v10 = (void *)v17;
      }
LABEL_16:
      long long v24 = [v13 afterOperation];

      if (v24)
      {
        long long v25 = [v13 afterOperation];
        unsigned int v26 = [v25 isFinished];

        if (v26)
        {
          if (qword_10032EE58 != -1) {
            dispatch_once(&qword_10032EE58, &stru_1002C4088);
          }
          BOOL v27 = (void *)qword_10032EE60;
          if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = v27;
            unsigned __int8 v29 = [v13 flag];
            [v13 afterOperation];
            long long v49 = v10;
            uint64_t v30 = v11;
            __int16 v31 = v2;
            id v32 = v8;
            v34 = v33 = v7;
            *(_DWORD *)buf = v48;
            id v57 = v29;
            __int16 v58 = 2114;
            v59 = v34;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Operation has ended for pending flag %{public}@: %{public}@", buf, 0x16u);

            id v7 = v33;
            id v8 = v32;
            v2 = v31;
            uint64_t v11 = v30;
            uint64_t v10 = v49;
          }
        }
        else
        {
          int v20 = 0;
        }
      }
      if (![v13 conditions]) {
        goto LABEL_29;
      }
      unint64_t v35 = (unint64_t)[v13 conditions];
      id v36 = (id)([(KTStateMachine *)v2 currentConditions] & v35);
      if (v36 == [v13 conditions])
      {
        if (qword_10032EE58 != -1) {
          dispatch_once(&qword_10032EE58, &stru_1002C40A8);
        }
        uint64_t v37 = (void *)qword_10032EE60;
        if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          uint64_t v39 = [v13 flag];
          *(_DWORD *)buf = 138543362;
          id v57 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Conditions are right for %{public}@", buf, 0xCu);
        }
LABEL_29:
        if (v20)
        {
          uint64_t v40 = [(KTStateMachine *)v2 currentFlags];
          v41 = [v13 flag];
          [v40 _onqueueSetFlag:v41];

          v42 = [(KTStateMachine *)v2 pendingFlags];
          id v43 = [v13 flag];
          [v42 setObject:0 forKeyedSubscript:v43];

          char v50 = 1;
        }
      }
      if (v51 == (id)++v12)
      {
        id v44 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
        id v51 = v44;
        if (!v44)
        {

          if (v10)
          {
            [v10 timeIntervalSinceDate:v7];
            unint64_t v46 = (unint64_t)(v45 * 1000000000.0);
            v47 = [(KTStateMachine *)v2 pendingFlagsScheduler];
            [v47 triggerAt:v46];

            if ((v50 & 1) == 0)
            {
LABEL_42:

              return;
            }
LABEL_40:
            [(KTStateMachine *)v2 _onqueuePokeStateMachine];
            goto LABEL_42;
          }
          if (v50) {
            goto LABEL_40;
          }
LABEL_41:
          uint64_t v10 = 0;
          goto LABEL_42;
        }
        goto LABEL_4;
      }
    }
    if (qword_10032EE58 != -1) {
      dispatch_once(&qword_10032EE58, &stru_1002C4068);
    }
    v21 = (void *)qword_10032EE60;
    if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v21;
      long long v23 = [v13 flag];
      *(_DWORD *)buf = 138543362;
      id v57 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Delay has ended for pending flag %{public}@", buf, 0xCu);
    }
LABEL_15:
    int v20 = 1;
    goto LABEL_16;
  }
}

- (void)testPauseStateMachineAfterEntering:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001869F0;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)testReleaseStateMachinePause:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100186AF8;
  v7[3] = &unk_1002B7D58;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)isPaused
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(KTStateMachine *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100186D04;
  v5[3] = &unk_1002C3EC0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)waitToResting
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  do
  {
    v3 = [(KTStateMachine *)self nextStateMachineCycleOperation];
    [v3 waitUntilFinished];

    id v4 = [(KTStateMachine *)self queue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100186E58;
    v5[3] = &unk_1002C3EC0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(v4, v5);
  }
  while (!*((unsigned char *)v7 + 24));
  _Block_object_dispose(&v6, 8);
}

- (void)startOperation
{
  v3 = [(KTStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100186F30;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)haltOperation
{
  v3 = [(KTStateMachine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018706C;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = [(KTStateMachine *)self nextStateMachineCycleOperation];
  [v4 waitUntilFinished];
}

- (void)handleExternalRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001871CC;
  v7[3] = &unk_1002B7D58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)registerStateTransitionWatcher:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001872D0;
  v7[3] = &unk_1002B7D58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)registerMultiStateArrivalWatcher:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateMachine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001873D4;
  v7[3] = &unk_1002B7D58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3
{
  id v4 = a3;
  id v5 = [v4 states];
  id v6 = [(KTStateMachine *)self currentState];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v9 = [(KTStateMachine *)self currentState];
    [v4 onqueueEnterState:v9];
  }
  else
  {
    id v8 = [(KTStateMachine *)self stateMachineWatchers];
    [v8 addObject:v4];

    [(KTStateMachine *)self _onqueuePokeStateMachine];
  }
}

- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_10032EE58 != -1) {
    dispatch_once(&qword_10032EE58, &stru_1002C40E8);
  }
  char v14 = qword_10032EE60;
  if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning a '%{public}@' rpc", buf, 0xCu);
  }
  unsigned int v15 = [(KTStateMachine *)self lockStateTracker];

  if (v15)
  {
    id v16 = [(KTStateMachine *)self lockStateTracker];
    [v16 recheck];
  }
  uint64_t v17 = [KTStateTransitionRequest alloc];
  unsigned int v18 = [(KTStateMachine *)self queue];
  id v19 = [(KTStateTransitionRequest *)v17 init:v10 sourceStates:v12 serialQueue:v18 timeout:30000000000 transitionOp:v11];

  [(KTStateMachine *)self handleExternalRequest:v19];
  int v20 = +[NSString stringWithFormat:@"%@-callback", v10];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001877B0;
  v26[3] = &unk_1002BA0F8;
  id v27 = v10;
  id v28 = v11;
  id v29 = v13;
  id v21 = v13;
  id v22 = v11;
  id v23 = v10;
  long long v24 = +[KTResultOperation named:v20 withBlock:v26];

  [v24 addDependency:v22];
  long long v25 = [(KTStateMachine *)self operationQueue];
  [v25 addOperation:v24];
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = +[NSString stringWithFormat:@"intial-transition-%@", v13];
  unsigned int v15 = [v11 initialState];
  id v16 = +[KTStateTransitionOperation named:v14 entering:v15];

  uint64_t v17 = [(KTStateMachine *)self doWatchedStateMachineRPC:v13 sourceStates:v12 path:v11 transitionOp:v16 reply:v10];

  return v17;
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = v14;
  if (qword_10032EE58 != -1) {
    dispatch_once(&qword_10032EE58, &stru_1002C4128);
  }
  unsigned int v18 = qword_10032EE60;
  if (os_log_type_enabled((os_log_t)qword_10032EE60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Beginning a '%{public}@' rpc", buf, 0xCu);
  }
  id v19 = [(KTStateMachine *)self lockStateTracker];

  if (v19)
  {
    int v20 = [(KTStateMachine *)self lockStateTracker];
    [v20 recheck];
  }
  id v21 = [KTStateTransitionRequest alloc];
  id v22 = [(KTStateMachine *)self queue];
  id v23 = [(KTStateTransitionRequest *)v21 init:v12 sourceStates:v13 serialQueue:v22 timeout:30000000000 transitionOp:v15];

  long long v24 = [KTStateTransitionWatcher alloc];
  uint64_t v40 = v13;
  +[NSString stringWithFormat:@"watcher-%@", v12];
  v26 = long long v25 = v15;
  id v27 = [(KTStateMachine *)self queue];
  id v28 = [(KTStateTransitionWatcher *)v24 initNamed:v26 serialQueue:v27 path:v17 initialRequest:v23];

  unint64_t v29 = [(KTStateMachine *)self timeout];
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 120000000000;
  }
  id v31 = [v28 timeout:v30];
  [(KTStateMachine *)self registerStateTransitionWatcher:v28];
  id v32 = +[NSString stringWithFormat:@"%@-callback", v12];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100187E04;
  v41[3] = &unk_1002C4170;
  id v42 = v12;
  id v43 = v28;
  id v44 = v16;
  id v33 = v16;
  id v34 = v28;
  id v35 = v12;
  id v36 = +[KTResultOperation named:v32 withBlockTakingSelf:v41];

  uint64_t v37 = [v34 result];
  [v36 addDependency:v37];

  v38 = [(KTStateMachine *)self operationQueue];
  [v38 addOperation:v36];

  [(KTStateMachine *)self handleExternalRequest:v23];

  return v36;
}

- (KTCondition)paused
{
  return (KTCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPaused:(id)a3
{
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 48, 1);
}

- (KTReachabilityTracker)reachabilityTracker
{
  return (KTReachabilityTracker *)objc_getProperty(self, a2, 56, 1);
}

- (KTStateMachineEngine)stateEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateEngine);

  return (KTStateMachineEngine *)WeakRetained;
}

- (void)setStateEngine:(id)a3
{
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMutableStateConditions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setName:(id)a3
{
}

- (KTFlags)currentFlags
{
  return (KTFlags *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentFlags:(id)a3
{
}

- (NSOperation)holdStateMachineOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHoldStateMachineOperation:(id)a3
{
}

- (NSMutableSet)testHoldStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestHoldStates:(id)a3
{
}

- (KTResultOperation)nextStateMachineCycleOperation
{
  return (KTResultOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextStateMachineCycleOperation:(id)a3
{
}

- (NSMutableArray)stateMachineRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStateMachineRequests:(id)a3
{
}

- (NSMutableArray)stateMachineWatchers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStateMachineWatchers:(id)a3
{
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (BOOL)allowPendingFlags
{
  return self->_allowPendingFlags;
}

- (void)setAllowPendingFlags:(BOOL)a3
{
  self->_allowPendingFlags = a3;
}

- (NSMutableDictionary)pendingFlags
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPendingFlags:(id)a3
{
}

- (KTNearFutureScheduler)pendingFlagsScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPendingFlagsScheduler:(id)a3
{
}

- (unint64_t)conditionChecksInFlight
{
  return self->_conditionChecksInFlight;
}

- (void)setConditionChecksInFlight:(unint64_t)a3
{
  self->_conditionChecksInFlight = a3;
}

- (unint64_t)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(unint64_t)a3
{
  self->_currentConditions = a3;
}

- (NSOperation)checkUnlockOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCheckUnlockOperation:(id)a3
{
}

- (NSOperation)checkReachabilityOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCheckReachabilityOperation:(id)a3
{
}

- (NSOperation)checkIDSDisableOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCheckIDSDisableOperation:(id)a3
{
}

- (TransparencyIDSConfigBag)idsConfigBag
{
  return (TransparencyIDSConfigBag *)objc_getProperty(self, a2, 208, 1);
}

- (void)setIdsConfigBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsConfigBag, 0);
  objc_storeStrong((id *)&self->_checkIDSDisableOperation, 0);
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mutableStateConditions, 0);
  objc_destroyWeak((id *)&self->_stateEngine);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_allowableStates, 0);
  objc_storeStrong((id *)&self->_paused, 0);

  objc_storeStrong((id *)&self->_currentState, 0);
}

@end