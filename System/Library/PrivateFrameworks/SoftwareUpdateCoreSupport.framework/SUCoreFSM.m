@interface SUCoreFSM
- (BOOL)_activateMachineWithStateTable:(id)a3 withActionTable:(id)a4;
- (BOOL)isActive;
- (BOOL)performingEvent;
- (NSDictionary)stateTable;
- (NSMutableDictionary)registeredActionTable;
- (NSMutableDictionary)usageTable;
- (NSString)currentState;
- (NSString)fsmName;
- (NSString)fullName;
- (NSString)instanceName;
- (NSString)pendingFollowupEvent;
- (NSString)startState;
- (OS_dispatch_queue)extendedStateQueue;
- (SUCoreDiag)diag;
- (id)_acceptEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 attachedAction:(id *)a6;
- (id)_initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8 registeringAndActivating:(BOOL)a9;
- (id)copyCurrentState;
- (id)copyCurrentStateProtected;
- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6;
- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8;
- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5;
- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5 usingDelegate:(id)a6 registeringAllInfoClass:(Class)a7;
- (id)pendingFollowupInfo;
- (unint64_t)untrackedOccurrences;
- (void)_performEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 forCell:(id)a6 attachedAction:(id)a7 checkingAttached:(BOOL)a8;
- (void)_postEvent:(id)a3 withInfo:(id)a4;
- (void)_registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7 actionTable:(id)a8 loggingRegistration:(BOOL)a9;
- (void)_registerAllActions:(id)a3 withInfoClass:(Class)a4 stateTable:(id)a5 actionTable:(id)a6 loggingRegistration:(BOOL)a7;
- (void)_simulateEventAlteration:(id)a3 fsmEvent:(id *)a4 eventInfo:(id *)a5 attachedAction:(id *)a6;
- (void)_trackEventOccurrence:(id)a3 withInfo:(id)a4 issueType:(id)a5;
- (void)_triggerAction:(id)a3 usingAttached:(id)a4 onEvent:(id)a5 inState:(id)a6 withInfo:(id)a7 nextState:(id)a8;
- (void)activateMachine;
- (void)dumpEventInStateOccurrences:(id)a3;
- (void)followupEvent:(id)a3;
- (void)followupEvent:(id)a3 withInfo:(id)a4;
- (void)postEvent:(id)a3;
- (void)postEvent:(id)a3 withInfo:(id)a4;
- (void)postProtectedEvent:(id)a3;
- (void)postProtectedEvent:(id)a3 withInfo:(id)a4;
- (void)registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7;
- (void)registerAllActions:(id)a3 withInfoClass:(Class)a4;
- (void)setCurrentState:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPendingFollowupEvent:(id)a3;
- (void)setPendingFollowupInfo:(id)a3;
- (void)setPerformingEvent:(BOOL)a3;
- (void)setUntrackedOccurrences:(unint64_t)a3;
- (void)setUsageTable:(id)a3;
- (void)teardownMachine;
@end

@implementation SUCoreFSM

- (void)postEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUCoreFSM *)self extendedStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SUCoreFSM_postEvent_withInfo___block_invoke;
  block[3] = &unk_1E60B65E8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)followupEvent:(id)a3 withInfo:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  if (![(SUCoreFSM *)self performingEvent])
  {
    id v9 = [(SUCoreFSM *)self diag];
    id v15 = [NSString alloc];
    v11 = [(SUCoreFSM *)self fullName];
    v16 = [(SUCoreFSM *)self currentState];
    v17 = (void *)[v15 initWithFormat:@"FSM(%@) follow-up event(%@) in state(%@) ignored - not performing any event", v11, v18, v16];
    [v9 trackAnomaly:@"[FSM] FOLLOW_UP_EVENT" forReason:v17 withResult:8115 withError:0];

    goto LABEL_5;
  }
  v8 = [(SUCoreFSM *)self pendingFollowupEvent];

  if (v8)
  {
    id v9 = [(SUCoreFSM *)self diag];
    id v10 = [NSString alloc];
    v11 = [(SUCoreFSM *)self fullName];
    id v12 = [(SUCoreFSM *)self currentState];
    id v13 = [(SUCoreFSM *)self pendingFollowupEvent];
    v14 = (void *)[v10 initWithFormat:@"FSM(%@) follow-up event(%@) in state(%@) ignored - already have follow-up event(%@)", v11, v18, v12, v13];
    [v9 trackAnomaly:@"[FSM] FOLLOW_UP_EVENT" forReason:v14 withResult:8111 withError:0];

LABEL_5:
    goto LABEL_7;
  }
  [(SUCoreFSM *)self setPendingFollowupEvent:v18];
  [(SUCoreFSM *)self setPendingFollowupInfo:v6];
LABEL_7:
}

- (BOOL)performingEvent
{
  return self->_performingEvent;
}

uint64_t __32__SUCoreFSM_postEvent_withInfo___block_invoke(void *a1)
{
  v2 = +[SUCoreDiag sharedDiag];
  [v2 trackBegin:@"[FSM] API: postEvent" atLevel:0];

  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  return [v3 _postEvent:v4 withInfo:v5];
}

