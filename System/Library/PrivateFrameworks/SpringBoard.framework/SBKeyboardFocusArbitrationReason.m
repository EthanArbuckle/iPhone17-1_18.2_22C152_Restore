@interface SBKeyboardFocusArbitrationReason
+ (id)accessibility:(id)a3;
+ (id)appFocusRedirections;
+ (id)assistantControllerVisibility;
+ (id)backlightControllerDidAnimate;
+ (id)deferAdditionalEnvironments;
+ (id)didChangeShowingSystemModalAlert;
+ (id)didDismissTransientOverlayScene;
+ (id)didRemoveKeyboardFocusFromScene;
+ (id)didResetCoalition;
+ (id)displayDidBecomeActive;
+ (id)dsahBoardAppViewControllerDidAppear;
+ (id)dsahBoardAppViewControllerDidDisappear;
+ (id)focusLockAssertionsDidChange;
+ (id)focusRedirectAssertionsDidChange;
+ (id)keyWindowNotification;
+ (id)keyboardArbiterSuggestion;
+ (id)keyboardFocusEvaluationSuppression;
+ (id)longLookDidDismissForNotificationViewController;
+ (id)longLookDidPresentForNotificationViewController;
+ (id)modalUIFluidDismissGestureDidFinish;
+ (id)preventFocusForPID;
+ (id)removedCoalitionMember;
+ (id)removedKeyboardArbiterSceneDidRemove;
+ (id)removedKeyboardArbiterSceneWillRemove;
+ (id)showWindowedAccessoryWindow;
+ (id)spotlightMultiplexingDidBecomeActiveDelegate;
+ (id)spotlightMultiplexingDidCreateScene;
+ (id)spotlightMultiplexingDidDestroyScene;
+ (id)spotlightMultiplexingViewDidDisappear;
+ (id)transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete;
+ (id)transientOverlayDismissWorkspaceTransactionDidBegin;
+ (id)willPresentTransientOverlayScene;
+ (id)workspaceDidFinishInitialization;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyboardArbiterSuggestion;
- (NSString)description;
- (NSString)label;
- (id)_initForKeyboardArbiterWithLabel:(id)a3;
- (id)_initWithLabel:(id)a3;
- (id)_initWithName:(id)a3 source:(id)a4;
- (id)annotatedWithSourceName:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBKeyboardFocusArbitrationReason

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBKeyboardFocusArbitrationReason_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

+ (id)keyWindowNotification
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"keyWindowNotification"];
  return v2;
}

- (id)_initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusArbitrationReason;
  id v5 = [(SBKeyboardFocusArbitrationReason *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (id)keyboardArbiterSuggestion
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initForKeyboardArbiterWithLabel:@"keyboardArbiterSuggestion"];
  return v2;
}

- (id)_initForKeyboardArbiterWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusArbitrationReason;
  id v5 = [(SBKeyboardFocusArbitrationReason *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_fromKeyboardArbiter = 1;
  }

  return v5;
}

uint64_t __62__SBKeyboardFocusArbitrationReason_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:0];
  if (*(void *)(*(void *)(a1 + 40) + 8))
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "appendString:withName:");
  }
  return result;
}

- (id)_initWithName:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBKeyboardFocusArbitrationReason;
  v8 = [(SBKeyboardFocusArbitrationReason *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    sourceName = v8->_sourceName;
    v8->_sourceName = (NSString *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_label hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_label isEqual:v4[3]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)didChangeShowingSystemModalAlert
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"didChangeShowingSystemModalAlert"];
  return v2;
}

+ (id)dsahBoardAppViewControllerDidAppear
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"dsahBoardAppViewControllerDidAppear"];
  return v2;
}

+ (id)dsahBoardAppViewControllerDidDisappear
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"dsahBoardAppViewControllerDidDisappear"];
  return v2;
}

+ (id)longLookDidDismissForNotificationViewController
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"longLookDidDismissForNotificationViewController"];
  return v2;
}

+ (id)longLookDidPresentForNotificationViewController
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"longLookDidPresentForNotificationViewController"];
  return v2;
}

+ (id)modalUIFluidDismissGestureDidFinish
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"modalUIFluidDismissGestureDidFinish"];
  return v2;
}

+ (id)showWindowedAccessoryWindow
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"showWindowedAccessoryWindow"];
  return v2;
}

