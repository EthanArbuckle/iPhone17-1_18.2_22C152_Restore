@interface SUCoreSimulate
+ (id)sharedSimulator;
- (BOOL)_isImmediateEvent:(id)a3;
- (BOOL)_isValidEvent:(id)a3;
- (BOOL)_parseDictionaryFromString:(id)a3 destination:(id *)a4;
- (BOOL)_parseErrorCodeFromString:(id)a3 destination:(int64_t *)a4;
- (BOOL)_parseEventBooleanFromString:(id)a3 destination:(int64_t *)a4;
- (BOOL)_parseIntFromString:(id)a3 destination:(int *)a4;
- (BOOL)_parseOptionalEntriesInLineFromWords:(id)a3 argStartAt:(int *)a4 argEndAt:(int *)a5 argDuration:(int *)a6 argUntilStop:(id *)a7 argAssetBuildVersions:(id *)a8 argAssetProductVersions:(id *)a9 argAssetAttributesPlist:(id *)a10 argAssetState:(id *)a11 argUpdateInfoPlist:(id *)a12 argErrorDomain:(id *)a13 argErrorCode:(int64_t *)a14 argErrorUserInfo:(id *)a15 argErrorRecoverable:(int64_t *)a16;
- (BOOL)simulatorEnabled;
- (NSDictionary)eventAlterations;
- (OS_dispatch_queue)simulateQueue;
- (SUCoreSimulate)init;
- (SUCoreSimulateEvent)lastAlteration;
- (id)_eventFromLine:(id)a3;
- (id)_locateEventForModule:(id)a3 forIdentity:(id)a4 withTrigger:(int64_t)a5 forEvent:(id)a6 inState:(id)a7;
- (id)_performOffQueueEvent:(id)a3;
- (id)_performSimulatedEventAlteration:(id)a3;
- (id)_splitString:(id)a3 byTheFirstOccurrenceOf:(id)a4;
- (id)begin:(id)a3 atFunction:(id)a4;
- (id)end:(id)a3 atFunction:(id)a4;
- (id)fsm:(id)a3 forEvent:(id)a4 inState:(id)a5;
- (id)generateError:(id)a3 ofDomain:(id)a4 withCode:(int64_t)a5;
- (id)lastAlterationPerformed;
- (id)registeredCallback;
- (int)alterationsPerformed;
- (int)countOfAlterationsPerformed;
- (int64_t)_actionFromString:(id)a3;
- (int64_t)_triggerFromString:(id)a3;
- (void)_adoptAllEventAlterations:(id)a3;
- (void)_dumpAllEventAlterations;
- (void)_performingAlteration:(id)a3;
- (void)_triggerOffQueueAlteration:(id)a3;
- (void)adoptAllEventAlterations:(id)a3;
- (void)clearAllEventAlterations;
- (void)dumpAllEventAlterations;
- (void)setAlterationsPerformed:(int)a3;
- (void)setEventAlterations:(id)a3;
- (void)setLastAlteration:(id)a3;
- (void)setRegisteredCallback:(id)a3;
@end

@implementation SUCoreSimulate

+ (id)sharedSimulator
{
  if (sharedSimulator_simulatorOnce != -1) {
    dispatch_once(&sharedSimulator_simulatorOnce, &__block_literal_global);
  }
  v2 = (void *)sharedSimulator_simulator;
  return v2;
}

- (id)end:(id)a3 atFunction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    v8 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v8);

    v9 = [(SUCoreSimulate *)self simulateQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __33__SUCoreSimulate_end_atFunction___block_invoke;
    v17 = &unk_1E60B6350;
    v21 = &v22;
    v18 = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_sync(v9, &v14);

    uint64_t v10 = -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5], v14, v15, v16, v17, v18);
    v11 = (void *)v23[5];
    v23[5] = v10;
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (BOOL)simulatorEnabled
{
  return self->_simulatorEnabled;
}

- (id)_performOffQueueEvent:(id)a3
{
  v56[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_not_V2(v5);

  if (!v4) {
    goto LABEL_37;
  }
  id v6 = [v4 untilStop];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F28378];
    uint64_t v8 = *MEMORY[0x1E4F28330];
    v55[0] = *MEMORY[0x1E4F28370];
    v55[1] = v8;
    v56[0] = v7;
    v56[1] = &unk_1F0D9E130;
    uint64_t v9 = *MEMORY[0x1E4F282E0];
    v55[2] = *MEMORY[0x1E4F28320];
    v55[3] = v9;
    v56[2] = @"root";
    v56[3] = @"wheel";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = [v4 untilStop];
    v13 = [v4 summary];
    uint64_t v14 = [v13 dataUsingEncoding:4];
    int v15 = [v11 createFileAtPath:v12 contents:v14 attributes:v10];

    if (v15)
    {
      v16 = NSString;
      v17 = dispatch_get_current_queue();
      v18 = [v16 stringWithUTF8String:dispatch_queue_get_label(v17)];

      id v19 = +[SUCoreLog sharedLogger];
      id v20 = [v19 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v4 untilStop];
        *(_DWORD *)buf = 138412546;
        *(void *)v54 = v21;
        *(_WORD *)&v54[8] = 2112;
        *(void *)&v54[10] = v18;
        _os_log_impl(&dword_1B4EC2000, v20, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - pausing until stop file(%@) has been deleted (running on queue %@)...", buf, 0x16u);
      }
      uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      v23 = [v4 untilStop];
      int v24 = [v22 fileExistsAtPath:v23];

      if (v24)
      {
        do
        {
          sleep(1u);
          v25 = [MEMORY[0x1E4F28CB8] defaultManager];
          v26 = [v4 untilStop];
          char v27 = [v25 fileExistsAtPath:v26];
        }
        while ((v27 & 1) != 0);
      }
      v28 = +[SUCoreLog sharedLogger];
      v29 = [v28 oslog];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [v4 untilStop];
        *(_DWORD *)buf = 138412290;
        *(void *)v54 = v30;
        _os_log_impl(&dword_1B4EC2000, v29, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - ...pausing [stop file(%@) has been deleted]", buf, 0xCu);
      }
    }
    else
    {
      v31 = +[SUCoreLog sharedLogger];
      v32 = [v31 oslog];

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v4 untilStop];
        *(_DWORD *)buf = 138412290;
        *(void *)v54 = v33;
        _os_log_impl(&dword_1B4EC2000, v32, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - unable to create stop file(%@)", buf, 0xCu);
      }
      v18 = [v4 untilStop];
      NSLog((NSString *)@"[SIMULATE] PERFORM(OFF_QUEUE) - unable to create stop file(%@)", v18);
    }
  }
  if ((int)[v4 duration] > 0) {
    goto LABEL_16;
  }
  v35 = [v4 untilStop];
  if (v35)
  {
LABEL_28:

    goto LABEL_29;
  }
  if ([v4 simAction] == 8)
  {
LABEL_16:
    if ((int)[v4 duration] < 1) {
      unsigned int v34 = 5;
    }
    else {
      unsigned int v34 = [v4 duration];
    }
    v36 = +[SUCoreLog sharedLogger];
    v37 = [v36 oslog];

    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = @"s";
      if (v34 == 1) {
        v38 = &stru_1F0D92C90;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = v34;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v38;
      _os_log_impl(&dword_1B4EC2000, v37, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - sleeping for %d second%@...", buf, 0x12u);
    }

    sleep(v34);
    v39 = +[SUCoreLog sharedLogger];
    v35 = [v39 oslog];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v35, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - ...sleeping", buf, 2u);
    }
    goto LABEL_28;
  }