- (void)_postEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  id v39 = 0;
  id v9 = [(SUCoreFSM *)self _acceptEvent:v6 withInfo:v7 issueType:@"post" attachedAction:&v39];
  id v10 = v39;
  if (v9)
  {
    v11 = [(SUCoreFSM *)self pendingFollowupEvent];

    if (v11)
    {
      id v12 = [(SUCoreFSM *)self diag];
      id v13 = [NSString alloc];
      v14 = [(SUCoreFSM *)self fullName];
      id v15 = [(SUCoreFSM *)self pendingFollowupEvent];
      v16 = [(SUCoreFSM *)self currentState];
      v17 = (void *)[v13 initWithFormat:@"FSM(%@) pending follow-up event(%@) [prior to performing event(%@) in state(%@)] discarded", v14, v15, v6, v16];
      [v12 trackAnomaly:@"[FSM] POST_EVENT" forReason:v17 withResult:8117 withError:0];

      [(SUCoreFSM *)self setPendingFollowupEvent:0];
      [(SUCoreFSM *)self setPendingFollowupInfo:0];
    }
    id v34 = v6;
    id v18 = v6;
    [(SUCoreFSM *)self setPerformingEvent:1];
    while (1)
    {
      v19 = +[SUCoreSimulate sharedSimulator];
      v20 = [(SUCoreFSM *)self fsmName];
      v21 = [(SUCoreFSM *)self currentState];
      v22 = [v19 fsm:v20 forEvent:v18 inState:v21];

      if (v22)
      {
        id v37 = v7;
        id v38 = v18;
        id v36 = v10;
        [(SUCoreFSM *)self _simulateEventAlteration:v22 fsmEvent:&v38 eventInfo:&v37 attachedAction:&v36];
        id v23 = v38;

        id v24 = v37;
        id v25 = v36;

        v26 = [v25 fsmAction];
        BOOL v27 = v26 == 0;

        id v7 = v24;
        id v10 = v25;
        id v18 = v23;
      }
      else
      {
        BOOL v27 = 1;
      }
      [(SUCoreFSM *)self _performEvent:v18 withInfo:v7 issueType:@"post" forCell:v9 attachedAction:v10 checkingAttached:v27];

      v28 = [(SUCoreFSM *)self pendingFollowupEvent];

      if (!v28) {
        break;
      }

      v29 = [(SUCoreFSM *)self pendingFollowupEvent];
      v30 = [(SUCoreFSM *)self pendingFollowupInfo];
      id v35 = 0;
      v31 = [(SUCoreFSM *)self _acceptEvent:v29 withInfo:v30 issueType:@"follow-up" attachedAction:&v35];
      id v10 = v35;

      if (!v31)
      {
        id v9 = 0;
        break;
      }
      id v18 = [(SUCoreFSM *)self pendingFollowupEvent];
      uint64_t v32 = [(SUCoreFSM *)self pendingFollowupInfo];

      [(SUCoreFSM *)self setPendingFollowupEvent:0];
      [(SUCoreFSM *)self setPendingFollowupInfo:0];

      id v7 = (id)v32;
      id v9 = v31;
      if (!v18) {
        goto LABEL_14;
      }
    }

    v31 = v9;
    uint64_t v32 = (uint64_t)v7;
LABEL_14:
    [(SUCoreFSM *)self setPerformingEvent:0];

    id v7 = (id)v32;
    id v6 = v34;
  }
  v33 = +[SUCoreDiag sharedDiag];
  [v33 trackEnd:@"[FSM] API: postEvent" atLevel:0];
}

- (NSString)pendingFollowupEvent
{
  return self->_pendingFollowupEvent;
}

- (void)setPerformingEvent:(BOOL)a3
{
  self->_performingEvent = a3;
}

- (NSString)fsmName
{
  return self->_fsmName;
}

- (void)_triggerAction:(id)a3 usingAttached:(id)a4 onEvent:(id)a5 inState:(id)a6 withInfo:(id)a7 nextState:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v20);

  id v21 = [NSString alloc];
  v22 = [(SUCoreFSM *)self fullName];
  id v23 = (void *)[v21 initWithFormat:@"[FSM] ACTION: FSM(%@), action(%@)", v22, v19];

  id v24 = +[SUCoreDiag sharedDiag];
  [v24 trackBegin:v23 atLevel:0];

  id v25 = [v18 actionDelegate];

  id v29 = 0;
  uint64_t v26 = [v25 performAction:v19 onEvent:v17 inState:v16 withInfo:v15 nextState:v14 error:&v29];

  id v27 = v29;
  v28 = +[SUCoreDiag sharedDiag];
  [v28 trackEnd:v23 atLevel:0 withResult:v26 withError:v27];
}

- (void)_performEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 forCell:(id)a6 attachedAction:(id)a7 checkingAttached:(BOOL)a8
{
  BOOL v8 = a8;
  id v35 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  unint64_t v17 = (unint64_t)a7;
  id v18 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v18);

  [(SUCoreFSM *)self _trackEventOccurrence:v35 withInfo:v14 issueType:v15];
  id v19 = [(SUCoreFSM *)self currentState];
  v20 = [v16 safeStringForKey:@"FSMNextState"];
  if (v20) {
    [(SUCoreFSM *)self setCurrentState:v20];
  }
  if ([v35 isEqualToString:@"Teardown"]) {
    [(SUCoreFSM *)self setIsActive:0];
  }
  if (v8) {
    [v16 safeStringForKey:@"FSMAction"];
  }
  else {
  uint64_t v21 = [(id)v17 fsmAction];
  }
  v22 = [(SUCoreFSM *)self diag];
  id v23 = [(SUCoreFSM *)self fullName];
  [v22 trackStateEvent:v23 previousState:v19 handlingEvent:v35 nextState:v20 performingAction:v21 withInfo:v14];

  if (v17 | v21)
  {
    if (v17
      && v21
      && ([(id)v17 fsmAction],
          id v24 = objc_claimAutoreleasedReturnValue(),
          int v25 = [(id)v21 isEqualToString:v24],
          v24,
          v25))
    {
      [(SUCoreFSM *)self _triggerAction:v21 usingAttached:v17 onEvent:v35 inState:v19 withInfo:v14 nextState:v20];
    }
    else
    {
      [(SUCoreFSM *)self diag];
      uint64_t v26 = v33 = v19;
      id v27 = [NSString alloc];
      [(SUCoreFSM *)self fullName];
      id v34 = v16;
      id v29 = v28 = v15;
      v30 = [(SUCoreFSM *)self currentState];
      v31 = [(id)v17 fsmAction];
      uint64_t v32 = (void *)[v27 initWithFormat:@"FSM(%@) event where action indicated (but table / registration mismatch) %@ event(%@) in state(%@) action(%@)!=attached(%@)", v29, v28, v35, v30, v21, v31];
      [v26 trackAnomaly:@"[FSM] PERFORM_EVENT" forReason:v32 withResult:8112 withError:0];

      id v15 = v28;
      id v16 = v34;

      id v19 = v33;
    }
  }
}

