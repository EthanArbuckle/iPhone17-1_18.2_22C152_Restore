@interface RBAssertionResolutionContext
- (NSSet)gainedStartTimeDefining;
- (NSSet)lostStartTimeDefining;
- (NSSet)touchedAssertions;
- (RBAttributeContext)_createContextForAssertion:(void *)a1;
- (RBProcessStateChangeSet)changeSet;
- (RBSystemState)systemState;
- (id)_assertionGraphFromAssertion:(id)a3;
- (id)_inheritancesForOriginator:(id)a3;
- (id)_latestStateForIdentity:(id)a3;
- (id)_originatorInheritancesForAssertion:(id)a3;
- (void)_assertionGraphFromAssertion:(id)a3 graph:(id)a4;
- (void)_checkForSuspendableAssertionCycle:(id)a3 newState:(id)a4;
- (void)_finalizeStateChangeSet;
- (void)_resolveProcessStateForTarget:(id)a3 ofType:(unint64_t)a4 viaAssertion:(id)a5;
- (void)_resolveSystemState;
- (void)_suspendAssertionsForTarget:(id)a3;
- (void)_suspendOrResumeAssertionsForTarget:(id)a3 oldState:(id)a4 newState:(id)a5;
- (void)_updateStatesForAssertion:(id)a3;
- (void)initWithAssertions:(void *)a1;
- (void)resolve;
- (void)setAssertionCollection:(uint64_t)a1;
- (void)setBundlePropertiesManager:(uint64_t)a1;
- (void)setDomainAttributeManager:(uint64_t)a1;
- (void)setEntitlementManager:(uint64_t)a1;
- (void)setProcessIndex:(uint64_t)a1;
- (void)setSavedEndowments:(uint64_t)a1;
- (void)setStateMap:(uint64_t)a1;
- (void)setSystemState:(uint64_t)a1;
@end

@implementation RBAssertionResolutionContext

- (void)_updateStatesForAssertion:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RBAssertionResolutionContext *)self _assertionGraphFromAssertion:v4];
  v6 = (void *)MEMORY[0x263EFF9B0];
  v28 = v4;
  v7 = [v4 identifier];
  v8 = [v6 orderedSetWithObject:v7];

  v9 = [MEMORY[0x263EFF9C0] set];
  if ([v8 count])
  {
    v29 = v5;
    do
    {
      v10 = (void *)MEMORY[0x22A660FC0]();
      v11 = [v8 firstObject];
      [v8 removeObjectAtIndex:0];
      [v9 addObject:v11];
      v12 = [(RBAssertionCollection *)self->_assertionCollection assertionWithIdentifier:v11];
      v13 = [v12 originator];
      if (v12)
      {
        [(NSMutableSet *)self->_touchedAssertions addObject:v12];
        [(RBAttributeContext *)self->_attributeContext setAssertion:v12];
        attributeContext = self->_attributeContext;
        v31 = v13;
        v15 = [(RBAssertionResolutionContext *)self _inheritancesForOriginator:v13];
        [(RBAttributeContext *)attributeContext setAvailableInheritances:v15];

        v16 = self->_attributeContext;
        savedEndowments = self->_savedEndowments;
        v18 = [v12 originator];
        v19 = [(NSMapTable *)savedEndowments objectForKey:v18];
        [(RBAttributeContext *)v16 setSavedEndowments:v19];

        [(RBAttributeContext *)self->_attributeContext setSystemState:self->_systemState];
        if ([v12 resolveStateWithContext:self->_attributeContext])
        {
          if ([(RBAssertionCollection *)self->_assertionCollection hasResolvedAssertion:v12])
          {
            if ([v12 invalidationReason]) {
              uint64_t v20 = 3;
            }
            else {
              uint64_t v20 = 2;
            }
          }
          else
          {
            uint64_t v20 = 1;
          }
          v27 = [v12 target];
          [(RBAssertionResolutionContext *)self _resolveProcessStateForTarget:v27 ofType:v20 viaAssertion:v12];

          v21 = [v5 objectForKeyedSubscript:v11];
          [v8 unionSet:v21];
        }
        else
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v21 = [v5 objectForKeyedSubscript:v11];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            v30 = v10;
            uint64_t v24 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                if (([v9 containsObject:v26] & 1) == 0) {
                  [v8 addObject:v26];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
            }
            while (v23);
            v5 = v29;
            v10 = v30;
          }
        }

        [(RBAssertionCollection *)self->_assertionCollection noteResolvedAssertion:v12];
        v13 = v31;
      }
    }
    while ([v8 count]);
  }
}

