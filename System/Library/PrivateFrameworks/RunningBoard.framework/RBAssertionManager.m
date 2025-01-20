@interface RBAssertionManager
+ (id)sharedWorkloop;
- (BOOL)_decreaseInFlightOperationsForOriginator:(id)a3;
- (BOOL)_increaseInFlightOperationsForOriginator:(id)a3 andSuspendIfNeeded:(id)a4;
- (BOOL)_invalidateAssertion:(id)a3 sync:(BOOL)a4;
- (BOOL)_lock_batchContextInvalidatesSynchronously:(id)a3;
- (BOOL)_lock_enforceAssertionLimitIfNecessaryForBatchContext:(id)a3 originatorProcess:(id)a4 error:(id *)a5;
- (BOOL)_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3;
- (BOOL)_lock_originatorHasExited:(id)a3;
- (BOOL)_lock_validateDescriptor:(id)a3 originatorProcess:(id)a4 originatorState:(id)a5 concreteTarget:(id)a6 targetProcess:(id)a7 targetIdentity:(id)a8 targetIdentifier:(id)a9 targetState:(id)a10 acquisitionContext:(id)a11 error:(id *)a12;
- (BOOL)_lock_willExceedAssertionLimitForOriginatorProcess:(id)a3 withIncomingCount:(unint64_t)a4;
- (BOOL)addSavedEndowment:(id)a3 forProcess:(id)a4;
- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5;
- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4;
- (BOOL)hasAssertionWithIdentifier:(id)a3;
- (BOOL)invalidateAssertion:(id)a3;
- (BOOL)invalidateAssertionFromOriginator:(id)a3 sync:(BOOL)a4 withIdentifier:(id)a5;
- (BOOL)invalidateAssertionFromOriginator:(id)a3 withIdentifier:(id)a4;
- (BOOL)invalidateAssertionWithIdentifier:(id)a3;
- (BOOL)invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:(id)a3;
- (BOOL)isProcessForeground:(id)a3;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBAssertionManager)init;
- (RBAssertionManager)initWithDelegate:(id)a3 bundlePropertiesManager:(id)a4 originatorPidStore:(id)a5 assertionDescriptorValidator:(id)a6 timeProvider:(id)a7 daemonContext:(id)a8 maxOperationsInFlight:(unint64_t)a9 maxAssertionsPerOriginator:(unint64_t)a10;
- (RBSystemState)systemState;
- (double)_lock_delayedStartTimeForAssertion:(id)a3;
- (double)_lock_invalidationTimeForAssertion:(id)a3;
- (double)_lock_originatorExitTimeForAssertion:(id)a3;
- (double)_lock_relativeStartTimeForAssertion:(id)a3;
- (double)_lock_startTimeForAssertion:(id)a3;
- (double)_remainingRuntimeForProcessIdentity:(id)a3;
- (double)eventQueue:(id)a3 remainingRuntimeForProcessIdentity:(id)a4;
- (double)eventQueue:(id)a3 startTimeForAssertion:(id)a4;
- (id)_concreteTargetForTarget:(id)a3 allowAbstractTarget:(BOOL)a4;
- (id)_lock_activateDelayedAssertionsForTargets:(id)a3;
- (id)_lock_assertionCreationAttributeContextForTargetIdentity:(id)a3 originator:(id)a4;
- (id)_lock_createAssertionForDescriptor:(id)a3 originatorState:(id)a4 acquisitionContext:(id)a5 error:(id *)a6;
- (id)_lock_createAssertionWithAcquisitionContext:(id)a3 attributeContext:(id)a4 concreteTarget:(id)a5 targetIdentity:(id)a6 originator:(id)a7 error:(id *)a8;
- (id)_lock_createAssertionsForBatchContext:(id)a3 originatorState:(id)a4 errorsByIndex:(id)a5;
- (id)_lock_deactivateAssertions:(id)a3;
- (id)_lock_deactivateDelayedAssertionsForTargets:(id)a3;
- (id)_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:(id)a3;
- (id)_lock_invalidateAssertionByConditions:(id)a3 changedAssertions:(id *)a4;
- (id)_lock_originatorIdentifiersInAssertions:(id)a3;
- (id)_lock_savedEndowmentsForProcess:(id)a3;
- (id)_lock_sortedAssertionsForTarget:(id)a3;
- (id)_lock_targetIdentitiesInAssertions:(id)a3;
- (id)_lock_updateStatesDueToChangingAssertions:(id)a3 invalidatedAssertions:(id)a4;
- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4;
- (id)allEntitlements;
- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3;
- (id)assertionsForOriginator:(id)a3;
- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6;
- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4;
- (id)limitationsForInstance:(id)a3;
- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4;
- (id)popPluginHoldForAssertion:(id)a3;
- (id)processForIdentity:(id)a3;
- (id)restrictionsForDomain:(id)a3 andName:(id)a4;
- (id)savedEndowmentsForProcess:(id)a3;
- (id)stateForIdentity:(id)a3;
- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4;
- (unint64_t)_lock_incomingAssertionCountForBatchContext:(id)a3 originatorIdentifier:(id)a4;
- (unint64_t)_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3;
- (unint64_t)_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:(id)a3 completionPolicy:(unint64_t)a4;
- (void)_acquireAssertions:(id)a3 invalidateIdentifiers:(id)a4 forOriginatorProcess:(id)a5 completionPolicy:(unint64_t)a6 acquisitionErrorsByIndex:(id)a7 completeStage:(id)a8;
- (void)_acquireUnderlyingAssertionForProcess:(id)a3;
- (void)_decreaseInFlightOperationsForTargetIdentities:(id)a3;
- (void)_dumpAssertions;
- (void)_increaseInFlightOperationsForTargetIdentities:(id)a3;
- (void)_invalidateAssertionsWithContext:(id)a3;
- (void)_lock_addAssertion:(id)a3;
- (void)_lock_checkAssertionToInvalidateByCondition:(id)a3 condition:(id)a4 currentValue:(id)a5 assertionsToInvalidate:(id)a6;
- (void)_lock_clearStartTimesForUnbusyTargets:(id)a3;
- (void)_lock_dumpAssertionsForTarget:(id)a3;
- (void)_lock_enqueueAssertionsForRemoval:(id)a3;
- (void)_lock_finalizeRemovingAssertions:(id)a3;
- (void)_lock_invalidateAssertions:(id)a3 forceSync:(BOOL)a4;
- (void)_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:(id)a3;
- (void)_lock_notifyDelegateOfInvalidatedAssertions:(id)a3;
- (void)_lock_notifyDelegateOfProcessStateChangeSet:(id)a3;
- (void)_lock_removeAssertion:(id)a3;
- (void)_lock_removeAssertions:(id)a3 andUpdateChangedAssertions:(id)a4;
- (void)_lock_removeInvalidAssertions;
- (void)_lock_removeStateForProcessIdentityIfNecessary:(id)a3;
- (void)_lock_setState:(id)a3 forProcessIdentity:(id)a4;
- (void)_lock_setSystemState:(id)a3;
- (void)_removeInvalidAssertions;
- (void)acquireAssertionWithContext:(id)a3 completion:(id)a4;
- (void)commitBatchWithContext:(id)a3 completion:(id)a4;
- (void)eventQueue:(id)a3 handleAssertionsExpirationWarningEventForProcessIdentity:(id)a4 expirationTime:(double)a5;
- (void)eventQueue:(id)a3 handleInvalidationEventForAssertion:(id)a4;
- (void)eventQueue:(id)a3 handleWarningEventForAssertion:(id)a4;
- (void)periodicRunningProcessDump;
- (void)processDidLaunch:(id)a3;
- (void)processDidTerminate:(id)a3;
- (void)revalidateAssertionsForProcessIdentities:(id)a3;
@end

@implementation RBAssertionManager

- (id)_concreteTargetForTarget:(id)a3 allowAbstractTarget:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"RBAssertionManager.m", 903, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];
  }
  if ([v7 isSystem])
  {
    v8 = +[RBConcreteTarget systemTarget];
    goto LABEL_22;
  }
  v9 = [v7 processIdentity];
  processIndex = self->_processIndex;
  if (v9)
  {
    v11 = [(RBProcessIndex *)processIndex processForIdentity:v9];
  }
  else
  {
    v12 = [v7 processIdentifier];
    v11 = [(RBProcessIndex *)processIndex processForIdentifier:v12];
  }
  if ([v11 isTerminating])
  {
    v13 = rbs_assertion_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "ignoring %{public}@ as candidate for concrete target as it is terminating", buf, 0xCu);
    }

    v11 = 0;
    v8 = 0;
    if (!v4) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }
  if (v4)
  {
LABEL_14:
    if (v9)
    {
      id v14 = v9;
LABEL_19:
      v16 = [v7 environment];
      v8 = +[RBConcreteTarget targetWithIdentity:v14 environment:v16];

      goto LABEL_21;
    }
    id v14 = [v11 identity];
    if (v14) {
      goto LABEL_19;
    }
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  if (!v11) {
    goto LABEL_20;
  }
  v15 = [v7 environment];
  v8 = +[RBConcreteTarget targetWithProcess:v11 environment:v15];

LABEL_21:
LABEL_22:

  return v8;
}

- (id)popPluginHoldForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_pluginHoldsForAssertions objectForKey:v4];
  if (v5) {
    [(NSMutableDictionary *)self->_pluginHoldsForAssertions removeObjectForKey:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

uint64_t __69__RBAssertionManager__increaseInFlightOperationsForTargetIdentities___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didBeginTrackingInFightUpdatesForProcessIdentity:*(void *)(a1 + 40)];
}

uint64_t __69__RBAssertionManager__decreaseInFlightOperationsForTargetIdentities___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didEndTrackingInFightUpdatesForProcessIdentity:*(void *)(a1 + 40)];
}

void __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        v8 = [[RBProcessStateChange alloc] initWithIdentity:v6 originalState:0 updatedState:v7];
        v9 = [RBProcessStateChangeSet alloc];
        v17 = v8;
        v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
        v11 = [(RBProcessStateChangeSet *)v9 initWithChanges:v10];

        [*(id *)(*(void *)(a1 + 40) + 32) assertionManager:*(void *)(a1 + 40) didUpdateProcessStates:v11 completion:0];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v3);
  }
}

void __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke_2;
  v5[3] = &unk_2647C7F40;
  id v6 = *(id *)(a1 + 48);
  [v4 assertionManager:v2 didUpdateProcessStates:v3 completion:v5];
}

- (void)_lock_finalizeRemovingAssertions:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [(RBAssertionManager *)self _lock_removeAssertion:*(void *)(*((void *)&v18 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  v9 = [(RBAssertionManager *)self _lock_targetIdentitiesInAssertions:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(RBAssertionManager *)self _lock_removeStateForProcessIdentityIfNecessary:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_lock_removeAssertion:(id)a3
{
  id v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(RBAssertionCollection *)self->_assertions removeAssertion:v11];
  id v4 = [(RBDaemonContextProviding *)self->_daemonContext historicalStatistics];
  objc_msgSend(v4, "notifyAssertionCount:", -[RBAssertionCollection count](self->_assertions, "count"));

  uint64_t v5 = [(RBDaemonContextProviding *)self->_daemonContext stateCaptureManager];
  [v5 removeItem:v11];

  uint64_t v6 = [v11 originator];
  uint64_t v7 = [v6 identifier];

  if (![(RBAssertionCollection *)self->_assertions hasAssertionsForOriginator:v7])
  {
    uint64_t v8 = [(RBProcessIndex *)self->_processIndex processForIdentifier:v7];
    if ([v8 isReported]) {
      -[RBAssertionOriginatorPidPersisting removePid:](self->_originatorPidStore, "removePid:", [v7 pid]);
    }
  }
  v9 = [v11 target];
  uint64_t v10 = [v9 identity];

  if (v10) {
    RBPowerlogEvent(2, v10, [(RBAssertionCollection *)self->_assertions assertionCountForTargetProcessIdentity:v10], 0xFFFFFFFFLL);
  }
}

- (void)_lock_addAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__RBAssertionManager__lock_addAssertion___block_invoke;
  block[3] = &unk_2647C7CC8;
  block[4] = self;
  if (_lock_addAssertion__onceToken != -1) {
    dispatch_once(&_lock_addAssertion__onceToken, block);
  }
  uint64_t v5 = [v4 originator];
  uint64_t v6 = [v5 identifier];

  if (![(RBAssertionCollection *)self->_assertions hasAssertionsForOriginator:v6])
  {
    uint64_t v7 = [(RBProcessIndex *)self->_processIndex processForIdentifier:v6];
    if ([v7 isReported]) {
      -[RBAssertionOriginatorPidPersisting addPid:](self->_originatorPidStore, "addPid:", [v6 pid]);
    }
  }
  [(RBAssertionCollection *)self->_assertions addAssertion:v4];
  uint64_t v8 = [(RBDaemonContextProviding *)self->_daemonContext historicalStatistics];
  objc_msgSend(v8, "notifyAssertionCount:", -[RBAssertionCollection count](self->_assertions, "count"));

  v9 = [(RBDaemonContextProviding *)self->_daemonContext stateCaptureManager];
  [v9 addItem:v4];

  uint64_t v10 = [v4 target];
  id v11 = [v10 identity];

  if (v11) {
    RBPowerlogEvent(1, v11, [(RBAssertionCollection *)self->_assertions assertionCountForTargetProcessIdentity:v11], 0xFFFFFFFFLL);
  }
}

uint64_t __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_lock_targetIdentitiesInAssertions:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "target", (void)v13);
        id v11 = [v10 identity];

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_lock_removeStateForProcessIdentityIfNecessary:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (![(RBAssertionCollection *)self->_assertions assertionCountForTargetProcessIdentity:v4]&& ![(RBProcessIndex *)self->_processIndex containsIdentity:v4])
  {
    [(RBProcessMap *)self->_stateMap removeIdentity:v4];
    [(NSMutableSet *)self->_assertionTargets removeObject:v4];
    id v5 = rbs_process_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_INFO, "Ended tracking state for process identity %{public}@", buf, 0xCu);
    }

    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__RBAssertionManager__lock_removeStateForProcessIdentityIfNecessary___block_invoke;
    v7[3] = &unk_2647C7B98;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(calloutQueue, v7);
  }
}