+ (id)spotlightMultiplexingDidBecomeActiveDelegate
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"spotlightMultiplexingDidBecomeActiveDelegate"];
  return v2;
}

+ (id)spotlightMultiplexingDidCreateScene
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"spotlightMultiplexingDidCreateScene"];
  return v2;
}

+ (id)spotlightMultiplexingDidDestroyScene
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"spotlightMultiplexingDidDestroyScene"];
  return v2;
}

+ (id)spotlightMultiplexingViewDidDisappear
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"spotlightMultiplexingViewDidDisappear"];
  return v2;
}

+ (id)transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete"];
  return v2;
}

+ (id)transientOverlayDismissWorkspaceTransactionDidBegin
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"transientOverlayDismissWorkspaceTransactionDidBegin"];
  return v2;
}

+ (id)willPresentTransientOverlayScene
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"willPresentTransientOverlayScene"];
  return v2;
}

+ (id)didDismissTransientOverlayScene
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"didDismissTransientOverlayScene"];
  return v2;
}

+ (id)workspaceDidFinishInitialization
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"workspaceDidFinishInitialization"];
  return v2;
}

+ (id)assistantControllerVisibility
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"assistantControllerVisibility"];
  return v2;
}

+ (id)backlightControllerDidAnimate
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"backlightControllerDidAnimate"];
  return v2;
}

+ (id)didResetCoalition
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initForKeyboardArbiterWithLabel:@"didResetCoalition"];
  return v2;
}

+ (id)didRemoveKeyboardFocusFromScene
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initForKeyboardArbiterWithLabel:@"didRemoveKeyboardFocusFromScene"];
  return v2;
}

+ (id)deferAdditionalEnvironments
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"deferAdditionalEnvironments"];
  return v2;
}

+ (id)preventFocusForPID
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"preventFocusForPID"];
  return v2;
}

+ (id)appFocusRedirections
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"appFocusRedirections"];
  return v2;
}

+ (id)accessibility:(id)a3
{
  id v4 = a3;
  char v5 = NSString;
  objc_opt_class();
  id v6 = (objc_class *)objc_opt_class();
  if (!v4)
  {
    uint64_t v11 = NSStringFromClass(v6);
    v12 = [v5 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"subreason", v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBKeyboardFocusArbitrationReason accessibility:](a2);
    }
LABEL_13:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D87ED65CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = NSString;
    objc_super v14 = (objc_class *)[v4 classForCoder];
    if (!v14) {
      objc_super v14 = (objc_class *)objc_opt_class();
    }
    v15 = NSStringFromClass(v14);
    objc_opt_class();
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v12 = [v13 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"subreason", v15, v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBKeyboardFocusArbitrationReason accessibility:](a2);
    }
    goto LABEL_13;
  }

  id v7 = [SBKeyboardFocusArbitrationReason alloc];
  v8 = [@"accessibility-" stringByAppendingString:v4];
  id v9 = [(SBKeyboardFocusArbitrationReason *)v7 _initWithLabel:v8];

  return v9;
}

+ (id)keyboardFocusEvaluationSuppression
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"keyboardFocusEvaluationSuppression"];
  return v2;
}

+ (id)removedCoalitionMember
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"removedCoalitionMember"];
  return v2;
}

+ (id)displayDidBecomeActive
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"displayDidBecomeActive"];
  return v2;
}

+ (id)focusLockAssertionsDidChange
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"focusLockAssertionsDidChange"];
  return v2;
}

+ (id)focusRedirectAssertionsDidChange
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"focusRedirectAssertionsDidChange"];
  return v2;
}

+ (id)removedKeyboardArbiterSceneDidRemove
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"removedKeyboardArbiterSceneDidRemove"];
  return v2;
}

+ (id)removedKeyboardArbiterSceneWillRemove
{
  id v2 = [[SBKeyboardFocusArbitrationReason alloc] _initWithLabel:@"removedKeyboardArbiterSceneWillRemove"];
  return v2;
}

- (BOOL)isKeyboardArbiterSuggestion
{
  return self->_fromKeyboardArbiter;
}

- (id)annotatedWithSourceName:(id)a3
{
  id v4 = a3;
  id v5 = [[SBKeyboardFocusArbitrationReason alloc] _initWithName:self->_label source:v4];

  return v5;
}

- (NSString)label
{
  return self->_label;
}

+ (void)accessibility:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_9();
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end