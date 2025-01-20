@interface SBMousePointerManager
- (BOOL)isHardwarePointingDeviceAttached;
- (BOOL)shouldAllowHardwarePointingDevices;
- (CGAffineTransform)rootWindowTransformForEmbeddedDisplay;
- (SBMousePointerManager)init;
- (id)requestPointerActivationForScene:(id)a3;
- (id)setSystemPointerInteractionContextID:(unsigned int)a3 displayWithHardwareIdentifier:(id)a4;
- (void)_handleAssistiveTouchEnabledDidChangeNotification;
- (void)_notifyObserversPointingDeviceBecameAvailable:(BOOL)a3;
- (void)_setPointerUIDWithConnectedDeviceCount:(unint64_t)a3;
- (void)_updatePointerAssertionsAndScenes;
- (void)_updateScenesForPointerWithHardwareAttached:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)mousePointerDevicesDidChange:(id)a3;
- (void)pointerClientController:(id)a3 sceneDidActivate:(id)a4;
- (void)pointerClientController:(id)a3 sceneWillDeactivate:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setRootWindowTransformForEmbeddedDisplay:(CGAffineTransform *)a3;
@end

@implementation SBMousePointerManager

- (BOOL)isHardwarePointingDeviceAttached
{
  return self->_connectedPointingDevicesCount
      && [(SBMousePointerManager *)self shouldAllowHardwarePointingDevices];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (SBMousePointerManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBMousePointerManager;
  v2 = [(SBMousePointerManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4F350] sharedInstance];
    mousePointerService = v2->_mousePointerService;
    v2->_mousePointerService = (BKSMousePointerService *)v3;

    uint64_t v5 = [(BKSMousePointerService *)v2->_mousePointerService addPointerDeviceObserver:v2];
    mousePointerDeviceObserverToken = v2->_mousePointerDeviceObserverToken;
    v2->_mousePointerDeviceObserverToken = (BSInvalidatable *)v5;

    v7 = (PSPointerClientController *)objc_alloc_init(MEMORY[0x1E4F92130]);
    pointerClientController = v2->_pointerClientController;
    v2->_pointerClientController = v7;

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_SBMousePointerManagerAssistiveTouchEnabledDidChange, (CFStringRef)*MEMORY[0x1E4FB9080], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v10 = MEMORY[0x1E4F1DAB8];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_rootWindowTransformForEmbeddedDisplay.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_rootWindowTransformForEmbeddedDisplay.c = v11;
    *(_OWORD *)&v2->_rootWindowTransformForEmbeddedDisplay.tx = *(_OWORD *)(v10 + 32);
  }
  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_mousePointerDeviceObserverToken invalidate];
  mousePointerDeviceObserverToken = self->_mousePointerDeviceObserverToken;
  self->_mousePointerDeviceObserverToken = 0;

  [(PSPointerClientController *)self->_pointerClientController invalidate];
  pointerClientController = self->_pointerClientController;
  self->_pointerClientController = 0;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4FB9080], 0);
  v6.receiver = self;
  v6.super_class = (Class)SBMousePointerManager;
  [(SBMousePointerManager *)&v6 dealloc];
}

- (id)setSystemPointerInteractionContextID:(unsigned int)a3 displayWithHardwareIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogPointer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = v4;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Setting system pointer interaction contextID: 0x%x for displayUUID %{public}@", buf, 0x12u);
  }

  v9 = [(PSPointerClientController *)self->_pointerClientController setSystemPointerInteractionContextID:v4 displayUUID:v7];
  if (!v9)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBMousePointerManager.m", 77, @"failed to set the system pointer interaction contextID on display: %@, did you already set it and forget to invalidate it?", v7 object file lineNumber description];
  }
  return v9;
}

- (void)setRootWindowTransformForEmbeddedDisplay:(CGAffineTransform *)a3
{
  BSDispatchQueueAssertMain();
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v6 = *(_OWORD *)&self->_rootWindowTransformForEmbeddedDisplay.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&self->_rootWindowTransformForEmbeddedDisplay.a;
  *(_OWORD *)&v9.c = v6;
  *(_OWORD *)&v9.tx = *(_OWORD *)&self->_rootWindowTransformForEmbeddedDisplay.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v9))
  {
    long long v7 = *(_OWORD *)&a3->a;
    long long v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_rootWindowTransformForEmbeddedDisplay.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_rootWindowTransformForEmbeddedDisplay.tx = v8;
    *(_OWORD *)&self->_rootWindowTransformForEmbeddedDisplay.a = v7;
    [(SBMousePointerManager *)self _updatePointerAssertionsAndScenes];
  }
}

- (BOOL)shouldAllowHardwarePointingDevices
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1 || _AXSAssistiveTouchEnabled() != 0;
}

- (void)removeObserver:(id)a3
{
}