- (BOOL)_lock_validateDescriptor:(id)a3 originatorProcess:(id)a4 originatorState:(id)a5 concreteTarget:(id)a6 targetProcess:(id)a7 targetIdentity:(id)a8 targetIdentifier:(id)a9 targetState:(id)a10 acquisitionContext:(id)a11 error:(id *)a12
{
  p_lock = &self->_lock;
  id v39 = a11;
  id v38 = a10;
  id v37 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v26 = +[RBAssertionDescriptorValidatorContext context];
  [v26 setAssertionDescriptor:v25];

  [v26 setOriginatorProcess:v24];
  [v26 setOriginatorState:v23];

  [v26 setTarget:v22];
  [v26 setTargetProcess:v21];

  [v26 setTargetIdentity:v20];
  [v26 setTargetIdentifier:v37];

  [v26 setTargetState:v38];
  [v26 setAcquisitionContext:v39];

  v27 = [(RBDaemonContextProviding *)self->_daemonContext entitlementManager];
  [v26 setEntitlementManager:v27];

  [v26 setBundlePropertiesManager:self->_bundlePropertiesManager];
  v28 = [(RBDaemonContextProviding *)self->_daemonContext domainAttributeManager];
  [v26 setDomainAttributeManager:v28];

  v29 = [(RBAssertionManager *)self _lock_savedEndowmentsForProcess:v24];

  [v26 setSavedEndowments:v29];
  [v26 setSystemState:self->_systemState];
  descriptorValidator = self->_descriptorValidator;
  id v40 = 0;
  char v31 = [(RBAssertionDescriptorValidating *)descriptorValidator isAssertionValidForContext:v26 error:&v40];
  id v32 = v40;
  v33 = v32;
  if ((v31 & 1) == 0)
  {
    if (!v32)
    {
      v35 = [MEMORY[0x263F08690] currentHandler];
      [v35 handleFailureInMethod:a2 object:self file:@"RBAssertionManager.m" lineNumber:1758 description:@"assertion validator failed to return error. this is required."];

      if (!a12) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (a12) {
LABEL_4:
    }
      *a12 = v33;
  }
LABEL_5:

  return v31;
}

- (id)_lock_assertionCreationAttributeContextForTargetIdentity:(id)a3 originator:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v9 = objc_alloc_init(RBAttributeContext);
  id v10 = [(RBDaemonContextProviding *)self->_daemonContext entitlementManager];
  [(RBAttributeContext *)v9 setEntitlementManager:v10];

  uint64_t v11 = [(RBDaemonContextProviding *)self->_daemonContext domainAttributeManager];
  [(RBAttributeContext *)v9 setDomainAttributeManager:v11];

  [(RBAttributeContext *)v9 setBundlePropertiesManager:self->_bundlePropertiesManager];
  uint64_t v12 = [(RBProcessMap *)self->_stateMap valueForIdentity:v8];

  [(RBAttributeContext *)v9 setInitialProcessState:v12];
  long long v13 = [(RBAssertionManager *)self _lock_savedEndowmentsForProcess:v7];

  [(RBAttributeContext *)v9 setSavedEndowments:v13];
  [(RBAttributeContext *)v9 setSystemState:self->_systemState];
  return v9;
}

- (id)_lock_savedEndowmentsForProcess:(id)a3
{
  return [(NSMapTable *)self->_savedEndowments objectForKey:a3];
}

- (double)_remainingRuntimeForProcessIdentity:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(RBTimeProviding *)self->_timeProvider currentTime];
  double v6 = v5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [(RBAssertionCollection *)self->_assertions assertionsForTargetIdentity:v4];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v31 = v4;
    char v10 = 0;
    char v11 = 0;
    uint64_t v12 = *(void *)v33;
    double v13 = 0.0;
    double v14 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v7);
        }
        long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v16 isActive])
        {
          [v16 invalidationDuration];
          if (v17 <= 0.0)
          {
            v27 = [v16 processState];
            BOOL v28 = [v27 role] > 1;

            v11 |= v28;
          }
          else
          {
            double v18 = v17;
            [(RBAssertionManager *)self _lock_startTimeForAssertion:v16];
            double v20 = v19;
            uint64_t v21 = [v16 endPolicy];
            double v22 = v18 + v20 - v6;
            if (v14 >= v22) {
              double v23 = v22;
            }
            else {
              double v23 = v14;
            }
            if (v21 == 2) {
              double v14 = v23;
            }
            v10 |= v21 == 2;
            id v24 = [v16 processState];
            unsigned int v25 = [v24 role];

            if (v13 < v22 && v25 > 1) {
              double v13 = v22;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);

    os_unfair_lock_unlock(&self->_lock);
    if (v11)
    {
      if (v10) {
        double v13 = v14;
      }
      else {
        double v13 = *MEMORY[0x263F646A0];
      }
      id v4 = v31;
    }
    else
    {
      id v4 = v31;
      if (v10)
      {
        if (v14 >= v13) {
          double v29 = v13;
        }
        else {
          double v29 = v14;
        }
        if (v13 > 0.0) {
          double v13 = v29;
        }
        else {
          double v13 = 0.0;
        }
      }
    }
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
    double v13 = 0.0;
  }

  return v13;
}

- (double)_lock_startTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [v4 creationTime];
  double v6 = v5;
  uint64_t v7 = [v4 startPolicy];
  if (v7 > 100)
  {
    if (v7 == 101)
    {
      [(RBAssertionManager *)self _lock_relativeStartTimeForAssertion:v4];
    }
    else
    {
      if (v7 != 102)
      {
        if (v7 == 103)
        {
          [(RBAssertionManager *)self _lock_delayedStartTimeForAssertion:v4];
          double v6 = v8;
          [v4 creationTime];
          if (v6 < v9) {
            double v6 = v9;
          }
        }
        goto LABEL_14;
      }
      [(RBAssertionManager *)self _lock_delayedStartTimeForAssertion:v4];
    }
LABEL_13:
    double v6 = v10;
    goto LABEL_14;
  }
  if (v7 != 2)
  {
    if (v7 != 3) {
      goto LABEL_14;
    }
    [(RBAssertionManager *)self _lock_originatorExitTimeForAssertion:v4];
    goto LABEL_13;
  }
  uint64_t v12 = [v4 target];
  double v13 = [v12 process];

  if (v13)
  {
    timeProvider = self->_timeProvider;
    long long v15 = [v4 target];
    long long v16 = [v15 process];
    [(RBTimeProviding *)timeProvider startTimeForProcess:v16];
    double v6 = v17;
  }
LABEL_14:

  return v6;
}

- (void)commitBatchWithContext:(id)a3 completion:(id)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workloop);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_calloutQueue);
  v61 = self;
  if (!v7)
  {
    v49 = [MEMORY[0x263F08690] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"RBAssertionManager.m", 244, @"Invalid parameter not satisfying: %@", @"batchContext" object file lineNumber description];
  }
  SEL v94 = a2;
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x2020000000;
  char v96 = 0;
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke;
  v90[3] = &unk_2647C7D68;
  v93 = v95;
  v90[4] = self;
  id v62 = v7;
  id v91 = v62;
  id v54 = v8;
  id v92 = v54;
  v57 = (void (**)(void, void, void, void))MEMORY[0x22A6611D0](v90);
  v65 = [MEMORY[0x263EFF9A0] dictionary];
  v63 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v10 = [v62 process];
  v58 = [v10 identifier];
  v56 = [v10 identity];
  uint64_t v11 = [v62 acquisitionPolicy];
  if (v11 == 1)
  {
    uint64_t v12 = 1;
  }
  else if ([(RBAssertionManager *)self _lock_batchContextInvalidatesSynchronously:v62])
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = v11;
  }
  uint64_t v60 = v12;
  double v13 = [v62 descriptorsToAcquire];
  v59 = v10;
  BOOL v14 = [v13 count] == 0;

  if (v14)
  {
    v53 = 0;
  }
  else
  {
    id v89 = 0;
    BOOL v15 = [(RBAssertionManager *)self _lock_enforceAssertionLimitIfNecessaryForBatchContext:v62 originatorProcess:v59 error:&v89];
    id v16 = v89;
    id v17 = v16;
    if (v15)
    {
      os_unfair_lock_unlock(lock);
      ((void (**)(void, void, void, id))v57)[2](v57, 0, 0, v17);
      id v18 = v17;
      goto LABEL_39;
    }
    v50 = v16;
    v52 = [(RBProcessMap *)v61->_stateMap valueForIdentity:v56];
    uint64_t v51 = [MEMORY[0x263EFF9A0] dictionary];

    v53 = [(RBAssertionManager *)v61 _lock_createAssertionsForBatchContext:v62 originatorState:v52 errorsByIndex:v51];
    if ([v53 count])
    {
      uint64_t v60 = [(RBAssertionManager *)v61 _lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:v53 completionPolicy:v60];
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id obj = v53;
      uint64_t v19 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
      if (v19)
      {
        uint64_t v64 = *(void *)v86;
        do
        {
          uint64_t v66 = v19;
          for (uint64_t i = 0; i != v66; ++i)
          {
            if (*(void *)v86 != v64) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v85 + 1) + 8 * i);
            double v22 = [obj objectForKeyedSubscript:v21];
            double v23 = [v22 identifier];
            [v65 setObject:v23 forKeyedSubscript:v21];
            id v24 = [v22 target];
            unsigned int v25 = [v24 identity];

            if (v25) {
              [v63 addObject:v25];
            }
            v26 = [v22 target];
            v27 = [v26 process];

            BOOL v28 = rbs_sp_assertion_log();
            os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, (const void *)[v23 hash]);

            v30 = rbs_sp_assertion_log();
            id v31 = v30;
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
            {
              id v32 = [v22 explanation];
              id v33 = [v27 shortDescription];
              long long v34 = [v23 description];
              *(_DWORD *)buf = 138543874;
              id v98 = v32;
              __int16 v99 = 2114;
              id v100 = v33;
              __int16 v101 = 2114;
              v102 = v34;
              _os_signpost_emit_with_name_impl(&dword_226AB3000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "ClientAssertion", "explanation=%{public}@;target=%{public}@;identifier=%{public}@",
                buf,
                0x20u);
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
        }
        while (v19);
      }
    }
    id v9 = (id)v51;
  }
  os_unfair_lock_unlock(lock);
  dispatch_sync((dispatch_queue_t)v61->_calloutQueue, &__block_literal_global_53);
  long long v35 = [MEMORY[0x263F64660] currentContext];
  v36 = [v35 connection];

  uint64_t v37 = v61;
  [(RBAssertionManager *)v61 _increaseInFlightOperationsForTargetIdentities:v63];
  if (v36
    && [(RBAssertionManager *)v61 _increaseInFlightOperationsForOriginator:v58 andSuspendIfNeeded:v36])
  {
    id v38 = rbs_process_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionManager commitBatchWithContext:completion:]();
    }

    uint64_t v37 = v61;
  }
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_55;
  v75[3] = &unk_2647C7D90;
  v75[4] = v37;
  id v76 = v63;
  id v39 = v53;
  id v77 = v39;
  id v40 = v36;
  id v78 = v40;
  id v79 = v58;
  id v41 = v59;
  id v80 = v41;
  uint64_t v84 = v60;
  v83 = v57;
  id v81 = v65;
  id v42 = v9;
  id v82 = v42;
  v43 = (void (**)(void, void, void))[v75 copy];
  v43[2](v43, 0, 0);
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_58;
  v68[3] = &unk_2647C7DB8;
  v68[4] = v61;
  id v18 = v39;
  id v69 = v18;
  id v70 = v62;
  id v71 = v41;
  uint64_t v74 = v60;
  id v9 = v42;
  id v72 = v9;
  v44 = v43;
  id v73 = v44;
  v45 = (void *)MEMORY[0x22A6611D0](v68);
  v46 = [MEMORY[0x263F64660] currentContext];
  v47 = v46;
  if (v60 == 1 && v46)
  {
    [v46 handoffToQueue:v61->_workloop block:v45];
  }
  else
  {
    workloop = v61->_workloop;
    if (v60 == 1) {
      dispatch_async_and_wait(workloop, v45);
    }
    else {
      dispatch_async(workloop, v45);
    }
  }

LABEL_39:
  _Block_object_dispose(v95, 8);
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = v5;
  if (a2 == 1)
  {
    id v17 = v5;
    [*(id *)(a1 + 32) _decreaseInFlightOperationsForTargetIdentities:*(void *)(a1 + 40)];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          double v13 = rbs_assertion_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v26 = v12;
            _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_INFO, "Finished acquiring assertion %{public}@", buf, 0xCu);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }

    double v6 = v17;
    if (*(void *)(a1 + 56)
      && [*(id *)(a1 + 32) _decreaseInFlightOperationsForOriginator:*(void *)(a1 + 64)])
    {
      uint64_t v14 = *(void *)(a1 + 32);
      BOOL v15 = *(void **)(v14 + 144);
      uint64_t v16 = *(void *)(v14 + 8);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_56;
      v18[3] = &unk_2647C7B98;
      id v19 = *(id *)(a1 + 72);
      id v20 = *(id *)(a1 + 56);
      [v15 executeAfter:v16 onQueue:v18 block:0.01];
    }
  }
  if (*(void *)(a1 + 104) == a2) {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
}

- (void)_decreaseInFlightOperationsForTargetIdentities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_inFlightOperationsLock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [(NSCountedSet *)self->_inFlightAssertionTargets removeObject:v10];
          if (![(NSCountedSet *)self->_inFlightAssertionTargets countForObject:v10])
          {
            calloutQueue = self->_calloutQueue;
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __69__RBAssertionManager__decreaseInFlightOperationsForTargetIdentities___block_invoke;
            block[3] = &unk_2647C7B98;
            block[4] = self;
            void block[5] = v10;
            dispatch_async(calloutQueue, block);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_inFlightOperationsLock);
  }
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    long long v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a1[8] object:a1[4] file:@"RBAssertionManager.m" lineNumber:249 description:@"called completion more than once"];

    uint64_t v10 = *(void *)(a1[7] + 8);
  }
  *(unsigned char *)(v10 + 24) = 1;
  if (v9)
  {
    uint64_t v11 = rbs_assertion_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v9, v11);
    }
  }
  uint64_t v12 = a1[6];
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
}