LABEL_29:
  id v40 = 0;
  switch([v4 simAction])
  {
    case 0:
    case 2:
    case 4:
    case 11:
      v41 = +[SUCoreDiag sharedDiag];
      id v42 = [NSString alloc];
      v43 = [v4 summary];
      uint64_t v44 = [v42 initWithFormat:@"action should never be indicated when handling off-queue: %@", v43];
      goto LABEL_35;
    case 1:
    case 3:
    case 9:
    case 10:
      id v40 = v4;
      goto LABEL_38;
    case 5:
      while ([v4 simAction] == 5)
        ;
      break;
    case 6:
      v41 = dispatch_semaphore_create(0);
      dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_36;
    case 7:
      uint64_t v48 = [(SUCoreSimulate *)self registeredCallback];
      v41 = v48;
      if (v48)
      {
        (*(void (**)(uint64_t, id))(v48 + 16))(v48, v4);
      }
      else
      {
        v49 = +[SUCoreDiag sharedDiag];
        id v50 = [NSString alloc];
        v51 = [v4 summary];
        v52 = (void *)[v50 initWithFormat:@"no registered callback when handling off-queue: %@", v51];
        [v49 trackError:@"[SIMULATE] PERFORM(OFF_QUEUE)" forReason:v52 withResult:8101 withError:0];
      }
      goto LABEL_36;
    case 8:
      goto LABEL_38;
    default:
      v41 = +[SUCoreDiag sharedDiag];
      id v45 = [NSString alloc];
      v43 = [v4 summary];
      uint64_t v44 = [v45 initWithFormat:@"unknown simulate action: %@", v43];
LABEL_35:
      v46 = (void *)v44;
      [v41 trackError:@"[SIMULATE] PERFORM(OFF_QUEUE)" forReason:v44 withResult:8113 withError:0];

LABEL_36:
      break;
  }
LABEL_37:
  id v40 = 0;
LABEL_38:

  return v40;
}

- (id)_locateEventForModule:(id)a3 forIdentity:(id)a4 withTrigger:(int64_t)a5 forEvent:(id)a6 inState:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v39 = a7;
  uint64_t v14 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v14);

  int v15 = [(SUCoreSimulate *)self eventAlterations];

  if (!v15) {
    goto LABEL_30;
  }
  v37 = self;
  v16 = [(SUCoreSimulate *)self eventAlterations];
  v17 = [v16 safeObjectForKey:v11 ofClass:objc_opt_class()];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v19)
  {

LABEL_30:
    v33 = 0;
    goto LABEL_31;
  }
  uint64_t v20 = v19;
  id v36 = v11;
  id v40 = 0;
  id v41 = v18;
  uint64_t v21 = *(void *)v43;
  uint64_t v22 = v37;
  int64_t v23 = a5;
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v43 != v21) {
        objc_enumerationMutation(v18);
      }
      v25 = *(void **)(*((void *)&v42 + 1) + 8 * v24);
      v26 = objc_msgSend(v25, "identityName", v36);
      int v27 = [v26 isEqualToString:v12];
      if (!v13)
      {
        if (!v27) {
          goto LABEL_19;
        }
        uint64_t v31 = [v25 simTrigger];

        if (v31 == v23)
        {
          objc_msgSend(v25, "setCount:", objc_msgSend(v25, "count") + 1);
          id v18 = v41;
          if (![(SUCoreSimulate *)v22 _isValidEvent:v25]) {
            goto LABEL_20;
          }
          v26 = v40;
          id v40 = v25;
          goto LABEL_19;
        }
        goto LABEL_23;
      }
      if (!v27 || [v25 simTrigger] != v23) {
        goto LABEL_19;
      }
      v28 = [v25 fsmEvent];
      if (([v28 isEqualToString:v13] & 1) == 0)
      {

        id v18 = v41;
        goto LABEL_19;
      }
      v29 = [v25 fsmState];
      int v30 = [v29 isEqualToString:v39];

      if (!v30)
      {
        uint64_t v22 = v37;
        int64_t v23 = a5;
LABEL_23:
        id v18 = v41;
        goto LABEL_20;
      }
      objc_msgSend(v25, "setCount:", objc_msgSend(v25, "count") + 1);
      uint64_t v22 = v37;
      id v18 = v41;
      if ([(SUCoreSimulate *)v37 _isValidEvent:v25])
      {
        v26 = v40;
        id v40 = v25;
        int64_t v23 = a5;
LABEL_19:

        goto LABEL_20;
      }
      int64_t v23 = a5;
LABEL_20:
      ++v24;
    }
    while (v20 != v24);
    uint64_t v32 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    uint64_t v20 = v32;
  }
  while (v32);

  v33 = v40;
  if (v40)
  {
    id v11 = v36;
    if ([(SUCoreSimulate *)v22 _isImmediateEvent:v40])
    {
      uint64_t v34 = [(SUCoreSimulate *)v22 _performSimulatedEventAlteration:v40];

      v33 = (void *)v34;
    }
    else
    {
      [(SUCoreSimulate *)v22 _triggerOffQueueAlteration:v40];
    }
  }
  else
  {
    id v11 = v36;
  }
LABEL_31:

  return v33;
}

- (OS_dispatch_queue)simulateQueue
{
  return self->_simulateQueue;
}

- (NSDictionary)eventAlterations
{
  return self->_eventAlterations;
}

