@interface RBAssertion
+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6;
+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6 creationTime:(double)a7;
+ (RBAssertion)assertionWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6 originator:(id)a7 context:(id)a8;
- (BOOL)_lock_resolveStateWithContext:(uint64_t)a1;
- (BOOL)definesRelativeStartTime;
- (BOOL)hasDomainAttribute;
- (BOOL)hasHereditaryGrant;
- (BOOL)invalidatesSynchronously;
- (BOOL)isActive;
- (BOOL)isPersistent;
- (BOOL)isSuspended;
- (BOOL)isValid;
- (BOOL)resolveStateWithContext:(id)a3;
- (BOOL)suspendsOnOriginatorSuspension;
- (BOOL)terminateTargetOnOriginatorExit;
- (NSArray)attributes;
- (NSSet)sourceEnvironments;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)explanation;
- (NSString)stateCaptureTitle;
- (RBAssertionIntransientState)intransientState;
- (RBConcreteTargeting)target;
- (RBInheritanceCollection)inheritances;
- (RBProcess)originator;
- (RBProcessState)processState;
- (RBSAssertionIdentifier)identifier;
- (double)creationTime;
- (double)invalidationDuration;
- (double)warningDuration;
- (id)lock_targetProcessForAbstract;
- (id)plugInHoldToken;
- (id)terminationContextForTargetProcess:(id)a3 originatorProcessIsActive:(BOOL)a4;
- (id)updateProcessStateWithAttributeContext:(id)a3;
- (uint64_t)_exceptionCodeForAssertionTimeout;
- (uint64_t)_initWithTarget:(void *)a3 identifier:(void *)a4 explanation:(void *)a5 attributes:(void *)a6 originator:(void *)a7 context:(double)a8 creationTime:;
- (unint64_t)endPolicy;
- (unint64_t)legacyReason;
- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3;
- (unint64_t)runningReason;
- (unint64_t)startPolicy;
- (unsigned)invalidationReason;
- (void)activate;
- (void)applyToAssertionTransientState:(id)a3 withAttributeContext:(id)a4;
- (void)applyToProcessState:(id)a3 withAttributeContext:(id)a4;
- (void)applyToSystemState:(id)a3 withAttributeContext:(id)a4;
- (void)deactivate;
- (void)inheritances;
- (void)processState;
- (void)resume;
- (void)setInvalidationReason:(unsigned __int8)a3;
- (void)setPlugInHoldToken:(id)a3;
- (void)setTargetProcessForAbstract:(id)a3;
- (void)suspend;
@end

@implementation RBAssertion

- (RBProcess)originator
{
  return self->_originator;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v3 = [(RBConcreteTargeting *)self->_target isSystem];
  id targetState = self->_targetState;
  if (v3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (__CFString *)targetState;
    id targetState = 0;
  }
  v28 = v5;
  v6 = (objc_class *)NSString;
  v7 = (__CFString *)targetState;
  id v29 = [v6 alloc];
  uint64_t v8 = [(id)objc_opt_class() description];
  target = self->_target;
  identifier = self->_identifier;
  v27 = (void *)v8;
  originator = self->_originator;
  explanation = self->_explanation;
  v9 = @" transientState:";
  transientState = self->_transientState;
  intransientState = self->_intransientState;
  if (!transientState) {
    v9 = &stru_26DA9D688;
  }
  v22 = v9;
  if (transientState) {
    v12 = self->_transientState;
  }
  else {
    v12 = (RBAssertionTransientState *)&stru_26DA9D688;
  }
  if (self->_active) {
    v13 = @" active";
  }
  else {
    v13 = &stru_26DA9D688;
  }
  if (v5) {
    v14 = @" processState:";
  }
  else {
    v14 = &stru_26DA9D688;
  }
  if (v5) {
    v15 = v5;
  }
  else {
    v15 = &stru_26DA9D688;
  }
  if (v7) {
    v16 = @" systemState:";
  }
  else {
    v16 = &stru_26DA9D688;
  }
  if (v7) {
    v17 = v7;
  }
  else {
    v17 = &stru_26DA9D688;
  }
  if (self->_suspended) {
    v18 = @" suspended";
  }
  else {
    v18 = &stru_26DA9D688;
  }
  v19 = [(NSArray *)self->_attributes componentsJoinedByString:@",\n\t"];
  v20 = (void *)[v29 initWithFormat:@"<%@| identifier:%@ target:%@ explanation:\"%@\"%@ originator:%@%@%@ intransientState:%@%@%@%@%@ suspended:%@ attributes:[\n\t%@\n\t]>", v27, identifier, target, explanation, v13, originator, v22, v12, intransientState, v14, v15, v16, v17, v18, v19];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v20;
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)resolveStateWithContext:(id)a3
{
  char v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  LOBYTE(v3) = -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)hasHereditaryGrant
{
  return [(RBAssertionIntransientState *)self->_intransientState hasHereditaryGrant];
}