- (void)_increaseInFlightOperationsForTargetIdentities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_inFlightOperationsLock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [(NSCountedSet *)self->_inFlightAssertionTargets addObject:v10];
          if ([(NSCountedSet *)self->_inFlightAssertionTargets countForObject:v10] == 1)
          {
            calloutQueue = self->_calloutQueue;
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __69__RBAssertionManager__increaseInFlightOperationsForTargetIdentities___block_invoke;
            block[3] = &unk_2647C7B98;
            block[4] = self;
            void block[5] = v10;
            dispatch_async(calloutQueue, block);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_inFlightOperationsLock);
  }
}

- (BOOL)_lock_enforceAssertionLimitIfNecessaryForBatchContext:(id)a3 originatorProcess:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 identifier];
  unint64_t v11 = [(RBAssertionManager *)self _lock_incomingAssertionCountForBatchContext:v9 originatorIdentifier:v10];

  BOOL v12 = [(RBAssertionManager *)self _lock_willExceedAssertionLimitForOriginatorProcess:v8 withIncomingCount:v11];
  if (v12)
  {
    [(RBAssertionManager *)self _lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:v8];
    if (a5)
    {
      long long v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F64670];
      uint64_t v17 = *MEMORY[0x263F08338];
      v18[0] = @"Originator is holding too many assertions";
      long long v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a5 = [v13 errorWithDomain:v14 code:2 userInfo:v15];
    }
  }

  return v12;
}

- (BOOL)_lock_willExceedAssertionLimitForOriginatorProcess:(id)a3 withIncomingCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  unint64_t maxAssertionsPerOriginator = self->_maxAssertionsPerOriginator;
  BOOL v9 = maxAssertionsPerOriginator >= a4;
  unint64_t v10 = maxAssertionsPerOriginator - a4;
  if (v10 != 0 && v9)
  {
    assertions = self->_assertions;
    BOOL v12 = [v6 identifier];
    BOOL v13 = [(RBAssertionCollection *)assertions hasAssertionsForOriginator:v12 exceedingCount:v10];

    if (v13)
    {
      uint64_t v14 = [(RBDaemonContextProviding *)self->_daemonContext entitlementManager];
      long long v15 = [v14 entitlementsForProcess:v7];
      char v16 = [v15 hasEntitlement:@"com.apple.runningboard.performancetest"];

      char v17 = v16 ^ 1;
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

void __61__RBAssertionManager_acquireAssertionWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    id v5 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, a4);
  }
  else
  {
    id v7 = [a3 objectForKeyedSubscript:&unk_26DAB1080];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v7);
  }
}

- (unint64_t)_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:(id)a3 completionPolicy:(unint64_t)a4
{
  unint64_t v35 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v36 = [MEMORY[0x263EFF9A0] dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  uint64_t v37 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v41 = 0;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v48 + 1) + 8 * i), v35);
        BOOL v12 = [v11 target];
        BOOL v13 = [v12 process];
        uint64_t v14 = [v12 identity];
        long long v15 = (void *)v14;
        if (v13) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v14 == 0;
        }
        if (!v16)
        {
          char v17 = self;
          uint64_t v18 = [(RBProcessMap *)self->_stateMap valueForIdentity:v14];
          if (!v18 && [v11 isActive] && (objc_msgSend(v11, "isPersistent") & 1) == 0)
          {
            id v39 = [v11 originator];
            uint64_t v19 = [(RBAssertionManager *)v17 _lock_assertionCreationAttributeContextForTargetIdentity:v15 originator:v39];

            id v40 = (void *)v19;
            id v20 = [v11 updateProcessStateWithAttributeContext:v19];
            if (v20)
            {
              id v38 = v20;
              long long v21 = [v36 objectForKeyedSubscript:v15];
              if (v21)
              {
                long long v22 = v21;
                [v21 unionState:v38];
              }
              else
              {
                long long v22 = (void *)[v38 mutableCopy];
                [v36 setObject:v22 forKeyedSubscript:v15];
              }

              id v20 = v38;
            }
            ++v41;

            id v6 = v37;
          }

          self = v17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v41 = 0;
  }

  if ([v36 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v23 = v36;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          os_signpost_id_t v29 = objc_msgSend(v23, "objectForKeyedSubscript:", v28, v35);
          [(RBAssertionManager *)self _lock_setState:v29 forProcessIdentity:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v25);
    }

    unint64_t v30 = v35;
    if (v41 == [v37 count] && v35 == 1) {
      unint64_t v30 = 0;
    }
    id v32 = (void *)MEMORY[0x263F64660];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke;
    v42[3] = &unk_2647C7B98;
    v42[4] = self;
    id v43 = v23;
    id v33 = v32;
    id v6 = v37;
    [v33 runWithoutContext:v42];
  }
  else
  {
    unint64_t v30 = v35;
  }

  return v30;
}

- (BOOL)_lock_batchContextInvalidatesSynchronously:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend(a3, "identifiersToInvalidate", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(RBAssertionCollection *)self->_assertions assertionWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        char v10 = [v9 invalidatesSynchronously];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (double)_lock_delayedStartTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(RBTimeProviding *)self->_timeProvider currentTime];
  double v6 = v5;
  uint64_t v7 = [v4 target];
  uint64_t v8 = [v7 identity];

  if (v8)
  {
    if (([v4 isActive] & 1) != 0
      || ![(RBAssertionManager *)self _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:v8])
    {
      uint64_t v9 = [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity objectForKeyedSubscript:v8];
      char v10 = v9;
      if (v9)
      {
        [v9 doubleValue];
        double v6 = v11;
      }
    }
    else
    {
      double v6 = 1.79769313e308;
    }
  }

  return v6;
}

void __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 userInfo];
    double v6 = [v5 valueForKey:@"IgnoreOnReconnect"];
    uint64_t v7 = rbs_assertion_log();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v12 = 138543874;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        uint64_t v15 = v10;
        __int16 v16 = 2114;
        char v17 = v4;
        _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_INFO, "Underlying assertion for %{public}@ with name %{public}@ failed to acquire with error %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke_cold_1(a1, (uint64_t)v4, v8);
    }
  }
  else
  {
    double v5 = rbs_assertion_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully acquired underlying assertion for %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (double)_lock_originatorExitTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(RBTimeProviding *)self->_timeProvider currentTime];
  double v6 = v5;
  uint64_t v7 = [v4 originator];
  uint64_t v8 = [v7 identifier];

  if (v8)
  {
    if ([v4 isActive])
    {
      uint64_t v9 = [(NSMapTable *)self->_originatorExitTimesByAssertion objectForKey:v4];
      if (!v9)
      {
        uint64_t v10 = NSNumber;
        [(RBTimeProviding *)self->_timeProvider currentTime];
        uint64_t v9 = objc_msgSend(v10, "numberWithDouble:");
        [(NSMapTable *)self->_originatorExitTimesByAssertion setObject:v9 forKey:v4];
        if (!v9) {
          -[RBAssertionManager _lock_originatorExitTimeForAssertion:]();
        }
      }
      [v9 doubleValue];
      double v6 = v11;
    }
    else
    {
      double v6 = 1.79769313e308;
    }
  }

  return v6;
}

void __66__RBAssertionManager__lock_deactivateDelayedAssertionsForTargets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 startPolicy] == 103 || objc_msgSend(v3, "startPolicy") == 102)
    && [v3 isActive]
    && ![v3 invalidationReason])
  {
    id v4 = rbs_ttl_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "Deactivating delayed assertion %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [v3 deactivate];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)_lock_createAssertionWithAcquisitionContext:(id)a3 attributeContext:(id)a4 concreteTarget:(id)a5 targetIdentity:(id)a6 originator:(id)a7 error:(id *)a8
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a4;
  uint64_t v19 = [v14 descriptor];
  [(RBTimeProviding *)self->_timeProvider currentTime];
  id v20 = +[RBAssertion assertionWithDescriptor:target:originator:context:creationTime:](RBAssertion, "assertionWithDescriptor:target:originator:context:creationTime:", v19, v15, v17, v18);

  uint64_t v21 = [v20 startPolicy];
  if (v21 <= 100)
  {
    if ((unint64_t)v21 >= 3)
    {
      if (v21 != 3) {
        goto LABEL_22;
      }
      BOOL v22 = [(RBAssertionManager *)self _lock_originatorHasExited:v20];
      id v23 = rbs_ttl_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138543362;
          long long v50 = v20;
          uint64_t v25 = "Assertion %{public}@ will be created as active as originator process has exited";
LABEL_14:
          _os_log_impl(&dword_226AB3000, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      if (v24)
      {
        *(_DWORD *)buf = 138543362;
        long long v50 = v20;
        uint64_t v28 = "Assertion %{public}@ will be created as inactive as originator process has not exited";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
LABEL_12:
    id v23 = rbs_ttl_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v50 = v20;
      uint64_t v25 = "Assertion %{public}@ will be created as active";
      goto LABEL_14;
    }
LABEL_15:

    [v20 activate];
    goto LABEL_22;
  }
  if ((unint64_t)(v21 - 102) >= 2)
  {
    if (v21 != 101) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  BOOL v26 = [(RBAssertionManager *)self _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:v16];
  id v23 = rbs_ttl_log();
  BOOL v27 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (!v26)
  {
    if (!v27) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    long long v50 = v20;
    uint64_t v25 = "Assertion %{public}@ will be created as active as no start-time-defining assertions exist";
    goto LABEL_14;
  }
  if (v27)
  {
    *(_DWORD *)buf = 138543362;
    long long v50 = v20;
    uint64_t v28 = "Assertion %{public}@ will be created as inactive as start-time-defining assertions exist";
LABEL_20:
    _os_log_impl(&dword_226AB3000, v23, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
  }
LABEL_21:

  [v20 deactivate];
LABEL_22:
  os_signpost_id_t v29 = [v15 identity];
  if (([v20 startPolicy] == 103
     || [v20 startPolicy] == 101
     || [v20 startPolicy] == 102)
    && ([(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity objectForKeyedSubscript:v29], unint64_t v30 = objc_claimAutoreleasedReturnValue(), v30, !v30))
  {
    id v32 = NSNumber;
    [(RBTimeProviding *)self->_timeProvider currentTime];
    id v33 = objc_msgSend(v32, "numberWithDouble:");
    [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity setObject:v33 forKeyedSubscript:v29];

    int v31 = 1;
  }
  else
  {
    int v31 = 0;
  }
  [v20 invalidationDuration];
  double v35 = v34;
  [(RBAssertionManager *)self _lock_invalidationTimeForAssertion:v20];
  if (v35 == 0.0 || (double v37 = v36, [(RBTimeProviding *)self->_timeProvider currentTime], v37 > v38))
  {
    id v39 = [v14 holdToken];

    if (v39)
    {
      pluginHoldsForAssertions = self->_pluginHoldsForAssertions;
      uint64_t v41 = [v14 holdToken];
      id v42 = [v20 identifier];
      [(NSMutableDictionary *)pluginHoldsForAssertions setObject:v41 forKey:v42];
    }
    a8 = v20;
  }
  else
  {
    if (v31) {
      [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity setObject:0 forKeyedSubscript:v29];
    }
    if (a8)
    {
      id v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F64670];
      v47[0] = *MEMORY[0x263F08338];
      v47[1] = @"IgnoreOnReconnect";
      v48[0] = @"Assertion's invalidation time is in the past";
      v48[1] = MEMORY[0x263EFFA88];
      long long v45 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
      *a8 = [v43 errorWithDomain:v44 code:2 userInfo:v45];

      a8 = 0;
    }
  }

  return a8;
}

- (double)_lock_invalidationTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(RBAssertionManager *)self _lock_startTimeForAssertion:v4];
  double v6 = v5;
  [v4 invalidationDuration];
  double v8 = v6 + v7;
  uint64_t v9 = [v4 startPolicy];
  if (((unint64_t)(v9 - 102) < 2 || v9 == 3) && ![v4 isActive]) {
    double v8 = 1.79769313e308;
  }

  return v8;
}

- (BOOL)_increaseInFlightOperationsForOriginator:(id)a3 andSuspendIfNeeded:(id)a4
{
  double v6 = (_xpc_connection_s *)a4;
  p_inFlightOperationsLock = &self->_inFlightOperationsLock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_inFlightOperationsLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_originatorToInFlightOperationsCountMap objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntegerValue] + 1;
  double v11 = [NSNumber numberWithUnsignedInteger:v10];
  [(NSMutableDictionary *)self->_originatorToInFlightOperationsCountMap setObject:v11 forKeyedSubscript:v8];

  unint64_t maxOperationsInFlight = self->_maxOperationsInFlight;
  if (v10 == maxOperationsInFlight) {
    xpc_connection_suspend(v6);
  }
  os_unfair_lock_unlock(p_inFlightOperationsLock);

  return v10 == maxOperationsInFlight;
}

- (unint64_t)_lock_incomingAssertionCountForBatchContext:(id)a3 originatorIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 descriptorsToAcquire];
  unint64_t v9 = [v8 count];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v19 = v6;
  id obj = [v6 identifiersToInvalidate];
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = [(RBAssertionCollection *)self->_assertions assertionWithIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * v13)];
        id v15 = [v14 originator];
        id v16 = [v15 identifier];
        unsigned int v17 = [v16 isEqual:v7];

        v9 -= v17;
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v9;
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_58(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) identifiersToInvalidate];
  [v2 _acquireAssertions:v3 invalidateIdentifiers:v4 forOriginatorProcess:*(void *)(a1 + 56) completionPolicy:*(void *)(a1 + 80) acquisitionErrorsByIndex:*(void *)(a1 + 64) completeStage:*(void *)(a1 + 72)];
}