- (OS_dispatch_queue)extendedStateQueue
{
  return self->_extendedStateQueue;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (SUCoreDiag)diag
{
  return self->_diag;
}

- (void)_trackEventOccurrence:(id)a3 withInfo:(id)a4 issueType:(id)a5
{
  id v22 = a3;
  id v7 = a5;
  BOOL v8 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(SUCoreFSM *)self usageTable];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SUCoreFSM *)self setUsageTable:v10];
  }
  v11 = [(SUCoreFSM *)self usageTable];

  if (!v11) {
    goto LABEL_11;
  }
  id v12 = [(SUCoreFSM *)self usageTable];
  id v13 = [(SUCoreFSM *)self currentState];
  id v14 = [v12 safeDictionaryForKey:v13 fromBase:v7 withKeyDescription:@"current state"];

  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = [(SUCoreFSM *)self usageTable];
    id v16 = [(SUCoreFSM *)self currentState];
    [v15 setSafeObject:v14 forKey:v16];

    if (!v14)
    {
LABEL_11:
      [(SUCoreFSM *)self setUntrackedOccurrences:[(SUCoreFSM *)self untrackedOccurrences] + 1];
      goto LABEL_16;
    }
  }
  id v17 = [v14 safeDictionaryForKey:v22 fromBase:v7 withKeyDescription:@"FSM event"];
  if (!v17)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setSafeObject:v17 forKey:v22];
    if (!v17)
    {
      [(SUCoreFSM *)self setUntrackedOccurrences:[(SUCoreFSM *)self untrackedOccurrences] + 1];
      goto LABEL_15;
    }
  }
  id v18 = [v17 safeObjectForKey:@"FSMOccurrences" ofClass:objc_opt_class()];
  if (!v18)
  {
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedLongLong:1];
    if (v21) {
      goto LABEL_10;
    }
LABEL_13:
    [(SUCoreFSM *)self setUntrackedOccurrences:[(SUCoreFSM *)self untrackedOccurrences] + 1];
    goto LABEL_14;
  }
  id v19 = v18;
  uint64_t v20 = [v18 unsignedLongLongValue] + 1;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedLongLong:v20];

  if (!v21) {
    goto LABEL_13;
  }
LABEL_10:
  [v17 setSafeObject:v21 forKey:@"FSMOccurrences"];
LABEL_14:

LABEL_15:
LABEL_16:
}

- (NSMutableDictionary)usageTable
{
  return self->_usageTable;
}

- (id)_acceptEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 attachedAction:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v13);

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v17 = [(SUCoreFSM *)self diag];
    id v28 = [NSString alloc];
    id v16 = [(SUCoreFSM *)self fullName];
    uint64_t v20 = (void *)[v28 initWithFormat:@"FSM(%@) invalid %@ event", v16, v12];
    [v17 trackFailure:@"[FSM] ACCEPT_EVENT" forReason:v20 withResult:8111 withError:0];
LABEL_12:
    id v22 = 0;
LABEL_13:

    id v17 = 0;
    goto LABEL_14;
  }
  if (![(SUCoreFSM *)self isActive])
  {
    id v17 = [(SUCoreFSM *)self diag];
    id v30 = [NSString alloc];
    id v16 = [(SUCoreFSM *)self fullName];
    uint64_t v20 = (void *)[v30 initWithFormat:@"FSM(%@) not active at %@ event(%@)", v16, v12, v10];
    [v17 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v20 withResult:8111 withError:0];
    goto LABEL_12;
  }
  id v14 = [(SUCoreFSM *)self stateTable];
  id v15 = [(SUCoreFSM *)self currentState];
  id v16 = [v14 safeDictionaryForKey:v15 fromBase:@"SUCoreFSM stateTable" withKeyDescription:@"current state"];

  id v17 = [v16 safeDictionaryForKey:v10 fromBase:@"SUCoreFSM eventsForState" withKeyDescription:@"FSM event"];
  id v40 = v11;
  if (!v16)
  {
    uint64_t v20 = [(SUCoreFSM *)self diag];
    id v31 = [NSString alloc];
    uint64_t v32 = [(SUCoreFSM *)self fullName];
    v33 = [(SUCoreFSM *)self currentState];
    id v34 = [(SUCoreFSM *)self stateTable];
    id v35 = (void *)[v31 initWithFormat:@"FSM(%@) current state(%@) does not exist in state table when checking %@ event(%@) table:\n%@", v32, v33, v12, v10, v34];
    [v20 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v35 withResult:8500 withError:0];

LABEL_20:
    id v11 = v40;

    goto LABEL_12;
  }
  if (!v17)
  {
    uint64_t v20 = [(SUCoreFSM *)self diag];
    id v36 = [NSString alloc];
    uint64_t v32 = [(SUCoreFSM *)self fullName];
    v33 = [(SUCoreFSM *)self currentState];
    id v34 = (void *)[v36 initWithFormat:@"FSM(%@) current state(%@) does not support %@ event(%@)", v32, v33, v12, v10];
    [v20 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v34 withResult:8501 withError:0];
    goto LABEL_20;
  }
  id v18 = [(SUCoreFSM *)self registeredActionTable];
  id v19 = [(SUCoreFSM *)self currentState];
  uint64_t v20 = [v18 safeDictionaryForKey:v19 fromBase:@"SUCoreFSM registeredActionTable" withKeyDescription:@"current state"];

  uint64_t v21 = [v20 safeObjectForKey:v10 ofClass:objc_opt_class()];
  id v22 = v21;
  id v11 = v40;
  if (v40)
  {
    if (v21)
    {
      if (![v21 eventInfoClass])
      {
        id v23 = [(SUCoreFSM *)self diag];
        id v38 = [NSString alloc];
        int v25 = [(SUCoreFSM *)self fullName];
        uint64_t v26 = [(SUCoreFSM *)self currentState];
        uint64_t v27 = [v38 initWithFormat:@"FSM(%@) event info provided when registered handler is not expecting any event info parameter: %@ event(%@) in state(%@)", v25, v12, v10, v26];
        goto LABEL_26;
      }
      [v22 eventInfoClass];
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v23 = [(SUCoreFSM *)self diag];
        id v24 = [NSString alloc];
        int v25 = [(SUCoreFSM *)self fullName];
        uint64_t v26 = [(SUCoreFSM *)self currentState];
        uint64_t v27 = [v24 initWithFormat:@"FSM(%@) event info Class mismatch (eventInfo of diff Class than registered): %@ event(%@) in state(%@)", v25, v12, v10, v26];
LABEL_26:
        id v39 = (void *)v27;
        [v23 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v27 withResult:8112 withError:0];

        id v11 = v40;
        goto LABEL_13;
      }
    }
  }
  else if (v21 && [v21 eventInfoClass])
  {
    id v23 = [(SUCoreFSM *)self diag];
    id v37 = [NSString alloc];
    int v25 = [(SUCoreFSM *)self fullName];
    uint64_t v26 = [(SUCoreFSM *)self currentState];
    uint64_t v27 = [v37 initWithFormat:@"FSM(%@) event info Class mismatch (nil eventInfo when registered handler expecting non-nil): %@ event(%@) in state(%@)", v25, v12, v10, v26];
    goto LABEL_26;
  }

  id v22 = v22;
  *a6 = v22;
