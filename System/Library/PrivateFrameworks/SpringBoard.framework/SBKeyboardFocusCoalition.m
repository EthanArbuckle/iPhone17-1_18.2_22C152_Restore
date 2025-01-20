@interface SBKeyboardFocusCoalition
- (BOOL)isInvalidated;
- (BOOL)isKeyboardFocusEvaluationSuppressed;
- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion;
- (BSInvalidatable)stateCaptureHandle;
- (NSArray)members;
- (NSMutableArray)internalMembers;
- (NSSet)keyboardFocusEvaluationSupressionReasons;
- (NSString)debugDescription;
- (NSString)debugName;
- (NSString)description;
- (SBKeyboardFocusCoalition)init;
- (SBKeyboardFocusCoalitionDelegate)delegate;
- (SBKeyboardFocusPolicy)enforcedPolicy;
- (SBKeyboardFocusPolicyEnforcer)policyEnforcer;
- (id)_initWithDebugName:(id)a3;
- (id)acquireMemberForWindowScene:(id)a3 delegate:(id)a4;
- (id)succinctDescription;
- (id)suppressKeyboardFocusEvaluationForReason:(id)a3;
- (void)_registerMember:(id)a3;
- (void)_unregisterMember:(id)a3;
- (void)addedMember:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4;
- (void)removedMember:(id)a3;
- (void)setDebugName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnforcedPolicy:(id)a3;
- (void)setInternalMembers:(id)a3;
- (void)setNeedsArbitrationForReason:(id)a3;
- (void)setPolicyEnforcer:(id)a3;
- (void)setStateCaptureHandle:(id)a3;
- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3;
@end

@implementation SBKeyboardFocusCoalition

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (BOOL)isKeyboardFocusEvaluationSuppressed
{
  return [(BSCompoundAssertion *)self->_suppressKeyboardFocusEvaluationAssertion isActive];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setEnforcedPolicy:(id)a3
{
}

- (SBKeyboardFocusPolicyEnforcer)policyEnforcer
{
  return self->_policyEnforcer;
}

- (SBKeyboardFocusCoalitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBKeyboardFocusCoalitionDelegate *)WeakRetained;
}

- (void)setNeedsArbitrationForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = NSString;
    objc_opt_class();
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v8 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:](a2);
    }
LABEL_13:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D869F21CLL);
  }
  v6 = v5;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = NSString;
    v13 = (objc_class *)[v6 classForCoder];
    if (!v13) {
      v13 = (objc_class *)objc_opt_class();
    }
    v14 = NSStringFromClass(v13);
    objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v11 = [v12 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v14, v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:](a2);
    }
    goto LABEL_13;
  }

  v7 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(SBKeyboardFocusCoalition *)(uint64_t)self setNeedsArbitrationForReason:v7];
  }
}

- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    v10 = [v6 uniqueIdentifier];
    int v11 = 138543874;
    v12 = debugName;
    __int16 v13 = 2114;
    v14 = v10;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] member %{public}@ requests update for reason: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (SBKeyboardFocusCoalition)init
{
  return (SBKeyboardFocusCoalition *)[(SBKeyboardFocusCoalition *)self _initWithDebugName:@"SBKeyboardFocusCoalition"];
}

- (id)_initWithDebugName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v20.receiver = self;
    v20.super_class = (Class)SBKeyboardFocusCoalition;
    id v7 = [(SBKeyboardFocusCoalition *)&v20 init];
    if (v7)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      internalMembers = v7->_internalMembers;
      v7->_internalMembers = v8;

      uint64_t v10 = [v6 copy];
      debugName = v7->_debugName;
      v7->_debugName = (NSString *)v10;

      objc_initWeak(&location, v7);
      id v12 = MEMORY[0x1E4F14428];
      __int16 v13 = [NSString stringWithFormat:@"SpringBoard - KeyboardFocus - Coalition - %@", v6];
      objc_copyWeak(&v18, &location);
      uint64_t v14 = BSLogAddStateCaptureBlockWithTitle();
      stateCaptureHandle = v7->_stateCaptureHandle;
      v7->_stateCaptureHandle = (BSInvalidatable *)v14;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    return v7;
  }
  else
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"debugName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalition _initWithDebugName:](a2);
    }
    [v17 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

id __47__SBKeyboardFocusCoalition__initWithDebugName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];

  return v2;
}

- (id)suppressKeyboardFocusEvaluationForReason:(id)a3
{
  id v4 = a3;
  suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  if (!suppressKeyboardFocusEvaluationAssertion)
  {
    id v6 = self->_debugName;
    objc_initWeak(&location, self);
    id v7 = (void *)MEMORY[0x1E4F4F6E8];
    v8 = [NSString stringWithFormat:@"[%@]-keyboardFocusEvaluationSuppression", v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__SBKeyboardFocusCoalition_suppressKeyboardFocusEvaluationForReason___block_invoke;
    v16[3] = &unk_1E6B0C610;
    v9 = v6;
    uint64_t v17 = v9;
    objc_copyWeak(&v18, &location);
    uint64_t v10 = [v7 assertionWithIdentifier:v8 stateDidChangeHandler:v16];
    int v11 = self->_suppressKeyboardFocusEvaluationAssertion;
    self->_suppressKeyboardFocusEvaluationAssertion = v10;

    id v12 = self->_suppressKeyboardFocusEvaluationAssertion;
    __int16 v13 = SBLogKeyboardFocus();
    [(BSCompoundAssertion *)v12 setLog:v13];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  }
  uint64_t v14 = [(BSCompoundAssertion *)suppressKeyboardFocusEvaluationAssertion acquireForReason:v4];

  return v14;
}

void __69__SBKeyboardFocusCoalition_suppressKeyboardFocusEvaluationForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([a2 isActive] & 1) == 0)
  {
    v3 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished suppressing keyboard focus evaluation, time to re-evaluate", (uint8_t *)&v9, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained delegate];
    id v7 = +[SBKeyboardFocusArbitrationReason keyboardFocusEvaluationSuppression];
    v8 = [v7 annotatedWithSourceName:*(void *)(a1 + 32)];
    [v6 requestArbitrationForReason:v8];
  }
}