- (id)_lock_createAssertionsForBatchContext:(id)a3 originatorState:(id)a4 errorsByIndex:(id)a5
{
  id v8 = a3;
  id v23 = a4;
  id v21 = a5;
  unint64_t v9 = [v8 descriptorsToAcquire];
  uint64_t v10 = [v9 count];

  id v22 = [MEMORY[0x263EFF9A0] dictionary];
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = [v8 descriptorsToAcquire];
      uint64_t v13 = [v12 objectAtIndexedSubscript:i];

      id v14 = [v8 acquisitionContextForDescriptor:v13];
      id v24 = 0;
      id v15 = [(RBAssertionManager *)self _lock_createAssertionForDescriptor:v13 originatorState:v23 acquisitionContext:v14 error:&v24];
      id v16 = v24;
      if (v15)
      {
        acquiringAssertionIdentifiers = self->_acquiringAssertionIdentifiers;
        id v18 = [v15 identifier];
        [(NSMutableSet *)acquiringAssertionIdentifiers addObject:v18];

        uint64_t v19 = [NSNumber numberWithUnsignedInteger:i];
        [v22 setObject:v15 forKeyedSubscript:v19];
      }
      else
      {
        uint64_t v19 = [NSNumber numberWithUnsignedInteger:i];
        [v21 setObject:v16 forKeyedSubscript:v19];
      }
    }
  }

  return v22;
}

- (BOOL)_decreaseInFlightOperationsForOriginator:(id)a3
{
  id v4 = a3;
  p_inFlightOperationsLock = &self->_inFlightOperationsLock;
  os_unfair_lock_lock(&self->_inFlightOperationsLock);
  id v6 = [(NSMutableDictionary *)self->_originatorToInFlightOperationsCountMap objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 unsignedIntegerValue];
    uint64_t v9 = v8 - 1;
    if (v8 == 1)
    {
      [(NSMutableDictionary *)self->_originatorToInFlightOperationsCountMap setObject:0 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
      [(NSMutableDictionary *)self->_originatorToInFlightOperationsCountMap setObject:v10 forKeyedSubscript:v4];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  BOOL v11 = v9 == self->_maxOperationsInFlight - 1;
  os_unfair_lock_unlock(p_inFlightOperationsLock);

  return v11;
}

- (void)acquireAssertionWithContext:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 process];
  uint64_t v9 = [v7 descriptor];
  v17[0] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  BOOL v11 = +[RBAssertionBatchContext contextForProcess:v8 withDescriptorsToAcquire:v10 identifiersToInvalidate:MEMORY[0x263EFFA68] daemonContext:self->_daemonContext];

  objc_msgSend(v11, "setUnitTesting:", objc_msgSend(v7, "unitTesting"));
  uint64_t v12 = [v7 holdToken];
  [v11 setHoldToken:v12];

  objc_msgSend(v11, "setAllowAbstractTarget:", objc_msgSend(v7, "allowAbstractTarget"));
  uint64_t v13 = [v7 acquisitionPolicy];

  [v11 setAcquisitionPolicy:v13];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__RBAssertionManager_acquireAssertionWithContext_completion___block_invoke;
  v15[3] = &unk_2647C7DE0;
  id v16 = v6;
  id v14 = v6;
  [(RBAssertionManager *)self commitBatchWithContext:v11 completion:v15];
}

- (id)_lock_createAssertionForDescriptor:(id)a3 originatorState:(id)a4 acquisitionContext:(id)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 target];
  uint64_t v13 = [v11 process];
  id v14 = -[RBAssertionManager _concreteTargetForTarget:allowAbstractTarget:](self, "_concreteTargetForTarget:allowAbstractTarget:", v12, [v11 allowAbstractTarget]);
  if ([v11 allowAbstractTarget])
  {
    id v15 = [(RBAssertionManager *)self _concreteTargetForTarget:v12 allowAbstractTarget:0];
    id v16 = [v15 process];
  }
  else
  {
    id v16 = 0;
  }
  unsigned int v17 = rbs_ttl_log();
  long long v48 = v16;
  long long v49 = v13;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v14 description];
    uint64_t v19 = v18;
    if (!v18)
    {
      uint64_t v19 = [v12 shortDescription];
    }
    id v20 = [v9 debugDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v19;
    __int16 v55 = 2114;
    v56 = v49;
    __int16 v57 = 2114;
    v58 = v20;
    _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_DEFAULT, "Acquiring assertion targeting %{public}@ from originator %{public}@ with description %{public}@", buf, 0x20u);
    if (!v18) {

    }
    id v16 = v48;
    uint64_t v13 = v49;
  }

  if (v14)
  {
    uint64_t v44 = v12;
    id v21 = [v14 identity];
    id v22 = [v14 process];
    id v23 = v22;
    id v47 = v10;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [(RBProcessIndex *)self->_processIndex processForIdentity:v21];
    }
    os_signpost_id_t v29 = v24;

    uint64_t v30 = [v29 identifier];
    int v31 = [(RBProcessMap *)self->_stateMap valueForIdentity:v21];
    id v50 = 0;
    id v43 = (void *)v30;
    id v32 = v9;
    BOOL v33 = [(RBAssertionManager *)self _lock_validateDescriptor:v9 originatorProcess:v13 originatorState:v47 concreteTarget:v14 targetProcess:v29 targetIdentity:v21 targetIdentifier:v30 targetState:v31 acquisitionContext:v11 error:&v50];
    double v34 = v13;
    BOOL v35 = v33;
    id v36 = v50;
    double v37 = v36;
    if (v35)
    {
      id v42 = [(RBAssertionManager *)self _lock_assertionCreationAttributeContextForTargetIdentity:v21 originator:v34];
      uint64_t v28 = -[RBAssertionManager _lock_createAssertionWithAcquisitionContext:attributeContext:concreteTarget:targetIdentity:originator:error:](self, "_lock_createAssertionWithAcquisitionContext:attributeContext:concreteTarget:targetIdentity:originator:error:", v11);
      id v27 = 0;

      if (v28)
      {
        id v9 = v32;
        id v16 = v48;
        if ([v11 allowAbstractTarget] && v48)
        {
          double v38 = rbs_ttl_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            [v9 debugDescription];
            id v39 = loga = v38;
            *(_DWORD *)buf = 138543618;
            uint64_t v54 = v39;
            __int16 v55 = 2114;
            v56 = v48;
            _os_log_impl(&dword_226AB3000, loga, OS_LOG_TYPE_DEFAULT, "setting abstract target for %{public}@ to %{public}@", buf, 0x16u);

            double v38 = loga;
          }

          [v28 setTargetProcessForAbstract:v48];
        }
        id v40 = v28;
      }
      else
      {
        id v9 = v32;
        id v16 = v48;
        if (a6) {
          *a6 = v27;
        }
      }
    }
    else
    {
      if (a6)
      {
        id v27 = v36;
        uint64_t v28 = 0;
        *a6 = v27;
      }
      else
      {
        uint64_t v28 = 0;
        id v27 = v36;
      }
      id v9 = v32;
      id v16 = v48;
    }

    id v10 = v47;
    uint64_t v12 = v44;
  }
  else
  {
    if (!a6)
    {
      uint64_t v28 = 0;
      goto LABEL_34;
    }
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F64670];
    uint64_t v51 = *MEMORY[0x263F08338];
    v52 = @"Specified target process does not exist";
    id v27 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    [v25 errorWithDomain:v26 code:2 userInfo:v27];
    uint64_t v28 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v13 = v49;
LABEL_34:

  return v28;
}

- (BOOL)_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  assertions = self->_assertions;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__RBAssertionManager__lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke;
  v7[3] = &unk_2647C7EF0;
  v7[4] = &v8;
  [(RBAssertionCollection *)assertions enumerateAssertionsForTargetProcessIdentity:v4 withBlock:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (BOOL)_lock_originatorHasExited:(id)a3
{
  uint64_t v3 = [a3 originator];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 isTerminating];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

uint64_t __66__RBAssertionManager__lock_notifyDelegateOfInvalidatedAssertions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didInvalidateAssertions:*(void *)(a1 + 40)];
}

- (void)_acquireAssertions:(id)a3 invalidateIdentifiers:(id)a4 forOriginatorProcess:(id)a5 completionPolicy:(unint64_t)a6 acquisitionErrorsByIndex:(id)a7 completeStage:(id)a8
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v79 = a4;
  id v14 = a5;
  id v82 = a7;
  id v15 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v16 = [MEMORY[0x263EFF9C0] set];
  v83 = [MEMORY[0x263EFF9C0] set];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = v13;
  uint64_t v86 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
  long long v87 = v16;
  if (v86)
  {
    uint64_t v88 = *(void *)v112;
    uint64_t v80 = *MEMORY[0x263F08338];
    uint64_t v81 = *MEMORY[0x263F64670];
    *(void *)&long long v17 = 138543362;
    long long v75 = v17;
    long long v85 = v14;
    id v76 = v15;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v112 != v88) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v111 + 1) + 8 * v18);
        id v20 = objc_msgSend(obj, "objectForKeyedSubscript:", v19, v75);
        uint64_t v21 = [v20 identifier];
        id v22 = [v20 target];
        uint64_t v23 = [v22 process];
        v95 = (void *)v23;
        uint64_t v96 = v18;
        v93 = v22;
        SEL v94 = (void *)v21;
        uint64_t v89 = v19;
        int v92 = [(NSMutableSet *)self->_acquiringAssertionIdentifiers containsObject:v21];
        if (!v23)
        {
          int v24 = 1;
          goto LABEL_10;
        }
        if ([(RBProcessIndex *)self->_processIndex containsProcess:v23])
        {
          int v24 = [(NSMutableSet *)self->_inFlightTerminations containsObject:v23] ^ 1;
LABEL_10:
          int v90 = v24;
          goto LABEL_12;
        }
        int v90 = 0;
LABEL_12:
        BOOL v91 = [(RBProcessIndex *)self->_processIndex containsProcess:v14];
        id v99 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        uint64_t v25 = [(RBSystemState *)self->_systemState conditions];
        uint64_t v26 = [v25 allKeys];

        uint64_t v27 = [v26 countByEnumeratingWithState:&v107 objects:v124 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v108;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v108 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v107 + 1) + 8 * i);
              id v32 = [v20 intransientState];
              BOOL v33 = [v32 invalidatesOnConditions];
              double v34 = [v33 objectForKey:v31];

              if (v34)
              {
                BOOL v35 = [(RBSystemState *)self->_systemState conditions];
                id v36 = [v35 objectForKey:v31];

                if (!v36) {
                  -[RBAssertionManager _acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:]();
                }
                uint64_t v37 = [v36 integerValue];
                if (v37 > [v34 integerValue]) {
                  [v99 addObject:v31];
                }
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v107 objects:v124 count:16];
          }
          while (v28);
        }

        if ([v20 suspendsOnOriginatorSuspension])
        {
          id v14 = v85;
          id v16 = v87;
          id v39 = v93;
          double v38 = v94;
          if ([v85 isLifecycleManaged])
          {
            stateMap = self->_stateMap;
            uint64_t v41 = [v85 identity];
            id v42 = [(RBProcessMap *)stateMap valueForIdentity:v41];
            BOOL v43 = [v42 role] == 1;
          }
          else
          {
            BOOL v43 = 0;
          }
        }
        else
        {
          BOOL v43 = 0;
          id v14 = v85;
          id v16 = v87;
          id v39 = v93;
          double v38 = v94;
        }
        [(NSMutableSet *)self->_acquiringAssertionIdentifiers removeObject:v38];
        if ([v99 count])
        {
          if (a6 != 1)
          {
            [v83 addObject:v20];
            long long v49 = rbs_assertion_log();
            uint64_t v48 = v96;
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 138543618;
            v119 = v20;
            __int16 v120 = 2114;
            id v121 = v99;
            id v50 = v49;
            uint64_t v51 = "Invalidating assertion <%{public}@> on acquisition for unmet conditions: %{public}@";
            uint32_t v52 = 22;
            goto LABEL_39;
          }
          uint64_t v44 = (void *)MEMORY[0x263F087E8];
          uint64_t v122 = v80;
          v123 = @"Conditions do not allow this assertion";
          long long v45 = [NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
          long long v46 = [v44 errorWithDomain:v81 code:5 userInfo:v45];

          [v82 setObject:v46 forKeyedSubscript:v89];
          goto LABEL_42;
        }
        if (((v92 & v91 & v90 ^ 1 | v43) & 1) == 0)
        {
          [(RBAssertionManager *)self _lock_addAssertion:v20];
          [v16 addObject:v20];
LABEL_42:
          uint64_t v48 = v96;
          goto LABEL_43;
        }
        if ((v92 & v91 & v90 & v43) != 1)
        {
          if ((v92 & v91 ^ 1 | v90))
          {
            long long v49 = rbs_ttl_log();
            uint64_t v48 = v96;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v75;
              v119 = v20;
              id v50 = v49;
              uint64_t v51 = "Silently discarding acquired but invalid %{public}@";
              goto LABEL_52;
            }
LABEL_40:

            goto LABEL_43;
          }
          uint64_t v48 = v96;
          if (a6 == 1)
          {
            v53 = (void *)MEMORY[0x263F087E8];
            uint64_t v116 = v80;
            v117 = @"Specified target process does not exist";
            uint64_t v54 = [NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
            long long v49 = [v53 errorWithDomain:v81 code:2 userInfo:v54];

            [v82 setObject:v49 forKeyedSubscript:v89];
            goto LABEL_40;
          }
          [v83 addObject:v20];
          long long v49 = rbs_assertion_log();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_40;
          }
          *(_DWORD *)buf = v75;
          v119 = v20;
          id v50 = v49;
          uint64_t v51 = "Silently discarding assertion acquired after target exited: %{public}@";
LABEL_52:
          uint32_t v52 = 12;
LABEL_39:
          _os_log_impl(&dword_226AB3000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, v52);
          goto LABEL_40;
        }
        id v47 = rbs_assertion_log();
        uint64_t v48 = v96;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v75;
          v119 = v20;
          _os_log_impl(&dword_226AB3000, v47, OS_LOG_TYPE_DEFAULT, "Suspended assertion %{public}@ on acquisition", buf, 0xCu);
        }

        [v20 suspend];
        [(RBAssertionManager *)self _lock_addAssertion:v20];