- (id)begin:(id)a3 atFunction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  int64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    uint64_t v8 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v8);

    uint64_t v9 = [(SUCoreSimulate *)self simulateQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __35__SUCoreSimulate_begin_atFunction___block_invoke;
    v17 = &unk_1E60B6350;
    uint64_t v21 = &v22;
    id v18 = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_sync(v9, &v14);

    uint64_t v10 = -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5], v14, v15, v16, v17, v18);
    id v11 = (void *)v23[5];
    v23[5] = v10;
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (id)fsm:(id)a3 forEvent:(id)a4 inState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  int64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    id v11 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v11);

    id v12 = [(SUCoreSimulate *)self simulateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__SUCoreSimulate_fsm_forEvent_inState___block_invoke;
    block[3] = &unk_1E60B6378;
    uint64_t v21 = &v22;
    block[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    dispatch_sync(v12, block);

    uint64_t v13 = [(SUCoreSimulate *)self _performOffQueueEvent:v23[5]];
    uint64_t v14 = (void *)v23[5];
    v23[5] = v13;
  }
  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __39__SUCoreSimulate_fsm_forEvent_inState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) _locateEventForModule:@"fsm" forIdentity:*(void *)(a1 + 40) withTrigger:3 forEvent:*(void *)(a1 + 48) inState:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

void __33__SUCoreSimulate_end_atFunction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _locateEventForModule:*(void *)(a1 + 40) forIdentity:*(void *)(a1 + 48) withTrigger:2 forEvent:0 inState:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && ([*(id *)(a1 + 40) isEqualToString:@"*"] & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _locateEventForModule:@"*" forIdentity:*(void *)(a1 + 48) withTrigger:2 forEvent:0 inState:0];
    MEMORY[0x1F41817F8]();
  }
}

void __35__SUCoreSimulate_begin_atFunction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _locateEventForModule:*(void *)(a1 + 40) forIdentity:*(void *)(a1 + 48) withTrigger:1 forEvent:0 inState:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && ([*(id *)(a1 + 40) isEqualToString:@"*"] & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _locateEventForModule:@"*" forIdentity:*(void *)(a1 + 48) withTrigger:1 forEvent:0 inState:0];
    MEMORY[0x1F41817F8]();
  }
}

uint64_t __33__SUCoreSimulate_sharedSimulator__block_invoke()
{
  sharedSimulator_simulator = objc_alloc_init(SUCoreSimulate);
  return MEMORY[0x1F41817F8]();
}

- (SUCoreSimulate)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SUCoreSimulate;
  uint64_t v2 = [(SUCoreSimulate *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[SUCoreDevice sharedDevice];
    v2->_simulatorEnabled = [v3 isBootedOSSecureInternal];

    eventAlterations = v2->_eventAlterations;
    v2->_eventAlterations = 0;

    id registeredCallback = v2->_registeredCallback;
    v2->_id registeredCallback = 0;

    id v6 = +[SUCore sharedCore];
    id v7 = [v6 commonDomain];

    id v8 = (id) [[NSString alloc] initWithFormat:@"%@.%@", v7, @"core.simulate"];
    id v9 = (const char *)[v8 UTF8String];
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    simulateQueue = v2->_simulateQueue;
    v2->_simulateQueue = (OS_dispatch_queue *)v11;

    if (v2->_simulateQueue)
    {
      uint64_t v13 = +[SUCoreLog sharedLogger];
      uint64_t v14 = [v13 oslog];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        uint64_t v21 = @"core.simulate";
        _os_log_impl(&dword_1B4EC2000, v14, OS_LOG_TYPE_DEFAULT, "[SIMULATE] DISPATCH: created simulate dispatch queue domain(%@.%@)", buf, 0x16u);
      }
    }
    else
    {
      id v15 = +[SUCoreDiag sharedDiag];
      [v15 trackError:@"[SIMULATE] DISPATCH" forReason:@"failed to create simulate dispatch queue" withResult:8100 withError:0];

      v2->_simulatorEnabled = 0;
    }
  }
  return v2;
}

- (void)adoptAllEventAlterations:(id)a3
{
  id v4 = a3;
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    v5 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v5);

    id v6 = [(SUCoreSimulate *)self simulateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SUCoreSimulate_adoptAllEventAlterations___block_invoke;
    block[3] = &unk_1E60B62D8;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(v6, block);
  }
  else
  {
    id v7 = +[SUCoreLog sharedLogger];
    id v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot adopt event alterations (simulator disabled)", v9, 2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot adopt event alterations (simulator disabled)");
  }
}

uint64_t __43__SUCoreSimulate_adoptAllEventAlterations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adoptAllEventAlterations:*(void *)(a1 + 40)];
}

- (void)_adoptAllEventAlterations:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreSimulate *)self eventAlterations];

  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (![v8 fileExistsAtPath:v4])
    {
      id v12 = +[SUCoreLog sharedLogger];
      uint64_t v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v4;
        _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, "[SIMULATE] simulate event alterations file does not exist (file non-existent): %@", buf, 0xCu);
      }

      NSLog((NSString *)@"[SIMULATE] simulate event alterations file does not exist (file non-existent): %@", v4);
      goto LABEL_33;
    }
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v43 = 0;
    id v9 = [NSString stringWithContentsOfFile:v4 encoding:1 error:&v43];
    id v10 = v43;
    if (v10)
    {
      id v11 = +[SUCoreDiag sharedDiag];
      [v11 trackError:@"[SIMULATE] SETUP" forReason:@"adopt event alterations (load failed)" withResult:8121 withError:v10];
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    uint64_t v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\r\n"];
    id v15 = [v9 componentsSeparatedByCharactersInSet:v14];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = v15;
    uint64_t v16 = [v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v34 = v9;
      v35 = v8;
      id v36 = v4;
      uint64_t v18 = *(void *)v40;
      char v37 = 1;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v11);
          }
          __int16 v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v20 length])
          {
            uint64_t v21 = objc_msgSend(v20, "substringWithRange:", 0, 1);
            char v22 = [v21 isEqualToString:@"#"];

            if ((v22 & 1) == 0)
            {
              int64_t v23 = [(SUCoreSimulate *)self _eventFromLine:v20];
              uint64_t v24 = v23;
              if (v23)
              {
                v25 = [v23 moduleName];
                id v26 = [v38 safeObjectForKey:v25 ofClass:objc_opt_class()];

                if (!v26)
                {
                  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  id v27 = [v24 moduleName];
                  [v38 setSafeObject:v26 forKey:v27];
                }
                v28 = +[SUCoreLog sharedLogger];
                v29 = [v28 oslog];

                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  int v30 = [v24 summary];
                  *(_DWORD *)buf = 138412290;
                  id v45 = v30;
                  _os_log_impl(&dword_1B4EC2000, v29, OS_LOG_TYPE_DEFAULT, "[SIMULATE] adding event: %@", buf, 0xCu);
                }
                [v26 addObject:v24];
              }
              else
              {
                uint64_t v31 = +[SUCoreLog sharedLogger];
                uint64_t v32 = [v31 oslog];

                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v45 = v20;
                  _os_log_impl(&dword_1B4EC2000, v32, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing line: %@", buf, 0xCu);
                }

                NSLog((NSString *)@"[SIMULATE] failed parsing line: %@", v20);
                char v37 = 0;
              }
            }
          }
        }
        uint64_t v17 = [v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v17);

      id v8 = v35;
      id v4 = v36;
      id v9 = v34;
      if ((v37 & 1) == 0)
      {
        v33 = +[SUCoreDiag sharedDiag];
        [v33 trackError:@"[SIMULATE] SETUP" forReason:@"adopt event alterations (parsing failed)" withResult:8121 withError:0];

        goto LABEL_32;
      }
    }
    else
    {
    }
    [(SUCoreSimulate *)self setEventAlterations:v38];
    goto LABEL_32;
  }
  id v7 = +[SUCoreDiag sharedDiag];
  [v7 trackError:@"[SIMULATE] SETUP" forReason:@"adopt event alterations (already adopted)" withResult:8111 withError:0];

