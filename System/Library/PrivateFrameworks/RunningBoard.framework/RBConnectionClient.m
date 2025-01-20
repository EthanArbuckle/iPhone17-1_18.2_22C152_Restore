@interface RBConnectionClient
+ (id)sharedLaunchWorkloop;
+ (id)sharedTerminationWorkloop;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasEntitlementDomain:(unint64_t)a3;
- (BOOL)intendToExit:(void *)a3 withStatus:(void *)a4 error:;
- (BOOL)invalidateAssertionWithIdentifier:(uint64_t)a3 sync:(void *)a4 error:;
- (BOOL)subscribeToProcessStateChangesWithConfiguration:(void *)a3 error:;
- (NSString)description;
- (NSString)stateCaptureTitle;
- (RBConnectionClient)init;
- (__CFString)lookupProcessName:(void *)a3 error:;
- (id)assertionDescriptorsWithFlattenedAttributes:(void *)a3 error:;
- (id)busyExtensionInstancesFromSet:(void *)a3 error:;
- (id)handshakeWithRequest:(uint64_t)a1;
- (id)hostProcessForInstance:(void *)a3 error:;
- (id)identifiersForStateCaptureSubsystemsWithError:(id *)a1;
- (id)infoPlistResultForInstance:(void *)a3 forKeys:(void *)a4 error:;
- (id)initWithContext:(void *)a3 listener:(void *)a4 process:(void *)a5 connection:;
- (id)lastExitContextForInstance:(void *)a3 error:;
- (id)limitationsForInstance:(void *)a3 error:;
- (id)lookupHandleForKey:(void *)a3 error:;
- (id)lookupHandleForPredicate:(void *)a3 error:;
- (id)lookupPortForIdentifier:(void *)a3 error:;
- (id)preventLaunchPredicates;
- (id)subscribeToProcessDeath:(void *)a3 error:;
- (uint64_t)_canInvalidateAssertionWithIdentifier:(void *)a3 error:;
- (uint64_t)_predicatesMatchOnlyAllowedProcess:(uint64_t)a1;
- (uint64_t)processIdentifier;
- (uint64_t)processIdentity;
- (uint64_t)saveEndowment:(void *)a3 withError:;
- (void)_addStatesForUntrackedProcessesTo:(void *)a3 withPredicate:;
- (void)_requestPluginHoldForProxy:(int)a3 terminate:(void *)a4 completion:;
- (void)_setReadyWithConnection:(uint64_t)a1;
- (void)_trackTargetProcessForDescriptor:(uint64_t)a1;
- (void)acquireAssertionForDescriptor:(void *)a3 withReply:;
- (void)captureStateForSubsystem:(void *)a3 withReply:;
- (void)cleanupHolds;
- (void)didInvalidateAssertions:(uint64_t)a1;
- (void)didRemoveProcess:(uint64_t)a1 withState:(void *)a2;
- (void)didUpdateProcessStates:(uint64_t)a1;
- (void)executeLaunchRequest:(uint64_t)a3 withEuid:(void *)a4 withReply:;
- (void)executeTerminateRequest:(void *)a3 withReply:;
- (void)expandPredicateForContained:(uint64_t)a1;
- (void)handleMessage:(uint64_t)a1;
- (void)inheritanceManager:(id)a3 didChangeInheritances:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)isIdentityAnAngel:(void *)a3 withError:;
- (void)preventLaunchPredicates;
- (void)statesForPredicate:(void *)a3 withDescriptor:(void *)a4 withReply:;
- (void)unsubscribeFromProcessStateChangesWithIdentifier:(uint64_t)a1;
- (void)willExpireAssertionsSoonForProcess:(double)a3 expirationTime:;
- (void)willInvalidateAssertion:(uint64_t)a1;
@end

@implementation RBConnectionClient

- (void)didInvalidateAssertions:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v26 = [MEMORY[0x263EFF9C0] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v3;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v9 = [v8 originator];
          v10 = [v9 identifier];

          if ([*(id *)(a1 + 136) isEqual:v10])
          {
            v11 = [v8 identifier];
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
            int v12 = [*(id *)(a1 + 168) containsObject:v11];
            [*(id *)(a1 + 168) removeObject:v11];
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            v13 = [*(id *)(a1 + 24) popPluginHoldForAssertion:v11];
            if (v13)
            {
              v14 = rbs_assertion_log();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v13;
                _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_INFO, "Releasing plugin hold token %@", buf, 0xCu);
              }

              v15 = [MEMORY[0x263F5E718] managerForUser:*(unsigned int *)(a1 + 144)];
              [v15 releaseHold:v13];
            }
            if (v12) {
              [v26 addObject:v11];
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v5);
    }

    uint64_t v16 = [v26 count];
    if (v16)
    {
      uint64_t v17 = v16;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      id v18 = *(id *)(a1 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      if (v18)
      {
        v19 = rbs_assertion_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          [(RBConnectionClient *)a1 didInvalidateAssertions:v19];
        }

        v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v21 = *MEMORY[0x263F64670];
        uint64_t v32 = *MEMORY[0x263F08338];
        v33 = @"Assertions were invalidated";
        v22 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        v23 = [v20 errorWithDomain:v21 code:1 userInfo:v22];

        v24 = objc_msgSend(MEMORY[0x263F64658], "messageForMethod:varguments:", sel_async_assertionsDidInvalidate_withError_, v26, v23, 0);
        [v24 sendToConnection:v18];
      }
    }

    id v3 = v25;
  }
}

- (void)_trackTargetProcessForDescriptor:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 target];
    id v6 = [v3 processIdentifier];

    uint64_t v4 = v6;
    if (v6)
    {
      id v5 = (id)[*(id *)(a1 + 40) processForIdentifier:v6];
      uint64_t v4 = v6;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  processIdentifier = self->_processIdentifier;
  id v6 = [(RBSProcessIdentity *)self->_processIdentity shortDescription];
  v7 = (void *)[v3 initWithFormat:@"<%@| %@ name:%@ entitlements:%@ inheritanceManager:%@>", v4, processIdentifier, v6, self->_entitlements, self->_inheritanceManager];

  return (NSString *)v7;
}

void __36__RBConnectionClient_handleMessage___block_invoke_3_61(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v20 = *MEMORY[0x263F08608];
    uint64_t v21 = v6;
    v9 = NSDictionary;
    v10 = &v21;
    v11 = &v20;
  }
  else
  {
    uint64_t v16 = [v5 target];
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      int v12 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      [v5 setTarget:v12];
      -[RBConnectionClient acquireAssertionForDescriptor:withReply:](*(void *)(a1 + 40), v5, *(void **)(a1 + 48));
      uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
      v15 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = 0;
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v22 = *MEMORY[0x263F08338];
    v23[0] = @"missing valid target";
    v9 = NSDictionary;
    v10 = v23;
    v11 = &v22;
  }
  int v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  uint64_t v13 = [v7 errorWithDomain:v8 code:3 userInfo:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
LABEL_6:
}

id __36__RBConnectionClient_handleMessage___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 copyWithEuid:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v3 processIdentity];
  id v5 = [v4 personaString];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);

    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v4 = v3;
    uint64_t v3 = (void *)[v3 copyWithPersonaString:*(void *)(a1 + 32)];
  }

LABEL_6:
  return v3;
}

- (BOOL)subscribeToProcessStateChangesWithConfiguration:(void *)a3 error:
{
  id v5 = a2;
  if (!a1)
  {
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if (([(id)a1 hasEntitlementDomain:1] & 1) == 0)
  {
    uint64_t v6 = [v5 predicates];
    int v7 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v6);

    if (!v7)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      v11 = rbs_connection_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient subscribeToProcessStateChangesWithConfiguration:error:]();
      }

      if (!a3) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 184) addConfiguration:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    uint64_t v8 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F646A8] code:1 userInfo:0];
  if (a3) {
LABEL_8:
  }
    *a3 = v8;
LABEL_9:
  BOOL v9 = v8 == 0;

LABEL_10:
  return v9;
}

void __36__RBConnectionClient_handleMessage___block_invoke_53(void *a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v7;
    int v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = a1[5];
    id v17 = 0;
    int v12 = -[RBConnectionClient lookupHandleForPredicate:error:](v16, v5, &v17);
    objc_storeStrong(v8, v17);
    [v12 fullEncode:a1[6] forKey:*MEMORY[0x263F646E0]];
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_2_46(void *a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v7;
    int v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = (void *)a1[5];
    id v17 = 0;
    int v12 = -[RBConnectionClient lookupHandleForKey:error:](v16, v5, &v17);
    objc_storeStrong(v8, v17);
    [v12 fullEncode:a1[6] forKey:*MEMORY[0x263F646E0]];
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_12(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v18 = 0;
  uint64_t v9 = [v6 decodeArgumentWithClass:v7 atIndex:1 allowNil:1 error:&v18];
  objc_storeStrong(v8, v18);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F646B8];
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v10;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    -[RBConnectionClient statesForPredicate:withDescriptor:withReply:](*(id **)(a1 + 40), v5, v9, *(void **)(a1 + 48));
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
  }
}

- (id)lookupHandleForPredicate:(void *)a3 error:
{
  v34[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a1)
  {
    uint64_t v10 = 0;
    goto LABEL_28;
  }
  if (([(id)a1 hasEntitlementDomain:1] & 1) == 0)
  {
    v34[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
    int v7 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v6);

    if (!v7)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v8 = rbs_connection_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient lookupHandleForPredicate:error:]();
      }
      uint64_t v10 = 0;
      goto LABEL_21;
    }
  }
  uint64_t v8 = [*(id *)(a1 + 40) processesMatchingPredicate:v5];
  if (![v8 count])
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F646A8];
    uint64_t v26 = *MEMORY[0x263F08338];
    v27 = @"Specified predicate did not match any processes";
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v11 = [v12 errorWithDomain:v13 code:3 userInfo:v14];

    uint64_t v9 = rbs_connection_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 104);
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_INFO, "%{public}@ handle lookup could not find a matching process", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if ([v8 count] != 1)
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F646A8];
    uint64_t v28 = *MEMORY[0x263F08338];
    long long v29 = @"Specified predicate matched multiple processes";
    id v18 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v11 = [v16 errorWithDomain:v17 code:1 userInfo:v18];

    uint64_t v9 = rbs_connection_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBConnectionClient lookupHandleForPredicate:error:]();
    }
    goto LABEL_19;
  }
  uint64_t v9 = [v8 anyObject];
  if (([*(id *)(a1 + 40) isActiveProcess:v9] & 1) == 0)
  {
    [v9 rbs_pid];
    if (!RBSPIDExists())
    {
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F646A8];
      uint64_t v32 = *MEMORY[0x263F08338];
      v33 = @"Process is no longer running";
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v11 = [v19 errorWithDomain:v20 code:3 userInfo:v21];

      uint64_t v22 = rbs_connection_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 104);
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v23;
        _os_log_impl(&dword_226AB3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ handle requested for no longer running process", buf, 0xCu);
      }

LABEL_19:
      uint64_t v10 = 0;
      goto LABEL_20;
    }
  }
  uint64_t v10 = [v9 handle];
  uint64_t v11 = 0;
LABEL_20:

LABEL_21:
  if (!v11)
  {
    v24 = rbs_connection_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[RBConnectionClient lookupHandleForPredicate:error:]();
    }
  }
  if (a3) {
    *a3 = v11;
  }

LABEL_28:
  return v10;
}

- (void)statesForPredicate:(void *)a3 withDescriptor:(void *)a4 withReply:
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (([a1 hasEntitlementDomain:1] & 1) != 0
      || (v20[0] = v7,
          [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v10),
          v10,
          v11))
    {
      [v9 prepareForHandoff];
      uint64_t v12 = [MEMORY[0x263F64660] currentContext];
      uint64_t v13 = [a1[6] monitorSerializationQueue];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __66__RBConnectionClient_statesForPredicate_withDescriptor_withReply___block_invoke;
      v16[3] = &unk_2647C8130;
      v16[4] = a1;
      id v17 = v7;
      id v18 = v8;
      id v19 = v9;
      [v12 handoffToQueue:v13 block:v16];
    }
    else
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v14 = rbs_connection_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient statesForPredicate:withDescriptor:withReply:]();
      }

      uint64_t v15 = [v9 payload];
      [v15 encodeObject:v12 forKey:*MEMORY[0x263F646D0]];

      [v9 send];
    }
  }
}

- (id)lookupHandleForKey:(void *)a3 error:
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    id v7 = objc_msgSend(MEMORY[0x263F64570], "handleForKey:fetchIfNeeded:", objc_msgSend(v5, "unsignedLongLongValue"), 0);
    if ([a1 hasEntitlementDomain:1])
    {
      if (!v7)
      {
        id v8 = rbs_general_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient lookupHandleForKey:error:](v6, v8);
        }

        id v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v10 = *MEMORY[0x263F646A8];
        uint64_t v17 = *MEMORY[0x263F08338];
        id v18 = @"No such process";
        int v11 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v12 = [v9 errorWithDomain:v10 code:3 userInfo:v11];
        goto LABEL_13;
      }
    }
    else
    {
      if (!v7) {
        goto LABEL_11;
      }
      uint64_t v13 = [MEMORY[0x263F645D8] predicateMatchingHandle:v7];
      v19[0] = v13;
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      char v15 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v14);

      if ((v15 & 1) == 0)
      {
LABEL_11:
        uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
        int v11 = rbs_connection_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient lookupHandleForKey:error:]();
        }
LABEL_13:

        a1 = 0;
        if (!a3)
        {
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        *a3 = v12;
        goto LABEL_15;
      }
    }
    a1 = v7;
    uint64_t v12 = 0;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_16:

  return a1;
}

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  return [(RBEntitlementPossessing *)self->_entitlements hasEntitlementDomain:a3];
}

