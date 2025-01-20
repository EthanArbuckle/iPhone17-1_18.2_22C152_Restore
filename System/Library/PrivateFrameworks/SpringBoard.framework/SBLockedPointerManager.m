@interface SBLockedPointerManager
- (BOOL)_queue_prefersLockForSceneIdentifier:(id)a3;
- (BOOL)_shouldAllowPointerLockedForScene:(id)a3;
- (SBLockedPointerManager)initWithWindowScene:(id)a3;
- (id)_possibleSceneHandleForLockingPointerFromLayoutState:(id)a3;
- (void)_notInvalidated_updateLockForLayoutState:(id)a3;
- (void)_queue_lockPointerForSceneIdentifier:(id)a3;
- (void)_queue_unlockPointer;
- (void)_queue_updateLockForLayoutState:(id)a3;
- (void)_setPointerLockStatus:(int64_t)a3 forSceneWithIdentifier:(id)a4;
- (void)clientWithSceneIdentifier:(id)a3 prefersPointerLockStatus:(int64_t)a4;
- (void)clientWithSceneIdentifier:(id)a3 suppressPreferredLockStatus:(BOOL)a4;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4;
@end

@implementation SBLockedPointerManager

uint64_t __67__SBLockedPointerManager__notInvalidated_updateLockForLayoutState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockForLayoutState:", *(void *)(a1 + 40));
}

uint64_t __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

uint64_t __99__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SBLockedPointerManager_sceneManager_didAddExternalForegroundApplicationSceneHandle___block_invoke;
  v9[3] = &unk_1E6AF4B88;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateSerialQueue, v9);
  if (!*((unsigned char *)v11 + 24)) {
    [v7 addObserver:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __97__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (id)_possibleSceneHandleForLockingPointerFromLayoutState:(id)a3
{
  id v3 = a3;
  v4 = [v3 elements];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    id v6 = SBLogPointer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:]();
    }
    goto LABEL_16;
  }
  if (!v5)
  {
    id v6 = SBLogPointer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:]();
    }
    goto LABEL_16;
  }
  uint64_t v7 = objc_opt_class();
  v8 = SBSafeCast(v7, v3);
  id v6 = v8;
  if (!v8)
  {
LABEL_8:
    v9 = [v3 elements];
    uint64_t v10 = [v9 anyObject];

    v11 = [v10 workspaceEntity];
    uint64_t v12 = [v11 applicationSceneEntity];
    char v13 = [v12 sceneHandle];

    goto LABEL_17;
  }
  if ([v8 unlockedEnvironmentMode] == 3)
  {
    if ([v6 spaceConfiguration] == 1) {
      goto LABEL_8;
    }
    v14 = SBLogPointer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:]();
    }
  }
  else
  {
    v14 = SBLogPointer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SBLockedPointerManager _possibleSceneHandleForLockingPointerFromLayoutState:].cold.4();
    }
  }

LABEL_16:
  char v13 = 0;
LABEL_17:

  return v13;
}

- (void)_queue_updateLockForLayoutState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  if (self->_queue_isInvalidated)
  {
    unint64_t v5 = SBLogPointer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      *(void *)v16 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to update pointer lock state for layout state: %@ because I'm invalidated", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    unint64_t v5 = [(SBLockedPointerManager *)self _possibleSceneHandleForLockingPointerFromLayoutState:v4];
    id v6 = [v5 sceneIdentifier];
    uint64_t v7 = SBLogPointer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      *(void *)v16 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Re-evaluating pointer lock state for scene %@", (uint8_t *)&v15, 0xCu);
    }

    queue_sceneIdentifierThatHasLockedPointer = self->_queue_sceneIdentifierThatHasLockedPointer;
    BOOL v9 = [(SBLockedPointerManager *)self _queue_prefersLockForSceneIdentifier:v6];
    int v10 = [(NSMutableSet *)self->_queue_sceneIdentifiersThatSuppressPreferredLockStatus containsObject:v6];
    if (v9) {
      int v11 = [(SBLockedPointerManager *)self _shouldAllowPointerLockedForScene:v5] & (v10 ^ 1);
    }
    else {
      int v11 = 0;
    }
    uint64_t v12 = SBLogPointer();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109632;
      *(_DWORD *)v16 = v9;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v11;
      __int16 v17 = 1024;
      BOOL v18 = queue_sceneIdentifierThatHasLockedPointer != 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "currentScenePrefersLock:%d shouldBeLocked:%d isCurrentlyLocked:%d", (uint8_t *)&v15, 0x14u);
    }

    if (!v11 || queue_sceneIdentifierThatHasLockedPointer)
    {
      if (queue_sceneIdentifierThatHasLockedPointer) {
        char v14 = v11;
      }
      else {
        char v14 = 1;
      }
      if ((v14 & 1) == 0) {
        [(SBLockedPointerManager *)self _queue_unlockPointer];
      }
    }
    else
    {
      char v13 = [v5 sceneIdentifier];
      [(SBLockedPointerManager *)self _queue_lockPointerForSceneIdentifier:v13];
    }
  }
}