- (BOOL)isActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_active && !self->_suspended;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)invalidationDuration
{
  [(RBAssertionIntransientState *)self->_intransientState invalidationDuration];
  return result;
}

- (RBProcessState)processState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (([(RBConcreteTargeting *)self->_target isSystem] & 1) != 0 || !self->_targetState) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[RBAssertion processState]();
  }
  BOOL v4 = (RBProcessState *)[self->_targetState copy];
  if (!v4)
  {
LABEL_5:
    if ([(RBConcreteTargeting *)self->_target isSystem])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v5 = [RBProcessState alloc];
      v6 = [(RBConcreteTargeting *)self->_target identity];
      BOOL v4 = [(RBProcessState *)v5 initWithIdentity:v6];
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (unint64_t)endPolicy
{
  return [(RBAssertionIntransientState *)self->_intransientState endPolicy];
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSSet)sourceEnvironments
{
  return (NSSet *)[(RBAssertionIntransientState *)self->_intransientState sourceEnvironments];
}

- (void)applyToProcessState:(id)a3 withAttributeContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);
  if (([(RBConcreteTargeting *)self->_target isSystem] & 1) == 0 && self->_targetState)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[RBAssertion applyToProcessState:withAttributeContext:]();
    }
    uint64_t v8 = [self->_targetState copy];
    if (v8)
    {
      v9 = (void *)v8;
      [v10 unionState:v8];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)updateProcessStateWithAttributeContext:(id)a3
{
  [(RBAssertion *)self resolveStateWithContext:a3];
  return [(RBAssertion *)self processState];
}

- (BOOL)isPersistent
{
  return [(RBAssertionIntransientState *)self->_intransientState isPersistent];
}

- (unint64_t)startPolicy
{
  return [(RBAssertionIntransientState *)self->_intransientState startPolicy];
}

+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6 creationTime:(double)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [RBAssertion alloc];
  v16 = [v14 identifier];
  v17 = [v14 explanation];
  v18 = [v14 attributes];

  v19 = (void *)-[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:]((uint64_t)v15, v13, v16, v17, v18, v12, v11, a7);
  return (RBAssertion *)v19;
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_active = 1;
  os_unfair_lock_unlock(p_lock);
}

- (uint64_t)_initWithTarget:(void *)a3 identifier:(void *)a4 explanation:(void *)a5 attributes:(void *)a6 originator:(void *)a7 context:(double)a8 creationTime:
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v51 = a6;
  id v20 = a7;
  if (a1)
  {
    v56.receiver = (id)a1;
    v56.super_class = (Class)RBAssertion;
    id v21 = objc_msgSendSuper2(&v56, sel_init);
    a1 = (uint64_t)v21;
    if (v21)
    {
      id v48 = v19;
      id v49 = v17;
      id v50 = v16;
      *((_DWORD *)v21 + 26) = 0;
      objc_storeStrong((id *)v21 + 1, a2);
      objc_storeStrong((id *)(a1 + 24), a3);
      uint64_t v22 = [[NSString alloc] initWithFormat:@"%@ (target:%@)", *(void *)(a1 + 24), *(void *)(a1 + 8)];
      v23 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v22;

      uint64_t v24 = [v18 copy];
      v25 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v24;

      *(unsigned char *)(a1 + 111) = 0;
      objc_storeStrong((id *)(a1 + 40), a5);
      objc_storeStrong((id *)(a1 + 112), a6);
      *(unsigned char *)(a1 + 109) = 0;
      *(double *)(a1 + 96) = a8;
      v26 = objc_alloc_init(RBAssertionIntransientState);
      v27 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v26;

      *(unsigned char *)(a1 + 108) = 0;
      [v20 setAssertion:a1];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v28 = *(id *)(a1 + 40);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        char v31 = 0;
        uint64_t v32 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v53 != v32) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "applyToAssertionIntransientState:attributePath:context:", *(void *)(a1 + 64), RBSAttributePathIncrement(0, v31 + i), v20);
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v57 count:16];
          v31 += i;
        }
        while (v30);
      }

      if (!v18)
      {
        v34 = rbs_assertion_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          -[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:](a1, v34);
        }
      }
      uint64_t v35 = [*(id *)(a1 + 64) runningReason];
      uint64_t v36 = [*(id *)(a1 + 64) legacyReason];
      if (v36)
      {
        uint64_t v37 = v36;
        unsigned __int8 v38 = 3;
      }
      else
      {
        if ([*(id *)(a1 + 64) hasDomainAttribute]) {
          unsigned __int8 v38 = 2;
        }
        else {
          unsigned __int8 v38 = 1;
        }
        uint64_t v37 = v35;
      }
      id v19 = v48;
      id v17 = v49;
      uint64_t v39 = [objc_alloc(MEMORY[0x263F64540]) initWithType:v38];
      v40 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v39;

      v41 = *(void **)(a1 + 88);
      if (v18)
      {
        [*(id *)(a1 + 88) setExplanation:v18];
      }
      else
      {
        v42 = [(id)a1 description];
        [v41 setExplanation:v42];
      }
      id v16 = v50;
      [*(id *)(a1 + 88) setReason:v37];
      v43 = *(void **)(a1 + 88);
      v44 = [*(id *)(a1 + 64) domainAttributes];
      [v43 setDomain:v44];

      v45 = *(void **)(a1 + 88);
      v46 = NSStringFromRBSLegacyReason();
      [v45 setName:v46];
    }
  }

  return a1;
}