void __62__RBConnectionClient_acquireAssertionForDescriptor_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) payload];
  uint64_t v4 = v3;
  if (v5)
  {
    [v3 encodeObject:v5 forKey:*MEMORY[0x263F646D0]];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
    [*(id *)(*(void *)(a1 + 48) + 168) removeObject:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
  }
  else
  {
    [v3 encodeObject:*(void *)(a1 + 40) forKey:*MEMORY[0x263F646E0]];
  }
  [*(id *)(a1 + 32) send];
}

void __66__RBConnectionClient_statesForPredicate_withDescriptor_withReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) statesMatchingPredicate:*(void *)(a1 + 40)];
  [MEMORY[0x263F645E0] setActiveStateDescriptor:*(void *)(a1 + 48)];
  uint64_t v3 = [v2 count];
  -[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:](*(void **)(a1 + 32), v2, *(void **)(a1 + 40));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == [v7 count])
  {
    uint64_t v4 = [*(id *)(a1 + 56) payload];
    [v4 encodeObject:v7 forKey:*MEMORY[0x263F646E0]];
  }
  else
  {
    id v5 = [MEMORY[0x263F08B88] currentThread];
    uint64_t v4 = [v5 threadDictionary];

    [v4 setObject:MEMORY[0x263EFFA88] forKey:@"RBSProcessHandleFullEncode"];
    uint64_t v6 = [*(id *)(a1 + 56) payload];
    [v6 encodeObject:v7 forKey:*MEMORY[0x263F646E0]];

    [v4 removeObjectForKey:@"RBSProcessHandleFullEncode"];
  }

  [MEMORY[0x263F645E0] setActiveStateDescriptor:0];
  [*(id *)(a1 + 56) send];
}

- (void)handleMessage:(uint64_t)a1
{
  uint64_t v211 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x263F64658] messageForXPCMessage:v3];
    id v5 = v4;
    if (v4 && ([v4 isEmpty] & 1) == 0)
    {
      uint64_t v6 = [v5 method];
      if (v6)
      {
        id v7 = (const char *)v6;
        id v8 = [v5 reply];
        id v9 = [v8 payload];
        uint64_t v187 = 0;
        v188 = &v187;
        uint64_t v189 = 0x3032000000;
        v190 = __Block_byref_object_copy__2;
        v191 = __Block_byref_object_dispose__2;
        v184[0] = MEMORY[0x263EF8330];
        v184[1] = 3221225472;
        v184[2] = __36__RBConnectionClient_handleMessage___block_invoke;
        v184[3] = &unk_2647C8270;
        v184[4] = a1;
        id v38 = v9;
        id v185 = v38;
        v36 = v8;
        v186 = v36;
        id v192 = (id)MEMORY[0x22A6611D0](v184);
        uint64_t v10 = xpc_dictionary_get_remote_connection(v3);
        long long v183 = 0u;
        long long v182 = 0u;
        RBSInvalidRealAuditToken();
        xpc_connection_get_audit_token();
        memset(atoken, 0, 32);
        if (RBSRealAuditTokenValid())
        {
          *(_OWORD *)atoken = v182;
          *(_OWORD *)&atoken[16] = v183;
          uid_t v11 = audit_token_to_euid((audit_token_t *)atoken);
          *(_OWORD *)atoken = v182;
          *(_OWORD *)&atoken[16] = v183;
          uid_t v12 = audit_token_to_auid((audit_token_t *)atoken);
          if (v12 + 1 >= 2) {
            uid_t v13 = v12;
          }
          else {
            uid_t v13 = v11;
          }
        }
        else
        {
          uid_t v13 = 0;
          uid_t v11 = 0;
        }
        uint64_t v210 = 0;
        memset(v209, 0, sizeof(v209));
        long long v208 = 0u;
        long long v207 = 0u;
        long long v206 = 0u;
        memset(&atoken[4], 0, 32);
        *(_DWORD *)atoken = 2;
        uint64_t v37 = (void *)v10;
        uint64_t v16 = 0;
        if (!kpersona_info() && *(_DWORD *)&atoken[8] <= 5u && ((1 << atoken[8]) & 0x26) != 0)
        {
          uint64_t v16 = [NSString stringWithUTF8String:&v209[4]];
        }
        uint64_t v17 = rbs_message_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = *(void *)(a1 + 112);
          id v19 = NSStringFromSelector(v7);
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v11;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v13;
          *(_WORD *)v204 = 2114;
          *(void *)&v204[2] = v16;
          *(_WORD *)&v204[10] = 2114;
          *(void *)&v204[12] = v19;
          _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_INFO, "PERF: Received request from %{public}@ (euid %d, auid %d) (persona %{public}@): %{public}@", buf, 0x2Cu);
        }
        if ((_os_feature_enabled_impl() & 1) == 0)
        {

          uint64_t v16 = 0;
        }
        v179[0] = MEMORY[0x263EF8330];
        v179[1] = 3221225472;
        v179[2] = __36__RBConnectionClient_handleMessage___block_invoke_32;
        v179[3] = &unk_2647C8298;
        uid_t v181 = v11;
        id v20 = v16;
        id v180 = v20;
        v35 = (void *)MEMORY[0x22A6611D0](v179);
        v176[0] = MEMORY[0x263EF8330];
        v176[1] = 3221225472;
        v176[2] = __36__RBConnectionClient_handleMessage___block_invoke_2;
        v176[3] = &unk_2647C82C0;
        uid_t v178 = v13;
        id v21 = v20;
        id v177 = v21;
        v34 = (void *)MEMORY[0x22A6611D0](v176);
        v173[0] = MEMORY[0x263EF8330];
        v173[1] = 3221225472;
        v173[2] = __36__RBConnectionClient_handleMessage___block_invoke_3;
        v173[3] = &unk_2647C82E8;
        uid_t v175 = v13;
        id v22 = v21;
        id v174 = v22;
        uint64_t v23 = (void *)MEMORY[0x22A6611D0](v173);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)v204 = __Block_byref_object_copy__36;
        *(void *)&v204[8] = __Block_byref_object_dispose__37;
        *(void *)&v204[16] = 0;
        if (v7 == sel_handshakeWithRequest_)
        {
          activity_block[0] = MEMORY[0x263EF8330];
          activity_block[1] = 3221225472;
          activity_block[2] = __36__RBConnectionClient_handleMessage___block_invoke_40;
          activity_block[3] = &unk_2647C8310;
          v171 = buf;
          id v167 = v5;
          uint64_t v168 = a1;
          id v169 = v37;
          uid_t v172 = v11;
          id v170 = v38;
          _os_activity_initiate(&dword_226AB3000, "handshakeWithRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }
        else if (v7 == sel_lookupHandleForKey_error_)
        {
          v161[0] = MEMORY[0x263EF8330];
          v161[1] = 3221225472;
          v161[2] = __36__RBConnectionClient_handleMessage___block_invoke_2_46;
          v161[3] = &unk_2647C8338;
          v165 = buf;
          id v162 = v5;
          uint64_t v163 = a1;
          id v164 = v38;
          _os_activity_initiate(&dword_226AB3000, "lookupHandleForKey", OS_ACTIVITY_FLAG_DEFAULT, v161);
        }
        else if (v7 == sel_lookupProcessName_error_)
        {
          v156[0] = MEMORY[0x263EF8330];
          v156[1] = 3221225472;
          v156[2] = __36__RBConnectionClient_handleMessage___block_invoke_3_50;
          v156[3] = &unk_2647C8338;
          v160 = buf;
          id v157 = v5;
          uint64_t v158 = a1;
          id v159 = v38;
          _os_activity_initiate(&dword_226AB3000, "lookupProcessName", OS_ACTIVITY_FLAG_DEFAULT, v156);
        }
        else if (v7 == sel_lookupHandleForPredicate_error_)
        {
          uint64_t v31 = rbs_message_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = *(void *)(a1 + 112);
            *(_DWORD *)v195 = 138544130;
            uint64_t v196 = v32;
            __int16 v197 = 1024;
            uid_t v198 = v11;
            __int16 v199 = 1024;
            uid_t v200 = v13;
            __int16 v201 = 2114;
            id v202 = v22;
            _os_log_impl(&dword_226AB3000, v31, OS_LOG_TYPE_DEFAULT, "PERF: Received lookupHandleForPredicate request from %{public}@ (euid %d, auid %d) (persona %{public}@)", v195, 0x22u);
          }

          v151[0] = MEMORY[0x263EF8330];
          v151[1] = 3221225472;
          v151[2] = __36__RBConnectionClient_handleMessage___block_invoke_53;
          v151[3] = &unk_2647C8338;
          v155 = buf;
          id v152 = v5;
          uint64_t v153 = a1;
          id v154 = v38;
          _os_activity_initiate(&dword_226AB3000, "lookupHandleForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v151);
        }
        else if (v7 == sel_lookupPortForIdentifier_error_)
        {
          v146[0] = MEMORY[0x263EF8330];
          v146[1] = 3221225472;
          v146[2] = __36__RBConnectionClient_handleMessage___block_invoke_2_57;
          v146[3] = &unk_2647C8338;
          v150 = buf;
          id v147 = v5;
          uint64_t v148 = a1;
          id v149 = v38;
          _os_activity_initiate(&dword_226AB3000, "lookupPortForIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v146);
        }
        else if (v7 == sel_acquireAssertionWithDescriptor_error_)
        {
          v139[0] = MEMORY[0x263EF8330];
          v139[1] = 3221225472;
          v139[2] = __36__RBConnectionClient_handleMessage___block_invoke_3_61;
          v139[3] = &unk_2647C8360;
          id v140 = v5;
          v144 = buf;
          id v143 = v35;
          uint64_t v141 = a1;
          v142 = v36;
          v145 = &v187;
          _os_activity_initiate(&dword_226AB3000, "acquireAssertionWithDescriptor", OS_ACTIVITY_FLAG_DEFAULT, v139);
        }
        else if (v7 == sel_async_invalidateAssertionWithIdentifier_)
        {
          v135[0] = MEMORY[0x263EF8330];
          v135[1] = 3221225472;
          v135[2] = __36__RBConnectionClient_handleMessage___block_invoke_4;
          v135[3] = &unk_2647C8388;
          v138 = buf;
          id v136 = v5;
          uint64_t v137 = a1;
          _os_activity_initiate(&dword_226AB3000, "invalidateAssertionWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v135);
        }
        else if (v7 == sel_void_invalidateAssertionWithIdentifier_error_)
        {
          v131[0] = MEMORY[0x263EF8330];
          v131[1] = 3221225472;
          v131[2] = __36__RBConnectionClient_handleMessage___block_invoke_5;
          v131[3] = &unk_2647C8388;
          v134 = buf;
          id v132 = v5;
          uint64_t v133 = a1;
          _os_activity_initiate(&dword_226AB3000, "invalidateAssertionWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v131);
        }
        else if (v7 == sel_assertionDescriptorsWithFlattenedAttributes_error_)
        {
          v126[0] = MEMORY[0x263EF8330];
          v126[1] = 3221225472;
          v126[2] = __36__RBConnectionClient_handleMessage___block_invoke_6;
          v126[3] = &unk_2647C8338;
          v130 = buf;
          id v127 = v5;
          uint64_t v128 = a1;
          id v129 = v38;
          _os_activity_initiate(&dword_226AB3000, "assertionDescriptorsWithFlattenedAttributes", OS_ACTIVITY_FLAG_DEFAULT, v126);
        }
        else if (v7 == sel_executeLaunchRequest_error_)
        {
          v118[0] = MEMORY[0x263EF8330];
          v118[1] = 3221225472;
          v118[2] = __36__RBConnectionClient_handleMessage___block_invoke_7;
          v118[3] = &unk_2647C83B0;
          id v119 = v5;
          v123 = buf;
          id v122 = v34;
          uint64_t v120 = a1;
          uid_t v125 = v11;
          v121 = v36;
          v124 = &v187;
          _os_activity_initiate(&dword_226AB3000, "executeLaunchRequest", OS_ACTIVITY_FLAG_DEFAULT, v118);
        }
        else if (v7 == sel_executeTerminateRequest_identifier_error_)
        {
          v112[0] = MEMORY[0x263EF8330];
          v112[1] = 3221225472;
          v112[2] = __36__RBConnectionClient_handleMessage___block_invoke_8;
          v112[3] = &unk_2647C83D8;
          v116 = buf;
          id v113 = v5;
          uint64_t v114 = a1;
          v115 = v36;
          v117 = &v187;
          _os_activity_initiate(&dword_226AB3000, "executeTerminateRequest", OS_ACTIVITY_FLAG_DEFAULT, v112);
        }
        else if (v7 == sel_subscribeToProcessDeath_error_)
        {
          v107[0] = MEMORY[0x263EF8330];
          v107[1] = 3221225472;
          v107[2] = __36__RBConnectionClient_handleMessage___block_invoke_9;
          v107[3] = &unk_2647C8338;
          v111 = buf;
          id v108 = v5;
          uint64_t v109 = a1;
          id v110 = v38;
          _os_activity_initiate(&dword_226AB3000, "subscribeToProcessDeath", OS_ACTIVITY_FLAG_DEFAULT, v107);
        }
        else if (v7 == sel_void_subscribeToProcessStateChangesWithConfiguration_error_)
        {
          v103[0] = MEMORY[0x263EF8330];
          v103[1] = 3221225472;
          v103[2] = __36__RBConnectionClient_handleMessage___block_invoke_10;
          v103[3] = &unk_2647C8388;
          v106 = buf;
          id v104 = v5;
          uint64_t v105 = a1;
          _os_activity_initiate(&dword_226AB3000, "subscribeToProcessStateChangesWithConfiguration", OS_ACTIVITY_FLAG_DEFAULT, v103);
        }
        else if (v7 == sel_async_unsubscribeFromProcessStateChangesWithIdentifier_)
        {
          v99[0] = MEMORY[0x263EF8330];
          v99[1] = 3221225472;
          v99[2] = __36__RBConnectionClient_handleMessage___block_invoke_11;
          v99[3] = &unk_2647C8388;
          v102 = buf;
          id v100 = v5;
          uint64_t v101 = a1;
          _os_activity_initiate(&dword_226AB3000, "unsubscribeFromProcessStateChangesWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v99);
        }
        else if (v7 == sel_statesForPredicate_descriptor_error_)
        {
          v93[0] = MEMORY[0x263EF8330];
          v93[1] = 3221225472;
          v93[2] = __36__RBConnectionClient_handleMessage___block_invoke_12;
          v93[3] = &unk_2647C83D8;
          v97 = buf;
          id v94 = v5;
          uint64_t v95 = a1;
          v96 = v36;
          v98 = &v187;
          _os_activity_initiate(&dword_226AB3000, "statesForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v93);
        }
        else if (v7 == sel_void_intendToExit_withStatus_)
        {
          v88[0] = MEMORY[0x263EF8330];
          v88[1] = 3221225472;
          v88[2] = __36__RBConnectionClient_handleMessage___block_invoke_13;
          v88[3] = &unk_2647C8400;
          id v89 = v5;
          v92 = buf;
          id v91 = v23;
          uint64_t v90 = a1;
          _os_activity_initiate(&dword_226AB3000, "intendToExit", OS_ACTIVITY_FLAG_DEFAULT, v88);
        }
        else if (v7 == sel_lastExitContextForInstance_error_)
        {
          v82[0] = MEMORY[0x263EF8330];
          v82[1] = 3221225472;
          v82[2] = __36__RBConnectionClient_handleMessage___block_invoke_14;
          v82[3] = &unk_2647C8428;
          id v83 = v5;
          v87 = buf;
          id v86 = v23;
          uint64_t v84 = a1;
          id v85 = v38;
          _os_activity_initiate(&dword_226AB3000, "lastExitContextForInstance", OS_ACTIVITY_FLAG_DEFAULT, v82);
        }
        else if (v7 == sel_limitationsForInstance_error_)
        {
          v76[0] = MEMORY[0x263EF8330];
          v76[1] = 3221225472;
          v76[2] = __36__RBConnectionClient_handleMessage___block_invoke_15;
          v76[3] = &unk_2647C8428;
          id v77 = v5;
          v81 = buf;
          id v80 = v23;
          uint64_t v78 = a1;
          id v79 = v38;
          _os_activity_initiate(&dword_226AB3000, "limitationsForInstance", OS_ACTIVITY_FLAG_DEFAULT, v76);
        }
        else if (v7 == sel_hostProcessForInstance_error_)
        {
          v70[0] = MEMORY[0x263EF8330];
          v70[1] = 3221225472;
          v70[2] = __36__RBConnectionClient_handleMessage___block_invoke_16;
          v70[3] = &unk_2647C8428;
          id v71 = v5;
          v75 = buf;
          id v74 = v23;
          uint64_t v72 = a1;
          id v73 = v38;
          _os_activity_initiate(&dword_226AB3000, "hostProcessForInstance", OS_ACTIVITY_FLAG_DEFAULT, v70);
        }
        else if (v7 == sel_infoPlistResultForInstance_forKeys_error_)
        {
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __36__RBConnectionClient_handleMessage___block_invoke_17;
          v65[3] = &unk_2647C8338;
          v69 = buf;
          id v66 = v5;
          uint64_t v67 = a1;
          id v68 = v38;
          _os_activity_initiate(&dword_226AB3000, "infoPlistResultForInstance", OS_ACTIVITY_FLAG_DEFAULT, v65);
        }
        else if (v7 == sel_captureStateForSubsystem_error_)
        {
          v59[0] = MEMORY[0x263EF8330];
          v59[1] = 3221225472;
          v59[2] = __36__RBConnectionClient_handleMessage___block_invoke_18;
          v59[3] = &unk_2647C83D8;
          v63 = buf;
          id v60 = v5;
          uint64_t v61 = a1;
          v62 = v36;
          v64 = &v187;
          _os_activity_initiate(&dword_226AB3000, "captureStateForSubsystem", OS_ACTIVITY_FLAG_DEFAULT, v59);
        }
        else if (v7 == sel_identifiersForStateCaptureSubsystemsWithError_)
        {
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __36__RBConnectionClient_handleMessage___block_invoke_19;
          v56[3] = &unk_2647C8388;
          v56[4] = a1;
          v58 = buf;
          id v57 = v38;
          _os_activity_initiate(&dword_226AB3000, "identifiersForStateCaptureSubsystemsWithError", OS_ACTIVITY_FLAG_DEFAULT, v56);
        }
        else if (v7 == sel_busyExtensionInstancesFromSet_error_)
        {
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = __36__RBConnectionClient_handleMessage___block_invoke_20;
          v51[3] = &unk_2647C8338;
          v55 = buf;
          id v52 = v5;
          uint64_t v53 = a1;
          id v54 = v38;
          _os_activity_initiate(&dword_226AB3000, "busyExtensionInstancesFromSet", OS_ACTIVITY_FLAG_DEFAULT, v51);
        }
        else if (v7 == sel_preventLaunchPredicatesWithError_)
        {
          v49[0] = MEMORY[0x263EF8330];
          v49[1] = 3221225472;
          v49[2] = __36__RBConnectionClient_handleMessage___block_invoke_21;
          v49[3] = &unk_2647C7B98;
          v49[4] = a1;
          id v50 = v38;
          _os_activity_initiate(&dword_226AB3000, "preventLaunchPredicates", OS_ACTIVITY_FLAG_DEFAULT, v49);
        }
        else if (v7 == sel_saveEndowment_withError_)
        {
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __36__RBConnectionClient_handleMessage___block_invoke_22;
          v44[3] = &unk_2647C8338;
          v48 = buf;
          id v45 = v5;
          uint64_t v46 = a1;
          id v47 = v38;
          _os_activity_initiate(&dword_226AB3000, "saveEndowment", OS_ACTIVITY_FLAG_DEFAULT, v44);
        }
        else if (v7 == sel_isIdentityAnAngel_withError_)
        {
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __36__RBConnectionClient_handleMessage___block_invoke_23;
          v39[3] = &unk_2647C8338;
          v43 = buf;
          id v40 = v5;
          uint64_t v41 = a1;
          id v42 = v38;
          _os_activity_initiate(&dword_226AB3000, "isIdentityAnAngel", OS_ACTIVITY_FLAG_DEFAULT, v39);
        }
        else
        {
          v24 = rbs_connection_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            uint64_t v25 = *(void *)(a1 + 112);
            uint64_t v26 = NSStringFromSelector(v7);
            -[RBConnectionClient handleMessage:](v25, v26, v195, v24);
          }

          v27 = (void *)MEMORY[0x263F087E8];
          uint64_t v193 = *MEMORY[0x263F08338];
          v194 = @"The server has no implementation for this message";
          uint64_t v28 = [NSDictionary dictionaryWithObjects:&v194 forKeys:&v193 count:1];
          uint64_t v29 = [v27 errorWithDomain:*MEMORY[0x263F646B8] code:501 userInfo:v28];
          long long v30 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v29;
        }
        uint64_t v33 = v188[5];
        if (v33) {
          (*(void (**)(uint64_t, void))(v33 + 16))(v33, *(void *)(*(void *)&buf[8] + 40));
        }
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v187, 8);
        char v15 = v36;
      }
      else
      {
        uint64_t v14 = rbs_connection_log();
        char v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          -[RBConnectionClient handleMessage:](a1, v14);
          char v15 = v14;
        }
      }
    }
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = objc_msgSend(v3, "rbs_isPermanentFailure");
    uint64_t v6 = rbs_connection_log();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __36__RBConnectionClient_handleMessage___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 112);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uid_t v13 = v4;
      _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_INFO, "Error handling message from %{public}@: <%{public}@>", (uint8_t *)&v10, 0x16u);
    }
  }
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    [v9 encodeObject:v4 forKey:*MEMORY[0x263F646D0]];
    [*(id *)(a1 + 48) send];
  }
}

