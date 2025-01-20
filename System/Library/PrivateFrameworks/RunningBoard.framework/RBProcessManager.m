@interface RBProcessManager
+ (id)stateApplicationQueue;
- (BOOL)_canTerminateProcess:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)isActiveProcess:(id)a3;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBProcessManager)init;
- (RBProcessManager)initWithBundlePropertiesManager:(id)a3 entitlementManager:(id)a4 jetsamPropertytManager:(id)a5 timeProvider:(id)a6 historialStatistics:(id)a7 delegate:(id)a8;
- (id)_executeLaunchRequest:(id)a3 withError:(id *)a4;
- (id)_getLifecycleQueueForIdentity:(id)a3;
- (id)_lifecycleQueue_addProcessWithInstance:(id)a3 properties:(id)a4;
- (id)_processForIdentifier:(id)a3;
- (id)_processForIdentifier:(id)a3 withAuditToken:(id)a4 forceStartTracking:(BOOL)a5;
- (id)_processForInstance:(id)a3;
- (id)_resolveProcessWithIdentifier:(id)a3 auditToken:(id)a4 properties:(id *)a5;
- (id)busyExtensionInstancesFromSet:(id)a3;
- (id)processForAuditToken:(id)a3;
- (id)processForIdentifier:(id)a3;
- (id)processForIdentifierWithoutStartingTracking:(id)a3;
- (id)processForIdentity:(id)a3;
- (id)processForInstance:(id)a3;
- (id)processesMatchingPredicate:(id)a3;
- (void)_enqueueGuaranteedRunningLaunchForIdentity:(id)a3 atTime:(double)a4;
- (void)_executeLifecycleEventForIdentity:(id)a3 sync:(BOOL)a4 withBlock:(id)a5;
- (void)_releaseLifecycleQueueForIdentity:(id)a3;
- (void)_removeProcess:(id)a3;
- (void)applySystemState:(id)a3;
- (void)didUpdateProcessStates:(id)a3 completion:(id)a4;
- (void)executeLaunchRequest:(id)a3 withCompletion:(id)a4;
- (void)executeTerminateRequest:(id)a3 completion:(id)a4;
- (void)removeStateForProcessIdentity:(id)a3;
- (void)start;
- (void)systemPreventIdleSleepStateDidChange:(BOOL)a3;
@end

@implementation RBProcessManager

- (void)systemPreventIdleSleepStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_systemPreventsIdleSleep = v3;
  os_unfair_lock_unlock(p_lock);
  if (!v3)
  {
    v6 = rbs_process_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_DEFAULT, "Shutdown sockets for all suspended processes", buf, 2u);
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_processIndex;
  uint64_t v8 = [(RBProcessIndex *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "identity", (void)v14);
        [(RBProcessManager *)self _executeLifecycleEventForIdentity:v13 sync:1 withBlock:&__block_literal_global_93];

        [v12 _systemPreventIdleSleepStateDidChange:v3];
      }
      uint64_t v9 = [(RBProcessIndex *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_executeLifecycleEventForIdentity:(id)a3 sync:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1104, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }
  v11 = [(RBProcessManager *)self _getLifecycleQueueForIdentity:v9];
  v12 = v11;
  if (v6)
  {
    dispatch_async_and_wait(v11, v10);
    [(RBProcessManager *)self _releaseLifecycleQueueForIdentity:v9];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__RBProcessManager__executeLifecycleEventForIdentity_sync_withBlock___block_invoke;
    block[3] = &unk_2647C8B90;
    id v17 = v10;
    block[4] = self;
    id v16 = v9;
    dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v12, v13);
  }
}

- (id)_getLifecycleQueueForIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1123, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }
  os_unfair_lock_lock_with_options();
  BOOL v6 = [(NSMutableDictionary *)self->_identityToProcessLifecycleQueue objectForKey:v5];
  if (!v6)
  {
    if ([(NSCountedSet *)self->_lifecycleQueuesInUse countForObject:v5]) {
      -[RBProcessManager _getLifecycleQueueForIdentity:]();
    }
    v7 = NSString;
    uint64_t v8 = [v5 shortDescription];
    id v9 = [v7 stringWithFormat:@"com.apple.runningboard.process-manager.%@", v8];

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_initially_inactive(v10);

    id v12 = v9;
    BOOL v6 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    dispatch_set_qos_class_fallback();
    [(NSMutableDictionary *)self->_identityToProcessLifecycleQueue setObject:v6 forKey:v5];
    dispatch_activate(v6);
  }
  [(NSCountedSet *)self->_lifecycleQueuesInUse addObject:v5];
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"RBProcessManager.m" lineNumber:1144 description:@"must return a queue"];
  }
  return v6;
}

- (void)_releaseLifecycleQueueForIdentity:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1149, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }
  os_unfair_lock_lock_with_options();
  NSUInteger v5 = [(NSCountedSet *)self->_lifecycleQueuesInUse countForObject:v8];
  if (!v5) {
    -[RBProcessManager _releaseLifecycleQueueForIdentity:]();
  }
  NSUInteger v6 = v5;
  [(NSCountedSet *)self->_lifecycleQueuesInUse removeObject:v8];
  if (v6 == 1) {
    [(NSMutableDictionary *)self->_identityToProcessLifecycleQueue removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)didUpdateProcessStates:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_block_t block = a4;
  [v6 processIdentities];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v10 = [v6 processStateChangeForIdentity:v9];
        v11 = [v10 updatedState];

        id v12 = [(RBProcessMap *)self->_processState setValue:v11 forIdentity:v9];
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x3032000000;
        v30 = __Block_byref_object_copy__5;
        v31 = __Block_byref_object_dispose__5;
        id v32 = [(RBProcessIndex *)self->_processIndex processForIdentity:v9];
        if (!v28[5] && [v11 guaranteedRunning]) {
          [(RBProcessManager *)self _enqueueGuaranteedRunningLaunchForIdentity:v9 atTime:0.0];
        }
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke;
        v24[3] = &unk_2647C8B68;
        v26 = &v27;
        v24[4] = self;
        v24[5] = v9;
        id v13 = v11;
        id v25 = v13;
        [(RBProcessManager *)self _executeLifecycleEventForIdentity:v9 sync:0 withBlock:v24];

        _Block_object_dispose(&v27, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  if (block)
  {
    long long v14 = [MEMORY[0x263F64660] currentContext];
    long long v15 = +[RBProcessManager stateApplicationQueue];
    id v16 = v15;
    if (v14)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke_2;
      v20[3] = &unk_2647C7F68;
      v21 = obj;
      v22 = self;
      id v23 = block;
      [v14 handoffToQueue:v16 block:v20];

      id v16 = v21;
    }
    else
    {
      dispatch_async(v15, block);
    }
  }
}

