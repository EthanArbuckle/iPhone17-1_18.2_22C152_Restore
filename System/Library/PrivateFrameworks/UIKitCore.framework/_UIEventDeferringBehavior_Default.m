@interface _UIEventDeferringBehavior_Default
- (BOOL)shouldAllowFallbackWindowForEnvironment:(id)a3;
- (BOOL)shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring;
- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges;
- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardSettingsSceneChanges;
- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement;
- (BOOL)shouldSuppressRemoteRuleForOwningElement:(id)a3 inEnvironment:(id)a4;
- (BOOL)systemShellManagesKeyboardFocus;
- (BOOL)wantsLocalCompatibilityRules;
- (BOOL)wantsLocalIdealRules;
- (BOOL)wantsSystemKeyCommandOverlayRules;
- (NSString)debugDescription;
- (_UIEventDeferringBehavior_Default)init;
- (_UIEventDeferringBehavior_Default)initWithEventDeferringManager:(id)a3;
- (_UIEventDeferringManager)eventDeferringManager;
- (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compareRemoteRuleOwningElement:(id)a3 toElement:(id)a4 inEnvironment:(id)a5;
- (int64_t)isRemoteRuleOwningElement:(id)a3 andContainingWindow:(id)a4 visibleComparedToLocalTargetWindow:(id)a5;
- (void)setSystemShellBehaviorDelegate:(id)a3;
- (void)setSystemShellManagesKeyboardFocus:(BOOL)a3;
@end

@implementation _UIEventDeferringBehavior_Default

- (BOOL)wantsLocalIdealRules
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringManager);
  v3 = [WeakRetained windowHostingScene];
  v4 = [v3 _FBSScene];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldAllowFallbackWindowForEnvironment:(id)a3
{
  return 0;
}

- (id)succinctDescription
{
  v2 = [(_UIEventDeferringBehavior_Default *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringBehavior_Default *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:*(unsigned char *)&self->_behaviorFlags & 1 withName:@"systemShellManagesKeyboardFocus"];
  return v3;
}

- (_UIEventDeferringBehavior_Default)initWithEventDeferringManager:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIEventDeferringBehavior_Default;
  id v4 = [(_UIEventDeferringBehavior_Default *)&v9 init];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = objc_storeWeak((id *)&v4->_eventDeferringManager, a3);
    v7 = [a3 windowHostingScene];
    *(unsigned char *)&v5->_behaviorFlags = *(unsigned char *)&v5->_behaviorFlags & 0xFE | _UISceneSystemShellManagesKeyboardFocusForScene(v7);
  }
  return v5;
}

- (BOOL)wantsLocalCompatibilityRules
{
  if (![(_UIEventDeferringBehavior_Default *)self wantsLocalIdealRules]) {
    return 1;
  }
  if (wantsLocalCompatibilityRules_onceToken != -1) {
    dispatch_once(&wantsLocalCompatibilityRules_onceToken, &__block_literal_global_689);
  }
  if (wantsLocalCompatibilityRules_defaultWantsCompatRules) {
    return ![(_UIEventDeferringBehavior_Default *)self systemShellManagesKeyboardFocus];
  }
  else {
    return 0;
  }
}

- (BOOL)systemShellManagesKeyboardFocus
{
  return *(unsigned char *)&self->_behaviorFlags & 1;
}

- (_UIEventDeferringBehavior_Default)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIEventDeferringBehavior_Default.m", 32, @"init is not allowed on %@", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate
{
  return 0;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, self, @"_UIEventDeferringBehavior_Default.m", 52, @"%s: Invalid to set a system shell behavior delegate for this class: %@", "-[_UIEventDeferringBehavior_Default setSystemShellBehaviorDelegate:]", self object file lineNumber description];
}

- (void)setSystemShellManagesKeyboardFocus:(BOOL)a3
{
  char behaviorFlags = (char)self->_behaviorFlags;
  if ((behaviorFlags & 1) != 0 || !a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIEventDeferringBehavior_Default.m", 61, @"%s: This method should never be called again after it is set", "-[_UIEventDeferringBehavior_Default setSystemShellManagesKeyboardFocus:]");

    char behaviorFlags = (char)self->_behaviorFlags;
  }
  *(unsigned char *)&self->_char behaviorFlags = behaviorFlags & 0xFE | a3;
}

- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement
{
  return 0;
}

- (BOOL)shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring
{
  return 0;
}

- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardSettingsSceneChanges
{
  return 1;
}

- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges
{
  return 0;
}

- (BOOL)shouldSuppressRemoteRuleForOwningElement:(id)a3 inEnvironment:(id)a4
{
  return 0;
}

- (int64_t)compareRemoteRuleOwningElement:(id)a3 toElement:(id)a4 inEnvironment:(id)a5
{
  return _UIEventDeferringBehaviorCompareRuleOwningElementToElement(a3, a4);
}

- (int64_t)isRemoteRuleOwningElement:(id)a3 andContainingWindow:(id)a4 visibleComparedToLocalTargetWindow:(id)a5
{
  return 0;
}

- (BOOL)wantsSystemKeyCommandOverlayRules
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEventDeferringBehavior_Default *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringBehavior_Default *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (_UIEventDeferringManager)eventDeferringManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringManager);
  return (_UIEventDeferringManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemShellBehaviorDelegate);
  objc_destroyWeak((id *)&self->_eventDeferringManager);
}

@end