LABEL_34:
}

- (id)_eventFromLine:(id)a3
{
  id v4 = a3;
  unsigned int v58 = -1;
  v59[0] = -1;
  int v57 = -1;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  v5 = [v4 componentsSeparatedByString:@"--"];
  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v8 = [v6 stringByTrimmingCharactersInSet:v7];

    id v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\t "];
    id v10 = [v8 componentsSeparatedByCharactersInSet:v9];
  }
  else
  {
    id v10 = 0;
  }
  if ((unint64_t)[v5 count] < 2)
  {
    id v15 = 0;
    if (!v10) {
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = [v5 objectAtIndexedSubscript:1];
    id v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

    uint64_t v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\t "];
    id v15 = [v13 componentsSeparatedByCharactersInSet:v14];

    if (!v10) {
      goto LABEL_11;
    }
  }
  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v16 = [v10 objectAtIndexedSubscript:0];
    int64_t v17 = [(SUCoreSimulate *)self _actionFromString:v16];

    int64_t v18 = v17;
    id v19 = [v10 objectAtIndexedSubscript:1];
    int64_t v42 = [(SUCoreSimulate *)self _triggerFromString:v19];

    if (v15) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_11:
  int64_t v42 = 0;
  int64_t v18 = 0;
  if (v15)
  {
LABEL_12:
    id v53 = 0;
    id v54 = 0;
    id v51 = 0;
    id v52 = 0;
    id v49 = 0;
    id v50 = 0;
    id v47 = 0;
    id v48 = 0;
    BOOL v24 = [(SUCoreSimulate *)self _parseOptionalEntriesInLineFromWords:v15 argStartAt:v59 argEndAt:&v58 argDuration:&v57 argUntilStop:&v54 argAssetBuildVersions:&v53 argAssetProductVersions:&v52 argAssetAttributesPlist:&v51 argAssetState:&v50 argUpdateInfoPlist:&v49 argErrorDomain:&v48 argErrorCode:&v56 argErrorUserInfo:&v47 argErrorRecoverable:&v55];
    id v20 = v54;
    id v46 = v53;
    id v45 = v52;
    id v44 = v51;
    id v21 = v50;
    id v43 = v49;
    id v22 = v48;
    id v23 = v47;
    if (!v24) {
      goto LABEL_25;
    }
    goto LABEL_13;
  }
LABEL_10:
  id v20 = 0;
  id v45 = 0;
  id v46 = 0;
  id v43 = 0;
  id v44 = 0;
  id v21 = 0;
  id v22 = 0;
  id v23 = 0;
LABEL_13:
  if (v18 && v42)
  {
    if ([v10 count] == 4)
    {
      int64_t v39 = v18;
      id v25 = v4;
      id v26 = [SUCoreSimulateEvent alloc];
      id v27 = [v10 objectAtIndexedSubscript:2];
      uint64_t v28 = [v10 objectAtIndexedSubscript:3];
      id v29 = v20;
      int v30 = (void *)v28;
      id v41 = v29;
      LODWORD(v36) = v57;
      uint64_t v31 = v26;
      id v4 = v25;
      uint64_t v32 = -[SUCoreSimulateEvent initWithAction:onTrigger:forModule:atFunction:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](v31, "initWithAction:onTrigger:forModule:atFunction:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", v39, v42, v27, v30, v59[0], v58, v36, v29, v46, v45, v44, v21, v43, v22, v56, v23,
              v55);
      goto LABEL_24;
    }
    if (([v10 count] == 5 || objc_msgSend(v10, "count") == 6) && v42 == 3)
    {
      id v38 = v4;
      id v41 = v20;
      if ([v10 count] == 6)
      {
        id v27 = [v10 objectAtIndexedSubscript:5];
      }
      else
      {
        id v27 = 0;
      }
      long long v40 = [SUCoreSimulateEvent alloc];
      int v30 = [v10 objectAtIndexedSubscript:2];
      v33 = [v10 objectAtIndexedSubscript:3];
      char v37 = [v10 objectAtIndexedSubscript:4];
      uint64_t v32 = -[SUCoreSimulateEvent initWithAction:onTrigger:forMachine:atEvent:inState:alteration:startAt:endAt:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](v40, "initWithAction:onTrigger:forMachine:atEvent:inState:alteration:startAt:endAt:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", v18, 3, v30, v33, v37, v27, __PAIR64__(v58, v59[0]), v46, v45, v44, v21, v43, v22, v56, v23, v55);

      id v4 = v38;
LABEL_24:

      id v20 = v41;
      if (v32) {
        goto LABEL_26;
      }
    }
  }
LABEL_25:
  uint64_t v34 = +[SUCoreDiag sharedDiag];
  [v34 trackAnomaly:@"[SIMULATE] SETUP" forReason:v4 withResult:8112 withError:0];

  uint64_t v32 = 0;
LABEL_26:

  return v32;
}

- (id)_splitString:(id)a3 byTheFirstOccurrenceOf:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = v6;
    id v9 = [v5 substringToIndex:v6];
    id v10 = [v5 substringFromIndex:v8 + 1];
    v12[0] = v9;
    v12[1] = v10;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }
  return v7;
}

