@interface SBSystemActionCompoundPreviewAssertion
- (id)acquireForReason:(uint64_t)a1;
- (id)descriptionBuilderWithMultilinePrefix:(void *)a1;
- (id)descriptionWithMultilinePrefix:(uint64_t)a1;
- (id)succinctDescriptionBuilder;
- (uint64_t)_removeExpansionReason:(uint64_t)result;
- (uint64_t)_removePreviewingReason:(uint64_t)result;
- (uint64_t)_removeUrgencyReason:(uint64_t)result;
- (uint64_t)_sendEvent:(uint64_t)result;
- (uint64_t)_updateState;
- (uint64_t)state;
- (void)_addAssertionReason:(id *)a1;
- (void)dealloc;
- (void)initWithIdentifier:(void *)a3 stateDidChangeBlock:(void *)a4 eventHandlingBlock:;
@end

@implementation SBSystemActionCompoundPreviewAssertion

- (uint64_t)state
{
  if (result) {
    return *(unsigned int *)(result + 56);
  }
  return result;
}

- (void)initWithIdentifier:(void *)a3 stateDidChangeBlock:(void *)a4 eventHandlingBlock:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!a1) {
    goto LABEL_7;
  }
  if (!v7)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:]();
    }
LABEL_16:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8CEC598);
  }
  if (!v8)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"stateDidChangeBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8CEC5FCLL);
  }
  if (!v9)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"eventHandlingBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:]();
    }
    goto LABEL_16;
  }
  v20.receiver = a1;
  v20.super_class = (Class)SBSystemActionCompoundPreviewAssertion;
  a1 = objc_msgSendSuper2(&v20, sel_init);
  if (a1)
  {
    uint64_t v11 = [v7 copy];
    v12 = (void *)a1[8];
    a1[8] = v11;

    uint64_t v13 = [v8 copy];
    v14 = (void *)a1[1];
    a1[1] = v13;

    uint64_t v15 = [v10 copy];
    v16 = (void *)a1[2];
    a1[2] = v15;
  }
LABEL_7:

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

- (id)acquireForReason:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCompoundPreviewAssertion acquireForReason:]();
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8CEC9A4);
    }
    uint64_t v5 = [SBSystemActionPreviewAssertion alloc];
    uint64_t v6 = *(void **)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke;
    v16[3] = &unk_1E6B0A050;
    v16[4] = a1;
    id v17 = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_2;
    v14[3] = &unk_1E6B0A078;
    v14[4] = a1;
    id v15 = v17;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_3;
    v12[3] = &unk_1E6B0A050;
    v12[4] = a1;
    id v7 = v15;
    id v13 = v7;
    id v8 = -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:](v5, v6, v7, v16, v14, v12);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_4;
    v11[3] = &unk_1E6B0A0A0;
    v11[4] = a1;
    [v8 addExpansionInvalidationBlock:v11];
    objc_storeWeak((id *)(a1 + 24), v8);
    -[SBSystemActionCompoundPreviewAssertion _addAssertionReason:]((id *)a1, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    [*(id *)(v1 + 40) removeObject:*(void *)(result + 40)];
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v1);
  }
  return result;
}

- (uint64_t)_removeExpansionReason:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    [*(id *)(result + 40) removeObject:a2];
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v2);
  }
  return result;
}

uint64_t __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    [*(id *)(v1 + 48) removeObject:*(void *)(result + 40)];
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v1);
  }
  return result;
}

- (uint64_t)_removeUrgencyReason:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    [*(id *)(result + 48) removeObject:a2];
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v2);
  }
  return result;
}

uint64_t __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    [*(id *)(v1 + 32) removeObject:*(void *)(result + 40)];
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v1);
  }
  return result;
}

- (uint64_t)_removePreviewingReason:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeObject:a2];
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v2);
  }
  return result;
}

void __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = v5;
      (*(void (**)(void))(*(void *)(v6 + 16) + 16))();
      id v5 = v7;
    }
  }
}

- (uint64_t)_sendEvent:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)(result + 16) + 16))();
  }
  return result;
}

- (void)_addAssertionReason:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v10 = v3;
    if (!a1[4])
    {
      uint64_t v4 = [MEMORY[0x1E4F28BD0] set];
      id v5 = a1[4];
      a1[4] = (id)v4;
    }
    if (!a1[5])
    {
      uint64_t v6 = [MEMORY[0x1E4F28BD0] set];
      id v7 = a1[5];
      a1[5] = (id)v6;
    }
    if (!a1[6])
    {
      uint64_t v8 = [MEMORY[0x1E4F28BD0] set];
      id v9 = a1[6];
      a1[6] = (id)v8;
    }
    [a1[4] addObject:v10];
    [a1[5] addObject:v10];
    [a1[6] addObject:v10];
    -[SBSystemActionCompoundPreviewAssertion _updateState]((uint64_t)a1);
    id v3 = v10;
  }
}

- (uint64_t)_updateState
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) count];
    uint64_t v3 = [*(id *)(v1 + 40) count];
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    char v5 = [WeakRetained isProminent];
    uint64_t v6 = [*(id *)(v1 + 48) count];

    if (!BSEqualBools()
      || !BSEqualBools()
      || !BSEqualBools()
      || (result = BSEqualBools(), (result & 1) == 0))
    {
      *(unsigned char *)(v1 + 56) = v2 != 0;
      *(unsigned char *)(v1 + 57) = v3 != 0;
      *(unsigned char *)(v1 + 58) = v5;
      *(unsigned char *)(v1 + 59) = v6 != 0;
      id v7 = *(uint64_t (**)(void))(*(void *)(v1 + 8) + 16);
      return v7();
    }
  }
  return result;
}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v1 = -[SBSystemActionCompoundPreviewAssertion succinctDescriptionBuilder](a1);
    uint64_t v2 = [v1 build];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)succinctDescriptionBuilder
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
    [v2 appendString:*(void *)(a1 + 64) withName:@"identifier"];
    id v3 = (id)[v2 appendObject:*(void *)(a1 + 32) withName:@"previewingReasons"];
    id v4 = (id)[v2 appendObject:*(void *)(a1 + 40) withName:@"expansionReasons"];
    id v5 = (id)[v2 appendObject:*(void *)(a1 + 48) withName:@"urgencyReasons"];
    id v6 = (id)[v2 appendBool:*(unsigned __int8 *)(a1 + 58) withName:@"isProminent"];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    a1 = -[SBSystemActionCompoundPreviewAssertion succinctDescriptionBuilder]((uint64_t)a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_urgencyReasons, 0);
  objc_storeStrong((id *)&self->_expansionReasons, 0);
  objc_storeStrong((id *)&self->_previewingReasons, 0);
  objc_destroyWeak((id *)&self->_lastAcquiredAssertion);
  objc_storeStrong(&self->_eventHandlingBlock, 0);
  objc_storeStrong(&self->_stateDidChangeBlock, 0);
}

- (void)initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireForReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end