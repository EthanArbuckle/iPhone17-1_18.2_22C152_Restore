@interface SBSystemActionPreviewAssertion
- (BOOL)isExpanding;
- (BOOL)isProminent;
- (BOOL)isUrgent;
- (BOOL)isValid;
- (id)acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed;
- (id)descriptionBuilderWithMultilinePrefix:(void *)a1;
- (id)descriptionWithMultilinePrefix:(uint64_t)a1;
- (id)initWithIdentifier:(void *)a3 forReason:(void *)a4 expansionInvalidationBlock:(void *)a5 urgencyInvalidationBlock:(void *)a6 finalInvalidationBlock:;
- (id)succinctDescriptionBuilder;
- (uint64_t)identifier;
- (uint64_t)reason;
- (void)_invalidateAfterContextualTimeoutWithResult:(uint64_t)a1;
- (void)_invalidateExpansionWithResult:(uint64_t)a1;
- (void)_invalidateUrgency;
- (void)_invalidateUrgencyAfterDefaultTimeoutForActionPerformed;
- (void)addExpansionInvalidationBlock:(id)a3;
- (void)addInvalidationBlock:(id)a3;
- (void)dealloc;
- (void)invalidateAfterDefaultTimeoutForActionCancelled;
- (void)invalidateWithResult:(unint64_t)a3;
@end

@implementation SBSystemActionPreviewAssertion

- (id)initWithIdentifier:(void *)a3 forReason:(void *)a4 expansionInvalidationBlock:(void *)a5 urgencyInvalidationBlock:(void *)a6 finalInvalidationBlock:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (!a1) {
    goto LABEL_9;
  }
  if (!v11)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:]();
    }
LABEL_24:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86F2338);
  }
  if (!v12)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86F239CLL);
  }
  if (!v13)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expansionInvalidationBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86F2400);
  }
  if (!v14)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"urgencyInvalidationBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.4();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86F2464);
  }
  if (!v15)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"finalInvalidationBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.5();
    }
    goto LABEL_24;
  }
  v33.receiver = a1;
  v33.super_class = (Class)SBSystemActionPreviewAssertion;
  a1 = objc_msgSendSuper2(&v33, sel_init);
  if (a1)
  {
    uint64_t v17 = [v11 copy];
    v18 = (void *)*((void *)a1 + 10);
    *((void *)a1 + 10) = v17;

    uint64_t v19 = [v12 copy];
    v20 = (void *)*((void *)a1 + 11);
    *((void *)a1 + 11) = v19;

    uint64_t v21 = [v14 copy];
    v22 = (void *)*((void *)a1 + 1);
    *((void *)a1 + 1) = v21;

    uint64_t v23 = [v16 copy];
    v24 = (void *)*((void *)a1 + 2);
    *((void *)a1 + 2) = v23;

    *((_DWORD *)a1 + 18) = 65793;
    v25 = +[SBSystemActionDomain rootSettings];
    uint64_t v26 = [v25 previewSettings];
    v27 = (void *)*((void *)a1 + 3);
    *((void *)a1 + 3) = v26;

    [a1 addExpansionInvalidationBlock:v13];
  }
LABEL_9:

  return a1;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addExpansionInvalidationBlock:(id)a3
{
  id v10 = a3;
  if (![(SBSystemActionPreviewAssertion *)self isValid])
  {
    uint8_t v9 = [NSString stringWithFormat:@"Can't add an expansion invalidation block to an already-invalidated assertion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion addExpansionInvalidationBlock:]();
    }
LABEL_13:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86F2698);
  }
  if (!self->_expanding)
  {
    uint8_t v9 = [NSString stringWithFormat:@"Can't add an expansion invalidation block to a non-expanding assertion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion addExpansionInvalidationBlock:]();
    }
    goto LABEL_13;
  }
  expansionInvalidationBlocks = self->_expansionInvalidationBlocks;
  if (!expansionInvalidationBlocks)
  {
    uint64_t v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v6 = self->_expansionInvalidationBlocks;
    self->_expansionInvalidationBlocks = v5;

    expansionInvalidationBlocks = self->_expansionInvalidationBlocks;
  }
  uint64_t v7 = (void *)[v10 copy];
  uint64_t v8 = (void *)MEMORY[0x1D948C7A0]();
  [(NSMutableOrderedSet *)expansionInvalidationBlocks addObject:v8];
}