- (BOOL)_parseOptionalEntriesInLineFromWords:(id)a3 argStartAt:(int *)a4 argEndAt:(int *)a5 argDuration:(int *)a6 argUntilStop:(id *)a7 argAssetBuildVersions:(id *)a8 argAssetProductVersions:(id *)a9 argAssetAttributesPlist:(id *)a10 argAssetState:(id *)a11 argUpdateInfoPlist:(id *)a12 argErrorDomain:(id *)a13 argErrorCode:(int64_t *)a14 argErrorUserInfo:(id *)a15 argErrorRecoverable:(int64_t *)a16
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = a3;
  uint64_t v18 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
  if (!v18)
  {
    BOOL v99 = 0;
    BOOL v98 = 0;
    id v97 = 0;
    id v96 = 0;
    char v20 = 1;
    goto LABEL_81;
  }
  uint64_t v19 = v18;
  v109 = a8;
  v110 = 0;
  v111 = 0;
  char v20 = 1;
  uint64_t v21 = *(void *)v118;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v118 != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v117 + 1) + 8 * v22);
      BOOL v24 = [(SUCoreSimulate *)self _splitString:v23 byTheFirstOccurrenceOf:@"="];
      id v25 = v24;
      if (!v24 || [v24 count] != 2)
      {
        uint64_t v32 = +[SUCoreLog sharedLogger];
        v33 = [v32 oslog];

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = (uint64_t)v23;
          _os_log_impl(&dword_1B4EC2000, v33, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing tokens (unexpected format, expected 'key=value') for: '%@'", buf, 0xCu);
        }

        NSLog((NSString *)@"[SIMULATE] failed parsing tokens (unexpected format, expected 'key=value') for: '%@'", v23);
        goto LABEL_16;
      }
      id v26 = [v25 objectAtIndexedSubscript:0];
      int v27 = [v26 isEqualToString:@"startAt"];

      if (v27)
      {
        uint64_t v28 = [v25 objectAtIndexedSubscript:1];
        BOOL v29 = [(SUCoreSimulate *)self _parseIntFromString:v28 destination:a4];

        if (v29) {
          goto LABEL_17;
        }
        int v30 = +[SUCoreLog sharedLogger];
        uint64_t v31 = [v30 oslog];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = (uint64_t)v23;
          _os_log_impl(&dword_1B4EC2000, v31, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'startAt' (expected int) for: '%@'", buf, 0xCu);
        }

        NSLog((NSString *)@"[SIMULATE] failed parsing 'startAt' (expected int) for: '%@'", v23);
        goto LABEL_16;
      }
      uint64_t v34 = [v25 objectAtIndexedSubscript:0];
      int v35 = [v34 isEqualToString:@"endAt"];

      if (v35)
      {
        uint64_t v36 = [v25 objectAtIndexedSubscript:1];
        BOOL v37 = [(SUCoreSimulate *)self _parseIntFromString:v36 destination:a5];

        if (!v37)
        {
          id v38 = +[SUCoreLog sharedLogger];
          int64_t v39 = [v38 oslog];

          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v122 = (uint64_t)v23;
            _os_log_impl(&dword_1B4EC2000, v39, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'endAt' (expected int) for: '%@'", buf, 0xCu);
          }

          NSLog((NSString *)@"[SIMULATE] failed parsing 'endAt' (expected int) for: '%@'", v23);
LABEL_16:
          char v20 = 0;
        }
      }
      else
      {
        long long v40 = [v25 objectAtIndexedSubscript:0];
        int v41 = [v40 isEqualToString:@"duration"];

        if (v41)
        {
          int64_t v42 = [v25 objectAtIndexedSubscript:1];
          BOOL v43 = [(SUCoreSimulate *)self _parseIntFromString:v42 destination:a6];

          if (!v43)
          {
            id v44 = +[SUCoreLog sharedLogger];
            id v45 = [v44 oslog];

            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v122 = (uint64_t)v23;
              _os_log_impl(&dword_1B4EC2000, v45, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'duration' (expected int) for: '%@'", buf, 0xCu);
            }

            NSLog((NSString *)@"[SIMULATE] failed parsing 'duration' (expected int) for: '%@'", v23);
            goto LABEL_16;
          }
        }
        else
        {
          id v46 = [v25 objectAtIndexedSubscript:0];
          int v47 = [v46 isEqualToString:@"untilStop"];

          if (a7 && v47)
          {
            *a7 = [v25 objectAtIndexedSubscript:1];
            goto LABEL_17;
          }
          id v48 = [v25 objectAtIndexedSubscript:0];
          int v49 = [v48 isEqualToString:@"assetBuildVersions"];

          if (v49)
          {
            id v50 = [v25 objectAtIndexedSubscript:1];
            uint64_t v51 = [v50 componentsSeparatedByString:@","];

            v111 = (void *)v51;
            goto LABEL_17;
          }
          id v52 = [v25 objectAtIndexedSubscript:0];
          int v53 = [v52 isEqualToString:@"assetProductVersions"];

          if (v53)
          {
            id v54 = [v25 objectAtIndexedSubscript:1];
            uint64_t v55 = [v54 componentsSeparatedByString:@","];

            v110 = (void *)v55;
            goto LABEL_17;
          }
          uint64_t v56 = [v25 objectAtIndexedSubscript:0];
          int v57 = [v56 isEqualToString:@"assetAttributesPlist"];

          if (a10 && v57)
          {
            *a10 = [v25 objectAtIndexedSubscript:1];
            unsigned int v58 = +[SUCoreLog sharedLogger];
            v59 = [v58 oslog];

            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              id v60 = *a10;
              *(_DWORD *)buf = 138412290;
              uint64_t v122 = (uint64_t)v60;
              v61 = v59;
              v62 = "[SIMULATE] using assetAttributesPlist: '%@'";
              goto LABEL_52;
            }
LABEL_53:

            goto LABEL_17;
          }
          v63 = [v25 objectAtIndexedSubscript:0];
          int v64 = [v63 isEqualToString:@"assetState"];

          if (a11 && v64)
          {
            *a11 = [v25 objectAtIndexedSubscript:1];
            v65 = +[SUCoreLog sharedLogger];
            v59 = [v65 oslog];

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_53;
            }
            id v66 = *a11;
            *(_DWORD *)buf = 138412290;
            uint64_t v122 = (uint64_t)v66;
            v61 = v59;
            v62 = "[SIMULATE] using assetState: '%@'";
LABEL_52:
            _os_log_impl(&dword_1B4EC2000, v61, OS_LOG_TYPE_DEFAULT, v62, buf, 0xCu);
            goto LABEL_53;
          }
          v67 = [v25 objectAtIndexedSubscript:0];
          int v68 = [v67 isEqualToString:@"updateInfoPlist"];

          if (a12 && v68)
          {
            *a12 = [v25 objectAtIndexedSubscript:1];
            v69 = +[SUCoreLog sharedLogger];
            v59 = [v69 oslog];

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_53;
            }
            id v70 = *a12;
            *(_DWORD *)buf = 138412290;
            uint64_t v122 = (uint64_t)v70;
            v61 = v59;
            v62 = "[SIMULATE] using updateInfoPlist: '%@'";
            goto LABEL_52;
          }
          v71 = [v25 objectAtIndexedSubscript:0];
          int v72 = [v71 isEqualToString:@"errorDomain"];

          if (a13 && v72)
          {
            *a13 = [v25 objectAtIndexedSubscript:1];
            v73 = +[SUCoreLog sharedLogger];
            v59 = [v73 oslog];

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_53;
            }
            id v74 = *a13;
            *(_DWORD *)buf = 138412290;
            uint64_t v122 = (uint64_t)v74;
            v61 = v59;
            v62 = "[SIMULATE] using errorDomain: '%@'";
            goto LABEL_52;
          }
          v75 = [v25 objectAtIndexedSubscript:0];
          int v76 = [v75 isEqualToString:@"errorCode"];

          if (a14 && v76)
          {
            v77 = [v25 objectAtIndexedSubscript:1];
            BOOL v78 = [(SUCoreSimulate *)self _parseErrorCodeFromString:v77 destination:a14];

            if (!v78)
            {
              v79 = +[SUCoreLog sharedLogger];
              v80 = [v79 oslog];

              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v122 = (uint64_t)v23;
                _os_log_impl(&dword_1B4EC2000, v80, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'errorCode' (expected SUCoreErrorCode) for: '%@'", buf, 0xCu);
              }

              NSLog((NSString *)@"[SIMULATE] failed parsing 'errorCode' (expected SUCoreErrorCode) for: '%@'", v23);
              goto LABEL_16;
            }
          }
          else
          {
            v81 = [v25 objectAtIndexedSubscript:0];
            int v82 = [v81 isEqualToString:@"errorUserInfo"];

            if (a15 && v82)
            {
              v83 = [v25 objectAtIndexedSubscript:1];
              BOOL v84 = [(SUCoreSimulate *)self _parseDictionaryFromString:v83 destination:a15];

              if (!v84)
              {
                v85 = +[SUCoreLog sharedLogger];
                v86 = [v85 oslog];

                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v122 = (uint64_t)v23;
                  _os_log_impl(&dword_1B4EC2000, v86, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'errorUserInfo' (expected {k1=v1;k2=v2;}) for: '%@'",
                    buf,
                    0xCu);
                }

                NSLog((NSString *)@"[SIMULATE] failed parsing 'errorUserInfo' (expected {k1=v1;k2=v2;}) for: '%@'",
                  v23);
                goto LABEL_16;
              }
            }
            else
            {
              v87 = [v25 objectAtIndexedSubscript:0];
              int v88 = [v87 isEqualToString:@"errorRecoverable"];

              if (!a16 || !v88)
              {
                v93 = +[SUCoreLog sharedLogger];
                v94 = [v93 oslog];

                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v122 = (uint64_t)v23;
                  _os_log_impl(&dword_1B4EC2000, v94, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing option (unexpected/unsupported option key) for: '%@'", buf, 0xCu);
                }

                NSLog((NSString *)@"[SIMULATE] failed parsing option (unexpected/unsupported option key) for: '%@'", v23);
                goto LABEL_16;
              }
              v89 = [v25 objectAtIndexedSubscript:1];
              BOOL v90 = [(SUCoreSimulate *)self _parseEventBooleanFromString:v89 destination:a16];

              if (!v90)
              {
                v91 = +[SUCoreLog sharedLogger];
                v92 = [v91 oslog];

                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v122 = (uint64_t)v23;
                  _os_log_impl(&dword_1B4EC2000, v92, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'errorRecoverable' (expected SUCoreSimulateEventBoolean) for: '%@'", buf, 0xCu);
                }

                NSLog((NSString *)@"[SIMULATE] failed parsing 'errorRecoverable' (expected SUCoreSimulateEventBoolean) for: '%@'", v23);
                goto LABEL_16;
              }
            }
          }
        }
      }