- (id)_inheritancesForOriginator:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_27;
  }
  v6 = [v4 identity];
  if (![(RBProcessMap *)self->_originatorInheritances containsIdentity:v6])
  {
    if ([(RBProcessMap *)self->_resolvedState containsIdentity:v6])
    {
      v8 = [(RBProcessMap *)self->_resolvedState valueForIdentity:v6];
      id v7 = [v8 inheritances];

      id v9 = [(RBProcessMap *)self->_originatorInheritances setValue:v7 forIdentity:v6];
      goto LABEL_26;
    }
    v10 = [(RBProcessMap *)self->_stateMap valueForIdentity:v6];
    v11 = [v10 inheritances];
    if (v11)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v7 = v11;
      uint64_t v12 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v23 = v10;
        uint64_t v24 = v6;
        v14 = 0;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v7);
            }
            v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v18 = objc_msgSend(v17, "originatingIdentifier", v23);
            v19 = [(RBAssertionCollection *)self->_assertionCollection assertionWithIdentifier:v18];
            if (([v19 isActive] & 1) == 0)
            {
              if (!v14) {
                v14 = (void *)[v7 mutableCopy];
              }
              [v14 removeInheritance:v17];
            }
          }
          uint64_t v13 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);

        v10 = v23;
        if (!v14)
        {
          v6 = v24;
          goto LABEL_25;
        }
        uint64_t v20 = [v14 copy];

        id v7 = (id)v20;
        v6 = v24;
      }
      else
      {
        v14 = v7;
      }
    }
    else
    {
      id v7 = 0;
    }
LABEL_25:
    id v21 = [(RBProcessMap *)self->_originatorInheritances setValue:v7 forIdentity:v6];

    goto LABEL_26;
  }
  id v7 = [(RBProcessMap *)self->_originatorInheritances valueForIdentity:v6];
LABEL_26:

LABEL_27:
  return v7;
}

- (id)_assertionGraphFromAssertion:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionary];
  [(RBAssertionResolutionContext *)self _assertionGraphFromAssertion:v5 graph:v6];

  return v6;
}

- (void)_assertionGraphFromAssertion:(id)a3 graph:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  id v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    long long v32 = [MEMORY[0x263EFF9C0] set];
    objc_msgSend(v7, "setObject:forKeyedSubscript:");
    if ([v6 hasHereditaryGrant])
    {
      v10 = [v6 target];
      v11 = [v10 process];
      if (v11
        || (processIndex = self->_processIndex,
            [v10 identity],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            [(RBProcessIndex *)processIndex processForIdentity:v13],
            v11 = objc_claimAutoreleasedReturnValue(),
            v13,
            v11))
      {
        uint64_t v30 = v8;
        id v31 = v6;
        v29 = v10;
        v14 = [v10 environment];
        uint64_t v15 = self;
        assertionCollection = self->_assertionCollection;
        long long v28 = v11;
        v17 = [v11 identifier];
        v18 = [(RBAssertionCollection *)assertionCollection assertionsForOriginator:v17];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              long long v25 = [v24 sourceEnvironments];
              int v26 = [v25 containsObject:v14];

              if (v26)
              {
                long long v27 = [v24 identifier];
                [v32 addObject:v27];

                [(RBAssertionResolutionContext *)v15 _assertionGraphFromAssertion:v24 graph:v7];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v21);
        }

        v8 = v30;
        id v6 = v31;
        v10 = v29;
      }
    }
  }
}