LABEL_14:

  return v17;
}

- (NSString)currentState
{
  return self->_currentState;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (NSMutableDictionary)registeredActionTable
{
  return self->_registeredActionTable;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (id)pendingFollowupInfo
{
  return self->_pendingFollowupInfo;
}

- (void)setPendingFollowupInfo:(id)a3
{
}

- (void)setPendingFollowupEvent:(id)a3
{
}

- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5
{
  LOBYTE(v6) = 0;
  return [(SUCoreFSM *)self _initMachine:a3 ofInstance:0 withTable:a4 startingIn:a5 usingDelegate:0 registeringAllInfoClass:0 registeringAndActivating:v6];
}

- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6
{
  LOBYTE(v7) = 0;
  return [(SUCoreFSM *)self _initMachine:a3 ofInstance:a4 withTable:a5 startingIn:a6 usingDelegate:0 registeringAllInfoClass:0 registeringAndActivating:v7];
}

- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5 usingDelegate:(id)a6 registeringAllInfoClass:(Class)a7
{
  LOBYTE(v8) = 1;
  return [(SUCoreFSM *)self _initMachine:a3 ofInstance:0 withTable:a4 startingIn:a5 usingDelegate:a6 registeringAllInfoClass:a7 registeringAndActivating:v8];
}

- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8
{
  LOBYTE(v9) = 1;
  return [(SUCoreFSM *)self _initMachine:a3 ofInstance:a4 withTable:a5 startingIn:a6 usingDelegate:a7 registeringAllInfoClass:a8 registeringAndActivating:v9];
}

- (id)_initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8 registeringAndActivating:(BOOL)a9
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v69 = a7;
  v70.receiver = self;
  v70.super_class = (Class)SUCoreFSM;
  id v19 = [(SUCoreFSM *)&v70 init];
  if (!v19) {
    goto LABEL_30;
  }
  id v68 = v16;
  uint64_t v20 = +[SUCoreDiag sharedDiag];
  [v20 trackBegin:@"[FSM] API: initMachine"];

  v19->_isActive = 0;
  v19->_performingEvent = 0;
  pendingFollowupEvent = v19->_pendingFollowupEvent;
  v19->_pendingFollowupEvent = 0;

  id pendingFollowupInfo = v19->_pendingFollowupInfo;
  v19->_id pendingFollowupInfo = 0;

  usageTable = v19->_usageTable;
  v19->_usageTable = 0;

  v19->_untrackedOccurrences = 0;
  uint64_t v24 = objc_opt_new();
  registeredActionTable = v19->_registeredActionTable;
  v19->_registeredActionTable = (NSMutableDictionary *)v24;

  if (!v15)
  {
    uint64_t v27 = +[SUCore sharedCore];
    id v28 = v27;
    id v29 = @"FSM name not provided";
    uint64_t v30 = 8101;
LABEL_14:
    id v31 = [v27 buildError:v30 underlying:0 description:v29];
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v27 = +[SUCore sharedCore];
    id v28 = v27;
    id v29 = @"invalid FSM name";
    uint64_t v30 = 8102;
    goto LABEL_14;
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v28 = +[SUCore sharedCore];
      id v31 = [v28 buildError:8102 underlying:0 description:@"invalid instance name"];
      goto LABEL_23;
    }
  }
  if (!v17)
  {
    id v28 = +[SUCore sharedCore];
    uint64_t v32 = [[NSString alloc] initWithFormat:@"FSM(%@) state table not provided", v15];
LABEL_19:
    id v34 = (void *)v32;
    id v35 = v28;
    uint64_t v36 = 8101;
LABEL_22:
    id v31 = [v35 buildError:v36 underlying:0 description:v34];

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = +[SUCore sharedCore];
    uint64_t v33 = [[NSString alloc] initWithFormat:@"FSM(%@) invalid state table", v15];
LABEL_21:
    id v34 = (void *)v33;
    id v35 = v28;
    uint64_t v36 = 8102;
    goto LABEL_22;
  }
  if (!v18)
  {
    id v28 = +[SUCore sharedCore];
    uint64_t v32 = [[NSString alloc] initWithFormat:@"FSM(%@) start state not provided", v15];
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = +[SUCore sharedCore];
    uint64_t v33 = [[NSString alloc] initWithFormat:@"FSM(%@) invalid start state", v15];
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v19->_fsmName, a3);
  objc_storeStrong((id *)&v19->_instanceName, a4);
  if (v19->_instanceName) {
    uint64_t v26 = (NSString *)[[NSString alloc] initWithFormat:@"%@[%@]", v19->_fsmName, v19->_instanceName];
  }
  else {
    uint64_t v26 = v19->_fsmName;
  }
  fullName = v19->_fullName;
  v19->_fullName = v26;

  id v28 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", @"fsm", v19->_fullName];
  v62 = (void *)[[NSString alloc] initWithFormat:@"SUFSM_%@_%@", v19->_fullName, @"SUDiagDump.plist"];
  v47 = [[SUCoreDiag alloc] initWithAppendedDomain:v28 appendingDumpFilename:v62];
  diag = v19->_diag;
  v19->_diag = v47;

  v49 = +[SUCore sharedCore];
  uint64_t v50 = [v49 commonDomain];

  v66 = (void *)v50;
  id v63 = (id) [[NSString alloc] initWithFormat:@"%@.%@.%@", v50, @"core.fsm.extended", v19->_fullName];
  uint64_t v51 = [v63 UTF8String];
  v52 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v53 = (const char *)v51;
  v54 = v52;
  dispatch_queue_t v55 = dispatch_queue_create(v53, v52);
  extendedStateQueue = v19->_extendedStateQueue;
  v19->_extendedStateQueue = (OS_dispatch_queue *)v55;

  if (v19->_extendedStateQueue)
  {
    v57 = +[SUCoreLog sharedLogger];
    v58 = [v57 oslog];

    v64 = v58;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v19->_fullName;
      *(_DWORD *)buf = 138543874;
      v72 = v66;
      __int16 v73 = 2114;
      v74 = @"core.fsm.extended";
      __int16 v75 = 2114;
      v76 = v59;
      _os_log_impl(&dword_1B4EC2000, v58, OS_LOG_TYPE_DEFAULT, "[FSM] DISPATCH: created extended state dispatch queue domain(%{public}@.%{public}@.%{public}@)", buf, 0x20u);
    }
    id v31 = 0;
    v60 = v64;
  }
  else
  {
    v65 = +[SUCore sharedCore];
    v61 = (void *)[[NSString alloc] initWithFormat:@"FSM(%@) failed to create extended state dispatch queue", v19->_fullName];
    id v31 = [v65 buildError:8100 underlying:0 description:v61];

    v60 = v65;
  }

