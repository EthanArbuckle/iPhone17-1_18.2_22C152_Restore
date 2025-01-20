@interface _UIEventDeferringBehavior_SystemShell
- (BOOL)hasSystemShellDelegate;
- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges;
- (BOOL)shouldSuppressRemoteRuleForOwningElement:(id)a3 inEnvironment:(id)a4;
- (BOOL)systemShellBehaviorDelegateImplementsComparisonOfRemoteRules;
- (BOOL)systemShellBehaviorDelegateImplementsShouldSuppressRemoteRule;
- (BOOL)systemShellBehaviorDelegateImplementsVisibilityOfRemoteRuleWindow;
- (BOOL)systemShellBehaviorDelegateImplementsWantsLocalCompatibilityRules;
- (BOOL)wantsLocalCompatibilityRules;
- (_UIEventDeferringBehavior_SystemShell)initWithEventDeferringManager:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)systemShellBehaviorDelegate;
- (int64_t)compareRemoteRuleOwningElement:(id)a3 toElement:(id)a4 inEnvironment:(id)a5;
- (int64_t)isRemoteRuleOwningElement:(id)a3 andContainingWindow:(id)a4 visibleComparedToLocalTargetWindow:(id)a5;
- (void)setSystemShellBehaviorDelegate:(id)a3;
@end

@implementation _UIEventDeferringBehavior_SystemShell

- (BOOL)wantsLocalCompatibilityRules
{
  if (![(_UIEventDeferringBehavior_Default *)self wantsLocalIdealRules]) {
    return 1;
  }
  char v3 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForSystemShell, @"ShouldWriteCompatibilityEventDeferringRulesForSystemShell");
  if (byte_1E8FD4F6C) {
    char v4 = 1;
  }
  else {
    char v4 = v3;
  }
  if ((~*(unsigned char *)&self->_behaviorDelegateFlags & 3) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return v4 & [(_UIEventDeferringBehavior_Default *)&v10 wantsLocalCompatibilityRules];
  }
  else
  {
    v5 = [(_UIEventDeferringBehavior_SystemShell *)self systemShellBehaviorDelegate];
    char v6 = [v5 eventDeferringManagerSystemShellBehaviorWantsLocalCompatibilityRules];

    char v7 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses, @"ShouldWriteCompatibilityEventDeferringRulesForAllProcesses");
    if (byte_1EB256E84) {
      char v8 = 1;
    }
    else {
      char v8 = v7;
    }
    return v8 & v4 & v6;
  }
}

- (id)systemShellBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellBehaviorDelegate);
  return WeakRetained;
}