- (NSSet)keyboardFocusEvaluationSupressionReasons
{
  v2 = [(BSCompoundAssertion *)self->_suppressKeyboardFocusEvaluationAssertion reasons];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v5 = v4;

  return (NSSet *)v5;
}

- (NSArray)members
{
  v2 = (void *)[(NSMutableArray *)self->_internalMembers copy];
  return (NSArray *)v2;
}

- (id)acquireMemberForWindowScene:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SBKeyboardFocusCoalitionMember alloc];
  int v9 = [v7 _FBSScene];
  uint64_t v10 = [v9 identifier];
  uint64_t v11 = [(SBKeyboardFocusCoalitionMember *)v8 initWithUniqueIdentifier:v10 windowScene:v7 delegate:v6 coalition:self];

  [(SBKeyboardFocusCoalition *)self _registerMember:v11];
  return v11;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_registerMember:(id)a3
{
  internalMembers = self->_internalMembers;
  id v5 = a3;
  [(NSMutableArray *)internalMembers addObject:v5];
  [(NSMutableArray *)self->_internalMembers sortUsingComparator:&__block_literal_global_374];
  [(SBKeyboardFocusCoalition *)self addedMember:v5];
}

BOOL __44__SBKeyboardFocusCoalition__registerMember___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 uniqueIdentifier];
  uint64_t v6 = [v4 uniqueIdentifier];

  return v5 < v6;
}

- (void)_unregisterMember:(id)a3
{
  internalMembers = self->_internalMembers;
  id v5 = a3;
  [(NSMutableArray *)internalMembers removeObject:v5];
  [(SBKeyboardFocusCoalition *)self removedMember:v5];

  id v8 = [(SBKeyboardFocusCoalition *)self delegate];
  uint64_t v6 = +[SBKeyboardFocusArbitrationReason removedCoalitionMember];
  uint64_t v7 = [v6 annotatedWithSourceName:self->_debugName];
  [v8 requestArbitrationForReason:v7];
}

- (void)addedMember:(id)a3
{
  id v4 = a3;
  id v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBKeyboardFocusCoalition addedMember:]((uint64_t)self, v4);
  }
}

- (void)removedMember:(id)a3
{
  id v4 = a3;
  id v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBKeyboardFocusCoalition removedMember:]((uint64_t)self, v4);
  }
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = [(SBKeyboardFocusCoalition *)self members];
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
          [(SBKeyboardFocusCoalition *)self _unregisterMember:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
    [(SBKeyboardFocusPolicyEnforcer *)self->_policyEnforcer invalidate];
    [(BSCompoundAssertion *)self->_suppressKeyboardFocusEvaluationAssertion invalidate];
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (id)succinctDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v9 = v5;
  long long v10 = self;
  [v5 appendProem:self block:v8];
  if (([v5 hasSuccinctStyle] & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke_2;
    v6[3] = &unk_1E6AF5290;
    v6[4] = self;
    id v7 = v5;
    [v7 appendBodySectionWithName:0 block:v6];
  }
}

id __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:0];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
    return (id)[*(id *)(a1 + 32) appendBool:1 withName:@"invalid"];
  }
  return result;
}

void __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isKeyboardFocusEvaluationSuppressed])
  {
    v2 = *(void **)(a1 + 40);
    v3 = [*(id *)(a1 + 32) keyboardFocusEvaluationSupressionReasons];
    id v4 = (id)[v2 appendObject:v3 withName:@"keyboardFocusEvaluationSupressionReasons"];
  }
  id v5 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) enforcedPolicy];
  id v6 = (id)[v5 appendObject:v7 withName:@"enforcedPolicy"];
}

- (void)setPolicyEnforcer:(id)a3
{
}

- (void)setDebugName:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(id)a3
{
}

- (NSMutableArray)internalMembers
{
  return self->_internalMembers;
}

- (void)setInternalMembers:(id)a3
{
}

- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion
{
  return self->_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_internalMembers, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_policyEnforcer, 0);
}

- (void)_initWithDebugName:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  long long v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setNeedsArbitrationForReason:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_20();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setNeedsArbitrationForReason:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] needs arbitration for reason: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)addedMember:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueIdentifier];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@] added member: %{public}@", v5, v6, v7, v8, v9);
}

- (void)removedMember:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueIdentifier];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@] removed member: %{public}@", v5, v6, v7, v8, v9);
}

@end