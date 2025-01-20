@interface SBCoverSheetSceneManager
- (BOOL)isPerformingSceneUpdate;
- (BSInvalidatable)displayLayoutAssertion;
- (BSInvalidatable)stateCaptureInvalidatable;
- (NSMutableArray)pendingSceneUpdateBlocks;
- (SBCoverSheetSceneManager)initWithCoverSheetWindow:(id)a3;
- (UIApplicationSceneDeactivationAssertion)notificationCenterAssertion;
- (UIApplicationSceneDeactivationAssertion)systemAnimationAssertion;
- (UIWindow)coverSheetWindow;
- (void)_performNextSceneUpdateBlock;
- (void)_performSceneUpdateBlock:(id)a3;
- (void)_setDisplayLayoutElementActive:(BOOL)a3;
- (void)_setSceneBackgrounded:(BOOL)a3 suspendUnderLockEnvironment:(BOOL)a4;
- (void)_updateForegroundScenesForNotificationCenter:(BOOL)a3;
- (void)setCoverSheetWindow:(id)a3;
- (void)setDisplayLayoutAssertion:(id)a3;
- (void)setNotificationCenterAssertion:(id)a3;
- (void)setPendingSceneUpdateBlocks:(id)a3;
- (void)setPerformingSceneUpdate:(BOOL)a3;
- (void)setStateCaptureInvalidatable:(id)a3;
- (void)setSystemAnimationAssertion:(id)a3;
- (void)updateForegroundScenesForCoverSheetAnimationActive:(BOOL)a3;
- (void)updateSceneManagerForPresented:(BOOL)a3 suspendUnderLockEnvironment:(BOOL)a4;
@end

@implementation SBCoverSheetSceneManager

- (SBCoverSheetSceneManager)initWithCoverSheetWindow:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBCoverSheetSceneManager;
  v5 = [(SBCoverSheetSceneManager *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_coverSheetWindow, v4);
    v7 = +[SBSceneManagerCoordinator sharedInstance];
    v8 = [v7 sceneDeactivationManager];

    uint64_t v9 = [v8 newAssertionWithReason:1];
    notificationCenterAssertion = v6->_notificationCenterAssertion;
    v6->_notificationCenterAssertion = (UIApplicationSceneDeactivationAssertion *)v9;

    uint64_t v11 = [v8 newAssertionWithReason:5];
    systemAnimationAssertion = v6->_systemAnimationAssertion;
    v6->_systemAnimationAssertion = (UIApplicationSceneDeactivationAssertion *)v11;

    objc_initWeak(&location, v6);
    id v13 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v17, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v6->_stateCaptureInvalidatable;
    v6->_stateCaptureInvalidatable = (BSInvalidatable *)v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v6;
}

id __53__SBCoverSheetSceneManager_initWithCoverSheetWindow___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = @"pendingSceneUpdateBlocks";
    v3 = NSNumber;
    id v4 = [WeakRetained pendingSceneUpdateBlocks];
    v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v10[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v7 = [v6 description];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateSceneManagerForPresented:(BOOL)a3 suspendUnderLockEnvironment:(BOOL)a4
{
}

- (void)updateForegroundScenesForCoverSheetAnimationActive:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIApplicationSceneDeactivationAssertion *)self->_systemAnimationAssertion isAcquired];
  if (v3)
  {
    if ((v5 & 1) == 0)
    {
      v6 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
      v7 = [v6 sceneIdentifier];

      systemAnimationAssertion = self->_systemAnimationAssertion;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__SBCoverSheetSceneManager_updateForegroundScenesForCoverSheetAnimationActive___block_invoke;
      v13[3] = &unk_1E6AF9A10;
      id v14 = v7;
      id v9 = v7;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWindow);
      uint64_t v11 = [WeakRetained _fbsDisplayIdentity];
      [(UIApplicationSceneDeactivationAssertion *)systemAnimationAssertion sb_acquireWithPredicate:v13 transitionContext:0 displayIdentity:v11];
    }
  }
  else if (v5)
  {
    v12 = self->_systemAnimationAssertion;
    [(UIApplicationSceneDeactivationAssertion *)v12 relinquish];
  }
}

uint64_t __79__SBCoverSheetSceneManager_updateForegroundScenesForCoverSheetAnimationActive___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (void)_performSceneUpdateBlock:(id)a3
{
  id v4 = a3;
  pendingSceneUpdateBlocks = self->_pendingSceneUpdateBlocks;
  id v9 = v4;
  if (!pendingSceneUpdateBlocks)
  {
    v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v7 = self->_pendingSceneUpdateBlocks;
    self->_pendingSceneUpdateBlocks = v6;

    pendingSceneUpdateBlocks = self->_pendingSceneUpdateBlocks;
  }
  v8 = (void *)MEMORY[0x1D948C7A0]();
  [(NSMutableArray *)pendingSceneUpdateBlocks addObject:v8];

  if (!self->_performingSceneUpdate) {
    [(SBCoverSheetSceneManager *)self _performNextSceneUpdateBlock];
  }
}