- (void)_resolveProcessStateForTarget:(id)a3 ofType:(unint64_t)a4 viaAssertion:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if ([v9 isSystem]) {
    goto LABEL_27;
  }
  targetsPendingResolution = self->_targetsPendingResolution;
  if (a4 == 3)
  {
    if (!targetsPendingResolution)
    {
      uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v13 = self->_targetsPendingResolution;
      self->_targetsPendingResolution = v12;

      targetsPendingResolution = self->_targetsPendingResolution;
    }
    [(NSMutableSet *)targetsPendingResolution addObject:v9];
    goto LABEL_27;
  }
  [(NSMutableSet *)targetsPendingResolution removeObject:v9];
  v14 = [v9 identity];
  uint64_t v15 = [(RBAssertionResolutionContext *)self _latestStateForIdentity:v14];
  v16 = v15;
  if (a4 == 1)
  {
    uint64_t v17 = [v15 mutableCopy];
    if (v17)
    {
      v18 = (RBMutableProcessState *)v17;
      id v19 = [v10 processState];
      [(RBMutableProcessState *)v18 unionState:v19];

      if (!v16) {
        goto LABEL_22;
      }
LABEL_21:
      if ([(RBProcessState *)v18 isEqualToProcessStateIgnoringIdentity:v16]) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  SEL v38 = a2;
  v39 = v16;
  id v41 = v10;
  id v42 = v9;
  v18 = [(RBProcessState *)[RBMutableProcessState alloc] initWithIdentity:v14];
  v40 = v14;
  uint64_t v20 = [(RBAssertionCollection *)self->_assertionCollection assertionsForTargetIdentity:v14];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v25 isActive])
        {
          [(RBAttributeContext *)self->_attributeContext setAssertion:v25];
          attributeContext = self->_attributeContext;
          long long v27 = [(RBAssertionResolutionContext *)self _originatorInheritancesForAssertion:v25];
          [(RBAttributeContext *)attributeContext setAvailableInheritances:v27];

          long long v28 = self->_attributeContext;
          savedEndowments = self->_savedEndowments;
          uint64_t v30 = [v25 originator];
          id v31 = [(NSMapTable *)savedEndowments objectForKey:v30];
          [(RBAttributeContext *)v28 setSavedEndowments:v31];

          [(RBAttributeContext *)self->_attributeContext setSystemState:self->_systemState];
          [v25 applyToProcessState:v18 withAttributeContext:self->_attributeContext];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v22);
  }

  id v10 = v41;
  id v9 = v42;
  v16 = v39;
  v14 = v40;
  if (!v18)
  {
    uint64_t v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:v38 object:self file:@"RBAssertionStateResolver.m" lineNumber:537 description:@"cannot get this far without state"];

    if (!v39) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v39) {
    goto LABEL_21;
  }
LABEL_22:
  long long v32 = (RBMutableProcessState *)[(RBMutableProcessState *)v18 copy];

  id v33 = [(RBProcessMap *)self->_resolvedState setValue:v32 forIdentity:v14];
  originatorInheritances = self->_originatorInheritances;
  long long v35 = [(RBProcessState *)v32 inheritances];
  id v36 = [(RBProcessMap *)originatorInheritances setValue:v35 forIdentity:v14];

  [(RBAssertionResolutionContext *)self _suspendOrResumeAssertionsForTarget:v14 oldState:v16 newState:v32];
  v18 = v32;
LABEL_23:
  if ([(RBProcessState *)v18 preventSuspend]
    && [(RBProcessState *)v18 targetedBySuspendableAssertion])
  {
    [(RBAssertionResolutionContext *)self _checkForSuspendableAssertionCycle:v14 newState:v18];
  }

LABEL_27:
}

- (void)resolve
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = (void *)MEMORY[0x22A660FC0]();
    [*(id *)(a1 + 64) setDomainAttributeManager:*(void *)(a1 + 104)];
    [*(id *)(a1 + 64) setBundlePropertiesManager:*(void *)(a1 + 112)];
    [*(id *)(a1 + 64) setEntitlementManager:*(void *)(a1 + 120)];
    [*(id *)(a1 + 64) setSystemState:*(void *)(a1 + 136)];
    while ([*(id *)(a1 + 8) count])
    {
      while ([*(id *)(a1 + 8) count])
      {
        v3 = [*(id *)(a1 + 8) anyObject];
        [*(id *)(a1 + 8) removeObject:v3];
        [(id)a1 _updateStatesForAssertion:v3];
      }
      id v4 = [*(id *)(a1 + 40) allObjects];
      [*(id *)(a1 + 40) removeAllObjects];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [(id)a1 _resolveProcessStateForTarget:*(void *)(*((void *)&v10 + 1) + 8 * v9++) ofType:0 viaAssertion:0];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
    [(id)a1 _finalizeStateChangeSet];
    [(id)a1 _resolveSystemState];
  }
}

