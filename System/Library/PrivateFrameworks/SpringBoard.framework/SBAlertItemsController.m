@interface SBAlertItemsController
+ (SBAlertItemsController)sharedInstance;
- (BOOL)_hasActivePresentationsThatPresentModally;
- (BOOL)_hasPresentationForPresenter:(id)a3;
- (BOOL)_hasVisibleModalAlertOfType:(unint64_t)a3;
- (BOOL)_hasVisibleModalAlertOfType:(unint64_t)a3 forWindowScene:(id)a4;
- (BOOL)_isAlertItemPresentable:(id)a3 outReasonsNotPresentable:(id *)a4;
- (BOOL)_shouldPendAlertItem:(id)a3 outReasonsPended:(id *)a4;
- (BOOL)canDeactivateAlertForMenuClickOrSystemGesture;
- (BOOL)deactivateAlertForMenuClickOrSystemGestureWithAnimation:(BOOL)a3;
- (BOOL)deactivateAlertItemsOfClass:(Class)a3;
- (BOOL)deactivateAlertItemsOfClass:(Class)a3 reason:(int)a4;
- (BOOL)deactivateAlertItemsOfClass:(Class)a3 reason:(int)a4 animated:(BOOL)a5;
- (BOOL)hasAlertOfClass:(Class)a3;
- (BOOL)hasAlerts;
- (BOOL)hasLockScreenModalAlert;
- (BOOL)hasVisibleAlert;
- (BOOL)hasVisibleAlertForWindowScene:(id)a3;
- (BOOL)hasVisibleModalAlert;
- (BOOL)hasVisibleSuperModalAlert;
- (NSString)description;
- (SBAlertItemPresenter)lockScreenModalAlertItemPresenter;
- (SBAlertItemPresenter)lockScreenNotificationsAlertItemPresenter;
- (SBAlertItemPresenter)systemApertureAlertItemPresenter;
- (SBAlertItemPresenter)unlockedAlertItemPresenter;
- (SBAlertItemsController)init;
- (SBModalAlertPresenter)_systemModalAlertPresenter;
- (SBWindowSceneManager)windowSceneManager;
- (id)_activePresenterForAlertItem:(id)a3;
- (id)_initWithUserSessionController:(id)a3;
- (id)_presentationForAlertItem:(id)a3;
- (id)_presentedAlertItemForPresenter:(id)a3;
- (id)_presenterForAlertItem:(id)a3;
- (id)alertItemsOfClass:(Class)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)visibleAlertItem;
- (void)_activeCallStateDidChange:(id)a3;
- (void)_buddyDidExit;
- (void)_clearAllQueuedAlertItems;
- (void)_deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5;
- (void)_deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5 alertDismissCompletion:(id)a6;
- (void)_dismissAlertItem:(id)a3 fromPresenter:(id)a4 forReason:(int)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_enumeratePresentationsWithType:(unint64_t)a3 usingBlock:(id)a4;
- (void)_enumerateWithDirection:(unint64_t)a3 presentationsWithType:(unint64_t)a4 usingBlock:(id)a5;
- (void)_notifyObservers:(id)a3;
- (void)_performBatchActions:(id)a3 animated:(BOOL)a4 processQueue:(BOOL)a5;
- (void)_presentAlertItem:(id)a3 withPresenter:(id)a4 animated:(BOOL)a5;
- (void)_processAlertItemQueuesAnimated:(BOOL)a3;
- (void)_processAlertItemsFromQueue:(id)a3 animated:(BOOL)a4;
- (void)_reallyDeactivateAlertItem:(id)a3 forReason:(int)a4 deactivateBlock:(id)a5;
- (void)_setSystemModalAlertPresenter:(id)a3;
- (void)_silencingHardwareButtonPressed:(id)a3;
- (void)_updateActiveDestinations;
- (void)activateAlertItem:(id)a3;
- (void)activateAlertItem:(id)a3 animated:(BOOL)a4;
- (void)activatePendedAlertsIfNecessary;
- (void)addObserver:(id)a3;
- (void)captureSuppressionAssertion:(id)a3 reason:(id)a4;
- (void)convertLockedAlertsToUnlockedAlerts;
- (void)convertUnlockedAlertsToLockedAlerts;
- (void)deactivateAlertItem:(id)a3;
- (void)deactivateAlertItem:(id)a3 reason:(int)a4;
- (void)deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)moveActiveUnlockedAlertsToPendingWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setForceAlertsToPend:(BOOL)a3 forReason:(id)a4;
- (void)setInUILockedMode:(BOOL)a3;
- (void)setIsContinuityDisplaySceneConnected:(BOOL)a3;
- (void)setLockScreenModalAlertItemPresenter:(id)a3;
- (void)setLockScreenNotificationsAlertItemPresenter:(id)a3;
- (void)setSystemApertureAlertItemPresenter:(id)a3;
- (void)setUnlockedAlertItemPresenter:(id)a3;
- (void)setWindowSceneManager:(id)a3;
- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBAlertItemsController

+ (SBAlertItemsController)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance___instance;
  return (SBAlertItemsController *)v2;
}

- (void)setForceAlertsToPend:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBAlertItemsController.m" lineNumber:1164 description:@"a valid reason must be given for changing the pending state"];
  }
  v8 = SBLogAlertItems();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v9) {
      -[SBAlertItemsController setForceAlertsToPend:forReason:]((uint64_t)v7, v8);
    }

    [(NSMutableSet *)self->_forceAlertsToPendReasons addObject:v7];
  }
  else
  {
    if (v9) {
      -[SBAlertItemsController setForceAlertsToPend:forReason:]((uint64_t)v7, v8);
    }

    uint64_t v10 = [(NSMutableSet *)self->_forceAlertsToPendReasons count];
    [(NSMutableSet *)self->_forceAlertsToPendReasons removeObject:v7];
    if (v10 && ![(NSMutableSet *)self->_forceAlertsToPendReasons count]) {
      [(SBAlertItemsController *)self activatePendedAlertsIfNecessary];
    }
  }
}

- (void)moveActiveUnlockedAlertsToPendingWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  uint64_t v7 = [(NSMutableOrderedSet *)self->_alertItemPresentations count];
  uint64_t v8 = [(NSMutableOrderedSet *)self->_superModalAlertItemPresentations count] + v7;
  if ([(NSMutableSet *)self->_forceAlertsToPendReasons count]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v10 = [MEMORY[0x1E4F4F6B8] sentinelWithQueue:MEMORY[0x1E4F14428] signalCount:v8 completion:v6];
    }
    else
    {
      uint64_t v10 = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke;
    v12[3] = &unk_1E6AF5770;
    BOOL v14 = v4;
    v12[4] = self;
    id v13 = v10;
    id v11 = v10;
    [(SBAlertItemsController *)self _performBatchActions:v12 animated:v4 processQueue:0];
  }
}

- (id)alertItemsOfClass:(Class)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(SBAlertItemsObjectQueue *)self->_superModalItemsQueue hasObjectOfClass:a3])
  {
    v6 = [(SBAlertItemsObjectQueue *)self->_superModalItemsQueue objectsOfClass:a3];
    [v5 unionSet:v6];
  }
  if ([(SBAlertItemsObjectQueue *)self->_alertItemsQueue hasObjectOfClass:a3])
  {
    uint64_t v7 = [(SBAlertItemsObjectQueue *)self->_alertItemsQueue objectsOfClass:a3];
    [v5 unionSet:v7];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__SBAlertItemsController_alertItemsOfClass___block_invoke;
  v10[3] = &unk_1E6AF9C60;
  Class v12 = a3;
  id v8 = v5;
  id v11 = v8;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v10];

  return v8;
}