- (void)addInvalidationBlock:(id)a3
{
  id v10 = a3;
  if ([(SBSystemActionPreviewAssertion *)self isValid])
  {
    invalidationBlocks = self->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      uint64_t v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      uint64_t v6 = self->_invalidationBlocks;
      self->_invalidationBlocks = v5;

      invalidationBlocks = self->_invalidationBlocks;
    }
    uint64_t v7 = (void *)[v10 copy];
    uint64_t v8 = (void *)MEMORY[0x1D948C7A0]();
    [(NSMutableOrderedSet *)invalidationBlocks addObject:v8];
  }
  else
  {
    uint8_t v9 = [NSString stringWithFormat:@"Can't add an invalidation block to an already-invalidated assertion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewAssertion addInvalidationBlock:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidateAfterDefaultTimeoutForActionCancelled
{
}

- (void)_invalidateAfterContextualTimeoutWithResult:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1 && [(id)a1 isValid] && !*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 24) minimumPreviewInterval];
    double v5 = v4;
    if (a2 == 1)
    {
      double v6 = v4;
    }
    else
    {
      double v6 = 0.0;
      if (!a2)
      {
        if (*(double *)(a1 + 48) <= 0.0) {
          id v14 = {;
        }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[SBSystemActionPreviewAssertion _invalidateAfterContextualTimeoutWithResult:]();
          }
          [v14 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D86F2A98);
        }
        BSContinuousMachTimeNow();
        double v8 = v5 - (v7 - *(double *)(a1 + 48));
        if (v8 >= 0.0) {
          double v6 = v8;
        }
        else {
          double v6 = 0.0;
        }
      }
    }
    if (BSFloatGreaterThanFloat())
    {
      uint8_t v9 = SBLogSystemActionPreviewing();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        double v19 = v6;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ creating %fs invalidation timer", buf, 0x16u);
      }

      id v10 = [NSString stringWithFormat:@"Preview-minimum-interval-timer:%@", *(void *)(a1 + 80)];
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:v10];
      id v12 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v11;

      if (a2 == 1)
      {
        -[SBSystemActionPreviewAssertion _invalidateExpansionWithResult:](a1);
        -[SBSystemActionPreviewAssertion _invalidateUrgency](a1);
      }
      id v13 = *(void **)(a1 + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__SBSystemActionPreviewAssertion__invalidateAfterContextualTimeoutWithResult___block_invoke;
      v15[3] = &unk_1E6AF4968;
      v15[4] = a1;
      v15[5] = a2;
      [v13 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v15 queue:v6 handler:0.05];
    }
    else
    {
      [(id)a1 invalidateWithResult:a2];
    }
  }
}

- (id)acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed
{
  if ([(SBSystemActionPreviewAssertion *)self isValid] && self->_performedTime == 0.0)
  {
    BSContinuousMachTimeNow();
    self->_performedTime = v3;
    self->_prominent = 1;
    -[SBSystemActionPreviewAssertion _invalidateExpansionWithResult:]((uint64_t)self);
    -[SBSystemActionPreviewAssertion _invalidateUrgencyAfterDefaultTimeoutForActionPerformed]((uint64_t)self);
    double v4 = [(NSString *)self->_identifier stringByAppendingString:@"-invalidateAsPerformed"];
    id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
    reason = self->_reason;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __102__SBSystemActionPreviewAssertion_acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed__block_invoke;
    v9[3] = &unk_1E6AF4940;
    v9[4] = self;
    double v7 = (void *)[v5 initWithIdentifier:v4 forReason:reason invalidationBlock:v9];
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (void)_invalidateExpansionWithResult:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 74))
  {
    *(unsigned char *)(a1 + 74) = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1 + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    double v7 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;
  }
}