- (void)_performNextSceneUpdateBlock
{
  if (!self->_performingSceneUpdate)
  {
    BOOL v3 = [(NSMutableArray *)self->_pendingSceneUpdateBlocks firstObject];
    if (v3)
    {
      self->_performingSceneUpdate = 1;
      [(NSMutableArray *)self->_pendingSceneUpdateBlocks removeObjectAtIndex:0];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __56__SBCoverSheetSceneManager__performNextSceneUpdateBlock__block_invoke;
      v4[3] = &unk_1E6AF4AC0;
      v4[4] = self;
      ((void (**)(void, void *))v3)[2](v3, v4);
    }
  }
}

uint64_t __56__SBCoverSheetSceneManager__performNextSceneUpdateBlock__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(a1 + 32) _performNextSceneUpdateBlock];
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (displayLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    v12 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4F625B0]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWindow);
    [WeakRetained level];
    [v12 setLevel:(uint64_t)v7];

    [v12 setFillsDisplayBounds:1];
    [v12 setLayoutRole:3];
    v8 = [MEMORY[0x1E4F62438] sharedInstance];
    id v9 = [v8 addElement:v12];
    v10 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = v9;

    uint64_t v11 = (BSInvalidatable *)v12;
  }
  else
  {
    if (!displayLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutAssertion invalidate];
    uint64_t v11 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;
  }
}

- (void)_setSceneBackgrounded:(BOOL)a3 suspendUnderLockEnvironment:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke;
  v4[3] = &unk_1E6B05BB0;
  BOOL v5 = a3;
  v4[4] = self;
  BOOL v6 = a4;
  [(SBCoverSheetSceneManager *)self _performSceneUpdateBlock:v4];
}

void __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  if (*(unsigned char *)(a1 + 40))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_2;
    v10[3] = &unk_1E6AF4AC0;
    v10[4] = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_3;
    v8[3] = &unk_1E6AF5300;
    id v9 = v3;
    [v4 setSuspendedUnderLock:0 alongsideWillChangeBlock:v10 alongsideDidChangeBlock:v8];
    BOOL v5 = v9;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 41))
    {
      [*(id *)(a1 + 32) _updateForegroundScenesForNotificationCenter:1];
      [*(id *)(a1 + 32) _setDisplayLayoutElementActive:1];
      v3[2](v3);
      goto LABEL_6;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_4;
    v6[3] = &unk_1E6AF6828;
    v6[4] = *(void *)(a1 + 32);
    double v7 = v3;
    [v4 setSuspendedUnderLock:1 alongsideWillChangeBlock:0 alongsideDidChangeBlock:v6];
    BOOL v5 = v7;
  }

LABEL_6:
}

uint64_t __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDisplayLayoutElementActive:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateForegroundScenesForNotificationCenter:0];
}

uint64_t __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateForegroundScenesForNotificationCenter:0];
  [*(id *)(a1 + 32) _setDisplayLayoutElementActive:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_updateForegroundScenesForNotificationCenter:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIApplicationSceneDeactivationAssertion *)self->_notificationCenterAssertion isAcquired];
  if (v3)
  {
    if ((v5 & 1) == 0)
    {
      notificationCenterAssertion = self->_notificationCenterAssertion;
      [(UIApplicationSceneDeactivationAssertion *)notificationCenterAssertion acquireWithPredicate:&__block_literal_global_230 transitionContext:0];
    }
  }
  else if (v5)
  {
    double v7 = self->_notificationCenterAssertion;
    [(UIApplicationSceneDeactivationAssertion *)v7 relinquish];
  }
}

uint64_t __73__SBCoverSheetSceneManager__updateForegroundScenesForNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[SBCoverSheetPresentationManager sharedInstance];
  id v4 = [v2 identifier];

  if (![v3 isCoverSheetHostingAnApp]) {
    goto LABEL_10;
  }
  int v5 = [v3 coverSheetHostedAppSceneHandle];
  BOOL v6 = [v5 sceneIfExists];
  double v7 = [v6 identifier];
  char v8 = [v4 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
LABEL_10:
    if (SBSpotlightIsVisible())
    {
      v10 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
      uint64_t v11 = [v10 sceneIdentifier];
      int v12 = [v4 isEqualToString:v11];

      uint64_t v9 = v12 ^ 1u;
    }
    else
    {
      uint64_t v9 = 1;
    }
  }

  return v9;
}

- (UIWindow)coverSheetWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setCoverSheetWindow:(id)a3
{
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
}

- (UIApplicationSceneDeactivationAssertion)notificationCenterAssertion
{
  return self->_notificationCenterAssertion;
}

- (void)setNotificationCenterAssertion:(id)a3
{
}

- (UIApplicationSceneDeactivationAssertion)systemAnimationAssertion
{
  return self->_systemAnimationAssertion;
}

- (void)setSystemAnimationAssertion:(id)a3
{
}

- (NSMutableArray)pendingSceneUpdateBlocks
{
  return self->_pendingSceneUpdateBlocks;
}

- (void)setPendingSceneUpdateBlocks:(id)a3
{
}

- (BOOL)isPerformingSceneUpdate
{
  return self->_performingSceneUpdate;
}

- (void)setPerformingSceneUpdate:(BOOL)a3
{
  self->_performingSceneUpdate = a3;
}

- (BSInvalidatable)stateCaptureInvalidatable
{
  return self->_stateCaptureInvalidatable;
}

- (void)setStateCaptureInvalidatable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_pendingSceneUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_systemAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_notificationCenterAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_coverSheetWindow);
}

@end