LABEL_17:

      ++v22;
    }
    while (v19 != v22);
    uint64_t v95 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
    uint64_t v19 = v95;
  }
  while (v95);
  id v97 = v110;
  id v96 = v111;
  BOOL v98 = v111 != 0;
  BOOL v99 = v110 != 0;
  if (v111 && v110)
  {
    uint64_t v100 = [v111 count];
    if (v100 == [v110 count])
    {
      id v96 = v111;
      id *v109 = v96;
      id v97 = v110;
      *a9 = v97;
      goto LABEL_90;
    }
    v103 = +[SUCoreLog sharedLogger];
    v104 = [v103 oslog];

    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v105 = [v111 count];
      uint64_t v106 = [v110 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v122 = v105;
      __int16 v123 = 2048;
      uint64_t v124 = v106;
      _os_log_impl(&dword_1B4EC2000, v104, OS_LOG_TYPE_DEFAULT, "[SIMULATE] syntax error: assetBuildVersions (%lu) and assetProductVersions (%lu) must have the same count", buf, 0x16u);
    }

    NSLog((NSString *)@"[SIMULATE] syntax error: assetBuildVersions (%lu) and assetProductVersions (%lu) must have the same count", [v111 count], objc_msgSend(v110, "count"));
LABEL_89:
    char v20 = 0;
    goto LABEL_90;
  }
LABEL_81:
  if (v98 || v99)
  {
    v101 = +[SUCoreLog sharedLogger];
    v102 = [v101 oslog];

    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v102, OS_LOG_TYPE_DEFAULT, "[SIMULATE] syntax error: assetBuildVersions and assetProductVersions must both be defined", buf, 2u);
    }

    NSLog((NSString *)@"[SIMULATE] syntax error: assetBuildVersions and assetProductVersions must both be defined", v108);
    goto LABEL_89;
  }
LABEL_90:

  return v20 & 1;
}

- (BOOL)_parseIntFromString:(id)a3 destination:(int *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [v7 numberFromString:v6];

  if (v8) {
    *a4 = [v8 intValue];
  }

  return v8 != 0;
}

- (BOOL)_parseErrorCodeFromString:(id)a3 destination:(int64_t *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [v7 numberFromString:v6];

  if (v8) {
    *a4 = (int)[v8 intValue];
  }

  return v8 != 0;
}

- (BOOL)_parseEventBooleanFromString:(id)a3 destination:(int64_t *)a4
{
  id v5 = a3;
  if (([v5 isEqualToString:@"none"] & 1) != 0
    || ([v5 isEqualToString:@"NONE"] & 1) != 0)
  {
    int64_t v6 = 0;
  }
  else if (([v5 isEqualToString:@"true"] & 1) != 0 {
         || ([v5 isEqualToString:@"TRUE"] & 1) != 0
  }
         || ([v5 isEqualToString:@"t"] & 1) != 0
         || ([v5 isEqualToString:@"T"] & 1) != 0
         || ([v5 isEqualToString:@"yes"] & 1) != 0
         || ([v5 isEqualToString:@"YES"] & 1) != 0
         || ([v5 isEqualToString:@"y"] & 1) != 0
         || ([v5 isEqualToString:@"Y"] & 1) != 0)
  {
    int64_t v6 = 2;
  }
  else
  {
    if (([v5 isEqualToString:@"false"] & 1) == 0
      && ([v5 isEqualToString:@"FALSE"] & 1) == 0
      && ([v5 isEqualToString:@"f"] & 1) == 0
      && ([v5 isEqualToString:@"F"] & 1) == 0
      && ([v5 isEqualToString:@"no"] & 1) == 0
      && ([v5 isEqualToString:@"NO"] & 1) == 0
      && ([v5 isEqualToString:@"n"] & 1) == 0
      && ![v5 isEqualToString:@"N"])
    {
      BOOL v7 = 0;
      goto LABEL_14;
    }
    int64_t v6 = 1;
  }
  *a4 = v6;
  BOOL v7 = 1;
LABEL_14:

  return v7;
}