LABEL_23:
  if (a9)
  {
    [(SUCoreFSM *)v19 _registerAllActions:v69 withInfoClass:a8 stateTable:v17 actionTable:v19->_registeredActionTable loggingRegistration:0];
    if ([(SUCoreFSM *)v19 _activateMachineWithStateTable:v17 withActionTable:v19->_registeredActionTable])
    {
      objc_storeStrong((id *)&v19->_currentState, a6);
      v19->_isActive = 1;
    }
    else
    {
      id v37 = +[SUCore sharedCore];
      id v38 = (void *)[[NSString alloc] initWithFormat:@"FSM(%@) failed to validate state table and registered actions", v19->_fullName];
      uint64_t v39 = [v37 buildError:8503 underlying:0 description:v38];

      id v31 = (void *)v39;
    }
  }
  id v40 = v18;
  if (!v31)
  {
    objc_storeStrong((id *)&v19->_stateTable, a5);
    objc_storeStrong((id *)&v19->_startState, a6);
    v44 = +[SUCoreDiag sharedDiag];
    [v44 trackEnd:@"[FSM] API: initMachine"];

    id v16 = v68;
LABEL_30:
    v43 = v19;
    id v40 = v18;
    goto LABEL_31;
  }
  v41 = +[SUCoreDiag sharedDiag];
  objc_msgSend(v41, "trackFailure:forReason:withResult:withError:", @"[FSM] FAILURE: initMachine", @"unable to fully validate and setup FSM", objc_msgSend(v31, "code"), v31);

  v42 = +[SUCoreDiag sharedDiag];
  objc_msgSend(v42, "trackEnd:withResult:withError:", @"[FSM] API: initMachine", objc_msgSend(v31, "code"), v31);

  v43 = 0;
  id v16 = v68;
LABEL_31:

  return v43;
}