- (id)requestPointerActivationForScene:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = [v5 _sceneIdentifier];
  long long v7 = SBLogPointer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Requesting pointer for scene %{public}@", buf, 0xCu);
  }

  if (!self->_systemClientController)
  {
    long long v8 = (PSPointerSystemClientController *)objc_opt_new();
    systemClientController = self->_systemClientController;
    self->_systemClientController = v8;

    [(PSPointerSystemClientController *)self->_systemClientController setDelegate:self];
  }
  springBoardScenesToPointerAssertions = self->_springBoardScenesToPointerAssertions;
  if (!springBoardScenesToPointerAssertions)
  {
    long long v11 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    v12 = self->_springBoardScenesToPointerAssertions;
    self->_springBoardScenesToPointerAssertions = v11;

    springBoardScenesToPointerAssertions = self->_springBoardScenesToPointerAssertions;
  }
  int v13 = [(NSMapTable *)springBoardScenesToPointerAssertions objectForKey:v5];
  if (v13)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBMousePointerManager.m", 122, @"attempting to take an assertion when we already have one: %@", v13 object file lineNumber description];
  }
  __int16 v14 = [v5 _sbDisplayConfiguration];
  id v15 = [v14 identity];

  objc_initWeak((id *)buf, self);
  id v16 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v17 = MEMORY[0x1E4F14428];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__SBMousePointerManager_requestPointerActivationForScene___block_invoke;
  v24[3] = &unk_1E6AFD1F0;
  id v18 = v6;
  id v25 = v18;
  objc_copyWeak(v29, (id *)buf);
  id v19 = v5;
  id v26 = v19;
  id v20 = v15;
  v29[1] = (id)a2;
  id v27 = v20;
  v28 = self;
  v21 = (void *)[v16 initWithIdentifier:@"com.apple.springboard.SBMousePointerManager" forReason:v18 queue:MEMORY[0x1E4F14428] invalidationBlock:v24];

  [(NSMapTable *)self->_springBoardScenesToPointerAssertions setObject:v21 forKey:v19];
  [(SBMousePointerManager *)self _updatePointerAssertionsAndScenes];

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __58__SBMousePointerManager_requestPointerActivationForScene___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = SBLogPointer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating pointer for scene %{public}@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 40) _sbDisplayConfiguration];
    long long v6 = [v5 identity];

    if (([v6 isEqual:*(void *)(a1 + 48)] & 1) == 0)
    {
      CGAffineTransform v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 72), *(void *)(a1 + 56), @"SBMousePointerManager.m", 132, @"the display identity of our windowScene changed from %@ to %@; the world has changed around us and we've been forgotten.",
        *(void *)(a1 + 48),
        v6);
    }
    long long v7 = (void *)*((void *)WeakRetained + 4);
    long long v8 = [*(id *)(a1 + 40) _sbDisplayConfiguration];
    [v7 invalidateScenesForPointerForDisplayConfiguration:v8];

    [*((id *)WeakRetained + 9) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)mousePointerDevicesDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SBMousePointerManager_mousePointerDevicesDidChange___block_invoke;
  block[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__SBMousePointerManager_mousePointerDevicesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setPointerUIDWithConnectedDeviceCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
}

- (void)pointerClientController:(id)a3 sceneDidActivate:(id)a4
{
  id v4 = a4;
  id v5 = [v4 settings];
  objc_msgSend(v5, "sb_displayIdentityForSceneManagers");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  long long v6 = +[SBSceneManagerCoordinator sharedInstance];
  id v7 = [v6 sceneManagerForDisplayIdentity:v8];

  [v7 addPointerUISceneToPresentationBinder:v4];
}

- (void)pointerClientController:(id)a3 sceneWillDeactivate:(id)a4
{
  id v4 = a4;
  id v5 = [v4 settings];
  objc_msgSend(v5, "sb_displayIdentityForSceneManagers");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  long long v6 = +[SBSceneManagerCoordinator sharedInstance];
  id v7 = [v6 sceneManagerForDisplayIdentity:v8];

  [v7 removePointerUISceneFromPresentationBinder:v4];
}

- (void)_notifyObserversPointingDeviceBecameAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) mousePointerManager:self hardwarePointingDeviceAttachedDidChange:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleAssistiveTouchEnabledDidChangeNotification
{
}

uint64_t __74__SBMousePointerManager__handleAssistiveTouchEnabledDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePointerAssertionsAndScenes];
}