- (void)_invalidateUrgencyAfterDefaultTimeoutForActionPerformed
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1 && [(id)a1 isValid] && !*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 24) additionalUrgencyInterval];
    double v3 = v2;
    uint64_t v4 = SBLogSystemActionPreviewing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = a1;
      __int16 v14 = 2048;
      double v15 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ creating %fs urgency invalidation timer", buf, 0x16u);
    }

    uint64_t v5 = [NSString stringWithFormat:@"Urgency-interval-timer:%@", *(void *)(a1 + 80)];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:v5];
    double v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v6;

    objc_initWeak((id *)buf, (id)a1);
    long long v8 = *(void **)(a1 + 32);
    id v9 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__SBSystemActionPreviewAssertion__invalidateUrgencyAfterDefaultTimeoutForActionPerformed__block_invoke;
    v10[3] = &unk_1E6AF4990;
    objc_copyWeak(&v11, (id *)buf);
    [v8 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v10 queue:v3 handler:0.05];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __102__SBSystemActionPreviewAssertion_acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed__block_invoke(uint64_t a1)
{
}

- (void)_invalidateUrgency
{
  if (a1 && *(unsigned char *)(a1 + 73))
  {
    *(unsigned char *)(a1 + 73) = 0;
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    double v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t __78__SBSystemActionPreviewAssertion__invalidateAfterContextualTimeoutWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateWithResult:*(void *)(a1 + 40)];
}

- (void)invalidateWithResult:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBSystemActionPreviewAssertion *)self isValid])
  {
    self->_valid = 0;
    [(BSContinuousMachTimer *)self->_urgencyInvalidationTimer invalidate];
    urgencyInvalidationTimer = self->_urgencyInvalidationTimer;
    self->_urgencyInvalidationTimer = 0;

    [(BSContinuousMachTimer *)self->_invalidationTimer invalidate];
    invalidationTimer = self->_invalidationTimer;
    self->_invalidationTimer = 0;

    self->_prominent = 0;
    -[SBSystemActionPreviewAssertion _invalidateExpansionWithResult:]((uint64_t)self);
    -[SBSystemActionPreviewAssertion _invalidateUrgency]((uint64_t)self);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_invalidationBlocks;
    uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    invalidationBlocks = self->_invalidationBlocks;
    self->_invalidationBlocks = 0;

    (*((void (**)(id))self->_finalInvalidationBlock + 2))(self->_finalInvalidationBlock);
    id finalInvalidationBlock = self->_finalInvalidationBlock;
    self->_id finalInvalidationBlock = 0;
  }
}

void __89__SBSystemActionPreviewAssertion__invalidateUrgencyAfterDefaultTimeoutForActionPerformed__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBSystemActionPreviewAssertion _invalidateUrgency]((uint64_t)WeakRetained);
}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  if (a1)
  {
    SEL v1 = -[SBSystemActionPreviewAssertion succinctDescriptionBuilder](a1);
    double v2 = [v1 build];
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (id)succinctDescriptionBuilder
{
  if (a1)
  {
    double v2 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
    id v3 = (id)[v2 appendObject:*(void *)(a1 + 80) withName:@"identifier"];
    id v4 = (id)[v2 appendObject:*(void *)(a1 + 88) withName:@"reason"];
    id v5 = (id)[v2 appendBool:*(unsigned __int8 *)(a1 + 72) withName:@"valid"];
    id v6 = (id)[v2 appendBool:*(unsigned __int8 *)(a1 + 73) withName:@"urgent"];
    id v7 = (id)[v2 appendBool:*(unsigned __int8 *)(a1 + 74) withName:@"expanding"];
    id v8 = (id)[v2 appendBool:*(unsigned __int8 *)(a1 + 75) withName:@"prominent"];
    id v9 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "isScheduled"), @"pendingUrgencyInvalidation", 1);
    id v10 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isScheduled"), @"pendingInvalidation", 1);
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    a1 = -[SBSystemActionPreviewAssertion succinctDescriptionBuilder]((uint64_t)a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (uint64_t)identifier
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)reason
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
  objc_storeStrong((id *)&self->_expansionInvalidationBlocks, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_urgencyInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_finalInvalidationBlock, 0);
  objc_storeStrong(&self->_urgencyInvalidationBlock, 0);
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addExpansionInvalidationBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addExpansionInvalidationBlock:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addInvalidationBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_invalidateAfterContextualTimeoutWithResult:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end