- (BOOL)_lock_resolveStateWithContext:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
    if (*(unsigned char *)(a1 + 111) && !*(unsigned char *)(a1 + 109))
    {
      v9 = [v3 availableInheritances];
      CFSetRef v10 = [v9 allInheritances];

      id v11 = [v3 systemState];
      id v12 = [v11 conditions];

      if (*(void *)(a1 + 48)
        && ((CFSetRef v13 = *(const __CFSet **)(a1 + 72), v10 == v13)
         || v10
         && v13
         && (CFIndex Count = CFSetGetCount(v10), Count == CFSetGetCount(v13))
         && [(__CFSet *)v10 isEqualToSet:v13])
        && ((v15 = *(void **)(a1 + 80), v12 == v15) || v12 && v15 && (objc_msgSend(v12, "isEqual:") & 1) != 0))
      {
        BOOL v5 = 0;
      }
      else
      {
        char v16 = [*(id *)(a1 + 8) isSystem];
        id v17 = objc_alloc_init(RBAssertionTransientState);
        uint64_t v39 = v12;
        CFSetRef v40 = v10;
        if (v16)
        {
          id v18 = objc_alloc_init(RBMutableSystemState);
          id v19 = 0;
          unsigned __int8 v38 = v18;
        }
        else
        {
          id v20 = [RBMutableProcessState alloc];
          id v21 = [*(id *)(a1 + 8) identity];
          id v19 = [(RBProcessState *)v20 initWithIdentity:v21];

          id v18 = 0;
          unsigned __int8 v38 = (RBMutableSystemState *)v19;
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v41 = a1;
        id obj = *(id *)(a1 + 40);
        uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          char v24 = 0;
          uint64_t v25 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v44 != v25) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v28 = RBSAttributePathIncrement(0, v24 + i);
              [v27 applyToAssertionTransientState:v17 attributePath:v28 context:v3];
              if (v19) {
                [v27 applyToProcessState:v19 attributePath:v28 context:v3];
              }
              if (v18) {
                [v27 applyToSystemState:v18 attributePath:v28 context:v3];
              }
            }
            uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
            v24 += i;
          }
          while (v23);
        }

        int v29 = [*(id *)(v41 + 88) type];
        uint64_t v30 = *(void *)(v41 + 88);
        if (v29 == 3) {
          [(RBMutableProcessState *)v19 addLegacyAssertion:v30];
        }
        else {
          [(RBMutableProcessState *)v19 addRBAssertion:v30];
        }
        id v12 = v39;
        CFSetRef v10 = v40;
        uint64_t v31 = [(RBMutableSystemState *)v38 copy];
        uint64_t v32 = *(void **)(v41 + 48);
        *(void *)(v41 + 48) = v31;

        v33 = *(void **)(v41 + 56);
        *(void *)(v41 + 56) = v17;
        v34 = v17;

        uint64_t v35 = [(__CFSet *)v40 copy];
        uint64_t v36 = *(void **)(v41 + 72);
        *(void *)(v41 + 72) = v35;

        objc_storeStrong((id *)(v41 + 80), v39);
        BOOL v5 = 1;
      }
    }
    else
    {
      BOOL v4 = *(void **)(a1 + 48);
      BOOL v5 = v4 != 0;
      *(void *)(a1 + 48) = 0;

      id v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      v7 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      uint64_t v8 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unsigned)invalidationReason
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_invalidationReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (BOOL)definesRelativeStartTime
{
  return [(RBAssertionIntransientState *)self->_intransientState definesRelativeStartTime];
}