- (void)_setPointerUIDWithConnectedDeviceCount:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_connectedPointingDevicesCount != a3)
  {
    self->_unint64_t connectedPointingDevicesCount = a3;
    [(SBMousePointerManager *)self _updatePointerAssertionsAndScenes];
    id v4 = SBLogPointer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t connectedPointingDevicesCount = self->_connectedPointingDevicesCount;
      int v6 = 134217984;
      unint64_t v7 = connectedPointingDevicesCount;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Updating to %lu pointing devices connected", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_updatePointerAssertionsAndScenes
{
  BOOL v3 = [(SBMousePointerManager *)self shouldAllowHardwarePointingDevices];
  suppressEventsAssertion = self->_suppressEventsAssertion;
  if (!v3)
  {
    if (!suppressEventsAssertion)
    {
      unint64_t v7 = [(BKSMousePointerService *)self->_mousePointerService suppressPointerEventsForReason:@"SpringBoard policy"];
      uint64_t v8 = self->_suppressEventsAssertion;
      self->_suppressEventsAssertion = v7;
    }
    goto LABEL_10;
  }
  if (suppressEventsAssertion)
  {
    [(BSInvalidatable *)suppressEventsAssertion invalidate];
    id v5 = self->_suppressEventsAssertion;
    self->_suppressEventsAssertion = 0;
  }
  if (!self->_connectedPointingDevicesCount)
  {
LABEL_10:
    char v6 = 0;
    goto LABEL_11;
  }
  if ([(NSMapTable *)self->_springBoardScenesToPointerAssertions count])
  {
    if (self->_serviceKeepAliveAssertion)
    {
      char v6 = 1;
    }
    else
    {
      long long v10 = [(PSPointerClientController *)self->_pointerClientController acquireServiceKeepAliveAssertion];
      serviceKeepAliveAssertion = self->_serviceKeepAliveAssertion;
      self->_serviceKeepAliveAssertion = v10;

      char v6 = 1;
      [(SBMousePointerManager *)self _notifyObserversPointingDeviceBecameAvailable:1];
    }
    goto LABEL_13;
  }
  char v6 = 1;
LABEL_11:
  if (self->_serviceKeepAliveAssertion)
  {
    [(SBMousePointerManager *)self _notifyObserversPointingDeviceBecameAvailable:0];
    [(BSInvalidatable *)self->_serviceKeepAliveAssertion invalidate];
    uint64_t v9 = self->_serviceKeepAliveAssertion;
    self->_serviceKeepAliveAssertion = 0;
  }
LABEL_13:
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBMousePointerManager__updatePointerAssertionsAndScenes__block_invoke;
  block[3] = &unk_1E6AFD218;
  objc_copyWeak(&v13, &location);
  char v14 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __58__SBMousePointerManager__updatePointerAssertionsAndScenes__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateScenesForPointerWithHardwareAttached:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateScenesForPointerWithHardwareAttached:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_springBoardScenesToPointerAssertions;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    p_rootWindowTransformForEmbeddedDisplay = &self->_rootWindowTransformForEmbeddedDisplay;
    id v26 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v12 = [v11 _sbDisplayConfiguration];
        if (!v12)
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2, self, @"SBMousePointerManager.m", 241, @"window scene %@ doesn't have a displayConfiguration, why are we tracking disconnected scenes???", v11 object file lineNumber description];
        }
        id v13 = SBLogPointer();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v3)
        {
          if (v14)
          {
            id v17 = [v11 _sceneIdentifier];
            id v18 = [v12 hardwareIdentifier];
            systemClientController = self->_systemClientController;
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = systemClientController;
            _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "Activating pointer scenes for SB windowScene %{public}@ (%{public}@) - systemClientController: %p", buf, 0x20u);

            p_rootWindowTransformForEmbeddedDisplay = &self->_rootWindowTransformForEmbeddedDisplay;
          }

          [(PSPointerSystemClientController *)self->_systemClientController prepareScenesForPointerForDisplayConfiguration:v12];
          if [v12 isMainDisplay] && (objc_opt_respondsToSelector())
          {
            uint64_t v15 = self->_systemClientController;
            long long v16 = *(_OWORD *)&p_rootWindowTransformForEmbeddedDisplay->c;
            *(_OWORD *)buf = *(_OWORD *)&p_rootWindowTransformForEmbeddedDisplay->a;
            *(_OWORD *)&buf[16] = v16;
            long long v32 = *(_OWORD *)&p_rootWindowTransformForEmbeddedDisplay->tx;
            [(PSPointerSystemClientController *)v15 setRootWindowTransform:buf forDisplayConfiguration:v12];
          }
        }
        else
        {
          if (v14)
          {
            id v20 = [v11 _sceneIdentifier];
            v21 = [v12 identity];
            v22 = [v12 hardwareIdentifier];
            v23 = self->_systemClientController;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v22;
            LOWORD(v32) = 2048;
            *(void *)((char *)&v32 + 2) = v23;
            _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "Invalidating pointer scenes for SB windowScene %{public}@ displayIdentity: %@ (%{public}@) - systemClientController: %p", buf, 0x2Au);

            id v5 = v26;
            p_rootWindowTransformForEmbeddedDisplay = &self->_rootWindowTransformForEmbeddedDisplay;
          }
          [(PSPointerSystemClientController *)self->_systemClientController invalidateScenesForPointerForDisplayConfiguration:v12];
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v7);
  }
}

- (CGAffineTransform)rootWindowTransformForEmbeddedDisplay
{
  long long v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springBoardScenesToPointerAssertions, 0);
  objc_storeStrong((id *)&self->_suppressEventsAssertion, 0);
  objc_storeStrong((id *)&self->_serviceKeepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_mousePointerDeviceObserverToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_systemClientController, 0);
  objc_storeStrong((id *)&self->_mousePointerService, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
}

@end