- (id)processForIdentifier:(id)a3
{
  v4 = [MEMORY[0x263F64580] identifierForIdentifier:a3];
  if (v4)
  {
    NSUInteger v5 = [(RBProcessManager *)self _processForIdentifier:v4 withAuditToken:0 forceStartTracking:1];
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return v5;
}

- (id)_processForIdentifier:(id)a3 withAuditToken:(id)a4 forceStartTracking:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5;
  v57 = __Block_byref_object_dispose__5;
  id v58 = [(RBProcessManager *)self _processForIdentifier:v8];
  id v10 = (void *)v54[5];
  if (!v10)
  {
    id v48 = 0;
    id v17 = [(RBProcessManager *)self _resolveProcessWithIdentifier:v8 auditToken:v9 properties:&v48];
    id v18 = v48;
    uint64_t v19 = [v17 identity];
    if (v19)
    {
      if (v5)
      {
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __76__RBProcessManager__processForIdentifier_withAuditToken_forceStartTracking___block_invoke;
        v43[3] = &unk_2647C8AF0;
        v47 = &v53;
        v43[4] = self;
        id v44 = v8;
        id v45 = v17;
        id v46 = v18;
        [(RBProcessManager *)self _executeLifecycleEventForIdentity:v19 sync:1 withBlock:v43];

LABEL_15:
        id v30 = (id)v54[5];
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v20 = objc_msgSend(MEMORY[0x263F64508], "taskNameForPID:", objc_msgSend(v17, "rbs_pid"));
      uint64_t v21 = [v20 auditToken];
      v22 = (void *)v21;
      if (v20 && v21)
      {
        id v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "hostPid"));
        v42 = [(RBProcessManager *)self processForIdentifierWithoutStartingTracking:v23];

        v24 = [(RBBundlePropertiesManaging *)self->_bundlePropertiesManager propertiesForIdentity:v19 identifier:v8];
        jetsamPropertytManager = self->_jetsamPropertytManager;
        uint64_t v26 = objc_msgSend(v8, "rbs_pid");
        [v22 realToken];
        uint64_t v27 = [(RBJetsamPropertyManaging *)jetsamPropertytManager jetsamPropertiesForProcess:v26 identity:v19 bundleProperties:v24 isPlatformBinary:RBSAuditTokenRepresentsPlatformBinary()];
        id v28 = [[RBProcess alloc] _initThinWithInstance:v17 auditToken:v22 bundleProperties:v24 jetsamProperties:v27 hostProcess:v42 properties:v18];
        uint64_t v29 = (void *)v54[5];
        v54[5] = (uint64_t)v28;

        goto LABEL_15;
      }
      v40 = rbs_process_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:]();
      }
    }
    id v30 = 0;
    goto LABEL_34;
  }
  if (v9)
  {
    uint64_t v11 = [v10 auditToken];
    id v12 = (void *)v11;
    if ((id)v11 == v9)
    {
    }
    else if (!v11 || (char v13 = [v9 isEqual:v11], v12, (v13 & 1) == 0))
    {
      [v9 realToken];
      uid_t v14 = audit_token_to_auid(&atoken);
      long long v15 = [(id)v54[5] auditToken];
      id v16 = v15;
      if (v15) {
        [v15 realToken];
      }
      else {
        memset(&v51, 0, sizeof(v51));
      }
      BOOL v31 = v14 == audit_token_to_auid(&v51);

      if (!v31)
      {
        id v32 = rbs_process_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          long long v33 = [(id)v54[5] auditToken];
          -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:](v33, (uint64_t)v9, v63, v32);
        }
      }
      [v9 realToken];
      uid_t v34 = audit_token_to_euid(&v50);
      long long v35 = [(id)v54[5] auditToken];
      long long v36 = v35;
      if (v35) {
        [v35 realToken];
      }
      else {
        memset(&v49, 0, sizeof(v49));
      }
      BOOL v37 = v34 == audit_token_to_euid(&v49);

      if (!v37)
      {
        uint64_t v38 = rbs_process_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = [(id)v54[5] auditToken];
          *(_DWORD *)buf = 138543618;
          v60 = v39;
          __int16 v61 = 2114;
          id v62 = v9;
          _os_log_impl(&dword_226AB3000, v38, OS_LOG_TYPE_DEFAULT, "EUID of process has changed from %{public}@ to %{public}@", buf, 0x16u);
        }
      }
      [(id)v54[5] setAuditToken:v9];
      [(RBEntitlementManaging *)self->_entitlementManager purgeEntitlementsForProcess:v54[5]];
    }
  }
  id v30 = (id)v54[5];
LABEL_35:
  _Block_object_dispose(&v53, 8);

  return v30;
}

- (id)_processForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(RBProcessIndex *)self->_processIndex processForIdentifier:v4];
    if (!v5)
    {
      BOOL v5 = [(RBProcessIndex *)self->_processGraveyard processForIdentifier:v4];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)stateApplicationQueue
{
  if (stateApplicationQueue_onceToken != -1) {
    dispatch_once(&stateApplicationQueue_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)stateApplicationQueue_queue;
  return v2;
}

- (BOOL)isActiveProcess:(id)a3
{
  return [(RBProcessIndex *)self->_processIndex containsProcess:a3];
}

- (id)processesMatchingPredicate:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 processIdentifiers];
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF9C0] set];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v8) {
      goto LABEL_30;
    }
    uint64_t v9 = v8;
    id v30 = v5;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(RBProcessManager *)self processForIdentifierWithoutStartingTracking:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        char v13 = v12;
        if (v12)
        {
          uid_t v14 = [v12 handle];
          int v15 = [v4 matchesProcess:v14];

          if (v15) {
            [v6 addObject:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v9);
    goto LABEL_29;
  }
  id v7 = [v4 processIdentity];
  if (!v7)
  {
    id v30 = 0;
    id v6 = [MEMORY[0x263EFF9C0] set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v21 = [(RBProcessIndex *)self->_processIndex allProcesses];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          uint64_t v27 = [v26 handle];
          int v28 = [v4 matchesProcess:v27];

          if (v28) {
            [v6 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }

LABEL_29:
    BOOL v5 = v30;
    goto LABEL_30;
  }
  id v16 = [(RBProcessManager *)self processForIdentity:v7];
  id v17 = v16;
  if (v16
    && ([v16 handle],
        id v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v4 matchesProcess:v18],
        v18,
        v19))
  {
    uint64_t v20 = [MEMORY[0x263EFFA08] setWithObject:v17];
  }
  else
  {
    uint64_t v20 = [MEMORY[0x263EFFA08] set];
  }
  id v6 = (void *)v20;

LABEL_30:
  return v6;
}

- (id)processForIdentifierWithoutStartingTracking:(id)a3
{
  id v4 = [MEMORY[0x263F64580] identifierForIdentifier:a3];
  if (v4)
  {
    BOOL v5 = [(RBProcessManager *)self _processForIdentifier:v4 withAuditToken:0 forceStartTracking:0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)processForIdentity:(id)a3
{
  return [(RBProcessIndex *)self->_processIndex processForIdentity:a3];
}

uint64_t __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_executeLifecycleEventForIdentity:sync:withBlock:", *(void *)(*((void *)&v9 + 1) + 8 * v6++), 1, &__block_literal_global_140, (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = +[RBProcess processStateApplicationQueue];
  dispatch_async_and_wait(v7, &__block_literal_global_142);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __69__RBProcessManager__executeLifecycleEventForIdentity_sync_withBlock___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _releaseLifecycleQueueForIdentity:v3];
}

void *__54__RBProcessManager_didUpdateProcessStates_completion___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) processForIdentity:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  result = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (result)
  {
    uint64_t v6 = a1[6];
    return (void *)[result _applyState:v6];
  }
  return result;
}

- (void)executeLaunchRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"RBProcessManager.m", 582, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v32 = 0;
  long long v9 = [(RBProcessManager *)self _executeLaunchRequest:v7 withError:&v32];
  id v10 = v32;
  long long v11 = v10;
  if (v9)
  {
    id v25 = v10;
    id v26 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v27 = v7;
    long long v12 = [v7 context];
    char v13 = [v12 managedEndpointLaunchIdentifiers];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = 0;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v20 = [v9 managedEndpointByLaunchIdentifier];
          uint64_t v21 = [v20 objectForKey:v19];

          if (v21)
          {
            if (v16)
            {
              [v16 setObject:v21 forKey:v19];
            }
            else
            {
              id v16 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v21 forKey:v19];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }
    else
    {
      id v16 = 0;
    }

    uint64_t v22 = [v9 handle];
    uint64_t v23 = (void *)[v16 copy];
    long long v11 = v25;
    id v8 = v26;
    (*((void (**)(id, void *, void *, id))v26 + 2))(v26, v22, v23, v25);

    id v7 = v27;
  }
  else
  {
    (*((void (**)(id, void, void, id))v8 + 2))(v8, 0, 0, v10);
  }
}