- (BOOL)_parseDictionaryFromString:(id)a3 destination:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v24 = v5;
  if (a4)
  {
    int64_t v6 = [v5 propertyListFromStringsFileFormat];
    BOOL v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    id v23 = a4;
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v8 setNumberStyle:1];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      id v12 = (void *)MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v15 = [v9 valueForKey:v14];
          uint64_t v16 = [v8 numberFromString:v15];
          int64_t v17 = v16;
          if (v16
            || (char v18 = [v15 isEqualToString:@"YES"], v17 = v12, (v18 & 1) != 0)
            || (int v19 = [v15 isEqualToString:@"NO"], v17 = (void *)MEMORY[0x1E4F1CC28], v19))
          {
            [v7 setValue:v17 forKey:v14];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v20 = v7;
    id *v23 = v20;

    BOOL v21 = 1;
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (int64_t)_actionFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"error"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"fault"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"success"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"exit"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"spin"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"hang"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"wait"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"pause"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"replace_action"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"replace_event"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"modify_param"])
  {
    int64_t v4 = 11;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_triggerFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"begin"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"end"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"fsm"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)clearAllEventAlterations
{
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    id v3 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v3);

    int64_t v4 = [(SUCoreSimulate *)self simulateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SUCoreSimulate_clearAllEventAlterations__block_invoke;
    block[3] = &unk_1E60B6300;
    block[4] = self;
    dispatch_sync(v4, block);
  }
  else
  {
    id v5 = +[SUCoreLog sharedLogger];
    int64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot clear events (simulator disabled)", v7, 2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot clear events (simulator disabled)");
  }
}

uint64_t __42__SUCoreSimulate_clearAllEventAlterations__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEventAlterations:0];
  [*(id *)(a1 + 32) setAlterationsPerformed:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setLastAlteration:0];
}

- (void)dumpAllEventAlterations
{
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    id v3 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v3);

    int64_t v4 = [(SUCoreSimulate *)self simulateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SUCoreSimulate_dumpAllEventAlterations__block_invoke;
    block[3] = &unk_1E60B6300;
    block[4] = self;
    dispatch_sync(v4, block);
  }
  else
  {
    id v5 = +[SUCoreLog sharedLogger];
    int64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot dump events (simulator disabled)", v7, 2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot dump events (simulator disabled)");
  }
}

uint64_t __41__SUCoreSimulate_dumpAllEventAlterations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dumpAllEventAlterations];
}

- (void)_dumpAllEventAlterations
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = [(SUCoreSimulate *)self eventAlterations];

  if (v4)
  {
    id v5 = [(SUCoreSimulate *)self eventAlterations];
    int64_t v6 = v5;
    if (v5)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v27 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v27)
      {
        char v7 = 0;
        uint64_t v26 = *(void *)v34;
        long long v25 = v6;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v6);
            }
            id v9 = [v6 safeObjectForKey:*(void *)(*((void *)&v33 + 1) + 8 * i) ofClass:objc_opt_class()];
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v28 = i;
              uint64_t v12 = *(void *)v30;
              do
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v30 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                  id v15 = +[SUCoreLog sharedLogger];
                  uint64_t v16 = [v15 oslog];

                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    int64_t v17 = [v14 summary];
                    *(_DWORD *)buf = 138412290;
                    id v38 = v17;
                    _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[SIMULATE] dump all events - %@", buf, 0xCu);
                  }
                  char v18 = [v14 summary];
                  NSLog((NSString *)@"[SIMULATE] dump all events - %@", v18);
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
              }
              while (v11);
              char v7 = 1;
              int64_t v6 = v25;
              uint64_t i = v28;
            }
          }
          uint64_t v27 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v27);
        if (v7) {
          goto LABEL_31;
        }
      }
      int v19 = +[SUCoreLog sharedLogger];
      id v20 = [v19 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4EC2000, v20, OS_LOG_TYPE_DEFAULT, "[SIMULATE] dump all events - empty simulate events", buf, 2u);
      }
      BOOL v21 = @"[SIMULATE] dump all events - empty simulate events";
    }
    else
    {
      BOOL v24 = +[SUCoreLog sharedLogger];
      id v20 = [v24 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4EC2000, v20, OS_LOG_TYPE_DEFAULT, "[SIMULATE] dump all events - no simulate events", buf, 2u);
      }
      BOOL v21 = @"[SIMULATE] dump all events - no simulate events";
    }

    NSLog((NSString *)v21);
LABEL_31:

    return;
  }
  uint64_t v22 = +[SUCoreLog sharedLogger];
  id v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4EC2000, v23, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot dump events (no persisted state)", buf, 2u);
  }

  NSLog((NSString *)@"[SIMULATE] cannot dump events (no persisted state)");
}

- (int)countOfAlterationsPerformed
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    id v3 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v3);

    int64_t v4 = [(SUCoreSimulate *)self simulateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SUCoreSimulate_countOfAlterationsPerformed__block_invoke;
    block[3] = &unk_1E60B6328;
    block[4] = self;
    void block[5] = &v11;
    dispatch_sync(v4, block);
  }
  else
  {
    id v5 = +[SUCoreLog sharedLogger];
    int64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot provide count of alterations (simulator disabled)", v9, 2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot provide count of alterations (simulator disabled)");
  }
  int v7 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __45__SUCoreSimulate_countOfAlterationsPerformed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alterationsPerformed];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)lastAlterationPerformed
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  if ([(SUCoreSimulate *)self simulatorEnabled])
  {
    id v3 = [(SUCoreSimulate *)self simulateQueue];
    dispatch_assert_queue_not_V2(v3);

    int64_t v4 = [(SUCoreSimulate *)self simulateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SUCoreSimulate_lastAlterationPerformed__block_invoke;
    block[3] = &unk_1E60B6328;
    block[4] = self;
    void block[5] = &v11;
    dispatch_sync(v4, block);
  }
  else
  {
    id v5 = +[SUCoreLog sharedLogger];
    int64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot provide last alterations (simulator disabled)", v9, 2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot provide last alterations (simulator disabled)");
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __41__SUCoreSimulate_lastAlterationPerformed__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) lastAlteration];
  return MEMORY[0x1F41817F8]();
}