- (void)_enumerateWithDirection:(unint64_t)a3 presentationsWithType:(unint64_t)a4 usingBlock:(id)a5
{
  char v5 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *, void *, unsigned char *))a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if ((v5 & 2) != 0)
  {
    uint64_t v10 = [(NSMutableOrderedSet *)self->_superModalAlertItemPresentations array];
    [v9 addObjectsFromArray:v10];
  }
  if (v5)
  {
    id v11 = [(NSMutableOrderedSet *)self->_alertItemPresentations array];
    [v9 addObjectsFromArray:v11];
  }
  char v24 = 0;
  if (a3) {
    [v9 reverseObjectEnumerator];
  }
  else {
    [v9 objectEnumerator];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
LABEL_10:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
      v18 = objc_msgSend(v17, "alertItem", (void)v20);
      v19 = [v17 presenter];
      v8[2](v8, v18, v19, &v24);

      if (v24) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v14) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
}

- (void)_enumeratePresentationsWithType:(unint64_t)a3 usingBlock:(id)a4
{
}

void __40__SBAlertItemsController_sharedInstance__block_invoke()
{
  v0 = [SBAlertItemsController alloc];
  id v3 = [(id)SBApp userSessionController];
  uint64_t v1 = [(SBAlertItemsController *)v0 _initWithUserSessionController:v3];
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = v1;
}

- (SBAlertItemsController)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBAlertItemsController.m" lineNumber:110 description:@"Unavailable"];

  return 0;
}

- (id)_initWithUserSessionController:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SBAlertItemsController;
  v6 = [(SBAlertItemsController *)&v36 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userSessionController, a3);
    id v8 = objc_alloc_init(SBAlertItemsObjectQueue);
    alertItemsQueue = v7->_alertItemsQueue;
    v7->_alertItemsQueue = v8;

    uint64_t v10 = objc_alloc_init(SBAlertItemsObjectQueue);
    superModalItemsQueue = v7->_superModalItemsQueue;
    v7->_superModalItemsQueue = v10;

    id v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    alertItemPresentations = v7->_alertItemPresentations;
    v7->_alertItemPresentations = v12;

    uint64_t v14 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    superModalAlertItemPresentations = v7->_superModalAlertItemPresentations;
    v7->_superModalAlertItemPresentations = v14;

    uint64_t v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendedAlertsToReenqueuePostDismissal = v7->_pendedAlertsToReenqueuePostDismissal;
    v7->_pendedAlertsToReenqueuePostDismissal = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    forceAlertsToPendReasons = v7->_forceAlertsToPendReasons;
    v7->_forceAlertsToPendReasons = v18;

    long long v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activePresenters = v7->_activePresenters;
    v7->_activePresenters = v20;

    long long v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v7 selector:sel__buddyDidExit name:@"SBSetupBuddyCompletedNotification" object:0];
    [v22 addObserver:v7 selector:sel__activeCallStateDidChange_ name:*MEMORY[0x1E4FA79D8] object:0];
    [v22 addObserver:v7 selector:sel__silencingHardwareButtonPressed_ name:*MEMORY[0x1E4FA7A70] object:0];
    [v22 addObserver:v7 selector:sel__silencingHardwareButtonPressed_ name:*MEMORY[0x1E4FA7A98] object:0];
    [v22 addObserver:v7 selector:sel__silencingHardwareButtonPressed_ name:*MEMORY[0x1E4FA7AE0] object:0];
    long long v23 = +[SBDefaults localDefaults];
    char v24 = [v23 miscellaneousDefaults];
    v7->_suppressAlertsForKeynote = [v24 suppressAlertsForKeynote];

    objc_initWeak(&location, v7);
    id v25 = MEMORY[0x1E4F14428];
    v33[1] = (id)MEMORY[0x1E4F143A8];
    v33[2] = (id)3221225472;
    v33[3] = __57__SBAlertItemsController__initWithUserSessionController___block_invoke;
    v33[4] = &unk_1E6AF76A8;
    objc_copyWeak(&v34, &location);
    uint64_t v26 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureBlock = v7->_stateCaptureBlock;
    v7->_stateCaptureBlock = (BSInvalidatable *)v26;

    v28 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__SBAlertItemsController__initWithUserSessionController___block_invoke_2;
    v32[3] = &unk_1E6AF9A38;
    objc_copyWeak(v33, &location);
    [v28 setTransitionHandler:v32];
    uint64_t v29 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v28];
    layoutMonitor = v7->_layoutMonitor;
    v7->_layoutMonitor = (FBSDisplayLayoutMonitor *)v29;

    objc_destroyWeak(v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v7;
}

id __57__SBAlertItemsController__initWithUserSessionController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

void __57__SBAlertItemsController__initWithUserSessionController___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v10);
}

void __57__SBAlertItemsController__initWithUserSessionController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processAlertItemQueuesAnimated:1];
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureBlock invalidate];
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBAlertItemsController;
  [(SBAlertItemsController *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBAlertItemsController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBAlertItemsController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBAlertItemsController *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAlertItemsController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"superModalItemsQueue" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"alertItemsQueue" skipIfNil:1];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"superModalPresentations" skipIfNil:1];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"presentations" skipIfNil:1];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 activeMultilinePrefix];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  uint64_t v15 = &unk_1E6AF5290;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v16 = v8;
  uint64_t v17 = v9;
  [v6 appendBodySectionWithName:@"Presenters" multilinePrefix:v7 block:&v12];

  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(void *)(*(void *)(a1 + 40) + 56), @"activePresenters", 1, v12, v13, v14, v15);
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 92) withName:@"suppress alerts for keynote"];
}

id __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 136) withName:@"lockScreenModalAlertItemPresenter" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 144) withName:@"lockScreenNotificationsAlertItemPresenter" skipIfNil:1];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 152) withName:@"systemApertureAlertItemPresenter" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 160) withName:@"unlockedAlertItemPresenter" skipIfNil:1];
}

- (void)setUnlockedAlertItemPresenter:(id)a3
{
  id v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_unlockedAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_unlockedAlertItemPresenter, a3);
    [(SBAlertItemsController *)self _updateActiveDestinations];
  }
}

- (void)setSystemApertureAlertItemPresenter:(id)a3
{
  id v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_systemApertureAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_systemApertureAlertItemPresenter, a3);
    [(SBAlertItemsController *)self _updateActiveDestinations];
  }
}

- (void)setLockScreenModalAlertItemPresenter:(id)a3
{
  id v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_lockScreenModalAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_lockScreenModalAlertItemPresenter, a3);
    [(SBAlertItemsController *)self _updateActiveDestinations];
  }
}

- (void)setLockScreenNotificationsAlertItemPresenter:(id)a3
{
  id v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_lockScreenNotificationsAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_lockScreenNotificationsAlertItemPresenter, a3);
    [(SBAlertItemsController *)self _updateActiveDestinations];
  }
}

- (void)setInUILockedMode:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_inUILockedMode != v3)
  {
    self->_inUILockedMode = v3;
    [(SBAlertItemsController *)self _updateActiveDestinations];
  }
}

- (void)setIsContinuityDisplaySceneConnected:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isContinuityDisplaySceneConnected != v3)
  {
    self->_isContinuityDisplaySceneConnected = v3;
    [(SBAlertItemsController *)self _updateActiveDestinations];
  }
}

- (void)convertUnlockedAlertsToLockedAlerts
{
  BSDispatchQueueAssertMain();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = self;
  [(SBAlertItemsController *)self _performBatchActions:v3 animated:1 processQueue:1];
}

uint64_t __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke(uint64_t a1)
{
  id v2 = SBLogAlertItems();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Converting unlocked alerts to locked alerts.", buf, 2u);
  }

  BOOL v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_60;
  v7[3] = &unk_1E6AF9A60;
  v7[4] = v3;
  [v3 _enumerateWithDirection:1 presentationsWithType:1 usingBlock:v7];
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_2;
  v6[3] = &unk_1E6AF9A60;
  v6[4] = v4;
  return [v4 _enumeratePresentationsWithType:2 usingBlock:v6];
}

