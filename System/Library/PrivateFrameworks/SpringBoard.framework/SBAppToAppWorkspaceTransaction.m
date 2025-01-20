@interface SBAppToAppWorkspaceTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)_hasPostAnimationTasks;
- (BOOL)_hasPreAnimationTasks;
- (BOOL)_shouldResignActiveForAnimation;
- (BOOL)_transitionWasCancelled;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (BOOL)preventWhitePointAdaptationStrengthUpdateOnComplete;
- (BOOL)shouldAnimateOrientationChangeOnCompletion;
- (BOOL)shouldPerformToAppStateCleanupOnCompletion;
- (SBAppToAppWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (id)_setupAnimation;
- (id)_setupAnimationFrom:(id)a3 to:(id)a4;
- (id)debugDescription;
- (unint64_t)_concurrentOverlayDismissalOptions;
- (unint64_t)_serialOverlayPreDismissalOptions;
- (void)_animationWillBegin:(BOOL)a3;
- (void)_begin;
- (void)_beginTransition;
- (void)_cleanUpAfterAnimation;
- (void)_clearAnimation;
- (void)_didComplete;
- (void)_handleApplicationDidNotChange:(id)a3;
- (void)_handleApplicationUpdateScenesTransactionFailed:(id)a3;
- (void)_performPostAnimationTasksWithCompletion:(id)a3;
- (void)_performPreAnimationTasksWithCompletion:(id)a3;
- (void)dealloc;
- (void)setPreventWhitePointAdaptationStrengthUpdateOnComplete:(BOOL)a3;
@end

@implementation SBAppToAppWorkspaceTransaction

- (BOOL)_canBeInterrupted
{
  if ([(SBWorkspaceTransaction *)self _isInterruptingForTransitionRequest]) {
    return 1;
  }
  v4 = [(SBToAppsWorkspaceTransaction *)self animationController];
  BOOL v3 = v4 == 0;

  return v3;
}

- (id)_setupAnimationFrom:(id)a3 to:(id)a4
{
  v5 = [(SBWorkspaceTransaction *)self suggestedAnimationController];
  if (v5)
  {
    [(SBWorkspaceTransaction *)self setSuggestedAnimationController:0];
    id v6 = v5;
  }
  else
  {
    v7 = [(SBToAppsWorkspaceTransaction *)self _transitionContext];
    if ([(SBToAppsWorkspaceTransaction *)self isGoingToLauncher])
    {
      v8 = +[SBUIController sharedInstance];
      [v8 setHomeScreenAutorotatesEvenWhenIconIsDragging:1];

      objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:logMessage:", objc_msgSend(v7, "interfaceOrientationOrPreferredOrientation"), @"AppToApp setting up animation to launcher / switcher");
      uint64_t v9 = objc_opt_class();
      v10 = [v7 previousEntityForLayoutRole:1];
      v11 = SBSafeCast(v9, v10);

      v12 = [v11 objectForDeactivationSetting:2];
      v13 = v12;
      double v14 = 0.0;
      if (v12)
      {
        [v12 doubleValue];
        double v16 = v15;
        if (v15 <= 3.0)
        {
          double v14 = v15;
        }
        else
        {
          v17 = SBLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[SBAppToAppWorkspaceTransaction _setupAnimationFrom:to:]((uint64_t)v11, v17, v16);
          }
        }
      }
      [(id)SBApp _accessibilityDeactivationAnimationStartDelay];
      if (v14 + v20 > 0.0)
      {
        v21 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v11 setObject:v21 forDeactivationSetting:2];
      }
    }
    else
    {
      if ([(SBToAppsWorkspaceTransaction *)self isGoingToMainSwitcher])
      {
        v18 = +[SBUIController sharedInstance];
        [v18 setHomeScreenAutorotatesEvenWhenIconIsDragging:1];

        objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:logMessage:", objc_msgSend(v7, "interfaceOrientationOrPreferredOrientation"), @"AppToApp setting up animation to launcher / switcher");
      }
      v11 = +[SBUIController sharedInstance];
      v19 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v19);
      [v11 setAllowIconRotation:0 forReason:v13];
    }

    v22 = [(SBWorkspaceTransaction *)self windowScene];
    v23 = [v22 switcherController];
    v24 = [v23 switcherCoordinator];

    v25 = [(SBWorkspaceTransaction *)self transitionRequest];
    v26 = [(SBToAppsWorkspaceTransaction *)self ancillaryTransitionRequests];
    id v6 = [v24 animationControllerForTransitionRequest:v25 ancillaryTransitionRequests:v26];

    v27 = [(SBWorkspaceTransaction *)self transitionRequest];
    v28 = [v6 transitionCoordinator];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __57__SBAppToAppWorkspaceTransaction__setupAnimationFrom_to___block_invoke;
    v31[3] = &unk_1E6B08F40;
    id v32 = v27;
    id v29 = v27;
    [v28 animateAlongsideTransition:v31 completion:0];
  }
  return v6;
}