- (id)_executeLaunchRequest:(id)a3 withError:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    long long v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"RBProcessManager.m", 606, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id v8 = [v7 context];
  uint64_t v9 = [v8 identity];
  id v10 = (void *)v9;
  if (v8 && v9)
  {
    long long v11 = rbs_process_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [v10 shortDescription];
      char v13 = [v8 explanation];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "Executing launch request for %{public}@ (%{public}@)", buf, 0x16u);
    }
    uint64_t v14 = [v8 requiredExistingProcess];
    if (v14) {
      goto LABEL_8;
    }
    os_unfair_lock_lock(&self->_lock);
    uint64_t v15 = self->_systemState;
    os_unfair_lock_unlock(&self->_lock);
    id v44 = 0;
    int v24 = [v8 _launchAllowedBySystemState:v15 error:&v44];
    id v25 = v44;
    id v26 = v25;
    if (v24)
    {
      id v43 = v25;
      char v27 = [v8 _passesRegulatoryChecksWithError:&v43];
      id v28 = v43;

      if (v27)
      {

LABEL_8:
        uint64_t v15 = [(RBProcessMap *)self->_processState valueForIdentity:v10];
        unsigned int v16 = [v8 initialRole];
        if (v16 < [(RBSystemState *)v15 role]) {
          objc_msgSend(v8, "setInitialRole:", -[RBSystemState role](v15, "role"));
        }
        uint64_t v17 = [v8 hostPid];
        if ((int)v17 >= 1)
        {
          id v18 = [NSNumber numberWithInt:v17];
          uint64_t v19 = [(RBProcessManager *)self processForIdentifier:v18];

          [v8 setHostProcess:v19];
        }
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v46 = __Block_byref_object_copy__5;
        v47 = __Block_byref_object_dispose__5;
        id v48 = 0;
        uint64_t v37 = 0;
        long long v38 = &v37;
        uint64_t v39 = 0x3032000000;
        v40 = __Block_byref_object_copy__5;
        uint64_t v41 = __Block_byref_object_dispose__5;
        id v42 = 0;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __52__RBProcessManager__executeLaunchRequest_withError___block_invoke;
        v31[3] = &unk_2647C8B18;
        v31[4] = self;
        id v32 = v10;
        id v33 = v14;
        long long v35 = buf;
        long long v36 = &v37;
        id v34 = v8;
        [(RBProcessManager *)self _executeLifecycleEventForIdentity:v32 sync:1 withBlock:v31];
        if (a4) {
          *a4 = *(id *)(*(void *)&buf[8] + 40);
        }
        id v20 = (id)v38[5];

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(buf, 8);

LABEL_25:
        goto LABEL_26;
      }
      id v26 = v28;
    }
    if (a4) {
      *a4 = v26;
    }

    id v20 = 0;
    goto LABEL_25;
  }
  if (a4)
  {
    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    uint64_t v22 = *MEMORY[0x263F646A8];
    [v21 setObject:@"Launch prevented due to invalid parameters" forKey:*MEMORY[0x263F08338]];
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:v22 code:1 userInfo:v21];

    id v20 = 0;
    *a4 = v23;
  }
  else
  {
    id v20 = 0;
  }
LABEL_26:

  return v20;
}

- (id)processForAuditToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:", objc_msgSend(v4, "pid"));
  if (v5)
  {
    uint64_t v6 = [(RBProcessManager *)self _processForIdentifier:v5 withAuditToken:v4 forceStartTracking:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_resolveProcessWithIdentifier:(id)a3 auditToken:(id)a4 properties:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = objc_msgSend(a3, "rbs_pid");
  if ((int)v9 < 1)
  {
    char v13 = 0;
    goto LABEL_57;
  }
  uint64_t v10 = v9;
  long long v11 = +[RBLaunchdProperties propertiesForPid:v9];
  long long v12 = v11;
  if (a5) {
    *a5 = v11;
  }
  memset(&buf[1], 0, sizeof(audit_token_t));
  if (v8)
  {
    [v8 realToken];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F64508] taskNameForPID:v10];
    uint64_t v15 = [v14 auditToken];
    unsigned int v16 = v15;
    if (v15) {
      [v15 realToken];
    }
    else {
      memset(buf, 0, 32);
    }
    buf[1] = buf[0];
  }
  if ([v12 hasVariableEUID])
  {
    uint64_t v17 = rbs_process_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].val[0] = 67109120;
      buf[0].val[1] = v10;
      _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_DEFAULT, "Process %d has variable EUID - just use AUID/EUID 0", (uint8_t *)buf, 8u);
    }
LABEL_22:
    uint64_t v20 = 0;
    goto LABEL_23;
  }
  buf[0] = buf[1];
  if (!RBSRealAuditTokenValid())
  {
    uint64_t v17 = rbs_process_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:]((uint64_t)v8, v10, v17);
    }
    goto LABEL_22;
  }
  buf[0] = buf[1];
  uid_t v18 = audit_token_to_euid(buf);
  buf[0] = buf[1];
  uid_t v19 = audit_token_to_auid(buf);
  if (v19 + 1 >= 2) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v18;
  }
  uint64_t v17 = rbs_process_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    buf[0].val[0] = 67109632;
    buf[0].val[1] = v10;
    LOWORD(buf[0].val[2]) = 1024;
    *(unsigned int *)((char *)&buf[0].val[2] + 2) = v18;
    HIWORD(buf[0].val[3]) = 1024;
    buf[0].val[4] = v20;
    _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_DEFAULT, "_resolveProcessWithIdentifier pid %d euid %d auid %d", (uint8_t *)buf, 0x14u);
  }
LABEL_23:

  uint64_t v21 = [v12 specifiedIdentity];

  if (v21)
  {
    uint64_t v22 = [v12 specifiedIdentity];
    if (v22) {
      goto LABEL_49;
    }
  }
  else if ([v12 isXPCService])
  {
    uint64_t v23 = [v12 hostPid];
    if ((int)v23 < 1)
    {
      id v25 = 0;
    }
    else
    {
      int v24 = [NSNumber numberWithInt:v23];
      id v25 = [(RBProcessManager *)self processForIdentifier:v24];
    }
    char v27 = [v25 auditToken];
    id v28 = v27;
    if (v27)
    {
      memset(buf, 0, 32);
      [v27 realToken];
      audit_token_t v45 = buf[0];
      LODWORD(v20) = audit_token_to_euid(&v45);
      audit_token_t v45 = buf[0];
      uid_t v29 = audit_token_to_auid(&v45);
      if (v29 + 1 >= 2) {
        uint64_t v20 = v29;
      }
      else {
        uint64_t v20 = v20;
      }
      long long v30 = rbs_process_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v45.val[0] = 67109376;
        v45.val[1] = v10;
        LOWORD(v45.val[2]) = 1024;
        *(unsigned int *)((char *)&v45.val[2] + 2) = v20;
        _os_log_impl(&dword_226AB3000, v30, OS_LOG_TYPE_DEFAULT, "_resolveProcessWithIdentifier pid %d host is auid %d", (uint8_t *)&v45, 0xEu);
      }
    }
    long long v31 = (void *)MEMORY[0x263F64598];
    id v32 = [v12 executablePath];
    id v33 = [v25 instance];
    id v34 = [v12 uuid];
    uint64_t v22 = [v31 identityForXPCServiceExecutablePath:v32 pid:v10 auid:v20 host:v33 UUID:v34];

    if (v22) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v22 = [v12 resolvedIdentityWithPid:v10 auid:v20];
    if (v22) {
      goto LABEL_49;
    }
    id v26 = rbs_process_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].val[0] = 67109120;
      buf[0].val[1] = v10;
      _os_log_impl(&dword_226AB3000, v26, OS_LOG_TYPE_DEFAULT, "Unable to obtain process properties from launchd for pid=%d", (uint8_t *)buf, 8u);
    }
  }
  if (!RBSPIDExists())
  {
    uint64_t v22 = rbs_process_log();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:
      char v13 = 0;
      goto LABEL_56;
    }
    buf[0].val[0] = 67109120;
    buf[0].val[1] = v10;
    id v43 = "Can't lookup pid %d because it does not exist";