- (void)teardownMachine
{
  v3 = [(SUCoreFSM *)self extendedStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SUCoreFSM_teardownMachine__block_invoke;
  block[3] = &unk_1E60B6300;
  block[4] = self;
  dispatch_async(v3, block);
}

void __28__SUCoreFSM_teardownMachine__block_invoke(uint64_t a1)
{
  v2 = +[SUCoreDiag sharedDiag];
  [v2 trackBegin:@"[FSM] API: teardownMachine"];

  if ([*(id *)(a1 + 32) isActive])
  {
    v3 = *(void **)(a1 + 32);
    id v21 = 0;
    uint64_t v4 = [v3 _acceptEvent:@"Teardown" withInfo:0 issueType:@"post" attachedAction:&v21];
    id v5 = v21;
    if (v4)
    {
      uint64_t v6 = [*(id *)(a1 + 32) pendingFollowupEvent];

      if (v6)
      {
        uint64_t v7 = [*(id *)(a1 + 32) diag];
        id v8 = [NSString alloc];
        uint64_t v9 = [*(id *)(a1 + 32) fullName];
        id v10 = [*(id *)(a1 + 32) pendingFollowupEvent];
        id v11 = [*(id *)(a1 + 32) currentState];
        id v12 = (void *)[v8 initWithFormat:@"FSM(%@) pending follow-up event(%@) [starting teardown in state(%@)] discarded", v9, v10, v11];
        [v7 trackAnomaly:@"[FSM] TEARDOWN" forReason:v12 withResult:8117 withError:0];

        [*(id *)(a1 + 32) setPendingFollowupEvent:0];
        [*(id *)(a1 + 32) setPendingFollowupInfo:0];
      }
      [*(id *)(a1 + 32) setPerformingEvent:0];
      [*(id *)(a1 + 32) _performEvent:@"Teardown" withInfo:0 issueType:@"teardown" forCell:v4 attachedAction:v5 checkingAttached:1];
      id v13 = [*(id *)(a1 + 32) pendingFollowupEvent];

      if (v13)
      {
        id v14 = [*(id *)(a1 + 32) diag];
        id v15 = [NSString alloc];
        id v16 = [*(id *)(a1 + 32) fullName];
        id v17 = [*(id *)(a1 + 32) pendingFollowupEvent];
        id v18 = [*(id *)(a1 + 32) currentState];
        id v19 = (void *)[v15 initWithFormat:@"FSM(%@) pending follow-up event(%@) [ending teardown in state(%@)] discarded", v16, v17, v18];
        [v14 trackAnomaly:@"[FSM] TEARDOWN" forReason:v19 withResult:8117 withError:0];
      }
      [*(id *)(a1 + 32) setIsActive:0];
    }
  }
  uint64_t v20 = +[SUCoreDiag sharedDiag];
  [v20 trackEnd:@"[FSM] API: teardownMachine"];
}

- (void)registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_not_V2(v16);

  id v17 = [(SUCoreFSM *)self extendedStateQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__SUCoreFSM_registerAction_ForEvent_inState_usingDelegate_withInfoClass___block_invoke;
  v22[3] = &unk_1E60B6BF8;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  Class v27 = a7;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_sync(v17, v22);
}

void __73__SUCoreFSM_registerAction_ForEvent_inState_usingDelegate_withInfoClass___block_invoke(void *a1)
{
  v2 = +[SUCoreDiag sharedDiag];
  [v2 trackBegin:@"[FSM] API: registerAction" atLevel:0];

  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v8 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v9 = [v3 registeredActionTable];
  LOBYTE(v10) = 1;
  [v3 _registerAction:v4 ForEvent:v5 inState:v6 usingDelegate:v8 withInfoClass:v7 actionTable:v9 loggingRegistration:v10];

  id v11 = +[SUCoreDiag sharedDiag];
  [v11 trackEnd:@"[FSM] API: registerAction" atLevel:0];
}

- (void)registerAllActions:(id)a3 withInfoClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(SUCoreFSM *)self extendedStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SUCoreFSM_registerAllActions_withInfoClass___block_invoke;
  block[3] = &unk_1E60B6C20;
  block[4] = self;
  id v11 = v6;
  Class v12 = a4;
  id v9 = v6;
  dispatch_sync(v8, block);
}

void __46__SUCoreFSM_registerAllActions_withInfoClass___block_invoke(uint64_t a1)
{
  v2 = +[SUCoreDiag sharedDiag];
  [v2 trackBegin:@"[FSM] API: registerAllActions"];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [v3 stateTable];
  uint64_t v7 = [*(id *)(a1 + 32) registeredActionTable];
  [v3 _registerAllActions:v4 withInfoClass:v5 stateTable:v6 actionTable:v7 loggingRegistration:1];

  id v8 = +[SUCoreDiag sharedDiag];
  [v8 trackEnd:@"[FSM] API: registerAllActions"];
}

- (void)_registerAllActions:(id)a3 withInfoClass:(Class)a4 stateTable:(id)a5 actionTable:(id)a6 loggingRegistration:(BOOL)a7
{
  id v12 = a3;
  id v13 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke;
  v16[3] = &unk_1E60B6C70;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  Class v19 = a4;
  BOOL v20 = a7;
  id v14 = v13;
  id v15 = v12;
  [a5 enumerateKeysAndObjectsUsingBlock:v16];
}

void __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke_2;
  v10[3] = &unk_1E60B6C48;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v13 = v9;
  char v14 = *(unsigned char *)(a1 + 64);
  id v8 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
}

void __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 safeStringForKey:@"FSMAction"];
  if (v5)
  {
    LOBYTE(v6) = *(unsigned char *)(a1 + 72);
    [*(id *)(a1 + 32) _registerAction:v5 ForEvent:v7 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 48) withInfoClass:*(void *)(a1 + 64) actionTable:*(void *)(a1 + 56) loggingRegistration:v6];
  }
}

- (void)_registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7 actionTable:(id)a8 loggingRegistration:(BOOL)a9
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  BOOL v20 = +[SUCoreDiag sharedDiag];
  id v21 = [v19 safeObjectForKey:v17 ofClass:objc_opt_class()];
  if (!v21)
  {
    uint64_t v22 = objc_opt_new();
    if (!v22)
    {
      id v34 = [NSString alloc];
      id v35 = [(SUCoreFSM *)self fullName];
      uint64_t v36 = (void *)[v34 initWithFormat:@"FSM(%@) unable to create actions for state(%@) so dropping registration of action(%@) for event(%@)", v35, v17, v15, v16];
      [v20 trackAnomaly:@"[FSM] REGISTER_EVENT" forReason:v36 withResult:8100 withError:0];

      goto LABEL_11;
    }
    id v21 = (void *)v22;
    [v19 setSafeObject:v22 forKey:v17];
  }
  int v23 = [v16 isEqualToString:@"Teardown"];
  if (a7 && v23)
  {
    id v24 = [NSString alloc];
    id v25 = [(SUCoreFSM *)self fullName];
    uint64_t v26 = [v24 initWithFormat:@"FSM(%@) action delegate registering for event(%@) with Class - not supported", v25, v16];
  }
  else
  {
    Class v27 = [v21 objectForKey:v16];

    if (!v27)
    {
      uint64_t v30 = [[SUCoreFSMAttachedAction alloc] initWithAction:v15 usingDelegate:v18 withInfoClass:a7];
      [v21 setSafeObject:v30 forKey:v16];
      [v19 setSafeObject:v21 forKey:v17];
      if (a9)
      {
        id v37 = v30;
        id v31 = +[SUCoreLog sharedLogger];
        uint64_t v32 = [v31 oslog];

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [(SUCoreFSM *)self fullName];
          *(_DWORD *)buf = 138544130;
          uint64_t v39 = v33;
          __int16 v40 = 2114;
          id v41 = v15;
          __int16 v42 = 2114;
          id v43 = v16;
          __int16 v44 = 2114;
          id v45 = v17;
          _os_log_impl(&dword_1B4EC2000, v32, OS_LOG_TYPE_DEFAULT, "[FSM] REGISTER_EVENT: FSM(%{public}@) attached action(%{public}@) handling event(%{public}@) in state(%{public}@)", buf, 0x2Au);
        }
        uint64_t v30 = v37;
      }

      goto LABEL_10;
    }
    id v28 = [NSString alloc];
    id v25 = [(SUCoreFSM *)self fullName];
    uint64_t v26 = [v28 initWithFormat:@"FSM(%@) action delegate already registered as event handler for event(%@)", v25, v16];
  }
  id v29 = (void *)v26;
  [v20 trackAnomaly:@"[FSM] REGISTER_EVENT" forReason:v26 withResult:8111 withError:0];

