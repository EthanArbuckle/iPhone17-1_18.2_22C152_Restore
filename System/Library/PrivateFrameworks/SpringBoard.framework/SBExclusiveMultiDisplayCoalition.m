@interface SBExclusiveMultiDisplayCoalition
- (BOOL)_selectMemberPolicy:(id)a3;
- (SBKeyboardFocusCoalitionMember)embeddedMember;
- (SBKeyboardFocusCoalitionMember)externalMember;
- (SBKeyboardFocusCoalitionMember)initiallyFocusedMember;
- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4;
- (void)_arbitrateWithRequestingMember:(id)a3 reason:(id)a4;
- (void)_performInitialArbitrationWithReason:(id)a3;
- (void)addedMember:(id)a3;
- (void)invalidate;
- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4;
- (void)setNeedsArbitrationForReason:(id)a3;
@end

@implementation SBExclusiveMultiDisplayCoalition

- (void)addedMember:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = (SBKeyboardFocusCoalitionMember *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  [(SBKeyboardFocusCoalition *)&v18 addedMember:v5];
  v6 = [(SBKeyboardFocusCoalitionMember *)v5 sbWindowScene];
  v7 = [v6 _sbDisplayConfiguration];
  v8 = [v7 identity];
  int v9 = [v8 isMainDisplay];

  if (v9)
  {
    embeddedMember = self->_embeddedMember;
    self->_embeddedMember = v5;

    v11 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(SBKeyboardFocusCoalition *)self debugName];
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      v13 = "[%{public}@] added embedded display member";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
  }
  else
  {
    if (self->_externalMember)
    {
      v14 = NSString;
      v15 = [(SBKeyboardFocusCoalitionMember *)v5 uniqueIdentifier];
      v16 = [(SBKeyboardFocusCoalitionMember *)self->_externalMember uniqueIdentifier];
      v17 = [v14 stringWithFormat:@"Trying to add external member %@ but already tracking %@", v15, v16];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(SBExclusiveMultiDisplayCoalition *)a2 addedMember:(uint64_t)v17];
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8B5EAC8);
    }
    self->_externalMember = v5;

    v11 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(SBKeyboardFocusCoalition *)self debugName];
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      v13 = "[%{public}@] added external display member";
      goto LABEL_7;
    }
  }
}

- (void)setNeedsArbitrationForReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  id v4 = a3;
  [(SBKeyboardFocusCoalition *)&v5 setNeedsArbitrationForReason:v4];
  -[SBExclusiveMultiDisplayCoalition _arbitrateWithRequestingMember:reason:](self, "_arbitrateWithRequestingMember:reason:", 0, v4, v5.receiver, v5.super_class);
}

- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  id v6 = a4;
  id v7 = a3;
  [(SBKeyboardFocusCoalition *)&v8 memberRequestsArbitration:v7 forReason:v6];
  -[SBExclusiveMultiDisplayCoalition _arbitrateWithRequestingMember:reason:](self, "_arbitrateWithRequestingMember:reason:", v7, v6, v8.receiver, v8.super_class);
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  [(SBKeyboardFocusCoalition *)&v2 invalidate];
}

- (SBKeyboardFocusCoalitionMember)initiallyFocusedMember
{
  return self->_embeddedMember;
}

- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4
{
  return self->_embeddedMember;
}

- (void)_performInitialArbitrationWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = [(SBKeyboardFocusCoalition *)self members];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (id)[*(id *)(*((void *)&v13 + 1) + 8 * v9++) updateCoalitionPreferencesWithReason:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [(SBExclusiveMultiDisplayCoalition *)self initiallyFocusedMember];
  [(SBExclusiveMultiDisplayCoalition *)self _selectMemberPolicy:v11];

  v12 = [(SBKeyboardFocusCoalition *)self delegate];
  [v12 keyboardFocusCoalitionDidUpdateEnforcedPolicy:self];
}

- (void)_arbitrateWithRequestingMember:(id)a3 reason:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(SBKeyboardFocusCoalition *)self isKeyboardFocusEvaluationSuppressed])
  {
    uint64_t v9 = SBLogKeyboardFocus();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_23:

LABEL_24:
      return;
    }
    id v10 = [(SBKeyboardFocusCoalition *)self debugName];
    v11 = [(SBKeyboardFocusCoalition *)self keyboardFocusEvaluationSupressionReasons];
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - but we are supressing keyboard focus evaluation for reasons: %{public}@", buf, 0x20u);