LABEL_54:
    _os_log_impl(&dword_226AB3000, v22, OS_LOG_TYPE_DEFAULT, v43, (uint8_t *)buf, 8u);
    goto LABEL_55;
  }
  RBSExecutablePathForPID();
  long long v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  long long v36 = v35;
  if (v35) {
    goto LABEL_48;
  }
  int v37 = RBSPIDExists();
  uint64_t v22 = rbs_process_log();
  BOOL v38 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (!v37)
  {
    if (!v38) {
      goto LABEL_55;
    }
    buf[0].val[0] = 67109120;
    buf[0].val[1] = v10;
    id v43 = "Can't lookup pid %d because it does not exist anymore";
    goto LABEL_54;
  }
  if (v38)
  {
    buf[0].val[0] = 67109120;
    buf[0].val[1] = v10;
    _os_log_impl(&dword_226AB3000, v22, OS_LOG_TYPE_DEFAULT, "RBSExecutablePathForPID couldn't get exec path for pid that exists, %d", (uint8_t *)buf, 8u);
  }

  long long v36 = @"no-exec-path";
LABEL_48:
  uint64_t v22 = [MEMORY[0x263F64598] identityForExecutablePath:v36 pid:v10 auid:v20];

  if (!v22)
  {
    uint64_t v41 = rbs_process_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
      -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:](v10, v41);
    }
    uint64_t v22 = 0;
    char v13 = 0;
    goto LABEL_51;
  }
LABEL_49:
  uint64_t v39 = (void *)MEMORY[0x263F645A8];
  v40 = [MEMORY[0x263F64580] identifierWithPid:v10];
  char v13 = [v39 instanceWithIdentifier:v40 identity:v22];

  uint64_t v41 = rbs_process_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = [v22 shortDescription];
    buf[0].val[0] = 67109634;
    buf[0].val[1] = v10;
    LOWORD(buf[0].val[2]) = 2114;
    *(void *)((char *)&buf[0].val[2] + 2) = v42;
    HIWORD(buf[0].val[4]) = 1024;
    buf[0].val[5] = v10;
    _os_log_impl(&dword_226AB3000, v41, OS_LOG_TYPE_DEFAULT, "Resolved pid %d to [%{public}@:%d]", (uint8_t *)buf, 0x18u);
  }
LABEL_51:

LABEL_56:
LABEL_57:

  return v13;
}

id __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 24) entitlementsForProcess:*(void *)(a1 + 40)];
}

- (id)processForInstance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(RBProcessManager *)self processForIdentifier:v5];

  id v7 = [v6 instance];
  char v8 = [v7 isEqual:v4];

  if ((v8 & 1) == 0)
  {

    uint64_t v6 = 0;
  }
  return v6;
}

void __76__RBProcessManager__processForIdentifier_withAuditToken_forceStartTracking___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _processForIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_lifecycleQueue_addProcessWithInstance:properties:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    MEMORY[0x270F9A758]();
  }
}

void __52__RBProcessManager__executeLaunchRequest_withError___block_invoke(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 88) processForIdentity:a1[5]];
  uint64_t v3 = v2;
  if (a1[6])
  {
    if (v2
      && ([v2 identifier],
          id v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isEqual:a1[6]],
          v4,
          v5))
    {
      uint64_t v6 = rbs_process_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = a1[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v7;
        __int16 v34 = 2114;
        long long v35 = v3;
        _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@ which matches the requiredExistingProcess", buf, 0x16u);
      }

      uint64_t v8 = *MEMORY[0x263F646A8];
      uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v9 setObject:@"The process was already running as expected." forKey:*MEMORY[0x263F08338]];
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:v8 code:2 userInfo:v9];

      uint64_t v11 = *(void *)(a1[8] + 8);
      long long v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void *)(a1[9] + 8);
      id v14 = v3;
      uint64_t v15 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v14;
    }
    else
    {
      unsigned int v16 = rbs_process_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = a1[5];
        uint64_t v18 = a1[6];
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v17;
        __int16 v34 = 2114;
        long long v35 = v3;
        __int16 v36 = 2112;
        uint64_t v37 = v18;
        _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@ which doesn't match requiredExistingProcess of %@", buf, 0x20u);
      }

      uint64_t v19 = *MEMORY[0x263F646A8];
      uint64_t v20 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v20 setObject:@"The running process did not match the expected." forKey:*MEMORY[0x263F08338]];
      uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:v19 code:3 userInfo:v20];

      uint64_t v22 = *(void *)(a1[8] + 8);
      uint64_t v15 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }
  else
  {
    uint64_t v23 = a1[5];
    int v24 = *(void **)(a1[4] + 56);
    uint64_t v25 = a1[7];
    id v31 = 0;
    uint64_t v26 = [v24 executeLaunchRequest:v25 existingProcess:v3 requestIdentity:v23 withError:&v31];
    id v27 = v31;
    uint64_t v28 = *(void *)(a1[9] + 8);
    uid_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v26;

    uint64_t v30 = *(void *)(a1[8] + 8);
    uint64_t v15 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v27;
  }
}

