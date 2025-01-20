@interface SBSystemKeyCommandCoalitionPolicyEnforcer
- (SBSystemKeyCommandCoalitionPolicyEnforcer)init;
- (void)enforce:(id)a3;
- (void)invalidate;
- (void)stopEnforcing;
@end

@implementation SBSystemKeyCommandCoalitionPolicyEnforcer

- (void)enforce:(id)a3
{
}

- (SBSystemKeyCommandCoalitionPolicyEnforcer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBSystemKeyCommandCoalitionPolicyEnforcer;
  v2 = [(SBSystemKeyCommandCoalitionPolicyEnforcer *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    v4 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
    [v3 setEnvironment:v4];

    v5 = [(_SBKeyboardFocusCoalitionPolicyEnforcer *)[_SBSystemKeyCommandCoalitionPolicyEnforcer alloc] initWithDeferringRulePredicate:v3 deferringRuleReason:@"systemKeyCommandOverlayEnvironment to root scene" debugName:@"SBSystemKeyCommandPolicyEnforcer-Coalition"];
    enforcer = v2->_enforcer;
    v2->_enforcer = &v5->super;
  }
  return v2;
}

- (void)stopEnforcing
{
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

@end