- (BOOL)_queue_prefersLockForSceneIdentifier:(id)a3
{
  stateSerialQueue = self->_stateSerialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateSerialQueue);
  id v6 = [(NSMutableDictionary *)self->_queue_preferredLockStatusBySceneIdentifier objectForKey:v5];

  if (v6) {
    BOOL v7 = [v6 integerValue] == 1;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_sceneSettingsInspector)
  {
    int v11 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    sceneSettingsInspector = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v11;

    objc_initWeak(&location, self);
    char v13 = self->_sceneSettingsInspector;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v23[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v24, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v13 observeDeactivationReasonsWithBlock:v23];
    char v14 = self->_sceneSettingsInspector;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v21[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v22, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v14 observeIsForegroundWithBlock:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  id location = 0;
  p_id location = &location;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_3;
  v16[3] = &unk_1E6AF4B88;
  v16[4] = self;
  v16[5] = &location;
  dispatch_sync(stateSerialQueue, v16);
  if (!*((unsigned char *)p_location + 24)) {
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsInspector inspectDiff:v9 withContext:0];
  }
  _Block_object_dispose(&location, 8);
}

uint64_t __86__SBLockedPointerManager_sceneManager_didAddExternalForegroundApplicationSceneHandle___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateSerialQueue, block);
  if (*((unsigned char *)v13 + 24))
  {
    id v9 = SBLogPointer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring layout state transition didEnd because I'm invalidated", v10, 2u);
    }
  }
  else
  {
    id v9 = [v7 toLayoutState];
    [(SBLockedPointerManager *)self _notInvalidated_updateLockForLayoutState:v9];
  }

  _Block_object_dispose(&v12, 8);
}

void __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notInvalidated_updateLockForLayoutState:", 0);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__SBLockedPointerManager_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateSerialQueue, block);
  if (*((unsigned char *)v13 + 24))
  {
    id v9 = SBLogPointer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring layout state transition didBegin because I'm invalidated", v10, 2u);
    }
  }
  else
  {
    id v9 = [v7 toLayoutState];
    [(SBLockedPointerManager *)self _notInvalidated_updateLockForLayoutState:v9];
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_notInvalidated_updateLockForLayoutState:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v6 = [WeakRetained layoutStateProvider];
    id v4 = [v6 layoutState];
  }
  stateSerialQueue = self->_stateSerialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBLockedPointerManager__notInvalidated_updateLockForLayoutState___block_invoke;
  v9[3] = &unk_1E6AF5290;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(stateSerialQueue, v9);
}

- (SBLockedPointerManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBLockedPointerManager;
  id v5 = [(SBLockedPointerManager *)&v17 init];
  if (v5)
  {
    id v6 = (PSPointerClientController *)objc_alloc_init(MEMORY[0x1E4F92130]);
    pointerClientController = v5->_pointerClientController;
    v5->_pointerClientController = v6;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    stateSerialQueue = v5->_stateSerialQueue;
    v5->_stateSerialQueue = (OS_dispatch_queue *)Serial;

    uint64_t v10 = objc_opt_new();
    queue_preferredLockStatusBySceneIdentifier = v5->_queue_preferredLockStatusBySceneIdentifier;
    v5->_queue_preferredLockStatusBySceneIdentifier = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    queue_sceneIdentifiersThatSuppressPreferredLockStatus = v5->_queue_sceneIdentifiersThatSuppressPreferredLockStatus;
    v5->_queue_sceneIdentifiersThatSuppressPreferredLockStatus = (NSMutableSet *)v12;

    uint64_t v14 = [v4 sceneManager];
    [v14 addObserver:v5];

    char v15 = [v4 layoutStateTransitionCoordinator];
    [v15 addObserver:v5];

    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v5;
}

- (void)clientWithSceneIdentifier:(id)a3 prefersPointerLockStatus:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __77__SBLockedPointerManager_clientWithSceneIdentifier_prefersPointerLockStatus___block_invoke;
  uint64_t v14 = &unk_1E6AF63D0;
  objc_super v17 = &v19;
  int64_t v18 = a4;
  char v15 = self;
  id v8 = v6;
  id v16 = v8;
  dispatch_sync(stateSerialQueue, &v11);
  if (*((unsigned char *)v20 + 24))
  {
    id v9 = SBLogPointer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", a4, v11, v12, v13, v14, v15);
      *(_DWORD *)buf = 138543618;
      id v24 = v8;
      __int16 v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring request from %{public}@ to set pointerLockStatus %{public}@ because I'm invalidated", buf, 0x16u);
    }
  }
  else
  {
    -[SBLockedPointerManager _notInvalidated_updateLockForLayoutState:](self, "_notInvalidated_updateLockForLayoutState:", 0, v11, v12, v13, v14, v15);
  }

  _Block_object_dispose(&v19, 8);
}