LABEL_43:

        uint64_t v18 = v48 + 1;
      }
      while (v18 != v86);
      uint64_t v55 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
      id v15 = v76;
      uint64_t v86 = v55;
    }
    while (v55);
  }

  v97 = [(RBAssertionManager *)self _lock_deactivateExistingAssertionsDelayedByIncomingAssertions:v16];
  objc_msgSend(v16, "unionSet:");
  v56 = v79;
  if ([v79 count])
  {
    id v77 = v15;
    __int16 v57 = [MEMORY[0x263EFF9C0] set];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v58 = v79;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v103 objects:v115 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v104 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v103 + 1) + 8 * j);
          if ([(NSMutableSet *)self->_acquiringAssertionIdentifiers containsObject:v63])
          {
            [(NSMutableSet *)self->_acquiringAssertionIdentifiers removeObject:v63];
            uint64_t v64 = rbs_assertion_log();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v119 = v63;
              _os_log_impl(&dword_226AB3000, v64, OS_LOG_TYPE_DEFAULT, "Dropping unacquired identifier %{public}@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v64 = [(RBAssertionCollection *)self->_assertions assertionWithIdentifier:v63];
            v65 = rbs_assertion_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v119 = v63;
              _os_log_impl(&dword_226AB3000, v65, OS_LOG_TYPE_DEFAULT, "Invalidating identifier %{public}@", buf, 0xCu);
            }

            if (v64)
            {
              [v64 setInvalidationReason:3];
              [v57 addObject:v64];
            }
            else
            {
              uint64_t v66 = rbs_assertion_log();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v119 = v63;
                _os_log_error_impl(&dword_226AB3000, v66, OS_LOG_TYPE_ERROR, "Cannot invalidate unknown identifier %{public}@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v103 objects:v115 count:16];
      }
      while (v60);
    }

    v67 = [(RBAssertionManager *)self _lock_deactivateAssertions:v57];
    id v16 = v87;
    [v87 unionSet:v67];
    [v83 unionSet:v57];

    v56 = v79;
    id v15 = v77;
  }
  if ([v16 count])
  {
    v68 = v83;
    id v69 = [(RBAssertionManager *)self _lock_updateStatesDueToChangingAssertions:v16 invalidatedAssertions:v83];
  }
  else
  {
    id v69 = 0;
    v68 = v83;
  }
  if ([v68 count])
  {
    [(RBAssertionManager *)self _lock_finalizeRemovingAssertions:v68];
    [(RBAssertionManager *)self _lock_notifyDelegateOfInvalidatedAssertions:v68];
  }
  if ([v69 hasChanges])
  {
    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke;
    v100[3] = &unk_2647C7F68;
    v100[4] = self;
    id v101 = v69;
    id v70 = v15;
    id v102 = v15;
    id v71 = (void *)MEMORY[0x22A6611D0](v100);
    id v72 = [MEMORY[0x263F64660] currentContext];
    id v73 = v72;
    if (a6 == 1 && v72)
    {
      [v72 handoffToQueue:self->_calloutQueue block:v71];
      os_unfair_lock_unlock(lock);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_calloutQueue, v71);
      os_unfair_lock_unlock(lock);
      if (a6 == 1) {
        dispatch_sync((dispatch_queue_t)self->_calloutQueue, &__block_literal_global_132);
      }
    }

    id v15 = v70;
    p_os_unfair_lock_t lock = &self->_lock;
  }
  else
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_unlock(lock);
    (*((void (**)(id, uint64_t, void))v15 + 2))(v15, 1, 0);
  }
  os_unfair_lock_assert_not_owner(p_lock);
}

- (id)_lock_updateStatesDueToChangingAssertions:(id)a3 invalidatedAssertions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  uint64_t v8 = [RBProcessStateChangeSet alloc];
  uint64_t v23 = [(RBProcessStateChangeSet *)v8 initWithChanges:MEMORY[0x263EFFA68]];
  os_unfair_lock_assert_owner(&self->_lock);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke;
  v13[3] = &unk_2647C7EA0;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  long long v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_226AB3000, "state update", OS_ACTIVITY_FLAG_DEFAULT, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v45 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [*(id *)(*(void *)(a1 + 40) + 224) conditions];
  uint64_t v3 = 0;
  id v4 = 0;
  uint64_t v43 = a1 + 56;
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 176);
    if (v4)
    {
      id v7 = [v4 systemState];
      [v6 setSystemState:v7];
    }
    else
    {
      objc_msgSend(*(id *)(v5 + 176), "setSystemState:", *(void *)(v5 + 224), v43);
    }
    uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "resolveForAssertions:", v2, v43);

    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v10 = [v8 changeSet];
    [v9 applyChanges:v10];

    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = [v8 gainedStartTimeDefining];
    id v13 = objc_msgSend(v11, "_lock_deactivateDelayedAssertionsForTargets:", v12);

    id v14 = *(void **)(a1 + 40);
    id v15 = [v8 lostStartTimeDefining];
    id v16 = objc_msgSend(v14, "_lock_activateDelayedAssertionsForTargets:", v15);

    uint64_t v48 = v16;
    long long v17 = [v16 setByAddingObjectsFromSet:v13];

    if (_os_feature_enabled_impl())
    {
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = [v8 systemState];
      uint64_t v20 = [v19 conditions];
      id v53 = 0;
      uint64_t v21 = objc_msgSend(v18, "_lock_invalidateAssertionByConditions:changedAssertions:", v20, &v53);
      id v22 = v53;

      if ([v21 count])
      {
        if (!v22) {
          __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_3();
        }
        [*(id *)(a1 + 48) unionSet:v21];
        uint64_t v23 = [v17 setByAddingObjectsFromSet:v22];

        long long v17 = (void *)v23;
      }
      else if (v22)
      {
        __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_2();
      }
      int v24 = [v8 systemState];
      id v25 = [v24 conditions];
      if (v44 == v25)
      {
      }
      else
      {
        if (v44 && v25)
        {
          char v26 = [v44 isEqual:v25];

          if (v26) {
            goto LABEL_19;
          }
        }
        else
        {
        }
        uint64_t v27 = [v8 systemState];
        uint64_t v28 = [v27 conditions];

        [*(id *)(*(void *)(a1 + 40) + 40) allAssertions];
        int v24 = v17;
        long long v17 = v44 = (id)v28;
      }

LABEL_19:
    }
    id v2 = v17;
    if (v3 == 50) {
      break;
    }
    long long v46 = v17;
    id v47 = v13;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v29 = [v8 changeSet];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          BOOL v35 = *(void **)(a1 + 40);
          id v36 = [v34 updatedState];
          uint64_t v37 = [v34 identity];
          objc_msgSend(v35, "_lock_setState:forProcessIdentity:", v36, v37);
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v31);
    }
    ++v3;

    double v38 = [v8 touchedAssertions];
    [v45 unionSet:v38];

    id v2 = v46;
    id v39 = [v46 anyObject];

    id v4 = v8;
    if (!v39) {
      goto LABEL_33;
    }
  }
  id v40 = rbs_assertion_log();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
    __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_1((uint64_t)v17, v43, v40);
  }

LABEL_33:
  uint64_t v41 = *(void **)(a1 + 40);
  id v42 = [v8 systemState];
  objc_msgSend(v41, "_lock_setSystemState:", v42);

  [*(id *)(*(void *)(a1 + 40) + 184) updateEventsForAssertions:v45];
}

- (id)_lock_deactivateDelayedAssertionsForTargets:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([(RBAssertionManager *)self _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:v11])
        {
          assertions = self->_assertions;
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __66__RBAssertionManager__lock_deactivateDelayedAssertionsForTargets___block_invoke;
          v14[3] = &unk_2647C7EC8;
          id v15 = v5;
          [(RBAssertionCollection *)assertions enumerateAssertionsForTargetProcessIdentity:v11 withBlock:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_lock_activateDelayedAssertionsForTargets:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = NSNumber;
          [(RBTimeProviding *)self->_timeProvider currentTime];
          id v13 = objc_msgSend(v12, "numberWithDouble:");
          [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity setObject:v13 forKeyedSubscript:v11];

          if (![(RBAssertionManager *)self _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:v11])
          {
            assertions = self->_assertions;
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            void v17[2] = __64__RBAssertionManager__lock_activateDelayedAssertionsForTargets___block_invoke;
            v17[3] = &unk_2647C7EC8;
            id v18 = v5;
            [(RBAssertionCollection *)assertions enumerateAssertionsForTargetProcessIdentity:v11 withBlock:v17];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    id v4 = v16;
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] set];
  }

  return v5;
}

- (id)_lock_invalidateAssertionByConditions:(id)a3 changedAssertions:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF9C0] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v7 objectForKey:v12];
        assertions = self->_assertions;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        void v18[2] = __78__RBAssertionManager__lock_invalidateAssertionByConditions_changedAssertions___block_invoke;
        v18[3] = &unk_2647C7E78;
        void v18[4] = self;
        v18[5] = v12;
        id v19 = v13;
        id v20 = v6;
        id v15 = v13;
        [(RBAssertionCollection *)assertions enumerateAssertionsWithBlock:v18];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  *a4 = [(RBAssertionManager *)self _lock_deactivateAssertions:v6];

  return v6;
}

- (id)_lock_deactivateAssertions:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = rbs_assertion_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v47 = [v5 count];
    _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_INFO, "Removing %{public}lu assertions", buf, 0xCu);
  }

  if ([v5 count])
  {
    SEL v31 = a2;
    context = (void *)MEMORY[0x22A660FC0]();
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    BOOL v35 = [MEMORY[0x263EFF9C0] set];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (![v13 invalidationReason])
          {
            id v20 = [MEMORY[0x263F08690] currentHandler];
            [v20 handleFailureInMethod:v31 object:self file:@"RBAssertionManager.m" lineNumber:1091 description:@"Must have an invalidation reason before we remove an assertion"];
          }
          id v14 = [v13 target];
          id v15 = [v14 identity];

          if (v15
            && [v13 definesRelativeStartTime]
            && [v13 isActive])
          {
            id v16 = [v7 objectForKeyedSubscript:v15];
            if (v16)
            {
              long long v17 = v16;
              id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") - 1);
            }
            else
            {
              id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RBAssertionManager _lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:", v15)- 1);
            }
            [v7 setObject:v18 forKeyedSubscript:v15];
            if (![v18 unsignedIntegerValue])
            {
              id v19 = rbs_assertion_log();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v47 = (uint64_t)v15;
                _os_log_impl(&dword_226AB3000, v19, OS_LOG_TYPE_DEFAULT, "Removed last relative-start-date-defining assertion for process %{public}@", buf, 0xCu);
              }

              [v35 addObject:v15];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v10);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = v8;
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
          [*(id *)(*((void *)&v36 + 1) + 8 * j) deactivate];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v23);
    }

    uint64_t v26 = [(RBAssertionManager *)v34 _lock_activateDelayedAssertionsForTargets:v35];
    uint64_t v27 = [(RBAssertionManager *)v34 _lock_targetIdentitiesInAssertions:v21];
    [(RBAssertionManager *)v34 _lock_clearStartTimesForUnbusyTargets:v27];
    if (v26)
    {
      id v28 = [v21 setByAddingObjectsFromSet:v26];
    }
    else
    {
      id v28 = v21;
    }
    uint64_t v29 = v28;
    id v5 = v33;
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (void)_lock_setSystemState:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (([v4 isEqual:self->_systemState] & 1) == 0)
  {
    id v5 = (void *)[v4 copy];
    objc_storeStrong((id *)&self->_systemState, v5);
    calloutQueue = self->_calloutQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__RBAssertionManager__lock_setSystemState___block_invoke;
    v8[3] = &unk_2647C7B98;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(calloutQueue, v8);
  }
}

- (id)_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "target", (void)v17);
        id v13 = [v12 identity];

        if ([v11 definesRelativeStartTime]) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14 && ([v5 containsObject:v13] & 1) == 0) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [(RBAssertionManager *)self _lock_deactivateDelayedAssertionsForTargets:v5];

  return v15;
}

void __83__RBAssertionManager__lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 definesRelativeStartTime] && objc_msgSend(v5, "isActive"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_lock_setState:(id)a3 forProcessIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v8 = [(RBProcessMap *)self->_stateMap containsIdentity:v7];
  id v9 = [(RBProcessMap *)self->_stateMap setValue:v6 forIdentity:v7];
  if (!v8)
  {
    [(NSMutableSet *)self->_assertionTargets addObject:v7];
    calloutQueue = self->_calloutQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__RBAssertionManager__lock_setState_forProcessIdentity___block_invoke;
    v11[3] = &unk_2647C7B98;
    v11[4] = self;
    id v12 = v7;
    dispatch_async(calloutQueue, v11);
  }
}

void __88__RBAssertionManager__lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 definesRelativeStartTime] && objc_msgSend(v3, "isActive")) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)_lock_clearStartTimesForUnbusyTargets:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v4 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (!-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v9, v11))
          {
            uint64_t v13 = 0;
            BOOL v14 = &v13;
            uint64_t v15 = 0x2020000000;
            char v16 = 0;
            assertions = self->_assertions;
            v12[0] = MEMORY[0x263EF8330];
            v12[1] = 3221225472;
            v12[2] = __60__RBAssertionManager__lock_clearStartTimesForUnbusyTargets___block_invoke;
            v12[3] = &unk_2647C7EF0;
            v12[4] = &v13;
            [(RBAssertionCollection *)assertions enumerateAssertionsForTargetProcessIdentity:v9 withBlock:v12];
            if (!*((unsigned char *)v14 + 24)) {
              [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity removeObjectForKey:v9];
            }
            _Block_object_dispose(&v13, 8);
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v4 = v11;
  }
}

- (unint64_t)_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  assertions = self->_assertions;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__RBAssertionManager__lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke;
  v8[3] = &unk_2647C7EF0;
  v8[4] = &v9;
  [(RBAssertionCollection *)assertions enumerateAssertionsForTargetProcessIdentity:v4 withBlock:v8];
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __60__RBAssertionManager__lock_clearStartTimesForUnbusyTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)([v3 startPolicy] - 101) <= 2
    && [v3 isActive]
    && [v3 isValid])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __64__RBAssertionManager__lock_activateDelayedAssertionsForTargets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 startPolicy] & 0xFFFFFFFFFFFFFFFELL) == 0x66
    && ([v3 isActive] & 1) == 0
    && [v3 isValid])
  {
    id v4 = rbs_ttl_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "Activating delayed assertion %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [v3 activate];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __56__RBAssertionManager__lock_enqueueAssertionsForRemoval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeInvalidAssertions];
}