- (void)_addStatesForUntrackedProcessesTo:(void *)a3 withPredicate:
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v35 = a1;
  if (a1)
  {
    unint64_t v7 = [v5 count];
    uint64_t v8 = [v6 processIdentifiers];
    unint64_t v9 = [v8 count];

    if (v7 >= v9)
    {
      a1 = v5;
    }
    else
    {
      int v10 = [v6 processIdentifiers];
      uint64_t v11 = (void *)[v10 mutableCopy];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v34 = v5;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v41 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "process", v34);
            uint64_t v18 = [v17 instance];
            id v19 = [v18 identifier];
            [v11 removeObject:v19];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v14);
      }

      if ([v11 count])
      {
        id v20 = (void *)[v12 mutableCopy];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v21 = v11;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "rbs_pid", v34);
              if (RBSPIDExists())
              {
                uint64_t v26 = (void *)v35[5];
                v27 = [v6 processIdentifier];
                uint64_t v28 = [v26 processForIdentifierWithoutStartingTracking:v27];

                if (v28)
                {
                  id v29 = v6;
                  long long v30 = (void *)MEMORY[0x263F645E0];
                  uint64_t v31 = [v28 handle];
                  uint64_t v32 = [v30 untrackedRunningStateforProcess:v31];

                  if (!v32) {
                    -[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:]();
                  }
                  [v20 addObject:v32];

                  id v6 = v29;
                }
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v23);
        }

        a1 = (void *)[v20 copy];
      }
      else
      {
        a1 = v12;
      }

      id v5 = v34;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_11(void *a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v6)
  {
    unint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v14 = *MEMORY[0x263F08608];
    v15[0] = v6;
    unint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    -[RBConnectionClient unsubscribeFromProcessStateChangesWithIdentifier:](a1[5], [v5 unsignedLongLongValue]);
  }
}

- (void)unsubscribeFromProcessStateChangesWithIdentifier:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 184) removeConfigurationWithIdentifier:a2];
    os_unfair_lock_unlock(v4);
  }
}

- (void)didUpdateProcessStates:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = [a2 processStateChangeForIdentity:*(void *)(a1 + 128)];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = [v3 updatedState];
      uint64_t v6 = [v5 inheritances];
      unint64_t v7 = [v6 allInheritances];

      uint64_t v8 = rbs_state_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 112);
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2114;
        uint64_t v13 = v7;
        _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_INFO, "Process: %{public}@ has changes in inheritances: %{public}@", (uint8_t *)&v10, 0x16u);
      }

      [*(id *)(a1 + 152) setInheritances:v7];
    }
  }
}

- (void)inheritanceManager:(id)a3 didChangeInheritances:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = self->_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    int v10 = objc_msgSend(MEMORY[0x263F64658], "messageForMethod:varguments:", sel_async_didChangeInheritances_completion_, v7, 0);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__RBConnectionClient_inheritanceManager_didChangeInheritances_completion___block_invoke;
    v13[3] = &unk_2647C8540;
    uint64_t v14 = v8;
    [v10 sendToConnection:v9 completion:v13];
  }
  else
  {
    uint64_t v11 = rbs_connection_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      process = self->_process;
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = process;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "No connection found to send inheritance for process %{public}@ with changeSet: %{public}@", buf, 0x16u);
    }

    if (v8) {
      v8[2](v8);
    }
  }
}

void __43__RBConnectionClient_handshakeWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKeyedSubscript:v12];
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v12, "unsignedIntegerValue"));
        [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v14];
        [*(id *)(*(void *)(a1 + 32) + 168) addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        id v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, (void)v23);
        uint64_t v22 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v20, "unsignedIntegerValue"));
        [*(id *)(a1 + 56) setObject:v21 forKeyedSubscript:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }
}

- (void)acquireAssertionForDescriptor:(void *)a3 withReply:
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    -[RBConnectionClient _trackTargetProcessForDescriptor:](a1, v5);
    id v7 = objc_msgSend(MEMORY[0x263F64418], "identifierWithClientPid:", objc_msgSend(*(id *)(a1 + 136), "pid"));
    uint64_t v8 = (void *)[v5 copyWithIdentifier:v7];

    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      [*(id *)(a1 + 168) addObject:v7];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      [v6 prepareForHandoff];
      uint64_t v9 = +[RBAssertionAcquisitionContext contextForProcess:*(void *)(a1 + 112) withDescriptor:v8 daemonContext:*(void *)(a1 + 64)];
      uint64_t v10 = *(void **)(a1 + 24);
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __62__RBConnectionClient_acquireAssertionForDescriptor_withReply___block_invoke;
      id v20 = &unk_2647C8270;
      id v21 = v6;
      id v22 = v7;
      uint64_t v23 = a1;
      [v10 acquireAssertionWithContext:v9 completion:&v17];
      uint64_t v11 = objc_msgSend(MEMORY[0x263F64660], "currentContext", v17, v18, v19, v20);

      if (v11)
      {
        uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
        [v16 handleFailureInMethod:sel_acquireAssertionForDescriptor_withReply_ object:a1 file:@"RBConnectionClient.m" lineNumber:947 description:@"xpc message context not handled"];
      }
    }
    else
    {
      __int16 v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F646A8];
      uint64_t v24 = *MEMORY[0x263F08338];
      v25[0] = @"Bad assertion descriptor";
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v9 = [v12 errorWithDomain:v13 code:1 userInfo:v14];

      id v15 = [v6 payload];
      [v15 encodeObject:v9 forKey:*MEMORY[0x263F646D0]];

      [v6 send];
    }
  }
  else
  {
    uint64_t v8 = v5;
  }
}

