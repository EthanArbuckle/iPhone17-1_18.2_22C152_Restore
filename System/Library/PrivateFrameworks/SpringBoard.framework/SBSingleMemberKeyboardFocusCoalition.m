@interface SBSingleMemberKeyboardFocusCoalition
- (SBSingleMemberKeyboardFocusCoalition)init;
- (void)_arbitrateForReason:(id)a3;
- (void)addedMember:(id)a3;
- (void)invalidate;
- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4;
- (void)removedMember:(id)a3;
- (void)setNeedsArbitrationForReason:(id)a3;
@end

@implementation SBSingleMemberKeyboardFocusCoalition

- (void)_arbitrateForReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBKeyboardFocusCoalition *)self isKeyboardFocusEvaluationSuppressed])
  {
    v5 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(SBKeyboardFocusCoalition *)self debugName];
      v7 = [(SBKeyboardFocusCoalition *)self keyboardFocusEvaluationSupressionReasons];
      int v16 = 138543874;
      v17 = v6;
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _abritrateForReason: %{public}@ - but we are supressing keyboard focus evaluation for reasons: %{public}@", (uint8_t *)&v16, 0x20u);

LABEL_16:
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ([(SBKeyboardFocusCoalition *)self isInvalidated])
  {
    v5 = SBLogKeyboardFocus();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v8 = [(SBKeyboardFocusCoalition *)self debugName];
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2114;
    id v19 = v4;
    v9 = "[%{public}@] _abritrateForReason: %{public}@ - but we invalidated";
LABEL_13:
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0x16u);

    goto LABEL_17;
  }
  member = self->_member;
  if (member)
  {
    v5 = [(SBKeyboardFocusCoalitionMember *)member updateCoalitionPreferencesWithReason:v4];
    v6 = [v5 policy];
    v11 = [(SBKeyboardFocusCoalition *)self enforcedPolicy];
    int v12 = [v11 isEqual:v6];

    if (v12)
    {
      v13 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(SBKeyboardFocusCoalition *)self debugName];
        int v16 = 138543618;
        v17 = v14;
        __int16 v18 = 2114;
        id v19 = v4;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] _abritrateForReason: %{public}@ - new policy is unchanged", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      v15 = [(SBKeyboardFocusCoalition *)self policyEnforcer];
      [v15 enforce:v6];

      [(SBKeyboardFocusCoalition *)self setEnforcedPolicy:v6];
      [(SBKeyboardFocusCoalitionMember *)self->_member setHasFocus:1];
      [(SBKeyboardFocusCoalitionMember *)self->_member focusPolicyDidChange];
      v13 = [(SBKeyboardFocusCoalition *)self delegate];
      [v13 keyboardFocusCoalitionDidUpdateEnforcedPolicy:self];
    }

    goto LABEL_16;
  }
  v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(SBKeyboardFocusCoalition *)self debugName];
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2114;
    id v19 = v4;
    v9 = "[%{public}@] _abritrateForReason: %{public}@ - but we have no member";
    goto LABEL_13;
  }
LABEL_17:
}

- (void)setNeedsArbitrationForReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  id v4 = a3;
  [(SBKeyboardFocusCoalition *)&v5 setNeedsArbitrationForReason:v4];
  -[SBSingleMemberKeyboardFocusCoalition _arbitrateForReason:](self, "_arbitrateForReason:", v4, v5.receiver, v5.super_class);
}

- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4
{
  v7 = (SBKeyboardFocusCoalitionMember *)a3;
  id v8 = a4;
  if (self->_member != v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSingleMemberKeyboardFocusCoalition.m" lineNumber:43 description:@"member requested arbitration but it isn't the one i'm tracking"];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  [(SBKeyboardFocusCoalition *)&v10 memberRequestsArbitration:v7 forReason:v8];
  [(SBSingleMemberKeyboardFocusCoalition *)self _arbitrateForReason:v8];
}

- (SBSingleMemberKeyboardFocusCoalition)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  return (SBSingleMemberKeyboardFocusCoalition *)[(SBKeyboardFocusCoalition *)&v3 _initWithDebugName:@"Single Member Coalition"];
}

- (void)addedMember:(id)a3
{
  objc_super v5 = (SBKeyboardFocusCoalitionMember *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  [(SBKeyboardFocusCoalition *)&v9 addedMember:v5];
  if (self->_member)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [(SBKeyboardFocusCoalitionMember *)v5 uniqueIdentifier];
    [v7 handleFailureInMethod:a2, self, @"SBSingleMemberKeyboardFocusCoalition.m", 27, @"Trying to add %@ but already tracking %@", v8, self->_member object file lineNumber description];
  }
  member = self->_member;
  self->_member = v5;
}

- (void)removedMember:(id)a3
{
  objc_super v5 = (SBKeyboardFocusCoalitionMember *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  [(SBKeyboardFocusCoalition *)&v9 removedMember:v5];
  member = v5;
  if (self->_member != v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [(SBKeyboardFocusCoalitionMember *)v5 uniqueIdentifier];
    [v7 handleFailureInMethod:a2, self, @"SBSingleMemberKeyboardFocusCoalition.m", 33, @"Trying to remove a member: %@ that I'm not tracking", v8 object file lineNumber description];

    member = self->_member;
  }
  self->_member = 0;
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  [(SBKeyboardFocusCoalition *)&v2 invalidate];
}

- (void).cxx_destruct
{
}

@end