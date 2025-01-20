@interface _SBKeyboardFocusCoalitionPolicyEnforcer
- (BKSHIDEventDeferringPredicate)predicate;
- (BKSHIDEventDeferringTarget)enforcedTarget;
- (BSInvalidatable)focusRule;
- (NSString)deferringRuleReason;
- (_SBKeyboardFocusCoalitionPolicyEnforcer)initWithDeferringRulePredicate:(id)a3 deferringRuleReason:(id)a4 debugName:(id)a5;
- (_SBKeyboardFocusCoalitionPolicyEnforcer)initWithDeferringRulePredicate:(id)a3 deferringRuleReason:(id)a4 debugName:(id)a5 deliveryManager:(id)a6;
- (id)deferringTargetForPolicy:(id)a3;
- (void)enforce:(id)a3;
- (void)setEnforcedTarget:(id)a3;
- (void)setFocusRule:(id)a3;
- (void)stopEnforcing;
@end

@implementation _SBKeyboardFocusCoalitionPolicyEnforcer

- (void)enforce:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(_SBKeyboardFocusCoalitionPolicyEnforcer *)self deferringTargetForPolicy:a3];
  if (!self->_enforcedTarget || !self->_focusRule || (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_enforcedTarget, v4);
    [(BSInvalidatable *)self->_focusRule invalidate];
    v5 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager deferEventsMatchingPredicate:self->_predicate toTarget:self->_enforcedTarget withReason:self->_deferringRuleReason];
    focusRule = self->_focusRule;
    self->_focusRule = v5;

    v7 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(BKSHIDEventDeferringPredicate *)self->_predicate environment];
      predicate = self->_predicate;
      enforcedTarget = self->_enforcedTarget;
      int v11 = 138543874;
      v12 = v8;
      __int16 v13 = 2114;
      v14 = predicate;
      __int16 v15 = 2114;
      v16 = enforcedTarget;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "rules: (%{public}@) deferring (%{public}@) -> %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (id)deferringTargetForPolicy:(id)a3
{
  v3 = [a3 sbWindowSceneAncestor];
  v4 = +[SBKeyboardFocusTarget targetForSBWindowScene:v3];

  v5 = -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v4);

  return v5;
}

- (_SBKeyboardFocusCoalitionPolicyEnforcer)initWithDeferringRulePredicate:(id)a3 deferringRuleReason:(id)a4 debugName:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F4F2A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 sharedInstance];
  __int16 v13 = [(_SBKeyboardFocusCoalitionPolicyEnforcer *)self initWithDeferringRulePredicate:v11 deferringRuleReason:v10 debugName:v9 deliveryManager:v12];

  return v13;
}

- (_SBKeyboardFocusCoalitionPolicyEnforcer)initWithDeferringRulePredicate:(id)a3 deferringRuleReason:(id)a4 debugName:(id)a5 deliveryManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_SBKeyboardFocusCoalitionPolicyEnforcer;
  __int16 v15 = [(_SBKeyboardFocusCoalitionPolicyEnforcer *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_predicate, a3);
    uint64_t v17 = [v12 copy];
    deferringRuleReason = v16->_deferringRuleReason;
    v16->_deferringRuleReason = (NSString *)v17;

    objc_storeStrong((id *)&v16->_deliveryManager, a6);
    uint64_t v19 = [v13 copy];
    debugName = v16->_debugName;
    v16->_debugName = (NSString *)v19;
  }
  return v16;
}

- (void)stopEnforcing
{
  enforcedTarget = self->_enforcedTarget;
  self->_enforcedTarget = 0;

  [(BSInvalidatable *)self->_focusRule invalidate];
  focusRule = self->_focusRule;
  self->_focusRule = 0;
}

- (BKSHIDEventDeferringPredicate)predicate
{
  return self->_predicate;
}

- (NSString)deferringRuleReason
{
  return self->_deferringRuleReason;
}

- (BKSHIDEventDeferringTarget)enforcedTarget
{
  return self->_enforcedTarget;
}

- (void)setEnforcedTarget:(id)a3
{
}

- (BSInvalidatable)focusRule
{
  return self->_focusRule;
}

- (void)setFocusRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRule, 0);
  objc_storeStrong((id *)&self->_enforcedTarget, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_deferringRuleReason, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end