uint64_t __74__RBConnectionClient_inheritanceManager_didChangeInheritances_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __36__RBConnectionClient_handleMessage___block_invoke_7(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = [v5 context];
    uint64_t v14 = [v13 identity];

    uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    id v15 = [v5 context];
    [v15 setIdentity:v9];

    -[RBConnectionClient executeLaunchRequest:withEuid:withReply:](*(void **)(a1 + 40), v5, *(unsigned int *)(a1 + 80), *(void **)(a1 + 48));
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    __int16 v12 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

id __36__RBConnectionClient_handleMessage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 copyWithAuid:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v3 personaString];
  if (!v4)
  {
    if (!*(void *)(a1 + 32)) {
      goto LABEL_5;
    }
    uint64_t v5 = objc_msgSend(v3, "copyWithPersonaString:");
    uint64_t v4 = v3;
    uint64_t v3 = (void *)v5;
  }

LABEL_5:
  return v3;
}

id __36__RBConnectionClient_handleMessage___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 copyWithAuid:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v3 identity];
  uint64_t v5 = [v4 personaString];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);

    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v4 = v3;
    uint64_t v3 = (void *)[v3 copyWithPersonaString:*(void *)(a1 + 32)];
  }

LABEL_6:
  return v3;
}

- (void)executeLaunchRequest:(uint64_t)a3 withEuid:(void *)a4 withReply:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      id v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:sel_executeLaunchRequest_withEuid_withReply_, a1, @"RBConnectionClient.m", 1003, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];
    }
    uint64_t v10 = [v9 payload];
    [v9 prepareForHandoff];
    uint64_t v11 = (void *)a1[9];
    uint64_t v12 = a1[14];
    uint64_t v13 = a1[20];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__RBConnectionClient_executeLaunchRequest_withEuid_withReply___block_invoke;
    v16[3] = &unk_2647C8478;
    id v17 = v10;
    id v18 = v7;
    uint64_t v19 = a1;
    id v20 = v9;
    id v14 = v10;
    [v11 executeLaunchRequest:v18 euid:a3 requestor:v12 entitlements:v13 completion:v16];
  }
}

+ (id)sharedLaunchWorkloop
{
  self;
  if (sharedLaunchWorkloop_onceToken != -1) {
    dispatch_once(&sharedLaunchWorkloop_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)sharedLaunchWorkloop_workloop;
  return v0;
}

void __36__RBConnectionClient_handleMessage___block_invoke_40(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v14 = *MEMORY[0x263F08608];
    v15[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    -[RBConnectionClient _setReadyWithConnection:](*(void *)(a1 + 40), *(void **)(a1 + 48));
    [v5 setEuid:*(unsigned int *)(a1 + 72)];
    uint64_t v9 = -[RBConnectionClient handshakeWithRequest:](*(void *)(a1 + 40), v5);
    [*(id *)(a1 + 56) encodeObject:v9 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)handshakeWithRequest:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v41 = v3;
  if (a1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = rbs_connection_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 136);
      id v7 = [v4 assertionDescriptors];
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v6;
      __int16 v62 = 2050;
      uint64_t v63 = [v7 count];
      _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Received handshake request from %{public}@ with %{public}lu assertion descriptors", buf, 0x16u);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v8 = [v4 savedEndowments];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          -[RBConnectionClient saveEndowment:withError:](a1, *(void **)(*((void *)&v54 + 1) + 8 * i), 0);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v10);
    }

    long long v40 = [MEMORY[0x263EFF9A0] dictionary];
    long long v39 = [MEMORY[0x263EFF9A0] dictionary];
    long long v43 = [MEMORY[0x263EFF980] array];
    v44 = [MEMORY[0x263EFF980] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [v4 assertionDescriptors];
    uint64_t v13 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v45 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v51 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          id v17 = [v16 identifier];
          if (v17)
          {
            [v43 addObject:v17];
            id v18 = objc_msgSend(MEMORY[0x263F64418], "identifierWithClientPid:", objc_msgSend(*(id *)(a1 + 112), "rbs_pid"));
            uint64_t v19 = (void *)[v16 copyWithIdentifier:v18];
            id v20 = *(void **)(a1 + 40);
            id v21 = [v19 target];
            id v22 = [v21 processIdentifier];
            id v23 = (id)[v20 processForIdentifier:v22];

            [v44 addObject:v16];
          }
          else
          {
            id v18 = rbs_assertion_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v61 = v16;
              _os_log_error_impl(&dword_226AB3000, v18, OS_LOG_TYPE_ERROR, "Handshake request contains assertion %{public}@ without old identifier", buf, 0xCu);
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v14);
    }

    uint64_t v24 = +[RBAssertionBatchContext contextForProcess:*(void *)(a1 + 112) acquisitionCompletionPolicy:0 withDescriptorsToAcquire:v44 identifiersToInvalidate:MEMORY[0x263EFFA68] daemonContext:*(void *)(a1 + 64)];
    long long v25 = *(void **)(a1 + 24);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __43__RBConnectionClient_handshakeWithRequest___block_invoke;
    v46[3] = &unk_2647C8450;
    v46[4] = a1;
    id v26 = v43;
    id v47 = v26;
    id v27 = v40;
    id v48 = v27;
    id v28 = v39;
    id v49 = v28;
    [v25 commitBatchWithContext:v24 completion:v46];
    long long v29 = rbs_connection_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = *(void **)(a1 + 136);
      *(_DWORD *)buf = 138543362;
      uint64_t v61 = v30;
      _os_log_impl(&dword_226AB3000, v29, OS_LOG_TYPE_DEFAULT, "Handshake successful with %{public}@; sending response",
        buf,
        0xCu);
    }

    uint64_t v31 = [v41 assertionDescriptors];
    uint64_t v32 = [v31 count];

    uint64_t v33 = [v27 count];
    uint64_t v34 = [v28 count] + v33;
    if (v34 != v32)
    {
      v35 = rbs_connection_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        [(RBConnectionClient *)v32 handshakeWithRequest:v35];
      }
    }
    id v36 = objc_alloc_init(MEMORY[0x263F644B0]);
    [v36 setHandle:*(void *)(a1 + 120)];
    [v36 setAssertionIdentifiersByOldIdentifier:v27];
    [v36 setAssertionErrorsByOldIdentifier:v28];
    long long v37 = [*(id *)(a1 + 112) managedEndpointByLaunchIdentifier];
    [v36 setManagedEndpointByLaunchIdentifier:v37];
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (void)_setReadyWithConnection:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = rbs_connection_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 112) shortDescription];
      int v22 = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Setting client for %{public}@ as ready", (uint8_t *)&v22, 0xCu);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(unsigned char *)(a1 + 96))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    }
    else
    {
      *(unsigned char *)(a1 + 96) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      id v7 = *(void **)(a1 + 24);
      uint64_t v8 = [*(id *)(a1 + 120) identity];
      uint64_t v9 = [v7 stateForIdentity:v8];
      uint64_t v10 = [v9 inheritances];
      uint64_t v11 = [v10 allInheritances];

      uint64_t v12 = [[RBClientInheritanceManager alloc] initWithInheritances:v11 delegate:a1];
      uint64_t v13 = [RBProcessMonitorObserver alloc];
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 112);
      uint64_t v16 = [[RBProcessMonitorObserverConnection alloc] initWithConnection:v4];
      id v17 = [(RBProcessMonitorObserver *)v13 initWithMonitor:v14 forProcess:v15 connection:v16];

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_storeStrong((id *)(a1 + 8), a2);
      id v18 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v12;
      uint64_t v19 = v12;

      id v20 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v17;
      id v21 = v17;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      -[RBConnectionListener connectionIsReady:](*(void *)(a1 + 80), (void *)a1);
    }
  }
}

void __62__RBConnectionClient_executeLaunchRequest_withEuid_withReply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12) {
    [*(id *)(a1 + 32) encodeObject:v12 forKey:*MEMORY[0x263F646D0]];
  }
  if (v9)
  {
    [v9 fullEncode:*(void *)(a1 + 32) forKey:*MEMORY[0x263F646E0]];
    uint64_t v13 = [*(id *)(a1 + 40) context];
    uint64_t v14 = [v13 attributes];
    uint64_t v15 = v14;
    if (!v10)
    {
      if (![v14 count])
      {
        id v10 = 0;
        goto LABEL_6;
      }
      uint64_t v16 = rbs_connection_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 112);
        uint64_t v19 = [v13 identity];
        int v22 = 138543874;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        uint64_t v25 = v18;
        __int16 v26 = 2114;
        id v27 = v19;
        _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_INFO, "Re-acquiring launch assertion for request %{public}@ from %{public}@ for target: %{public}@", (uint8_t *)&v22, 0x20u);
      }
      id v10 = [*(id *)(*(void *)(a1 + 48) + 72) acquireDroppedLaunchAssertion:*(void *)(a1 + 40) requestor:*(void *)(*(void *)(a1 + 48) + 112)];
      if (!v10) {
        goto LABEL_6;
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
    [*(id *)(*(void *)(a1 + 48) + 168) addObject:v10];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
    [*(id *)(a1 + 32) encodeObject:v10 forKey:*MEMORY[0x263F646C8]];
LABEL_6:
    if ([v11 count]) {
      [*(id *)(a1 + 32) encodeDictionary:v11 forKey:*MEMORY[0x263F646D8]];
    }

LABEL_12:
    goto LABEL_13;
  }
  if (v10)
  {
    uint64_t v13 = rbs_connection_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 112);
      int v22 = 138544130;
      uint64_t v23 = v20;
      __int16 v24 = 2114;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      id v27 = v10;
      __int16 v28 = 2114;
      id v29 = v12;
      _os_log_fault_impl(&dword_226AB3000, v13, OS_LOG_TYPE_FAULT, "launch request %{public}@ from %{public}@ failed but still created an assertion (%{public}@) : error=%{public}@", (uint8_t *)&v22, 0x2Au);
    }
    goto LABEL_12;
  }
LABEL_13:
  [*(id *)(a1 + 56) send];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = rbs_process_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 112);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    [*(id *)(a1 + 176) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 112) setTerminating:1];
    id v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    [*(id *)(a1 + 184) invalidate];
    uint64_t v5 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = 0;

    [*(id *)(a1 + 56) removeItem:a1];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    -[RBConnectionClient cleanupHolds](a1);
  }
}

- (void)cleanupHolds
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = [*(id *)(a1 + 24) assertionsForOriginator:*(void *)(a1 + 136)];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v15;
      *(void *)&long long v4 = 138412290;
      long long v13 = v4;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(a1 + 24);
          id v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v7), "identifier", v13);
          id v10 = [v8 popPluginHoldForAssertion:v9];

          if (v10)
          {
            id v11 = rbs_assertion_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              uint64_t v19 = v10;
              _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_INFO, "Releasing plugin hold token for dealloc %@", buf, 0xCu);
            }

            id v12 = [MEMORY[0x263F5E718] managerForUser:*(unsigned int *)(a1 + 144)];
            [v12 releaseHold:v10];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v5);
    }
  }
}

- (void)didRemoveProcess:(uint64_t)a1 withState:(void *)a2
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    if ([*(id *)(a1 + 176) containsObject:v3])
    {
      [*(id *)(a1 + 176) removeObject:v3];
      id v4 = *(id *)(a1 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      if (v4)
      {
        uint64_t v5 = rbs_process_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 112);
          uint64_t v7 = [v3 lastExitContext];
          *(_DWORD *)buf = 138412802;
          uint64_t v13 = v6;
          __int16 v14 = 2112;
          id v15 = v3;
          __int16 v16 = 2112;
          long long v17 = v7;
          _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Notifying connection %@ that process %@ exited with context %@", buf, 0x20u);
        }
        uint64_t v8 = (void *)MEMORY[0x263F64658];
        id v9 = [v3 identifier];
        id v10 = [v3 lastExitContext];
        id v11 = objc_msgSend(v8, "messageForMethod:varguments:", sel_async_processDidExit_withContext_, v9, v10, 0);

        [v11 sendToConnection:v4];
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      id v4 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 184) didObserveProcessExit:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_4(void *a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F646B8];
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:3 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = a1[5];
    id v16 = 0;
    -[RBConnectionClient invalidateAssertionWithIdentifier:sync:error:](v14, v5, 0, &v16);
    id v15 = v16;
    id v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v15;
  }
}

- (BOOL)invalidateAssertionWithIdentifier:(uint64_t)a3 sync:(void *)a4 error:
{
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (a1)
  {
    id v21 = 0;
    int v8 = -[RBConnectionClient _canInvalidateAssertionWithIdentifier:error:]((id *)a1, v7, &v21);
    id v9 = v21;
    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      [*(id *)(a1 + 168) removeObject:v7];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      if (([*(id *)(a1 + 24) invalidateAssertionFromOriginator:*(void *)(a1 + 136) sync:a3 withIdentifier:v7] & 1) == 0)
      {
        id v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = *MEMORY[0x263F646A8];
        uint64_t v22 = *MEMORY[0x263F08338];
        v23[0] = @"Assertion invalidation request failed";
        uint64_t v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
        uint64_t v13 = [v10 errorWithDomain:v11 code:5 userInfo:v12];

        id v9 = (id)v13;
      }
    }
    uint64_t v14 = rbs_sp_assertion_log();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, (const void *)[v7 hash]);

    id v16 = rbs_sp_assertion_log();
    long long v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_226AB3000, v17, OS_SIGNPOST_INTERVAL_END, v15, "ClientAssertion", (const char *)&unk_226B406F7, v20, 2u);
    }

    if (a4) {
      *a4 = v9;
    }
    BOOL v18 = v9 == 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (uint64_t)_canInvalidateAssertionWithIdentifier:(void *)a3 error:
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  if (v5)
  {
    int v7 = [v5 clientPid];
    int v8 = (uint64_t *)(a1 + 17);
    int v9 = [a1[17] pid];
    char v10 = [a1 hasEntitlement:@"com.apple.runningboard.invalidateanyassertion"];
    uint64_t v11 = 0;
    uint64_t v12 = 1;
    if (v7 == v9 || (v10 & 1) != 0) {
      goto LABEL_10;
    }
    uint64_t v13 = rbs_assertion_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBConnectionClient _canInvalidateAssertionWithIdentifier:error:](v8, v6, v13);
    }

    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F646A8];
    uint64_t v23 = *MEMORY[0x263F08338];
    v24[0] = @"Specified assertion identifier is not owned by the client";
    id v16 = NSDictionary;
    long long v17 = (__CFString **)v24;
    BOOL v18 = &v23;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F646A8];
    uint64_t v21 = *MEMORY[0x263F08338];
    uint64_t v22 = @"No assertion identifier specified";
    id v16 = NSDictionary;
    long long v17 = &v22;
    BOOL v18 = &v21;
  }
  uint64_t v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  uint64_t v11 = [v14 errorWithDomain:v15 code:1 userInfo:v19];

  uint64_t v12 = 0;