- (void)_resolveSystemState
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(RBMutableSystemState);
  assertionCollection = self->_assertionCollection;
  id v5 = +[RBConcreteTarget systemTarget];
  uint64_t v6 = [(RBAssertionCollection *)assertionCollection assertionsForTarget:v5];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
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
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "isActive", (void)v21))
        {
          [(RBAttributeContext *)self->_attributeContext setAssertion:v12];
          attributeContext = self->_attributeContext;
          v14 = [(RBAssertionResolutionContext *)self _originatorInheritancesForAssertion:v12];
          [(RBAttributeContext *)attributeContext setAvailableInheritances:v14];

          uint64_t v15 = self->_attributeContext;
          savedEndowments = self->_savedEndowments;
          uint64_t v17 = [v12 originator];
          v18 = [(NSMapTable *)savedEndowments objectForKey:v17];
          [(RBAttributeContext *)v15 setSavedEndowments:v18];

          [(RBAttributeContext *)self->_attributeContext setSystemState:self->_systemState];
          [v12 applyToSystemState:v3 withAttributeContext:self->_attributeContext];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  id v19 = (RBSystemState *)[(RBMutableSystemState *)v3 copy];
  systemState = self->_systemState;
  self->_systemState = v19;
}

- (id)_latestStateForIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RBProcessMap *)self->_resolvedState valueForIdentity:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(RBProcessMap *)self->_stateMap valueForIdentity:v4];
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_originatorInheritancesForAssertion:(id)a3
{
  id v4 = [a3 originator];
  if (v4)
  {
    id v5 = [(RBAssertionResolutionContext *)self _inheritancesForOriginator:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_finalizeStateChangeSet
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(RBProcessMap *)self->_resolvedState allIdentities];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        uint64_t v9 = [RBProcessStateChange alloc];
        uint64_t v10 = [(RBProcessMap *)self->_stateMap valueForIdentity:v8];
        long long v11 = [(RBProcessMap *)self->_resolvedState valueForIdentity:v8];
        long long v12 = [(RBProcessStateChange *)v9 initWithIdentity:v8 originalState:v10 updatedState:v11];

        [v3 addObject:v12];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  long long v13 = [[RBProcessStateChangeSet alloc] initWithChanges:v3];
  changeSet = self->_changeSet;
  self->_changeSet = v13;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (RBProcessStateChangeSet)changeSet
{
  return self->_changeSet;
}

- (NSSet)touchedAssertions
{
  return &self->_touchedAssertions->super;
}

- (NSSet)lostStartTimeDefining
{
  return &self->_lostStartTimeDefining->super;
}

- (NSSet)gainedStartTimeDefining
{
  return &self->_gainedStartTimeDefining->super;
}

- (void)initWithAssertions:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)RBAssertionResolutionContext;
    a1 = objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 mutableCopy];
      uint64_t v5 = (void *)a1[1];
      a1[1] = v4;

      id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v7 = (void *)a1[2];
      a1[2] = v6;

      id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v9 = (void *)a1[3];
      a1[3] = v8;

      id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      long long v11 = (void *)a1[4];
      a1[4] = v10;

      long long v12 = objc_alloc_init(RBProcessMap);
      long long v13 = (void *)a1[6];
      a1[6] = v12;

      v14 = objc_alloc_init(RBProcessMap);
      uint64_t v15 = (void *)a1[7];
      a1[7] = v14;

      long long v16 = objc_alloc_init(RBAttributeContext);
      long long v17 = (void *)a1[8];
      a1[8] = v16;
    }
  }

  return a1;
}