void __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) unlockedAlertItemPresenter];
  if ((id)v6 == v5)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) systemApertureAlertItemPresenter];

    if (v8 != v5) {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) deactivateAlertItem:v9 reason:0 animated:0];
  if ([v9 reappearsAfterLock]) {
    [*(id *)(*(void *)(a1 + 32) + 16) prependObject:v9];
  }
LABEL_7:
}

void __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) unlockedAlertItemPresenter];
  if ((id)v6 == v5)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) systemApertureAlertItemPresenter];

    if (v8 != v5) {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) deactivateAlertItem:v9 reason:0 animated:0];
  if ([v9 reappearsAfterLock]) {
    [*(id *)(*(void *)(a1 + 32) + 24) appendObject:v9];
  }
LABEL_7:
}

- (void)convertLockedAlertsToUnlockedAlerts
{
  BSDispatchQueueAssertMain();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = self;
  [(SBAlertItemsController *)self _performBatchActions:v3 animated:1 processQueue:0];
}

uint64_t __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke(uint64_t a1)
{
  id v2 = SBLogAlertItems();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Converting locked alerts to unlocked alerts.", buf, 2u);
  }

  BOOL v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_62;
  v7[3] = &unk_1E6AF9A60;
  v7[4] = v3;
  [v3 _enumerateWithDirection:1 presentationsWithType:1 usingBlock:v7];
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_2;
  v6[3] = &unk_1E6AF9A60;
  v6[4] = v4;
  return [v4 _enumeratePresentationsWithType:2 usingBlock:v6];
}

void __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) lockScreenModalAlertItemPresenter];
  if ((id)v6 == v5)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) lockScreenNotificationsAlertItemPresenter];

    if (v8 != v5) {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) deactivateAlertItem:v9 reason:6 animated:0];
  if ([v9 reappearsAfterUnlock]) {
    [*(id *)(*(void *)(a1 + 32) + 16) prependObject:v9];
  }
LABEL_7:
}

void __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) lockScreenModalAlertItemPresenter];
  if ((id)v6 == v5)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) lockScreenNotificationsAlertItemPresenter];

    if (v8 != v5) {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) deactivateAlertItem:v9 reason:6 animated:0];
  if ([v9 reappearsAfterUnlock]) {
    [*(id *)(*(void *)(a1 + 32) + 24) appendObject:v9];
  }
LABEL_7:
}

- (void)activateAlertItem:(id)a3
{
}

- (void)activateAlertItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = SBLogAlertItems();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 _publicDescription];
    int v12 = 138543362;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Received request to activate alertItem: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  if (!self->_suppressAlertsForKeynote || ![v6 suppressForKeynote])
  {
    if ([v6 behavesSuperModally])
    {
      [(SBAlertItemsObjectQueue *)self->_superModalItemsQueue appendObject:v6];
      p_alertItemsQueue = &self->_alertItemsQueue;
      if (![(SBAlertItemsObjectQueue *)self->_alertItemsQueue containsObject:v6])
      {
LABEL_12:
        [(SBAlertItemsController *)self _processAlertItemQueuesAnimated:v4];
        goto LABEL_13;
      }
    }
    else
    {
      [(SBAlertItemsObjectQueue *)self->_alertItemsQueue appendObject:v6];
      p_alertItemsQueue = &self->_superModalItemsQueue;
      if (![(SBAlertItemsObjectQueue *)self->_superModalItemsQueue containsObject:v6]) {
        goto LABEL_12;
      }
    }
    [(SBAlertItemsObjectQueue *)*p_alertItemsQueue removeObject:v6];
    goto LABEL_12;
  }
  id v9 = SBLogAlertItems();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 _publicDescription];
    int v12 = 138543362;
    uint64_t v13 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Supressing alertItem: %{public}@, for keynote", (uint8_t *)&v12, 0xCu);
  }
LABEL_13:
}

- (void)deactivateAlertItem:(id)a3
{
}

- (void)deactivateAlertItem:(id)a3 reason:(int)a4
{
}

- (void)deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  BSDispatchQueueAssertMain();
  if (v6 == 1)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBAlertItemsController.m" lineNumber:370 description:@"Only the SBAlertItemsController can deactivate for pended reasons."];
  }
  [(SBAlertItemsController *)self _deactivateAlertItem:v10 reason:v6 animated:v5];
}

- (void)activatePendedAlertsIfNecessary
{
  BSDispatchQueueAssertMain();
  [(SBAlertItemsController *)self _processAlertItemQueuesAnimated:1];
}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SBAlertItemsController *)self lockScreenModalAlertItemPresenter];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SBAlertItemsController *)self lockScreenModalAlertItemPresenter];
    [v9 windowSceneDidConnect:v13 withSharedModalAlertItemPresenter:v6];
  }
  id v10 = [(SBAlertItemsController *)self unlockedAlertItemPresenter];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [(SBAlertItemsController *)self unlockedAlertItemPresenter];
    [v12 windowSceneDidConnect:v13 withSharedModalAlertItemPresenter:v6];
  }
  if ([v13 isContinuityDisplayWindowScene]) {
    [(SBAlertItemsController *)self setIsContinuityDisplaySceneConnected:1];
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SBAlertItemsController *)self lockScreenModalAlertItemPresenter];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SBAlertItemsController *)self lockScreenModalAlertItemPresenter];
    [v6 windowSceneDidDisconnect:v10];
  }
  id v7 = [(SBAlertItemsController *)self unlockedAlertItemPresenter];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SBAlertItemsController *)self unlockedAlertItemPresenter];
    [v9 windowSceneDidDisconnect:v10];
  }
  if ([v10 isContinuityDisplayWindowScene]) {
    [(SBAlertItemsController *)self setIsContinuityDisplaySceneConnected:0];
  }
}

- (void)_clearAllQueuedAlertItems
{
  id v3 = [(SBAlertItemsObjectQueue *)self->_alertItemsQueue dequeueAllObjects];
  id v4 = [(SBAlertItemsObjectQueue *)self->_superModalItemsQueue dequeueAllObjects];
}

- (void)_updateActiveDestinations
{
  [(NSMutableSet *)self->_activePresenters removeAllObjects];
  if (self->_inUILockedMode)
  {
    if (self->_lockScreenModalAlertItemPresenter) {
      -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
    }
    if (self->_lockScreenNotificationsAlertItemPresenter) {
      -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
    }
    if (self->_isContinuityDisplaySceneConnected)
    {
      if (!self->_unlockedAlertItemPresenter
        || (-[NSMutableSet addObject:](self->_activePresenters, "addObject:"), self->_isContinuityDisplaySceneConnected))
      {
        if (self->_systemApertureAlertItemPresenter)
        {
LABEL_10:
          activePresenters = self->_activePresenters;
          -[NSMutableSet addObject:](activePresenters, "addObject:");
        }
      }
    }
  }
  else
  {
    if (self->_systemApertureAlertItemPresenter) {
      -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
    }
    if (self->_unlockedAlertItemPresenter) {
      goto LABEL_10;
    }
  }
}

- (void)_performBatchActions:(id)a3 animated:(BOOL)a4 processQueue:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  char v8 = (void (**)(void))a3;
  if (v8)
  {
    self->_delayProcessingQueue = 1;
    id v9 = v8;
    v8[2]();
    char v8 = v9;
    self->_delayProcessingQueue = 0;
    if (v5)
    {
      [(SBAlertItemsController *)self _processAlertItemQueuesAnimated:v6];
      char v8 = v9;
    }
  }
}