LABEL_10:
  if (a3) {
    *a3 = v11;
  }

LABEL_13:
  return v12;
}

- (BOOL)hasEntitlement:(id)a3
{
  return [(RBEntitlementPossessing *)self->_entitlements hasEntitlement:a3];
}

void __36__RBConnectionClient_handleMessage___block_invoke_3_50(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  int v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    char v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v7;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    id v16 = *(void **)(a1 + 40);
    id v17 = 0;
    uint64_t v12 = -[RBConnectionClient lookupProcessName:error:](v16, v5, &v17);
    objc_storeStrong(v8, v17);
    [*(id *)(a1 + 48) encodeObject:v12 forKey:*MEMORY[0x263F646E0]];
  }
}

- (__CFString)lookupProcessName:(void *)a3 error:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v23 = 0;
    memset(v22, 0, sizeof(v22));
    memset(buffer, 0, sizeof(buffer));
    int v7 = [v5 intValue];
    if ([a1 hasEntitlementDomain:1]) {
      goto LABEL_4;
    }
    int v8 = [MEMORY[0x263F645D8] predicateMatchingIdentifier:v6];
    uint64_t v20 = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    int v10 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v9);

    if (v10)
    {
LABEL_4:
      if (proc_pidinfo(v7, 3, 0, buffer, 136) == 136)
      {
        uint64_t v11 = (__CFString *)[[NSString alloc] initWithUTF8String:v22];
        uint64_t v12 = 0;
        if (!a3) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v13 = rbs_assertion_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient lookupProcessName:error:](v7, v13);
        }

        uint64_t v14 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = *MEMORY[0x263F646A8];
        uint64_t v18 = *MEMORY[0x263F08338];
        uint64_t v19 = @"Could not get proc_pidinfo for pid";
        id v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        uint64_t v12 = [v14 errorWithDomain:v15 code:5 userInfo:v16];

        uint64_t v11 = @"<unknown>";
        if (!a3) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v11 = 0;
      if (!a3) {
        goto LABEL_11;
      }
    }
    *a3 = v12;
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

void __36__RBConnectionClient_handleMessage___block_invoke_10(void *a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    int v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F646B8];
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v7;
    int v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:3 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = a1[5];
    id v16 = 0;
    -[RBConnectionClient subscribeToProcessStateChangesWithConfiguration:error:](v14, v5, &v16);
    id v15 = v16;
    int v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v15;
  }
}

- (id)initWithContext:(void *)a3 listener:(void *)a4 process:(void *)a5 connection:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  if (v12)
  {
    if (v10) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:sel_initWithContext_listener_process_connection_, a1, @"RBConnectionClient.m", 155, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
  }
  uint64_t v46 = [MEMORY[0x263F08690] currentHandler];
  [v46 handleFailureInMethod:sel_initWithContext_listener_process_connection_, a1, @"RBConnectionClient.m", 156, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_4:
  v47.receiver = a1;
  v47.super_class = (Class)RBConnectionClient;
  uint64_t v14 = (id *)objc_msgSendSuper2(&v47, sel_init);
  a1 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a2);
    uint64_t v15 = [v10 assertionManager];
    id v16 = a1[3];
    a1[3] = (id)v15;

    uint64_t v17 = [v10 entitlementManager];
    id v18 = a1[4];
    a1[4] = (id)v17;

    uint64_t v19 = [v10 processManager];
    id v20 = a1[5];
    a1[5] = (id)v19;

    uint64_t v21 = [v10 processMonitor];
    id v22 = a1[6];
    a1[6] = (id)v21;

    uint64_t v23 = [v10 stateCaptureManager];
    id v24 = a1[7];
    a1[7] = (id)v23;

    uint64_t v25 = [v10 requestManager];
    id v26 = a1[9];
    a1[9] = (id)v25;

    objc_storeStrong(a1 + 10, a3);
    uint64_t v27 = [v10 process];
    id v28 = a1[11];
    a1[11] = (id)v27;

    uint64_t v29 = [MEMORY[0x263EFF9C0] set];
    id v30 = a1[21];
    a1[21] = (id)v29;

    uint64_t v31 = [MEMORY[0x263EFF9C0] set];
    id v32 = a1[22];
    a1[22] = (id)v31;

    a1[2] = 0;
    id v33 = a1[24];
    a1[24] = 0;

    *((unsigned char *)a1 + 96) = 0;
    objc_storeStrong(a1 + 14, a4);
    uint64_t v34 = [v12 handle];
    id v35 = a1[15];
    a1[15] = (id)v34;

    uint64_t v36 = [v12 identity];
    id v37 = a1[16];
    a1[16] = (id)v36;

    uint64_t v38 = [v12 identifier];
    id v39 = a1[17];
    a1[17] = (id)v38;

    *((_DWORD *)a1 + 36) = 0;
    uint64_t v40 = [v12 shortDescription];
    id v41 = a1[13];
    a1[13] = (id)v40;

    uint64_t v42 = [a1[4] entitlementsForProcess:a1[14]];
    id v43 = a1[20];
    a1[20] = (id)v42;

    objc_storeStrong(a1 + 1, a5);
    [a1[7] addItem:a1];
  }
LABEL_6:

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_15(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F646B8];
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v8;
    id v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = 0;
    id v13 = -[RBConnectionClient limitationsForInstance:error:](v17, v6, &v18);
    objc_storeStrong(v9, v18);
    [*(id *)(a1 + 48) encodeObject:v13 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)limitationsForInstance:(void *)a3 error:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a1) {
    goto LABEL_13;
  }
  if (([a1 hasEntitlementDomain:1] & 1) == 0)
  {
    int v6 = [a1[17] pid];
    if (v6 != objc_msgSend(v5, "rbs_pid"))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v7 = rbs_connection_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient limitationsForInstance:error:]();
      }
      goto LABEL_9;
    }
  }
  uint64_t v7 = [a1[5] processForInstance:v5];
  if (!v7)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F646A8];
    uint64_t v13 = *MEMORY[0x263F08338];
    v14[0] = @"No process found";
    id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v8 = [v9 errorWithDomain:v10 code:3 userInfo:v11];

LABEL_9:
    a1 = 0;
    goto LABEL_10;
  }
  a1 = [a1[3] limitationsForInstance:v5];
  uint64_t v8 = 0;
LABEL_10:

  if (a3) {
    *a3 = v8;
  }

LABEL_13:
  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_16(void *a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[8] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  int v6 = (*(void (**)(void))(a1[7] + 16))();

  uint64_t v7 = *(void *)(a1[8] + 8);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F646B8];
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v8;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(a1[8] + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    uint64_t v17 = (id *)a1[5];
    id v18 = 0;
    uint64_t v13 = -[RBConnectionClient hostProcessForInstance:error:](v17, v6, &v18);
    objc_storeStrong(v9, v18);
    [v13 fullEncode:a1[6] forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)hostProcessForInstance:(void *)a3 error:
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    if ([a1 hasEntitlementDomain:1]) {
      goto LABEL_4;
    }
    int v6 = (void *)MEMORY[0x263F645D8];
    uint64_t v7 = [v5 identifier];
    uint64_t v8 = [v6 predicateMatchingIdentifier:v7];
    v21[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    int v10 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v9);

    if (v10)
    {
LABEL_4:
      id v11 = [a1[5] processForInstance:v5];
      uint64_t v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 hostProcess];
        uint64_t v14 = v13;
        if (v13)
        {
          a1 = [v13 handle];
        }
        else
        {
          a1 = 0;
        }
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263F646A8];
        uint64_t v19 = *MEMORY[0x263F08338];
        uint64_t v20 = @"No process found";
        uint64_t v14 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        uint64_t v17 = [v15 errorWithDomain:v16 code:3 userInfo:v14];
        a1 = 0;
      }
    }
    else
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v12 = rbs_connection_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient hostProcessForInstance:error:]();
      }
      a1 = 0;
    }

    if (a3) {
      *a3 = v17;
    }
  }
  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_17(uint64_t a1)
{
  v26[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  int v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v23 = 0;
  int v10 = [v6 decodeArgumentCollection:v7 withClass:v8 atIndex:1 allowNil:0 error:&v23];
  objc_storeStrong(v9, v23);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void *)(v11 + 40);
  uint64_t v13 = (id *)(v11 + 40);
  uint64_t v12 = v14;
  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F646B8];
    uint64_t v25 = *MEMORY[0x263F08608];
    v26[0] = v12;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v18 = [v15 errorWithDomain:v16 code:3 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else
  {
    uint64_t v21 = *(id **)(a1 + 40);
    id v22 = 0;
    uint64_t v17 = -[RBConnectionClient infoPlistResultForInstance:forKeys:error:](v21, v5, v10, &v22);
    objc_storeStrong(v13, v22);
    [*(id *)(a1 + 48) encodeObject:v17 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)infoPlistResultForInstance:(void *)a3 forKeys:(void *)a4 error:
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v19 = 0;
    goto LABEL_23;
  }
  if (([a1 hasEntitlementDomain:1] & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F645D8];
    int v10 = [v7 identifier];
    uint64_t v11 = [v9 predicateMatchingIdentifier:v10];
    v34[0] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
    int v13 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v12);

    if (!v13)
    {
      id v22 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v15 = rbs_connection_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient infoPlistResultForInstance:forKeys:error:]();
      }
      goto LABEL_13;
    }
  }
  if (!v7 || ![v8 count])
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F646A8];
    uint64_t v28 = *MEMORY[0x263F08338];
    uint64_t v29 = @"Invalid instance or keys";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v22 = [v20 errorWithDomain:v21 code:1 userInfo:v15];
LABEL_13:
    id v19 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = [a1[5] processForInstance:v7];
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 handle];
    uint64_t v17 = [v16 bundle];

    if (v17)
    {
      uint64_t v18 = [v17 bundleInfoValuesForKeys:v8];
      if ([v18 count])
      {
        id v19 = objc_alloc_init(MEMORY[0x263F645A0]);
        [v19 setValue:v18];
      }
      else
      {
        id v19 = 0;
      }
      id v22 = 0;
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F646A8];
      uint64_t v32 = *MEMORY[0x263F08338];
      id v33 = @"No bundle found";
      uint64_t v18 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v22 = [v25 errorWithDomain:v26 code:3 userInfo:v18];
      id v19 = 0;
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F646A8];
    uint64_t v30 = *MEMORY[0x263F08338];
    uint64_t v31 = @"No process found";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v22 = [v23 errorWithDomain:v24 code:3 userInfo:v17];
    id v19 = 0;
  }

LABEL_20:
  if (a4) {
    *a4 = v22;
  }

LABEL_23:
  return v19;
}

void __36__RBConnectionClient_handleMessage___block_invoke_9(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  id v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    int v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v7;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = 0;
    uint64_t v12 = -[RBConnectionClient subscribeToProcessDeath:error:](v16, v5, &v17);
    objc_storeStrong(v8, v17);
    [*(id *)(a1 + 48) encodeObject:v12 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)subscribeToProcessDeath:(void *)a3 error:
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 40) processForIdentifier:v5];
    if ([(id)a1 hasEntitlementDomain:1]) {
      goto LABEL_4;
    }
    uint64_t v7 = [MEMORY[0x263F645D8] predicateMatchingIdentifier:v5];
    v18[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    int v9 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v8);

    if (v9)
    {
LABEL_4:
      if (!v5)
      {
        uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F646A8] code:1 userInfo:0];
        goto LABEL_13;
      }
      if (v6)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        int v10 = [*(id *)(a1 + 40) isActiveProcess:v6];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        if (!v10)
        {
          a1 = [v6 lastExitContext];
          uint64_t v11 = 0;
          if (!a3) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
        [*(id *)(a1 + 176) addObject:v6];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
        uint64_t v11 = 0;
LABEL_13:
        a1 = 0;
        if (!a3)
        {
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        *a3 = v11;
        goto LABEL_15;
      }
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F646A8];
      uint64_t v16 = *MEMORY[0x263F08338];
      id v17 = @"No such process";
      uint64_t v12 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v11 = [v13 errorWithDomain:v14 code:3 userInfo:v12];
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
      uint64_t v12 = rbs_connection_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient subscribeToProcessDeath:error:]();
      }
    }

    goto LABEL_13;
  }
LABEL_16:

  return (id)a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationBoostAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_stateObserver, 0);
  objc_storeStrong((id *)&self->_deathMonitors, 0);
  objc_storeStrong((id *)&self->_assertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_inheritanceManager, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_containingProcess, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)sharedTerminationWorkloop
{
  self;
  if (sharedTerminationWorkloop_onceToken != -1) {
    dispatch_once(&sharedTerminationWorkloop_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)sharedTerminationWorkloop_workloop;
  return v0;
}

void __47__RBConnectionClient_sharedTerminationWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("RBConnectionClientTermination");
  v1 = (void *)sharedTerminationWorkloop_workloop;
  sharedTerminationWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  v2 = sharedTerminationWorkloop_workloop;
  dispatch_activate(v2);
}

void __42__RBConnectionClient_sharedLaunchWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("RBConnectionClientLaunch");
  v1 = (void *)sharedLaunchWorkloop_workloop;
  sharedLaunchWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  v2 = sharedLaunchWorkloop_workloop;
  dispatch_activate(v2);
}

