@interface SBMultiDisplayUserInteractionCoordinator
- (NSHashTable)activeWindowSceneObservers;
- (NSHashTable)pointerInteractionObservers;
- (NSMapTable)sceneToEventSniffers;
- (SBMultiDisplayUserInteractionCoordinator)init;
- (SBMultiDisplayUserInteractionCoordinatorDelegate)delegate;
- (SBWindowScene)activePointerWindowScene;
- (SBWindowScene)activeTouchDownOriginatedWindowScene;
- (SBWindowScene)activeWindowScene;
- (id)_windowSceneForEvent:(id)a3;
- (void)_handleActiveDisplayQualifyingEventInWindowScene:(id)a3 source:(id)a4;
- (void)addActiveDisplayWindowSceneObserver:(id)a3;
- (void)addPointerInteractionObserver:(id)a3;
- (void)eventSnifferHandledPointerInteractionQualifyingEvent:(id)a3;
- (void)eventSnifferHandledPointerTouchDown:(id)a3;
- (void)eventSnifferHandledPointerTouchUp:(id)a3;
- (void)eventSnifferHandledQualifyingContinuityTouch:(id)a3;
- (void)eventSnifferHandledQualifyingScroll:(id)a3;
- (void)eventSnifferHandledTouchInteractionQualifyingEvent:(id)a3;
- (void)handleSendEvent:(id)a3;
- (void)removeActiveDisplayWindowSceneObserver:(id)a3;
- (void)removePointerInteractionObserver:(id)a3;
- (void)setActiveWindowSceneObservers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPointerInteractionObservers:(id)a3;
- (void)setSceneToEventSniffers:(id)a3;
- (void)updateActiveWindowScene:(id)a3 forUserInteraction:(id)a4;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBMultiDisplayUserInteractionCoordinator

- (SBWindowScene)activeWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDisplayWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)handleSendEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBMultiDisplayUserInteractionCoordinator *)self _windowSceneForEvent:v4];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = -[NSMapTable objectForKey:](self->_sceneToEventSniffers, "objectForKey:", v5, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) handleEvent:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)eventSnifferHandledTouchInteractionQualifyingEvent:(id)a3
{
  id v4 = [a3 windowScene];
  if (v4)
  {
    v5 = v4;
    [(SBMultiDisplayUserInteractionCoordinator *)self _handleActiveDisplayQualifyingEventInWindowScene:v4 source:@"touch"];
    id v4 = v5;
  }
}

- (id)_windowSceneForEvent:(id)a3
{
  [a3 _hidEvent];
  id v4 = BKSHIDEventGetBaseAttributes();
  uint64_t v5 = [v4 contextID];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F43058] _windowWithContextId:v5];
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = [v6 _fbsDisplayIdentity];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v9 = [WeakRetained windowSceneForDisplayIdentity:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_handleActiveDisplayQualifyingEventInWindowScene:(id)a3 source:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDisplayWindowScene);
  if (v6)
  {
    objc_storeWeak((id *)&self->_activeDisplayWindowScene, v6);
    if (!WeakRetained || WeakRetained != v6)
    {
      uint64_t v9 = SBLogActiveDisplay();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = SBStringForActiveDisplayTrackingMethodology(1);
        long long v11 = [WeakRetained _sceneIdentifier];
        long long v12 = [v6 _sceneIdentifier];
        *(_DWORD *)buf = 138544130;
        v24 = v10;
        __int16 v25 = 2114;
        v26 = v11;
        __int16 v27 = 2114;
        v28 = v12;
        __int16 v29 = 2114;
        id v30 = v7;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating active display from: %{public}@ to %{public}@ source: %{public}@", buf, 0x2Au);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v13 = self->_activeWindowSceneObservers;
      uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "multiDisplayUserInteractionCoordinator:updatedActiveWindowScene:", self, v6, (void)v18);
          }
          while (v15 != v17);
          uint64_t v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v15);
      }
    }
  }
}

- (SBMultiDisplayUserInteractionCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBMultiDisplayUserInteractionCoordinator;
  v2 = [(SBMultiDisplayUserInteractionCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    sceneToEventSniffers = v2->_sceneToEventSniffers;
    v2->_sceneToEventSniffers = (NSMapTable *)v3;
  }
  return v2;
}

- (SBWindowScene)activePointerWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePointerWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)addPointerInteractionObserver:(id)a3
{
  id v4 = a3;
  pointerInteractionObservers = self->_pointerInteractionObservers;
  id v8 = v4;
  if (!pointerInteractionObservers)
  {
    objc_super v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_pointerInteractionObservers;
    self->_pointerInteractionObservers = v6;

    id v4 = v8;
    pointerInteractionObservers = self->_pointerInteractionObservers;
  }
  [(NSHashTable *)pointerInteractionObservers addObject:v4];
}