- (id)_lifecycleQueue_addProcessWithInstance:(id)a3 properties:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v58 = a4;
  if (!v7)
  {
    audit_token_t v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1165, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];
  }
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__5;
  v70 = __Block_byref_object_dispose__5;
  id v71 = [v7 identity];
  v57 = [v7 identifier];
  if (!v67[5])
  {
    id v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1168, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }
  if (!v57)
  {
    uint64_t v47 = [MEMORY[0x263F08690] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1169, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if ([v58 isDaemon])
  {
    uint64_t v8 = 2;
  }
  else
  {
    if (![v58 isAngel]) {
      goto LABEL_12;
    }
    uint64_t v8 = 3;
  }
  [(id)v67[5] setOsServiceType:v8];
LABEL_12:
  os_unfair_lock_lock(&self->_pendingExitBlockLock);
  v56 = [(NSMutableDictionary *)self->_identityToPendingExitBlock objectForKeyedSubscript:v67[5]];
  os_unfair_lock_unlock(&self->_pendingExitBlockLock);
  processIndex = self->_processIndex;
  uint64_t v10 = [v7 identifier];
  uint64_t v11 = [(RBProcessIndex *)processIndex processForIdentifier:v10];

  long long v12 = rbs_ttl_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEFAULT, "existingInstance is: %{public}@", buf, 0xCu);
  }

  if (v11
    && ([v11 identity],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isExtension],
        v13,
        v14))
  {
    uint64_t v15 = rbs_process_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.4((uint64_t)v11, buf, objc_msgSend(v11, "rbs_pid"), v15);
    }

    id v16 = v11;
  }
  else
  {
    uint64_t v55 = [(RBProcessIndex *)self->_processIndex processForIdentity:v67[5]];
    if (v56)
    {
      if (v55)
      {
        uint64_t v17 = [v55 handle];
        [v17 pid];
        int v18 = RBSPIDExists();

        if (v18)
        {
          uint64_t v19 = rbs_process_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:]();
          }
        }
      }
      uint64_t v20 = rbs_process_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = v67[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v55;
        _os_log_impl(&dword_226AB3000, v20, OS_LOG_TYPE_DEFAULT, "New process with identity (%{public}@) detected with pending exit from a prior process (%{public}@).  Forcing cleanup of the prior instance immediately.", buf, 0x16u);
      }

      v56[2]();
    }
    uint64_t v22 = objc_msgSend(MEMORY[0x263F64508], "taskNameForPID:", objc_msgSend(v7, "rbs_pid"));
    uint64_t v23 = [v22 auditToken];
    int v24 = (void *)v23;
    if (v22 && v23)
    {
      uint64_t v25 = self->_processIndex;
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v58, "hostPid"));
      v54 = [(RBProcessIndex *)v25 processForIdentifier:v26];

      v52 = [(RBProcessMap *)self->_processState valueForIdentity:v67[5]];
      uint64_t v53 = [(RBBundlePropertiesManaging *)self->_bundlePropertiesManager propertiesForIdentity:v67[5] identifier:v57];
      jetsamPropertytManager = self->_jetsamPropertytManager;
      uint64_t v28 = objc_msgSend(v57, "rbs_pid");
      uint64_t v29 = v67[5];
      [v24 realToken];
      audit_token_t v50 = [(RBJetsamPropertyManaging *)jetsamPropertytManager jetsamPropertiesForProcess:v28 identity:v29 bundleProperties:v53 isPlatformBinary:RBSAuditTokenRepresentsPlatformBinary()];
      uint64_t v30 = [RBProcess alloc];
      LOBYTE(v48) = self->_systemPreventsIdleSleep;
      id v16 = [(RBProcess *)v30 _initWithInstance:v7 auditToken:v24 bundleProperties:v53 jetsamProperties:v50 initialState:v52 hostProcess:v54 properties:v58 systemPreventsIdleSleep:v48];
      if (v16)
      {
        id v31 = rbs_ttl_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl(&dword_226AB3000, v31, OS_LOG_TYPE_DEFAULT, "Now tracking process: %{public}@", buf, 0xCu);
        }

        id v32 = self->_processIndex;
        id v65 = 0;
        [(RBProcessIndex *)v32 addProcess:v16 existingProcess:&v65];
        audit_token_t v51 = v65;
        uint64_t v33 = rbs_ttl_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v51;
          _os_log_impl(&dword_226AB3000, v33, OS_LOG_TYPE_DEFAULT, "existingProcess in RBProcessManager is: %{public}@", buf, 0xCu);
        }

        [(RBHistoricalStatisticsMaintaining *)self->_historicalStatistics notifyProcessCount:[(RBProcessIndex *)self->_processIndex count]];
        if (v51)
        {
          os_unfair_lock_lock(&self->_pendingExitBlockLock);
          identityToPendingExitBlock = self->_identityToPendingExitBlock;
          long long v35 = [v51 identity];
          __int16 v36 = [(NSMutableDictionary *)identityToPendingExitBlock objectForKeyedSubscript:v35];

          os_unfair_lock_unlock(&self->_pendingExitBlockLock);
          if (v36)
          {
            uint64_t v37 = rbs_process_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v51;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v16;
              _os_log_impl(&dword_226AB3000, v37, OS_LOG_TYPE_DEFAULT, "Cleaning up (%{public}@) which was exec'ed into (%{public}@)", buf, 0x16u);
            }

            v36[2](v36);
          }
        }
        uint64_t v49 = [(RBProcessManager *)self _getLifecycleQueueForIdentity:v67[5]];
        uint64_t v38 = [MEMORY[0x263F64650] sharedBackgroundWorkloop];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke;
        block[3] = &unk_2647C7B98;
        block[4] = self;
        id v39 = v16;
        id v64 = v39;
        dispatch_async(v38, block);

        [(RBProcessManagerDelegate *)self->_delegate processManager:self didAddProcess:v39 withState:v52];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v73 = 0;
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke_2;
        v59[3] = &unk_2647C8BB8;
        __int16 v61 = buf;
        v59[4] = self;
        id v62 = &v66;
        id v40 = v39;
        id v60 = v40;
        dispatch_block_t v41 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v59);
        os_unfair_lock_lock(&self->_pendingExitBlockLock);
        id v42 = (void *)MEMORY[0x22A6611D0](v41);
        [(NSMutableDictionary *)self->_identityToPendingExitBlock setObject:v42 forKeyedSubscript:v67[5]];

        os_unfair_lock_unlock(&self->_pendingExitBlockLock);
        [(RBLaunchdJobManager *)self->_jobManager invokeOnProcessDeath:v40 handler:v41 onQueue:v49];
        id v43 = v40;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        audit_token_t v51 = rbs_process_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:]();
        }
      }
    }
    else
    {
      v54 = rbs_process_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:]();
      }
      id v16 = 0;
    }
  }
  _Block_object_dispose(&v66, 8);

  return v16;
}

- (void)removeStateForProcessIdentity:(id)a3
{
}

void __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 112) valueForIdentity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 76));
    [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 76));
    [*(id *)(a1 + 32) _removeProcess:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _releaseLifecycleQueueForIdentity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if ([v3 guaranteedRunning])
    {
      id v4 = rbs_process_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "Exiting process %@ is GuaranteedRunning", (uint8_t *)&v6, 0xCu);
      }

      [*(id *)(a1 + 32) _enqueueGuaranteedRunningLaunchForIdentity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) atTime:0.0];
    }
  }
}

- (void)_removeProcess:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = rbs_process_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Removing process: %{public}@", buf, 0xCu);
  }

  [v4 invalidate];
  [(RBProcessIndex *)self->_processGraveyard addProcess:v4];
  [(RBProcessIndex *)self->_processIndex removeProcess:v4];
  [(RBHistoricalStatisticsMaintaining *)self->_historicalStatistics notifyProcessCount:[(RBProcessIndex *)self->_processIndex count]];
  id v6 = (id)[v4 lastExitContext];
  jobManager = self->_jobManager;
  uint64_t v8 = [v4 instance];
  id v15 = 0;
  BOOL v9 = [(RBLaunchdJobManager *)jobManager removeJobWithInstance:v8 error:&v15];
  id v10 = v15;

  if (!v9)
  {
    uint64_t v11 = rbs_process_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v17 = v12;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Error deleting launchd job: <%{public}@>", buf, 0x16u);
    }
  }
  [(RBProcessManagerDelegate *)self->_delegate processManager:self didRemoveProcess:v4];
  [(RBBundlePropertiesManaging *)self->_bundlePropertiesManager removeProcess:v4];
  prewarmManager = self->_prewarmManager;
  int v14 = [v4 identity];
  [(RBPrewarmManager *)prewarmManager identityDidTerminate:v14];
}

uint64_t __41__RBProcessManager_stateApplicationQueue__block_invoke()
{
  stateApplicationQueue_queue = [MEMORY[0x263F64650] createSyncingQueue:@"RBProcessManagerStateApplicator"];
  return MEMORY[0x270F9A758]();
}

- (RBProcessManager)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBProcessManager.m" lineNumber:356 description:@"-init is not allowed on RBProcessManager"];

  return 0;
}