- (void)setSystemState:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void)setStateMap:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)setSavedEndowments:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)setProcessIndex:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setEntitlementManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (void)setDomainAttributeManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setBundlePropertiesManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (void)setAssertionCollection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)_suspendOrResumeAssertionsForTarget:(id)a3 oldState:(id)a4 newState:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [a4 preventSuspend];
  int v11 = [v9 preventSuspend];
  if (v10 != v11)
  {
    char v12 = v11;
    long long v13 = [(RBProcessIndex *)self->_processIndex processForIdentity:v8];
    if ([v13 isLifecycleManaged])
    {
      if (v12)
      {
        if ((v10 & 1) == 0)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          assertionCollection = self->_assertionCollection;
          uint64_t v15 = objc_msgSend(v13, "identifier", 0);
          long long v16 = [(RBAssertionCollection *)assertionCollection assertionsForOriginator:v15];

          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if ([v21 suspendsOnOriginatorSuspension])
                {
                  if ([v21 isSuspended])
                  {
                    if ([v21 isValid])
                    {
                      [v21 resume];
                      [(NSMutableSet *)self->_assertions addObject:v21];
                      if ([v21 definesRelativeStartTime])
                      {
                        long long v22 = [v21 target];
                        long long v23 = [v22 identity];

                        if (v23) {
                          [(NSMutableSet *)self->_gainedStartTimeDefining addObject:v23];
                        }
                      }
                    }
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
            }
            while (v18);
          }
        }
      }
      else
      {
        [(RBAssertionResolutionContext *)self _suspendAssertionsForTarget:v13];
      }
    }
  }
}

- (void)_checkForSuspendableAssertionCycle:(id)a3 newState:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(RBProcessIndex *)self->_processIndex processForIdentity:v5];
  if (([v6 isLifecycleManaged] & 1) == 0)
  {
    long long v16 = rbs_assertion_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    id v72 = v5;
    long long v44 = "_checkForSuspendableAssertionCycle for %{public}@ bailing out since it's not managed";
LABEL_50:
    _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_INFO, v44, buf, 0xCu);
    goto LABEL_57;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  assertionCollection = self->_assertionCollection;
  id v8 = [v6 identifier];
  id v9 = [(RBAssertionCollection *)assertionCollection assertionsForOriginator:v8];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (!v10)
  {

LABEL_48:
    long long v16 = rbs_assertion_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    id v72 = v5;
    long long v44 = "_checkForSuspendableAssertionCycle for %{public}@ bailing out since it's not holding a suspendable assertion";
    goto LABEL_50;
  }
  uint64_t v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v67;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v67 != v13) {
        objc_enumerationMutation(v9);
      }
      v12 |= [*(id *)(*((void *)&v66 + 1) + 8 * i) suspendsOnOriginatorSuspension];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v66 objects:v77 count:16];
  }
  while (v11);

  if ((v12 & 1) == 0) {
    goto LABEL_48;
  }
  id v52 = v5;
  unint64_t v15 = 0x263EFF000uLL;
  long long v16 = [MEMORY[0x263EFF980] array];
  [v16 addObject:v6];
  v53 = [MEMORY[0x263EFF9C0] set];
  while ([v16 count])
  {
    uint64_t v17 = v16;
    id v18 = [v16 copy];
    [v53 addObjectsFromArray:v16];
    long long v16 = [*(id *)(v15 + 2432) array];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v19 = v18;
    uint64_t v49 = [v19 countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (!v49) {
      goto LABEL_34;
    }
    uint64_t v20 = *(void *)v63;
    v51 = v6;
    uint64_t v47 = *(void *)v63;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v63 != v20) {
          objc_enumerationMutation(v19);
        }
        uint64_t v50 = v21;
        long long v22 = *(void **)(*((void *)&v62 + 1) + 8 * v21);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v23 = self->_assertionCollection;
        uint64_t v48 = v22;
        long long v24 = objc_msgSend(v22, "identity", v47);
        long long v25 = [(RBAssertionCollection *)v23 assertionsForTargetIdentity:v24];

        uint64_t v26 = [v25 countByEnumeratingWithState:&v58 objects:v75 count:16];
        if (!v26) {
          goto LABEL_32;
        }
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v59;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v59 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            id v31 = [v30 intransientState];
            if (![v31 preventsSuspension]) {
              goto LABEL_29;
            }
            int v32 = [v30 isActive];

            if (v32)
            {
              id v33 = [v30 originator];
              char v34 = [v33 isLifecycleManaged];

              if ((v34 & 1) == 0)
              {
                long long v45 = rbs_assertion_log();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  long long v46 = [v30 originator];
                  *(_DWORD *)buf = 138543618;
                  id v72 = v46;
                  __int16 v73 = 2114;
                  v74 = v48;
                  _os_log_impl(&dword_226AB3000, v45, OS_LOG_TYPE_INFO, "_checkForSuspendableAssertionCycle bailing out for not-manged-process (originator: %{public}@ target: %{public}@)", buf, 0x16u);
                }
                goto LABEL_55;
              }
              if (([v30 suspendsOnOriginatorSuspension] & 1) == 0)
              {
                long long v45 = rbs_assertion_log();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  id v72 = v30;
                  _os_log_impl(&dword_226AB3000, v45, OS_LOG_TYPE_INFO, "_checkForSuspendableAssertionCycle bailing out for not-suspendable assertion %{public}@", buf, 0xCu);
                }
LABEL_55:
                id v6 = v51;
                id v5 = v52;

                goto LABEL_56;
              }
              long long v35 = [v30 originator];
              char v36 = [v53 containsObject:v35];

              if ((v36 & 1) == 0)
              {
                uint64_t v37 = rbs_assertion_log();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  SEL v38 = [v30 originator];
                  *(_DWORD *)buf = 138543362;
                  id v72 = v38;
                  _os_log_impl(&dword_226AB3000, v37, OS_LOG_TYPE_DEFAULT, "found a new process to check %{public}@", buf, 0xCu);
                }
                id v31 = [v30 originator];
                [v16 addObject:v31];