- (RBConnectionClient)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBConnectionClient.m" lineNumber:150 description:@"-init is not allowed on RBConnectionClient"];

  return 0;
}

void __36__RBConnectionClient_handleMessage___block_invoke_2_57(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  id v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    int v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v7;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = *(id **)(a1 + 40);
    id v17 = 0;
    uint64_t v12 = -[RBConnectionClient lookupPortForIdentifier:error:](v16, v5, &v17);
    objc_storeStrong(v8, v17);
    [*(id *)(a1 + 48) encodeObject:v12 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)lookupPortForIdentifier:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    if (([a1 hasEntitlementDomain:1] & 1) != 0
      || (int v6 = objc_msgSend(a1[15], "rbs_pid"), v6 == objc_msgSend(v5, "rbs_pid")))
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F64508], "taskNameForPID:", objc_msgSend(v5, "rbs_pid"));
      goto LABEL_11;
    }
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 0);
    uint64_t v9 = rbs_connection_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBConnectionClient lookupPortForIdentifier:error:]();
    }

    if (a3) {
      *a3 = v8;
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

void __36__RBConnectionClient_handleMessage___block_invoke_5(void *a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F646B8];
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v7;
    int v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:3 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = a1[5];
    id v16 = 0;
    -[RBConnectionClient invalidateAssertionWithIdentifier:sync:error:](v14, v5, 1, &v16);
    id v15 = v16;
    int v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v15;
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_6(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = *(id **)(a1 + 40);
    uint64_t v14 = [v5 BOOLValue];
    id v15 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v16 = 0;
    uint64_t v9 = -[RBConnectionClient assertionDescriptorsWithFlattenedAttributes:error:](v13, v14, &v16);
    objc_storeStrong(v15, v16);
    [*(id *)(a1 + 48) encodeObject:v9 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)assertionDescriptorsWithFlattenedAttributes:(void *)a3 error:
{
  if (a1)
  {
    if ([a1 hasEntitlement:@"com.apple.runningboard.listallassertions"])
    {
      uint64_t v6 = [a1[3] assertionDescriptorsWithFlattenedAttributes:a2];
      uint64_t v7 = 0;
      if (!a3) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.listallassertions", 1);
      uint64_t v6 = 0;
      if (!a3)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    *a3 = v7;
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_8:
  return v6;
}

void __36__RBConnectionClient_handleMessage___block_invoke_8(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v15 = *MEMORY[0x263F08608];
    v16[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    -[RBConnectionClient executeTerminateRequest:withReply:](*(void *)(a1 + 40), v5, *(void **)(a1 + 48));
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
}

- (void)executeTerminateRequest:(void *)a3 withReply:
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    id v37 = v6;
    uint64_t v8 = rbs_connection_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 104);
      char v10 = [v5 targetsAllManagedProcesses];
      if (v10)
      {
        uint64_t v11 = @"All Managed Processes";
      }
      else
      {
        uint64_t v11 = [v5 predicate];
      }
      uint64_t v12 = [v5 context];
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = v9;
      __int16 v52 = 2114;
      long long v53 = v11;
      __int16 v54 = 2114;
      long long v55 = v12;
      _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "Received termination request from %{public}@ on %{public}@ with context %{public}@", buf, 0x20u);
      if ((v10 & 1) == 0) {
    }
      }
    uint64_t v13 = [v5 predicate];
    uint64_t v14 = [v13 processIdentifiers];

    uint64_t v38 = v5;
    id v35 = v14;
    if (v14)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v14;
      uint64_t v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16, v14);
      if (v15)
      {
        uint64_t v16 = v15;
        int v17 = 0;
        uint64_t v18 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            id v21 = (id)[*(id *)(a1 + 40) processForIdentifier:v20];
            id v22 = [MEMORY[0x263F64570] handleForIdentifier:v20 error:0];
            v17 |= [v22 isXPCService] ^ 1;
            if (v17)
            {
              BOOL v23 = 0;
            }
            else
            {
              uint64_t v24 = [*(id *)(a1 + 40) processForIdentifierWithoutStartingTracking:v20];
              int v25 = objc_msgSend(*(id *)(a1 + 112), "rbs_pid");
              uint64_t v26 = [v24 hostProcess];
              BOOL v23 = v25 == objc_msgSend(v26, "rbs_pid");
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v16);
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
    uint64_t v7 = v37;
    uint64_t v27 = objc_msgSend(v37, "payload", v35);
    if ([v38 targetsAllManagedProcesses])
    {
      if (([(id)a1 hasEntitlement:@"com.apple.runningboard.terminatemanagedprocesses"] & 1) == 0)
      {
        uint64_t v28 = rbs_connection_log();
        id v5 = v38;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient executeTerminateRequest:withReply:](v28);
        }

        [v27 encodeBool:0 forKey:*MEMORY[0x263F646E0]];
        uint64_t v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = @"com.apple.runningboard.terminatemanagedprocesses";
LABEL_34:
        uint64_t v34 = objc_msgSend(v29, "rbs_errorClientNotEntitled:permanent:", v30, 1);
        [v27 encodeObject:v34 forKey:*MEMORY[0x263F646D0]];

        [v37 send];
        goto LABEL_35;
      }
    }
    else if ((([(id)a1 hasEntitlementDomain:4] | v23) & 1) == 0)
    {
      id v33 = rbs_connection_log();
      id v5 = v38;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient executeTerminateRequest:withReply:](v33);
      }

      [v27 encodeBool:0 forKey:*MEMORY[0x263F646E0]];
      uint64_t v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = @"com.apple.runningboard.terminateprocess";
      goto LABEL_34;
    }
    [v37 prepareForHandoff];
    uint64_t v31 = [MEMORY[0x263F64660] currentContext];
    uint64_t v32 = +[RBConnectionClient sharedTerminationWorkloop]();
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke;
    v40[3] = &unk_2647C8130;
    id v5 = v38;
    id v41 = v38;
    uint64_t v42 = a1;
    id v43 = v27;
    id v44 = v37;
    [v31 handoffToQueue:v32 block:v40];

LABEL_35:
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_13(void *a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  id v6 = (*(void (**)(void))(a1[6] + 16))();

  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = (id *)(*(void *)(a1[7] + 8) + 40);
  id v22 = 0;
  char v10 = [v7 decodeArgumentWithClass:v8 atIndex:1 allowNil:0 error:&v22];
  objc_storeStrong(v9, v22);
  uint64_t v11 = *(void *)(a1[7] + 8);
  uint64_t v12 = *(void *)(v11 + 40);
  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F646B8];
    uint64_t v24 = *MEMORY[0x263F08608];
    v25[0] = v12;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v16 = [v13 errorWithDomain:v14 code:3 userInfo:v15];
    uint64_t v17 = *(void *)(a1[7] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  else
  {
    uint64_t v19 = a1[5];
    id v21 = 0;
    -[RBConnectionClient intendToExit:withStatus:error:](v19, (uint64_t)v6, v10, &v21);
    id v20 = v21;
    uint64_t v15 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v20;
  }
}

- (BOOL)intendToExit:(void *)a3 withStatus:(void *)a4 error:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!a1)
  {
    BOOL v11 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [*(id *)(a1 + 40) processForInstance:a2];
  if (v8)
  {
    uint64_t v9 = rbs_process_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_DEFAULT, "Setting intended exit status on %{public}@ to %{public}@", buf, 0x16u);
    }

    [v8 setIntendedExitStatus:v7];
    char v10 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F646A8];
    uint64_t v16 = *MEMORY[0x263F08338];
    uint64_t v17 = @"No process found";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    char v10 = [v13 errorWithDomain:v14 code:3 userInfo:v15];

    if (!a4) {
      goto LABEL_7;
    }
  }
  *a4 = v10;
LABEL_7:
  BOOL v11 = v10 == 0;

LABEL_8:
  return v11;
}

void __36__RBConnectionClient_handleMessage___block_invoke_14(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  id v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    BOOL v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F646B8];
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v8;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = 0;
    uint64_t v13 = -[RBConnectionClient lastExitContextForInstance:error:](v17, (uint64_t)v6, &v18);
    objc_storeStrong(v9, v18);
    [*(id *)(a1 + 48) encodeObject:v13 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)lastExitContextForInstance:(void *)a3 error:
{
  id v3 = a1;
  v12[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v5 = [a1[5] processForInstance:a2];
    if ([v3 hasEntitlementDomain:1])
    {
      if (v5)
      {
        id v3 = [v5 lastExitContext];
        id v6 = 0;
        if (!a3) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F646A8];
      uint64_t v11 = *MEMORY[0x263F08338];
      v12[0] = @"No process found";
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v6 = [v8 errorWithDomain:v9 code:3 userInfo:v7];
    }
    else
    {
      id v6 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 1);
      uint64_t v7 = rbs_connection_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient lastExitContextForInstance:error:]();
      }
    }

    id v3 = 0;
    if (!a3)
    {
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    *a3 = v6;
    goto LABEL_11;
  }
LABEL_12:
  return v3;
}

void __36__RBConnectionClient_handleMessage___block_invoke_18(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:1 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F646B8];
    uint64_t v15 = *MEMORY[0x263F08608];
    v16[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    -[RBConnectionClient captureStateForSubsystem:withReply:](*(void **)(a1 + 40), v5, *(void **)(a1 + 48));
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
}

- (void)captureStateForSubsystem:(void *)a3 withReply:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([a1 hasEntitlement:@"com.apple.runningboard.statecapture"])
    {
      [v6 prepareForHandoff];
      uint64_t v7 = [MEMORY[0x263F64660] currentContext];
      uint64_t v8 = rbs_connection_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v7;
        _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "In captureState with xpcContext %@", buf, 0xCu);
      }

      uint64_t v9 = dispatch_get_global_queue(17, 0);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      void v12[2] = __57__RBConnectionClient_captureStateForSubsystem_withReply___block_invoke;
      v12[3] = &unk_2647C7A08;
      v12[4] = a1;
      id v13 = v5;
      id v14 = v6;
      [v7 handoffToQueue:v9 block:v12];
    }
    else
    {
      uint64_t v10 = rbs_connection_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Error capturingStateForSubsystem, unentitled client", buf, 2u);
      }

      uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.statecapture", 1);
      uint64_t v11 = [v6 payload];
      [v11 encodeObject:v7 forKey:*MEMORY[0x263F646D0]];

      [v6 send];
    }
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_19(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  id v4 = -[RBConnectionClient identifiersForStateCaptureSubsystemsWithError:](v2, &obj);
  objc_storeStrong(v3, obj);
  [*(id *)(a1 + 40) encodeObject:v4 forKey:*MEMORY[0x263F646E0]];
}

- (id)identifiersForStateCaptureSubsystemsWithError:(id *)a1
{
  if (a1)
  {
    if ([a1 hasEntitlement:@"com.apple.runningboard.statecapture"])
    {
      id v4 = [a1[7] identifiers];
      id v5 = 0;
      if (!a2) {
        goto LABEL_7;
      }
    }
    else
    {
      id v5 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.statecapture", 1);
      id v4 = 0;
      if (!a2)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    *a2 = v5;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_8:
  return v4;
}

void __36__RBConnectionClient_handleMessage___block_invoke_20(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v6 = [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v5, obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F646B8];
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v8;
    id v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = 0;
    id v13 = -[RBConnectionClient busyExtensionInstancesFromSet:error:](v17, v6, &v18);
    objc_storeStrong(v9, v18);
    [*(id *)(a1 + 48) encodeObject:v13 forKey:*MEMORY[0x263F646E0]];
  }
}

- (id)busyExtensionInstancesFromSet:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    if (([a1[14] isPlatformBinary] & 1) != 0
      || [a1 hasEntitlement:@"com.apple.runningboard.statecapture"])
    {
      a1 = [a1[5] busyExtensionInstancesFromSet:v5];
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.statecapture", 1);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_21(uint64_t a1)
{
  -[RBConnectionClient preventLaunchPredicates](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) encodeObject:v2 forKey:*MEMORY[0x263F646E0]];
}

- (id)preventLaunchPredicates
{
  v1 = a1;
  if (a1)
  {
    if (([a1 hasEntitlementDomain:1] & 1) == 0)
    {
      id v2 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 1);
      uint64_t v3 = rbs_connection_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient preventLaunchPredicates]();
      }
    }
    uint64_t v4 = [v1[3] systemState];
    v1 = [v4 preventLaunchPredicates];
  }
  return v1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_22(void *a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v21 = *MEMORY[0x263F08608];
    v22[0] = v7;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = a1[5];
    id v19 = 0;
    uint64_t v17 = -[RBConnectionClient saveEndowment:withError:](v16, v5, &v19);
    objc_storeStrong(v8, v19);
    id v18 = (void *)a1[6];
    uint64_t v12 = [NSNumber numberWithBool:v17];
    [v18 encodeObject:v12 forKey:*MEMORY[0x263F646E0]];
  }
}

- (uint64_t)saveEndowment:(void *)a3 withError:
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 24) addSavedEndowment:v5 forProcess:*(void *)(a1 + 112)])
    {
      a1 = 1;
    }
    else
    {
      if (a3)
      {
        uint64_t v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v7 = *MEMORY[0x263F646A8];
        uint64_t v11 = *MEMORY[0x263F08338];
        v12[0] = @"Saved endowment already set for key";
        uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
        *a3 = [v6 errorWithDomain:v7 code:2 userInfo:v8];
      }
      uint64_t v9 = rbs_connection_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient saveEndowment:withError:](a1, v5, v9);
      }

      a1 = 0;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_23(void *a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  id v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F646B8];
    uint64_t v21 = *MEMORY[0x263F08608];
    v22[0] = v7;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = (void *)a1[5];
    id v19 = 0;
    uint64_t v17 = -[RBConnectionClient isIdentityAnAngel:withError:](v16, v5, &v19);
    objc_storeStrong(v8, v19);
    id v18 = (void *)a1[6];
    uint64_t v12 = [NSNumber numberWithBool:v17];
    [v18 encodeObject:v12 forKey:*MEMORY[0x263F646E0]];
  }
}