- (RBProcessManager)initWithBundlePropertiesManager:(id)a3 entitlementManager:(id)a4 jetsamPropertytManager:(id)a5 timeProvider:(id)a6 historialStatistics:(id)a7 delegate:(id)a8
{
  id v15 = a3;
  id v45 = a4;
  id v44 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v46.receiver = self;
  v46.super_class = (Class)RBProcessManager;
  id v19 = [(RBProcessManager *)&v46 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_bundlePropertiesManager, a3);
    objc_storeStrong((id *)&v20->_entitlementManager, a4);
    objc_storeStrong((id *)&v20->_delegate, a8);
    v20->_pendingExitBlockLock._os_unfair_lock_opaque = 0;
    v20->_lock._os_unfair_lock_opaque = 0;
    uint64_t v21 = objc_alloc_init(RBPersonaManager);
    uint64_t v22 = -[RBContainerManager initWithPersonaManager:]([RBContainerManager alloc], "initWithPersonaManager:", v21, v44, v45);
    objc_storeStrong((id *)&v20->_jetsamPropertytManager, a5);
    objc_storeStrong((id *)&v20->_historicalStatistics, a7);
    uint64_t v23 = [[RBPrewarmManager alloc] initWithDelegate:v20 timeProvider:v16];
    prewarmManager = v20->_prewarmManager;
    v20->_prewarmManager = v23;

    uint64_t v25 = [RBLaunchdJobManager alloc];
    uint64_t v26 = +[RBLaunchdInterface interface];
    uint64_t v27 = [(RBLaunchdJobManager *)v25 initWithLaunchdInterface:v26 personaManager:v21 containerManager:v22 bundlePropertiesManager:v15];
    jobManager = v20->_jobManager;
    v20->_jobManager = (RBLaunchdJobManager *)v27;

    uint64_t v29 = [[RBLaunchManager alloc] initWithJobManager:v20->_jobManager timeProvider:v16 delegate:v20];
    launchManager = v20->_launchManager;
    v20->_launchManager = v29;

    uint64_t v31 = +[RBProcessIndex index];
    processIndex = v20->_processIndex;
    v20->_processIndex = (RBProcessIndex *)v31;

    uint64_t v33 = +[RBProcessIndex indexWithCapacity:32];
    processGraveyard = v20->_processGraveyard;
    v20->_processGraveyard = (RBProcessIndex *)v33;

    long long v35 = objc_alloc_init(RBProcessMap);
    processState = v20->_processState;
    v20->_processState = v35;

    uint64_t v37 = [MEMORY[0x263EFF9A0] dictionary];
    identityToPendingExitBlock = v20->_identityToPendingExitBlock;
    v20->_identityToPendingExitBlock = (NSMutableDictionary *)v37;

    os_unfair_lock_lock(&v20->_lock);
    uint64_t v39 = [MEMORY[0x263EFF9A0] dictionary];
    identityToProcessLifecycleQueue = v20->_identityToProcessLifecycleQueue;
    v20->_identityToProcessLifecycleQueue = (NSMutableDictionary *)v39;

    uint64_t v41 = [MEMORY[0x263F08760] set];
    lifecycleQueuesInUse = v20->_lifecycleQueuesInUse;
    v20->_lifecycleQueuesInUse = (NSCountedSet *)v41;

    os_unfair_lock_unlock(&v20->_lock);
  }

  return v20;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_systemState;
  os_unfair_lock_unlock(p_lock);
  id v5 = [NSString alloc];
  id v6 = [(id)objc_opt_class() description];
  uint64_t v7 = [(RBProcessMap *)self->_processState dictionary];
  uint64_t v8 = [v7 entriesToStringWithIndent:1 debug:1];
  BOOL v9 = [(RBProcessIndex *)self->_processIndex allProcesses];
  id v10 = [v9 componentsJoinedByString:@",\n\t"];
  uint64_t v11 = (void *)[v5 initWithFormat:@"<%@| system state:%@ process states:{\n%@\t} processes:[%@\n\t]>", v6, v4, v8, v10];

  return (NSString *)v11;
}

- (void)start
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __25__RBProcessManager_start__block_invoke;
  activity_block[3] = &unk_2647C7CC8;
  activity_block[4] = self;
  _os_activity_initiate(&dword_226AB3000, "state recovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __25__RBProcessManager_start__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) synchronizeJobs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = rbs_process_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v7;
          _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "Reestablishing with %{public}@...", buf, 0xCu);
        }

        BOOL v9 = [v7 identifier];
        id v10 = +[RBLaunchdProperties propertiesForPid:](RBLaunchdProperties, "propertiesForPid:", [v9 pid]);

        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_lifecycleQueue_addProcessWithInstance:properties:", v7, v10);
        if (!v11) {
          [*(id *)(*(void *)(a1 + 32) + 8) removeJobWithInstance:v7 error:0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v4);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 64);
  int v14 = (void *)MEMORY[0x263EFFA08];
  id v15 = [*(id *)(v12 + 88) allProcesses];
  id v16 = [v14 setWithArray:v15];
  [v13 processManager:v12 didReconnectProcesses:v16];
}

- (BOOL)_canTerminateProcess:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 identity];
  uint64_t v11 = [(RBProcessMap *)self->_processState valueForIdentity:v10];
  unsigned int v12 = [v9 maximumTerminationResistance];
  if (v12 && [v11 terminationResistance] > v12)
  {
    if (a5)
    {
      uint64_t v13 = *MEMORY[0x263F646A8];
      int v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v14 setObject:@"Target process has a higher termination resistance than the termination context" forKey:*MEMORY[0x263F08338]];
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:v13 code:4 userInfo:v14];

      *a5 = v15;
    }
    id v16 = rbs_process_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v23 = 138543362;
    id v24 = v8;
    long long v17 = "Termination request for %{public}@ failed due to termination resistance";
    goto LABEL_14;
  }
  if (![v9 preventIfBeingDebugged]
    || ([v8 isBeingPtraced] & 1) == 0 && !objc_msgSend(v11, "isBeingDebugged"))
  {
    BOOL v21 = 1;
    goto LABEL_17;
  }
  if (a5)
  {
    uint64_t v18 = *MEMORY[0x263F646A8];
    long long v19 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    [v19 setObject:@"Target process is being debugged and termination context forbids request" forKey:*MEMORY[0x263F08338]];
    long long v20 = [MEMORY[0x263F087E8] errorWithDomain:v18 code:4 userInfo:v19];

    *a5 = v20;
  }
  id v16 = rbs_process_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    id v24 = v8;
    long long v17 = "Termination request for %{public}@ failed due to target being debugged";
LABEL_14:
    _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, 0xCu);
  }
LABEL_15:

  BOOL v21 = 0;
LABEL_17:

  return v21;
}

- (void)executeTerminateRequest:(id)a3 completion:(id)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (!v6)
  {
    id v60 = [MEMORY[0x263F08690] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"RBProcessManager.m", 703, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v69 = [v6 context];
  int v8 = [v6 targetsAllManagedProcesses];
  id v9 = [v6 predicate];
  id v10 = rbs_process_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"all-managed";
    if (!v8) {
      uint64_t v11 = v9;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v92 = (uint64_t)v11;
    _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Executing termination request for: %{public}@", buf, 0xCu);
  }

  if (v9) {
    char v12 = 1;
  }
  else {
    char v12 = v8;
  }
  if (!v69 || (v12 & 1) == 0)
  {
    BOOL v21 = rbs_process_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RBProcessManager executeTerminateRequest:completion:]();
    }

    if (v7)
    {
      uint64_t v22 = *MEMORY[0x263F646A8];
      int v23 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v23 setObject:@"Invalid termination context" forKey:*MEMORY[0x263F08338]];
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:v22 code:1 userInfo:v23];

      v7[2](v7, 0, v13);
      goto LABEL_82;
    }
    goto LABEL_83;
  }
  uint64_t v13 = [MEMORY[0x263EFF9C0] set];
  v72 = v13;
  if (v8)
  {
    long long v89 = 0uLL;
    long long v90 = 0uLL;
    long long v87 = 0uLL;
    long long v88 = 0uLL;
    int v14 = [(RBProcessIndex *)self->_processIndex allProcesses];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v87 objects:v97 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      int v67 = v8;
      long long v17 = v9;
      uint64_t v18 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v88 != v18) {
            objc_enumerationMutation(v14);
          }
          long long v20 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          if ([v20 isReported]) {
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v87 objects:v97 count:16];
      }
      while (v16);