LABEL_10:
LABEL_11:
}

- (void)activateMachine
{
  v3 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v4 = [(SUCoreFSM *)self extendedStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SUCoreFSM_activateMachine__block_invoke;
  block[3] = &unk_1E60B6300;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __28__SUCoreFSM_activateMachine__block_invoke(uint64_t a1)
{
  v2 = +[SUCoreDiag sharedDiag];
  [v2 trackBegin:@"[FSM] API: activateMachine" atLevel:1];

  if ([*(id *)(a1 + 32) isActive])
  {
    v3 = +[SUCoreDiag sharedDiag];
    id v9 = v3;
    uint64_t v4 = 8502;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 stateTable];
    id v7 = [*(id *)(a1 + 32) registeredActionTable];
    LODWORD(v5) = [v5 _activateMachineWithStateTable:v6 withActionTable:v7];

    if (v5)
    {
      id v8 = [*(id *)(a1 + 32) startState];
      [*(id *)(a1 + 32) setCurrentState:v8];

      [*(id *)(a1 + 32) setIsActive:1];
      id v9 = +[SUCoreDiag sharedDiag];
      [v9 trackEnd:@"[FSM] API: activateMachine" atLevel:1];
      goto LABEL_7;
    }
    v3 = +[SUCoreDiag sharedDiag];
    id v9 = v3;
    uint64_t v4 = 8503;
  }
  [v3 trackEnd:@"[FSM] API: activateMachine" atLevel:1 withResult:v4 withError:0];
LABEL_7:
}

- (BOOL)_activateMachineWithStateTable:(id)a3 withActionTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SUCoreDiag sharedDiag];
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke;
  v13[3] = &unk_1E60B6CC0;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = self;
  id v18 = &v19;
  id v11 = v7;
  id v17 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  LOBYTE(v7) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v7;
}

void __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke_2;
  v10[3] = &unk_1E60B6C98;
  id v11 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(a1 + 56);
  id v12 = v6;
  uint64_t v13 = v7;
  uint64_t v16 = *(void *)(a1 + 64);
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
}

void __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v5 = a3;
  id v6 = [v5 safeStringForKey:@"FSMNextState"];
  uint64_t v7 = [v5 safeStringForKey:@"FSMAction"];

  if (v6 && ([v6 isEqualToString:@"NOT_VALID"] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 32) safeDictionaryForKey:v6 fromBase:@"SUCoreFSM stateTable" withKeyDescription:@"next state"];
    if (!v8)
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = [NSString alloc];
      id v11 = [*(id *)(a1 + 48) fullName];
      id v12 = (void *)[v10 initWithFormat:@"FSM(%@) with nextState(%@) that is not defined in state table", v11, v6];
      [v9 trackAnomaly:@"[FSM] ACTIVATE_MACHINE" forReason:v12 withResult:8100 withError:0];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
  }
  if (v7)
  {
    uint64_t v13 = [*(id *)(a1 + 56) safeDictionaryForKey:*(void *)(a1 + 64) fromBase:@"SUCoreFSM actionTable" withKeyDescription:@"FSM state"];
    id v14 = [v13 safeObjectForKey:v29 ofClass:objc_opt_class()];
    id v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 fsmAction];
      char v17 = [v7 isEqualToString:v16];

      if ((v17 & 1) == 0)
      {
        id v24 = *(void **)(a1 + 40);
        id v25 = [NSString alloc];
        BOOL v20 = [*(id *)(a1 + 48) fullName];
        uint64_t v26 = *(void *)(a1 + 64);
        int v23 = [v15 fsmAction];
        Class v27 = (void *)[v25 initWithFormat:@"FSM(%@) forEvent(%@) inState(%@) table action(%@) != registered event action(%@)", v20, v29, v26, v7, v23];
        [v24 trackAnomaly:@"[FSM] ACTIVATE_MACHINE" forReason:v27 withResult:8100 withError:0];

        goto LABEL_15;
      }
      if (![v29 isEqualToString:@"Teardown"]
        || ![v15 eventInfoClass])
      {
        goto LABEL_16;
      }
      id v18 = *(void **)(a1 + 40);
      id v19 = [NSString alloc];
      BOOL v20 = [*(id *)(a1 + 48) fullName];
      uint64_t v21 = [v19 initWithFormat:@"FSM(%@) forEvent(%@) inState(%@) indicates event info Class when not supported", v20, v29, *(void *)(a1 + 64), v28];
    }
    else
    {
      id v18 = *(void **)(a1 + 40);
      id v22 = [NSString alloc];
      BOOL v20 = [*(id *)(a1 + 48) fullName];
      uint64_t v21 = [v22 initWithFormat:@"FSM(%@) forEvent(%@) inState(%@) hasAction(%@) yet event handler has not been registered", v20, v29, *(void *)(a1 + 64), v7];
    }
    int v23 = (void *)v21;
    [v18 trackAnomaly:@"[FSM] ACTIVATE_MACHINE" forReason:v21 withResult:8100 withError:0];
LABEL_15:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
LABEL_16:
  }
}

- (void)postEvent:(id)a3
{
}

- (void)postProtectedEvent:(id)a3
{
}