uint64_t __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didUpdateProcessStates:*(void *)(a1 + 40) completion:0];
}

- (double)eventQueue:(id)a3 remainingRuntimeForProcessIdentity:(id)a4
{
  [(RBAssertionManager *)self _remainingRuntimeForProcessIdentity:a4];
  return result;
}

- (double)eventQueue:(id)a3 startTimeForAssertion:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  [(RBAssertionManager *)self _lock_startTimeForAssertion:v6];
  double v8 = v7;

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)stateForIdentity:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(RBProcessMap *)self->_stateMap valueForIdentity:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)assertionsForOriginator:(id)a3
{
  id v3 = [(RBAssertionCollection *)self->_assertions assertionsForOriginator:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] set];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)invalidateAssertionFromOriginator:(id)a3 sync:(BOOL)a4 withIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a5;
  os_unfair_lock_lock(&self->_lock);
  double v8 = [(RBAssertionCollection *)self->_assertions assertionWithIdentifier:v7];
  if ([(NSMutableSet *)self->_acquiringAssertionIdentifiers containsObject:v7])
  {
    [(NSMutableSet *)self->_acquiringAssertionIdentifiers removeObject:v7];
    os_unfair_lock_unlock(&self->_lock);
    if (!v8)
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
LABEL_5:
    BOOL v9 = [(RBAssertionManager *)self _invalidateAssertion:v8 sync:v5];
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8) {
    goto LABEL_5;
  }
  uint64_t v10 = rbs_assertion_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring invalidation request for %{public}@ because it doesn't exist", (uint8_t *)&v12, 0xCu);
  }

  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)_invalidateAssertion:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];
    [(RBAssertionManager *)self _lock_invalidateAssertions:v7 forceSync:v4];

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    double v8 = rbs_assertion_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionManager _invalidateAssertion:sync:](v8);
    }
  }
  return v6 != 0;
}

- (void)_lock_invalidateAssertions:(id)a3 forceSync:(BOOL)a4
{
  int v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = rbs_ttl_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v12 originator];
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v12;
          __int16 v24 = 2114;
          id v25 = v14;
          _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating assertion %{public}@ from originator %{public}@", buf, 0x16u);
        }
        [v12 setInvalidationReason:3];
        uint64_t v15 = [v12 identifier];
        if ([(NSMutableSet *)self->_acquiringAssertionIdentifiers containsObject:v15])
        {
          [(NSMutableSet *)self->_acquiringAssertionIdentifiers removeObject:v15];
        }
        else
        {
          char v16 = [MEMORY[0x263EFFA08] setWithObject:v12];
          [(RBAssertionManager *)self _lock_enqueueAssertionsForRemoval:v16];

          v4 |= [v12 invalidatesSynchronously];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }

  if (v4)
  {
    long long v17 = rbs_assertion_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_INFO, "Invalidating assertions synchronously", buf, 2u);
    }

    [(RBAssertionManager *)self _lock_removeInvalidAssertions];
  }
}

- (void)_lock_enqueueAssertionsForRemoval:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(NSMutableSet *)self->_invalidAssertions count])
  {
    [(NSMutableSet *)self->_invalidAssertions unionSet:v4];
  }
  else
  {
    uint64_t v5 = [v4 count];
    [(NSMutableSet *)self->_invalidAssertions unionSet:v4];
    if (v5)
    {
      timeProvider = self->_timeProvider;
      id v7 = (void *)[MEMORY[0x263F64650] sharedBackgroundWorkloop];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__RBAssertionManager__lock_enqueueAssertionsForRemoval___block_invoke;
      v8[3] = &unk_2647C7CC8;
      v8[4] = self;
      [(RBTimeProviding *)timeProvider executeAfter:v7 onQueue:v8 block:0.1];
    }
  }
}

uint64_t __56__RBAssertionManager__lock_setState_forProcessIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didBeginTrackingStateForProcessIdentity:*(void *)(a1 + 40)];
}

uint64_t __39__RBAssertionManager_processDidLaunch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "assertionManager:didAddProcess:withState:");
}

- (void)processDidLaunch:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v6 = [v4 identity];
  os_unfair_lock_lock(&self->_lock);
  if ([(RBProcessIndex *)self->_processIndex addProcess:v4])
  {
    id v7 = [(RBProcessMap *)self->_stateMap valueForIdentity:v6];
    if (!v7)
    {
      id v7 = [[RBProcessState alloc] initWithIdentity:v6];
      [(RBAssertionManager *)self _lock_setState:v7 forProcessIdentity:v6];
    }
    long long v20 = &self->_lock;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v21 = v6;
    uint64_t v22 = self;
    uint64_t v8 = -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v6, v7);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v14 setTargetProcessForAbstract:v4];
          if (!v11)
          {
            uint64_t v11 = [MEMORY[0x263EFF9C0] set];
          }
          uint64_t v15 = rbs_assertion_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v4;
            __int16 v32 = 2112;
            id v33 = v14;
            _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "%@: applying persistent assertion '%@'", buf, 0x16u);
          }

          [v11 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    self = v22;
    calloutQueue = v22->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__RBAssertionManager_processDidLaunch___block_invoke;
    block[3] = &unk_2647C7A08;
    block[4] = v22;
    id v24 = v4;
    id v25 = v19;
    id v17 = v19;
    dispatch_async(calloutQueue, block);

    if (v11)
    {
      long long v18 = [MEMORY[0x263EFFA08] set];
      [(RBAssertionManager *)v22 _lock_removeAssertions:v18 andUpdateChangedAssertions:v11];
    }
    p_os_unfair_lock_t lock = v20;
    id v6 = v21;
  }
  else
  {
    uint64_t v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  dispatch_sync((dispatch_queue_t)self->_calloutQueue, &__block_literal_global_69);
  [(RBAssertionManager *)self _acquireUnderlyingAssertionForProcess:v4];
}

- (void)_removeInvalidAssertions
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(RBAssertionManager *)self _lock_removeInvalidAssertions];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_removeInvalidAssertions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = rbs_assertion_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(NSMutableSet *)self->_invalidAssertions count];
    int v6 = 134349056;
    uint64_t v7 = v4;
    _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_INFO, "Processing invalidation queue with %{public}lu assertions", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = (void *)[(NSMutableSet *)self->_invalidAssertions copy];
  [(RBAssertionManager *)self _lock_removeAssertions:v5 andUpdateChangedAssertions:0];

  [(NSMutableSet *)self->_invalidAssertions removeAllObjects];
}

- (void)_lock_removeAssertions:(id)a3 andUpdateChangedAssertions:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v7 = [(RBAssertionManager *)self _lock_deactivateAssertions:v11];
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  if ([v7 count]) {
    [v8 unionSet:v7];
  }
  if ([v6 count]) {
    [v8 unionSet:v6];
  }
  uint64_t v9 = (void *)[v11 mutableCopy];
  uint64_t v10 = [(RBAssertionManager *)self _lock_updateStatesDueToChangingAssertions:v8 invalidatedAssertions:v9];
  [(RBAssertionManager *)self _lock_finalizeRemovingAssertions:v9];
  [(RBAssertionManager *)self _lock_notifyDelegateOfInvalidatedAssertions:v9];
  [(RBAssertionManager *)self _lock_notifyDelegateOfProcessStateChangeSet:v10];
}

- (void)_lock_notifyDelegateOfProcessStateChangeSet:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke;
  v6[3] = &unk_2647C7B98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_226AB3000, "state notification", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

- (void)_lock_notifyDelegateOfInvalidatedAssertions:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__RBAssertionManager__lock_notifyDelegateOfInvalidatedAssertions___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

- (void)_acquireUnderlyingAssertionForProcess:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__1;
  id v31 = __Block_byref_object_dispose__1;
  id v32 = [v4 underlyingAssertion];
  if (!v28[5])
  {
    id v5 = [v4 identity];
    int v6 = [v5 isApplication];

    if (v6)
    {
      if (!os_variant_has_internal_content()
        || ([v4 identity],
            id v7 = objc_claimAutoreleasedReturnValue(),
            [v7 embeddedApplicationIdentifier],
            id v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v8 hasPrefix:@"com.apple.runningboard.test"],
            v8,
            v7,
            (v9 & 1) == 0))
      {
        uint64_t v10 = (void *)v28[5];
        v28[5] = @"defaultUnderlyingAppAssertion";

        id v11 = rbs_assertion_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v4;
          _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "Using default underlying assertion for app: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  if (v28[5])
  {
    uint64_t v12 = [v4 auditToken];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      uint64_t v22 = rbs_assertion_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[RBAssertionManager _acquireUnderlyingAssertionForProcess:]();
      }
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x263F64410];
      uint64_t v15 = [MEMORY[0x263F64418] identifierWithClientPid:getpid()];
      char v16 = (void *)MEMORY[0x263F64630];
      id v17 = [v4 identifier];
      long long v18 = [v16 targetWithProcessIdentifier:v17];
      long long v19 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.underlying" name:v28[5]];
      v33[0] = v19;
      long long v20 = [MEMORY[0x263F643C8] attributeWithCompletionPolicy:1];
      v33[1] = v20;
      long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
      uint64_t v22 = [v14 descriptorWithIdentifier:v15 target:v18 explanation:@"RB Underlying Assertion" attributes:v21];

      uint64_t v23 = +[RBAssertionAcquisitionContext contextForProcess:v4 withDescriptor:v22 daemonContext:self->_daemonContext];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke;
      v24[3] = &unk_2647C7F18;
      id v25 = v4;
      long long v26 = &v27;
      [(RBAssertionManager *)self acquireAssertionWithContext:v23 completion:v24];
    }
  }
  _Block_object_dispose(&v27, 8);
}

void __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 24));
  if ([*(id *)(a1 + 40) hasChanges])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 16);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke_2;
    v4[3] = &unk_2647C7B98;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

- (id)limitationsForInstance:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F645B0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 identity];

  [(RBAssertionManager *)self _remainingRuntimeForProcessIdentity:v7];
  objc_msgSend(v6, "setRunTime:");

  return v6;
}

void __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke_2;
  v5[3] = &unk_2647C7B98;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(v2, v5);
}

uint64_t __69__RBAssertionManager__lock_removeStateForProcessIdentityIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didEndTrackingStateForProcessIdentity:*(void *)(a1 + 40)];
}

uint64_t __42__RBAssertionManager_processDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "assertionManager:didRemoveProcess:withState:");
}

- (void)processDidTerminate:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v4 = (RBProcessState *)a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ([(RBProcessIndex *)self->_processIndex containsProcess:v4])
  {
    [(NSMutableSet *)self->_inFlightTerminations addObject:v4];
    id v35 = [(RBProcessState *)v4 identity];
    uint64_t v6 = [(RBProcessState *)v4 identifier];
    uint64_t v7 = rbs_process_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v50 = v4;
      _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "Removing assertions for terminated process: %{public}@", buf, 0xCu);
    }
    double v34 = v4;

    id v8 = (void *)MEMORY[0x263EFF9C0];
    id v33 = (void *)v6;
    char v9 = [(RBAssertionCollection *)self->_assertions assertionsForOriginator:v6];
    uint64_t v10 = [v8 setWithSet:v9];

    id v11 = [MEMORY[0x263EFF9C0] set];
    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    BOOL v13 = NSNumber;
    [(RBTimeProviding *)self->_timeProvider currentTime];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v20 startPolicy] == 3)
          {
            [(NSMapTable *)self->_originatorExitTimesByAssertion setObject:v14 forKey:v20];
            [v20 activate];
            [v12 addObject:v20];
            long long v21 = rbs_ttl_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = [v20 identifier];
              *(_DWORD *)buf = 138543362;
              long long v50 = v22;
              _os_log_impl(&dword_226AB3000, v21, OS_LOG_TYPE_DEFAULT, "Activating after-originator-exit assertion %{public}@", buf, 0xCu);
            }
          }
          else
          {
            [v20 setInvalidationReason:1];
            [v11 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v17);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v23 = [(RBAssertionCollection *)self->_assertions assertionsForTargetIdentity:v35];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          if (([v28 isPersistent] & 1) == 0)
          {
            [v28 setInvalidationReason:1];
            [v11 addObject:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v25);
    }

    [(RBAssertionManager *)self _lock_removeAssertions:v11 andUpdateChangedAssertions:v12];
    [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity removeObjectForKey:v35];
    uint64_t v29 = [(RBProcessMap *)self->_stateMap valueForIdentity:v35];
    if (!v29) {
      uint64_t v29 = [[RBProcessState alloc] initWithIdentity:v35];
    }
    uint64_t v30 = rbs_process_log();
    uint64_t v4 = v34;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      long long v50 = v29;
      _os_log_impl(&dword_226AB3000, v30, OS_LOG_TYPE_INFO, "Resolved state for exited process: %{public}@", buf, 0xCu);
    }

    [(RBProcessIndex *)self->_processIndex removeProcess:v34];
    [(NSMutableSet *)self->_inFlightTerminations removeObject:v34];
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__RBAssertionManager_processDidTerminate___block_invoke;
    block[3] = &unk_2647C7A08;
    block[4] = self;
    long long v37 = v34;
    long long v38 = v29;
    id v32 = v29;
    dispatch_async(calloutQueue, block);
    [(RBAssertionManager *)self _lock_removeStateForProcessIdentityIfNecessary:v35];

    p_os_unfair_lock_t lock = &self->_lock;
  }
  [(NSMapTable *)self->_savedEndowments removeObjectForKey:v4];
  os_unfair_lock_unlock(p_lock);
}

- (RBSystemState)systemState
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(RBSystemState *)self->_systemState copy];
  os_unfair_lock_unlock(p_lock);
  return (RBSystemState *)v4;
}

+ (id)sharedWorkloop
{
  if (sharedWorkloop_onceToken != -1) {
    dispatch_once(&sharedWorkloop_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)sharedWorkloop_workloop;
  return v2;
}

void __36__RBAssertionManager_sharedWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("RBAssertionManager");
  v1 = (void *)sharedWorkloop_workloop;
  sharedWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  uint64_t v2 = sharedWorkloop_workloop;
  dispatch_activate(v2);
}