LABEL_37:
      id v9 = v17;
      int v8 = v67;
    }
  }
  else
  {
    long long v85 = 0uLL;
    long long v86 = 0uLL;
    long long v83 = 0uLL;
    long long v84 = 0uLL;
    int v14 = [(RBProcessIndex *)self->_processIndex allProcesses];
    uint64_t v24 = [v14 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      int v67 = 0;
      long long v17 = v9;
      v63 = v7;
      uint64_t v26 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v84 != v26) {
            objc_enumerationMutation(v14);
          }
          uint64_t v28 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          uint64_t v29 = [v28 handle];
          int v30 = [(__CFString *)v17 matchesProcess:v29];

          uint64_t v13 = v72;
          if (v30) {
            [v72 addObject:v28];
          }
        }
        uint64_t v25 = [v14 countByEnumeratingWithState:&v83 objects:v96 count:16];
      }
      while (v25);
      uint64_t v7 = v63;
      goto LABEL_37;
    }
  }

  uint64_t v31 = rbs_process_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v13 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v92 = v32;
    _os_log_impl(&dword_226AB3000, v31, OS_LOG_TYPE_DEFAULT, "Found %lu processes to terminate", buf, 0xCu);
  }

  if (![v13 count])
  {
    id v42 = rbs_process_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      -[RBProcessManager executeTerminateRequest:completion:]();
    }

    if (v7)
    {
      uint64_t v43 = *MEMORY[0x263F646A8];
      id v44 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v44 setObject:@"No such process found" forKey:*MEMORY[0x263F08338]];
      uint64_t v33 = [MEMORY[0x263F087E8] errorWithDomain:v43 code:3 userInfo:v44];

      v7[2](v7, 0, v33);
      goto LABEL_81;
    }
    goto LABEL_82;
  }
  if ([v69 reportType] == 2 || objc_msgSend(v69, "reportType") == 3)
  {
    if ([v13 count] == 1)
    {
      uint64_t v33 = [v13 anyObject];
      id v82 = 0;
      BOOL v34 = [(RBProcessManager *)self _canTerminateProcess:v33 withContext:v69 error:&v82];
      id v35 = v82;
      if (v34)
      {
        uint64_t v36 = [v69 reportType];
        uint64_t v37 = [v69 explanation];
        unsigned int v71 = [v69 exceptionDomain];
        uint64_t v38 = [v69 exceptionCode];
        [v69 additionalPayload];
        v40 = uint64_t v39 = v7;
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __55__RBProcessManager_executeTerminateRequest_completion___block_invoke;
        v78[3] = &unk_2647C8B40;
        id v79 = v69;
        id v80 = v33;
        id v81 = v39;
        uint64_t v41 = v38;
        uint64_t v13 = v72;
        [v80 collectDiagnostic:v36 description:v37 domain:v71 code:v41 additionalPayload:v40 completion:v78];

        uint64_t v7 = (void (**)(id, void, void *))v39;
      }
      else if (v7)
      {
        v7[2](v7, 0, v35);
      }

      goto LABEL_81;
    }
    id v45 = rbs_process_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[RBProcessManager executeTerminateRequest:completion:]();
    }

    [v69 setReportType:1];
  }
  id v62 = v9;
  id v64 = v7;
  id v61 = v6;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v46 = v13;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v74 objects:v95 count:16];
  if (!v47)
  {
    uint64_t v33 = 0;
    char v68 = 1;
    goto LABEL_75;
  }
  uint64_t v48 = v47;
  int v49 = v8;
  uint64_t v33 = 0;
  uint64_t v50 = *(void *)v75;
  uint64_t v65 = *MEMORY[0x263F08338];
  uint64_t v66 = *MEMORY[0x263F646A8];
  char v68 = 1;
  audit_token_t v51 = v69;
  do
  {
    for (uint64_t k = 0; k != v48; ++k)
    {
      if (*(void *)v75 != v50) {
        objc_enumerationMutation(v46);
      }
      uint64_t v53 = *(void **)(*((void *)&v74 + 1) + 8 * k);
      id v73 = 0;
      BOOL v54 = [(RBProcessManager *)self _canTerminateProcess:v53 withContext:v51 error:&v73];
      id v55 = v73;

      if (v54)
      {
        if ([v53 terminateWithContext:v51]) {
          goto LABEL_63;
        }
        v56 = rbs_process_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v92 = (uint64_t)v53;
          _os_log_error_impl(&dword_226AB3000, v56, OS_LOG_TYPE_ERROR, "failed to terminate %{public}@", buf, 0xCu);
        }

        if (v49)
        {
LABEL_63:
          uint64_t v33 = v55;
          continue;
        }
        v59 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
        [v59 setObject:@"Termination failed" forKey:v65];
        uint64_t v33 = [MEMORY[0x263F087E8] errorWithDomain:v66 code:5 userInfo:v59];

        char v68 = 0;
      }
      else
      {
        v57 = rbs_process_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          id v58 = [v55 localizedFailureReason];
          *(_DWORD *)buf = 138543618;
          uint64_t v92 = (uint64_t)v53;
          __int16 v93 = 2114;
          v94 = v58;
          _os_log_impl(&dword_226AB3000, v57, OS_LOG_TYPE_INFO, "skipping %{public}@ for reason : %{public}@", buf, 0x16u);
        }
        if (!v49)
        {
          char v68 = 0;
          uint64_t v33 = v55;
          audit_token_t v51 = v69;
          continue;
        }
        uint64_t v33 = 0;
        audit_token_t v51 = v69;
      }
    }
    uint64_t v48 = [v46 countByEnumeratingWithState:&v74 objects:v95 count:16];
  }
  while (v48);
LABEL_75:

  uint64_t v7 = v64;
  if (v64) {
    v64[2](v64, v68 & 1, v33);
  }
  id v6 = v61;
  id v9 = v62;
  uint64_t v13 = v72;
LABEL_81:

LABEL_82:
LABEL_83:
}

void __55__RBProcessManager_executeTerminateRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = *MEMORY[0x263F646A8];
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    [v7 setObject:@"Diagnostic collection failed" forKey:*MEMORY[0x263F08338]];
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:v6 code:5 userInfo:v7];

    [*(id *)(a1 + 32) setReportType:1];
    id v5 = (id)v8;
  }
  if ([*(id *)(a1 + 40) terminateWithContext:*(void *)(a1 + 32)])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
    }
  }
  else
  {
    id v10 = rbs_process_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__RBProcessManager_executeTerminateRequest_completion___block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = *(void *)(a1 + 48);
    if (v17)
    {
      uint64_t v18 = *MEMORY[0x263F646A8];
      long long v19 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v19 setObject:@"Termination failed" forKey:*MEMORY[0x263F08338]];
      long long v20 = [MEMORY[0x263F087E8] errorWithDomain:v18 code:5 userInfo:v19];

      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v20);
    }
  }
}