- (BOOL)_isAlertItemPresentable:(id)a3 outReasonsNotPresentable:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__SBAlertItemsController__isAlertItemPresentable_outReasonsNotPresentable___block_invoke;
  v14[3] = &unk_1E6AF9A88;
  v14[4] = &v15;
  v14[5] = a4;
  id v7 = (void (**)(void, void))MEMORY[0x1D948C7A0](v14);
  char v8 = [(id)SBApp restartManager];
  int v9 = [v8 isPendingExit];

  if (v9) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"The system is shutting down or pending a restart.");
  }
  if ([v6 ignoreIfAlreadyDisplaying]
    && [(SBAlertItemsController *)self hasAlertOfClass:objc_opt_class()])
  {
    ((void (**)(void, __CFString *))v7)[2](v7, @"Already presenting an item of this class type.");
  }
  id v10 = +[SBSetupManager sharedInstance];
  if ([v10 isInSetupMode] && (objc_msgSend(v6, "allowInSetup") & 1) == 0)
  {
    char v13 = [v6 pendInSetupIfNotAllowed];

    if ((v13 & 1) == 0) {
      ((void (**)(void, __CFString *))v7)[2](v7, @"Alert cannot show while we're in Setup.");
    }
  }
  else
  {
  }
  if ([(SBUserSessionController *)self->_userSessionController isLoginSession]
    && ([v6 allowInLoginWindow] & 1) == 0)
  {
    ((void (**)(void, __CFString *))v7)[2](v7, @"Alert cannot show in the login window session.");
  }
  BOOL v11 = [(id)v16[5] count] == 0;

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __75__SBAlertItemsController__isAlertItemPresentable_outReasonsNotPresentable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      **(void **)(a1 + 40) = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v4 addObject:v8];
    id v3 = v8;
  }
}

- (void)_processAlertItemQueuesAnimated:(BOOL)a3
{
  if (!self->_isProcessingQueue && !self->_delayProcessingQueue)
  {
    BOOL v4 = a3;
    self->_isProcessingQueue = 1;
    BOOL v5 = [(SBAlertItemsObjectQueue *)self->_superModalItemsQueue hasObject];
    uint64_t v6 = 16;
    if (v5) {
      uint64_t v6 = 24;
    }
    id v7 = *(id *)((char *)&self->super.isa + v6);
    [(SBAlertItemsController *)self _processAlertItemsFromQueue:v7 animated:v4];
    self->_isProcessingQueue = 0;
  }
}

- (void)_processAlertItemsFromQueue:(id)a3 animated:(BOOL)a4
{
  BOOL v29 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 hasObject])
  {
    v30 = v5;
    uint64_t v6 = [v5 dequeueAllObjects];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v35;
    *(void *)&long long v8 = 138543362;
    long long v26 = v8;
    v31 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        char v13 = -[SBAlertItemsController _presentationForAlertItem:](self, "_presentationForAlertItem:", v12, v26);
        if (v13)
        {
          uint64_t v14 = SBLogAlertItems();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          uint64_t v15 = [v12 _publicDescription];
          id v16 = [v13 presenter];
          *(_DWORD *)buf = 138543618;
          v39 = v15;
          __int16 v40 = 2114;
          v41 = v16;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Activation - ignoring activation attempt for %{public}@ because it's already presented by %{public}@.", buf, 0x16u);

          goto LABEL_15;
        }
        id v33 = 0;
        BOOL v17 = [(SBAlertItemsController *)self _isAlertItemPresentable:v12 outReasonsNotPresentable:&v33];
        uint64_t v14 = v33;
        if (v17)
        {
          id v32 = 0;
          BOOL v18 = [(SBAlertItemsController *)self _shouldPendAlertItem:v12 outReasonsPended:&v32];
          uint64_t v15 = v32;
          if (v18)
          {
            v19 = SBLogAlertItems();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v12 _publicDescription];
              *(_DWORD *)buf = 138543618;
              v39 = v20;
              __int16 v40 = 2114;
              v41 = v15;
              _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Activation - Pending activation of %{public}@ due to reason: %{public}@", buf, 0x16u);

              uint64_t v6 = v31;
            }

            [v30 appendObject:v12];
LABEL_15:

            goto LABEL_27;
          }
          long long v23 = [(SBAlertItemsController *)self _presenterForAlertItem:v12];
          char v24 = SBLogAlertItems();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v23)
          {
            if (v25)
            {
              v27 = [v12 _publicDescription];
              *(_DWORD *)buf = 138543618;
              v39 = v27;
              __int16 v40 = 2114;
              v41 = v23;
              _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Activation - Presenting %{public}@ with presenter: %{public}@", buf, 0x16u);
            }
            [(SBAlertItemsController *)self _presentAlertItem:v12 withPresenter:v23 animated:v29];
          }
          else
          {
            if (v25)
            {
              v28 = [v12 _publicDescription];
              *(_DWORD *)buf = v26;
              v39 = v28;
              _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Activation - Pending activation of %{public}@ because no presenter is capable of presenting it currently.", buf, 0xCu);
            }
            [v30 appendObject:v12];
          }

          uint64_t v6 = v31;
        }
        else
        {
          long long v21 = SBLogAlertItems();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            long long v22 = [v12 _publicDescription];
            *(_DWORD *)buf = 138543618;
            v39 = v22;
            __int16 v40 = 2114;
            v41 = v14;
            _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Activation - Failed to activate %{public}@ because it's not allowed at this time for reason: %{public}@", buf, 0x16u);
          }
          [v12 didFailToActivate];
        }
LABEL_27:
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v9)
      {
LABEL_29:

        id v5 = v30;
        break;
      }
    }
  }
}

- (BOOL)_hasPresentationForPresenter:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBAlertItemsController__hasPresentationForPresenter___block_invoke;
  v7[3] = &unk_1E6AF9AB0;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __55__SBAlertItemsController__hasPresentationForPresenter___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 32) == a3) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)_presentedAlertItemForPresenter:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__12;
  uint64_t v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SBAlertItemsController__presentedAlertItemForPresenter___block_invoke;
  v8[3] = &unk_1E6AF9AB0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __58__SBAlertItemsController__presentedAlertItemForPresenter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v6 = v7;
  }
}