- (void)_beginTransition
{
  BOOL v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  v4 = [v3 applicationContext];
  char v5 = [v4 disablesAutoPIP];

  if ((v5 & 1) == 0)
  {
    uint64_t v29 = 0;
    id v6 = [(SBWorkspaceTransaction *)self transitionRequest];
    BOOL v7 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:v6 tetheringMode:&v29 reason:2];

    BOOL v8 = [(SBToAppsWorkspaceTransaction *)self isGoingToMainSwitcher];
    if ([(SBToAppsWorkspaceTransaction *)self isGoingToLauncher])
    {
      uint64_t v9 = [(SBWorkspaceTransaction *)self transitionRequest];
      uint64_t v10 = [v9 source];

      LOBYTE(v11) = 0;
      if (v10 == 11 && v29 != 1) {
        BOOL v11 = !SBReduceMotion();
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
    if (v7 && !v8 && !v11)
    {
      [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
      if ([(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction isRunning]) {
        [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction interruptWithReason:@"NewTransition"];
      }
      v12 = [SBAutoPIPWorkspaceTransaction alloc];
      v13 = [(SBWorkspaceTransaction *)self transitionRequest];
      double v14 = [(SBAutoPIPWorkspaceTransaction *)v12 initWithTransitionRequest:v13 includeActiveAppEntity:0 reason:2];
      autoPIPTransaction = self->_autoPIPTransaction;
      self->_autoPIPTransaction = v14;

      double v16 = (OS_dispatch_group *)dispatch_group_create();
      pipDuringSwitchTransitionTasksGroup = self->_pipDuringSwitchTransitionTasksGroup;
      self->_pipDuringSwitchTransitionTasksGroup = v16;

      int64_t v18 = [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction transitionStyle];
      unint64_t v19 = 1;
      if (v18 == 2) {
        unint64_t v19 = 2;
      }
      self->_autoPIPTransitionOrder = v19;
    }
  }
  double v20 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v21 = [v20 source];

  if (v21 == 53)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = -1;
    v22 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__SBAppToAppWorkspaceTransaction__beginTransition__block_invoke;
    v28[3] = &unk_1E6AF5B90;
    v28[4] = &v29;
    [v22 enumerateObjectsUsingBlock:v28];

    if (v30[3] != -1)
    {
      v23 = +[SBWorkspace mainWorkspace];
      v24 = [v23 pipControllerForType:v30[3]];

      v25 = (void *)MEMORY[0x1E4F1CAD0];
      v26 = [v24 hostedAppSceneHandles];
      v27 = [v25 setWithArray:v26];

      [v24 handleDestructionRequestForSceneHandles:v27];
    }
    _Block_object_dispose(&v29, 8);
  }
}

- (void)dealloc
{
  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)SBAppToAppWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v3 dealloc];
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class() canInterruptTransaction:self forTransitionRequest:v4];

  return (char)self;
}

