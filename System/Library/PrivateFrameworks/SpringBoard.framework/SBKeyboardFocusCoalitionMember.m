@interface SBKeyboardFocusCoalitionMember
- (BOOL)hasFocus;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (SBKeyboardFocusCoalitionMember)initWithUniqueIdentifier:(id)a3 windowScene:(id)a4 delegate:(id)a5 coalition:(id)a6;
- (SBKeyboardFocusCoalitionMemberDelegate)delegate;
- (SBKeyboardFocusCoalitionMemberPreferences)preferences;
- (SBWindowScene)sbWindowScene;
- (id)succinctDescription;
- (id)updateCoalitionPreferencesWithReason:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)focusPolicyDidChange;
- (void)invalidate;
- (void)requestArbitration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasFocus:(BOOL)a3;
- (void)setSbWindowScene:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SBKeyboardFocusCoalitionMember

- (id)updateCoalitionPreferencesWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [WeakRetained generateUpdatedPreferencesForCoalitionMember:self reason:v4];

  id v7 = v6;
  if (!v7)
  {
    v14 = NSString;
    objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v14 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"preferences", v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember updateCoalitionPreferencesWithReason:]();
    }
LABEL_13:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86458C0);
  }
  v8 = v7;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = NSString;
    v19 = (objc_class *)[v8 classForCoder];
    if (!v19) {
      v19 = (objc_class *)objc_opt_class();
    }
    v20 = NSStringFromClass(v19);
    objc_opt_class();
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v17 = [v18 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"preferences", v20, v22];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember updateCoalitionPreferencesWithReason:]();
    }
    goto LABEL_13;
  }

  if (![(SBKeyboardFocusCoalitionMemberPreferences *)self->_preferences isEqual:v8])
  {
    v9 = (SBKeyboardFocusCoalitionMemberPreferences *)[v8 copy];
    preferences = self->_preferences;
    self->_preferences = v9;

    id v11 = objc_loadWeakRetained((id *)&self->_coalition);
    [v11 _memberDidUpdatePreferences:self];
  }
  v12 = self->_preferences;

  return v12;
}

- (void)setHasFocus:(BOOL)a3
{
  if (self->_hasFocus != a3)
  {
    self->_hasFocus = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coalition);
    [WeakRetained _memberDidUpdateSettings:self];
  }
}

- (void)focusPolicyDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained coalitionMemberFocusDidChange:self];
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (void)requestArbitration:(id)a3
{
  id v14 = a3;
  if (!v14)
  {
    v5 = NSString;
    objc_opt_class();
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = [v5 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember requestArbitration:]();
    }
LABEL_13:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86A111CLL);
  }
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = NSString;
    v10 = (objc_class *)[v14 classForCoder];
    if (!v10) {
      v10 = (objc_class *)objc_opt_class();
    }
    id v11 = NSStringFromClass(v10);
    objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v8 = [v9 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v11, v13];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember requestArbitration:]();
    }
    goto LABEL_13;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_coalition);
  [WeakRetained memberRequestsArbitration:self forReason:v14];
}

- (SBKeyboardFocusCoalitionMember)initWithUniqueIdentifier:(id)a3 windowScene:(id)a4 delegate:(id)a5 coalition:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uniqueIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember initWithUniqueIdentifier:windowScene:delegate:coalition:]();
    }
LABEL_15:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EA366CLL);
  }
  if (!v12)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember initWithUniqueIdentifier:windowScene:delegate:coalition:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EA36D0);
  }
  id v14 = v13;
  if (!v13)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"arbiter"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMember initWithUniqueIdentifier:windowScene:delegate:coalition:]();
    }
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)SBKeyboardFocusCoalitionMember;
  v15 = [(SBKeyboardFocusCoalitionMember *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSString *)v16;

    objc_storeWeak((id *)&v15->_sbWindowScene, v11);
    objc_storeWeak((id *)&v15->_delegate, v12);
    objc_storeWeak((id *)&v15->_coalition, v14);
  }

  return v15;
}

- (SBKeyboardFocusCoalitionMemberPreferences)preferences
{
  return self->_preferences;
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

- (void)invalidate
{
  self->_invalidated = 1;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __60__SBKeyboardFocusCoalitionMember_appendDescriptionToStream___block_invoke;
  id v12 = &unk_1E6AF5290;
  id v5 = v4;
  id v13 = v5;
  id v14 = self;
  [v5 appendProem:self block:&v9];
  if ((objc_msgSend(v5, "hasSuccinctStyle", v9, v10, v11, v12) & 1) == 0)
  {
    id v6 = (id)[v5 appendObject:self->_preferences withName:@"preferences"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = (id)[v5 appendObject:WeakRetained withName:@"delegate"];
  }
}

id __60__SBKeyboardFocusCoalitionMember_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 25) withName:@"focus"];
}

- (SBWindowScene)sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setSbWindowScene:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (SBKeyboardFocusCoalitionMemberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBKeyboardFocusCoalitionMemberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_destroyWeak((id *)&self->_coalition);
}

- (void)initWithUniqueIdentifier:windowScene:delegate:coalition:.cold.1()
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

- (void)initWithUniqueIdentifier:windowScene:delegate:coalition:.cold.2()
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

- (void)initWithUniqueIdentifier:windowScene:delegate:coalition:.cold.3()
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

- (void)requestArbitration:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateCoalitionPreferencesWithReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end