- (id)generateError:(id)a3 ofDomain:(id)a4 withCode:(int64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"[SIMULATED_ERROR] created by %@ (for domain=%@, code=%ld)", v9, v8, a5];

  [v10 setSafeObject:v11 forKey:*MEMORY[0x1E4F28568]];
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:v8 code:a5 userInfo:v10];

  return v12;
}

- (BOOL)_isValidEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = v3;
  if (v3)
  {
    if ([v3 startAt] == -1)
    {
      BOOL v6 = 1;
    }
    else
    {
      int v5 = [v4 count];
      BOOL v6 = v5 >= (int)[v4 startAt];
    }
    if ([v4 endAt] != -1)
    {
      int v7 = [v4 count];
      if (v7 > (int)[v4 endAt]) {
        BOOL v6 = 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v8 = +[SUCoreLog sharedLogger];
  id v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v4 summary];
    uint64_t v11 = (void *)v10;
    if (v6) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_DEFAULT, "[SIMULATE] located event: %@ | valid=%@", buf, 0x16u);
  }
  uint64_t v13 = [v4 summary];
  int v14 = (void *)v13;
  if (v6) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  NSLog((NSString *)@"[SIMULATE] located event: %@ | valid=%@", v13, v15);

  return v6;
}

- (BOOL)_isImmediateEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v5);

  if ((int)[v4 duration] > 0) {
    goto LABEL_6;
  }
  BOOL v6 = [v4 untilStop];

  if (v6) {
    goto LABEL_6;
  }
  unint64_t v7 = [v4 simAction];
  if (v7 >= 0xC)
  {
    id v9 = +[SUCoreDiag sharedDiag];
    id v10 = [NSString alloc];
    uint64_t v11 = [v4 summary];
    uint64_t v12 = (void *)[v10 initWithFormat:@"unknown simulate action: %@", v11];
    [v9 trackError:@"[SIMULATE] PERFORM" forReason:v12 withResult:8113 withError:0];

LABEL_6:
    LOBYTE(v8) = 0;
    goto LABEL_7;
  }
  unsigned int v8 = (0xE1Fu >> v7) & 1;
LABEL_7:

  return v8;
}

- (id)_performSimulatedEventAlteration:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v5);

  switch([v4 simAction])
  {
    case 0:
      id v16 = +[SUCoreLog sharedLogger];
      BOOL v6 = [v16 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v17 = [v4 summary];
        *(_DWORD *)buf = 138412290;
        id v23 = v17;
        _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM - no simulated action: %@", buf, 0xCu);
      }
      goto LABEL_13;
    case 1:
    case 3:
    case 9:
    case 10:
      [(SUCoreSimulate *)self _performingAlteration:v4];
      id v13 = v4;
      goto LABEL_15;
    case 2:
      [(SUCoreSimulate *)self _performingAlteration:v4];
      uint64_t v18 = +[SUCoreLog sharedLogger];
      __int16 v19 = [v18 oslog];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        [(SUCoreSimulate *)self _performSimulatedEventAlteration:v19];
      }

      goto LABEL_14;
    case 4:
      [(SUCoreSimulate *)self _performingAlteration:v4];
      exit(9900);
    case 5:
    case 6:
    case 7:
    case 8:
      BOOL v6 = +[SUCoreDiag sharedDiag];
      id v7 = [NSString alloc];
      unsigned int v8 = [v4 summary];
      id v9 = (void *)[v7 initWithFormat:@"should be off-queue when performing simulate action: %@", v8];
      id v10 = v6;
      uint64_t v11 = v9;
      uint64_t v12 = 8117;
      goto LABEL_12;
    case 11:
      BOOL v6 = +[SUCoreDiag sharedDiag];
      id v20 = [NSString alloc];
      unsigned int v8 = [v4 summary];
      uint64_t v15 = [v20 initWithFormat:@"modify param not yet supported: %@", v8];
      goto LABEL_11;
    default:
      BOOL v6 = +[SUCoreDiag sharedDiag];
      id v14 = [NSString alloc];
      unsigned int v8 = [v4 summary];
      uint64_t v15 = [v14 initWithFormat:@"unknown simulate action: %@", v8];
LABEL_11:
      id v9 = (void *)v15;
      id v10 = v6;
      uint64_t v11 = v9;
      uint64_t v12 = 8113;
LABEL_12:
      [v10 trackError:@"[SIMULATE] PERFORM" forReason:v11 withResult:v12 withError:0];

LABEL_13:
LABEL_14:
      id v13 = 0;
LABEL_15:

      return v13;
  }
}

- (void)_performingAlteration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreSimulate *)self setAlterationsPerformed:[(SUCoreSimulate *)self alterationsPerformed] + 1];
  [(SUCoreSimulate *)self setLastAlteration:v4];
  BOOL v6 = +[SUCoreLog sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(SUCoreSimulate *)self alterationsPerformed];
    id v9 = [v4 summary];
    v10[0] = 67109378;
    v10[1] = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM #%d - %@", (uint8_t *)v10, 0x12u);
  }
}

- (void)_triggerOffQueueAlteration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SUCoreSimulate *)self simulateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreSimulate *)self setAlterationsPerformed:[(SUCoreSimulate *)self alterationsPerformed] + 1];
  [(SUCoreSimulate *)self setLastAlteration:v4];
  BOOL v6 = +[SUCoreLog sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(SUCoreSimulate *)self alterationsPerformed];
    id v9 = [v4 summary];
    v10[0] = 67109378;
    v10[1] = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[SIMULATE] TRIGGER #%d - %@", (uint8_t *)v10, 0x12u);
  }
}

- (int)alterationsPerformed
{
  return self->_alterationsPerformed;
}

- (void)setAlterationsPerformed:(int)a3
{
  self->_alterationsPerformed = a3;
}

- (SUCoreSimulateEvent)lastAlteration
{
  return self->_lastAlteration;
}

- (void)setLastAlteration:(id)a3
{
}

- (void)setEventAlterations:(id)a3
{
}

- (id)registeredCallback
{
  return self->_registeredCallback;
}

- (void)setRegisteredCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registeredCallback, 0);
  objc_storeStrong((id *)&self->_eventAlterations, 0);
  objc_storeStrong((id *)&self->_simulateQueue, 0);
  objc_storeStrong((id *)&self->_lastAlteration, 0);
}

- (void)_performSimulatedEventAlteration:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 alterationsPerformed];
  BOOL v6 = [a2 summary];
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2112;
  id v9 = v6;
  _os_log_fault_impl(&dword_1B4EC2000, a3, OS_LOG_TYPE_FAULT, "[SIMULATE] PERFORM #%d - causing fault: %@", (uint8_t *)v7, 0x12u);
}

@end