- (void)periodicRunningProcessDump
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__RBAssertionManager_periodicRunningProcessDump__block_invoke;
  block[3] = &unk_2647C7CC8;
  block[4] = self;
  if (periodicRunningProcessDump_onceToken != -1) {
    dispatch_once(&periodicRunningProcessDump_onceToken, block);
  }
}

void __48__RBAssertionManager_periodicRunningProcessDump__block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("RBRunningProcessDump", v2);
  uint64_t v4 = (void *)periodicRunningProcessDump_periodicQueue;
  periodicRunningProcessDump_periodicQueue = (uint64_t)v3;

  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)periodicRunningProcessDump_periodicQueue);
  uint64_t v6 = (void *)periodicRunningProcessDump_periodicSource;
  periodicRunningProcessDump_periodicSource = (uint64_t)v5;

  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __48__RBAssertionManager_periodicRunningProcessDump__block_invoke_2;
  handler[3] = &unk_2647C7CC8;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)periodicRunningProcessDump_periodicSource, handler);
  dispatch_activate((dispatch_object_t)periodicRunningProcessDump_periodicSource);
  uint64_t v7 = periodicRunningProcessDump_periodicSource;
  dispatch_time_t v8 = dispatch_time(0, 1800000000000);
  dispatch_source_set_timer(v7, v8, 0x1A3185C5000uLL, 0x29E8D60800uLL);
}

void __48__RBAssertionManager_periodicRunningProcessDump__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)(a1 + 32) + 64) allValue];
  uint64_t v2 = rbs_process_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "Periodic Run States >>>>>", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138543362;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        char v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "preventSuspend", v13, (void)v14))
        {
          uint64_t v10 = rbs_process_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = [v9 debugDescription];
            *(_DWORD *)buf = v13;
            long long v19 = v11;
            _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Periodic Run States %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v12 = rbs_process_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEFAULT, "Periodic Run States <<<<<", buf, 2u);
  }
}

- (RBAssertionManager)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBAssertionManager.m" lineNumber:159 description:@"-init is not allowed on RBAssertionManager"];

  return 0;
}

- (RBAssertionManager)initWithDelegate:(id)a3 bundlePropertiesManager:(id)a4 originatorPidStore:(id)a5 assertionDescriptorValidator:(id)a6 timeProvider:(id)a7 daemonContext:(id)a8 maxOperationsInFlight:(unint64_t)a9 maxAssertionsPerOriginator:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v76 = a6;
  id obj = a7;
  id v20 = a7;
  id v75 = a8;
  id v21 = a8;
  v77.receiver = self;
  v77.super_class = (Class)RBAssertionManager;
  uint64_t v22 = [(RBAssertionManager *)&v77 init];
  if (!v22) {
    goto LABEL_10;
  }
  if (v17)
  {
    if (v18) {
      goto LABEL_4;
    }
LABEL_12:
    id v72 = v21;
    uint64_t v64 = [MEMORY[0x263F08690] currentHandler];
    [v64 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 173, @"Invalid parameter not satisfying: %@", @"bundlePropertiesManager" object file lineNumber description];

    id v21 = v72;
    if (v19) {
      goto LABEL_5;
    }
LABEL_13:
    id v73 = v21;
    v65 = [MEMORY[0x263F08690] currentHandler];
    [v65 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 174, @"Invalid parameter not satisfying: %@", @"originatorPidStore" object file lineNumber description];

    id v21 = v73;
    goto LABEL_5;
  }
  id v71 = v21;
  v63 = [MEMORY[0x263F08690] currentHandler];
  [v63 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 172, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

  id v21 = v71;
  if (!v18) {
    goto LABEL_12;
  }
LABEL_4:
  if (!v19) {
    goto LABEL_13;
  }
LABEL_5:
  id v69 = v18;
  if (!v76)
  {
    uint64_t v66 = [MEMORY[0x263F08690] currentHandler];
    [v66 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 175, @"Invalid parameter not satisfying: %@", @"validator" object file lineNumber description];
  }
  id v70 = v17;
  if (!v21)
  {
    v67 = [MEMORY[0x263F08690] currentHandler];
    [v67 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 176, @"Invalid parameter not satisfying: %@", @"daemonContext" object file lineNumber description];
  }
  v22->_lock._os_unfair_lock_opaque = 0;
  uint64_t v23 = +[RBAssertionManager sharedWorkloop];
  workloop = v22->_workloop;
  v22->_workloop = (OS_dispatch_queue *)v23;

  uint64_t v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v26 = dispatch_queue_create("RBAssertionManagerCallOut", v25);
  calloutQueue = v22->_calloutQueue;
  v22->_calloutQueue = (OS_dispatch_queue *)v26;

  objc_storeStrong((id *)&v22->_delegate, a3);
  objc_storeStrong((id *)&v22->_bundlePropertiesManager, a4);
  objc_storeStrong((id *)&v22->_descriptorValidator, a6);
  objc_storeStrong((id *)&v22->_originatorPidStore, a5);
  objc_storeStrong((id *)&v22->_timeProvider, obj);
  v22->_unint64_t maxOperationsInFlight = a9;
  v22->_unint64_t maxAssertionsPerOriginator = a10;
  objc_storeStrong((id *)&v22->_daemonContext, v75);
  long long v28 = objc_alloc_init(RBAssertionCollection);
  assertions = v22->_assertions;
  v22->_assertions = v28;

  uint64_t v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  pluginHoldsForAssertions = v22->_pluginHoldsForAssertions;
  v22->_pluginHoldsForAssertions = v30;

  id v32 = objc_alloc_init(RBProcessIndex);
  processIndex = v22->_processIndex;
  v22->_processIndex = v32;

  double v34 = objc_alloc_init(RBProcessMap);
  stateMap = v22->_stateMap;
  v22->_stateMap = v34;

  uint64_t v36 = [MEMORY[0x263EFF9A0] dictionary];
  relativeStartTimesByTargetIdentity = v22->_relativeStartTimesByTargetIdentity;
  v22->_relativeStartTimesByTargetIdentity = (NSMutableDictionary *)v36;

  uint64_t v38 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  originatorExitTimesByAssertion = v22->_originatorExitTimesByAssertion;
  v22->_originatorExitTimesByAssertion = (NSMapTable *)v38;

  uint64_t v40 = [MEMORY[0x263EFF9A0] dictionary];
  originatorToInFlightOperationsCountMap = v22->_originatorToInFlightOperationsCountMap;
  v22->_originatorToInFlightOperationsCountMap = (NSMutableDictionary *)v40;

  long long v42 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
  inFlightAssertionTargets = v22->_inFlightAssertionTargets;
  v22->_inFlightAssertionTargets = v42;

  v22->_inFlightOperationsLock._os_unfair_lock_opaque = 0;
  long long v44 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  inFlightTerminations = v22->_inFlightTerminations;
  v22->_inFlightTerminations = v44;

  long long v46 = [[RBAssertionManagerEventQueue alloc] initWithTimeProvider:v20];
  eventQueue = v22->_eventQueue;
  v22->_eventQueue = v46;

  [(RBAssertionManagerEventQueue *)v22->_eventQueue setDelegate:v22];
  uint64_t v48 = [MEMORY[0x263EFF9C0] set];
  assertionTargets = v22->_assertionTargets;
  v22->_assertionTargets = (NSMutableSet *)v48;

  uint64_t v50 = [MEMORY[0x263EFF9C0] set];
  acquiringAssertionIdentifiers = v22->_acquiringAssertionIdentifiers;
  v22->_acquiringAssertionIdentifiers = (NSMutableSet *)v50;

  uint64_t v52 = [MEMORY[0x263EFF9C0] set];
  invalidAssertions = v22->_invalidAssertions;
  v22->_invalidAssertions = (NSMutableSet *)v52;

  uint64_t v54 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  savedEndowments = v22->_savedEndowments;
  v22->_savedEndowments = (NSMapTable *)v54;

  v56 = objc_alloc_init(RBAssertionStateResolver);
  stateResolver = v22->_stateResolver;
  v22->_stateResolver = v56;

  [(RBAssertionStateResolver *)v22->_stateResolver setAssertionCollection:v22->_assertions];
  [(RBAssertionStateResolver *)v22->_stateResolver setProcessIndex:v22->_processIndex];
  [(RBAssertionStateResolver *)v22->_stateResolver setStateMap:v22->_stateMap];
  id v58 = v22->_stateResolver;
  uint64_t v59 = [v21 domainAttributeManager];
  [(RBAssertionStateResolver *)v58 setDomainAttributeManager:v59];

  [(RBAssertionStateResolver *)v22->_stateResolver setBundlePropertiesManager:v22->_bundlePropertiesManager];
  uint64_t v60 = v22->_stateResolver;
  uint64_t v61 = [(RBDaemonContextProviding *)v22->_daemonContext entitlementManager];
  [(RBAssertionStateResolver *)v60 setEntitlementManager:v61];

  [(RBAssertionStateResolver *)v22->_stateResolver setSavedEndowments:v22->_savedEndowments];
  [(RBAssertionManager *)v22 periodicRunningProcessDump];
  id v18 = v69;
  id v17 = v70;
LABEL_10:

  return v22;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  unint64_t v5 = [(RBAssertionCollection *)self->_assertions count];
  uint64_t v6 = [(RBSystemState *)self->_systemState debugDescription];
  unint64_t v7 = [(RBAssertionManagerEventQueue *)self->_eventQueue count];
  dispatch_time_t v8 = [(RBProcessMap *)self->_stateMap dictionary];
  char v9 = [v8 entriesToStringWithIndent:1 debug:1];
  uint64_t v10 = (void *)[v3 initWithFormat:@"<%@| assertionCount:%lu systemState:%@ eventQueueCount:%lu processStates:{\n%@}>", v4, v5, v6, v7, v9];

  return (NSString *)v10;
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_56(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = rbs_process_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "Resuming connection from %{public}@", (uint8_t *)&v4, 0xCu);
  }

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
}

- (BOOL)invalidateAssertionFromOriginator:(id)a3 withIdentifier:(id)a4
{
  return [(RBAssertionManager *)self invalidateAssertionFromOriginator:a3 sync:0 withIdentifier:a4];
}

- (BOOL)invalidateAssertionWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"RBAssertionManager.m", 429, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(RBAssertionCollection *)self->_assertions assertionWithIdentifier:v5];
  if ([(NSMutableSet *)self->_acquiringAssertionIdentifiers containsObject:v5]) {
    [(NSMutableSet *)self->_acquiringAssertionIdentifiers removeObject:v5];
  }
  os_unfair_lock_unlock(&self->_lock);
  BOOL v7 = [(RBAssertionManager *)self invalidateAssertion:v6];

  return v7;
}

- (BOOL)invalidateAssertion:(id)a3
{
  return [(RBAssertionManager *)self _invalidateAssertion:a3 sync:0];
}

- (BOOL)invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(RBProcessIndex *)self->_processIndex processForIdentifier:v4];
  BOOL v7 = [v6 identity];
  if (v7)
  {
    uint64_t v23 = v6;
    uint64_t v22 = [(RBProcessMap *)self->_stateMap valueForIdentity:v7];
    uint64_t v8 = [v22 role];
    char v9 = [MEMORY[0x263EFF9C0] set];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = [(RBAssertionCollection *)self->_assertions assertionsForTargetIdentity:v7];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v15 maxCPUUsageViolationPolicyForRole:v8] == 1)
          {
            [v15 setInvalidationReason:5];
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v12);
    }

    long long v16 = rbs_process_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v4 pid];
      uint64_t v18 = [v9 count];
      *(_DWORD *)buf = 67240448;
      int v29 = v17;
      __int16 v30 = 2050;
      uint64_t v31 = v18;
      _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}d violated CPU limit; removing %{public}lu assertions",
        buf,
        0x12u);
    }

    uint64_t v19 = [v9 count];
    BOOL v20 = v19 != 0;
    uint64_t v6 = v23;
    p_os_unfair_lock_t lock = &self->_lock;
    if (v19) {
      [(RBAssertionManager *)self _lock_enqueueAssertionsForRemoval:v9];
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v20;
}

- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(RBAssertionStateResolver *)self->_stateResolver assertionDescriptorsWithFlattenedAttributes:v3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)hasAssertionWithIdentifier:(id)a3
{
  BOOL v3 = [(RBAssertionCollection *)self->_assertions assertionWithIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isProcessForeground:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ([(RBProcessIndex *)self->_processIndex containsProcess:v4])
  {
    uint64_t v6 = [v4 identity];
    BOOL v7 = [(RBAssertionCollection *)self->_assertions assertionsForTargetIdentity:v6];
    os_unfair_lock_unlock(p_lock);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      uint64_t v12 = *MEMORY[0x263F646F0];
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v15 = [v14 inheritances];
          long long v16 = [v15 allNamespaces];

          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                if ([*(id *)(*((void *)&v24 + 1) + 8 * j) isEqual:v12])
                {

                  BOOL v21 = 1;
                  goto LABEL_23;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v23;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        BOOL v21 = 0;
      }
      while (v10);
    }
    else
    {
      BOOL v21 = 0;
    }
LABEL_23:
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v6 = rbs_process_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionManager isProcessForeground:]();
    }
    BOOL v21 = 0;
  }

  return v21;
}

- (id)processForIdentity:(id)a3
{
  return [(RBProcessIndex *)self->_processIndex processForIdentity:a3];
}

- (void)revalidateAssertionsForProcessIdentities:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        assertions = self->_assertions;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __63__RBAssertionManager_revalidateAssertionsForProcessIdentities___block_invoke;
        v13[3] = &unk_2647C7E08;
        void v13[4] = self;
        v13[5] = v10;
        id v14 = v5;
        [(RBAssertionCollection *)assertions enumerateAssertionsForTargetProcessIdentity:v10 withBlock:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(RBAssertionManager *)self _lock_removeAssertions:v5 andUpdateChangedAssertions:0];
  os_unfair_lock_unlock(&self->_lock);
}