- (void)deactivate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_active = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_invalidationReason == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)warningDuration
{
  [(RBAssertionIntransientState *)self->_intransientState warningDuration];
  return result;
}

- (BOOL)suspendsOnOriginatorSuspension
{
  return [(RBAssertionIntransientState *)self->_intransientState suspendsOnOriginatorSuspension];
}

- (id)terminationContextForTargetProcess:(id)a3 originatorProcessIsActive:(BOOL)a4
{
  id v6 = a3;
  v7 = [(RBAssertion *)self identifier];
  int v8 = [(RBAssertion *)self invalidationReason];
  v9 = [(RBAssertion *)self originator];
  unint64_t v10 = [(RBAssertion *)self endPolicy];
  if ([v6 isLifecycleManaged] && v8 == 4 && v10 == 2)
  {
    id v11 = (void *)MEMORY[0x263F64638];
    id v12 = NSString;
    CFSetRef v13 = v9;
    if (!v9)
    {
      CFSetRef v13 = [(RBAssertion *)self originator];
    }
    id v14 = [(RBAssertion *)self explanation];
    v15 = [v12 stringWithFormat:@"Timed-out waiting for process %@ to invalidate assertion with identifier %@ and explanation '%@'. Direct this report to owners of that process", v13, v7, v14];
    char v16 = [v11 defaultContextWithExplanation:v15];

    if (!v9) {
    [v16 setPreventIfBeingDebugged:1];
    }
    [v16 setReportType:0];
    [v16 setExceptionCode:-[RBAssertion _exceptionCodeForAssertionTimeout](self)];
    id v17 = rbs_assertion_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ([v6 isLifecycleManaged] && v8 == 8 && v10 == 2)
  {
    id v18 = (void *)MEMORY[0x263F64638];
    id v19 = NSString;
    id v20 = [(RBAssertion *)self explanation];
    id v21 = [v19 stringWithFormat:@"Conditions changed, forcing termination due to outstanding assertion with identifier %@ and explanation '%@'", v7, v20];
    char v16 = [v18 defaultContextWithExplanation:v21];

    [v16 setReportType:0];
    [v16 setExceptionCode:97132013];
    id v17 = rbs_assertion_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      goto LABEL_21;
    }
LABEL_14:
    -[RBAssertion terminationContextForTargetProcess:originatorProcessIsActive:](v16);
    goto LABEL_15;
  }
  if (v8 == 1
    && [(RBAssertion *)self terminateTargetOnOriginatorExit]
    && (!v9 || !a4))
  {
    uint64_t v23 = (void *)MEMORY[0x263F64638];
    char v24 = NSString;
    uint64_t v25 = v9;
    if (!v9)
    {
      uint64_t v25 = [(RBAssertion *)self originator];
    }
    v26 = [v24 stringWithFormat:@"Terminating process %@ because the owner of this process %@ has exited (assertionID %@)", v6, v25, v7];
    char v16 = [v23 defaultContextWithExplanation:v26];

    if (!v9) {
    [v16 setExceptionCode:2970726673];
    }
    [v16 setReportType:0];
  }
  else
  {
    char v16 = 0;
  }
LABEL_21:

  return v16;
}

- (RBAssertionIntransientState)intransientState
{
  return self->_intransientState;
}

- (id)lock_targetProcessForAbstract
{
  os_unfair_lock_assert_owner(&self->_lock);
  targetProcessForAbstract = self->_targetProcessForAbstract;
  return targetProcessForAbstract;
}

- (void)setInvalidationReason:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_invalidationReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)invalidatesSynchronously
{
  return [(RBAssertionIntransientState *)self->_intransientState invalidatesSynchronously];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_plugInHoldToken, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_assertionInfo, 0);
  objc_storeStrong((id *)&self->_lastConditions, 0);
  objc_storeStrong((id *)&self->_originatorInheritances, 0);
  objc_storeStrong((id *)&self->_intransientState, 0);
  objc_storeStrong((id *)&self->_transientState, 0);
  objc_storeStrong(&self->_targetState, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetProcessForAbstract, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)setTargetProcessForAbstract:(id)a3
{
  BOOL v4 = (RBProcess *)a3;
  os_unfair_lock_lock_with_options();
  targetProcessForAbstract = self->_targetProcessForAbstract;
  self->_targetProcessForAbstract = v4;
  id v6 = v4;

  id targetState = self->_targetState;
  self->_id targetState = 0;

  os_unfair_lock_unlock(&self->_lock);
}