- (SBAppToAppWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAppToAppWorkspaceTransaction;
  char v5 = [(SBToAppsWorkspaceTransaction *)&v16 initWithTransitionRequest:v4];
  if (v5 && SBMainWorkspaceTransitionSourceIsUserEventDriven([v4 source]))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(SBToAppsWorkspaceTransaction *)v5 allLayoutTransactions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "setOptions:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "options") | 2);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (BOOL)shouldPerformToAppStateCleanupOnCompletion
{
  return 0;
}

- (void)_begin
{
  [(SBToAppsWorkspaceTransaction *)self activateApplications];
  v3.receiver = self;
  v3.super_class = (Class)SBAppToAppWorkspaceTransaction;
  [(SBAppToAppWorkspaceTransaction *)&v3 _begin];
}

- (void)_clearAnimation
{
  animation = self->_animation;
  self->_animation = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBAppToAppWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v4 _clearAnimation];
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  v2 = [(SBWorkspaceTransaction *)self transitionRequest];
  objc_super v3 = [v2 applicationContext];
  int v4 = [v3 retainsSiri];

  if (v4) {
    uint64_t v5 = -9;
  }
  else {
    uint64_t v5 = -1;
  }
  if ([v2 shouldPreventEmergencyNotificationBannerDismissal])
  {
    id v6 = [(id)SBApp notificationDispatcher];
    uint64_t v7 = [v6 bannerDestination];
    int v8 = [v7 isPresentingEmergencyNotification];

    if (v8) {
      v5 &= ~0x20uLL;
    }
  }
  if ([v2 source] == 56 || objc_msgSend(v2, "source") == 69) {
    v5 &= ~0x20uLL;
  }
  uint64_t v9 = [v2 source];
  uint64_t v10 = [v2 source];
  if (v9 == 64 || v10 == 65) {
    unint64_t v12 = v5 & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    unint64_t v12 = v5;
  }
  uint64_t v13 = [v2 source];
  uint64_t v14 = [v2 source];
  if (v13 == 37 || v14 == 70) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = v12;
  }
  if ([v2 source] == 71) {
    v16 &= ~0x20uLL;
  }

  return v16;
}

- (BOOL)_hasPreAnimationTasks
{
  autoPIPTransaction = self->_autoPIPTransaction;
  if (!autoPIPTransaction) {
    return 0;
  }
  int v4 = [(SBAutoPIPWorkspaceTransaction *)autoPIPTransaction entityToPIP];
  if (v4) {
    BOOL v5 = self->_autoPIPTransitionOrder == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  objc_super v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v4 = [v3 source];

  BOOL v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v6 = [v5 source];

  uint64_t v8 = v6 == 70 || v4 == 37;
  return v8 << 63 >> 63;
}

- (void)_animationWillBegin:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    if ([v4 count])
    {
      BOOL v5 = [(SBToAppsWorkspaceTransaction *)self fromApplicationSceneEntities];
      uint64_t v6 = [v5 count];

      if (!v6) {
        [(id)SBApp _accessibilityActivationAnimationWillBegin];
      }
    }
    else
    {
    }
    uint64_t v7 = [(SBToAppsWorkspaceTransaction *)self fromApplicationSceneEntities];
    if ([v7 count])
    {
      uint64_t v8 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
      uint64_t v9 = [v8 count];

      if (!v9) {
        [(id)SBApp _accessibilityDeactivationAnimationWillBegin];
      }
    }
    else
    {
    }
  }
  autoPIPTransaction = self->_autoPIPTransaction;
  if (autoPIPTransaction)
  {
    BOOL v11 = [(SBAutoPIPWorkspaceTransaction *)autoPIPTransaction entityToPIP];
    if (v11)
    {
      unint64_t autoPIPTransitionOrder = self->_autoPIPTransitionOrder;

      if (autoPIPTransitionOrder == 1)
      {
        uint64_t v13 = self->_pipDuringSwitchTransitionTasksGroup;
        dispatch_group_enter((dispatch_group_t)v13);
        uint64_t v14 = self->_autoPIPTransaction;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__SBAppToAppWorkspaceTransaction__animationWillBegin___block_invoke;
        v16[3] = &unk_1E6AF5350;
        v17 = v13;
        long long v15 = v13;
        [(SBAutoPIPWorkspaceTransaction *)v14 setCompletionBlock:v16];
        [(SBAppToAppWorkspaceTransaction *)self addChildTransaction:self->_autoPIPTransaction];
      }
    }
  }
}

