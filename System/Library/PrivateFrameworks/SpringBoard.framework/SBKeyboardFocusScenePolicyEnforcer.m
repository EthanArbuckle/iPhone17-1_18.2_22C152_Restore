@interface SBKeyboardFocusScenePolicyEnforcer
- (BSInvalidatable)localToRemoteKeyboardFocusRule;
- (SBKeyboardFocusPolicy)enforcedPolicy;
- (SBKeyboardFocusScenePolicyEnforcer)initWithDeliveryManager:(id)a3 debugName:(id)a4 systemShellDelegate:(id)a5;
- (SBKeyboardFocusTarget)sentKeyboardFocusOutboundTarget;
- (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate;
- (void)enforce:(id)a3;
- (void)setEnforcedPolicy:(id)a3;
- (void)setLocalToRemoteKeyboardFocusRule:(id)a3;
- (void)setSentKeyboardFocusOutboundTarget:(id)a3;
- (void)setSystemShellBehaviorDelegate:(id)a3;
- (void)stopEnforcing;
@end

@implementation SBKeyboardFocusScenePolicyEnforcer

- (void)enforce:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = (SBKeyboardFocusPolicy *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(SBKeyboardFocusPolicy *)v4 keyboardFocusTarget];
  v6 = [(SBKeyboardFocusPolicy *)v4 sbWindowSceneAncestor];
  v7 = +[SBKeyboardFocusTarget targetForSBWindowScene:v6];
  if (BSEqualObjects())
  {
    v8 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "rules: (keyboardFocus) removing outbound rule -- deferring to SpringBoard", buf, 2u);
    }

    sentKeyboardFocusOutboundTarget = self->_sentKeyboardFocusOutboundTarget;
    self->_sentKeyboardFocusOutboundTarget = 0;

    [(BSInvalidatable *)self->_localToRemoteKeyboardFocusRule invalidate];
    localToRemoteKeyboardFocusRule = self->_localToRemoteKeyboardFocusRule;
    self->_localToRemoteKeyboardFocusRule = 0;
  }
  else
  {
    if ((BSEqualObjects() & 1) == 0)
    {
      v11 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_sentKeyboardFocusOutboundTarget;
        *(_DWORD *)buf = 138543618;
        v33 = v12;
        __int16 v34 = 2114;
        v35 = v5;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "rules: (keyboardFocus) outbound target changed from:%{public}@ to %{public}@", buf, 0x16u);
      }
    }
    v31 = v4;
    localToRemoteKeyboardFocusRule = (BSInvalidatable *)[MEMORY[0x1E4F4F358] new];
    v13 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    [(BSInvalidatable *)localToRemoteKeyboardFocusRule setEnvironment:v13];

    v14 = -[SBKeyboardFocusTarget deferringToken]((uint64_t)v7);
    [(BSInvalidatable *)localToRemoteKeyboardFocusRule setToken:v14];

    [(BSInvalidatable *)self->_localToRemoteKeyboardFocusRule invalidate];
    v15 = self->_localToRemoteKeyboardFocusRule;
    self->_localToRemoteKeyboardFocusRule = 0;

    deliveryManager = self->_deliveryManager;
    -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v5);
    v18 = v17 = v7;
    v19 = NSString;
    v20 = [v6 _FBSScene];
    v21 = [v20 identifier];
    v22 = [v19 stringWithFormat:@"SpringBoard<%@>: enforcing outbound", v21];
    v23 = [(BKSHIDEventDeliveryManager *)deliveryManager deferEventsMatchingPredicate:localToRemoteKeyboardFocusRule toTarget:v18 withReason:v22];
    v24 = self->_localToRemoteKeyboardFocusRule;
    self->_localToRemoteKeyboardFocusRule = v23;

    v7 = v17;
    v25 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v17;
      __int16 v34 = 2114;
      v35 = v5;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "rules: (keyboardFocus) defer (%{public}@) -> %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_sentKeyboardFocusOutboundTarget, v5);
    v4 = v31;
  }

  v26 = [v6 _eventDeferringManager];
  v27 = (void *)MEMORY[0x1E4F1CAD0];
  v28 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
  v29 = [v27 setWithObject:v28];
  [v26 setNeedsRemoteEventDeferringRuleComparisonInEnvironments:v29 forBehaviorDelegate:self->_systemShellBehaviorDelegate withReason:@"SB rule update"];

  enforcedPolicy = self->_enforcedPolicy;
  self->_enforcedPolicy = v4;
}

- (SBKeyboardFocusScenePolicyEnforcer)initWithDeliveryManager:(id)a3 debugName:(id)a4 systemShellDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBKeyboardFocusScenePolicyEnforcer;
  v12 = [(SBKeyboardFocusScenePolicyEnforcer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deliveryManager, a3);
    uint64_t v14 = [v10 copy];
    debugName = v13->_debugName;
    v13->_debugName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_systemShellBehaviorDelegate, a5);
  }

  return v13;
}

- (void)stopEnforcing
{
  [(BSInvalidatable *)self->_localToRemoteKeyboardFocusRule invalidate];
  localToRemoteKeyboardFocusRule = self->_localToRemoteKeyboardFocusRule;
  self->_localToRemoteKeyboardFocusRule = 0;

  enforcedPolicy = self->_enforcedPolicy;
  self->_enforcedPolicy = 0;
}

- (SBKeyboardFocusTarget)sentKeyboardFocusOutboundTarget
{
  return self->_sentKeyboardFocusOutboundTarget;
}

- (void)setSentKeyboardFocusOutboundTarget:(id)a3
{
}

- (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate
{
  return self->_systemShellBehaviorDelegate;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
}

- (BSInvalidatable)localToRemoteKeyboardFocusRule
{
  return self->_localToRemoteKeyboardFocusRule;
}

- (void)setLocalToRemoteKeyboardFocusRule:(id)a3
{
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (void)setEnforcedPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_storeStrong((id *)&self->_localToRemoteKeyboardFocusRule, 0);
  objc_storeStrong((id *)&self->_systemShellBehaviorDelegate, 0);
  objc_storeStrong((id *)&self->_sentKeyboardFocusOutboundTarget, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end