- (BOOL)_shouldPendAlertItem:(id)a3 outReasonsPended:(id *)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__12;
  v95 = __Block_byref_object_dispose__12;
  id v96 = 0;
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke;
  v90[3] = &unk_1E6AF9A88;
  v90[4] = &v91;
  v90[5] = a4;
  v64 = (void (**)(void, void))MEMORY[0x1D948C7A0](v90);
  if ([(NSMutableSet *)self->_forceAlertsToPendReasons count]
    && (![v67 allowDuringTransitionAnimations]
     || ([(NSMutableSet *)self->_forceAlertsToPendReasons bs_containsObjectPassingTest:&__block_literal_global_87] & 1) != 0))
  {
    id v5 = [NSString stringWithFormat:@"Forced to pend for reasons: %@", self->_forceAlertsToPendReasons];
    ((void (**)(void, void *))v64)[2](v64, v5);
  }
  uint64_t v6 = [(NSMutableOrderedSet *)self->_superModalAlertItemPresentations count];
  char v7 = [v67 behavesSuperModally];
  char v8 = v7;
  if (v6) {
    char v9 = v7;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0) {
    ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted because we have a currently visible super modal presentation.");
  }
  uint64_t v10 = +[SBSetupManager sharedInstance];
  if ([v10 isInSetupMode])
  {
    char v11 = [v67 allowInSetup];

    if ((v11 & 1) == 0) {
      ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted because we're in Setup.");
    }
  }
  else
  {
  }
  v65 = [v67 allowedBundleIDs];
  uint64_t v12 = &v86;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  char v89 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v13 = [v65 count];
    uint64_t v12 = v87;
    if (v13)
    {
      *((unsigned char *)v87 + 24) = 1;
      uint64_t v14 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
      v63 = v14;
      if ([v14 count])
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v82 objects:v100 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v83;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v83 != v17) {
                objc_enumerationMutation(v15);
              }
              v19 = [*(id *)(*((void *)&v82 + 1) + 8 * i) application];
              id v20 = [v19 bundleIdentifier];

              if (v20 && [v65 containsObject:v20])
              {
                *((unsigned char *)v87 + 24) = 0;

                goto LABEL_30;
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v82 objects:v100 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_30:

        long long v22 = v87;
      }
      else
      {
        int v21 = [v65 containsObject:@"com.apple.springboard"];
        long long v22 = v87;
        if (v21) {
          *((unsigned char *)v87 + 24) = 0;
        }
      }
      if (*((unsigned char *)v22 + 24))
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v23 = v65;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v78 objects:v99 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v79;
          while (2)
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v79 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void *)(*((void *)&v78 + 1) + 8 * j);
              v28 = [(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
              BOOL v29 = [v28 elements];
              v77[0] = MEMORY[0x1E4F143A8];
              v77[1] = 3221225472;
              v77[2] = __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_3;
              v77[3] = &unk_1E6AF9AF8;
              v77[4] = v27;
              LODWORD(v27) = objc_msgSend(v29, "bs_containsObjectPassingTest:", v77);

              if (v27)
              {
                *((unsigned char *)v87 + 24) = 0;
                goto LABEL_42;
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v78 objects:v99 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }
LABEL_42:

        if (*((unsigned char *)v87 + 24))
        {
          v30 = +[SBWorkspace mainWorkspace];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v31 = v23;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v98 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v74;
            while (2)
            {
              for (uint64_t k = 0; k != v32; ++k)
              {
                if (*(void *)v74 != v33) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v35 = *(void *)(*((void *)&v73 + 1) + 8 * k);
                long long v36 = +[SBApplicationController sharedInstanceIfExists];
                long long v37 = [v36 applicationWithBundleIdentifier:v35];

                if ([v30 isApplicationRunningAsViewService:v37])
                {
                  v38 = (void *)MEMORY[0x1E4F4F7F8];
                  uint64_t v39 = [v37 processState];
                  __int16 v40 = objc_msgSend(v38, "processHandleForPID:bundleID:", objc_msgSend((id)v39, "pid"), v35);

                  v41 = [v30 transientOverlayPresentationManager];
                  LOBYTE(v39) = [v41 hasActivePresentationFromProcess:v40];

                  if (v39)
                  {
                    *((unsigned char *)v87 + 24) = 0;

                    goto LABEL_55;
                  }
                }
              }
              uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v98 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }
LABEL_55:

          if (*((unsigned char *)v87 + 24))
          {
            v42 = objc_alloc_init(SBKeyboardFocusVisibilityGraphNavigator);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id v43 = v31;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v69 objects:v97 count:16];
            if (v44)
            {
              uint64_t v45 = *(void *)v70;
LABEL_58:
              uint64_t v46 = 0;
              while (1)
              {
                if (*(void *)v70 != v45) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v47 = *(void *)(*((void *)&v69 + 1) + 8 * v46);
                v48 = +[SBApplicationController sharedInstanceIfExists];
                v49 = [v48 applicationWithBundleIdentifier:v47];

                v50 = [v49 processState];
                uint64_t v51 = [v50 pid];

                if (v51)
                {
                  v68[0] = MEMORY[0x1E4F143A8];
                  v68[1] = 3221225472;
                  v68[2] = __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_4;
                  v68[3] = &unk_1E6AF9B48;
                  v68[4] = &v86;
                  [(SBKeyboardFocusVisibilityGraphNavigator *)v42 reverseEnumerateChainContainingSceneFromProcessID:v51 block:v68];
                }
                BOOL v52 = *((unsigned char *)v87 + 24) == 0;

                if (v52) {
                  break;
                }
                if (v44 == ++v46)
                {
                  uint64_t v44 = [v43 countByEnumeratingWithState:&v69 objects:v97 count:16];
                  if (v44) {
                    goto LABEL_58;
                  }
                  break;
                }
              }
            }
          }
        }
      }

      uint64_t v12 = v87;
    }
  }
  if (*((unsigned char *)v12 + 24))
  {
    v53 = NSString;
    v54 = [v67 allowedBundleIDs];
    v55 = [v53 stringWithFormat:@"Restricted to only appear over the following bundle ids: %@", v54];
    ((void (**)(void, void *))v64)[2](v64, v55);
  }
  if ([v67 pendWhileKeyBagLocked])
  {
    v56 = [(id)SBApp authenticationController];
    char v57 = [v56 isAuthenticated];

    if ((v57 & 1) == 0) {
      ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted while the keybag is locked.");
    }
  }
  v58 = [(SBAlertItemsController *)self _presenterForAlertItem:v67];
  if (!v58) {
    ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted because there's no presenter that can handle this alert item at this time.");
  }
  if ([v67 _didEverActivate]
    && ([v58 canPresentMultipleAlertItemsSimultaneously] & 1) == 0
    && [(SBAlertItemsController *)self _hasPresentationForPresenter:v58])
  {
    ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted because the presenter for this alert item is busy.");
  }
  v59 = +[SBTelephonyManager sharedTelephonyManager];
  if ([v59 isEmergencyCallActive])
  {
    char v60 = [v67 shouldShowInEmergencyCall];

    if ((v60 & 1) == 0) {
      ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted while in an emergency call.");
    }
  }
  else
  {
  }
  if ([(id)SBApp caseIsEnabledAndLatched])
  {
    [v67 playPresentationSound];
    ((void (**)(void, __CFString *))v64)[2](v64, @"Restricted while the smart cover is on.");
  }
  BOOL v61 = [(id)v92[5] count] != 0;

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v91, 8);

  return v61;
}

void __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      char v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      **(void **)(a1 + 40) = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v4 addObject:v8];
    id v3 = v8;
  }
}

uint64_t __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SBUIAnimationController isPendingAlertItemsWithReason:a2] ^ 1;
}

uint64_t __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 containsString:*(void *)(a1 + 32)];

  return v4;
}

void __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v7 = [(id)SBApp windowSceneManager];
  id v8 = [v7 connectedWindowScenes];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) sceneManager];
        uint64_t v14 = [v13 allScenes];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_5;
        v16[3] = &unk_1E6AF9B20;
        id v17 = v6;
        char v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v16);

        if (v15)
        {

          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

uint64_t __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 identityToken];
  id v3 = [v2 stringRepresentation];
  uint64_t v4 = BSEqualObjects();

  return v4;
}

- (id)_presenterForAlertItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBAlertItemsController *)self lockScreenModalAlertItemPresenter];
  id v6 = [(SBAlertItemsController *)self lockScreenNotificationsAlertItemPresenter];
  char v7 = [(SBAlertItemsController *)self systemApertureAlertItemPresenter];
  id v8 = [(SBAlertItemsController *)self unlockedAlertItemPresenter];
  BOOL v9 = self->_inUILockedMode
    && [v4 shouldShowInLockScreen]
    && !self->_isContinuityDisplaySceneConnected;
  if (![(SBUserSessionController *)self->_userSessionController isLoginSession])
  {
    if (!v9) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  int v10 = [v4 allowInLoginWindow];
  if (((v9 | v10) & 1) == 0) {
    goto LABEL_14;
  }
  if ((v10 & 1) == 0)
  {
LABEL_10:
    if (![v4 forcesModalAlertAppearance]) {
      goto LABEL_12;
    }
  }
  char v11 = [(NSMutableSet *)self->_activePresenters containsObject:v5];
  uint64_t v12 = v5;
  if (v11) {
    goto LABEL_13;
  }
LABEL_12:
  int v13 = [(NSMutableSet *)self->_activePresenters containsObject:v6];
  uint64_t v12 = v6;
  if (v13)
  {
LABEL_13:
    id v14 = v12;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_14:
  if (![(NSMutableSet *)self->_activePresenters containsObject:v7]
    || ([v4 _systemApertureElement], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v16 = (void *)v15, id v14 = v7, v16, !v14))
  {
    if ([(NSMutableSet *)self->_activePresenters containsObject:v8]) {
      id v14 = v8;
    }
    else {
      id v14 = 0;
    }
  }
LABEL_20:

  return v14;
}

- (id)_activePresenterForAlertItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  uint64_t v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  if ([v4 behavesSuperModally]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBAlertItemsController__activePresenterForAlertItem___block_invoke;
  v9[3] = &unk_1E6AF9AB0;
  id v6 = v4;
  id v10 = v6;
  char v11 = &v12;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:v5 usingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SBAlertItemsController__activePresenterForAlertItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (*(void *)(a1 + 32) == a2)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)_presentAlertItem:(id)a3 withPresenter:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  char v11 = v10;
  if (!v9)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBAlertItemsController.m", 785, @"Invalid parameter not satisfying: %@", @"alertItem" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBAlertItemsController.m", 786, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_17;
  }