void __77__SBLockedPointerManager_clientWithSceneIdentifier_prefersPointerLockStatus___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 80);
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    v2 = *(void **)(a1[4] + 32);
    id v3 = [NSNumber numberWithInteger:a1[7]];
    [v2 setObject:v3 forKey:a1[5]];
  }
}

- (void)clientWithSceneIdentifier:(id)a3 suppressPreferredLockStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  objc_super v17 = __80__SBLockedPointerManager_clientWithSceneIdentifier_suppressPreferredLockStatus___block_invoke;
  int64_t v18 = &unk_1E6B03DF0;
  uint64_t v21 = &v23;
  uint64_t v19 = self;
  id v8 = v6;
  id v20 = v8;
  BOOL v22 = v4;
  dispatch_sync(stateSerialQueue, &v15);
  if (*((unsigned char *)v24 + 24))
  {
    id v9 = SBLogPointer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", v4, v15, v16, v17, v18, v19);
      *(_DWORD *)buf = 138543618;
      id v28 = v8;
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring request from %{public}@ to set suppressPreferredLockStatus %{public}@ because I'm invalidated", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    char v13 = objc_msgSend(WeakRetained, "switcherController", v15, v16, v17, v18, v19);
    uint64_t v14 = [v13 contentViewController];
    id v9 = SBSafeCast(v11, v14);

    if (v9) {
      [v9 clientWithSceneIdentifier:v8 suppressPreferredPointerLockStatusUpdated:v4];
    }
    [(SBLockedPointerManager *)self _notInvalidated_updateLockForLayoutState:0];
  }

  _Block_object_dispose(&v23, 8);
}

void *__80__SBLockedPointerManager_clientWithSceneIdentifier_suppressPreferredLockStatus___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(result[4] + 80);
  if (!*(unsigned char *)(*(void *)(result[6] + 8) + 24))
  {
    v1 = result;
    result = (void *)[*(id *)(result[4] + 48) containsObject:result[5]];
    if (result)
    {
      if (!*((unsigned char *)v1 + 56))
      {
        uint64_t v2 = v1[5];
        id v3 = *(void **)(v1[4] + 48);
        return (void *)[v3 removeObject:v2];
      }
    }
    else if (*((unsigned char *)v1 + 56))
    {
      uint64_t v4 = v1[5];
      id v5 = *(void **)(v1[4] + 48);
      return (void *)[v5 addObject:v4];
    }
  }
  return result;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v4 = [WeakRetained sceneManager];
  [v4 removeObserver:self];

  id v5 = [WeakRetained layoutStateTransitionCoordinator];
  [v5 removeObserver:self];

  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLockedPointerManager_invalidate__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(stateSerialQueue, block);
}