- (void)postProtectedEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  uint64_t v7 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[SUCoreDiag sharedDiag];
  [v8 trackBegin:@"[FSM] API: postProtectedEvent" atLevel:0];

  [(SUCoreFSM *)self _postEvent:v9 withInfo:v6];
}

- (void)followupEvent:(id)a3
{
}

- (id)copyCurrentState
{
  v3 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  id v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  uint64_t v4 = [(SUCoreFSM *)self extendedStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__SUCoreFSM_copyCurrentState__block_invoke;
  v7[3] = &unk_1E60B6328;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__SUCoreFSM_copyCurrentState__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) currentState];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)copyCurrentStateProtected
{
  uint64_t v3 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreFSM *)self currentState];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (void)dumpEventInStateOccurrences:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreFSM *)self extendedStateQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(SUCoreFSM *)self extendedStateQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke;
  v8[3] = &unk_1E60B62D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateTable];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 stateTable];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_2;
    v11[3] = &unk_1E60B6638;
    id v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v11];
  }
  else
  {
    id v10 = [v3 diag];
    id v6 = [NSString alloc];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) fullName];
    id v9 = (void *)[v6 initWithFormat:@"%@:FSM(%@) has no defined state table", v7, v8];
    [v10 trackAnomaly:@"[FSM] DUMP_EVENT_IN_STATE" forReason:v9 withResult:8117 withError:0];
  }
}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_3;
  v8[3] = &unk_1E60B6CE8;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 safeStringForKey:@"FSMAction"];
  id v7 = [*(id *)(a1 + 32) usageTable];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) usageTable];
    id v9 = [v8 safeDictionaryForKey:*(void *)(a1 + 40) fromBase:@"dumpEventInStateOccurrences" withKeyDescription:@"state name"];

    if (v9)
    {
      id v10 = [v9 safeDictionaryForKey:v5 fromBase:@"dumpEventInStateOccurrences" withKeyDescription:@"event name"];

      if (v10)
      {
        uint64_t v11 = [v10 safeULLForKey:@"FSMOccurrences"];
        id v12 = +[SUCoreLog sharedLogger];
        id v13 = [v12 oslog];

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 48);
          uint64_t v15 = [*(id *)(a1 + 32) fsmName];
          uint64_t v16 = (void *)v15;
          uint64_t v17 = *(void *)(a1 + 40);
          id v18 = @"NONE";
          int v24 = 138413570;
          if (v6) {
            id v18 = v6;
          }
          uint64_t v25 = v14;
          __int16 v26 = 2112;
          uint64_t v27 = v15;
          __int16 v28 = 2112;
          uint64_t v29 = v17;
          __int16 v30 = 2112;
          id v31 = v5;
          __int16 v32 = 2112;
          uint64_t v33 = v18;
          __int16 v34 = 2048;
          uint64_t v35 = v11;
          _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, "[FSM] DUMP_EVENT_IN_STATE | %@:FSM(%@) | STATE(%@) EVENT(%@) ACTION(%@) | occurrences:%llu", (uint8_t *)&v24, 0x3Eu);
        }
LABEL_12:

        goto LABEL_13;
      }
    }
  }
  id v19 = +[SUCoreLog sharedLogger];
  id v10 = [v19 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = [*(id *)(a1 + 32) fsmName];
    id v13 = v21;
    uint64_t v22 = *(void *)(a1 + 40);
    int v23 = @"NONE";
    int v24 = 138413314;
    if (v6) {
      int v23 = v6;
    }
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    uint64_t v27 = v21;
    __int16 v28 = 2112;
    uint64_t v29 = v22;
    __int16 v30 = 2112;
    id v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v23;
    _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[FSM] DUMP_EVENT_IN_STATE | %@:FSM(%@) | STATE(%@) EVENT(%@) ACTION(%@) | occurrences:0", (uint8_t *)&v24, 0x34u);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_simulateEventAlteration:(id)a3 fsmEvent:(id *)a4 eventInfo:(id *)a5 attachedAction:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 simAction];
  if (v11 == 10)
  {
    id v18 = [v10 fsmEvent];
    id v19 = *a5;
    id v27 = 0;
    uint64_t v20 = [(SUCoreFSM *)self _acceptEvent:v18 withInfo:v19 issueType:@"simulate" attachedAction:&v27];
    id v21 = v27;

    if (v20)
    {
      *a4 = [v10 fsmEvent];
      *a6 = v21;
    }
  }
  else if (v11 == 9)
  {
    id v12 = *a6;
    id v13 = [SUCoreFSMAttachedAction alloc];
    uint64_t v14 = [v10 alteration];
    uint64_t v15 = [v12 actionDelegate];
    uint64_t v16 = -[SUCoreFSMAttachedAction initWithAction:usingDelegate:withInfoClass:](v13, "initWithAction:usingDelegate:withInfoClass:", v14, v15, [v12 eventInfoClass]);

    uint64_t v17 = v16;
    *a6 = v17;
  }
  else
  {
    uint64_t v22 = [(SUCoreFSM *)self diag];
    id v23 = [NSString alloc];
    int v24 = [(SUCoreFSM *)self fsmName];
    uint64_t v25 = [v10 summary];
    __int16 v26 = (void *)[v23 initWithFormat:@"FSM(%@) unsupported simulate action: %@", v24, v25];
    [v22 trackAnomaly:@"[FSM] SIMULATE" forReason:v26 withResult:8113 withError:0];
  }
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setUsageTable:(id)a3
{
}

- (unint64_t)untrackedOccurrences
{
  return self->_untrackedOccurrences;
}

- (void)setUntrackedOccurrences:(unint64_t)a3
{
  self->_untrackedOccurrences = a3;
}

- (NSString)startState
{
  return self->_startState;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void)setCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedStateQueue, 0);
  objc_storeStrong(&self->_pendingFollowupInfo, 0);
  objc_storeStrong((id *)&self->_pendingFollowupEvent, 0);
  objc_storeStrong((id *)&self->_registeredActionTable, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_diag, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_storeStrong((id *)&self->_usageTable, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
  objc_storeStrong((id *)&self->_fsmName, 0);
}

@end