LABEL_3:
  if (([v11 canPresentMultipleAlertItemsSimultaneously] & 1) == 0
    && [(SBAlertItemsController *)self _hasPresentationForPresenter:v11])
  {
    do
    {
      uint64_t v12 = [(SBAlertItemsController *)self _presentedAlertItemForPresenter:v11];
      [(SBAlertItemsController *)self _deactivateAlertItem:v12 reason:1 animated:0];
    }
    while ([(SBAlertItemsController *)self _hasPresentationForPresenter:v11]);
  }
  int v13 = [[SBAlertItemPresentation alloc] initWithAlertItem:v9 presenter:v11];
  uint64_t v14 = SBLogAlertItems();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v11;
    __int16 v36 = 2114;
    long long v37 = v13;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Activation - Presenter:%{public}@ will present presentation: %{public}@", buf, 0x16u);
  }

  [v9 willActivate];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke;
  v32[3] = &unk_1E6AF9B70;
  void v32[4] = self;
  id v15 = v9;
  id v33 = v15;
  [(SBAlertItemsController *)self _notifyObservers:v32];
  [(NSMutableOrderedSet *)self->_superModalAlertItemPresentations removeObject:v13];
  [(NSMutableOrderedSet *)self->_alertItemPresentations removeObject:v13];
  int v16 = [v15 behavesSuperModally];
  uint64_t v17 = 40;
  if (v16) {
    uint64_t v17 = 48;
  }
  [*(id *)((char *)&self->super.isa + v17) addObject:v13];
  if (!self->_systemModalAlertVisibleAssertion
    && [(SBAlertItemsController *)self _hasActivePresentationsThatPresentModally])
  {
    systemModalAlertPresenter = self->_systemModalAlertPresenter;
    long long v19 = (objc_class *)objc_opt_class();
    long long v20 = NSStringFromClass(v19);
    long long v21 = [(SBModalAlertPresenter *)systemModalAlertPresenter acquireVisibleModalAlertAssertionWithDescription:v20];
    systemModalAlertVisibleAssertion = self->_systemModalAlertVisibleAssertion;
    self->_systemModalAlertVisibleAssertion = v21;
  }
  [v15 _setPresentationState:1];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_2;
  v30[3] = &unk_1E6AF4AC0;
  id v23 = v15;
  id v31 = v23;
  [v11 presentAlertItem:v23 animated:v5 completion:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_3;
  v28[3] = &unk_1E6AF9B70;
  v28[4] = self;
  id v24 = v23;
  id v29 = v24;
  [(SBAlertItemsController *)self _notifyObservers:v28];
  [v24 didActivate];
  uint64_t v25 = SBLogAlertItems();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v11;
    __int16 v36 = 2114;
    long long v37 = v13;
    _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Activation - Presenter:%{public}@ did present presentation: %{public}@", buf, 0x16u);
  }
}

uint64_t __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alertItemsController:*(void *)(a1 + 32) willActivateAlertItem:*(void *)(a1 + 40)];
}

uint64_t __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPresentationState:2];
}

uint64_t __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 alertItemsController:*(void *)(a1 + 32) didActivateAlertItem:*(void *)(a1 + 40)];
}

- (void)_deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5
{
}

- (void)_deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5 alertDismissCompletion:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  int v13 = v12;
  if (v11)
  {
    uint64_t v14 = SBLogAlertItems();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = SBStringFromAlertItemDeactivateReason();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Will deactivate alertItem: %{public}@ for reason: %{public}@", buf, 0x16u);
    }
    BOOL v16 = [(SBAlertItemsObjectQueue *)self->_alertItemsQueue containsObject:v11];
    char v17 = v16;
    if (v16)
    {
      [(SBAlertItemsObjectQueue *)self->_alertItemsQueue removeObject:v11];
      [(SBAlertItemsController *)self _reallyDeactivateAlertItem:v11 forReason:v8 deactivateBlock:0];
    }
    if ([(SBAlertItemsObjectQueue *)self->_superModalItemsQueue containsObject:v11])
    {
      [(SBAlertItemsObjectQueue *)self->_superModalItemsQueue removeObject:v11];
      [(SBAlertItemsController *)self _reallyDeactivateAlertItem:v11 forReason:v8 deactivateBlock:0];
      char v17 = 1;
    }
    pendedAlertsToReenqueuePostDismissal = self->_pendedAlertsToReenqueuePostDismissal;
    if (v8 == 1) {
      [(NSMutableSet *)pendedAlertsToReenqueuePostDismissal addObject:v11];
    }
    else {
      [(NSMutableSet *)pendedAlertsToReenqueuePostDismissal removeObject:v11];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v37 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke;
    v30[3] = &unk_1E6AF9BC0;
    char v35 = v17;
    id v33 = buf;
    void v30[4] = self;
    id v19 = v11;
    id v31 = v19;
    int v34 = v8;
    id v32 = v13;
    long long v20 = (void *)MEMORY[0x1D948C7A0](v30);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_139;
    v22[3] = &unk_1E6AF9BE8;
    long long v26 = buf;
    SEL v27 = a2;
    id v23 = v19;
    id v24 = self;
    int v28 = v8;
    BOOL v29 = a5;
    long long v21 = v20;
    id v25 = v21;
    [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v22];
    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      v21[2](v21);
    }

    _Block_object_dispose(buf, 8);
  }
  else if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
  }
}

uint64_t __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 68) || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2;
    v11[3] = &unk_1E6AF9B98;
    v11[4] = v2;
    id v12 = *(id *)(a1 + 40);
    int v13 = *(_DWORD *)(a1 + 64);
    [v2 _notifyObservers:v11];
    int v3 = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
    id v4 = *(id **)(a1 + 32);
    if (v3)
    {
      [v4[4] removeObject:*(void *)(a1 + 40)];
      int v5 = [*(id *)(a1 + 40) behavesSuperModally];
      uint64_t v6 = *(void *)(a1 + 32);
      if (v5) {
        id v7 = *(void **)(v6 + 24);
      }
      else {
        id v7 = *(void **)(v6 + 16);
      }
      [v7 appendObject:*(void *)(a1 + 40)];
    }
    else
    {
      [v4 _processAlertItemQueuesAnimated:1];
    }
  }
  uint64_t v8 = SBLogAlertItems();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 40) _publicDescription];
    *(_DWORD *)buf = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Deactivated alertItem: %{public}@", buf, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 alertItemsController:*(void *)(a1 + 32) didDeactivateAlertItem:*(void *)(a1 + 40) forReason:*(unsigned int *)(a1 + 48)];
}

void __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(id *)(a1 + 32) == v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"SBAlertItemsController.m", 910, @"We must have only one presentation for an alert item (alertItem: %@).", *(void *)(a1 + 32) object file lineNumber description];

      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    *(unsigned char *)(v7 + 24) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v10 = *(unsigned int *)(a1 + 72);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 76);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2_143;
    v13[3] = &unk_1E6AF5300;
    id v14 = *(id *)(a1 + 48);
    [v8 _dismissAlertItem:v9 fromPresenter:v6 forReason:v10 animated:v11 completion:v13];
  }
}