- (id)_setupAnimation
{
  objc_super v3 = [(SBToAppsWorkspaceTransaction *)self fromApplicationSceneEntities];
  uint64_t v4 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  BOOL v5 = [(SBAppToAppWorkspaceTransaction *)self _setupAnimationFrom:v3 to:v4];

  objc_storeStrong((id *)&self->_animation, v5);
  return v5;
}

- (BOOL)_shouldResignActiveForAnimation
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppToAppWorkspaceTransaction;
  BOOL v3 = [(SBToAppsWorkspaceTransaction *)&v5 _shouldResignActiveForAnimation];
  if (v3) {
    LOBYTE(v3) = [(SBToAppsWorkspaceTransaction *)self toAndFromAppsDiffer];
  }
  return v3;
}

- (BOOL)shouldAnimateOrientationChangeOnCompletion
{
  return 1;
}

- (BOOL)_hasPostAnimationTasks
{
  autoPIPTransaction = self->_autoPIPTransaction;
  if (!autoPIPTransaction || ([(SBAutoPIPWorkspaceTransaction *)autoPIPTransaction isComplete] & 1) != 0) {
    return 0;
  }
  objc_super v5 = [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction entityToPIP];
  if (v5) {
    BOOL v4 = self->_autoPIPTransitionOrder - 1 < 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipDuringSwitchTransitionTasksGroup, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_autoPIPTransaction, 0);
}

- (void)_didComplete
{
  [(SBAppToAppWorkspaceTransaction *)self _cleanUpAfterAnimation];
  BOOL v3 = +[SBUIController sharedInstance];
  BOOL v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 setAllowIconRotation:1 forReason:v5];

  uint64_t v6 = +[SBUIController sharedInstance];
  [v6 setHomeScreenAutorotatesEvenWhenIconIsDragging:0];

  if (![(SBAppToAppWorkspaceTransaction *)self preventWhitePointAdaptationStrengthUpdateOnComplete])
  {
    uint64_t v7 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
    [v7 updateWhitePointAdaptationStrength];
  }
  v8.receiver = self;
  v8.super_class = (Class)SBAppToAppWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v8 _didComplete];
}

void __57__SBAppToAppWorkspaceTransaction__setupAnimationFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
  [v4 updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:*(void *)(a1 + 32) animationTransitionContext:v3];
}

- (BOOL)preventWhitePointAdaptationStrengthUpdateOnComplete
{
  return self->_preventWhitePointAdaptationStrengthUpdateOnComplete;
}

- (void)_cleanUpAfterAnimation
{
  [(SBAppToAppWorkspaceTransaction *)self _clearAnimation];
  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
  [(SBToAppsWorkspaceTransaction *)self performToAppStateCleanup];
}

- (id)debugDescription
{
  v10.receiver = self;
  v10.super_class = (Class)SBAppToAppWorkspaceTransaction;
  id v3 = [(SBAppToAppWorkspaceTransaction *)&v10 debugDescription];
  uint64_t v4 = [(SBToAppsWorkspaceTransaction *)self fromApplicationSceneEntities];
  objc_super v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = @"SpringBoard";
  }
  uint64_t v7 = [(SBToAppsWorkspaceTransaction *)self animationController];
  objc_super v8 = [v3 stringByAppendingFormat:@"\n\tfromApps = %@\n\tanimation = %@", v6, v7];

  return v8;
}

void __50__SBAppToAppWorkspaceTransaction__beginTransition__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  objc_super v5 = [a2 objectForActivationSetting:58];
  if (v5)
  {
    id v6 = v5;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 integerValue];
    objc_super v5 = v6;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != -1) {
    *a3 = 1;
  }
}

- (BOOL)_transitionWasCancelled
{
  return [(SBUIAnimationController *)self->_animation transitionWasCancelled];
}