- (id)busyExtensionInstancesFromSet:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = rbs_process_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_INFO, "matching extension instances: %{public}@", buf, 0xCu);
  }

  uint64_t v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(RBProcessIndex *)self->_processIndex allProcesses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v12 isSuspended] & 1) == 0)
        {
          uint64_t v13 = [v12 identity];
          uint64_t v14 = [v13 xpcServiceIdentifier];

          if (v14 && [v4 containsObject:v14]) {
            [v6 addObject:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_enqueueGuaranteedRunningLaunchForIdentity:(id)a3 atTime:(double)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  RBSMachAbsoluteTime();
  double v8 = v7;
  dispatch_time_t v9 = dispatch_time(0, 0);
  double v10 = fmax(a4 - v8, 0.0);
  uint64_t v11 = rbs_process_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2048;
    double v25 = v10;
    _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing GuaranteedRunning launch for %@ in %0.2fs", buf, 0x16u);
  }

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  long long v18 = __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke;
  long long v19 = &unk_2647C7B98;
  long long v20 = self;
  id v12 = v6;
  id v21 = v12;
  uint64_t v13 = (void *)MEMORY[0x22A6611D0](&v16);
  if (fabs(v10) >= 2.22044605e-16)
  {
    dispatch_time_t v15 = dispatch_time(v9, (uint64_t)(v10 * 1000000000.0));
    uint64_t v14 = +[RBProcessManager stateApplicationQueue];
    dispatch_after(v15, v14, v13);
  }
  else
  {
    uint64_t v14 = +[RBProcessManager stateApplicationQueue];
    dispatch_async(v14, v13);
  }
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 112) valueForIdentity:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3 && [v3 guaranteedRunning])
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 88) processForIdentity:*(void *)(a1 + 40)];
    if (v5)
    {

LABEL_10:
      uint64_t v13 = rbs_process_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *v2;
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v14;
        _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "Applying state after GuaranteedRunning launch of %@", buf, 0xCu);
      }

      uint64_t v16 = *(void **)(a1 + 32);
      dispatch_time_t v15 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_136;
      v29[3] = &unk_2647C7A08;
      v29[4] = v16;
      id v30 = v15;
      id v31 = v4;
      [v16 _executeLifecycleEventForIdentity:v30 sync:0 withBlock:v29];

      goto LABEL_13;
    }
    double v8 = [MEMORY[0x263F644E0] contextWithIdentity:*(void *)(a1 + 40)];
    dispatch_time_t v9 = (void *)[objc_alloc(MEMORY[0x263F644F0]) initWithContext:v8];
    double v10 = *(void **)(a1 + 32);
    id v32 = 0;
    uint64_t v11 = [v10 _executeLaunchRequest:v9 withError:&v32];
    id v12 = v32;
    if (v11)
    {

      goto LABEL_10;
    }
    uint64_t v17 = rbs_process_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v18) {
        __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_3(v2, (uint64_t)v12, v17);
      }

      if ([v12 code] != 6) {
        goto LABEL_26;
      }
      uint64_t v17 = [v12 userInfo];
      double v25 = [v17 objectForKey:*MEMORY[0x263F646C0]];
      if (!v25)
      {
        uint64_t v26 = rbs_general_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_2();
        }
      }
      uint64_t v28 = *(void **)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 40);
      [v25 doubleValue];
      objc_msgSend(v28, "_enqueueGuaranteedRunningLaunchForIdentity:atTime:", v27);
    }
    else if (v18)
    {
      __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_1((uint64_t)v2, v17, v19, v20, v21, v22, v23, v24);
    }

LABEL_26:
    goto LABEL_13;
  }
  id v6 = rbs_process_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *v2;
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v7;
    _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_DEFAULT, "Bailing previously enqueued GuaranteedRunning launch of %@ because it is now out-of-state", buf, 0xCu);
  }

LABEL_13:
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_136(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) processForIdentity:a1[5]];
  if (v2)
  {
    id v3 = v2;
    [v2 _applyState:a1[6]];
    uint64_t v2 = v3;
  }
}

- (void)applySystemState:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [v11 prewarmConfiguration];
  id v5 = [(RBSystemState *)self->_systemState prewarmConfiguration];
  if (v4 == v5)
  {

LABEL_9:
    goto LABEL_10;
  }
  id v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v4 isEqual:v5];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    prewarmManager = self->_prewarmManager;
    id v4 = [v11 prewarmConfiguration];
    [(RBPrewarmManager *)prewarmManager prewarmingConfigurationDidChange:v4];
    goto LABEL_9;
  }
LABEL_10:
  dispatch_time_t v9 = (RBSystemState *)[v11 copy];
  systemState = self->_systemState;
  self->_systemState = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stateCaptureTitle
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_processForInstance:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(RBProcessManager *)self _processForIdentifier:v5];

  char v7 = [v6 instance];
  char v8 = [v7 isEqual:v4];

  if ((v8 & 1) == 0)
  {

    id v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleQueuesInUse, 0);
  objc_storeStrong((id *)&self->_identityToProcessLifecycleQueue, 0);
  objc_storeStrong((id *)&self->_identityToPendingExitBlock, 0);
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_processGraveyard, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_launchManager, 0);
  objc_storeStrong((id *)&self->_prewarmManager, 0);
  objc_storeStrong((id *)&self->_historicalStatistics, 0);
  objc_storeStrong((id *)&self->_jetsamPropertytManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_jobManager, 0);
}

- (void)_processForIdentifier:withAuditToken:forceStartTracking:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "%{public}@ queried in _processForIdentifier but is already dead!", v2, v3, v4, v5, v6);
}

- (void)_processForIdentifier:(uint8_t *)buf withAuditToken:(os_log_t)log forceStartTracking:.cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "AUID of process has changed from %{public}@ to %{public}@", buf, 0x16u);
}

- (void)executeTerminateRequest:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_226AB3000, v0, OS_LOG_TYPE_DEBUG, "no process found to terminate : %{public}@", v1, 0xCu);
}

- (void)executeTerminateRequest:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Terminate request attempted with multiple stackshots : %{public}@", v2, v3, v4, v5, v6);
}

- (void)executeTerminateRequest:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "invalid terminate request : %{public}@", v2, v3, v4, v5, v6);
}

void __55__RBProcessManager_executeTerminateRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_226AB3000, v0, OS_LOG_TYPE_FAULT, "Backoff triggered without backoff time %{public}@ : %{public}@", v1, 0x16u);
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_17(&dword_226AB3000, a2, a3, "Failed GuaranteedRunning launch of %@ because of %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_resolveProcessWithIdentifier:(int)a1 auditToken:(NSObject *)a2 properties:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "failed to determine identity for pid=%d", (uint8_t *)v2, 8u);
}

- (void)_resolveProcessWithIdentifier:(uint64_t)a1 auditToken:(int)a2 properties:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "_resolveProcessWithIdentifier could not get auid/euid for pid %d auditToken %{public}@", (uint8_t *)v3, 0x12u);
}

- (void)_getLifecycleQueueForIdentity:.cold.1()
{
  __assert_rtn("-[RBProcessManager _getLifecycleQueueForIdentity:]", "RBProcessManager.m", 1132, "[_lifecycleQueuesInUse countForObject:identity] == 0");
}

- (void)_releaseLifecycleQueueForIdentity:.cold.1()
{
  __assert_rtn("-[RBProcessManager _releaseLifecycleQueueForIdentity:]", "RBProcessManager.m", 1154, "countBefore != 0");
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "%{public}@ Cannot track instance that is already dead!", v2, v3, v4, v5, v6);
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Failed to create process object for %{public}@", v2, v3, v4, v5, v6);
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Prior process for %@ is reporting a pid when we're not expecting it to (should be dead).", v2, v3, v4, v5, v6);
}

- (void)_lifecycleQueue_addProcessWithInstance:(int)a3 properties:(os_log_t)log .cold.4(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "We already have an extension %@ with this pid: %d, were two launches for the same extension executed? Returning the existing instance.", buf, 0x12u);
}

@end