uint64_t __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_hasActivePresentationsThatPresentModally
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v3 = self->_alertItemPresentations;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = [*(id *)(*((void *)&v20 + 1) + 8 * v7) presenter];
      char v9 = [v8 presentsAlertItemsModally];

      if (v9) {
        goto LABEL_18;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v3 = self->_superModalAlertItemPresentations;
  uint64_t v10 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
LABEL_11:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v3);
      }
      int v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "presenter", (void)v16);
      char v14 = [v13 presentsAlertItemsModally];

      if (v14) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v10) = 1;
  }
LABEL_19:

  return v10;
}

- (void)_dismissAlertItem:(id)a3 fromPresenter:(id)a4 forReason:(int)a5 animated:(BOOL)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBAlertItemsController.m", 937, @"Invalid parameter not satisfying: %@", @"alertItem" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SBAlertItemsController.m", 938, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

LABEL_3:
  long long v16 = [(SBAlertItemsController *)self _presentationForAlertItem:v13];
  if (!v16)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBAlertItemsController.m", 941, @"We must have a presentation for an alert item to dismiss it (alertItem: %@).", v13 object file lineNumber description];
  }
  long long v17 = SBLogAlertItems();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = v14;
    __int16 v34 = 2114;
    id v35 = v16;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Deactivation - Presenter:%{public}@ will dismiss presentation: %{public}@.", buf, 0x16u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke;
  v26[3] = &unk_1E6AF9C10;
  v26[4] = self;
  id v18 = v16;
  id v27 = v18;
  id v28 = v13;
  id v19 = v14;
  BOOL v31 = a6;
  id v29 = v19;
  id v30 = v15;
  id v20 = v15;
  id v21 = v13;
  [(SBAlertItemsController *)self _reallyDeactivateAlertItem:v21 forReason:v9 deactivateBlock:v26];
  long long v22 = SBLogAlertItems();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = v19;
    __int16 v34 = 2114;
    id v35 = v18;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Deactivation - Presenter:%{public}@ did dismiss presentation: %{public}@.", buf, 0x16u);
  }
}

void __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _setPresentationState:3];
  id v2 = *(void **)(a1 + 48);
  int v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke_2;
  v7[3] = &unk_1E6AF5FC8;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 64);
  [v3 dismissAlertItem:v5 animated:v4 completion:v7];
}

uint64_t __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPresentationState:4];
  if (([*(id *)(a1 + 40) _hasActivePresentationsThatPresentModally] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 104) invalidate];
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(void **)(v2 + 104);
    *(void *)(v2 + 104) = 0;
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_reallyDeactivateAlertItem:(id)a3 forReason:(int)a4 deactivateBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = (void (**)(void))a5;
  id v7 = a3;
  [v7 willDeactivateForReason:v5];
  if (v8) {
    v8[2]();
  }
  [v7 didDeactivateForReason:v5];
  [v7 _deactivationCompleted];
}

- (id)_presentationForAlertItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_superModalAlertItemPresentations, self->_alertItemPresentations, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              id v17 = [v16 alertItem];

              if (v17 == v4)
              {
                id v18 = v16;

                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v20;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      id v18 = 0;
    }
    while (v7);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (BOOL)_hasVisibleModalAlertOfType:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBAlertItemsController__hasVisibleModalAlertOfType___block_invoke;
  v5[3] = &unk_1E6AF9C38;
  v5[4] = &v6;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:a3 usingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__SBAlertItemsController__hasVisibleModalAlertOfType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 presentsAlertItemsModally];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_hasVisibleModalAlertOfType:(unint64_t)a3 forWindowScene:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBAlertItemsController__hasVisibleModalAlertOfType_forWindowScene___block_invoke;
  v9[3] = &unk_1E6AF9AB0;
  id v7 = v6;
  id v10 = v7;
  id v11 = &v12;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:a3 usingBlock:v9];
  LOBYTE(a3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

void __69__SBAlertItemsController__hasVisibleModalAlertOfType_forWindowScene___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  if ([a3 presentsAlertItemsModally])
  {
    id v7 = [v10 alertController];
    uint64_t v8 = [v7 _sbWindowScene];
    int v9 = [v8 isEqual:*(void *)(a1 + 32)];

    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (BOOL)deactivateAlertItemsOfClass:(Class)a3
{
  return [(SBAlertItemsController *)self deactivateAlertItemsOfClass:a3 reason:5];
}

- (BOOL)deactivateAlertItemsOfClass:(Class)a3 reason:(int)a4
{
  return [(SBAlertItemsController *)self deactivateAlertItemsOfClass:a3 reason:*(void *)&a4 animated:1];
}

- (BOOL)deactivateAlertItemsOfClass:(Class)a3 reason:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(SBAlertItemsController *)self alertItemsOfClass:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBAlertItemsController *)self deactivateAlertItem:*(void *)(*((void *)&v15 + 1) + 8 * i) reason:v6 animated:v5];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  BOOL v13 = [v8 count] != 0;

  return v13;
}

void __44__SBAlertItemsController_alertItemsOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)hasAlertOfClass:(Class)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  BOOL v12 = 0;
  BOOL v12 = -[SBAlertItemsObjectQueue hasObjectOfClass:](self->_superModalItemsQueue, "hasObjectOfClass:");
  if (*((unsigned char *)v10 + 24)
    || (BOOL v5 = [(SBAlertItemsObjectQueue *)self->_alertItemsQueue hasObjectOfClass:a3],
        (*((unsigned char *)v10 + 24) = v5) != 0))
  {
    BOOL v6 = 1;
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SBAlertItemsController_hasAlertOfClass___block_invoke;
    v8[3] = &unk_1E6AF9C88;
    void v8[4] = &v9;
    v8[5] = a3;
    [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v8];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __42__SBAlertItemsController_hasAlertOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasAlerts
{
  BOOL v3 = [(SBAlertItemsObjectQueue *)self->_alertItemsQueue hasObject];
  BOOL v4 = [(SBAlertItemsObjectQueue *)self->_superModalItemsQueue hasObject];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_alertItemPresentations count];
  uint64_t v6 = [(NSMutableOrderedSet *)self->_superModalAlertItemPresentations count];
  BOOL result = 1;
  if (!v3)
  {
    BOOL v8 = (v5 | v6) != 0;
    return v4 || v8;
  }
  return result;
}

- (BOOL)hasLockScreenModalAlert
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SBAlertItemsController_hasLockScreenModalAlert__block_invoke;
  v4[3] = &unk_1E6AF9AB0;
  v4[4] = self;
  v4[5] = &v5;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__SBAlertItemsController_hasLockScreenModalAlert__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 lockScreenModalAlertItemPresenter];

  if (v8 == v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)hasVisibleAlert
{
  if ([(NSMutableOrderedSet *)self->_alertItemPresentations count]) {
    return 1;
  }
  return [(SBAlertItemsController *)self hasVisibleSuperModalAlert];
}

- (BOOL)hasVisibleAlertForWindowScene:(id)a3
{
  id v4 = a3;
  if ([(NSMutableOrderedSet *)self->_alertItemPresentations count]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(SBAlertItemsController *)self _hasVisibleModalAlertOfType:2 forWindowScene:v4];
  }

  return v5;
}

- (BOOL)hasVisibleModalAlert
{
  return [(SBAlertItemsController *)self _hasVisibleModalAlertOfType:3];
}

- (BOOL)hasVisibleSuperModalAlert
{
  return [(SBAlertItemsController *)self _hasVisibleModalAlertOfType:2];
}

- (id)visibleAlertItem
{
  if ([(SBAlertItemsController *)self hasVisibleSuperModalAlert])
  {
    uint64_t v3 = 48;
LABEL_5:
    id v4 = [*(id *)((char *)&self->super.isa + v3) lastObject];
    BOOL v5 = [v4 alertItem];

    goto LABEL_7;
  }
  if ([(SBAlertItemsController *)self hasVisibleAlert])
  {
    uint64_t v3 = 40;
    goto LABEL_5;
  }
  BOOL v5 = 0;
LABEL_7:
  return v5;
}