- (_UIEventDeferringBehavior_SystemShell)initWithEventDeferringManager:(id)a3
{
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIEventDeferringBehavior_SystemShell.m", 40, @"%s: This is an abstract class that can not be initialized directly.", "-[_UIEventDeferringBehavior_SystemShell initWithEventDeferringManager:]");
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
  char v7 = [(_UIEventDeferringBehavior_Default *)&v11 initWithEventDeferringManager:a3];
  if (v7)
  {
    char v8 = +[_UIEventDeferringManager systemShellBehaviorDelegate];
    [(_UIEventDeferringBehavior_SystemShell *)v7 setSystemShellBehaviorDelegate:v8];
  }
  return v7;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
  *(unsigned char *)&self->_behaviorDelegateFlags &= 0xE1u;
  p_systemShellBehaviorDelegate = &self->_systemShellBehaviorDelegate;
  id v6 = objc_storeWeak((id *)&self->_systemShellBehaviorDelegate, a3);
  *(unsigned char *)&self->_behaviorDelegateFlags = *(unsigned char *)&self->_behaviorDelegateFlags & 0xFE | (a3 != 0);

  id WeakRetained = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if (objc_opt_respondsToSelector()) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_behaviorDelegateFlags = *(unsigned char *)&self->_behaviorDelegateFlags & 0xFD | v9;

    id v10 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if (objc_opt_respondsToSelector()) {
      char v11 = 4;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_behaviorDelegateFlags = *(unsigned char *)&self->_behaviorDelegateFlags & 0xFB | v11;

    id v12 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if (objc_opt_respondsToSelector()) {
      char v13 = 8;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_behaviorDelegateFlags = *(unsigned char *)&self->_behaviorDelegateFlags & 0xF7 | v13;

    id v15 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if (objc_opt_respondsToSelector()) {
      char v14 = 16;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&self->_behaviorDelegateFlags = *(unsigned char *)&self->_behaviorDelegateFlags & 0xEF | v14;
  }
}

- (BOOL)hasSystemShellDelegate
{
  return *(unsigned char *)&self->_behaviorDelegateFlags & 1;
}

- (BOOL)systemShellBehaviorDelegateImplementsWantsLocalCompatibilityRules
{
  return (*(unsigned char *)&self->_behaviorDelegateFlags >> 1) & 1;
}

- (BOOL)systemShellBehaviorDelegateImplementsShouldSuppressRemoteRule
{
  return (*(unsigned char *)&self->_behaviorDelegateFlags >> 2) & 1;
}

- (BOOL)systemShellBehaviorDelegateImplementsComparisonOfRemoteRules
{
  return (*(unsigned char *)&self->_behaviorDelegateFlags >> 3) & 1;
}

- (BOOL)systemShellBehaviorDelegateImplementsVisibilityOfRemoteRuleWindow
{
  return (*(unsigned char *)&self->_behaviorDelegateFlags >> 4) & 1;
}

- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges
{
  return +[_UIRemoteKeyboards enabled];
}

- (BOOL)shouldSuppressRemoteRuleForOwningElement:(id)a3 inEnvironment:(id)a4
{
  if ((~*(unsigned char *)&self->_behaviorDelegateFlags & 5) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return [(_UIEventDeferringBehavior_Default *)&v10 shouldSuppressRemoteRuleForOwningElement:a3 inEnvironment:a4];
  }
  else
  {
    char v7 = [(_UIEventDeferringBehavior_SystemShell *)self systemShellBehaviorDelegate];
    char v8 = [v7 eventDeferringManagerSystemShellBehavior:self shouldSuppressRemoteRuleForOwningElement:a3 inEnvironment:a4];

    return v8;
  }
}

- (int64_t)compareRemoteRuleOwningElement:(id)a3 toElement:(id)a4 inEnvironment:(id)a5
{
  if ((~*(unsigned char *)&self->_behaviorDelegateFlags & 9) != 0)
  {
    v14.receiver = self;
    char v11 = &v14;
    goto LABEL_5;
  }
  char v9 = [(_UIEventDeferringBehavior_SystemShell *)self systemShellBehaviorDelegate];
  int64_t v10 = [v9 eventDeferringManagerSystemShellBehavior:self compareRemoteRuleOwningElement:a3 toElement:a4 inEnvironment:a5];

  if (!v10)
  {
    char v13 = self;
    char v11 = (objc_super *)&v13;
LABEL_5:
    v11->super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return (int64_t)-[objc_super compareRemoteRuleOwningElement:toElement:inEnvironment:](v11, sel_compareRemoteRuleOwningElement_toElement_inEnvironment_, a3, a4, a5, v13);
  }
  return v10;
}

- (int64_t)isRemoteRuleOwningElement:(id)a3 andContainingWindow:(id)a4 visibleComparedToLocalTargetWindow:(id)a5
{
  if ((~*(unsigned char *)&self->_behaviorDelegateFlags & 0x11) != 0)
  {
    v14.receiver = self;
    char v11 = &v14;
    goto LABEL_5;
  }
  char v9 = [(_UIEventDeferringBehavior_SystemShell *)self systemShellBehaviorDelegate];
  int64_t v10 = [v9 eventDeferringManagerSystemShellBehavior:self isRemoteRuleOwningElement:a3 andContainingWindow:a4 visibleComparedToLocalTargetWindow:a5];

  if (!v10)
  {
    char v13 = self;
    char v11 = (objc_super *)&v13;
LABEL_5:
    v11->super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return (int64_t)-[objc_super isRemoteRuleOwningElement:andContainingWindow:visibleComparedToLocalTargetWindow:](v11, sel_isRemoteRuleOwningElement_andContainingWindow_visibleComparedToLocalTargetWindow_, a3, a4, a5, v13);
  }
  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
  v5 = -[_UIEventDeferringBehavior_Default descriptionBuilderWithMultilinePrefix:](&v13, sel_descriptionBuilderWithMultilinePrefix_);
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (void).cxx_destruct
{
}

@end