void __63__RBAssertionManager_revalidateAssertionsForProcessIdentities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  id v5 = [v3 target];
  uint64_t v6 = (void *)MEMORY[0x263F64410];
  uint64_t v7 = [v5 createRBSTarget];
  uint64_t v8 = [v3 explanation];
  uint64_t v9 = [v3 attributes];
  id v32 = (void *)v4;
  uint64_t v10 = [v6 descriptorWithIdentifier:v4 target:v7 explanation:v8 attributes:v9];

  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 56) processForIdentity:*(void *)(a1 + 40)];
  uint64_t v12 = [v11 identifier];
  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 64) valueForIdentity:*(void *)(a1 + 40)];
  id v14 = [v3 originator];
  long long v29 = [v14 identity];
  uint64_t v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "valueForIdentity:");
  long long v16 = +[RBAssertionDescriptorValidatorContext context];
  long long v31 = (void *)v10;
  [v16 setAssertionDescriptor:v10];
  [v16 setOriginatorState:v15];
  [v16 setOriginatorProcess:v14];
  long long v28 = (void *)v15;
  [v16 setOriginatorState:v15];
  long long v17 = [*(id *)(*(void *)(a1 + 32) + 152) entitlementManager];
  long long v18 = [v17 entitlementsForProcess:v14];
  [v16 setOriginatorEntitlements:v18];

  [v16 setTarget:v5];
  [v16 setTargetProcess:v11];
  [v16 setTargetIdentity:*(void *)(a1 + 40)];
  long long v30 = (void *)v12;
  [v16 setTargetIdentifier:v12];
  [v16 setTargetState:v13];
  uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 152) entitlementManager];
  uint64_t v20 = [v19 entitlementsForProcess:v11];
  [v16 setTargetEntitlements:v20];

  BOOL v21 = objc_msgSend(*(id *)(a1 + 32), "_lock_savedEndowmentsForProcess:", v14);
  [v16 setSavedEndowments:v21];

  uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 152) entitlementManager];
  [v16 setEntitlementManager:v22];

  [v16 setBundlePropertiesManager:*(void *)(*(void *)(a1 + 32) + 120)];
  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 152) domainAttributeManager];
  [v16 setDomainAttributeManager:v23];

  [v16 setSystemState:*(void *)(*(void *)(a1 + 32) + 224)];
  long long v24 = *(void **)(*(void *)(a1 + 32) + 128);
  id v33 = 0;
  LODWORD(v12) = [v24 isAssertionValidForContext:v16 error:&v33];
  id v25 = v33;
  long long v26 = rbs_assertion_log();
  long long v27 = v26;
  if (v12)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v3;
      _os_log_impl(&dword_226AB3000, v27, OS_LOG_TYPE_INFO, "Assertion %{public}@ revalidated correctly", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v3;
      _os_log_impl(&dword_226AB3000, v27, OS_LOG_TYPE_DEFAULT, "Assertion %{public}@ is invalid because its target's properties have changed", buf, 0xCu);
    }

    [v3 setInvalidationReason:6];
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6
{
  daemonContext = self->_daemonContext;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  id v14 = [v13 attributesForDomain:v12 andName:v11 context:v10 withError:a6];

  return v14;
}

- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  uint64_t v9 = [v8 originatorEntitlementsForDomain:v7 andName:v6];

  return v9;
}

- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  uint64_t v9 = [v8 endowmentNamespaceForDomain:v7 andName:v6];

  return v9;
}

- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  char v9 = [v8 containsAttributeWithDomain:v7 andName:v6];

  return v9;
}

- (id)allEntitlements
{
  uint64_t v2 = [(RBDaemonContextProviding *)self->_daemonContext domainAttributeManager];
  id v3 = [v2 allEntitlements];

  return v3;
}

- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5
{
  daemonContext = self->_daemonContext;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  char v12 = [v11 areTargetPropertiesValidForContext:v10 forAttributeWithDomain:v9 andName:v8];

  return v12;
}

- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  id v9 = [v8 additionalRestrictionsForDomain:v7 andName:v6];

  return v9;
}

- (id)restrictionsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  id v9 = [v8 restrictionsForDomain:v7 andName:v6];

  return v9;
}

- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RBDaemonContextProviding *)daemonContext domainAttributeManager];
  id v9 = [v8 targetEntitlementsForDomain:v7 andName:v6];

  return v9;
}

- (void)eventQueue:(id)a3 handleAssertionsExpirationWarningEventForProcessIdentity:(id)a4 expirationTime:(double)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  id v8 = a4;
  os_unfair_lock_lock(p_lock);
  id v9 = [(RBProcessIndex *)self->_processIndex processForIdentity:v8];

  if (v9)
  {
    id v10 = rbs_process_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v16 = v9;
      _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Assertions for process will expire soon: %{public}@", buf, 0xCu);
    }

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__RBAssertionManager_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime___block_invoke;
    block[3] = &unk_2647C7E30;
    block[4] = self;
    id v13 = v9;
    double v14 = a5;
    dispatch_async(calloutQueue, block);
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __105__RBAssertionManager_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "assertionManager:willExpireAssertionsSoonForProcess:expirationTime:", *(double *)(a1 + 48));
}

- (void)eventQueue:(id)a3 handleWarningEventForAssertion:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(RBAssertionCollection *)self->_assertions hasAssertion:v5])
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__RBAssertionManager_eventQueue_handleWarningEventForAssertion___block_invoke;
    v7[3] = &unk_2647C7B98;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(calloutQueue, v7);
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __64__RBAssertionManager_eventQueue_handleWarningEventForAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) willInvalidateAssertion:*(void *)(a1 + 40)];
}

- (void)eventQueue:(id)a3 handleInvalidationEventForAssertion:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([v6 isValid])
  {
    [v6 setInvalidationReason:4];
    id v5 = [MEMORY[0x263EFFA08] setWithObject:v6];
    [(RBAssertionManager *)self _lock_enqueueAssertionsForRemoval:v5];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stateCaptureTitle
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_lock_originatorIdentifiersInAssertions:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "originator", (void)v13);
        id v11 = [v10 identifier];

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_lock_dumpAssertionsForTarget:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(RBAssertionManager *)self _lock_sortedAssertionsForTarget:v4];
  uint64_t v17 = [v5 count];
  uint64_t v6 = rbs_assertion_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_INFO, "%{public}@ has %lu targeting assertions. Debug log lines of their details follow.", buf, 0x16u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = rbs_assertion_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          ++v9;
          long long v14 = [v12 identifier];
          long long v15 = [v12 explanation];
          long long v16 = [v12 attributes];
          *(_DWORD *)buf = 138544642;
          id v24 = v4;
          __int16 v25 = 2048;
          uint64_t v26 = v9;
          __int16 v27 = 2048;
          uint64_t v28 = v17;
          __int16 v29 = 2114;
          long long v30 = v14;
          __int16 v31 = 2114;
          id v32 = v15;
          __int16 v33 = 2114;
          uint64_t v34 = v16;
          _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_INFO, "%{public}@ assertion details %lu/%lu. ID:%{public}@ Explanation:\"%{public}@\" Attributes:\n%{public}@", buf, 0x3Eu);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v35 count:16];
    }
    while (v8);
  }
}

- (id)_lock_sortedAssertionsForTarget:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  uint64_t v6 = [(RBAssertionCollection *)self->_assertions assertionsForTargetIdentity:v5];

  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_84_0];

  return v8;
}

uint64_t __54__RBAssertionManager__lock_sortedAssertionsForTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v6, "count"));
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v5 identifier];

  uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "count"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (void)_dumpAssertions
{
  timeProvider = self->_timeProvider;
  id v4 = dispatch_get_global_queue(17, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__RBAssertionManager__dumpAssertions__block_invoke;
  v5[3] = &unk_2647C7CC8;
  void v5[4] = self;
  [(RBTimeProviding *)timeProvider executeAfter:v4 onQueue:v5 block:600.0];
}

void __37__RBAssertionManager__dumpAssertions__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 192) copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "_lock_dumpAssertionsForTarget:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 32) _dumpAssertions];
}

uint64_t __41__RBAssertionManager__lock_addAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dumpAssertions];
}

- (void)_lock_checkAssertionToInvalidateByCondition:(id)a3 condition:(id)a4 currentValue:(id)a5 assertionsToInvalidate:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v16 isActive])
  {
    char v12 = [v16 intransientState];
    uint64_t v13 = [v12 invalidatesOnConditions];
    long long v14 = [v13 objectForKey:v9];

    if (v14)
    {
      if (!v10) {
        -[RBAssertionManager _lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:]();
      }
      uint64_t v15 = [v10 integerValue];
      if (v15 > [v14 integerValue])
      {
        [v11 addObject:v16];
        [v16 setInvalidationReason:8];
      }
    }
  }
}

uint64_t __78__RBAssertionManager__lock_invalidateAssertionByConditions_changedAssertions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t __43__RBAssertionManager__lock_setSystemState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didResolveSystemState:*(void *)(a1 + 40)];
}

- (double)_lock_relativeStartTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(RBTimeProviding *)self->_timeProvider currentTime];
  double v6 = v5;
  uint64_t v7 = [v4 target];
  long long v8 = [v7 identity];

  if (v8)
  {
    if (([v4 isActive] & 1) != 0
      || ![(RBAssertionManager *)self _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:v8])
    {
      id v10 = [(NSMutableDictionary *)self->_relativeStartTimesByTargetIdentity objectForKeyedSubscript:v8];
      id v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        double v6 = v12;
      }
    }
    else
    {
      [(RBTimeProviding *)self->_timeProvider currentTime];
      double v6 = v9;
    }
  }

  return v6;
}

- (void)_invalidateAssertionsWithContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF9C0] set];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v15 = v4;
  double v6 = [v4 identifiersToInvalidate];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v12 = -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v11, lock);
        if (v12)
        {
          [v5 addObject:v12];
        }
        else if ([(NSMutableSet *)self->_acquiringAssertionIdentifiers containsObject:v11])
        {
          [(NSMutableSet *)self->_acquiringAssertionIdentifiers removeObject:v11];
        }
        else
        {
          uint64_t v13 = rbs_assertion_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v11;
            _os_log_error_impl(&dword_226AB3000, v13, OS_LOG_TYPE_ERROR, "Attempt to invalidate nonexistent assertion failed for identifier %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [(RBAssertionManager *)self _lock_invalidateAssertions:v5 forceSync:0];
  }
  os_unfair_lock_unlock(lock);
}

- (void)_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__RBAssertionManager__lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

uint64_t __84__RBAssertionManager__lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didRejectAcquisitionFromOriginatorWithExcessiveAssertions:*(void *)(a1 + 40)];
}

- (BOOL)addSavedEndowment:(id)a3 forProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  savedEndowments = self->_savedEndowments;
  p_savedEndowments = (id *)&self->_savedEndowments;
  uint64_t v11 = [(NSMapTable *)savedEndowments objectForKey:v7];
  if (v11)
  {
    double v12 = (void *)v11;
    uint64_t v13 = [v6 key];
    long long v14 = [v12 objectForKey:v13];

    if (v14)
    {
      BOOL v15 = 0;
      goto LABEL_7;
    }
    long long v19 = (void *)[v12 mutableCopy];
    long long v20 = [v6 endowment];
    uint64_t v21 = [v6 key];
    [v19 setObject:v20 forKey:v21];

    id v22 = *p_savedEndowments;
    uint64_t v23 = (void *)[v19 copy];
    [v22 setObject:v23 forKey:v7];
  }
  else
  {
    long long v16 = NSDictionary;
    long long v17 = [v6 endowment];
    long long v18 = [v6 key];
    double v12 = [v16 dictionaryWithObject:v17 forKey:v18];

    [*p_savedEndowments setObject:v12 forKey:v7];
  }
  BOOL v15 = 1;
LABEL_7:
  id v24 = rbs_assertion_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[RBAssertionManager addSavedEndowment:forProcess:](p_savedEndowments, v24);
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)savedEndowmentsForProcess:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(RBAssertionManager *)self _lock_savedEndowmentsForProcess:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_invalidAssertions, 0);
  objc_storeStrong((id *)&self->_acquiringAssertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_assertionTargets, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_stateResolver, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_originatorPidStore, 0);
  objc_storeStrong((id *)&self->_descriptorValidator, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_inFlightTerminations, 0);
  objc_storeStrong((id *)&self->_inFlightAssertionTargets, 0);
  objc_storeStrong((id *)&self->_originatorToInFlightOperationsCountMap, 0);
  objc_storeStrong((id *)&self->_originatorExitTimesByAssertion, 0);
  objc_storeStrong((id *)&self->_relativeStartTimesByTargetIdentity, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_pluginHoldsForAssertions, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

- (void)commitBatchWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Suspending connection from %{public}@ because there are too many assertions in flight", v2, v3, v4, v5, v6);
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Error committing batch context %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_invalidateAssertion:(os_log_t)log sync:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Ignoring invalidation request for nil assertion", v1, 2u);
}

- (void)isProcessForeground:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "isProcessForeground called for untracked process: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:.cold.1()
{
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) processIdentities];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_fault_impl(&dword_226AB3000, a3, OS_LOG_TYPE_FAULT, "State resolution exceeded max depth, possible cycle in assertion activation, latest assertions %{public}@ and changed ids %{public}@", (uint8_t *)&v6, 0x16u);
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_2()
{
  __assert_rtn("-[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]_block_invoke", "RBAssertionManager.m", 1333, "changedAssertions == nil");
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_3()
{
  __assert_rtn("-[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]_block_invoke", "RBAssertionManager.m", 1329, "changedAssertions != nil");
}

- (void)_lock_originatorExitTimeForAssertion:.cold.1()
{
  __assert_rtn("-[RBAssertionManager _lock_originatorExitTimeForAssertion:]", "RBAssertionManager.m", 1511, "startTimeNumber != nil");
}

- (void)_acquireUnderlyingAssertionForProcess:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Not acquiring underlying assertion for %{public}@ as it has no audit token", v2, v3, v4, v5, v6);
}

void __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "Underlying assertion for %{public}@ with name %{public}@ failed to acquire with error %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)_acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:.cold.1()
{
}

- (void)addSavedEndowment:(id *)a1 forProcess:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 description];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Saved endowments: %@", v4, 0xCu);
}

@end