- (BOOL)canDeactivateAlertForMenuClickOrSystemGesture
{
  char v2 = [(SBAlertItemsController *)self visibleAlertItem];
  uint64_t v3 = v2;
  BOOL v4 = !v2 || [v2 allowMenuButtonDismissal];

  return v4;
}

- (BOOL)deactivateAlertForMenuClickOrSystemGestureWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBAlertItemsController *)self visibleAlertItem];
  uint64_t v6 = v5;
  if (v5 && [v5 allowMenuButtonDismissal])
  {
    [(SBAlertItemsController *)self deactivateAlertItem:v6 reason:2 animated:v3];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_2;
  v2[3] = &unk_1E6AF9CB0;
  v2[4] = v1;
  char v4 = *(unsigned char *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumeratePresentationsWithType:3 usingBlock:v2];
}

void __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) unlockedAlertItemPresenter];
  if ((id)v7 == v6)
  {

    goto LABEL_5;
  }
  id v8 = (void *)v7;
  id v9 = [*(id *)(a1 + 32) systemApertureAlertItemPresenter];

  if (v9 == v6)
  {
LABEL_5:
    uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_3;
    v12[3] = &unk_1E6AF4AC0;
    uint64_t v11 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v11 _deactivateAlertItem:v5 reason:1 animated:v10 alertDismissCompletion:v12];

    goto LABEL_6;
  }
  [*(id *)(a1 + 40) signal];
LABEL_6:
}

uint64_t __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (void)_buddyDidExit
{
  if (![(NSMutableSet *)self->_forceAlertsToPendReasons count])
  {
    [(SBAlertItemsController *)self activatePendedAlertsIfNecessary];
  }
}

- (void)_activeCallStateDidChange:(id)a3
{
  char v4 = +[SBTelephonyManager sharedTelephonyManager];
  char v5 = [v4 inCall];

  if ((v5 & 1) == 0)
  {
    [(SBAlertItemsController *)self _processAlertItemQueuesAnimated:1];
  }
}

- (void)_silencingHardwareButtonPressed:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SBAlertItemsController__silencingHardwareButtonPressed___block_invoke;
  v3[3] = &unk_1E6AF9A60;
  v3[4] = self;
  [(SBAlertItemsController *)self _enumeratePresentationsWithType:3 usingBlock:v3];
}

void __58__SBAlertItemsController__silencingHardwareButtonPressed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) lockScreenModalAlertItemPresenter];
  if ((id)v6 == v5)
  {
  }
  else
  {
    uint64_t v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) lockScreenNotificationsAlertItemPresenter];

    if (v8 != v5) {
      goto LABEL_6;
    }
  }
  [v9 _noteSilencingHardwareButtonPressed];
LABEL_6:
}

- (void)_notifyObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)captureSuppressionAssertion:(id)a3 reason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a3;
  if ([v8 isMainThread])
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    id v19 = [NSString stringWithUTF8String:"-[SBAlertItemsController captureSuppressionAssertion:reason:]"];
    [v18 handleFailureInFunction:v19 file:@"SBAlertItemsController.m" lineNumber:1248 description:@"this call must be made on the main thread"];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SBAlertItemsController.m", 1249, @"Invalid parameter not satisfying: %@", @"sendRight" object file lineNumber description];

LABEL_3:
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F4F7E0]) initWithSendRight:v9];

  suppressionAssertionReasons = self->_suppressionAssertionReasons;
  if (suppressionAssertionReasons)
  {
    if (v7)
    {
LABEL_5:
      [(NSMapTable *)suppressionAssertionReasons setObject:v7 forKey:v10];
      goto LABEL_8;
    }
  }
  else
  {
    long long v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v13 = self->_suppressionAssertionReasons;
    self->_suppressionAssertionReasons = v12;

    suppressionAssertionReasons = self->_suppressionAssertionReasons;
    if (v7) {
      goto LABEL_5;
    }
  }
  uint64_t v14 = [v10 description];
  [(NSMapTable *)suppressionAssertionReasons setObject:v14 forKey:v10];

LABEL_8:
  uint64_t v15 = SBLogAlertItems();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v7;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Adding alertItemsSuppression assertion : %{public}@", buf, 0xCu);
  }

  [(SBAlertItemsController *)self setForceAlertsToPend:1 forReason:@"suppressionAssertions"];
  [(SBAlertItemsController *)self moveActiveUnlockedAlertsToPendingWithAnimation:1 completion:0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__SBAlertItemsController_captureSuppressionAssertion_reason___block_invoke;
  v21[3] = &unk_1E6AF4E00;
  id v22 = v7;
  long long v23 = self;
  id v24 = v10;
  id v16 = v10;
  id v17 = v7;
  [v16 activateWithHandler:v21];
}

void __61__SBAlertItemsController_captureSuppressionAssertion_reason___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  BSDispatchMain();
}

uint64_t __61__SBAlertItemsController_captureSuppressionAssertion_reason___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogAlertItems();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Removing alertItemsSuppression assertion : %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:*(void *)(a1 + 48)];
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 72) count];
  if (!result)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = 0;

    return [*(id *)(a1 + 40) setForceAlertsToPend:0 forReason:@"suppressionAssertions"];
  }
  return result;
}

- (SBModalAlertPresenter)_systemModalAlertPresenter
{
  return self->_systemModalAlertPresenter;
}

- (void)_setSystemModalAlertPresenter:(id)a3
{
}

- (SBWindowSceneManager)windowSceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  return (SBWindowSceneManager *)WeakRetained;
}

- (void)setWindowSceneManager:(id)a3
{
}

- (SBAlertItemPresenter)lockScreenModalAlertItemPresenter
{
  return self->_lockScreenModalAlertItemPresenter;
}

- (SBAlertItemPresenter)lockScreenNotificationsAlertItemPresenter
{
  return self->_lockScreenNotificationsAlertItemPresenter;
}

- (SBAlertItemPresenter)systemApertureAlertItemPresenter
{
  return self->_systemApertureAlertItemPresenter;
}

- (SBAlertItemPresenter)unlockedAlertItemPresenter
{
  return self->_unlockedAlertItemPresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedAlertItemPresenter, 0);
  objc_storeStrong((id *)&self->_systemApertureAlertItemPresenter, 0);
  objc_storeStrong((id *)&self->_lockScreenNotificationsAlertItemPresenter, 0);
  objc_storeStrong((id *)&self->_lockScreenModalAlertItemPresenter, 0);
  objc_destroyWeak((id *)&self->_windowSceneManager);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_systemModalAlertPresenter, 0);
  objc_storeStrong((id *)&self->_systemModalAlertVisibleAssertion, 0);
  objc_storeStrong((id *)&self->_stateCaptureBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suppressionAssertionReasons, 0);
  objc_storeStrong((id *)&self->_forceAlertsToPendReasons, 0);
  objc_storeStrong((id *)&self->_activePresenters, 0);
  objc_storeStrong((id *)&self->_superModalAlertItemPresentations, 0);
  objc_storeStrong((id *)&self->_alertItemPresentations, 0);
  objc_storeStrong((id *)&self->_pendedAlertsToReenqueuePostDismissal, 0);
  objc_storeStrong((id *)&self->_superModalItemsQueue, 0);
  objc_storeStrong((id *)&self->_alertItemsQueue, 0);
  objc_storeStrong((id *)&self->_userSessionController, 0);
}

- (void)setForceAlertsToPend:(uint64_t)a1 forReason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Adding pend alert items reason: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setForceAlertsToPend:(uint64_t)a1 forReason:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Removing pend alert items reason: %@", (uint8_t *)&v2, 0xCu);
}

@end