- (void)isIdentityAnAngel:(void *)a3 withError:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    if ([a1 hasEntitlementDomain:1])
    {
      uint64_t v6 = [v5 consistentLaunchdJobLabel];
      if (v6)
      {
        uint64_t v7 = +[RBLaunchdProperties propertiesForLabel:v6 error:a3];
        a1 = (void *)[v7 isAngel];

LABEL_12:
        goto LABEL_13;
      }
      if (a3)
      {
        uint64_t v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v10 = *MEMORY[0x263F646A8];
        uint64_t v13 = *MEMORY[0x263F08338];
        v14[0] = @"Information request not supported for this identity";
        uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
        *a3 = [v9 errorWithDomain:v10 code:1 userInfo:v11];
      }
      uint64_t v8 = rbs_connection_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient isIdentityAnAngel:withError:]();
      }
    }
    else
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "rbs_errorClientNotEntitled:permanent:", @"com.apple.runningboard.process-state", 1);
      uint64_t v8 = rbs_connection_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient preventLaunchPredicates]();
      }
    }

    a1 = 0;
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (uint64_t)_predicatesMatchOnlyAllowedProcess:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v42 = 0;
    goto LABEL_50;
  }
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [*(id *)(a1 + 112) hostProcess];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    do
    {
      uint64_t v7 = [v6 handle];
      [v4 addObject:v7];

      uint64_t v8 = [v6 hostProcess];

      uint64_t v6 = (void *)v8;
    }
    while (v8);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (!v9)
  {
    uint64_t v42 = 1;
    goto LABEL_49;
  }
  uint64_t v10 = v9;
  id v46 = v3;
  uint64_t v11 = *(void *)v56;
  uint64_t v47 = *(void *)v56;
  uint64_t v48 = a1;
LABEL_7:
  uint64_t v12 = 0;
  uint64_t v49 = v10;
  while (1)
  {
    if (*(void *)v56 != v11) {
      objc_enumerationMutation(obj);
    }
    uint64_t v13 = *(NSObject **)(*((void *)&v55 + 1) + 8 * v12);
    uint64_t v14 = [v13 processIdentifier];
    int v15 = objc_msgSend(v14, "rbs_pid");
    int v16 = objc_msgSend(*(id *)(a1 + 112), "rbs_pid");

    if (v15 == v16)
    {
      uint64_t v17 = rbs_general_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = *(NSObject **)(a1 + 112);
        *(_DWORD *)buf = 138543618;
        uint64_t v61 = v13;
        __int16 v62 = 2114;
        uint64_t v63 = v18;
        _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching self %{public}@ for process %{public}@", buf, 0x16u);
      }
      goto LABEL_31;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v19 = v4;
    id v20 = v4;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v26 = [v13 processIdentifier];
          int v27 = objc_msgSend(v26, "rbs_pid");
          LODWORD(v25) = [v25 pid];

          if (v27 == v25)
          {

            uint64_t v17 = rbs_general_log();
            uint64_t v10 = v49;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              a1 = v48;
              uint64_t v36 = *(NSObject **)(v48 + 112);
              *(_DWORD *)buf = 138543618;
              uint64_t v61 = v13;
              __int16 v62 = 2114;
              uint64_t v63 = v36;
              _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching hosting %{public}@ for process %{public}@", buf, 0x16u);
              uint64_t v4 = v19;
            }
            else
            {
              uint64_t v4 = v19;
              a1 = v48;
            }
            goto LABEL_30;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    a1 = v48;
    uint64_t v28 = *(void **)(v48 + 40);
    uint64_t v29 = [v13 processIdentifier];
    uint64_t v17 = [v28 processForIdentifierWithoutStartingTracking:v29];

    uint64_t v30 = rbs_general_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v13;
      __int16 v62 = 2114;
      uint64_t v63 = v17;
      _os_log_impl(&dword_226AB3000, v30, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess for predicate %{public}@ resolved target to %{public}@", buf, 0x16u);
    }

    int v31 = objc_msgSend(*(id *)(v48 + 112), "rbs_pid");
    uint64_t v32 = [v17 hostProcess];
    int v33 = objc_msgSend(v32, "rbs_pid");

    if (v31 == v33)
    {
      uint64_t v34 = rbs_general_log();
      uint64_t v4 = v19;
      uint64_t v10 = v49;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = *(NSObject **)(v48 + 112);
        *(_DWORD *)buf = 138543618;
        uint64_t v61 = v13;
        __int16 v62 = 2114;
        uint64_t v63 = v35;
        _os_log_impl(&dword_226AB3000, v34, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching hosted %{public}@ for process %{public}@", buf, 0x16u);
      }

LABEL_30:
      uint64_t v11 = v47;
      goto LABEL_31;
    }
    id v37 = [*(id *)(v48 + 32) entitlementsForProcess:v17];
    uint64_t v4 = v19;
    if (![v37 hasEntitlement:@"com.apple.runningboard.trustedtarget"]) {
      break;
    }
    uint64_t v38 = rbs_general_log();
    uint64_t v11 = v47;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = *(NSObject **)(v48 + 112);
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v13;
      __int16 v62 = 2114;
      uint64_t v63 = v39;
      _os_log_impl(&dword_226AB3000, v38, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching trusted target %{public}@ for process %{public}@", buf, 0x16u);
    }
LABEL_41:

    uint64_t v10 = v49;
LABEL_31:

    if (++v12 == v10)
    {
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      uint64_t v10 = v41;
      if (!v41)
      {
        uint64_t v42 = 1;
        goto LABEL_48;
      }
      goto LABEL_7;
    }
  }
  uint64_t v38 = [v13 bundleIdentifier];
  uint64_t v11 = v47;
  if (([v38 isEqualToString:@"com.apple.dt.XcodePreviews"] & 1) != 0
    || [v38 isEqualToString:@"com.apple.PreviewShell"])
  {
    uint64_t v40 = rbs_general_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v38;
      __int16 v62 = 2114;
      uint64_t v63 = v13;
      _os_log_impl(&dword_226AB3000, v40, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching %{public}@ (%{public}@)", buf, 0x16u);
    }

    goto LABEL_41;
  }
  id v43 = rbs_general_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    id v44 = *(NSObject **)(v48 + 112);
    *(_DWORD *)buf = 138543618;
    uint64_t v61 = v13;
    __int16 v62 = 2114;
    uint64_t v63 = v44;
    _os_log_impl(&dword_226AB3000, v43, OS_LOG_TYPE_DEFAULT, "_predicatesMatchOnlyAllowedProcess denying predicate %{public}@ for process %{public}@", buf, 0x16u);
  }

  uint64_t v42 = 0;
LABEL_48:
  id v3 = v46;
LABEL_49:

LABEL_50:
  return v42;
}

- (void)_requestPluginHoldForProxy:(int)a3 terminate:(void *)a4 completion:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke;
    uint64_t v23 = &unk_2647C84A0;
    id v9 = v7;
    id v24 = v9;
    id v10 = v8;
    id v25 = v10;
    uint64_t v11 = (void *)MEMORY[0x22A6611D0](&v20);
    uint64_t v12 = objc_msgSend(v9, "appState", v20, v21, v22, v23);
    int v13 = [v12 isInstalled];

    if (v13)
    {
      uint64_t v14 = [v9 bundleURL];
      if (v14)
      {
        int v15 = [MEMORY[0x263F5E718] managerForUser:*(unsigned int *)(a1 + 144)];
        int v16 = v15;
        if (a3) {
          [v15 terminatePlugInsInApplication:v14 options:0 result:v11];
        }
        else {
          [v15 holdPlugInsInApplication:v14 result:v11];
        }
      }
      else
      {
        id v19 = rbs_connection_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient _requestPluginHoldForProxy:terminate:completion:](v9, v19);
        }

        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
    }
    else
    {
      uint64_t v17 = rbs_connection_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v9 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        int v27 = v18;
        _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_DEFAULT, "skipping plugin hold for uninstalled proxy %{public}@", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = rbs_connection_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) bundleIdentifier];
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_INFO, "Successfully acquired plugin hold for %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v9 = 0;
  }
  else
  {
    id v7 = objc_opt_new();
    [v7 setObject:@"Error acquiring hold on plugins" forKeyedSubscript:*MEMORY[0x263F08338]];
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08608]];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F646A8] code:5 userInfo:v7];
    uint64_t v10 = [v6 code];
    uint64_t v11 = rbs_connection_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10 == 14)
    {
      if (v12) {
        __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_1(a1, (uint64_t)v6, v11);
      }
    }
    else if (v12)
    {
      __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_2(a1, (uint64_t)v6, v11);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)expandPredicateForContained:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 predicate];
    id v6 = [v5 bundleIdentifier];
    id v7 = [v4 context];
    id v8 = [v7 attributes];

    if (!v6)
    {
      id v9 = rbs_connection_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_DEFAULT, "Termination predicate not expanded because complex predicate", buf, 2u);
      }
      goto LABEL_28;
    }
    if (!v8)
    {
      id v9 = 0;
      uint64_t v11 = 0;
      int v13 = 0;
      goto LABEL_15;
    }
    if ([v8 count] == 1)
    {
      id v9 = [v8 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = v10;

      if (v11)
      {
        uint64_t v11 = [v11 predicate];
        BOOL v12 = [v11 bundleIdentifier];
        int v13 = v12;
        if (v12)
        {
          uint64_t v14 = v9;
          if (([v12 isEqual:v6] & 1) == 0) {
            goto LABEL_25;
          }
LABEL_15:
          __int16 v15 = RBSContainedExtensionBundleIDs();
          if ([v15 count] != 1)
          {
            id v24 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifiers:v15];
            id v16 = rbs_connection_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = [v4 predicate];
              *(_DWORD *)buf = 138412546;
              int v27 = v17;
              __int16 v28 = 2112;
              uint64_t v29 = v24;
              _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_DEFAULT, "expanding termination predicate from %@ to %@", buf, 0x16u);
            }
            [v4 setPredicate:v24];
            if (v8)
            {
              id v18 = (void *)MEMORY[0x263F64530];
              uint64_t v23 = [v9 allow];
              id v19 = [v18 limitationWithPredicate:v24 andException:v23];
              id v25 = v19;
              uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];

              uint64_t v21 = [v4 context];
              [v21 setAttributes:v20];
            }
          }

          goto LABEL_28;
        }
        uint64_t v14 = v9;
LABEL_25:
        uint64_t v22 = rbs_connection_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226AB3000, v22, OS_LOG_TYPE_DEFAULT, "Termination preventLaunch attribute not expanded because it didn't match Termination Predicate", buf, 2u);
        }

LABEL_28:
        goto LABEL_29;
      }
      uint64_t v14 = 0;
    }
    else
    {
      id v9 = 0;
      uint64_t v14 = 0;
      uint64_t v11 = 0;
    }
    int v13 = 0;
    goto LABEL_25;
  }
LABEL_29:
}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) context];
  id v3 = [*(id *)(a1 + 32) predicate];
  uint64_t v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v3 beforeTranslocationBundlePath];
  -[RBConnectionClient expandPredicateForContained:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  id v6 = [v2 attributes];
  uint64_t v7 = [v6 count];

  id v8 = rbs_connection_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) predicate];
      *(_DWORD *)buf = 138543362;
      long long v52 = v10;
      _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_INFO, "Requesting plugIn hold for %{public}@", buf, 0xCu);
    }
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_182;
    v43[3] = &unk_2647C8518;
    uint64_t v11 = &v44;
    id v44 = *(id *)(a1 + 48);
    BOOL v12 = (id *)v45;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 40);
    v45[0] = v13;
    v45[1] = v14;
    id v15 = v2;
    id v46 = v15;
    id v47 = *(id *)(a1 + 32);
    id v16 = (void (**)(void, void, void))MEMORY[0x22A6611D0](v43);
    if (v4 | v5)
    {
      uint64_t v17 = (void *)MEMORY[0x263F01868];
      if (v5)
      {
        id v18 = [NSURL fileURLWithPath:v5];
        id v19 = [v17 applicationProxyForBundleURL:v18];

        uint64_t v20 = [v19 bundleURL];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          uint64_t v42 = v4;
          [v19 bundleURL];
          v23 = uint64_t v22 = (void *)v5;
          id v24 = [v23 path];
          uint64_t v41 = v22;
          LOBYTE(v22) = [v22 isEqual:v24];

          if ((v22 & 1) == 0)
          {
            int v31 = rbs_connection_log();
            uint64_t v5 = (uint64_t)v41;
            uint64_t v11 = &v44;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              id v39 = [v19 bundleURL];
              uint64_t v40 = [v39 path];
              *(_DWORD *)buf = 138543874;
              long long v52 = v3;
              __int16 v53 = 2114;
              long long v54 = v41;
              __int16 v55 = 2114;
              long long v56 = v40;
              _os_log_error_impl(&dword_226AB3000, v31, OS_LOG_TYPE_ERROR, "beforeTranslocationBundlePath does not match LS bundleURL %{public}@ (%{public}@, %{public}@)", buf, 0x20u);
            }
            uint64_t v32 = NSString;
            int v33 = [v19 bundleURL];
            uint64_t v34 = [v33 path];
            id v35 = [v32 stringWithFormat:@"beforeTranslocationBundlePath does not match LS bundleURL (%@, %@)", v41, v34];

            uint64_t v36 = objc_opt_new();
            [v36 setObject:v35 forKeyedSubscript:*MEMORY[0x263F08338]];
            id v37 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F646A8] code:1 userInfo:v36];
            ((void (**)(void, void, void *))v16)[2](v16, 0, v37);

            id v16 = 0;
            uint64_t v4 = v42;
            BOOL v12 = (id *)v45;
            goto LABEL_25;
          }
          uint64_t v5 = (uint64_t)v41;
          uint64_t v4 = v42;
          uint64_t v11 = &v44;
          BOOL v12 = (id *)v45;
          if (!v16)
          {
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          uint64_t v11 = &v44;
          if (!v16) {
            goto LABEL_25;
          }
        }
      }
      else
      {
        id v19 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
        if (!v16) {
          goto LABEL_25;
        }
      }
      if (v19)
      {
        uint64_t v28 = *(void *)(a1 + 40);
        int v29 = [v15 shouldTerminatePlugIns];
        uint64_t v30 = v28;
        BOOL v12 = (id *)v45;
        uint64_t v11 = &v44;
        -[RBConnectionClient _requestPluginHoldForProxy:terminate:completion:](v30, v19, v29, v16);
        goto LABEL_25;
      }
      uint64_t v38 = rbs_connection_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v52 = v3;
        _os_log_impl(&dword_226AB3000, v38, OS_LOG_TYPE_DEFAULT, "skipping plugin hold for termination request, unable to get proxy %{public}@", buf, 0xCu);
      }

      v16[2](v16, 0, 0);
    }
    else
    {
      int v27 = rbs_connection_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v52 = v3;
        _os_log_impl(&dword_226AB3000, v27, OS_LOG_TYPE_DEFAULT, "skipping plugin hold for termination request without bundle ID or beforeTranslocationBundlePath %{public}@", buf, 0xCu);
      }

      v16[2](v16, 0, 0);
      id v16 = 0;
    }
    id v19 = 0;
    goto LABEL_25;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_INFO, "No attributes, calling executeTerminateRequest directly", buf, 2u);
  }

  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = *(void **)(*(void *)(a1 + 40) + 40);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_180;
  v48[3] = &unk_2647C84C8;
  uint64_t v11 = &v49;
  id v49 = *(id *)(a1 + 48);
  BOOL v12 = &v50;
  id v50 = *(id *)(a1 + 56);
  [v26 executeTerminateRequest:v25 completion:v48];