- (void)removePointerInteractionObserver:(id)a3
{
}

- (void)updateActiveWindowScene:(id)a3 forUserInteraction:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBMultiDisplayUserInteractionCoordinator.m", 146, @"Invalid parameter not satisfying: %@", @"actionDescription" object file lineNumber description];
  }
  [(SBMultiDisplayUserInteractionCoordinator *)self _handleActiveDisplayQualifyingEventInWindowScene:v9 source:v7];
}

- (void)addActiveDisplayWindowSceneObserver:(id)a3
{
  id v4 = a3;
  activeWindowSceneObservers = self->_activeWindowSceneObservers;
  id v8 = v4;
  if (!activeWindowSceneObservers)
  {
    objc_super v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_activeWindowSceneObservers;
    self->_activeWindowSceneObservers = v6;

    id v4 = v8;
    activeWindowSceneObservers = self->_activeWindowSceneObservers;
  }
  [(NSHashTable *)activeWindowSceneObservers addObject:v4];
}

- (void)removeActiveDisplayWindowSceneObserver:(id)a3
{
  [(NSHashTable *)self->_activeWindowSceneObservers removeObject:a3];
  if (![(NSHashTable *)self->_activeWindowSceneObservers count])
  {
    activeWindowSceneObservers = self->_activeWindowSceneObservers;
    self->_activeWindowSceneObservers = 0;
  }
}

- (void)windowSceneDidConnect:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = (_SBScrollEventSniffer *)a3;
  if ([(_SBScrollEventSniffer *)v4 isContinuityDisplayWindowScene])
  {
    uint64_t v5 = objc_alloc_init(_SBScrollEventSniffer);
    [(_SBScrollEventSniffer *)v5 setDelegate:self];
    [(_SBScrollEventSniffer *)v5 setWindowScene:v4];
    objc_super v6 = objc_alloc_init(_SBContinuityTouchEventSniffer);
    [(_SBContinuityTouchEventSniffer *)v6 setDelegate:self];
    [(_SBContinuityTouchEventSniffer *)v6 setWindowScene:v4];
    sceneToEventSniffers = self->_sceneToEventSniffers;
    v13[0] = v5;
    v13[1] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    [(NSMapTable *)sceneToEventSniffers setObject:v8 forKey:v4];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(_SBPointerTouchDownEventSniffer);
    [(_SBScrollEventSniffer *)v5 setDelegate:self];
    [(_SBScrollEventSniffer *)v5 setWindowScene:v4];
    objc_super v6 = objc_alloc_init(_SBTouchInteractionEventSniffer);
    [(_SBContinuityTouchEventSniffer *)v6 setDelegate:self];
    [(_SBContinuityTouchEventSniffer *)v6 setWindowScene:v4];
    id v8 = objc_alloc_init(_SBPointerInteractionEventSniffer);
    [(_SBPointerInteractionEventSniffer *)v8 setDelegate:self];
    [(_SBPointerInteractionEventSniffer *)v8 setWindowScene:v4];
    id v9 = objc_alloc_init(_SBScrollEventSniffer);
    [(_SBScrollEventSniffer *)v9 setDelegate:self];
    [(_SBScrollEventSniffer *)v9 setWindowScene:v4];
    uint64_t v10 = self->_sceneToEventSniffers;
    v12[0] = v5;
    v12[1] = v6;
    v12[2] = v8;
    v12[3] = v9;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
    [(NSMapTable *)v10 setObject:v11 forKey:v4];

    id v4 = v9;
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMapTable *)self->_sceneToEventSniffers removeObjectForKey:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
  objc_super v6 = WeakRetained;
  if (WeakRetained && WeakRetained == v4)
  {
    id v7 = SBLogPointer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 _sceneIdentifier];
      int v12 = 138543362;
      long long v13 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Clearing pointer touch down window scene: %{public}@ - scene disconnected", (uint8_t *)&v12, 0xCu);
    }
    objc_storeWeak((id *)&self->_activeTouchDownOriginatedWindowScene, 0);
  }
  id v9 = objc_loadWeakRetained((id *)&self->_activeDisplayWindowScene);

  if (v9 == v4) {
    objc_storeWeak((id *)&self->_activeDisplayWindowScene, 0);
  }
  p_activePointerWindowScene = &self->_activePointerWindowScene;
  id v11 = objc_loadWeakRetained((id *)p_activePointerWindowScene);

  if (v11 == v4) {
    objc_storeWeak((id *)p_activePointerWindowScene, 0);
  }
}