LABEL_22:
    goto LABEL_23;
  }
  if ([(SBKeyboardFocusCoalition *)self isInvalidated])
  {
    uint64_t v9 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(SBKeyboardFocusCoalition *)self debugName];
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - but we invalidated", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if (!self->_enforcedMember)
  {
    v17 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(SBKeyboardFocusCoalition *)self debugName];
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - performing initial arbitration]", buf, 0x16u);
    }
    [(SBExclusiveMultiDisplayCoalition *)self _performInitialArbitrationWithReason:v8];
    goto LABEL_24;
  }
  uint64_t v9 = [(SBExclusiveMultiDisplayCoalition *)self updatePolicyForArbitrationRequestFromMember:v7 reason:v8];
  long long v13 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = [(SBKeyboardFocusCoalition *)self debugName];
    long long v15 = [v9 uniqueIdentifier];
    long long v16 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138544130;
    v25 = v14;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    v29 = v15;
    __int16 v30 = 2114;
    v31 = v16;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - selecting member:%{public}@ requested by:%{public}@", buf, 0x2Au);
  }
  if ([(SBExclusiveMultiDisplayCoalition *)self _selectMemberPolicy:v9])
  {
    id v10 = [(SBKeyboardFocusCoalition *)self delegate];
    [v10 keyboardFocusCoalitionDidUpdateEnforcedPolicy:self];
    goto LABEL_22;
  }
  enforcedMember = self->_enforcedMember;
  if (enforcedMember == self->_embeddedMember)
  {
    id v10 = SBLogKeyboardFocus();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v20 = [(SBKeyboardFocusCoalition *)self debugName];
    uint64_t v21 = [(SBKeyboardFocusCoalitionMember *)self->_enforcedMember succinctDescription];
    *(_DWORD *)buf = 138543874;
    v25 = v20;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    v29 = v21;
    v22 = "[%{public}@] arbitration: %{public}@ - policy unchanged; embedded member still focused: %{public}@";
    goto LABEL_21;
  }
  if (enforcedMember == self->_externalMember)
  {
    id v10 = SBLogKeyboardFocus();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v20 = [(SBKeyboardFocusCoalition *)self debugName];
    uint64_t v21 = [(SBKeyboardFocusCoalitionMember *)self->_enforcedMember succinctDescription];
    *(_DWORD *)buf = 138543874;
    v25 = v20;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    v29 = v21;
    v22 = "[%{public}@] arbitration: %{public}@ - policy unchanged; external member still focused: %{public}@";
LABEL_21:
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v22, buf, 0x20u);

    goto LABEL_22;
  }
  v23 = [NSString stringWithFormat:@"unknown member %@ focused", self->_enforcedMember];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBExclusiveMultiDisplayCoalition _arbitrateWithRequestingMember:reason:](a2, (uint64_t)self, (uint64_t)v23);
  }
  [v23 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)_selectMemberPolicy:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 preferences];
  id v7 = [v6 policy];
  if ([(SBKeyboardFocusCoalitionMember *)self->_enforcedMember isEqual:v5]
    && [(SBKeyboardFocusCoalitionMemberPreferences *)self->_enforcedPreferences isEqual:v6])
  {
    id v8 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SBKeyboardFocusCoalition *)self debugName];
      *(_DWORD *)buf = 138543362;
      v38 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: no change", buf, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_enforcedMember, a3);
    objc_storeStrong((id *)&self->_enforcedPreferences, v6);
    v11 = [(SBKeyboardFocusCoalition *)self policyEnforcer];
    [v11 enforce:v7];

    [(SBKeyboardFocusCoalition *)self setEnforcedPolicy:v7];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = [(SBKeyboardFocusCoalition *)self members];
    uint64_t v12 = [v8 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v27 = v7;
      __int16 v28 = v6;
      uint64_t v14 = *(void *)v34;
      uint64_t v29 = *(void *)v34;
      __int16 v30 = self;
      do
      {
        uint64_t v15 = 0;
        uint64_t v31 = v13;
        do
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v8);
          }
          id v16 = *(id *)(*((void *)&v33 + 1) + 8 * v15);
          [v16 setHasFocus:v16 == v5];
          [v16 focusPolicyDidChange];
          v17 = SBLogKeyboardFocus();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v32 = v16 == v5;
            uint64_t v18 = [(SBKeyboardFocusCoalition *)self debugName];
            v19 = [v16 succinctDescription];
            v20 = [v16 preferences];
            uint64_t v21 = [v20 policy];
            [v21 keyboardFocusTarget];
            v23 = v22 = v8;
            [v23 sceneIdentityToken];
            v25 = id v24 = v5;
            *(_DWORD *)buf = 138544130;
            v38 = v18;
            __int16 v39 = 2114;
            v40 = v19;
            __int16 v41 = 1024;
            BOOL v42 = v32;
            __int16 v43 = 2114;
            v44 = v25;
            _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ hasFocus: %{BOOL}u -- %{public}@ ", buf, 0x26u);

            id v8 = v22;
            self = v30;

            id v5 = v24;
            uint64_t v14 = v29;

            uint64_t v13 = v31;
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v8 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v13);
      BOOL v10 = 1;
      id v7 = v27;
      uint64_t v6 = v28;
    }
    else
    {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (SBKeyboardFocusCoalitionMember)embeddedMember
{
  return self->_embeddedMember;
}

- (SBKeyboardFocusCoalitionMember)externalMember
{
  return self->_externalMember;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcedPreferences, 0);
  objc_storeStrong((id *)&self->_enforcedMember, 0);
  objc_storeStrong((id *)&self->_externalMember, 0);
  objc_storeStrong((id *)&self->_embeddedMember, 0);
}

- (void)addedMember:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBExclusiveMultiDisplayCoalition.m";
  __int16 v10 = 1024;
  int v11 = 50;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_arbitrateWithRequestingMember:(uint64_t)a3 reason:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBExclusiveMultiDisplayCoalition.m";
  __int16 v10 = 1024;
  int v11 = 131;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end