LABEL_26:
}

uint64_t __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_180(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x263F646E0];
  id v7 = a3;
  [v5 encodeBool:a2 forKey:v6];
  [*(id *)(a1 + 32) encodeObject:v7 forKey:*MEMORY[0x263F646D0]];

  id v8 = *(void **)(a1 + 40);
  return [v8 send];
}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_182(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5 || !a3)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F64418], "identifierWithClientPid:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 136), "pid"));
    id v7 = [MEMORY[0x263F64630] systemTarget];
    id v8 = (void *)MEMORY[0x263F64410];
    BOOL v9 = [*(id *)(a1 + 56) explanation];
    uint64_t v10 = [*(id *)(a1 + 56) attributes];
    uint64_t v11 = [v8 descriptorWithIdentifier:v6 target:v7 explanation:v9 attributes:v10];

    BOOL v12 = +[RBAssertionAcquisitionContext contextForProcess:*(void *)(*(void *)(a1 + 48) + 112) withDescriptor:v11 daemonContext:*(void *)(*(void *)(a1 + 48) + 64)];
    [v12 setAcquisitionPolicy:1];
    [v12 setHoldToken:v5];
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void **)(v13 + 24);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_2;
    v16[3] = &unk_2647C84F0;
    void v16[4] = v13;
    id v17 = v6;
    id v18 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 32);
    id v20 = v5;
    id v21 = *(id *)(a1 + 40);
    id v15 = v6;
    [v14 acquireAssertionWithContext:v12 completion:v16];
  }
  else
  {
    [*(id *)(a1 + 32) encodeObject:a3 forKey:*MEMORY[0x263F646D0]];
    [*(id *)(a1 + 32) encodeBool:0 forKey:*MEMORY[0x263F646E0]];
    [*(id *)(a1 + 40) send];
  }
}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F5E718] managerForUser:*(unsigned int *)(*(void *)(a1 + 32) + 144)];
    [v4 releaseHold:*(void *)(a1 + 64)];

    [*(id *)(a1 + 56) encodeObject:v3 forKey:*MEMORY[0x263F646D0]];
    [*(id *)(a1 + 56) encodeBool:0 forKey:*MEMORY[0x263F646E0]];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    [*(id *)(*(void *)(a1 + 32) + 168) addObject:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    id v5 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    BOOL v9 = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_3;
    uint64_t v10 = &unk_2647C84C8;
    uint64_t v6 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    [v5 executeTerminateRequest:v6 completion:&v7];
  }
  objc_msgSend(*(id *)(a1 + 72), "send", v7, v8, v9, v10);
}

uint64_t __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *MEMORY[0x263F646C8];
  id v8 = a3;
  [v5 encodeObject:v6 forKey:v7];
  [*(id *)(a1 + 32) encodeObject:v8 forKey:*MEMORY[0x263F646D0]];

  BOOL v9 = *(void **)(a1 + 32);
  uint64_t v10 = *MEMORY[0x263F646E0];
  return [v9 encodeBool:a2 forKey:v10];
}

void __57__RBConnectionClient_captureStateForSubsystem_withReply___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) stateForSubsystem:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) payload];
  [v2 encodeObject:v3 forKey:*MEMORY[0x263F646E0]];

  [*(id *)(a1 + 48) send];
}

- (void)willExpireAssertionsSoonForProcess:(double)a3 expirationTime:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1 && *(id *)(a1 + 112) == v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v7 = *(id *)(a1 + 8);
    if (*(void *)(a1 + 192))
    {
      if (objc_msgSend(*(id *)(a1 + 24), "hasAssertionWithIdentifier:"))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
LABEL_17:

        goto LABEL_18;
      }
      id v8 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (!v7) {
      goto LABEL_17;
    }
    RBSMachAbsoluteTime();
    double v10 = v9;
    double v11 = a3 - v9 + -0.1;
    if ([v6 isSuspended])
    {
      id v12 = rbs_connection_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138544130;
        id v37 = v6;
        __int16 v38 = 2050;
        double v39 = v11;
        __int16 v40 = 2050;
        double v41 = a3;
        __int16 v42 = 2050;
        double v43 = v10;
        _os_log_fault_impl(&dword_226AB3000, v12, OS_LOG_TYPE_FAULT, "%{public}@ Suspension Warning for already suspened process (d:%{public}fs xt:%{public}fs n:%{public}fs)", buf, 0x2Au);
      }
    }
    else
    {
      if (v11 <= 0.0)
      {
LABEL_16:
        int v27 = objc_msgSend(MEMORY[0x263F64658], "messageForMethod:varguments:", sel_async_willExpireAssertionsSoon, 0, v28, v29, v30, v31, v32);
        [v27 sendToConnection:v7];

        goto LABEL_17;
      }
      uint64_t v13 = rbs_connection_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void **)(a1 + 136);
        *(_DWORD *)buf = 138543618;
        id v37 = v14;
        __int16 v38 = 2050;
        double v39 = v11;
        _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "Boosting client %{public}@ for %{public}fs to handle expiration warning", buf, 0x16u);
      }

      id v15 = (void *)MEMORY[0x263F64418];
      id v12 = *(id *)(a1 + 88);
      id v16 = objc_msgSend(v15, "identifierWithClientPid:", -[NSObject rbs_pid](v12, "rbs_pid"));
      id v17 = objc_msgSend(MEMORY[0x263F64630], "targetWithPid:", objc_msgSend(*(id *)(a1 + 112), "rbs_pid"));
      id v18 = [MEMORY[0x263F64438] grantUserInitiated];
      v35[0] = v18;
      id v19 = [MEMORY[0x263F64488] attributeWithDuration:103 warningDuration:1 startPolicy:v11 endPolicy:0.0];
      v35[1] = v19;
      id v20 = [MEMORY[0x263F64600] withReason:10101];
      v35[2] = v20;
      id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];

      uint64_t v22 = [MEMORY[0x263F64410] descriptorWithIdentifier:v16 target:v17 explanation:@"Will expire assertions soon" attributes:v21];
      uint64_t v23 = +[RBAssertionAcquisitionContext contextForProcess:v12 withDescriptor:v22 daemonContext:*(void *)(a1 + 64)];
      id v24 = (void *)MEMORY[0x263F64650];
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      uint64_t v30 = __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke;
      int v31 = &unk_2647C7A08;
      uint64_t v32 = a1;
      id v33 = v23;
      id v34 = v16;
      id v25 = v16;
      id v26 = v23;
      [v24 performBackgroundWorkWithServiceClass:25 block:&v28];
    }
    goto LABEL_16;
  }
LABEL_18:
}

void __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke_2;
  v4[3] = &unk_2647C8568;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v3 acquireAssertionWithContext:v2 completion:v4];
}

void __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 192);
    *(void *)(v4 + 192) = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v5 = *(void **)(v6 + 192);
    *(void *)(v6 + 192) = v7;
  }

  id v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock(v8);
}

- (void)willInvalidateAssertion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 136);
    id v12 = v3;
    id v5 = [v3 originator];
    uint64_t v6 = [v5 identifier];
    LODWORD(v4) = [v4 isEqual:v6];

    id v3 = v12;
    if (v4)
    {
      id v7 = (os_unfair_lock_s *)(a1 + 16);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      id v8 = *(id *)(a1 + 8);
      os_unfair_lock_unlock(v7);
      if (v8)
      {
        double v9 = (void *)MEMORY[0x263F64658];
        double v10 = [v12 identifier];
        double v11 = objc_msgSend(v9, "messageForMethod:varguments:", sel_async_assertionWillInvalidate_, v10, 0);
        [v11 sendToConnection:v8];
      }
      id v3 = v12;
    }
  }
}

- (NSString)stateCaptureTitle
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBConnectionClient.m" lineNumber:1824 description:@"stateCaptureTitle should be unused for RBConnectionClient"];

  return 0;
}

- (uint64_t)processIdentifier
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

- (uint64_t)processIdentity
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (void)handleMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 112);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Dropping message from %{public}@ that does not conform to expectations", (uint8_t *)&v3, 0xCu);
}

- (void)handleMessage:(uint8_t *)buf .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "Dropping message from %{public}@: The server is missing an implementation for %{public}@", buf, 0x16u);
}

void __36__RBConnectionClient_handleMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Error handling message from %{public}@: <%{public}@>");
}

- (void)handshakeWithRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "Expected %lu results; got %lu", (uint8_t *)&v3, 0x16u);
}

- (void)lookupHandleForKey:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 138412546;
  __int16 v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 unsignedLongLongValue];
  OUTLINED_FUNCTION_2_0(&dword_226AB3000, a2, v3, "lookupHandleForKey failed for %@ (%llx)", (uint8_t *)&v4);
}

- (void)lookupHandleForKey:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to lookupHandleForKey: <%{public}@>");
}

- (void)lookupProcessName:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Could not get proc_pidinfo for pid %d to get name", (uint8_t *)v2, 8u);
}

- (void)lookupHandleForPredicate:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3_0(&dword_226AB3000, v0, v1, "%{public}@ query resolved to %{public}@");
}

- (void)lookupHandleForPredicate:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ Error resolving process: <%{public}@>");
}

- (void)lookupHandleForPredicate:error:.cold.3()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to lookupHandleForPredicate: <%{public}@>");
}

- (void)lookupPortForIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to lookupPortForIdentifier: <%{public}@>");
}

- (void)executeTerminateRequest:(os_log_t)log withReply:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Rejecting request because the client is not entitled", v1, 2u);
}

- (void)subscribeToProcessDeath:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to subscribeToProcessDeath: <%{public}@>");
}

- (void)subscribeToProcessStateChangesWithConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to subscribeToProcessStateChangesWithConfiguration: <%{public}@>");
}

- (void)statesForPredicate:withDescriptor:withReply:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to get statesForPredicate: <%{public}@>");
}

- (void)lastExitContextForInstance:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to get lastExitContextForInstance: <%{public}@>");
}

- (void)limitationsForInstance:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to get limitationsForInstance: <%{public}@>");
}

- (void)hostProcessForInstance:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to get hostProcessForInstance: <%{public}@>");
}

- (void)infoPlistResultForInstance:forKeys:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to get infoPlistResultForInstance: <%{public}@>");
}

- (void)preventLaunchPredicates
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ client not entitled to preventLaunchPredicates: <%{public}@>");
}

- (void)saveEndowment:(NSObject *)a3 withError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 104);
  __int16 v5 = [a2 key];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  double v10 = v5;
  OUTLINED_FUNCTION_2_0(&dword_226AB3000, a3, v6, "%{public}@ client tried to save endowment twice for key: <%{public}@>", (uint8_t *)&v7);
}

- (void)isIdentityAnAngel:withError:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "%{public}@ isIdentityAnAngel called for unsupported identity: <%{public}@>");
}

- (void)_canInvalidateAssertionWithIdentifier:(NSObject *)a3 error:.cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  int v8 = [a2 clientPid];
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "Ignoring assertion invalidation request from %{public}@ because the assertion client identifier (%d) does not match", (uint8_t *)&v5, 0x12u);
}

- (void)_requestPluginHoldForProxy:(void *)a1 terminate:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138543362;
  int v5 = v3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Could not get bundle URL for bundle %{public}@", (uint8_t *)&v4, 0xCu);
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = [*(id *)(a1 + 32) bundleIdentifier];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_226AB3000, a3, v5, "Error acquiring hold on plugins for %{public}@: %{public}@", v6);
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = [*(id *)(a1 + 32) bundleIdentifier];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_226AB3000, a3, v5, "Ignoring unexpected error acquiring hold on plugins for %{public}@: %{public}@", v6);
}

- (void)_addStatesForUntrackedProcessesTo:withPredicate:.cold.1()
{
}

- (void)didInvalidateAssertions:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 136);
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_226AB3000, a2, a3, "Notifying client %{public}@ of %lu invalidated assertions", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end