- (void)eventSnifferHandledPointerTouchDown:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 windowScene];
  if (v4)
  {
    p_activeTouchDownOriginatedWindowScene = &self->_activeTouchDownOriginatedWindowScene;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
    id v7 = SBLogPointer();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v8)
      {
        id v9 = [WeakRetained _sceneIdentifier];
        int v11 = 138543362;
        int v12 = v9;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Pointer touch down window scene: %{public}@ but we're already tracking it down in scene", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        uint64_t v10 = [v4 _sceneIdentifier];
        int v11 = 138543362;
        int v12 = v10;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting pointer touch down window scene: %{public}@", (uint8_t *)&v11, 0xCu);
      }
      objc_storeWeak((id *)p_activeTouchDownOriginatedWindowScene, v4);
    }
  }
}

- (void)eventSnifferHandledPointerTouchUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_activeTouchDownOriginatedWindowScene = &self->_activeTouchDownOriginatedWindowScene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
  if (WeakRetained)
  {
    uint64_t v5 = SBLogPointer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = [WeakRetained _sceneIdentifier];
      int v7 = 138543362;
      BOOL v8 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Clearing pointer touch down window scene: %{public}@ - touch up", (uint8_t *)&v7, 0xCu);
    }
    objc_storeWeak((id *)p_activeTouchDownOriginatedWindowScene, 0);
  }
}

- (void)eventSnifferHandledPointerInteractionQualifyingEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePointerWindowScene);
  id v6 = [v4 windowScene];
  if (v6)
  {
    objc_storeWeak((id *)&self->_activePointerWindowScene, v6);
    if (WeakRetained != v6)
    {
      int v7 = SBLogActiveDisplay();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = SBStringForActiveDisplayTrackingMethodology(1);
        uint64_t v9 = [WeakRetained _sceneIdentifier];
        uint64_t v10 = [v6 _sceneIdentifier];
        *(_DWORD *)buf = 138543874;
        v22 = v8;
        __int16 v23 = 2114;
        v24 = v9;
        __int16 v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating active pointer display from: %{public}@ to %{public}@", buf, 0x20u);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      int v11 = (void *)[(NSHashTable *)self->_pointerInteractionObservers copy];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * v15++) pointerDidMoveToFromWindowScene:WeakRetained toWindowScene:v6];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
  [(SBMultiDisplayUserInteractionCoordinator *)self _handleActiveDisplayQualifyingEventInWindowScene:v6 source:@"pointer"];
}

- (void)eventSnifferHandledQualifyingScroll:(id)a3
{
  id v4 = [a3 windowScene];
  if (v4)
  {
    uint64_t v5 = v4;
    [(SBMultiDisplayUserInteractionCoordinator *)self _handleActiveDisplayQualifyingEventInWindowScene:v4 source:@"scroll"];
    id v4 = v5;
  }
}

- (void)eventSnifferHandledQualifyingContinuityTouch:(id)a3
{
  id v4 = [a3 windowScene];
  if (v4)
  {
    uint64_t v5 = v4;
    [(SBMultiDisplayUserInteractionCoordinator *)self _handleActiveDisplayQualifyingEventInWindowScene:v4 source:@"continuity touch"];
    id v4 = v5;
  }
}

- (SBMultiDisplayUserInteractionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBMultiDisplayUserInteractionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowScene)activeTouchDownOriginatedWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTouchDownOriginatedWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (NSMapTable)sceneToEventSniffers
{
  return self->_sceneToEventSniffers;
}

- (void)setSceneToEventSniffers:(id)a3
{
}

- (NSHashTable)activeWindowSceneObservers
{
  return self->_activeWindowSceneObservers;
}

- (void)setActiveWindowSceneObservers:(id)a3
{
}

- (NSHashTable)pointerInteractionObservers
{
  return self->_pointerInteractionObservers;
}

- (void)setPointerInteractionObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteractionObservers, 0);
  objc_storeStrong((id *)&self->_activeWindowSceneObservers, 0);
  objc_storeStrong((id *)&self->_sceneToEventSniffers, 0);
  objc_destroyWeak((id *)&self->_activeTouchDownOriginatedWindowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activePointerWindowScene);
  objc_destroyWeak((id *)&self->_activeDisplayWindowScene);
}

@end