- (void)_performPreAnimationTasksWithCompletion:(id)a3
{
  id v4 = a3;
  autoPIPTransaction = self->_autoPIPTransaction;
  if (autoPIPTransaction)
  {
    id v6 = [(SBAutoPIPWorkspaceTransaction *)autoPIPTransaction entityToPIP];
    if (v6)
    {
      unint64_t autoPIPTransitionOrder = self->_autoPIPTransitionOrder;

      if (!autoPIPTransitionOrder)
      {
        objc_super v8 = self->_autoPIPTransaction;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __74__SBAppToAppWorkspaceTransaction__performPreAnimationTasksWithCompletion___block_invoke;
        v9[3] = &unk_1E6AF5A50;
        id v10 = v4;
        [(SBAutoPIPWorkspaceTransaction *)v8 setCompletionBlock:v9];
        [(SBAppToAppWorkspaceTransaction *)self addChildTransaction:self->_autoPIPTransaction];
      }
    }
  }
}

uint64_t __74__SBAppToAppWorkspaceTransaction__performPreAnimationTasksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performPostAnimationTasksWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  autoPIPTransaction = self->_autoPIPTransaction;
  if (autoPIPTransaction)
  {
    id v6 = [(SBAutoPIPWorkspaceTransaction *)autoPIPTransaction entityToPIP];
    if (v6)
    {
      unint64_t autoPIPTransitionOrder = self->_autoPIPTransitionOrder;

      if (autoPIPTransitionOrder == 1)
      {
        pipDuringSwitchTransitionTasksGroup = self->_pipDuringSwitchTransitionTasksGroup;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke;
        block[3] = &unk_1E6AF5300;
        unint64_t v19 = v4;
        dispatch_group_notify(pipDuringSwitchTransitionTasksGroup, MEMORY[0x1E4F14428], block);
        uint64_t v9 = v19;
LABEL_8:

        goto LABEL_11;
      }
    }
    id v10 = [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction entityToPIP];
    if (v10)
    {
      unint64_t v11 = self->_autoPIPTransitionOrder;

      if (v11 == 2)
      {
        unint64_t v12 = self->_autoPIPTransaction;
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        long long v15 = __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke_2;
        unint64_t v16 = &unk_1E6AF5A50;
        v17 = v4;
        [(SBAutoPIPWorkspaceTransaction *)v12 setCompletionBlock:&v13];
        -[SBAppToAppWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_autoPIPTransaction, v13, v14, v15, v16);
        uint64_t v9 = v17;
        goto LABEL_8;
      }
    }
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_11:
}

uint64_t __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleApplicationDidNotChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v5 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v10 BOOLForActivationSetting:42] & 1) != 0
          || ([v10 BOOLForActivationSetting:55] & 1) != 0)
        {
          unint64_t v11 = [(id)SBApp windowSceneManager];
          unint64_t v12 = [v10 sceneHandle];
          uint64_t v13 = [v11 windowSceneForSceneHandle:v12];

          uint64_t v14 = [(id)SBApp bannerManager];
          [v14 dismissAllBannersInWindowScene:v13 animated:1 reason:@"appToAppFromBanner"];

          objc_super v5 = (void *)v13;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v15.receiver = self;
  v15.super_class = (Class)SBAppToAppWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v15 _handleApplicationDidNotChange:v4];
}

- (void)_handleApplicationUpdateScenesTransactionFailed:(id)a3
{
  id v4 = [(SBToAppsWorkspaceTransaction *)self animationController];
  if ([v4 waitingToStart])
  {
    [v4 interrupt];
    [(SBAppToAppWorkspaceTransaction *)self _cleanUpAfterAnimation];
  }
}

void __54__SBAppToAppWorkspaceTransaction__animationWillBegin___block_invoke(uint64_t a1)
{
}

- (void)setPreventWhitePointAdaptationStrengthUpdateOnComplete:(BOOL)a3
{
  self->_preventWhitePointAdaptationStrengthUpdateOnComplete = a3;
}

- (void)_setupAnimationFrom:(double)a3 to:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Ignoring too long suspension animation delay %f for %@", (uint8_t *)&v3, 0x16u);
}

@end