+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 identifier];
  v15 = [v13 explanation];
  char v16 = [v13 attributes];

  id v17 = [a1 assertionWithIdentifier:v14 target:v12 explanation:v15 attributes:v16 originator:v11 context:v10];

  return (RBAssertion *)v17;
}

+ (RBAssertion)assertionWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6 originator:(id)a7 context:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [RBAssertion alloc];
  RBSMachAbsoluteTime();
  id v21 = (void *)-[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:]((uint64_t)v19, v17, v18, v16, v15, v14, v13, v20);

  return (RBAssertion *)v21;
}

- (void)suspend
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(RBAssertionIntransientState *)self->_intransientState suspendsOnOriginatorSuspension])
  {
    id v3 = rbs_ttl_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      BOOL v5 = self;
      _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_DEFAULT, "Suspending assertion %{public}@", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock_with_options();
    self->_suspended = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)resume
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(RBAssertionIntransientState *)self->_intransientState suspendsOnOriginatorSuspension])
  {
    id v3 = rbs_ttl_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      BOOL v5 = self;
      _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_DEFAULT, "Resuming assertion %{public}@", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock_with_options();
    self->_suspended = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)isSuspended
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_suspended;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v6 = [(RBAssertionTransientState *)self->_transientState maxCPUUsageViolationPolicyForRole:v3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)legacyReason
{
  return [(RBAssertionIntransientState *)self->_intransientState legacyReason];
}

- (unint64_t)runningReason
{
  return [(RBAssertionIntransientState *)self->_intransientState runningReason];
}

- (BOOL)terminateTargetOnOriginatorExit
{
  return [(RBAssertionIntransientState *)self->_intransientState terminateTargetOnOriginatorExit];
}

- (RBInheritanceCollection)inheritances
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (([(RBConcreteTargeting *)self->_target isSystem] & 1) != 0 || !self->_targetState)
  {
    int v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[RBAssertion inheritances]();
    }
    int v4 = [self->_targetState inheritances];
  }
  os_unfair_lock_unlock(p_lock);
  return (RBInheritanceCollection *)v4;
}

- (BOOL)hasDomainAttribute
{
  return [(RBAssertionIntransientState *)self->_intransientState hasDomainAttribute];
}

- (void)applyToAssertionTransientState:(id)a3 withAttributeContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);

  if (self->_transientState) {
    objc_msgSend(v7, "unionState:");
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)applyToSystemState:(id)a3 withAttributeContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);
  if ([(RBConcreteTargeting *)self->_target isSystem] && self->_targetState)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[RBAssertion applyToSystemState:withAttributeContext:]();
    }
    [v7 unionState:self->_targetState];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (uint64_t)_exceptionCodeForAssertionTimeout
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 562215635;
  uint64_t v3 = [a1 explanation];
  if ([v3 hasPrefix:@"Shared Background Assertion"])
  {
    uint64_t v2 = 562215634;
  }
  else if (([v3 hasPrefix:@"com.apple.nsurlsessiond.handlesession"] & 1) == 0 {
         && ([v3 isEqualToString:@"com.apple.das.nsurlsessioncomplete"] & 1) == 0)
  }
  {
    if (([v3 isEqualToString:@"com.apple.das.backgroundFetch"] & 1) != 0
      || [v3 isEqualToString:@"com.apple.das.backgroundTasks"]
      && [a1 runningReason] == 100)
    {
      uint64_t v2 = 562215636;
    }
    else
    {
      uint64_t v2 = 562215597;
    }
  }

  return v2;
}

- (NSString)stateCaptureTitle
{
  uint64_t v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(RBSAssertionIdentifier *)self->_identifier description];
  id v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return (NSString *)v7;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (id)plugInHoldToken
{
  return self->_plugInHoldToken;
}

- (void)setPlugInHoldToken:(id)a3
{
}

- (void)_initWithTarget:(uint64_t)a1 identifier:(NSObject *)a2 explanation:attributes:originator:context:creationTime:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "Initializing assertion with null-proof explanation being null %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)inheritances
{
}

- (void)processState
{
}

- (void)applyToProcessState:withAttributeContext:.cold.1()
{
}

- (void)applyToSystemState:withAttributeContext:.cold.1()
{
}

- (void)terminationContextForTargetProcess:(void *)a1 originatorProcessIsActive:.cold.1(void *a1)
{
  v1 = [a1 explanation];
  OUTLINED_FUNCTION_0(&dword_226AB3000, v2, v3, "%@", v4, v5, v6, v7, 2u);
}

@end