LABEL_29:

                continue;
              }
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v58 objects:v75 count:16];
          if (v27) {
            continue;
          }
          break;
        }
LABEL_32:

        uint64_t v21 = v50 + 1;
        id v6 = v51;
        unint64_t v15 = 0x263EFF000;
        uint64_t v20 = v47;
      }
      while (v50 + 1 != v49);
      uint64_t v49 = [v19 countByEnumeratingWithState:&v62 objects:v76 count:16];
    }
    while (v49);
LABEL_34:
  }
  v39 = rbs_assertion_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v72 = v53;
    _os_log_impl(&dword_226AB3000, v39, OS_LOG_TYPE_DEFAULT, "Detected apparent loop in suspendable assertions with: %{public}@", buf, 0xCu);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v19 = v53;
  uint64_t v40 = [v19 countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v55 != v42) {
          objc_enumerationMutation(v19);
        }
        [(RBAssertionResolutionContext *)self _suspendAssertionsForTarget:*(void *)(*((void *)&v54 + 1) + 8 * k)];
      }
      uint64_t v41 = [v19 countByEnumeratingWithState:&v54 objects:v70 count:16];
    }
    while (v41);
  }
  id v5 = v52;
LABEL_56:

LABEL_57:
}

- (void)_suspendAssertionsForTarget:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  assertionCollection = self->_assertionCollection;
  id v5 = objc_msgSend(a3, "identifier", 0);
  id v6 = [(RBAssertionCollection *)assertionCollection assertionsForOriginator:v5];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 suspendsOnOriginatorSuspension])
        {
          if (([v11 isSuspended] & 1) == 0)
          {
            [v11 suspend];
            [(NSMutableSet *)self->_assertions addObject:v11];
            if ([v11 definesRelativeStartTime])
            {
              int v12 = [v11 target];
              uint64_t v13 = [v12 identity];

              if (v13) {
                [(NSMutableSet *)self->_lostStartTimeDefining addObject:v13];
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_assertionCollection, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_attributeContext, 0);
  objc_storeStrong((id *)&self->_originatorInheritances, 0);
  objc_storeStrong((id *)&self->_resolvedState, 0);
  objc_storeStrong((id *)&self->_targetsPendingResolution, 0);
  objc_storeStrong((id *)&self->_gainedStartTimeDefining, 0);
  objc_storeStrong((id *)&self->_lostStartTimeDefining, 0);
  objc_storeStrong((id *)&self->_touchedAssertions, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (RBAttributeContext)_createContextForAssertion:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = objc_alloc_init(RBAttributeContext);
    [(RBAttributeContext *)v4 setDomainAttributeManager:a1[13]];
    [(RBAttributeContext *)v4 setBundlePropertiesManager:a1[14]];
    [(RBAttributeContext *)v4 setEntitlementManager:a1[15]];
    [(RBAttributeContext *)v4 setAssertion:v3];
    id v5 = [a1 _originatorInheritancesForAssertion:v3];

    [(RBAttributeContext *)v4 setAvailableInheritances:v5];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

@end