void __36__SBLockedPointerManager_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__SBLockedPointerManager_sceneManager_didRemoveExternalForegroundApplicationSceneHandle___block_invoke;
  v9[3] = &unk_1E6AF4B88;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(stateSerialQueue, v9);
  if (!*((unsigned char *)v11 + 24)) {
    [v7 removeObserver:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __89__SBLockedPointerManager_sceneManager_didRemoveExternalForegroundApplicationSceneHandle___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

void __81__SBLockedPointerManager_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notInvalidated_updateLockForLayoutState:", 0);
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SBLockedPointerManager_sceneHandle_didDestroyScene___block_invoke;
  v10[3] = &unk_1E6AF4B88;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateSerialQueue, v10);
  if (!*((unsigned char *)v12 + 24))
  {
    id v9 = [v7 identifier];
    if (v9)
    {
      [(NSMutableDictionary *)self->_queue_preferredLockStatusBySceneIdentifier removeObjectForKey:v9];
      [(NSMutableSet *)self->_queue_sceneIdentifiersThatSuppressPreferredLockStatus removeObject:v9];
      [(SBLockedPointerManager *)self _notInvalidated_updateLockForLayoutState:0];
    }
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __54__SBLockedPointerManager_sceneHandle_didDestroyScene___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (BOOL)_shouldAllowPointerLockedForScene:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBControlCenterController sharedInstance];
  id v6 = [v5 _controlCenterWindow];
  id v7 = [v6 windowScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if ([v7 isEqual:WeakRetained]) {
    int v9 = [v5 isPresented] ^ 1;
  }
  else {
    int v9 = 1;
  }

  uint64_t v10 = +[SBCoverSheetPresentationManager sharedInstance];
  int v11 = [v10 isPresented] ^ 1;

  uint64_t v12 = [v4 sceneIfExists];
  if (v12)
  {
    int v13 = [v4 isEffectivelyForeground];
    char v14 = [v12 settings];
    if ([v14 isUISubclass]) {
      BOOL v15 = ([v14 deactivationReasons] & 0xFFFFFFFFFFFFFEFFLL) == 0;
    }
    else {
      BOOL v15 = 1;
    }
    int v16 = v13 & v15;
  }
  else
  {
    int v16 = 0;
  }
  objc_super v17 = SBLogPointer();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109888;
    v19[1] = v9 & v11 & v16;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 1024;
    int v25 = v16;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "shouldAllow:%d isAllowedBasedOnControlCenterState:%d isAllowedBasedOnCoverSheetState:%d isAllowedFromActivationState:%d", (uint8_t *)v19, 0x1Au);
  }

  return v9 & v11 & v16;
}

- (void)_queue_lockPointerForSceneIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  id v5 = SBLogPointer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int64_t v18 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Locking pointer for scene %{public}@", buf, 0xCu);
  }

  if (self->_queue_sceneIdentifierThatHasLockedPointer) {
    -[SBLockedPointerManager _setPointerLockStatus:forSceneWithIdentifier:](self, "_setPointerLockStatus:forSceneWithIdentifier:", 0);
  }
  id v6 = [NSString stringWithFormat:@"Scene %@ requested locked pointer", v4];
  id v7 = [MEMORY[0x1E4F4F350] sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v9 = [WeakRetained _fbsDisplayConfiguration];
  uint64_t v10 = [v9 hardwareIdentifier];
  int v11 = [v7 pointerSuppressionAssertionOnDisplay:v10 forReason:v6 withOptionsMask:2];
  queue_backboardLockedPointerAssertion = self->_queue_backboardLockedPointerAssertion;
  self->_queue_backboardLockedPointerAssertion = v11;

  int v13 = [(PSPointerClientController *)self->_pointerClientController persistentlyHidePointerAssertionForReason:4];
  queue_pointerHiddenAssertion = self->_queue_pointerHiddenAssertion;
  self->_queue_pointerHiddenAssertion = v13;

  queue_sceneIdentifierThatHasLockedPointer = self->_queue_sceneIdentifierThatHasLockedPointer;
  self->_queue_sceneIdentifierThatHasLockedPointer = v4;
  int v16 = v4;

  [(SBLockedPointerManager *)self _setPointerLockStatus:1 forSceneWithIdentifier:v16];
}

- (void)_queue_unlockPointer
{
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Shouldn't be unlocking pointer because it's not locked", v1, 2u);
}

- (void)_setPointerLockStatus:(int64_t)a3 forSceneWithIdentifier:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke;
  v7[3] = &unk_1E6AF4A70;
  id v8 = v5;
  int64_t v9 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F62490] sharedInstance];
  id v3 = [v2 sceneWithIdentifier:*(void *)(a1 + 32)];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke_2;
  v4[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  v4[4] = *(void *)(a1 + 40);
  [v3 updateSettingsWithBlock:v4];
}

uint64_t __71__SBLockedPointerManager__setPointerLockStatus_forSceneWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPointerLockStatus:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_queue_pointerHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_queue_backboardLockedPointerAssertion, 0);
  objc_storeStrong((id *)&self->_queue_sceneIdentifiersThatSuppressPreferredLockStatus, 0);
  objc_storeStrong((id *)&self->_queue_sceneIdentifierThatHasLockedPointer, 0);
  objc_storeStrong((id *)&self->_queue_preferredLockStatusBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Disallowing pointer lock because >1 elements", v2, v3, v4, v5, v6);
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Disallowing pointer lock because 0 elements", v2, v3, v4, v5, v6);
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Disallowing pointer lock because not fullscreen", v2, v3, v4, v5, v6);
}

- (void)_possibleSceneHandleForLockingPointerFromLayoutState:.cold.4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Disallowing pointer lock because not application mode", v2, v3, v4, v5, v6);
}

@end